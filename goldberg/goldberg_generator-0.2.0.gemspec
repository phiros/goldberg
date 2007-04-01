Gem::Specification.new do |s|
  s.name = "goldberg_generator"
  s.version = "0.2.0"
  s.date = "2007-04-01"
  s.summary = "Goldberg -- Integrated Site design for Ruby on Rails"
  s.description = "Goldberg is a Ruby on Rails generator that lets you set up websites within minutes."
  s.email = "urbanus@240gl.org"
  s.homepage = "http://goldberg.240gl.org"
  s.autorequire = "rails_generator/generators/components/scaffold/scaffold_generator"

  s.files = 
["templates", "templates/app", "templates/app/views", "templates/app/views/layouts", "templates/app/views/layouts/application.rhtml", "templates/layouts", "templates/layouts/ewnf", "templates/layouts/ewnf/app", "templates/layouts/ewnf/app/views", "templates/layouts/ewnf/app/views/layouts", "templates/layouts/ewnf/app/views/layouts/application.rhtml", "templates/layouts/ewnf/public", "templates/layouts/ewnf/public/images", "templates/layouts/ewnf/public/images/title_img.jpg", "templates/layouts/ewnf/public/images/sample.jpg", "templates/layouts/ewnf/public/images/bg.gif", "templates/layouts/ewnf/public/images/daddy_rightarrow.gif", "templates/layouts/ewnf/public/stylesheets", "templates/layouts/ewnf/public/stylesheets/layout.css", "templates/layouts/ewnf/README", "templates/layouts/snooker", "templates/layouts/snooker/app", "templates/layouts/snooker/app/views", "templates/layouts/snooker/app/views/layouts", "templates/layouts/snooker/app/views/layouts/application.rhtml", "templates/layouts/snooker/public", "templates/layouts/snooker/public/images", "templates/layouts/snooker/public/images/logo.jpg", "templates/layouts/snooker/public/images/daddy_rightarrow.gif", "templates/layouts/snooker/public/images/column_200.png", "templates/layouts/snooker/public/images/footer_bg.png", "templates/layouts/snooker/public/stylesheets", "templates/layouts/snooker/public/stylesheets/layout.css", "templates/layouts/spoiled_brat", "templates/layouts/spoiled_brat/app", "templates/layouts/spoiled_brat/app/views", "templates/layouts/spoiled_brat/app/views/layouts", "templates/layouts/spoiled_brat/app/views/layouts/application.rhtml", "templates/layouts/spoiled_brat/public", "templates/layouts/spoiled_brat/public/images", "templates/layouts/spoiled_brat/public/images/body-bg.jpg", "templates/layouts/spoiled_brat/public/images/logo.jpg", "templates/layouts/spoiled_brat/public/images/blockquote-bg.gif", "templates/layouts/spoiled_brat/public/images/centerColumn-bg.jpg", "templates/layouts/spoiled_brat/public/images/h2-bg.gif", "templates/layouts/spoiled_brat/public/images/h3-bg.gif", "templates/layouts/spoiled_brat/public/images/header-bg.jpg", "templates/layouts/spoiled_brat/public/images/daddy_leftarrow.gif", "templates/layouts/spoiled_brat/public/images/hr-bg.jpg", "templates/layouts/spoiled_brat/public/stylesheets", "templates/layouts/spoiled_brat/public/stylesheets/layout.css", "templates/layouts/spoiled_brat/LICENSE.txt", "templates/layouts/spoiled_brat/README", "templates/vendor", "templates/vendor/plugins", "templates/vendor/plugins/goldberg", "templates/vendor/plugins/goldberg/test", "templates/vendor/plugins/goldberg/test/unit", "templates/vendor/plugins/goldberg/test/unit/user_test.rb", "templates/vendor/plugins/goldberg/test/unit/system_settings_test.rb", "templates/vendor/plugins/goldberg/test/unit/markup_style_test.rb", "templates/vendor/plugins/goldberg/test/unit/menu_item_test.rb", "templates/vendor/plugins/goldberg/test/unit/controller_action_test.rb", "templates/vendor/plugins/goldberg/test/unit/site_controller_test.rb", "templates/vendor/plugins/goldberg/test/unit/content_page_test.rb", "templates/vendor/plugins/goldberg/test/unit/permission_test.rb", "templates/vendor/plugins/goldberg/test/fixtures", "templates/vendor/plugins/goldberg/test/fixtures/roles_permissions.yml", "templates/vendor/plugins/goldberg/test/fixtures/users.yml", "templates/vendor/plugins/goldberg/test/fixtures/markup_styles.yml", "templates/vendor/plugins/goldberg/test/fixtures/controller_actions.yml", "templates/vendor/plugins/goldberg/test/fixtures/roles.yml", "templates/vendor/plugins/goldberg/test/fixtures/menu_items.yml", "templates/vendor/plugins/goldberg/test/fixtures/content_pages.yml", "templates/vendor/plugins/goldberg/test/fixtures/site_controllers.yml", "templates/vendor/plugins/goldberg/test/fixtures/permissions.yml", "templates/vendor/plugins/goldberg/app", "templates/vendor/plugins/goldberg/app/helpers", "templates/vendor/plugins/goldberg/app/helpers/goldberg", "templates/vendor/plugins/goldberg/app/helpers/goldberg/roles_permissions_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/auth_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/users_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/controller_actions_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/roles_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/system_settings_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/menu_items_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/content_pages_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/site_controllers_helper.rb", "templates/vendor/plugins/goldberg/app/helpers/goldberg/permissions_helper.rb", "templates/vendor/plugins/goldberg/app/models", "templates/vendor/plugins/goldberg/app/models/goldberg", "templates/vendor/plugins/goldberg/app/models/goldberg/controller_action.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/credentials.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/user.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/menu_item.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/role.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/menu.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/system_settings.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/content_page.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/site_controller.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/user_mailer.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/permission.rb", "templates/vendor/plugins/goldberg/app/models/goldberg/roles_permission.rb", "templates/vendor/plugins/goldberg/app/controllers", "templates/vendor/plugins/goldberg/app/controllers/goldberg", "templates/vendor/plugins/goldberg/app/controllers/goldberg/site_controllers_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/permissions_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/roles_permissions_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/auth_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/users_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/controller_actions_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/roles_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/system_settings_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/menu_items_controller.rb", "templates/vendor/plugins/goldberg/app/controllers/goldberg/content_pages_controller.rb", "templates/vendor/plugins/goldberg/app/views", "templates/vendor/plugins/goldberg/app/views/goldberg", "templates/vendor/plugins/goldberg/app/views/goldberg/roles_permissions", "templates/vendor/plugins/goldberg/app/views/goldberg/roles_permissions/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles_permissions/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles_permissions/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles_permissions/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles_permissions/new.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles_permissions/new_permission_for_role.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/layouts", "templates/vendor/plugins/goldberg/app/views/goldberg/layouts/_tabpanel_list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/layouts/_tabpanel_js.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/auth", "templates/vendor/plugins/goldberg/app/views/goldberg/auth/_login.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/auth/login.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/auth/logout.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users", "templates/vendor/plugins/goldberg/app/views/goldberg/users/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/confirm_registration_submit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/create.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/forgot_password.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/reset_password.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/new.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/forgot_password_submit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/confirm_registration.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/users/reset_password_submit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/controller_actions", "templates/vendor/plugins/goldberg/app/views/goldberg/controller_actions/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/controller_actions/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/controller_actions/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/controller_actions/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/controller_actions/new.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles", "templates/vendor/plugins/goldberg/app/views/goldberg/roles/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/roles/new.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/system_settings", "templates/vendor/plugins/goldberg/app/views/goldberg/system_settings/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/system_settings/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/system_settings/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/system_settings/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/system_settings/new.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/_item_list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/list-original.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/_item_parent_list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/_suckerfish.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/_breadcrumbs.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/_menubar.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/menu_items/new.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/user_mailer", "templates/vendor/plugins/goldberg/app/views/goldberg/user_mailer/reset_password_request.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/user_mailer/confirmation_request.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/user_mailer/reset_password.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/_fck_files.rxml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/view.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/_fck_create_folder.rxml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/view_default.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/fck_speller_pages.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/content_pages/new.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/site_controllers", "templates/vendor/plugins/goldberg/app/views/goldberg/site_controllers/_list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/site_controllers/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/site_controllers/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/site_controllers/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/site_controllers/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/site_controllers/new.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/permissions", "templates/vendor/plugins/goldberg/app/views/goldberg/permissions/list.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/permissions/show.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/permissions/_form.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/permissions/edit.rhtml", "templates/vendor/plugins/goldberg/app/views/goldberg/permissions/new.rhtml", "templates/vendor/plugins/goldberg/db", "templates/vendor/plugins/goldberg/db/migrate", "templates/vendor/plugins/goldberg/db/migrate/001_initial_setup.rb", "templates/vendor/plugins/goldberg/db/migrate/002_menu_rest_items_users_cached_content_pages.rb", "templates/vendor/plugins/goldberg/db/migrate/003_self_registration.rb", "templates/vendor/plugins/goldberg/db/ControllerAction.yml", "templates/vendor/plugins/goldberg/db/Role.yml", "templates/vendor/plugins/goldberg/db/MenuItem.yml", "templates/vendor/plugins/goldberg/db/SystemSettings.yml", "templates/vendor/plugins/goldberg/db/ContentPage.yml", "templates/vendor/plugins/goldberg/db/Permission.yml", "templates/vendor/plugins/goldberg/db/SiteController.yml", "templates/vendor/plugins/goldberg/db/RolesPermission.yml", "templates/vendor/plugins/goldberg/db/User.yml", "templates/vendor/plugins/goldberg/tasks", "templates/vendor/plugins/goldberg/tasks/goldberg_tasks.rake", "templates/vendor/plugins/goldberg/lib", "templates/vendor/plugins/goldberg/lib/goldberg_migration.rb", "templates/vendor/plugins/goldberg/lib/goldberg_filters.rb", "templates/vendor/plugins/goldberg/lib/goldberg.rb", "templates/vendor/plugins/goldberg/lib/goldberg_controller.rb", "templates/vendor/plugins/goldberg/lib/goldberg_model.rb", "templates/vendor/plugins/goldberg/lib/goldberg_routes.rb", "templates/vendor/plugins/goldberg/lib/goldberg_helper.rb", "templates/vendor/plugins/goldberg/init.rb", "templates/public", "templates/public/goldberg", "templates/public/goldberg/images", "templates/public/goldberg/images/action.png", "templates/public/goldberg/images/page.png", "templates/public/goldberg/images/bodybg.jpg", "templates/public/goldberg/images/role.png", "templates/public/goldberg/images/menuhover.jpg", "templates/public/goldberg/images/delete.png", "templates/public/goldberg/images/footerbg.jpg", "templates/public/goldberg/images/up.png", "templates/public/goldberg/images/down.png", "templates/public/goldberg/images/add.png", "templates/public/goldberg/images/permission.png", "templates/public/goldberg/images/logo_right.jpg", "templates/public/goldberg/javascripts", "templates/public/goldberg/javascripts/suckerfish.js", "templates/public/goldberg/stylesheets", "templates/public/goldberg/stylesheets/suckerfish.css", "templates/public/goldberg/stylesheets/layout.css", "templates/public/goldberg/stylesheets/goldberg.css", "templates/README_GOLDBERG", "USAGE", "goldberg_generator.rb"]

  s.add_dependency("rails", [">= 1.2.3"])
  s.add_dependency("plugin_migrations", [">= 0.0.2"])
  s.add_dependency("RedCloth", [">= 3.0.4"])
end
