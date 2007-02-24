class GoldbergGenerator < Rails::Generator::NamedBase

  def manifest
    record do |m|
      # === THE GOLDBERG PLUGIN ===
      @goldberg = "vendor/plugins/goldberg"
      m.directory @goldberg

      m.file "#{@goldberg}/init.rb",
      "#{@goldberg}/init.rb"

      @lib = "#{@goldberg}/lib"
      m.directory @lib

      m.file "#{@lib}/goldberg.rb",
      "#{@lib}/goldberg.rb"
      m.file "#{@lib}/goldberg_controller.rb",
      "#{@lib}/goldberg_controller.rb"
      m.file "#{@lib}/goldberg_filters.rb",
      "#{@lib}/goldberg_filters.rb"
      m.file "#{@lib}/goldberg_migration.rb",
      "#{@lib}/goldberg_migration.rb"
      m.file "#{@lib}/goldberg_model.rb",
      "#{@lib}/goldberg_model.rb"
      m.file "#{@lib}/goldberg_routes.rb",
      "#{@lib}/goldberg_routes.rb"

      @tasks = "#{@goldberg}/tasks"
      m.directory @tasks

      m.file "#{@tasks}/goldberg_tasks.rake",
      "#{@tasks}/goldberg_tasks.rake"


      # === CONTROLLERS ===
      m.directory "#{@goldberg}/app"
      m.directory "#{@goldberg}/app/controllers"
      @controllers = "#{@goldberg}/app/controllers/goldberg"
      m.directory @controllers
      
      m.file "#{@controllers}/auth_controller.rb", 
      "#{@controllers}/auth_controller.rb"

      m.file "#{@controllers}/content_pages_controller.rb", 
      "#{@controllers}/content_pages_controller.rb"

      m.file "#{@controllers}/controller_actions_controller.rb", 
      "#{@controllers}/controller_actions_controller.rb"

      m.file "#{@controllers}/markup_styles_controller.rb", 
      "#{@controllers}/markup_styles_controller.rb"

      m.file "#{@controllers}/menu_items_controller.rb", 
      "#{@controllers}/menu_items_controller.rb"

      m.file "#{@controllers}/permissions_controller.rb", 
      "#{@controllers}/permissions_controller.rb"

      m.file "#{@controllers}/roles_controller.rb", 
      "#{@controllers}/roles_controller.rb"

      m.file "#{@controllers}/roles_permissions_controller.rb", 
      "#{@controllers}/roles_permissions_controller.rb"

      m.file "#{@controllers}/site_controllers_controller.rb", 
      "#{@controllers}/site_controllers_controller.rb"

      m.file "#{@controllers}/system_settings_controller.rb", 
      "#{@controllers}/system_settings_controller.rb"

      m.file "#{@controllers}/users_controller.rb", 
      "#{@controllers}/users_controller.rb"


      # === MODELS ===
      m.directory "#{@goldberg}/app"
      m.directory "#{@goldberg}/app/models"
      @models = "#{@goldberg}/app/models/goldberg"
      m.directory @models
      
      m.file "#{@models}/content_page.rb", "#{@models}/content_page.rb"
      m.file "#{@models}/controller_action.rb", 
      "#{@models}/controller_action.rb"
      m.file "#{@models}/credentials.rb", "#{@models}/credentials.rb"
      m.file "#{@models}/login.rb", "#{@models}/login.rb"
      m.file "#{@models}/markup_style.rb", "#{@models}/markup_style.rb"
      m.file "#{@models}/menu_item.rb", "#{@models}/menu_item.rb"
      m.file "#{@models}/menu.rb", "#{@models}/menu.rb"
      m.file "#{@models}/permission.rb", "#{@models}/permission.rb"
      m.file "#{@models}/role.rb", "#{@models}/role.rb"
      m.file "#{@models}/roles_permission.rb", "#{@models}/roles_permission.rb"
      m.file "#{@models}/site_controller.rb", "#{@models}/site_controller.rb"
      m.file "#{@models}/system_settings.rb", "#{@models}/system_settings.rb"
      m.file "#{@models}/user.rb", "#{@models}/user.rb"


      # === VIEWS ===
      m.directory "#{@goldberg}/app"
      m.directory "#{@goldberg}/app/views"
      @views = "#{@goldberg}/app/views/goldberg"
      m.directory @views

      m.directory "#{@views}/auth"
      m.file "#{@views}/auth/forgotten.rhtml", 
      "#{@views}/auth/forgotten.rhtml" 
      m.file "#{@views}/auth/_form.rhtml", "#{@views}/auth/_form.rhtml"
      m.file "#{@views}/auth/login.rhtml", "#{@views}/auth/login.rhtml"
      m.file "#{@views}/auth/logout.rhtml", "#{@views}/auth/logout.rhtml"
      m.file "#{@views}/auth/_login.rhtml", "#{@views}/auth/_login.rhtml"

      m.directory "#{@views}/content_pages"
      m.file "#{@views}/content_pages/edit.rhtml", 
      "#{@views}/content_pages/edit.rhtml"
      m.file "#{@views}/content_pages/_form.rhtml", 
      "#{@views}/content_pages/_form.rhtml"
      m.file "#{@views}/content_pages/list.rhtml", 
      "#{@views}/content_pages/list.rhtml"
      m.file "#{@views}/content_pages/new.rhtml", 
      "#{@views}/content_pages/new.rhtml"
      m.file "#{@views}/content_pages/show.rhtml", 
      "#{@views}/content_pages/show.rhtml"
      m.file "#{@views}/content_pages/view_default.rhtml", 
      "#{@views}/content_pages/view_default.rhtml"
      m.file "#{@views}/content_pages/view.rhtml", 
      "#{@views}/content_pages/view.rhtml"

      m.directory "#{@views}/controller_actions"
      m.file "#{@views}/controller_actions/edit.rhtml", 
      "#{@views}/controller_actions/edit.rhtml"
      m.file "#{@views}/controller_actions/_form.rhtml", 
      "#{@views}/controller_actions/_form.rhtml"
      m.file "#{@views}/controller_actions/list.rhtml", 
      "#{@views}/controller_actions/list.rhtml"
      m.file "#{@views}/controller_actions/new.rhtml", 
      "#{@views}/controller_actions/new.rhtml"
      m.file "#{@views}/controller_actions/show.rhtml", 
      "#{@views}/controller_actions/show.rhtml"

      m.directory "#{@views}/layouts"
      m.file "#{@views}/layouts/_tabpanel_js.rhtml",
      "#{@views}/layouts/_tabpanel_js.rhtml"
      m.file "#{@views}/layouts/_tabpanel_list.rhtml",
      "#{@views}/layouts/_tabpanel_list.rhtml"
      
      m.directory "#{@views}/markup_styles"
      m.file "#{@views}/markup_styles/edit.rhtml", 
      "#{@views}/markup_styles/edit.rhtml"
      m.file "#{@views}/markup_styles/_form.rhtml", 
      "#{@views}/markup_styles/_form.rhtml"
      m.file "#{@views}/markup_styles/list.rhtml", 
      "#{@views}/markup_styles/list.rhtml"
      m.file "#{@views}/markup_styles/new.rhtml", 
      "#{@views}/markup_styles/new.rhtml"
      m.file "#{@views}/markup_styles/show.rhtml", 
      "#{@views}/markup_styles/show.rhtml"
      
      m.directory "#{@views}/menu_items"
      m.file "#{@views}/menu_items/edit.rhtml", 
      "#{@views}/menu_items/edit.rhtml"
      m.file "#{@views}/menu_items/_form.rhtml", 
      "#{@views}/menu_items/_form.rhtml"
      m.file "#{@views}/menu_items/_item_list.rhtml", 
      "#{@views}/menu_items/_item_list.rhtml"
      m.file "#{@views}/menu_items/_item_parent_list.rhtml", 
      "#{@views}/menu_items/_item_parent_list.rhtml"
      m.file "#{@views}/menu_items/list.rhtml", 
      "#{@views}/menu_items/list.rhtml"
      m.file "#{@views}/menu_items/new.rhtml", 
      "#{@views}/menu_items/new.rhtml"
      m.file "#{@views}/menu_items/show.rhtml", 
      "#{@views}/menu_items/show.rhtml"
      m.file "#{@views}/menu_items/_suckerfish.rhtml", 
      "#{@views}/menu_items/_suckerfish.rhtml"
      m.file "#{@views}/menu_items/_breadcrumbs.rhtml",
      "#{@views}/menu_items/_breadcrumbs.rhtml"
      m.file "#{@views}/menu_items/_menubar.rhtml",
      "#{@views}/menu_items/_menubar.rhtml"

      m.directory "#{@views}/permissions"
      m.file "#{@views}/permissions/edit.rhtml", 
      "#{@views}/permissions/edit.rhtml"
      m.file "#{@views}/permissions/_form.rhtml", 
      "#{@views}/permissions/_form.rhtml"
      m.file "#{@views}/permissions/list.rhtml", 
      "#{@views}/permissions/list.rhtml"
      m.file "#{@views}/permissions/new.rhtml", 
      "#{@views}/permissions/new.rhtml"
      m.file "#{@views}/permissions/show.rhtml", 
      "#{@views}/permissions/show.rhtml"

      m.directory "#{@views}/roles"
      m.file "#{@views}/roles/edit.rhtml", 
      "#{@views}/roles/edit.rhtml"
      m.file "#{@views}/roles/_form.rhtml", 
      "#{@views}/roles/_form.rhtml"
      m.file "#{@views}/roles/list.rhtml", 
      "#{@views}/roles/list.rhtml"
      m.file "#{@views}/roles/new.rhtml", 
      "#{@views}/roles/new.rhtml"
      m.file "#{@views}/roles/show.rhtml", 
      "#{@views}/roles/show.rhtml"

      m.directory "#{@views}/roles_permissions"
      m.file "#{@views}/roles_permissions/edit.rhtml", 
      "#{@views}/roles_permissions/edit.rhtml"
      m.file "#{@views}/roles_permissions/_form.rhtml", 
      "#{@views}/roles_permissions/_form.rhtml"
      m.file "#{@views}/roles_permissions/list.rhtml", 
      "#{@views}/roles_permissions/list.rhtml"
      m.file "#{@views}/roles_permissions/new_permission_for_role.rhtml", 
      "#{@views}/roles_permissions/new_permission_for_role.rhtml"
      m.file "#{@views}/roles_permissions/new.rhtml", 
      "#{@views}/roles_permissions/new.rhtml"
      m.file "#{@views}/roles_permissions/show.rhtml", 
      "#{@views}/roles_permissions/show.rhtml"

      m.directory "#{@views}/site_controllers"
      m.file "#{@views}/site_controllers/edit.rhtml", 
      "#{@views}/site_controllers/edit.rhtml"
      m.file "#{@views}/site_controllers/_form.rhtml", 
      "#{@views}/site_controllers/_form.rhtml"
      m.file "#{@views}/site_controllers/list.rhtml", 
      "#{@views}/site_controllers/list.rhtml"
      m.file "#{@views}/site_controllers/_list.rhtml", 
      "#{@views}/site_controllers/_list.rhtml"
      m.file "#{@views}/site_controllers/new.rhtml", 
      "#{@views}/site_controllers/new.rhtml"
      m.file "#{@views}/site_controllers/show.rhtml", 
      "#{@views}/site_controllers/show.rhtml"
      
      m.directory "#{@views}/system_settings"
      m.file "#{@views}/system_settings/edit.rhtml", 
      "#{@views}/system_settings/edit.rhtml"
      m.file "#{@views}/system_settings/_form.rhtml", 
      "#{@views}/system_settings/_form.rhtml"
      m.file "#{@views}/system_settings/list.rhtml", 
      "#{@views}/system_settings/list.rhtml"
      m.file "#{@views}/system_settings/new.rhtml", 
      "#{@views}/system_settings/new.rhtml"
      m.file "#{@views}/system_settings/show.rhtml", 
      "#{@views}/system_settings/show.rhtml"

      m.directory "#{@views}/users"
      m.file "#{@views}/users/edit.rhtml", 
      "#{@views}/users/edit.rhtml"
      m.file "#{@views}/users/_form.rhtml", 
      "#{@views}/users/_form.rhtml"
      m.file "#{@views}/users/list.rhtml", 
      "#{@views}/users/list.rhtml"
      m.file "#{@views}/users/new.rhtml", 
      "#{@views}/users/new.rhtml"
      m.file "#{@views}/users/show.rhtml", 
      "#{@views}/users/show.rhtml"

      
      # === DATABASE ===
      @db = "#{@goldberg}/db"
      m.directory @db
      @migrate = "#{@goldberg}/db/migrate"
      m.directory @migrate

      
      m.file "#{@migrate}/001_initial_setup.rb", 
      "#{@migrate}/001_initial_setup.rb"
      m.file "#{@migrate}/002_menu_rest_items_users_cached_content_pages.rb",
      "#{@migrate}/002_menu_rest_items_users_cached_content_pages.rb"

      m.file "#{@db}/ContentPage.yml",      "#{@db}/ContentPage.yml"
      m.file "#{@db}/ControllerAction.yml", "#{@db}/ControllerAction.yml"
      m.file "#{@db}/MarkupStyle.yml",      "#{@db}/MarkupStyle.yml"
      m.file "#{@db}/MenuItem.yml",         "#{@db}/MenuItem.yml"
      m.file "#{@db}/Permission.yml",       "#{@db}/Permission.yml"
      m.file "#{@db}/Role.yml",             "#{@db}/Role.yml"
      m.file "#{@db}/RolesPermission.yml",  "#{@db}/RolesPermission.yml"
      m.file "#{@db}/SiteController.yml",   "#{@db}/SiteController.yml"
      m.file "#{@db}/SystemSettings.yml",   "#{@db}/SystemSettings.yml"
      m.file "#{@db}/User.yml",             "#{@db}/User.yml"


      # === PUBLIC ===
      m.directory "public/goldberg"
      m.directory "public/goldberg/stylesheets"
      m.file "public/goldberg/stylesheets/goldberg.css", 
      "public/goldberg/stylesheets/goldberg.css"

      m.directory "public/goldberg/javascripts"
      m.file "public/goldberg/javascripts/suckerfish.js",
      "public/goldberg/javascripts/suckerfish.js"

      m.directory "public/goldberg/images"
      m.file "public/goldberg/images/action.png",     "public/goldberg/images/action.png"
      m.file "public/goldberg/images/add.png",        "public/goldberg/images/add.png"
      m.file "public/goldberg/images/delete.png",     "public/goldberg/images/delete.png"
      m.file "public/goldberg/images/down.png",       "public/goldberg/images/down.png"
      m.file "public/goldberg/images/page.png",       "public/goldberg/images/page.png"
      m.file "public/goldberg/images/permission.png", "public/goldberg/images/permission.png"
      m.file "public/goldberg/images/role.png",       "public/goldberg/images/role.png"
      m.file "public/goldberg/images/up.png",         "public/goldberg/images/up.png"

      # === TEMPLATES ===
      # EARTH WIND AND FIRE
      if name == 'ewnf'
        m.file "layouts/ewnf/app/views/layouts/application.rhtml",
        "app/views/layouts/application.rhtml"

        m.file "layouts/ewnf/public/images/bg.gif", 
        "public/goldberg/images/bg.gif"
        m.file "layouts/ewnf/public/images/sample.jpg", 
        "public/goldberg/images/sample.jpg"
        m.file "layouts/ewnf/public/images/title_img.jpg", 
        "public/goldberg/images/title_img.jpg"
        m.file "layouts/ewnf/public/images/daddy_rightarrow.gif", 
        "public/goldberg/images/daddy_rightarrow.gif"

        m.file "layouts/ewnf/public/stylesheets/layout.css",
        "public/goldberg/stylesheets/layout.css"

      # SPOILED BRAT
      elsif name == 'spoiled_brat'
        m.file "layouts/spoiled_brat/app/views/layouts/application.rhtml",
        "app/views/layouts/application.rhtml"

        m.file "layouts/spoiled_brat/public/images/blockquote-bg.gif", 
        "public/goldberg/images/blockquote-bg.gif"
        m.file "layouts/spoiled_brat/public/images/body-bg.jpg", 
        "public/goldberg/images/body-bg.jpg"
        m.file "layouts/spoiled_brat/public/images/centerColumn-bg.jpg", 
        "public/goldberg/images/centerColumn-bg.jpg"
        m.file "layouts/spoiled_brat/public/images/h2-bg.gif", 
        "public/goldberg/images/h2-bg.gif"
        m.file "layouts/spoiled_brat/public/images/h3-bg.gif", 
        "public/goldberg/images/h3-bg.gif"
        m.file "layouts/spoiled_brat/public/images/header-bg.jpg", 
        "public/goldberg/images/header-bg.jpg"
        m.file "layouts/spoiled_brat/public/images/hr-bg.jpg", 
        "public/goldberg/images/hr-bg.jpg"
        m.file "layouts/spoiled_brat/public/images/logo.jpg", 
        "public/goldberg/images/logo.jpg"
        m.file "layouts/spoiled_brat/public/images/daddy_leftarrow.gif", 
        "public/goldberg/images/daddy_leftarrow.gif"

        m.file "layouts/spoiled_brat/public/stylesheets/layout.css",
        "public/goldberg/stylesheets/layout.css"

      elsif name == 'snooker'
        m.file "layouts/snooker/app/views/layouts/application.rhtml",
        "app/views/layouts/application.rhtml"

        m.file "layouts/snooker/public/images/column_200.png", 
        "public/goldberg/images/column_200.png"
        m.file "layouts/snooker/public/images/footer_bg.png", 
        "public/goldberg/images/footer_bg.png"
        m.file "layouts/snooker/public/images/logo.jpg", 
        "public/goldberg/images/logo.jpg"
        m.file "layouts/snooker/public/images/daddy_rightarrow.gif", 
        "public/goldberg/images/daddy_rightarrow.gif"

        m.file "layouts/snooker/public/stylesheets/layout.css",
        "public/goldberg/stylesheets/layout.css"

      # GOLDBERG CLASSIC BLUE (the default)
      else
        m.file "app/views/layouts/application.rhtml",
        "app/views/layouts/application.rhtml"

        m.file "public/goldberg/images/bodybg.jpg",     "public/goldberg/images/bodybg.jpg"
        m.file "public/goldberg/images/footerbg.jpg",   "public/goldberg/images/footerbg.jpg"
        m.file "public/goldberg/images/logo_right.jpg", "public/goldberg/images/logo_right.jpg"
        m.file "public/goldberg/images/menuhover.jpg",  "public/goldberg/images/menuhover.jpg"

        m.file "public/goldberg/stylesheets/layout.css",   
        "public/goldberg/stylesheets/layout.css"
      end

      # === TESTS ===
      @test = "#{@goldberg}/test"
      m.directory @test
      m.directory "#{@test}/unit"
      m.directory "#{@test}/fixtures"
      
      m.template "#{@test}/unit/content_page_test.rb", "#{@test}/unit/content_page_test.rb"
      m.template "#{@test}/unit/system_settings_test.rb", "#{@test}/unit/system_settings_test.rb"
      m.template "#{@test}/unit/menu_item_test.rb", "#{@test}/unit/menu_item_test.rb"
      m.template "#{@test}/unit/user_test.rb", "#{@test}/unit/user_test.rb"
      m.template "#{@test}/unit/site_controller_test.rb", "#{@test}/unit/site_controller_test.rb"
      m.template "#{@test}/unit/markup_style_test.rb", "#{@test}/unit/markup_style_test.rb"
      m.template "#{@test}/unit/permission_test.rb", "#{@test}/unit/permission_test.rb"      
      m.template "#{@test}/unit/controller_action_test.rb", "#{@test}/unit/controller_action_test.rb"      
      
      m.template "#{@test}/fixtures/content_pages.yml", "#{@test}/fixtures/content_pages.yml"
      m.template "#{@test}/fixtures/permissions.yml", "#{@test}/fixtures/permissions.yml"
      m.template "#{@test}/fixtures/markup_styles.yml", "#{@test}/fixtures/markup_styles.yml"
      m.template "#{@test}/fixtures/roles.yml", "#{@test}/fixtures/roles.yml"
      m.template "#{@test}/fixtures/menu_items.yml", "#{@test}/fixtures/menu_items.yml"
      m.template "#{@test}/fixtures/users.yml", "#{@test}/fixtures/users.yml"
      m.template "#{@test}/fixtures/site_controllers.yml", "#{@test}/fixtures/site_controllers.yml"
      m.template "#{@test}/fixtures/roles_permissions.yml", "#{@test}/fixtures/roles_permissions.yml"
      m.template "#{@test}/fixtures/controller_actions.yml", "#{@test}/fixtures/controller_actions.yml"
      
      # Show message
      m.file "README_GOLDBERG", "README_GOLDBERG"
      m.readme "README_GOLDBERG"
    end

  end  # manifest
end  # class
