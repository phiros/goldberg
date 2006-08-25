class GoldbergGenerator < Rails::Generator::Base

  def manifest
    record do |m|
      #CONTROLLERS
      m.file "app/controllers/application.rb", 
      "app/controllers/application.rb"

      m.file "app/controllers/auth_controller.rb", 
      "app/controllers/auth_controller.rb"

      m.file "app/controllers/content_pages_controller.rb", 
      "app/controllers/content_pages_controller.rb"

      m.file "app/controllers/controller_actions_controller.rb", 
      "app/controllers/controller_actions_controller.rb"

      m.file "app/controllers/markup_styles_controller.rb", 
      "app/controllers/markup_styles_controller.rb"

      m.file "app/controllers/menu_items_controller.rb", 
      "app/controllers/menu_items_controller.rb"

      m.file "app/controllers/permissions_controller.rb", 
      "app/controllers/permissions_controller.rb"

      m.file "app/controllers/roles_controller.rb", 
      "app/controllers/roles_controller.rb"

      m.file "app/controllers/roles_permissions_controller.rb", 
      "app/controllers/roles_permissions_controller.rb"

      m.file "app/controllers/site_controllers_controller.rb", 
      "app/controllers/site_controllers_controller.rb"

      m.file "app/controllers/system_settings_controller.rb", 
      "app/controllers/system_settings_controller.rb"

      m.file "app/controllers/users_controller.rb", 
      "app/controllers/users_controller.rb"

      # MODELS
      m.file "app/models/content_page.rb", "app/models/content_page.rb"
      m.file "app/models/controller_action.rb", 
      "app/models/controller_action.rb"
      m.file "app/models/credentials.rb", "app/models/credentials.rb"
      m.file "app/models/login.rb", "app/models/login.rb"
      m.file "app/models/markup_style.rb", "app/models/markup_style.rb"
      m.file "app/models/menu_item.rb", "app/models/menu_item.rb"
      m.file "app/models/menu.rb", "app/models/menu.rb"
      m.file "app/models/permission.rb", "app/models/permission.rb"
      m.file "app/models/role.rb", "app/models/role.rb"
      m.file "app/models/roles_permission.rb", "app/models/roles_permission.rb"
      m.file "app/models/site_controller.rb", "app/models/site_controller.rb"
      m.file "app/models/system_settings.rb", "app/models/system_settings.rb"
      m.file "app/models/user.rb", "app/models/user.rb"

      # VIEWS
      m.directory "app/views/auth"
      m.file "app/views/auth/forgotten.rhtml", 
      "app/views/auth/forgotten.rhtml" 
      m.file "app/views/auth/_form.rhtml", "app/views/auth/_form.rhtml"
      m.file "app/views/auth/login.rhtml", "app/views/auth/login.rhtml"
      m.file "app/views/auth/logout.rhtml", "app/views/auth/logout.rhtml"

      m.directory "app/views/content_pages"
      m.file "app/views/content_pages/edit.rhtml", 
      "app/views/content_pages/edit.rhtml"
      m.file "app/views/content_pages/_form.rhtml", 
      "app/views/content_pages/_form.rhtml"
      m.file "app/views/content_pages/list.rhtml", 
      "app/views/content_pages/list.rhtml"
      m.file "app/views/content_pages/new.rhtml", 
      "app/views/content_pages/new.rhtml"
      m.file "app/views/content_pages/show.rhtml", 
      "app/views/content_pages/show.rhtml"
      m.file "app/views/content_pages/view_default.rhtml", 
      "app/views/content_pages/view_default.rhtml"
      m.file "app/views/content_pages/view.rhtml", 
      "app/views/content_pages/view.rhtml"

      m.directory "app/views/controller_actions"
      m.file "app/views/controller_actions/edit.rhtml", 
      "app/views/controller_actions/edit.rhtml"
      m.file "app/views/controller_actions/_form.rhtml", 
      "app/views/controller_actions/_form.rhtml"
      m.file "app/views/controller_actions/list.rhtml", 
      "app/views/controller_actions/list.rhtml"
      m.file "app/views/controller_actions/new.rhtml", 
      "app/views/controller_actions/new.rhtml"
      m.file "app/views/controller_actions/show.rhtml", 
      "app/views/controller_actions/show.rhtml"

      m.directory "app/views/layouts"
      m.file "app/views/layouts/application.rhtml", "app/views/layouts/application.rhtml"
      
      m.directory "app/views/markup_styles"
      m.file "app/views/markup_styles/edit.rhtml", 
      "app/views/markup_styles/edit.rhtml"
      m.file "app/views/markup_styles/_form.rhtml", 
      "app/views/markup_styles/_form.rhtml"
      m.file "app/views/markup_styles/list.rhtml", 
      "app/views/markup_styles/list.rhtml"
      m.file "app/views/markup_styles/new.rhtml", 
      "app/views/markup_styles/new.rhtml"
      m.file "app/views/markup_styles/show.rhtml", 
      "app/views/markup_styles/show.rhtml"
      
      m.directory "app/views/menu_items"
      m.file "app/views/menu_items/edit.rhtml", 
      "app/views/menu_items/edit.rhtml"
      m.file "app/views/menu_items/_form.rhtml", 
      "app/views/menu_items/_form.rhtml"
      m.file "app/views/menu_items/_item_list.rhtml", 
      "app/views/menu_items/_item_list.rhtml"
      m.file "app/views/menu_items/_item_parent_list.rhtml", 
      "app/views/menu_items/_item_parent_list.rhtml"
      m.file "app/views/menu_items/list.rhtml", 
      "app/views/menu_items/list.rhtml"
      m.file "app/views/menu_items/new.rhtml", 
      "app/views/menu_items/new.rhtml"
      m.file "app/views/menu_items/show.rhtml", 
      "app/views/menu_items/show.rhtml"

      m.directory "app/views/permissions"
      m.file "app/views/permissions/edit.rhtml", 
      "app/views/permissions/edit.rhtml"
      m.file "app/views/permissions/_form.rhtml", 
      "app/views/permissions/_form.rhtml"
      m.file "app/views/permissions/list.rhtml", 
      "app/views/permissions/list.rhtml"
      m.file "app/views/permissions/new.rhtml", 
      "app/views/permissions/new.rhtml"
      m.file "app/views/permissions/show.rhtml", 
      "app/views/permissions/show.rhtml"

      m.directory "app/views/roles"
      m.file "app/views/roles/edit.rhtml", 
      "app/views/roles/edit.rhtml"
      m.file "app/views/roles/_form.rhtml", 
      "app/views/roles/_form.rhtml"
      m.file "app/views/roles/list.rhtml", 
      "app/views/roles/list.rhtml"
      m.file "app/views/roles/new.rhtml", 
      "app/views/roles/new.rhtml"
      m.file "app/views/roles/show.rhtml", 
      "app/views/roles/show.rhtml"

      m.directory "app/views/roles_permissions"
      m.file "app/views/roles_permissions/edit.rhtml", 
      "app/views/roles_permissions/edit.rhtml"
      m.file "app/views/roles_permissions/_form.rhtml", 
      "app/views/roles_permissions/_form.rhtml"
      m.file "app/views/roles_permissions/list.rhtml", 
      "app/views/roles_permissions/list.rhtml"
      m.file "app/views/roles_permissions/new_permission_for_role.rhtml", 
      "app/views/roles_permissions/new_permission_for_role.rhtml"
      m.file "app/views/roles_permissions/new.rhtml", 
      "app/views/roles_permissions/new.rhtml"
      m.file "app/views/roles_permissions/show.rhtml", 
      "app/views/roles_permissions/show.rhtml"

      m.directory "app/views/site_controllers"
      m.file "app/views/site_controllers/edit.rhtml", 
      "app/views/site_controllers/edit.rhtml"
      m.file "app/views/site_controllers/_form.rhtml", 
      "app/views/site_controllers/_form.rhtml"
      m.file "app/views/site_controllers/list.rhtml", 
      "app/views/site_controllers/list.rhtml"
      m.file "app/views/site_controllers/_list.rhtml", 
      "app/views/site_controllers/_list.rhtml"
      m.file "app/views/site_controllers/new.rhtml", 
      "app/views/site_controllers/new.rhtml"
      m.file "app/views/site_controllers/show.rhtml", 
      "app/views/site_controllers/show.rhtml"
      
      m.directory "app/views/system_settings"
      m.file "app/views/system_settings/edit.rhtml", 
      "app/views/system_settings/edit.rhtml"
      m.file "app/views/system_settings/_form.rhtml", 
      "app/views/system_settings/_form.rhtml"
      m.file "app/views/system_settings/list.rhtml", 
      "app/views/system_settings/list.rhtml"
      m.file "app/views/system_settings/new.rhtml", 
      "app/views/system_settings/new.rhtml"
      m.file "app/views/system_settings/show.rhtml", 
      "app/views/system_settings/show.rhtml"

      m.directory "app/views/users"
      m.file "app/views/users/edit.rhtml", 
      "app/views/users/edit.rhtml"
      m.file "app/views/users/_form.rhtml", 
      "app/views/users/_form.rhtml"
      m.file "app/views/users/list.rhtml", 
      "app/views/users/list.rhtml"
      m.file "app/views/users/new.rhtml", 
      "app/views/users/new.rhtml"
      m.file "app/views/users/show.rhtml", 
      "app/views/users/show.rhtml"

      # COMPONENTS
      m.directory "components/page"
      
      m.file "components/page/auth_controller.rb", 
      "components/page/auth_controller.rb"
      m.directory "components/page/auth"
      m.file "components/page/auth/_login.rhtml", 
      "components/page/auth/_login.rhtml"
      m.file "components/page/auth/_logout.rhtml", 
      "components/page/auth/_logout.rhtml"
      
      m.file "components/page/menubar_controller.rb", 
      "components/page/menubar_controller.rb"
      m.directory "components/page/menubar"
      m.file "components/page/menubar/_menubar.rhtml", 
      "components/page/menubar/_menubar.rhtml"

      # CONFIG
      m.file "config/environment.rb", "config/environment.rb"
      m.file "config/routes.rb",      "config/routes.rb"

      # PUBLIC
      m.file "public/stylesheets/layout.css",   
      "public/stylesheets/layout.css"
      m.file "public/stylesheets/goldberg.css", 
      "public/stylesheets/goldberg.css"
      
      m.directory "public/images"
      m.file "public/images/action.png",     "public/images/action.png"
      m.file "public/images/add.png",        "public/images/add.png"
      m.file "public/images/bodybg.jpg",     "public/images/bodybg.jpg"
      m.file "public/images/delete.png",     "public/images/delete.png"
      m.file "public/images/down.png",       "public/images/down.png"
      m.file "public/images/footerbg.jpg",   "public/images/footerbg.jpg"
      m.file "public/images/logo_right.jpg", "public/images/logo_right.jpg"
      m.file "public/images/menuhover.jpg",  "public/images/menuhover.jpg"
      m.file "public/images/page.png",       "public/images/page.png"
      m.file "public/images/permission.png", "public/images/permission.png"
      m.file "public/images/role.png",       "public/images/role.png"
      m.file "public/images/up.png",         "public/images/up.png"

      # db/
      m.file "db/goldberg_backup_mysql.sh",  "db/goldberg_backup_mysql.sh"
      m.file "db/goldberg_restore_mysql.sh", "db/goldberg_restore_mysql.sh"
      m.file "db/goldberg_db_mysql.sql",     "db/goldberg_db_mysql.sql"
      m.file "db/goldberg_db_postgresql.sql","db/goldberg_db_postgresql.sql" 
 
      # Show message
      m.file "README_GOLDBERG", "README_GOLDBERG"
      m.readme "README_GOLDBERG"


    end
  end  # manifest

end  # class
    

    
