class Page::AuthController < ActionController::Base
  uses_component_template_root

  def login_logout
    if session[:user]
      render :partial => 'logout'
    else
      render :partial => 'login'
    end
  end

end
