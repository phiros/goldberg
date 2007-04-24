# GoldbergFilters
require 'goldberg/system_settings'
require 'goldberg/credentials'
require 'goldberg/menu'
require 'goldberg/user'
require 'goldberg/content_page'

module GoldbergFilters

  ERROR_SELF_REG_CONFIRMATION_REQUIRED =
    [1, "Your registration has not yet been confirmed."]
  ERROR_SESSION_EXPIRED =
    [2, "Your session has expired.  Please log in again."]
  ERROR_NOT_FOUND =
    [3, "The page or resource you requested was not found."]
  ERROR_PERMISSION_DENIED =
    [4, "You do not have permission to access that page or resource."]
  
  def goldberg_security_up
    if Goldberg.settings
      Goldberg.clear!
      Goldberg::AuthController.set_user(session)

      # Perform some preliminary checks for logged-in users.
      # if Goldberg.credentials.role_id != Goldberg.settings.public_role_id
      if Goldberg.user
        # If self-registration is active, check that the user is not
        # pending confirmation.  Otherwise they are kicked out.
        if Goldberg.settings.self_reg_enabled and
            Goldberg.user.self_reg_confirmation_required 
          logger.info "User not confirmed"
          Goldberg::AuthController.logout(session)
          respond_to do |format|
            format.html do
              redirect_to Goldberg.settings.self_reg_confirmation_error_page.url
            end
            format.js do
              render :status => 400, :text =>
                Goldberg.settings.self_reg_confirmation_error_page.content_html
            end
            format.xml do
              render :status => 400, :xml =>
                error_xml(*ERROR_SELF_REG_CONFIRMATION_REQUIRED)
            end
          end
          return false
        end

        # If the user's session has expired, kick out the user.
        if Goldberg.settings.session_timeout > 0 and session[:last_time]
          if (Time.now - session[:last_time]) > Goldberg.settings.session_timeout
            logger.info "Session: time expired"
            Goldberg::AuthController.logout(session)
            respond_to do |format|
              format.html do
                redirect_to Goldberg.settings.session_expired_page.url
              end
              format.js do
                render :status => 400, :text =>
                  Goldberg.settings.session_expired_page.content_html
              end
              format.xml do
                render :status => 400, :xml =>
                  error_xml(*ERROR_SESSION_EXPIRED)
              end
            end
            return false
          else
            logger.info "Session: time NOT expired"
          end
        end
      end
      
      # If this is a page request check that it exists, and if not
      # redirect to the "unknown" page
      is_page_request = false
      if params[:controller] == 'goldberg/content_pages' and
          params[:action] == 'view'
        is_page_request = true
        if not Goldberg.credentials.pages.has_key?(params[:page_name].to_s)
          logger.warn "(Unknown page? #{params[:page_name].to_s})"
          respond_to do |format|
            format.html do
              redirect_to Goldberg.settings.not_found_page.url
            end
            format.js do
              render :status => 404, :text => Goldberg.settings.not_found_page.content_html
            end
            format.xml  do
              render :status => 404, :xml => error_xml(*ERROR_NOT_FOUND)
            end
          end
          return false
        end
      end
      
      # PERMISSIONS
      # Check whether the user is authorised for this page or action.
      if is_page_request
        authorised = Goldberg.credentials.page_authorised?(params[:page_name].to_s)
      else
        authorised = Goldberg.credentials.action_authorised?(params[:controller],
                                                              params[:action])
      end
      if not authorised
        respond_to do |format|
          format.html do
            if Goldberg.user
              redirect_to Goldberg.settings.permission_denied_page.url
            else
              session[:pending_request] = params
              redirect_to :controller => 'goldberg/auth', :action => 'login'
            end
          end
          format.js do
            render :status => 400, :text => Goldberg.settings.permission_denied_page.content_html
          end
          format.xml  do
            render :status => 400, :xml => error_xml(*ERROR_PERMISSION_DENIED)
          end
        end
        return false
      end
    end  # if Goldberg.settings
    
    session[:last_time] = Time.now
    
    return true
  end


  protected

  def error_xml(code, message)
    target = ''
    xml = Builder::XmlMarkup.new(:target => target)
    xml.instruct!
    xml.error do
      xml.code(code)
      xml.message(message)
      Goldberg.user ? xml.user_id(Goldberg.user.id) : xml.user_id
      xml.params(params.inspect)
    end
    return target
  end
  
end


ActionController::Base.class_eval do
  include GoldbergFilters
  prepend_before_filter :goldberg_security_up
end
