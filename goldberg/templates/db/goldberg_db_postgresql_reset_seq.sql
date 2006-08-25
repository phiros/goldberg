/* Reset page sequences */

select setval('content_pages_id_seq', 
	(select max(id) from content_pages)) ;

select setval('controller_actions_id_seq', 
	(select max(id) from controller_actions)) ;

select setval('markup_styles_id_seq', 
	(select max(id) from markup_styles)) ;

select setval('menu_items_id_seq', 
	(select max(id) from menu_items)) ;

select setval('permissions_id_seq', 
	(select max(id) from permissions)) ;

select setval('roles_id_seq', 
	(select max(id) from roles)) ;

select setval('roles_permissions_id_seq', 
	(select max(id) from roles_permissions)) ;

select setval('sessions_id_seq', 
	(select max(id) from sessions)) ;

select setval('site_controllers_id_seq', 
	(select max(id) from site_controllers)) ;

select setval('system_settings_id_seq', 
	(select max(id) from system_settings)) ;

select setval('users_id_seq', 
	(select max(id) from users)) ;
