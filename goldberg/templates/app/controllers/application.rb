require "role"


class ApplicationController < ActionController::Base
  model :permission
  model :menu
  model :menu_item

  before_filter :authorise

  
  def authorise
    @settings = SystemSettings.find(:first)

    if @settings
      make_public = false  # Going to check if we need to

      # If there's already a session, check that it's still up to date
      if session[:credentials]
        role = Role.find_by_sql(["select updated_at from roles where id = ?",
                                 session[:credentials].role.id])
        if role
          # Check if the role has been updated
          if role[0].updated_at > session[:credentials].role.updated_at
            role = Role.find(session[:credentials].role.id)
            menu_selection = session[:menu].selected  # remember this
            session[:credentials] = role.cache[:credentials]
            session[:menu] = role.cache[:menu]
            if menu_selection
              session[:menu].select(menu_selection)
            end
          else
            # Role is still current: no action required here
            logger.info "(Role still current)"
          end
        else  # No such Role: must have been deleted?
          make_public = true
        end
      else  # No credentials
        make_public = true
      end

      if make_public
        public_role = @settings.public_role
        if public_role.cache and public_role.cache[:credentials] and 
            public_role.cache[:menu]
          session[:credentials] = public_role.cache[:credentials]
          session[:menu] = public_role.cache[:menu]
        else
          Role.rebuild_cache
        end
      end
      
      if session[:credentials].role.id != @settings.public_role_id
        logger.info "(Logged-in user)"
        if session[:last_time] != nil
          if (Time.now - session[:last_time]) > @settings.session_timeout
            logger.info "Session: time expired"
            AuthController.logout(session)
            redirect_to @settings.session_expired_page.url
            return
          else
            logger.info "Session: time NOT expired"
          end
        end
      end
      
      # PERMISSIONS
      # If this is a page request, check the page permissions
      authorised = false  # default
      check_controller = false
      if params[:controller] == 'content_pages' and
          params[:action] == 'view'
        if session[:credentials].pages.has_key?(params[:page_name].to_s)
          if session[:credentials].pages[params[:page_name].to_s] == true
            logger.info "Page: authorised"
            authorised = true
          else
            logger.info "Page: NOT authorised"
          end
        else
          logger.warn "(Unknown page? #{params[:page_name].to_s})"
        end
      else
        # Check if there's a specific permission for an action
        if session[:credentials].actions.has_key?(params[:controller])
          if session[:credentials].actions[params[:controller]].has_key?(params[:action])
            if session[:credentials].actions[params[:controller]][params[:action]]
              logger.info "Action: authorised"
              authorised = true
            else
              logger.info "Action: NOT authorised"
            end
          else
            check_controller = true
          end
        else
          check_controller = true
        end
        
        # Check if there's a general permission for a controller
        if check_controller
          if session[:credentials].controllers.has_key?(params[:controller])
            if session[:credentials].controllers[params[:controller]]
              logger.info "Controller: authorised"
              authorised = true
            else
              logger.info "Controller: NOT authorised"
            end
          else
          end
        end
      end  # Check permissions

      logger.info "Authorised? #{authorised.to_s}"
      if not authorised
        redirect_to @settings.permission_denied_page.url
      end
    end  # if settings
    
    session[:last_time] = Time.now
    
  end

end
