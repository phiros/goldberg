ActionController::Routing::Routes.draw do |map|
  # Add your own custom routes here.
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Here's a sample route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"
  map.connect '', :controller => "content_pages", :action => "view_default"
  # map.connect '', :controller => 'roles', :action => 'list'

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Normal controller/action route.
  map.connect ':controller/:action/:id'

  # Menu mapping
  map.connect 'menu/*name', :controller => 'menu_items', :action => 'link'

  # Requests that don't map to a controller should map to a page.
  map.connect '*page_name', :controller => "content_pages", :action => "view"
  
end
