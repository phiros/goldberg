-- MySQL dump 10.10
--
-- Host: localhost    Database: goldberg
-- ------------------------------------------------------
-- Server version	5.0.22-Debian_0ubuntu6.06-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `content_pages`
--

DROP TABLE IF EXISTS `content_pages`;
CREATE TABLE `content_pages` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `name` varchar(255) NOT NULL,
  `markup_style_id` int(11) default NULL,
  `content` text,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `fk_content_page_permission_id` (`permission_id`),
  KEY `fk_content_page_markup_style_id` (`markup_style_id`),
  CONSTRAINT `fk_content_page_markup_style_id` FOREIGN KEY (`markup_style_id`) REFERENCES `markup_styles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_content_page_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `content_pages`
--


/*!40000 ALTER TABLE `content_pages` DISABLE KEYS */;
LOCK TABLES `content_pages` WRITE;
INSERT INTO `content_pages` VALUES (1,'Home Page','home',2,'h1. Welcome to Goldberg!\r\n\r\nLooks like you have succeeded in getting Goldberg up and running.  Now you will probably want to customise your site.\r\n\r\n*Very important:* The default login for the administrator is \"admin\", password \"admin\".  You must change that before you make your site public!\r\n\r\nh2. Administering the Site\r\n\r\nAt the login prompt, enter an administrator username and password.  The top menu should change: a new item called \"Administration\" will appear.  Go there for further details.\r\n\r\n\r\n',3,'2006-06-11 14:31:56','2006-08-16 10:58:41'),(2,'Session Expired','expired',NULL,'Your session has expired.',3,'2006-06-11 14:33:14','2006-06-11 14:33:14'),(3,'Not Found!','notfound',2,'h1. Not Found\r\n\r\nThe page you requested was not found!',3,'2006-06-11 14:33:49','2006-08-04 10:42:16'),(4,'Permission Denied!','denied',NULL,'Sorry, but you don\'t have permission to view that page.\r\n\r\nPlease contact your system administrator.',3,'2006-06-11 14:34:30','2006-06-11 14:34:30'),(6,'Contact Us','contact_us',2,'h1. Contact Us\r\n\r\nYou can visit the [Goldberg Project Homepage](http://goldberg.rubyforge.org/), or go straight to the [Goldberg RubyForge Project Info Page](http://rubyforge.org/projects/goldberg/).\r\n\r\n\r\nh2. Credits\r\n\r\nThe default Goldberg site layout is based on Andreas Viklund\'s excellent template \"Andreas09\".  Andreas is widely known as the designer of some of the finest open source web templates.  His website is at [http://andreasviklund.com](http://andreasviklund.com).\r\n\r\n',3,'2006-06-12 00:13:47','2006-08-18 14:06:05'),(8,'Site Administration','site_admin',2,'h1. Goldberg Setup\r\n\r\nThis is where you will find all the Goldberg-specific administration and configuration features.  In here you can:\r\n\r\n* Set up Users.\r\n\r\n* Manage Roles and their Permissions.\r\n\r\n* Set up any Controllers and their Actions for your application.\r\n\r\n* Edit the Content Pages of the site.\r\n\r\n* Adjust Goldberg\'s system settings.\r\n\r\n\r\nh2. Users\r\n\r\nYou can set up Users with a username, password and a Role.\r\n\r\n\r\nh2. Roles and Permissions\r\n\r\nA User\'s Permissions affect what Actions they can perform and what Pages they can see.  And because each Menu Item is based either on a Page or an Action, the Permissions determine what Menu Items the User can and cannot see.\r\n\r\nA Role is a set of Permissions.  Roles are assigned to Users.  Roles are hierarchical: a Role can have a parent Role; and if so it will inherit the Permissions of the parent Role, and all its parents.\r\n\r\n\r\nh2. Controllers and Actions\r\n\r\nTo execute any Action, a user must have the appropriate Permission.  Therefore all Controllers and Actions you set up for your Rails application need to be entered here, otherwise no user will be able to execute them.\r\n\r\nYou start by setting up the Controller and assigning it a Permission.  The Permission will be used as the default for any Actions invoked for that Controller.\r\n\r\nYou have the option of setting up specific Actions for the Controllers.  You would want to do that if the Action were to appear as a Menu Item, or if it were to have a different level of security to the default for the Controller.\r\n\r\n\r\nh2. Content Pages\r\n\r\nGoldberg has a very simple CMS built in.  You can create pages to be displayed on the site, possibly in menu items.\r\n\r\n\r\nh2. Menu Editor\r\n\r\nOnce you have set up your Controller Actions and Content Pages, you can put them into the site\'s menu using the Menu Editor.\r\n\r\nIn the Menu Editor you can add and remove Menu Items and move them around.  The security of a Menu Item (whether the user can see it or not) depends on the Permission of the Action or Page attached to that Menu Item.\r\n\r\nh2. System Settings\r\n\r\nGo here to view and edit the settings that determine how Goldberg operates.\r\n',1,'2006-06-21 11:32:35','2006-08-18 13:05:56'),(9,'Administration','admin',2,'h1. Site Administration\r\n\r\nThis is where the administrator can set up the site.\r\n\r\nThere is one menu item here by default -- [Setup](/menu/setup).  That contains all the Goldberg configuration options.\r\n\r\nYou can add more menu items here to administer your application if you want, by going to [Setup, Menu Editor](/menu/setup/menus).  \r\n',1,'2006-06-26 06:47:09','2006-08-18 12:51:34');
UNLOCK TABLES;
/*!40000 ALTER TABLE `content_pages` ENABLE KEYS */;

--
-- Table structure for table `controller_actions`
--

DROP TABLE IF EXISTS `controller_actions`;
CREATE TABLE `controller_actions` (
  `id` int(11) NOT NULL auto_increment,
  `site_controller_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_controller_action_permission_id` (`permission_id`),
  KEY `fk_controller_action_site_controller_id` (`site_controller_id`),
  CONSTRAINT `fk_controller_action_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_controller_action_site_controller_id` FOREIGN KEY (`site_controller_id`) REFERENCES `site_controllers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `controller_actions`
--


/*!40000 ALTER TABLE `controller_actions` DISABLE KEYS */;
LOCK TABLES `controller_actions` WRITE;
INSERT INTO `controller_actions` VALUES (1,1,'view_default',3),(2,1,'view',3),(3,7,'list',NULL),(4,6,'list',NULL),(5,3,'login',4),(6,3,'logout',4),(7,5,'link',4),(8,1,'list',NULL),(9,8,'list',NULL),(10,2,'list',NULL),(11,5,'list',NULL),(12,9,'list',NULL),(13,3,'forgotten',4),(14,3,'login_failed',4),(15,10,'list',NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `controller_actions` ENABLE KEYS */;

--
-- Table structure for table `markup_styles`
--

DROP TABLE IF EXISTS `markup_styles`;
CREATE TABLE `markup_styles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `markup_styles`
--


/*!40000 ALTER TABLE `markup_styles` DISABLE KEYS */;
LOCK TABLES `markup_styles` WRITE;
INSERT INTO `markup_styles` VALUES (1,'Textile'),(2,'Markdown');
UNLOCK TABLES;
/*!40000 ALTER TABLE `markup_styles` ENABLE KEYS */;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `seq` int(11) default NULL,
  `controller_action_id` int(11) default NULL,
  `content_page_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_menu_item_controller_action_id` (`controller_action_id`),
  KEY `fk_menu_item_content_page_id` (`content_page_id`),
  KEY `fk_menu_item_parent_id` (`parent_id`),
  CONSTRAINT `fk_menu_item_content_page_id` FOREIGN KEY (`content_page_id`) REFERENCES `content_pages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_item_controller_action_id` FOREIGN KEY (`controller_action_id`) REFERENCES `controller_actions` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_item_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `menu_items` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_items`
--


/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
LOCK TABLES `menu_items` WRITE;
INSERT INTO `menu_items` VALUES (1,NULL,'home','Home',1,NULL,1),(2,NULL,'contact_us','Contact Us',3,NULL,6),(3,NULL,'admin','Administration',2,NULL,9),(5,9,'setup/permissions','Permissions',3,4,NULL),(6,9,'setup/roles','Roles',2,3,NULL),(7,9,'setup/pages','Content Pages',5,8,NULL),(8,9,'setup/controllers','Controllers/Actions',4,9,NULL),(9,3,'setup','Setup',1,NULL,8),(11,9,'setup/menus','Menu Editor',6,11,NULL),(12,9,'setup/system_settings','System Settings',7,12,NULL),(13,9,'setup/users','Users',1,15,NULL);
UNLOCK TABLES;
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `permissions`
--


/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
LOCK TABLES `permissions` WRITE;
INSERT INTO `permissions` VALUES (1,'Administer site'),(2,'Public pages - edit'),(3,'Public pages - view'),(4,'Public actions - execute'),(5,'Members only page -- view');
UNLOCK TABLES;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `parent_id` int(11) default NULL,
  `description` varchar(1024) NOT NULL,
  `default_page_id` int(11) default NULL,
  `cache` longtext,
  `created_at` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`),
  KEY `fk_role_parent_id` (`parent_id`),
  KEY `fk_role_default_page_id` (`default_page_id`),
  CONSTRAINT `fk_role_default_page_id` FOREIGN KEY (`default_page_id`) REFERENCES `content_pages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_role_parent_id` FOREIGN KEY (`parent_id`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--


/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
LOCK TABLES `roles` WRITE;
INSERT INTO `roles` VALUES (1,'Public',NULL,'Members of the public who are not logged in.',NULL,'--- \n:menu: &id004 !ruby/object:Menu \n  by_id: \n    1: &id002 !ruby/object:Menu::Node \n      content_page_id: 1\n      controller_action_id: \n      id: 1\n      label: Home\n      name: home\n      parent: &id001 !ruby/object:Menu::Node \n        children: \n        - *id002\n        - &id003 !ruby/object:Menu::Node \n          content_page_id: 6\n          controller_action_id: \n          id: 2\n          label: Contact Us\n          name: contact_us\n          parent: *id001\n          parent_id: \n          site_controller_id: \n          url: /contact_us\n        parent: \n      parent_id: \n      site_controller_id: \n      url: /home\n    2: *id003\n  by_name: \n    contact_us: *id003\n    home: *id002\n  root: *id001\n  selected: \n    1: *id002\n  vector: \n  - *id001\n  - *id002\n:credentials: &id006 !ruby/object:Credentials \n  actions: \n    roles: \n      list: false\n    menu_items: \n      list: false\n      link: true\n    auth: \n      logout: true\n      login_failed: true\n      forgotten: true\n      login: true\n    site_controllers: \n      list: false\n    users: \n      list: false\n    system_settings: \n      list: false\n    permissions: \n      list: false\n    controller_actions: \n      list: false\n    content_pages: \n      list: false\n      view_default: true\n      view: true\n  controllers: \n    roles: false\n    menu_items: false\n    auth: false\n    site_controllers: false\n    markup_styles: false\n    roles_permissions: false\n    users: false\n    system_settings: false\n    permissions: false\n    controller_actions: false\n    content_pages: false\n  pages: \n    admin: false\n    notfound: true\n    site_admin: false\n    contact_us: true\n    denied: true\n    expired: true\n    home: true\n  permission_ids: \n  - 4\n  - 3\n  permissions: \n  - !ruby/object:Permission \n    attributes: \n      name: Public actions - execute\n      id: \"4\"\n  - !ruby/object:Permission \n    attributes: \n      name: Public pages - view\n      id: \"3\"\n  role: &id005 !ruby/object:Role \n    attributes: \n      name: Public\n      updated_at: 2006-08-19 00:18:26.622693 +10:00\n      cache: \n        :menu: *id004\n        :credentials: *id006\n      default_page_id: \n      id: \"1\"\n      description: Members of the public who are not logged in.\n      parent_id: \n      created_at: 2006-06-23 21:03:49\n    errors: !ruby/object:ActiveRecord::Errors \n      base: *id005\n      errors: {}\n\n  role_ids: \n  - 1\n','2006-06-23 11:03:49','2006-08-18 14:18:26'),(2,'Member',1,'',NULL,'--- \n:menu: &id004 !ruby/object:Menu \n  by_id: \n    1: &id002 !ruby/object:Menu::Node \n      content_page_id: 1\n      controller_action_id: \n      id: 1\n      label: Home\n      name: home\n      parent: &id001 !ruby/object:Menu::Node \n        children: \n        - *id002\n        - &id003 !ruby/object:Menu::Node \n          content_page_id: 6\n          controller_action_id: \n          id: 2\n          label: Contact Us\n          name: contact_us\n          parent: *id001\n          parent_id: \n          site_controller_id: \n          url: /contact_us\n        parent: \n      parent_id: \n      site_controller_id: \n      url: /home\n    2: *id003\n  by_name: \n    contact_us: *id003\n    home: *id002\n  root: *id001\n  selected: \n    1: *id002\n  vector: \n  - *id001\n  - *id002\n:credentials: &id006 !ruby/object:Credentials \n  actions: \n    roles: \n      list: false\n    menu_items: \n      list: false\n      link: true\n    auth: \n      logout: true\n      login_failed: true\n      forgotten: true\n      login: true\n    site_controllers: \n      list: false\n    users: \n      list: false\n    system_settings: \n      list: false\n    permissions: \n      list: false\n    controller_actions: \n      list: false\n    content_pages: \n      list: false\n      view_default: true\n      view: true\n  controllers: \n    roles: false\n    menu_items: false\n    auth: false\n    site_controllers: false\n    markup_styles: false\n    roles_permissions: false\n    users: false\n    system_settings: false\n    permissions: false\n    controller_actions: false\n    content_pages: false\n  pages: \n    admin: false\n    notfound: true\n    site_admin: false\n    contact_us: true\n    denied: true\n    expired: true\n    home: true\n  permission_ids: \n  - 5\n  - 4\n  - 3\n  permissions: \n  - !ruby/object:Permission \n    attributes: \n      name: Members only page -- view\n      id: \"5\"\n  - !ruby/object:Permission \n    attributes: \n      name: Public actions - execute\n      id: \"4\"\n  - !ruby/object:Permission \n    attributes: \n      name: Public pages - view\n      id: \"3\"\n  role: &id005 !ruby/object:Role \n    attributes: \n      name: Member\n      updated_at: 2006-08-19 00:18:26.963503 +10:00\n      cache: \n        :menu: *id004\n        :credentials: *id006\n      default_page_id: \n      id: \"2\"\n      description: \"\"\n      parent_id: \"1\"\n      created_at: 2006-06-23 21:03:50\n    errors: !ruby/object:ActiveRecord::Errors \n      base: *id005\n      errors: {}\n\n  role_ids: \n  - 2\n  - 1\n','2006-06-23 11:03:50','2006-08-18 14:18:26'),(3,'Administrator',2,'',8,'--- \n:menu: &id013 !ruby/object:Menu \n  by_id: \n    5: &id004 !ruby/object:Menu::Node \n      content_page_id: \n      controller_action_id: 4\n      id: 5\n      label: Permissions\n      name: setup/permissions\n      parent: &id001 !ruby/object:Menu::Node \n        children: \n        - &id011 !ruby/object:Menu::Node \n          content_page_id: \n          controller_action_id: 15\n          id: 13\n          label: Users\n          name: setup/users\n          parent: *id001\n          parent_id: 9\n          site_controller_id: 10\n          url: /users/list\n        - &id006 !ruby/object:Menu::Node \n          content_page_id: \n          controller_action_id: 3\n          id: 6\n          label: Roles\n          name: setup/roles\n          parent: *id001\n          parent_id: 9\n          site_controller_id: 7\n          url: /roles/list\n        - *id004\n        - &id012 !ruby/object:Menu::Node \n          content_page_id: \n          controller_action_id: 9\n          id: 8\n          label: Controllers/Actions\n          name: setup/controllers\n          parent: *id001\n          parent_id: 9\n          site_controller_id: 8\n          url: /site_controllers/list\n        - &id009 !ruby/object:Menu::Node \n          content_page_id: \n          controller_action_id: 8\n          id: 7\n          label: Content Pages\n          name: setup/pages\n          parent: *id001\n          parent_id: 9\n          site_controller_id: 1\n          url: /content_pages/list\n        - &id005 !ruby/object:Menu::Node \n          content_page_id: \n          controller_action_id: 11\n          id: 11\n          label: Menu Editor\n          name: setup/menus\n          parent: *id001\n          parent_id: 9\n          site_controller_id: 5\n          url: /menu_items/list\n        - &id007 !ruby/object:Menu::Node \n          content_page_id: \n          controller_action_id: 12\n          id: 12\n          label: System Settings\n          name: setup/system_settings\n          parent: *id001\n          parent_id: 9\n          site_controller_id: 9\n          url: /system_settings/list\n        content_page_id: 8\n        controller_action_id: \n        id: 9\n        label: Setup\n        name: setup\n        parent: &id003 !ruby/object:Menu::Node \n          children: \n          - *id001\n          content_page_id: 9\n          controller_action_id: \n          id: 3\n          label: Administration\n          name: admin\n          parent: &id002 !ruby/object:Menu::Node \n            children: \n            - &id008 !ruby/object:Menu::Node \n              content_page_id: 1\n              controller_action_id: \n              id: 1\n              label: Home\n              name: home\n              parent: *id002\n              parent_id: \n              site_controller_id: \n              url: /home\n            - *id003\n            - &id010 !ruby/object:Menu::Node \n              content_page_id: 6\n              controller_action_id: \n              id: 2\n              label: Contact Us\n              name: contact_us\n              parent: *id002\n              parent_id: \n              site_controller_id: \n              url: /contact_us\n            parent: \n          parent_id: \n          site_controller_id: \n          url: /admin\n        parent_id: 3\n        site_controller_id: \n        url: /site_admin\n      parent_id: 9\n      site_controller_id: 6\n      url: /permissions/list\n    11: *id005\n    6: *id006\n    12: *id007\n    1: *id008\n    7: *id009\n    2: *id010\n    13: *id011\n    8: *id012\n    3: *id003\n    9: *id001\n  by_name: \n    setup/pages: *id009\n    setup/users: *id011\n    setup/system_settings: *id007\n    setup/menus: *id005\n    admin: *id003\n    setup/roles: *id006\n    contact_us: *id010\n    setup/permissions: *id004\n    setup: *id001\n    setup/controllers: *id012\n    home: *id008\n  root: *id002\n  selected: \n    1: *id008\n  vector: \n  - *id002\n  - *id008\n:credentials: &id015 !ruby/object:Credentials \n  actions: \n    roles: \n      list: true\n    menu_items: \n      list: true\n      link: true\n    auth: \n      logout: true\n      login_failed: true\n      forgotten: true\n      login: true\n    site_controllers: \n      list: true\n    users: \n      list: true\n    system_settings: \n      list: true\n    permissions: \n      list: true\n    controller_actions: \n      list: true\n    content_pages: \n      list: true\n      view_default: true\n      view: true\n  controllers: \n    roles: true\n    menu_items: true\n    auth: true\n    site_controllers: true\n    markup_styles: true\n    roles_permissions: true\n    users: true\n    system_settings: true\n    permissions: true\n    controller_actions: true\n    content_pages: true\n  pages: \n    admin: true\n    notfound: true\n    site_admin: true\n    contact_us: true\n    denied: true\n    expired: true\n    home: true\n  permission_ids: \n  - 1\n  - 5\n  - 4\n  - 2\n  - 3\n  permissions: \n  - !ruby/object:Permission \n    attributes: \n      name: Administer site\n      id: \"1\"\n  - !ruby/object:Permission \n    attributes: \n      name: Members only page -- view\n      id: \"5\"\n  - !ruby/object:Permission \n    attributes: \n      name: Public actions - execute\n      id: \"4\"\n  - !ruby/object:Permission \n    attributes: \n      name: Public pages - edit\n      id: \"2\"\n  - !ruby/object:Permission \n    attributes: \n      name: Public pages - view\n      id: \"3\"\n  role: &id014 !ruby/object:Role \n    attributes: \n      name: Administrator\n      updated_at: 2006-08-19 00:18:27.166734 +10:00\n      cache: \n        :menu: *id013\n        :credentials: *id015\n      default_page_id: \"8\"\n      id: \"3\"\n      description: \"\"\n      parent_id: \"2\"\n      created_at: 2006-06-23 21:03:48\n    errors: !ruby/object:ActiveRecord::Errors \n      base: *id014\n      errors: {}\n\n  role_ids: \n  - 3\n  - 2\n  - 1\n','2006-06-23 11:03:48','2006-08-18 14:18:27');
UNLOCK TABLES;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

--
-- Table structure for table `roles_permissions`
--

DROP TABLE IF EXISTS `roles_permissions`;
CREATE TABLE `roles_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_roles_permission_role_id` (`role_id`),
  KEY `fk_roles_permission_permission_id` (`permission_id`),
  CONSTRAINT `fk_roles_permission_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_roles_permission_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles_permissions`
--


/*!40000 ALTER TABLE `roles_permissions` DISABLE KEYS */;
LOCK TABLES `roles_permissions` WRITE;
INSERT INTO `roles_permissions` VALUES (4,3,1),(6,1,3),(7,3,2),(9,1,4),(10,2,5);
UNLOCK TABLES;
/*!40000 ALTER TABLE `roles_permissions` ENABLE KEYS */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL auto_increment,
  `session_id` varchar(255) NOT NULL,
  `data` longtext,
  `created_at` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sessions`
--


/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
LOCK TABLES `sessions` WRITE;
INSERT INTO `sessions` VALUES (15,'581957b6cd4689cc75717cce2de81af5','BAh7CToJbWVudW86CU1lbnUKOgxAdmVjdG9yWwdvOg9NZW51OjpOb2RlBzoO\nQGNoaWxkcmVuWwdvOwgOOglAdXJsIgovaG9tZToPQHBhcmVudF9pZDA6FUBj\nb250ZW50X3BhZ2VfaWRpBjoLQGxhYmVsIglIb21lOgpAbmFtZSIJaG9tZToI\nQGlkaQY6GkBjb250cm9sbGVyX2FjdGlvbl9pZDA6GEBzaXRlX2NvbnRyb2xs\nZXJfaWQwOgxAcGFyZW50QAhvOwgOOwoiEC9jb250YWN0X3VzOwswOwxpCzsN\nIg9Db250YWN0IFVzOw4iD2NvbnRhY3RfdXM7D2kHOxAwOxEwOxJACDsSMEAK\nOg5Ac2VsZWN0ZWR7BmkGQAo6CkByb290QAg6DUBieV9uYW1lewciD2NvbnRh\nY3RfdXNADiIJaG9tZUAKOgtAYnlfaWR7B2kGQAppB0AOOhBjcmVkZW50aWFs\nc286EENyZWRlbnRpYWxzDDoLQHBhZ2VzewwiDW5vdGZvdW5kVCIKYWRtaW5G\nIg9zaXRlX2FkbWluRiIPY29udGFjdF91c1QiCWhvbWVUIgxleHBpcmVkVCIL\nZGVuaWVkVDoOQHJvbGVfaWRzWwZpBjoRQGNvbnRyb2xsZXJzexAiD21lbnVf\naXRlbXNGIgpyb2xlc0YiCWF1dGhGIhVzaXRlX2NvbnRyb2xsZXJzRiISbWFy\na3VwX3N0eWxlc0YiFnJvbGVzX3Blcm1pc3Npb25zRiISY29udGVudF9wYWdl\nc0YiF2NvbnRyb2xsZXJfYWN0aW9uc0YiEHBlcm1pc3Npb25zRiIUc3lzdGVt\nX3NldHRpbmdzRiIKdXNlcnNGOhFAcGVybWlzc2lvbnNbB286D1Blcm1pc3Np\nb24GOhBAYXR0cmlidXRlc3sHIgluYW1lIh1QdWJsaWMgYWN0aW9ucyAtIGV4\nZWN1dGUiB2lkIgY0bzsdBjseewciCW5hbWUiGFB1YmxpYyBwYWdlcyAtIHZp\nZXciB2lkIgYzOgpAcm9sZW86CVJvbGUHOgxAZXJyb3JzbzoZQWN0aXZlUmVj\nb3JkOjpFcnJvcnMHOyF7ADoKQGJhc2VAOjseew0iCW5hbWUiC1B1YmxpYyIP\ndXBkYXRlZF9hdHU6CVRpbWUNTp4agGWAqUkiFGRlZmF1bHRfcGFnZV9pZDAi\nCmNhY2hlewc7AEAGOxdAFyIHaWQiBjEiEGRlc2NyaXB0aW9uIjFNZW1iZXJz\nIG9mIHRoZSBwdWJsaWMgd2hvIGFyZSBub3QgbG9nZ2VkIGluLiIOcGFyZW50\nX2lkMCIPY3JlYXRlZF9hdCIYMjAwNi0wNi0yMyAyMTowMzo0OToNQGFjdGlv\nbnN7DiIPbWVudV9pdGVtc3sHIglsaXN0RiIJbGlua1QiCnJvbGVzewYiCWxp\nc3RGIglhdXRoewkiC2xvZ291dFQiDmZvcmdvdHRlblQiEWxvZ2luX2ZhaWxl\nZFQiCmxvZ2luVCIVc2l0ZV9jb250cm9sbGVyc3sGIglsaXN0RiISY29udGVu\ndF9wYWdlc3sIIglsaXN0RiIRdmlld19kZWZhdWx0VCIJdmlld1QiF2NvbnRy\nb2xsZXJfYWN0aW9uc3sGIglsaXN0RiIQcGVybWlzc2lvbnN7BiIJbGlzdEYi\nFHN5c3RlbV9zZXR0aW5nc3sGIglsaXN0RiIKdXNlcnN7BiIJbGlzdEY6FEBw\nZXJtaXNzaW9uX2lkc1sHaQlpCDoObGFzdF90aW1ldTskDU6eGoDXRlNLIgpm\nbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewAG\nOgpAdXNlZHsA\n','2006-08-18 14:18:53','2006-08-18 14:18:53');
UNLOCK TABLES;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;

--
-- Table structure for table `site_controllers`
--

DROP TABLE IF EXISTS `site_controllers`;
CREATE TABLE `site_controllers` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `builtin` int(10) unsigned default '0',
  PRIMARY KEY  (`id`),
  KEY `fk_site_controller_permission_id` (`permission_id`),
  CONSTRAINT `fk_site_controller_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `site_controllers`
--


/*!40000 ALTER TABLE `site_controllers` DISABLE KEYS */;
LOCK TABLES `site_controllers` WRITE;
INSERT INTO `site_controllers` VALUES (1,'content_pages',1,1),(2,'controller_actions',1,1),(3,'auth',1,1),(4,'markup_styles',1,1),(5,'menu_items',1,1),(6,'permissions',1,1),(7,'roles',1,1),(8,'site_controllers',1,1),(9,'system_settings',1,1),(10,'users',1,1),(11,'roles_permissions',1,1);
UNLOCK TABLES;
/*!40000 ALTER TABLE `site_controllers` ENABLE KEYS */;

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL auto_increment,
  `site_name` varchar(255) NOT NULL,
  `site_subtitle` varchar(255) default NULL,
  `footer_message` varchar(255) default '',
  `public_role_id` int(11) NOT NULL default '0',
  `session_timeout` int(11) NOT NULL default '0',
  `default_markup_style_id` int(11) default '0',
  `site_default_page_id` int(11) NOT NULL default '0',
  `not_found_page_id` int(11) NOT NULL default '0',
  `permission_denied_page_id` int(11) NOT NULL default '0',
  `session_expired_page_id` int(11) NOT NULL default '0',
  `menu_depth` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `fk_system_settings_public_role_id` (`public_role_id`),
  KEY `fk_system_settings_site_default_page_id` (`site_default_page_id`),
  KEY `fk_system_settings_not_found_page_id` (`not_found_page_id`),
  KEY `fk_system_settings_permission_denied_page_id` (`permission_denied_page_id`),
  KEY `fk_system_settings_session_expired_page_id` (`session_expired_page_id`),
  CONSTRAINT `fk_system_settings_not_found_page_id` FOREIGN KEY (`not_found_page_id`) REFERENCES `content_pages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_system_settings_permission_denied_page_id` FOREIGN KEY (`permission_denied_page_id`) REFERENCES `content_pages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_system_settings_public_role_id` FOREIGN KEY (`public_role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_system_settings_session_expired_page_id` FOREIGN KEY (`session_expired_page_id`) REFERENCES `content_pages` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_system_settings_site_default_page_id` FOREIGN KEY (`site_default_page_id`) REFERENCES `content_pages` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `system_settings`
--


/*!40000 ALTER TABLE `system_settings` DISABLE KEYS */;
LOCK TABLES `system_settings` WRITE;
INSERT INTO `system_settings` VALUES (1,'Goldberg','An application deployment environment for Rails','A <a href=\"http://goldberg.rubyforge.org\">Goldberg</a> site',1,7200,2,1,3,4,2,3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `system_settings` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `password` varchar(40) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_user_role_id` (`role_id`),
  CONSTRAINT `fk_user_role_id` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--


/*!40000 ALTER TABLE `users` DISABLE KEYS */;
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES (2,'admin','d033e22ae348aeb5660fc2140aec35850c4da997',3);
UNLOCK TABLES;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `view_controller_actions`
--

DROP TABLE IF EXISTS `view_controller_actions`;
/*!50001 DROP VIEW IF EXISTS `view_controller_actions`*/;
/*!50001 DROP TABLE IF EXISTS `view_controller_actions`*/;
/*!50001 CREATE TABLE `view_controller_actions` (
  `id` int(11),
  `site_controller_id` int(11),
  `site_controller_name` varchar(255),
  `name` varchar(255),
  `permission_id` bigint(11)
) */;

--
-- Table structure for table `view_menu_items`
--

DROP TABLE IF EXISTS `view_menu_items`;
/*!50001 DROP VIEW IF EXISTS `view_menu_items`*/;
/*!50001 DROP TABLE IF EXISTS `view_menu_items`*/;
/*!50001 CREATE TABLE `view_menu_items` (
  `menu_item_id` bigint(11) unsigned,
  `menu_item_name` varchar(255),
  `menu_item_label` varchar(255),
  `menu_item_seq` int(11),
  `menu_item_parent_id` int(11),
  `site_controller_id` int(11),
  `site_controller_name` varchar(255),
  `controller_action_id` int(11),
  `controller_action_name` varchar(255),
  `content_page_id` int(11),
  `content_page_name` varchar(255),
  `content_page_title` varchar(255),
  `permission_id` int(11),
  `permission_name` varchar(255)
) */;

--
-- View structure for view `view_controller_actions`
--

/*!50001 DROP TABLE IF EXISTS `view_controller_actions`*/;
/*!50001 DROP VIEW IF EXISTS `view_controller_actions`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `view_controller_actions` AS select `controller_actions`.`id` AS `id`,`site_controllers`.`id` AS `site_controller_id`,`site_controllers`.`name` AS `site_controller_name`,`controller_actions`.`name` AS `name`,coalesce(`controller_actions`.`permission_id`,`site_controllers`.`permission_id`) AS `permission_id` from (`site_controllers` join `controller_actions` on((`site_controllers`.`id` = `controller_actions`.`site_controller_id`))) */;

--
-- View structure for view `view_menu_items`
--

/*!50001 DROP TABLE IF EXISTS `view_menu_items`*/;
/*!50001 DROP VIEW IF EXISTS `view_menu_items`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `view_menu_items` AS select cast(`menu_items`.`id` as unsigned) AS `menu_item_id`,`menu_items`.`name` AS `menu_item_name`,`menu_items`.`label` AS `menu_item_label`,`menu_items`.`seq` AS `menu_item_seq`,`menu_items`.`parent_id` AS `menu_item_parent_id`,`view_controller_actions`.`site_controller_id` AS `site_controller_id`,`view_controller_actions`.`site_controller_name` AS `site_controller_name`,`view_controller_actions`.`id` AS `controller_action_id`,`view_controller_actions`.`name` AS `controller_action_name`,`content_pages`.`id` AS `content_page_id`,`content_pages`.`name` AS `content_page_name`,`content_pages`.`title` AS `content_page_title`,`permissions`.`id` AS `permission_id`,`permissions`.`name` AS `permission_name` from ((((`menu_items` left join `view_controller_actions` on((`menu_items`.`controller_action_id` = `view_controller_actions`.`id`))) left join `content_pages` on(((`menu_items`.`content_page_id` = `content_pages`.`id`) and isnull(`menu_items`.`controller_action_id`)))) left join `markup_styles` on((`content_pages`.`markup_style_id` = `markup_styles`.`id`))) join `permissions` on((coalesce(`view_controller_actions`.`permission_id`,`content_pages`.`permission_id`) = `permissions`.`id`))) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

