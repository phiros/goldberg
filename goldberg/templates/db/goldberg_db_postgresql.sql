--
-- PostgreSQL database dump
--

-- Started on 2006-08-25 21:43:12 EST

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1632 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 276 (class 2612 OID 17268)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: 
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1211 (class 1259 OID 17271)
-- Dependencies: 5
-- Name: content_pages; Type: TABLE; Schema: public; Owner: david; Tablespace: 
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
-- TOC entry 1634 (class 0 OID 0)
-- Dependencies: 1210
-- Name: content_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('content_pages', 'id'), 9, true);


--
-- TOC entry 1213 (class 1259 OID 17279)
-- Dependencies: 5
-- Name: controller_actions; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE controller_actions (
    id serial NOT NULL,
    site_controller_id integer NOT NULL,
    name character varying(255) NOT NULL,
    permission_id integer
);


--
-- TOC entry 1635 (class 0 OID 0)
-- Dependencies: 1212
-- Name: controller_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('controller_actions', 'id'), 15, true);


--
-- TOC entry 1215 (class 1259 OID 17284)
-- Dependencies: 5
-- Name: markup_styles; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE markup_styles (
    id serial NOT NULL,
    name character varying(255)
);


--
-- TOC entry 1636 (class 0 OID 0)
-- Dependencies: 1214
-- Name: markup_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('markup_styles', 'id'), 2, true);


--
-- TOC entry 1217 (class 1259 OID 17289)
-- Dependencies: 5
-- Name: menu_items; Type: TABLE; Schema: public; Owner: david; Tablespace: 
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
-- TOC entry 1637 (class 0 OID 0)
-- Dependencies: 1216
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('menu_items', 'id'), 13, true);


--
-- TOC entry 1219 (class 1259 OID 17297)
-- Dependencies: 5
-- Name: permissions; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE permissions (
    id serial NOT NULL,
    name character varying(255)
);


--
-- TOC entry 1638 (class 0 OID 0)
-- Dependencies: 1218
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('permissions', 'id'), 5, true);


--
-- TOC entry 1221 (class 1259 OID 17302)
-- Dependencies: 5
-- Name: roles; Type: TABLE; Schema: public; Owner: david; Tablespace: 
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
-- TOC entry 1639 (class 0 OID 0)
-- Dependencies: 1220
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('roles', 'id'), 3, true);


--
-- TOC entry 1223 (class 1259 OID 17310)
-- Dependencies: 5
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE roles_permissions (
    id serial NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- TOC entry 1640 (class 0 OID 0)
-- Dependencies: 1222
-- Name: roles_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('roles_permissions', 'id'), 10, true);


--
-- TOC entry 1225 (class 1259 OID 17315)
-- Dependencies: 5
-- Name: sessions; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE sessions (
    id serial NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


--
-- TOC entry 1641 (class 0 OID 0)
-- Dependencies: 1224
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('sessions', 'id'), 1, false);


--
-- TOC entry 1227 (class 1259 OID 17323)
-- Dependencies: 5
-- Name: site_controllers; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE site_controllers (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    permission_id integer NOT NULL,
    builtin integer
);


--
-- TOC entry 1642 (class 0 OID 0)
-- Dependencies: 1226
-- Name: site_controllers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('site_controllers', 'id'), 11, true);


--
-- TOC entry 1229 (class 1259 OID 17328)
-- Dependencies: 5
-- Name: system_settings; Type: TABLE; Schema: public; Owner: david; Tablespace: 
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
-- TOC entry 1643 (class 0 OID 0)
-- Dependencies: 1228
-- Name: system_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('system_settings', 'id'), 1, true);


--
-- TOC entry 1231 (class 1259 OID 17336)
-- Dependencies: 5
-- Name: users; Type: TABLE; Schema: public; Owner: david; Tablespace: 
--

CREATE TABLE users (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    "password" character varying(40) NOT NULL,
    role_id integer NOT NULL
);


--
-- TOC entry 1644 (class 0 OID 0)
-- Dependencies: 1230
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: david
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('users', 'id'), 2, true);


--
-- TOC entry 1232 (class 1259 OID 17339)
-- Dependencies: 1299 5
-- Name: view_controller_actions; Type: VIEW; Schema: public; Owner: david
--

CREATE VIEW view_controller_actions AS
    SELECT controller_actions.id, site_controllers.id AS site_controller_id, site_controllers.name AS site_controller_name, controller_actions.name, COALESCE(controller_actions.permission_id, site_controllers.permission_id) AS permission_id FROM (site_controllers JOIN controller_actions ON ((site_controllers.id = controller_actions.site_controller_id)));


--
-- TOC entry 1233 (class 1259 OID 17342)
-- Dependencies: 1300 5
-- Name: view_menu_items; Type: VIEW; Schema: public; Owner: david
--

CREATE VIEW view_menu_items AS
    SELECT menu_items.id AS menu_item_id, menu_items.name AS menu_item_name, menu_items.label AS menu_item_label, menu_items.seq AS menu_item_seq, menu_items.parent_id AS menu_item_parent_id, view_controller_actions.site_controller_id, view_controller_actions.site_controller_name, view_controller_actions.id AS controller_action_id, view_controller_actions.name AS controller_action_name, content_pages.id AS content_page_id, content_pages.name AS content_page_name, content_pages.title AS content_page_title, permissions.id AS permission_id, permissions.name AS permission_name FROM ((((menu_items LEFT JOIN view_controller_actions ON ((menu_items.controller_action_id = view_controller_actions.id))) LEFT JOIN content_pages ON (((menu_items.content_page_id = content_pages.id) AND (menu_items.controller_action_id IS NULL)))) LEFT JOIN markup_styles ON ((content_pages.markup_style_id = markup_styles.id))) JOIN permissions ON ((COALESCE(view_controller_actions.permission_id, content_pages.permission_id) = permissions.id)));


--
-- TOC entry 1619 (class 0 OID 17271)
-- Dependencies: 1211
-- Data for Name: content_pages; Type: TABLE DATA; Schema: public; Owner: david
--

COPY content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) FROM stdin;
1	Home Page	home	2	h1. Welcome to Goldberg!\r\n\r\nLooks like you have succeeded in getting Goldberg up and running.  Now you will probably want to customise your site.\r\n\r\n*Very important:* The default login for the administrator is "admin", password "admin".  You must change that before you make your site public!\r\n\r\n\r\nh2. Administering the Site\r\n\r\nAt the login prompt, enter an administrator username and password.  The top menu should change: a new item called "Administration" will appear.  Go there for further details.\r\n\r\n\r\nh2. Further Assistance\r\n\r\nSee [Contact Us](/menu/contact_us), above, for links to the Goldberg website and project page.\r\n\r\n\r\n	3	2006-06-12 00:31:56	2006-08-25 14:30:37
2	Session Expired	expired	2	h1. Session Expired\r\n\r\nYour session has expired due to inactivity.\r\n\r\nPlease log in again.\r\n	3	2006-06-12 00:33:14	2006-08-25 12:57:36
3	Not Found	notfound	2	h1. Not Found\r\n\r\nThe page you requested was not found.  \r\n\r\nPlease check the URL, or contact your system administrator.	3	2006-06-12 00:33:49	2006-08-25 12:56:44
4	Permission Denied!	denied	2	h1. Permission Denied!\r\n\r\nSorry, but you don't have permission to view that page.\r\n\r\nPlease contact your system administrator.	3	2006-06-12 00:34:30	2006-08-25 12:55:45
6	Contact Us	contact_us	2	h1. Contact Us\r\n\r\nVisit the Goldberg Project Homepage at [http://goldberg.rubyforge.org](http://goldberg.rubyforge.org) for further information on Goldberg.  Visit the Goldberg RubyForge Project Page at [http://rubyforge.org/projects/goldberg](http://rubyforge.org/projects/goldberg/) to access the project's files and development information.  The Project page has forums and a mailing list for Goldberg users.\r\n\r\nh2. Credits\r\n\r\nThe default Goldberg site layout is based on Andreas Viklund's excellent template "Andreas09".  Andreas is widely known as the designer of some of the finest open source web templates.  His website is at [http://andreasviklund.com](http://andreasviklund.com).\r\n\r\n	3	2006-06-12 10:13:47	2006-08-25 14:33:32
8	Site Administration	site_admin	2	h1. Goldberg Setup\r\n\r\nThis is where you will find all the Goldberg-specific administration and configuration features.  In here you can:\r\n\r\n* Set up Users.\r\n\r\n* Manage Roles and their Permissions.\r\n\r\n* Set up any Controllers and their Actions for your application.\r\n\r\n* Edit the Content Pages of the site.\r\n\r\n* Adjust Goldberg's system settings.\r\n\r\n\r\nh2. Users\r\n\r\nYou can set up Users with a username, password and a Role.\r\n\r\n\r\nh2. Roles and Permissions\r\n\r\nA User's Permissions affect what Actions they can perform and what Pages they can see.  And because each Menu Item is based either on a Page or an Action, the Permissions determine what Menu Items the User can and cannot see.\r\n\r\nA Role is a set of Permissions.  Roles are assigned to Users.  Roles are hierarchical: a Role can have a parent Role; and if so it will inherit the Permissions of the parent Role, and all its parents.\r\n\r\n\r\nh2. Controllers and Actions\r\n\r\nTo execute any Action, a user must have the appropriate Permission.  Therefore all Controllers and Actions you set up for your Rails application need to be entered here, otherwise no user will be able to execute them.\r\n\r\nYou start by setting up the Controller and assigning it a Permission.  The Permission will be used as the default for any Actions invoked for that Controller.\r\n\r\nYou have the option of setting up specific Actions for the Controllers.  You would want to do that if the Action were to appear as a Menu Item, or if it were to have a different level of security to the default for the Controller.\r\n\r\n\r\nh2. Content Pages\r\n\r\nGoldberg has a very simple CMS built in.  You can create pages to be displayed on the site, possibly in menu items.\r\n\r\n\r\nh2. Menu Editor\r\n\r\nOnce you have set up your Controller Actions and Content Pages, you can put them into the site's menu using the Menu Editor.\r\n\r\nIn the Menu Editor you can add and remove Menu Items and move them around.  The security of a Menu Item (whether the user can see it or not) depends on the Permission of the Action or Page attached to that Menu Item.\r\n\r\nh2. System Settings\r\n\r\nGo here to view and edit the settings that determine how Goldberg operates.\r\n	1	2006-06-21 21:32:35	2006-08-18 23:05:56
9	Administration	admin	2	h1. Site Administration\r\n\r\nThis is where the administrator can set up the site.\r\n\r\nThere is one menu item here by default -- [Setup](/menu/setup).  That contains all the Goldberg configuration options.\r\n\r\nYou can add more menu items here to administer your application if you want, by going to [Setup, Menu Editor](/menu/setup/menus).  \r\n	1	2006-06-26 16:47:09	2006-08-18 22:51:34
\.


--
-- TOC entry 1620 (class 0 OID 17279)
-- Dependencies: 1213
-- Data for Name: controller_actions; Type: TABLE DATA; Schema: public; Owner: david
--

COPY controller_actions (id, site_controller_id, name, permission_id) FROM stdin;
1	1	view_default	3
2	1	view	3
3	7	list	\N
4	6	list	\N
5	3	login	4
6	3	logout	4
7	5	link	4
8	1	list	\N
9	8	list	\N
10	2	list	\N
11	5	list	\N
12	9	list	\N
13	3	forgotten	4
14	3	login_failed	4
15	10	list	\N
\.


--
-- TOC entry 1621 (class 0 OID 17284)
-- Dependencies: 1215
-- Data for Name: markup_styles; Type: TABLE DATA; Schema: public; Owner: david
--

COPY markup_styles (id, name) FROM stdin;
1	Textile
2	Markdown
\.


--
-- TOC entry 1622 (class 0 OID 17289)
-- Dependencies: 1217
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: david
--

COPY menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) FROM stdin;
1	\N	home	Home	1	\N	1
2	\N	contact_us	Contact Us	3	\N	6
3	\N	admin	Administration	2	\N	9
9	3	setup	Setup	1	\N	8
5	9	setup/permissions	Permissions	3	4	\N
6	9	setup/roles	Roles	2	3	\N
7	9	setup/pages	Content Pages	5	8	\N
8	9	setup/controllers	Controllers / Actions	4	9	\N
11	9	setup/menus	Menu Editor	6	11	\N
12	9	setup/system_settings	System Settings	7	12	\N
13	9	setup/users	Users	1	15	\N
\.


--
-- TOC entry 1623 (class 0 OID 17297)
-- Dependencies: 1219
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: david
--

COPY permissions (id, name) FROM stdin;
1	Administer site
2	Public pages - edit
3	Public pages - view
4	Public actions - execute
5	Members only page -- view
\.


--
-- TOC entry 1624 (class 0 OID 17302)
-- Dependencies: 1221
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: david
--

COPY roles (id, name, parent_id, description, default_page_id, "cache", created_at, updated_at) FROM stdin;
1	Public	\N	Members of the public who are not logged in.	\N	\N	2006-06-23 21:03:49	2006-08-25 14:33:32
2	Member	1		\N	\N	2006-06-23 21:03:50	2006-08-25 14:33:32
3	Administrator	2		8	\N	2006-06-23 21:03:48	2006-08-25 14:33:33
\.


--
-- TOC entry 1625 (class 0 OID 17310)
-- Dependencies: 1223
-- Data for Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: david
--

COPY roles_permissions (id, role_id, permission_id) FROM stdin;
4	3	1
6	1	3
7	3	2
9	1	4
10	2	5
\.


--
-- TOC entry 1626 (class 0 OID 17315)
-- Dependencies: 1225
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: david
--

COPY sessions (id, session_id, data, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 1627 (class 0 OID 17323)
-- Dependencies: 1227
-- Data for Name: site_controllers; Type: TABLE DATA; Schema: public; Owner: david
--

COPY site_controllers (id, name, permission_id, builtin) FROM stdin;
1	content_pages	1	1
2	controller_actions	1	1
3	auth	1	1
4	markup_styles	1	1
5	menu_items	1	1
6	permissions	1	1
7	roles	1	1
8	site_controllers	1	1
9	system_settings	1	1
10	users	1	1
11	roles_permissions	1	1
\.


--
-- TOC entry 1628 (class 0 OID 17328)
-- Dependencies: 1229
-- Data for Name: system_settings; Type: TABLE DATA; Schema: public; Owner: david
--

COPY system_settings (id, site_name, site_subtitle, footer_message, public_role_id, session_timeout, default_markup_style_id, site_default_page_id, not_found_page_id, permission_denied_page_id, session_expired_page_id, menu_depth) FROM stdin;
1	Goldberg	A website development tool for Ruby on Rails	A <a href="http://goldberg.rubyforge.org">Goldberg</a> site	1	7200	2	1	3	4	2	3
\.


--
-- TOC entry 1629 (class 0 OID 17336)
-- Dependencies: 1231
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: david
--

COPY users (id, name, "password", role_id) FROM stdin;
2	admin	d033e22ae348aeb5660fc2140aec35850c4da997	3
\.


--
-- TOC entry 1569 (class 2606 OID 17347)
-- Dependencies: 1211 1211
-- Name: content_pages_name_unique; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_name_unique UNIQUE (name);


--
-- TOC entry 1571 (class 2606 OID 17349)
-- Dependencies: 1211 1211
-- Name: content_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 1573 (class 2606 OID 17351)
-- Dependencies: 1213 1213
-- Name: controller_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY controller_actions
    ADD CONSTRAINT controller_actions_pkey PRIMARY KEY (id);


--
-- TOC entry 1575 (class 2606 OID 17353)
-- Dependencies: 1215 1215
-- Name: markup_styles_name_unique; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY markup_styles
    ADD CONSTRAINT markup_styles_name_unique UNIQUE (name);


--
-- TOC entry 1577 (class 2606 OID 17355)
-- Dependencies: 1215 1215
-- Name: markup_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY markup_styles
    ADD CONSTRAINT markup_styles_pkey PRIMARY KEY (id);


--
-- TOC entry 1579 (class 2606 OID 17357)
-- Dependencies: 1217 1217
-- Name: menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- TOC entry 1581 (class 2606 OID 17359)
-- Dependencies: 1219 1219
-- Name: permissions_name_unique; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_name_unique UNIQUE (name);


--
-- TOC entry 1583 (class 2606 OID 17361)
-- Dependencies: 1219 1219
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1587 (class 2606 OID 17363)
-- Dependencies: 1223 1223
-- Name: roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1585 (class 2606 OID 17365)
-- Dependencies: 1221 1221
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 1589 (class 2606 OID 17367)
-- Dependencies: 1225 1225
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 1591 (class 2606 OID 17369)
-- Dependencies: 1227 1227
-- Name: site_controllers_name_unique; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY site_controllers
    ADD CONSTRAINT site_controllers_name_unique UNIQUE (name);


--
-- TOC entry 1593 (class 2606 OID 17371)
-- Dependencies: 1227 1227
-- Name: site_controllers_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY site_controllers
    ADD CONSTRAINT site_controllers_pkey PRIMARY KEY (id);


--
-- TOC entry 1595 (class 2606 OID 17373)
-- Dependencies: 1229 1229
-- Name: system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 1597 (class 2606 OID 17375)
-- Dependencies: 1231 1231
-- Name: users_name_unique; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_name_unique UNIQUE (name);


--
-- TOC entry 1599 (class 2606 OID 17377)
-- Dependencies: 1231 1231
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: david; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1600 (class 2606 OID 17378)
-- Dependencies: 1211 1215 1576
-- Name: content_pages_markup_style_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_markup_style_fkey FOREIGN KEY (markup_style_id) REFERENCES markup_styles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1601 (class 2606 OID 17383)
-- Dependencies: 1211 1219 1582
-- Name: content_pages_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1602 (class 2606 OID 17388)
-- Dependencies: 1213 1219 1582
-- Name: controller_actions_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY controller_actions
    ADD CONSTRAINT controller_actions_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1603 (class 2606 OID 17393)
-- Dependencies: 1213 1227 1592
-- Name: controller_actions_site_controller_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY controller_actions
    ADD CONSTRAINT controller_actions_site_controller_fkey FOREIGN KEY (site_controller_id) REFERENCES site_controllers(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1607 (class 2606 OID 17398)
-- Dependencies: 1221 1211 1570
-- Name: default_page_id; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT default_page_id FOREIGN KEY (default_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1604 (class 2606 OID 17403)
-- Dependencies: 1217 1211 1570
-- Name: menu_items_content_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_content_page_fkey FOREIGN KEY (content_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1605 (class 2606 OID 17408)
-- Dependencies: 1217 1213 1572
-- Name: menu_items_controller_action_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_controller_action_fkey FOREIGN KEY (controller_action_id) REFERENCES controller_actions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1606 (class 2606 OID 17413)
-- Dependencies: 1217 1217 1578
-- Name: menu_items_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_parent_fkey FOREIGN KEY (parent_id) REFERENCES menu_items(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1608 (class 2606 OID 17418)
-- Dependencies: 1221 1221 1584
-- Name: roles_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_parent_fkey FOREIGN KEY (parent_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1609 (class 2606 OID 17423)
-- Dependencies: 1223 1219 1582
-- Name: roles_permissions_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1610 (class 2606 OID 17428)
-- Dependencies: 1223 1221 1584
-- Name: roles_permissions_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_role_fkey FOREIGN KEY (role_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1611 (class 2606 OID 17433)
-- Dependencies: 1227 1219 1582
-- Name: site_controllers_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY site_controllers
    ADD CONSTRAINT site_controllers_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1612 (class 2606 OID 17438)
-- Dependencies: 1229 1215 1576
-- Name: system_settings_default_markup_style_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_default_markup_style_fkey FOREIGN KEY (default_markup_style_id) REFERENCES markup_styles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1613 (class 2606 OID 17443)
-- Dependencies: 1229 1211 1570
-- Name: system_settings_not_found_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_not_found_page_fkey FOREIGN KEY (not_found_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1614 (class 2606 OID 17448)
-- Dependencies: 1229 1211 1570
-- Name: system_settings_permission_denied_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_permission_denied_page_fkey FOREIGN KEY (permission_denied_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1615 (class 2606 OID 17453)
-- Dependencies: 1229 1221 1584
-- Name: system_settings_public_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_public_role_fkey FOREIGN KEY (public_role_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1616 (class 2606 OID 17458)
-- Dependencies: 1229 1211 1570
-- Name: system_settings_session_expired_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_session_expired_page_fkey FOREIGN KEY (session_expired_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1617 (class 2606 OID 17463)
-- Dependencies: 1229 1211 1570
-- Name: system_settings_site_default_page_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_site_default_page_fkey FOREIGN KEY (site_default_page_id) REFERENCES content_pages(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1618 (class 2606 OID 17468)
-- Dependencies: 1231 1221 1584
-- Name: users_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: david
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_role_fkey FOREIGN KEY (role_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1633 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2006-08-25 21:43:13 EST

--
-- PostgreSQL database dump complete
--

