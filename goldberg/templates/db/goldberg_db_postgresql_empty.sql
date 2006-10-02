--
-- PostgreSQL database dump
--

-- Started on 2006-08-22 14:44:34 AUS Eastern Standard Time

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1612 (class 1262 OID 16403)
-- Name: goldberg; Type: DATABASE; Schema: -; Owner: postgres
--

-- CREATE DATABASE goldberg WITH TEMPLATE = template0 ENCODING = 'UTF8';


-- ALTER DATABASE goldberg OWNER TO postgres;

\connect goldberg

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1613 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 278 (class 2612 OID 16386)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: 
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 1213 (class 1259 OID 16416)
-- Dependencies: 4
-- Name: content_pages; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


-- ALTER TABLE public.content_pages OWNER TO postgres;

--
-- TOC entry 1615 (class 0 OID 0)
-- Dependencies: 1212
-- Name: content_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('content_pages', 'id'), 1, false);


--
-- TOC entry 1215 (class 1259 OID 16426)
-- Dependencies: 4
-- Name: controller_actions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE controller_actions (
    id serial NOT NULL,
    site_controller_id integer NOT NULL,
    name character varying(255) NOT NULL,
    permission_id integer
);


-- ALTER TABLE public.controller_actions OWNER TO postgres;

--
-- TOC entry 1616 (class 0 OID 0)
-- Dependencies: 1214
-- Name: controller_actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('controller_actions', 'id'), 1, false);


--
-- TOC entry 1217 (class 1259 OID 16433)
-- Dependencies: 4
-- Name: markup_styles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE markup_styles (
    id serial NOT NULL,
    name character varying(255)
);


-- ALTER TABLE public.markup_styles OWNER TO postgres;

--
-- TOC entry 1617 (class 0 OID 0)
-- Dependencies: 1216
-- Name: markup_styles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('markup_styles', 'id'), 1, false);


--
-- TOC entry 1219 (class 1259 OID 16440)
-- Dependencies: 4
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


-- ALTER TABLE public.menu_items OWNER TO postgres;

--
-- TOC entry 1618 (class 0 OID 0)
-- Dependencies: 1218
-- Name: menu_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('menu_items', 'id'), 1, false);


--
-- TOC entry 1221 (class 1259 OID 16450)
-- Dependencies: 4
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE permissions (
    id serial NOT NULL,
    name character varying(255)
);


-- ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 1619 (class 0 OID 0)
-- Dependencies: 1220
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('permissions', 'id'), 1, false);


--
-- TOC entry 1223 (class 1259 OID 16457)
-- Dependencies: 4
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


-- ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 1620 (class 0 OID 0)
-- Dependencies: 1222
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('roles', 'id'), 1, false);


--
-- TOC entry 1225 (class 1259 OID 16467)
-- Dependencies: 4
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles_permissions (
    id serial NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL
);


-- ALTER TABLE public.roles_permissions OWNER TO postgres;

--
-- TOC entry 1621 (class 0 OID 0)
-- Dependencies: 1224
-- Name: roles_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('roles_permissions', 'id'), 1, false);


--
-- TOC entry 1227 (class 1259 OID 16484)
-- Dependencies: 4
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sessions (
    id serial NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


-- ALTER TABLE public.sessions OWNER TO postgres;

--
-- TOC entry 1622 (class 0 OID 0)
-- Dependencies: 1226
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('sessions', 'id'), 1, false);


--
-- TOC entry 1229 (class 1259 OID 16494)
-- Dependencies: 4
-- Name: site_controllers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE site_controllers (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    permission_id integer NOT NULL,
    builtin integer
);


-- ALTER TABLE public.site_controllers OWNER TO postgres;

--
-- TOC entry 1623 (class 0 OID 0)
-- Dependencies: 1228
-- Name: site_controllers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('site_controllers', 'id'), 1, false);


--
-- TOC entry 1231 (class 1259 OID 16501)
-- Dependencies: 4
-- Name: system_settings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
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


-- ALTER TABLE public.system_settings OWNER TO postgres;

--
-- TOC entry 1624 (class 0 OID 0)
-- Dependencies: 1230
-- Name: system_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('system_settings', 'id'), 1, false);


--
-- TOC entry 1233 (class 1259 OID 16511)
-- Dependencies: 4
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id serial NOT NULL,
    name character varying(255) NOT NULL,
    "password" character varying(40) NOT NULL,
    role_id integer NOT NULL
);


-- ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 1626 (class 0 OID 0)
-- Dependencies: 1232
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('users', 'id'), 1, false);


--
-- TOC entry 1234 (class 1259 OID 16516)
-- Dependencies: 1303 4
-- Name: view_controller_actions; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_controller_actions AS
    SELECT controller_actions.id, site_controllers.id AS site_controller_id, site_controllers.name AS site_controller_name, controller_actions.name, COALESCE(controller_actions.permission_id, site_controllers.permission_id) AS permission_id FROM (site_controllers JOIN controller_actions ON ((site_controllers.id = controller_actions.site_controller_id)));


-- ALTER TABLE public.view_controller_actions OWNER TO postgres;

--
-- TOC entry 1235 (class 1259 OID 16519)
-- Dependencies: 1304 4
-- Name: view_menu_items; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW view_menu_items AS
    SELECT menu_items.id AS menu_item_id, menu_items.name AS menu_item_name, menu_items.label AS menu_item_label, menu_items.seq AS menu_item_seq, menu_items.parent_id AS menu_item_parent_id, view_controller_actions.site_controller_id, view_controller_actions.site_controller_name, view_controller_actions.id AS controller_action_id, view_controller_actions.name AS controller_action_name, content_pages.id AS content_page_id, content_pages.name AS content_page_name, content_pages.title AS content_page_title, permissions.id AS permission_id, permissions.name AS permission_name FROM ((((menu_items LEFT JOIN view_controller_actions ON ((menu_items.controller_action_id = view_controller_actions.id))) LEFT JOIN content_pages ON (((menu_items.content_page_id = content_pages.id) AND (menu_items.controller_action_id IS NULL)))) LEFT JOIN markup_styles ON ((content_pages.markup_style_id = markup_styles.id))) JOIN permissions ON ((COALESCE(view_controller_actions.permission_id, content_pages.permission_id) = permissions.id)));


-- ALTER TABLE public.view_menu_items OWNER TO postgres;

--
-- TOC entry 1599 (class 0 OID 16416)
-- Dependencies: 1213
-- Data for Name: content_pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY content_pages (id, title, name, markup_style_id, content, permission_id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 1600 (class 0 OID 16426)
-- Dependencies: 1215
-- Data for Name: controller_actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY controller_actions (id, site_controller_id, name, permission_id) FROM stdin;
\.


--
-- TOC entry 1601 (class 0 OID 16433)
-- Dependencies: 1217
-- Data for Name: markup_styles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY markup_styles (id, name) FROM stdin;
\.


--
-- TOC entry 1602 (class 0 OID 16440)
-- Dependencies: 1219
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menu_items (id, parent_id, name, label, seq, controller_action_id, content_page_id) FROM stdin;
\.


--
-- TOC entry 1603 (class 0 OID 16450)
-- Dependencies: 1221
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY permissions (id, name) FROM stdin;
\.


--
-- TOC entry 1604 (class 0 OID 16457)
-- Dependencies: 1223
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (id, name, parent_id, description, default_page_id, "cache", created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 1605 (class 0 OID 16467)
-- Dependencies: 1225
-- Data for Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles_permissions (id, role_id, permission_id) FROM stdin;
\.


--
-- TOC entry 1606 (class 0 OID 16484)
-- Dependencies: 1227
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (id, session_id, data, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 1607 (class 0 OID 16494)
-- Dependencies: 1229
-- Data for Name: site_controllers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY site_controllers (id, name, permission_id, builtin) FROM stdin;
\.


--
-- TOC entry 1608 (class 0 OID 16501)
-- Dependencies: 1231
-- Data for Name: system_settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY system_settings (id, site_name, site_subtitle, footer_message, public_role_id, session_timeout, default_markup_style_id, site_default_page_id, not_found_page_id, permission_denied_page_id, session_expired_page_id, menu_depth) FROM stdin;
\.


--
-- TOC entry 1609 (class 0 OID 16511)
-- Dependencies: 1233
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY users (id, name, "password", role_id) FROM stdin;
\.


--
-- TOC entry 1574 (class 2606 OID 16423)
-- Dependencies: 1213 1213
-- Name: content_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY content_pages
    ADD CONSTRAINT content_pages_pkey PRIMARY KEY (id);


--
-- TOC entry 1576 (class 2606 OID 16430)
-- Dependencies: 1215 1215
-- Name: controller_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY controller_actions
    ADD CONSTRAINT controller_actions_pkey PRIMARY KEY (id);


--
-- TOC entry 1578 (class 2606 OID 16437)
-- Dependencies: 1217 1217
-- Name: markup_styles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY markup_styles
    ADD CONSTRAINT markup_styles_pkey PRIMARY KEY (id);


--
-- TOC entry 1580 (class 2606 OID 16447)
-- Dependencies: 1219 1219
-- Name: menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (id);


--
-- TOC entry 1582 (class 2606 OID 16454)
-- Dependencies: 1221 1221
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1586 (class 2606 OID 16471)
-- Dependencies: 1225 1225
-- Name: roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 1584 (class 2606 OID 16464)
-- Dependencies: 1223 1223
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 1588 (class 2606 OID 16491)
-- Dependencies: 1227 1227
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 1590 (class 2606 OID 16498)
-- Dependencies: 1229 1229
-- Name: site_controllers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY site_controllers
    ADD CONSTRAINT site_controllers_pkey PRIMARY KEY (id);


--
-- TOC entry 1592 (class 2606 OID 16508)
-- Dependencies: 1231 1231
-- Name: system_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY system_settings
    ADD CONSTRAINT system_settings_pkey PRIMARY KEY (id);


--
-- TOC entry 1594 (class 2606 OID 16515)
-- Dependencies: 1233 1233
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 1598 (class 2606 OID 16477)
-- Dependencies: 1225 1221 1581
-- Name: roles_permissions_permission_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_permission_fkey FOREIGN KEY (permission_id) REFERENCES permissions(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1597 (class 2606 OID 16472)
-- Dependencies: 1225 1583 1223
-- Name: roles_permissions_role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_role_fkey FOREIGN KEY (role_id) REFERENCES roles(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 1614 (class 0 OID 0)
-- Dependencies: 4
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2006-08-22 14:44:34 AUS Eastern Standard Time

--
-- PostgreSQL database dump complete
--

