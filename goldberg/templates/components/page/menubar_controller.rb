class Page::MenubarController < ActionController::Base
  uses_component_template_root
  attr_accessor :counter


  # Render just the top level of the menu.
  def top_menu
    @settings = SystemSettings.find(:first)
    render :partial => 'menubar', :locals => {:level => 0,
      :depth => 0, :class_attr => nil}
  end
  

  # Render the menus except for the top menu.
  def side_menu
    @settings = SystemSettings.find(:first)
    render :partial => 'menubar', :locals => {:level => 1,
      :depth => (@settings.menu_depth - 2), :class_attr => 'sidemenu'}
  end

  
  # Render *all* levels of the menu.
  def full_menu
    @settings = SystemSettings.find(:first)
    render :partial => 'menubar', :locals => {:level => 0,
      :depth => (@settings.menu_depth - 1), :class_attr => 'sidemenu'}
  end

end
