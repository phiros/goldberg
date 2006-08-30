--
-- PostgreSQL database dump
--

SET client_encoding = 'SQL_ASCII';
SET check_function_bodies = false;

--
-- TOC entry 4 (OID 2200)
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


SET search_path = public, pg_catalog;

--
-- TOC entry 5 (OID 26179)
-- Name: content_pages; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE content_pages (
    id serial NOT NULL,
    title character varying(255),
    name character varying(255) NOT NULL,
    markup_style_id integer,
    content text,
    permission_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 6 (OID 26187)
-- Name: controller_actions; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE controller_actions (
    id serial NOT NULL,
    site_controller_id integer NOT NULL,
    name character varying(255) NOT NULL,
    permission_id integer
);


--
-- TOC entry 7 (OID 26192)
-- Name: markup_styles; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE markup_styles (
    id serial NOT NULL,
    name character varying(255)
);


--
-- TOC entry 8 (OID 26197)
-- Name: menu_items; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE menu_items (
    id serial NOT NULL,
    parent_id integer,
    name character varying(255) NOT NULL,
    label character varying(255) NOT NULL,
    seq integer,
    controller_action_id integer,
    content_page_id integer
);


--
-- TOC entry 9 (OID 26202)
-- Name: permissions; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE permissions (
    id serial NOT NULL,
    name character varying(255)
);


--
-- TOC entry 10 (OID 26207)
-- Name: roles; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE roles (
    id serial NOT NULL,
    name character varying(255),
    parent_id integer,
    description character varying(1024),
    default_page_id integer,
    "cache" text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 11 (OID 26215)
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE roles_permissions (
    id serial NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 12 (OID 26220)
-- Name: sessions; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE sessions (
    id serial NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 13 (OID 26228)
-- Name: site_controllers; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE site_controllers (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    permission_id integer NOT NULL,
    builtin integer
);


--
-- TOC entry 14 (OID 26233)
-- Name: system_settings; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE system_settings (
    id serial NOT NULL,
    site_name character varying(255) NOT NULL,
    site_subtitle character varying(255),
    footer_message character varying(255),
    public_role_id integer NOT NULL,
    session_timeout integer NOT NULL,
    default_markup_style_id integer NOT NULL,
    site_default_page_id integer NOT NULL,
    not_found_page_id integer NOT NULL,
    permission_denied_page_id integer NOT NULL,
    session_expired_page_id integer NOT NULL,
    menu_depth integer NOT NULL
);


--
-- TOC entry 15 (OID 26238)
-- Name: users; Type: TABLE; Schema: public; Owner: david
--

CREATE TABLE users (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    "password" character varying(40) NOT NULL,
    role_id integer NOT NULL
);


--
-- TOC entry 16 (OID 26243)
-- Name: view_controller_actions; Type: VIEW; Schema: public; Owner: david
--

CREATE VIEW view_controller_actions AS
    SELECT controller_actions.id, site_controllers.id AS site_controller_id, site_controllers.name AS site_controller_name, controller_actions.name, COALESCE(controller_actions.permission_id, site_controllers.permission_id) AS permission_id FROM (site_controllers JOIN controller_actions ON ((site_controllers.id = controller_actions.site_controller_id)));


--
-- TOC entry 17 (OID 26246)
-- Name: view_menu_items; Type: VIEW; Schema: public; Owner: david
--

CREATE VIEW view_menu_items AS
    SELECT menu_items.id AS menu_item_id, menu_items.name AS menu_item_name, menu_items.label AS menu_item_label, menu_items.seq AS menu_item_seq, menu_items.parent_id AS menu_item_parent_id, view_controller_actions.site_controller_id, view_controller_actions.site_controller_name, view_controller_actions.id AS controller_action_id, view_controller_actions.name AS controller_action_name, content_pages.id AS content_page_id, content_pages.name AS content_page_name, content_pages.title AS content_page_title, permissions.id AS permission_id, permissions.name AS permission_name FROM ((((menu_items LEFT JOIN view_controller_actions ON ((menu_items.controller_action_id = view_controller_actions.id))) LEFT JOIN content_pages ON (((menu_items.content_page_id = content_pages.id) AND (menu_items.controller_action_id IS NULL)))) LEFT JOIN markup_styles ON ((content_pages.markup_style_id = markup_styles.id))) JOIN permissions ON ((COALESCE(view_controller_actions.permission_id, content_pages.permission_id) = permissions.id)));


--
-- Data for TOC entry 45 (OID 26179)
-- Name: content_pages; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) VALUES (1, 'Home Page', 'home', 2, 'h1. Welcome to Goldberg!

Looks like you have succeeded in getting Goldberg up and running.  Now you will probably want to customise your site.

*Very important:* The default login for the administrator is "admin", password "admin".  You must change that before you make your site public!


h2. Administering the Site

At the login prompt, enter an administrator username and password.  The top menu should change: a new item called "Administration" will appear.  Go there for further details.


h2. Further Assistance

See [Contact Us](/menu/contact_us), above, for links to the Goldberg website and project page.


', 3, '2006-06-12 00:31:56', '2006-08-25 14:30:37');
INSERT INTO content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) VALUES (2, 'Session Expired', 'expired', 2, 'h1. Session Expired

Your session has expired due to inactivity.

Please log in again.
', 3, '2006-06-12 00:33:14', '2006-08-25 12:57:36');
INSERT INTO content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) VALUES (3, 'Not Found', 'notfound', 2, 'h1. Not Found

The page you requested was not found.  

Please check the URL, or contact your system administrator.', 3, '2006-06-12 00:33:49', '2006-08-25 12:56:44');
INSERT INTO content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) VALUES (4, 'Permission Denied!', 'denied', 2, 'h1. Permission Denied!

Sorry, but you don''t have permission to view that page.

Please contact your system administrator.', 3, '2006-06-12 00:34:30', '2006-08-25 12:55:45');
INSERT INTO content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) VALUES (6, 'Contact Us', 'contact_us', 2, 'h1. Contact Us

Visit the Goldberg Project Homepage at [http://goldberg.rubyforge.org](http://goldberg.rubyforge.org) for further information on Goldberg.  Visit the Goldberg RubyForge Project Page at [http://rubyforge.org/projects/goldberg](http://rubyforge.org/projects/goldberg/) to access the project''s files and development information.  The Project page has forums and a mailing list for Goldberg users.

h2. Credits

The default Goldberg site layout is based on Andreas Viklund''s excellent template "Andreas09".  Andreas is widely known as the designer of some of the finest open source web templates.  His website is at [http://andreasviklund.com](http://andreasviklund.com).

', 3, '2006-06-12 10:13:47', '2006-08-25 14:33:32');
INSERT INTO content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) VALUES (8, 'Site Administration', 'site_admin', 2, 'h1. Goldberg Setup

This is where you will find all the Goldberg-specific administration and configuration features.  In here you can:

* Set up Users.

* Manage Roles and their Permissions.

* Set up any Controllers and their Actions for your application.

* Edit the Content Pages of the site.

* Adjust Goldberg''s system settings.


h2. Users

You can set up Users with a username, password and a Role.


h2. Roles and Permissions

A User''s Permissions affect what Actions they can perform and what Pages they can see.  And because each Menu Item is based either on a Page or an Action, the Permissions determine what Menu Items the User can and cannot see.

A Role is a set of Permissions.  Roles are assigned to Users.  Roles are hierarchical: a Role can have a parent Role; and if so it will inherit the Permissions of the parent Role, and all its parents.


h2. Controllers and Actions

To execute any Action, a user must have the appropriate Permission.  Therefore all Controllers and Actions you set up for your Rails application need to be entered here, otherwise no user will be able to execute them.

You start by setting up the Controller and assigning it a Permission.  The Permission will be used as the default for any Actions invoked for that Controller.

You have the option of setting up specific Actions for the Controllers.  You would want to do that if the Action were to appear as a Menu Item, or if it were to have a different level of security to the default for the Controller.


h2. Content Pages

Goldberg has a very simple CMS built in.  You can create pages to be displayed on the site, possibly in menu items.


h2. Menu Editor

Once you have set up your Controller Actions and Content Pages, you can put them into the site''s menu using the Menu Editor.

In the Menu Editor you can add and remove Menu Items and move them around.  The security of a Menu Item (whether the user can see it or not) depends on the Permission of the Action or Page attached to that Menu Item.

h2. System Settings

Go here to view and edit the settings that determine how Goldberg operates.
', 1, '2006-06-21 21:32:35', '2006-08-18 23:05:56');
INSERT INTO content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) VALUES (9, 'Administration', 'admin', 2, 'h1. Site Administration

This is where the administrator can set up the site.

There is one menu item here by default -- [Setup](/menu/setup).  That contains all the Goldberg configuration options.

You can add more menu items here to administer your application if you want, by going to [Setup, Menu Editor](/menu/setup/menus).  
', 1, '2006-06-26 16:47:09', '2006-08-18 22:51:34');


--
-- Data for TOC entry 46 (OID 26187)
-- Name: controller_actions; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (1, 1, 'view_default', 3);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (2, 1, 'view', 3);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (3, 7, 'list', NULL);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (4, 6, 'list', NULL);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (5, 3, 'login', 4);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (6, 3, 'logout', 4);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (7, 5, 'link', 4);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (8, 1, 'list', NULL);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (9, 8, 'list', NULL);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (10, 2, 'list', NULL);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (11, 5, 'list', NULL);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (12, 9, 'list', NULL);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (13, 3, 'forgotten', 4);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (14, 3, 'login_failed', 4);
INSERT INTO controller_actions (id, site_controller_id, name, permission_id) VALUES (15, 10, 'list', NULL);


--
-- Data for TOC entry 47 (OID 26192)
-- Name: markup_styles; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO markup_styles (id, name) VALUES (1, 'Textile');
INSERT INTO markup_styles (id, name) VALUES (2, 'Markdown');


--
-- Data for TOC entry 48 (OID 26197)
-- Name: menu_items; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (1, NULL, 'home', 'Home', 1, NULL, 1);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (2, NULL, 'contact_us', 'Contact Us', 3, NULL, 6);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (3, NULL, 'admin', 'Administration', 2, NULL, 9);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (9, 3, 'setup', 'Setup', 1, NULL, 8);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (5, 9, 'setup/permissions', 'Permissions', 3, 4, NULL);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (6, 9, 'setup/roles', 'Roles', 2, 3, NULL);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (7, 9, 'setup/pages', 'Content Pages', 5, 8, NULL);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (8, 9, 'setup/controllers', 'Controllers / Actions', 4, 9, NULL);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (11, 9, 'setup/menus', 'Menu Editor', 6, 11, NULL);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (12, 9, 'setup/system_settings', 'System Settings', 7, 12, NULL);
INSERT INTO menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) VALUES (13, 9, 'setup/users', 'Users', 1, 15, NULL);


--
-- Data for TOC entry 49 (OID 26202)
-- Name: permissions; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO permissions (id, name) VALUES (1, 'Administer site');
INSERT INTO permissions (id, name) VALUES (2, 'Public pages - edit');
INSERT INTO permissions (id, name) VALUES (3, 'Public pages - view');
INSERT INTO permissions (id, name) VALUES (4, 'Public actions - execute');
INSERT INTO permissions (id, name) VALUES (5, 'Members only page -- view');


--
-- Data for TOC entry 50 (OID 26207)
-- Name: roles; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO roles (id, name, parent_id, description, default_page_id, "cache", created_at, updated_at) VALUES (1, 'Public', NULL, 'Members of the public who are not logged in.', NULL, NULL, '2006-06-23 21:03:49', '2006-08-25 14:33:32');
INSERT INTO roles (id, name, parent_id, description, default_page_id, "cache", created_at, updated_at) VALUES (2, 'Member', 1, '', NULL, NULL, '2006-06-23 21:03:50', '2006-08-25 14:33:32');
INSERT INTO roles (id, name, parent_id, description, default_page_id, "cache", created_at, updated_at) VALUES (3, 'Administrator', 2, '', 8, NULL, '2006-06-23 21:03:48', '2006-08-25 14:33:33');


--
-- Data for TOC entry 51 (OID 26215)
-- Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO roles_permissions (id, role_id, permission_id) VALUES (4, 3, 1);
INSERT INTO roles_permissions (id, role_id, permission_id) VALUES (6, 1, 3);
INSERT INTO roles_permissions (id, role_id, permission_id) VALUES (7, 3, 2);
INSERT INTO roles_permissions (id, role_id, permission_id) VALUES (9, 1, 4);
INSERT INTO roles_permissions (id, role_id, permission_id) VALUES (10, 2, 5);


--
-- Data for TOC entry 52 (OID 26220)
-- Name: sessions; Type: TABLE DATA; Schema: public; Owner: david
--



--
-- Data for TOC entry 53 (OID 26228)
-- Name: site_controllers; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (1, 'content_pages', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (2, 'controller_actions', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (3, 'auth', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (4, 'markup_styles', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (5, 'menu_items', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (6, 'permissions', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (7, 'roles', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (8, 'site_controllers', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (9, 'system_settings', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (10, 'users', 1, 1);
INSERT INTO site_controllers (id, name, permission_id, builtin) VALUES (11, 'roles_permissions', 1, 1);


--
-- Data for TOC entry 54 (OID 26233)
-- Name: system_settings; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO system_settings (id, site_name, site_subtitle, footer_message, public_role_id, session_timeout, default_markup_style_id, site_default_page_id, not_found_page_id, permission_denied_page_id, session_expired_page_id, menu_depth) VALUES (1, 'Goldberg', 'A website development tool for Ruby on Rails', 'A <a href="http://goldberg.rubyforge.org">Goldberg</a> site', 1, 7200, 2, 1, 3, 4, 2, 3);


--
-- Data for TOC entry 55 (OID 26238)
-- Name: users; Type: TABLE DATA; Schema: public; Owner: david
--

INSERT INTO users (id, name, "password", role_id) VALUES (2, 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 3);


--
-- TOC entry 29 (OID 26309)
-- Name: content_pages_name_unique; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_name_unique UNIQUE (name);


--
-- TOC entry 30 (OID 26311)
-- Name: content_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 31 (OID 26313)
-- Name: controller_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY controller_actions
    ADD CONSTRAINT controller_actions_pkey PRIMARY KEY (id);


--
-- TOC entry 32 (OID 26315)
-- Name: markup_styles_name_unique; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY markup_styles
    ADD CONSTRAINT markup_styles_name_unique UNIQUE (name);


--
-- TOC entry 33 (OID 26317)
-- Name: markup_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY markup_styles
    ADD CONSTRAINT markup_styles_pkey PRIMARY KEY (id);


--
-- TOC entry 34 (OID 26319)
-- Name: menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- TOC entry 35 (OID 26321)
-- Name: permissions_name_unique; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_name_unique UNIQUE (name);


--
-- TOC entry 36 (OID 26323)
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 38 (OID 26325)
-- Name: roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 37 (OID 26327)
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 39 (OID 26329)
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 40 (OID 26331)
-- Name: site_controllers_name_unique; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY site_controllers
    ADD CONSTRAINT site_controllers_name_unique UNIQUE (name);


--
-- TOC entry 41 (OID 26333)
-- Name: site_controllers_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY site_controllers
    ADD CONSTRAINT site_controllers_pkey PRIMARY KEY (id);


--
-- TOC entry 42 (OID 26335)
-- Name: system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 43 (OID 26337)
-- Name: users_name_unique; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_name_unique UNIQUE (name);


--
-- TOC entry 44 (OID 26339)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 56 (OID 26341)
-- Name: content_pages_markup_style_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_markup_style_fkey FOREIGN KEY (markup_style_id) REFERENCES markup_styles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 57 (OID 26345)
-- Name: content_pages_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 58 (OID 26349)
-- Name: controller_actions_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY controller_actions
    ADD CONSTRAINT controller_actions_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 59 (OID 26353)
-- Name: controller_actions_site_controller_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY controller_actions
    ADD CONSTRAINT controller_actions_site_controller_fkey FOREIGN KEY (site_controller_id) REFERENCES site_controllers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 63 (OID 26357)
-- Name: default_page_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT default_page_id FOREIGN KEY (default_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 60 (OID 26361)
-- Name: menu_items_content_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_content_page_fkey FOREIGN KEY (content_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 61 (OID 26365)
-- Name: menu_items_controller_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_controller_action_fkey FOREIGN KEY (controller_action_id) REFERENCES controller_actions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 62 (OID 26369)
-- Name: menu_items_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_parent_fkey FOREIGN KEY (parent_id) REFERENCES menu_items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 64 (OID 26373)
-- Name: roles_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_parent_fkey FOREIGN KEY (parent_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 65 (OID 26377)
-- Name: roles_permissions_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 66 (OID 26381)
-- Name: roles_permissions_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_role_fkey FOREIGN KEY (role_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 67 (OID 26385)
-- Name: site_controllers_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY site_controllers
    ADD CONSTRAINT site_controllers_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 68 (OID 26389)
-- Name: system_settings_default_markup_style_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_default_markup_style_fkey FOREIGN KEY (default_markup_style_id) REFERENCES markup_styles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 69 (OID 26393)
-- Name: system_settings_not_found_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_not_found_page_fkey FOREIGN KEY (not_found_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 70 (OID 26397)
-- Name: system_settings_permission_denied_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_permission_denied_page_fkey FOREIGN KEY (permission_denied_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 71 (OID 26401)
-- Name: system_settings_public_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_public_role_fkey FOREIGN KEY (public_role_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 72 (OID 26405)
-- Name: system_settings_session_expired_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_session_expired_page_fkey FOREIGN KEY (session_expired_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 73 (OID 26409)
-- Name: system_settings_site_default_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_site_default_page_fkey FOREIGN KEY (site_default_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 74 (OID 26413)
-- Name: users_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_role_fkey FOREIGN KEY (role_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 18 (OID 26177)
-- Name: content_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('content_pages_id_seq', 9, true);


--
-- TOC entry 19 (OID 26185)
-- Name: controller_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('controller_actions_id_seq', 15, true);


--
-- TOC entry 20 (OID 26190)
-- Name: markup_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('markup_styles_id_seq', 2, true);


--
-- TOC entry 21 (OID 26195)
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('menu_items_id_seq', 13, true);


--
-- TOC entry 22 (OID 26200)
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('permissions_id_seq', 5, true);


--
-- TOC entry 23 (OID 26205)
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('roles_id_seq', 3, true);


--
-- TOC entry 24 (OID 26213)
-- Name: roles_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('roles_permissions_id_seq', 10, true);


--
-- TOC entry 25 (OID 26218)
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('sessions_id_seq', 1, false);


--
-- TOC entry 26 (OID 26226)
-- Name: site_controllers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('site_controllers_id_seq', 11, true);


--
-- TOC entry 27 (OID 26231)
-- Name: system_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('system_settings_id_seq', 1, true);


--
-- TOC entry 28 (OID 26236)
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval('users_id_seq', 2, true);


--
-- TOC entry 3 (OID 2200)
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


