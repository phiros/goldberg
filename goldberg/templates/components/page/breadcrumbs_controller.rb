class Page::BreadcrumbsController < ActionController::Base
  uses_component_template_root

  
  def breadcrumbs
    render :partial => 'breadcrumbs', :locals => {
      :crumbs => session[:menu].crumbs }
  end

end

