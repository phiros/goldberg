create view view_menu_items
as

select 
-- Menu item fields
	cast(menu_items.id as unsigned) as menu_item_id, 
	menu_items.name as menu_item_name,
	menu_items.label as menu_item_label,
	menu_items.seq as menu_item_seq,
	menu_items.parent_id as menu_item_parent_id, 
-- Controller action fields
	view_controller_actions.site_controller_id,
	view_controller_actions.site_controller_name, 
	view_controller_actions.id as controller_action_id,
	view_controller_actions.name as controller_action_name,
-- Content page fields
	content_pages.id as content_page_id,
	content_pages.name as content_page_name,
	content_pages.title as content_page_title,
	-- markup_styles.name as markup_style,
	-- content,
-- Permissions
	permissions.id as permission_id,
	permissions.name as permission_name
from menu_items
left outer join view_controller_actions 
	on menu_items.controller_action_id = view_controller_actions.id
left outer join content_pages
	on menu_items.content_page_id = content_pages.id
	and menu_items.controller_action_id is Null
left outer join markup_styles
	on content_pages.markup_style_id = markup_styles.id
inner join permissions 
	on (coalesce(view_controller_actions.permission_id, content_pages.permission_id)) = permissions.id
;