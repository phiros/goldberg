class GoldbergGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|
      # === CONTROLLERS ===

      # (Obsolete: filters now in a plugin)
      # m.file "app/controllers/application.rb", 
      # "app/controllers/application.rb"

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

      # === MODELS ===
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

      # === VIEWS ===
      m.directory "app/views/auth"
      m.file "app/views/auth/forgotten.rhtml", 
      "app/views/auth/forgotten.rhtml" 
      m.file "app/views/auth/_form.rhtml", "app/views/auth/_form.rhtml"
      m.file "app/views/auth/login.rhtml", "app/views/auth/login.rhtml"
      m.file "app/views/auth/logout.rhtml", "app/views/auth/logout.rhtml"
      m.file "app/views/auth/_login.rhtml", "app/views/auth/_login.rhtml"

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
      m.file "app/views/layouts/_tabpanel_js.rhtml",
      "app/views/layouts/_tabpanel_js.rhtml"
      m.file "app/views/layouts/_tabpanel_list.rhtml",
      "app/views/layouts/_tabpanel_list.rhtml"
      
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
      m.file "app/views/menu_items/_suckerfish.rhtml", 
      "app/views/menu_items/_suckerfish.rhtml"
      m.file "app/views/menu_items/_breadcrumbs.rhtml",
      "app/views/menu_items/_breadcrumbs.rhtml"
      m.file "app/views/menu_items/_menubar.rhtml",
      "app/views/menu_items/_menubar.rhtml"

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

      # === COMPONENTS ===
#       m.directory "components/page"
      
#       m.file "components/page/auth_controller.rb", 
#       "components/page/auth_controller.rb"
#       m.directory "components/page/auth"
#       m.file "components/page/auth/_login.rhtml", 
#       "components/page/auth/_login.rhtml"
#       m.file "components/page/auth/_logout.rhtml", 
#       "components/page/auth/_logout.rhtml"

#       m.file "components/page/breadcrumbs_controller.rb",
#       "components/page/breadcrumbs_controller.rb"
#       m.directory "components/page/breadcrumbs"
#       m.file "components/page/breadcrumbs/_breadcrumbs.rhtml",
#       "components/page/breadcrumbs/_breadcrumbs.rhtml"
      
#       m.file "components/page/menubar_controller.rb", 
#       "components/page/menubar_controller.rb"
#       m.directory "components/page/menubar"
#       m.file "components/page/menubar/_menubar.rhtml", 
#       "components/page/menubar/_menubar.rhtml"
#       m.file "components/page/menubar/_suckerfish.rhtml",
#       "components/page/menubar/_suckerfish.rhtml"

      # === DATABASE ===
      m.file "db/goldberg_backup_mysql.sh",  "db/goldberg_backup_mysql.sh"
      m.file "db/goldberg_restore_mysql.sh", "db/goldberg_restore_mysql.sh"
      m.file "db/goldberg_db_mysql.sql",     "db/goldberg_db_mysql.sql"
      m.file "db/goldberg_db_postgresql.sql","db/goldberg_db_postgresql.sql" 

      m.directory "db/migrate"
      m.file "db/migrate/001_initial_setup.rb", 
      "db/migrate/001_initial_setup.rb"
      m.file "db/migrate/002_menu_rest_items_users_cached_content_pages.rb",
      "db/migrate/002_menu_rest_items_users_cached_content_pages.rb"

      m.file "db/ContentPage.yml",      "db/ContentPage.yml"
      m.file "db/ControllerAction.yml", "db/ControllerAction.yml"
      m.file "db/MarkupStyle.yml",      "db/MarkupStyle.yml"
      m.file "db/MenuItem.yml",         "db/MenuItem.yml"
      m.file "db/Permission.yml",       "db/Permission.yml"
      m.file "db/Role.yml",             "db/Role.yml"
      m.file "db/RolesPermission.yml",  "db/RolesPermission.yml"
      m.file "db/SiteController.yml",   "db/SiteController.yml"
      m.file "db/SystemSettings.yml",   "db/SystemSettings.yml"
      m.file "db/User.yml",             "db/User.yml"

      # === LIB ===
      m.directory "lib/tasks"
      m.file "lib/tasks/goldberg.rake", "lib/tasks/goldberg.rake"

      # === CONFIG ===
      # (Obsolete: routes now in a plugin)
      # m.file "config/routes.rb",        "config/routes.rb"

      # === PUBLIC ===
      m.file "public/stylesheets/goldberg.css", 
      "public/stylesheets/goldberg.css"
      # m.file "public/stylesheets/suckerfish.css",
      # "public/stylesheets/suckerfish.css"

      m.file "public/javascripts/suckerfish.js",
      "public/javascripts/suckerfish.js"
      
      m.file "public/images/action.png",     "public/images/action.png"
      m.file "public/images/add.png",        "public/images/add.png"
      m.file "public/images/delete.png",     "public/images/delete.png"
      m.file "public/images/down.png",       "public/images/down.png"
      m.file "public/images/page.png",       "public/images/page.png"
      m.file "public/images/permission.png", "public/images/permission.png"
      m.file "public/images/role.png",       "public/images/role.png"
      m.file "public/images/up.png",         "public/images/up.png"

      # === TEMPLATES ===
      # EARTH WIND AND FIRE
      if name == 'ewnf'
        m.file "layouts/ewnf/app/views/layouts/application.rhtml",
        "app/views/layouts/application.rhtml"

        m.file "layouts/ewnf/public/images/bg.gif", 
        "public/images/bg.gif"
        m.file "layouts/ewnf/public/images/sample.jpg", 
        "public/images/sample.jpg"
        m.file "layouts/ewnf/public/images/title_img.jpg", 
        "public/images/title_img.jpg"
        m.file "layouts/ewnf/public/images/daddy_rightarrow.gif", 
        "public/images/daddy_rightarrow.gif"

        m.file "layouts/ewnf/public/stylesheets/layout.css",
        "public/stylesheets/layout.css"

      # SPOILED BRAT
      elsif name == 'spoiled_brat'
        m.file "layouts/spoiled_brat/app/views/layouts/application.rhtml",
        "app/views/layouts/application.rhtml"

        m.file "layouts/spoiled_brat/public/images/blockquote-bg.gif", 
        "public/images/blockquote-bg.gif"
        m.file "layouts/spoiled_brat/public/images/body-bg.jpg", 
        "public/images/body-bg.jpg"
        m.file "layouts/spoiled_brat/public/images/centerColumn-bg.jpg", 
        "public/images/centerColumn-bg.jpg"
        m.file "layouts/spoiled_brat/public/images/h2-bg.gif", 
        "public/images/h2-bg.gif"
        m.file "layouts/spoiled_brat/public/images/h3-bg.gif", 
        "public/images/h3-bg.gif"
        m.file "layouts/spoiled_brat/public/images/header-bg.jpg", 
        "public/images/header-bg.jpg"
        m.file "layouts/spoiled_brat/public/images/hr-bg.jpg", 
        "public/images/hr-bg.jpg"
        m.file "layouts/spoiled_brat/public/images/logo.jpg", 
        "public/images/logo.jpg"
        m.file "layouts/spoiled_brat/public/images/daddy_leftarrow.gif", 
        "public/images/daddy_leftarrow.gif"

        m.file "layouts/spoiled_brat/public/stylesheets/layout.css",
        "public/stylesheets/layout.css"

      elsif name == 'snooker'
        m.file "layouts/snooker/app/views/layouts/application.rhtml",
        "app/views/layouts/application.rhtml"

        m.file "layouts/snooker/public/images/column_200.png", 
        "public/images/column_200.png"
        m.file "layouts/snooker/public/images/footer_bg.png", 
        "public/images/footer_bg.png"
        m.file "layouts/snooker/public/images/logo.jpg", 
        "public/images/logo.jpg"
        m.file "layouts/snooker/public/images/daddy_rightarrow.gif", 
        "public/images/daddy_rightarrow.gif"

        m.file "layouts/snooker/public/stylesheets/layout.css",
        "public/stylesheets/layout.css"

      # GOLDBERG CLASSIC BLUE (the default)
      else
        m.file "app/views/layouts/application.rhtml",
        "app/views/layouts/application.rhtml"

        m.file "public/images/bodybg.jpg",     "public/images/bodybg.jpg"
        m.file "public/images/footerbg.jpg",   "public/images/footerbg.jpg"
        m.file "public/images/logo_right.jpg", "public/images/logo_right.jpg"
        m.file "public/images/menuhover.jpg",  "public/images/menuhover.jpg"

        m.file "public/stylesheets/layout.css",   
        "public/stylesheets/layout.css"

      end


      # === GOLDBERG PLUGINS ===
      m.directory 'vendor/'
      m.directory 'vendor/plugins/'

      # ROUTES PLUGIN
      m.directory 'vendor/plugins/goldberg_routes/'
      
      m.directory 'vendor/plugins/goldberg_routes/lib/'
      m.template 'vendor/plugins/goldberg_routes/lib/goldberg_routes.rb', 
      'vendor/plugins/goldberg_routes/lib/goldberg_routes.rb'
      
      m.directory 'vendor/plugins/goldberg_routes/tasks/'
      m.template 'vendor/plugins/goldberg_routes/tasks/goldberg_routes_tasks.rake', 
      'vendor/plugins/goldberg_routes/tasks/goldberg_routes_tasks.rake'
      
      m.directory 'vendor/plugins/goldberg_routes/test/'
      m.template 'vendor/plugins/goldberg_routes/test/goldberg_routes_test.rb', 'vendor/plugins/goldberg_routes/test/goldberg_routes_test.rb'
      m.template 'vendor/plugins/goldberg_routes/README', 
      'vendor/plugins/goldberg_routes/README'
      m.template 'vendor/plugins/goldberg_routes/Rakefile', 
      'vendor/plugins/goldberg_routes/Rakefile'
      m.template 'vendor/plugins/goldberg_routes/init.rb', 
      'vendor/plugins/goldberg_routes/init.rb'
      m.template 'vendor/plugins/goldberg_routes/install.rb', 
      'vendor/plugins/goldberg_routes/install.rb'
      
      # FILTERS PLUGIN
      m.directory 'vendor/plugins/goldberg_filters/'
      
      m.directory 'vendor/plugins/goldberg_filters/lib/'
      m.template 'vendor/plugins/goldberg_filters/lib/goldberg_filters.rb', 
      'vendor/plugins/goldberg_filters/lib/goldberg_filters.rb'
      
      m.directory 'vendor/plugins/goldberg_filters/tasks/'
      m.template 'vendor/plugins/goldberg_filters/tasks/goldberg_filters_tasks.rake', 'vendor/plugins/goldberg_filters/tasks/goldberg_filters_tasks.rake'
      
      m.directory 'vendor/plugins/goldberg_filters/test/'
      m.template 'vendor/plugins/goldberg_filters/test/goldberg_filters_test.rb', 
      'vendor/plugins/goldberg_filters/test/goldberg_filters_test.rb'
      m.template 'vendor/plugins/goldberg_filters/README', 
      'vendor/plugins/goldberg_filters/README'
      m.template 'vendor/plugins/goldberg_filters/Rakefile', 
      'vendor/plugins/goldberg_filters/Rakefile'
      m.template 'vendor/plugins/goldberg_filters/init.rb', 
      'vendor/plugins/goldberg_filters/init.rb'
      m.template 'vendor/plugins/goldberg_filters/install.rb', 
      'vendor/plugins/goldberg_filters/install.rb'

      # === TESTS ===
      m.directory 'test/'
      m.directory 'test/unit'
      m.directory 'test/fixtures'
      
      m.template 'test/unit/content_page_test.rb', 'test/unit/content_page_test.rb'
      m.template 'test/unit/system_settings_test.rb', 'test/unit/system_settings_test.rb'
      
      m.template 'test/fixtures/content_pages.yml', 'test/fixtures/content_pages.yml'
      m.template 'test/fixtures/permissions.yml', 'test/fixtures/permissions.yml'
      m.template 'test/fixtures/markup_styles.yml', 'test/fixtures/markup_styles.yml'
      m.template 'test/fixtures/roles.yml', 'test/fixtures/roles.yml'

      # Show message
      m.file "README_GOLDBERG", "README_GOLDBERG"
      m.readme "README_GOLDBERG"
      

    end

  end  # manifest

end  # class
