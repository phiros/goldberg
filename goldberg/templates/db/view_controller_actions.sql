create view view_controller_actions
as

select controller_actions.id,
site_controllers.id as site_controller_id,
site_controllers.name as site_controller_name,
controller_actions.name,
Coalesce(controller_actions.permission_id, site_controllers.permission_id) as permission_id
from site_controllers 
inner join controller_actions on site_controllers.id = controller_actions.site_controller_id
;
