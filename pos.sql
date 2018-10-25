-- MySQL dump 10.16  Distrib 10.1.36-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: pos
-- ------------------------------------------------------
-- Server version	10.1.36-MariaDB

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
-- Table structure for table `ospos_app_config`
--

DROP TABLE IF EXISTS `ospos_app_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_app_config` (
  `key` varchar(50) NOT NULL,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_app_config`
--

LOCK TABLES `ospos_app_config` WRITE;
/*!40000 ALTER TABLE `ospos_app_config` DISABLE KEYS */;
INSERT INTO `ospos_app_config` VALUES ('address','Plaza Teresa'),('allow_duplicate_barcodes','0'),('barcode_content','number'),('barcode_first_row','category'),('barcode_font','0'),('barcode_font_size','10'),('barcode_formats','null'),('barcode_generate_if_empty','0'),('barcode_height','50'),('barcode_num_in_row','2'),('barcode_page_cellspacing','20'),('barcode_page_width','100'),('barcode_second_row','item_code'),('barcode_third_row','unit_price'),('barcode_type','Code39'),('barcode_width','250'),('cash_decimals','2'),('cash_rounding_code','1'),('company','Celulares Soluciones'),('company_logo',''),('country_codes','mx'),('currency_decimals','2'),('currency_symbol','$'),('custom10_name',''),('custom1_name',''),('custom2_name',''),('custom3_name',''),('custom4_name',''),('custom5_name',''),('custom6_name',''),('custom7_name',''),('custom8_name',''),('custom9_name',''),('customer_reward_enable','0'),('customer_sales_tax_support','0'),('dateformat','m/d/Y'),('date_or_time_format',''),('default_origin_tax_code',''),('default_register_mode',''),('default_sales_discount','0'),('default_tax_1_name',''),('default_tax_1_rate',''),('default_tax_2_name',''),('default_tax_2_rate',''),('default_tax_category','Standard'),('default_tax_rate','8'),('derive_sale_quantity','0'),('dinner_table_enable','0'),('email','changeme@example.com'),('email_receipt_check_behaviour','last'),('enforce_privacy',''),('fax',''),('financial_year','1'),('gcaptcha_enable','0'),('gcaptcha_secret_key',''),('gcaptcha_site_key',''),('giftcard_number','series'),('invoice_default_comments','This is a default comment'),('invoice_email_message','Dear {CU}, In attachment the receipt for sale {ISEQ}'),('invoice_enable','0'),('language','spanish'),('language_code','es'),('last_used_invoice_number','0'),('last_used_quote_number','0'),('last_used_work_order_number','0'),('lines_per_page','25'),('line_sequence',''),('mailpath','/usr/sbin/sendmail'),('msg_msg',''),('msg_pwd',''),('msg_src',''),('msg_uid',''),('notify_horizontal_position','center'),('notify_vertical_position','bottom'),('number_locale','es_MX'),('payment_options_order','cashdebitcredit'),('phone','555-555-5555'),('print_bottom_margin',''),('print_delay_autoreturn','0'),('print_footer','0'),('print_header','0'),('print_left_margin',''),('print_receipt_check_behaviour','last'),('print_right_margin',''),('print_silently','0'),('print_top_margin',''),('protocol','mail'),('quantity_decimals','0'),('quote_default_comments','This is a default quote comment'),('receipt_font_size','12'),('receipt_show_company_name','1'),('receipt_show_description','1'),('receipt_show_serialnumber','0'),('receipt_show_taxes','0'),('receipt_show_total_discount','0'),('receipt_template','receipt_short'),('receiving_calculate_average_price','1'),('recv_invoice_format','{CO}'),('return_policy','Test'),('sales_invoice_format','{CO}'),('sales_quote_format','Q%y{QSEQ:6}'),('smtp_crypto','ssl'),('smtp_host',''),('smtp_pass',''),('smtp_port','465'),('smtp_timeout','5'),('smtp_user',''),('suggestions_first_column','name'),('suggestions_second_column',''),('suggestions_third_column',''),('tax_decimals','2'),('tax_included','1'),('theme','simplex'),('thousands_separator','thousands_separator'),('timeformat','H:i:s'),('timezone','America/Cancun'),('website',''),('work_order_enable','0'),('work_order_format','W%y{WSEQ:6}');
/*!40000 ALTER TABLE `ospos_app_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers`
--

DROP TABLE IF EXISTS `ospos_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_customers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `taxable` int(1) NOT NULL DEFAULT '1',
  `sales_tax_code` varchar(32) NOT NULL DEFAULT '1',
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `package_id` int(11) DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `employee_id` int(10) NOT NULL,
  `consent` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  KEY `package_id` (`package_id`),
  CONSTRAINT `ospos_customers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`),
  CONSTRAINT `ospos_customers_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers`
--

LOCK TABLES `ospos_customers` WRITE;
/*!40000 ALTER TABLE `ospos_customers` DISABLE KEYS */;
INSERT INTO `ospos_customers` VALUES (4,NULL,NULL,0,'',0.00,NULL,NULL,0,'2018-10-04 23:01:21',1,1),(5,NULL,'JM001',1,'',0.00,NULL,NULL,0,'2018-10-04 23:26:36',2,1),(7,NULL,NULL,0,'',0.00,NULL,NULL,1,'2018-10-25 00:28:31',2,1),(8,NULL,NULL,0,'',0.00,NULL,NULL,1,'2018-10-25 00:29:51',2,1),(9,NULL,NULL,0,'',0.00,NULL,NULL,1,'2018-10-25 00:31:52',2,1),(10,NULL,NULL,0,'',0.00,NULL,NULL,1,'2018-10-25 00:34:14',2,1);
/*!40000 ALTER TABLE `ospos_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers_packages`
--

DROP TABLE IF EXISTS `ospos_customers_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_customers_packages` (
  `package_id` int(11) NOT NULL AUTO_INCREMENT,
  `package_name` varchar(255) DEFAULT NULL,
  `points_percent` float NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`package_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers_packages`
--

LOCK TABLES `ospos_customers_packages` WRITE;
/*!40000 ALTER TABLE `ospos_customers_packages` DISABLE KEYS */;
INSERT INTO `ospos_customers_packages` VALUES (1,'Default',0,0),(2,'Bronze',10,0),(3,'Silver',20,0),(4,'Gold',30,0),(5,'Premium',50,0);
/*!40000 ALTER TABLE `ospos_customers_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_customers_points`
--

DROP TABLE IF EXISTS `ospos_customers_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_customers_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `points_earned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `person_id` (`person_id`),
  KEY `package_id` (`package_id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_customers_points_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_customers` (`person_id`),
  CONSTRAINT `ospos_customers_points_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `ospos_customers_packages` (`package_id`),
  CONSTRAINT `ospos_customers_points_ibfk_3` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_customers_points`
--

LOCK TABLES `ospos_customers_points` WRITE;
/*!40000 ALTER TABLE `ospos_customers_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_customers_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_dinner_tables`
--

DROP TABLE IF EXISTS `ospos_dinner_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_dinner_tables` (
  `dinner_table_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dinner_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_dinner_tables`
--

LOCK TABLES `ospos_dinner_tables` WRITE;
/*!40000 ALTER TABLE `ospos_dinner_tables` DISABLE KEYS */;
INSERT INTO `ospos_dinner_tables` VALUES (1,'Delivery',0,0),(2,'Take Away',0,0);
/*!40000 ALTER TABLE `ospos_dinner_tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_employees`
--

DROP TABLE IF EXISTS `ospos_employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_employees` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `hash_version` int(1) NOT NULL DEFAULT '2',
  `language` varchar(48) DEFAULT NULL,
  `language_code` varchar(8) DEFAULT NULL,
  UNIQUE KEY `username` (`username`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_employees_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_employees`
--

LOCK TABLES `ospos_employees` WRITE;
/*!40000 ALTER TABLE `ospos_employees` DISABLE KEYS */;
INSERT INTO `ospos_employees` VALUES ('admin','$2y$10$vJBSMlD02EC7ENSrKfVQXuvq9tNRHMtcOA8MSK2NYS748HHWm.gcG',1,0,2,'',''),('administrador','$2y$10$Rw.UXiVH1xMeI3aRmuJdxOEu13Aba3.HTamE4kEVmIbzhT/AsRdUy',2,0,2,'','');
/*!40000 ALTER TABLE `ospos_employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_expense_categories`
--

DROP TABLE IF EXISTS `ospos_expense_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_expense_categories` (
  `expense_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`expense_category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_expense_categories`
--

LOCK TABLES `ospos_expense_categories` WRITE;
/*!40000 ALTER TABLE `ospos_expense_categories` DISABLE KEYS */;
INSERT INTO `ospos_expense_categories` VALUES (1,'Renta','Renta Local',0);
/*!40000 ALTER TABLE `ospos_expense_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_expenses`
--

DROP TABLE IF EXISTS `ospos_expenses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_expenses` (
  `expense_id` int(10) NOT NULL AUTO_INCREMENT,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` decimal(15,2) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `employee_id` int(10) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `supplier_name` varchar(255) DEFAULT NULL,
  `supplier_tax_code` varchar(255) DEFAULT NULL,
  `tax_amount` decimal(15,2) DEFAULT NULL,
  PRIMARY KEY (`expense_id`),
  KEY `expense_category_id` (`expense_category_id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `ospos_expenses_ibfk_1` FOREIGN KEY (`expense_category_id`) REFERENCES `ospos_expense_categories` (`expense_category_id`),
  CONSTRAINT `ospos_expenses_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_expenses`
--

LOCK TABLES `ospos_expenses` WRITE;
/*!40000 ALTER TABLE `ospos_expenses` DISABLE KEYS */;
INSERT INTO `ospos_expenses` VALUES (5,'2018-10-04 22:52:14',1000.00,'Tarjeta de Débito',1,'',1,0,'Telcel','001',0.00),(6,'2018-10-04 23:51:49',6000.00,'Efectivo',1,'',2,0,'Plaza','',0.00);
/*!40000 ALTER TABLE `ospos_expenses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_giftcards`
--

DROP TABLE IF EXISTS `ospos_giftcards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_giftcards` (
  `record_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `giftcard_id` int(11) NOT NULL AUTO_INCREMENT,
  `giftcard_number` varchar(255) DEFAULT NULL,
  `value` decimal(15,2) NOT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  `person_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`giftcard_id`),
  UNIQUE KEY `giftcard_number` (`giftcard_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_giftcards_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_giftcards`
--

LOCK TABLES `ospos_giftcards` WRITE;
/*!40000 ALTER TABLE `ospos_giftcards` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_giftcards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_grants`
--

DROP TABLE IF EXISTS `ospos_grants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_grants` (
  `permission_id` varchar(255) NOT NULL,
  `person_id` int(10) NOT NULL,
  `menu_group` varchar(32) DEFAULT 'home',
  PRIMARY KEY (`permission_id`,`person_id`),
  KEY `ospos_grants_ibfk_2` (`person_id`),
  CONSTRAINT `ospos_grants_ibfk_1` FOREIGN KEY (`permission_id`) REFERENCES `ospos_permissions` (`permission_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_grants_ibfk_2` FOREIGN KEY (`person_id`) REFERENCES `ospos_employees` (`person_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_grants`
--

LOCK TABLES `ospos_grants` WRITE;
/*!40000 ALTER TABLE `ospos_grants` DISABLE KEYS */;
INSERT INTO `ospos_grants` VALUES ('config',1,'office'),('customers',1,'home'),('customers',2,'home'),('employees',1,'both'),('employees',2,'home'),('expenses',1,'home'),('expenses',2,'home'),('expenses_categories',1,'home'),('expenses_categories',2,'home'),('giftcards',1,'home'),('home',1,'both'),('home',2,'home'),('items',1,'home'),('items',2,'home'),('items_Teresa-01',1,'--'),('items_Teresa-01',2,'--'),('items_Teresa-02',2,'--'),('item_kits',1,'home'),('messages',1,'home'),('office',1,'home'),('receivings',1,'both'),('receivings',2,'both'),('receivings_Teresa-01',1,'--'),('receivings_Teresa-01',2,'--'),('receivings_Teresa-02',1,'--'),('receivings_Teresa-02',2,'--'),('reports',1,'home'),('reports',2,'home'),('reports_categories',1,'--'),('reports_categories',2,'--'),('reports_customers',1,'--'),('reports_customers',2,'--'),('reports_discounts',1,'--'),('reports_employees',1,'--'),('reports_employees',2,'--'),('reports_expenses_categories',1,'--'),('reports_inventory',1,'--'),('reports_inventory',2,'--'),('reports_items',1,'--'),('reports_items',2,'--'),('reports_payments',1,'--'),('reports_payments',2,'--'),('reports_receivings',1,'--'),('reports_receivings',2,'--'),('reports_sales',1,'--'),('reports_sales',2,'--'),('reports_suppliers',1,'--'),('reports_suppliers',2,'--'),('reports_taxes',1,'--'),('sales',1,'home'),('sales',2,'home'),('sales_delete',1,'--'),('sales_delete',2,'--'),('sales_Teresa-01',1,'--'),('sales_Teresa-01',2,'--'),('suppliers',1,'home'),('suppliers',2,'home'),('taxes',1,'office');
/*!40000 ALTER TABLE `ospos_grants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_inventory`
--

DROP TABLE IF EXISTS `ospos_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_inventory` (
  `trans_id` int(11) NOT NULL AUTO_INCREMENT,
  `trans_items` int(11) NOT NULL DEFAULT '0',
  `trans_user` int(11) NOT NULL DEFAULT '0',
  `trans_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_comment` text NOT NULL,
  `trans_location` int(11) NOT NULL,
  `trans_inventory` decimal(15,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`trans_id`),
  KEY `trans_items` (`trans_items`),
  KEY `trans_user` (`trans_user`),
  KEY `trans_location` (`trans_location`),
  CONSTRAINT `ospos_inventory_ibfk_1` FOREIGN KEY (`trans_items`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_inventory_ibfk_2` FOREIGN KEY (`trans_user`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_inventory_ibfk_3` FOREIGN KEY (`trans_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_inventory`
--

LOCK TABLES `ospos_inventory` WRITE;
/*!40000 ALTER TABLE `ospos_inventory` DISABLE KEYS */;
INSERT INTO `ospos_inventory` VALUES (1,1,2,'2018-10-04 00:00:17','Edición Manual de Cantidad',1,0.000),(2,1,2,'2018-10-04 00:04:10','POS 1',1,-1.000),(3,1,1,'2018-10-04 23:02:49','POS 2',1,-1.000),(4,1,2,'2018-10-04 23:08:15','RECV 1',1,30.000),(5,1,2,'2018-10-04 23:08:50','RECV 2',1,30.000),(6,1,2,'2018-10-04 23:10:47','RECV 3',1,300.000),(7,1,2,'2018-10-05 04:11:22','Eliminado',1,-358.000),(8,2,2,'2018-10-04 23:13:28','Edición Manual de Cantidad',1,300.000),(9,2,2,'2018-10-04 23:13:28','Edición Manual de Cantidad',2,0.000),(10,3,2,'2018-10-04 23:31:43','Edición Manual de Cantidad',1,30.000),(11,3,2,'2018-10-04 23:31:43','Edición Manual de Cantidad',2,5.000),(12,2,2,'2018-10-04 23:34:32','RECV 4',1,30.000),(13,2,2,'2018-10-04 23:34:32','RECV 4',2,-30.000),(14,2,2,'2018-10-05 00:13:01','POS 3',1,1.000),(15,2,2,'2018-10-05 00:15:00','POS 4',1,1.000),(16,2,2,'2018-10-06 09:08:30','RECV 5',2,180.000),(17,2,2,'2018-10-06 09:08:30','RECV 5',1,-180.000),(18,2,2,'2018-10-06 09:22:09','RECV 6',1,30.000),(19,3,2,'2018-10-06 09:35:57','RECV 7',1,15.000),(20,4,1,'2018-10-06 23:54:04','Edición Manual de Cantidad',1,36.000),(21,5,1,'2018-10-12 23:45:52','Edición Manual de Cantidad',1,1.000),(22,6,1,'2018-10-12 23:46:10','Edición Manual de Cantidad',1,1.000),(23,7,1,'2018-10-12 23:46:25','Edición Manual de Cantidad',1,1.000),(24,8,1,'2018-10-12 23:46:26','Edición Manual de Cantidad',1,1.000),(25,9,1,'2018-10-12 23:46:27','Edición Manual de Cantidad',1,1.000),(26,10,1,'2018-10-12 23:46:27','Edición Manual de Cantidad',1,1.000),(27,11,1,'2018-10-12 23:46:27','Edición Manual de Cantidad',1,1.000),(28,12,1,'2018-10-12 23:46:27','Edición Manual de Cantidad',1,1.000),(29,13,1,'2018-10-13 00:34:25','Edición Manual de Cantidad',1,0.000),(30,2,1,'2018-10-14 01:06:28','Eliminado',1,-182.000),(31,3,1,'2018-10-14 01:06:28','Eliminado',1,-45.000),(32,4,1,'2018-10-14 01:06:28','Eliminado',1,-36.000),(33,5,1,'2018-10-14 01:06:28','Eliminado',1,-1.000),(34,6,1,'2018-10-14 01:06:28','Eliminado',1,-1.000),(35,7,1,'2018-10-14 01:06:28','Eliminado',1,-1.000),(36,8,1,'2018-10-14 01:06:28','Eliminado',1,-1.000),(37,9,1,'2018-10-14 01:06:28','Eliminado',1,-1.000),(38,10,1,'2018-10-14 01:06:28','Eliminado',1,-1.000),(39,11,1,'2018-10-14 01:06:28','Eliminado',1,-1.000),(40,12,1,'2018-10-14 01:06:28','Eliminado',1,-1.000),(41,14,1,'2018-10-13 20:07:04','Edición Manual de Cantidad',1,0.000),(42,15,1,'2018-10-13 20:07:11','Edición Manual de Cantidad',1,12.000),(43,16,1,'2018-10-13 20:07:27','Edición Manual de Cantidad',1,12.000),(44,15,1,'2018-10-14 01:09:14','Eliminado',1,-12.000),(45,16,1,'2018-10-14 01:09:14','Eliminado',1,-12.000),(46,17,1,'2018-10-13 20:16:08','Edición Manual de Cantidad',1,4.000),(47,18,1,'2018-10-13 22:31:10','Edición Manual de Cantidad',1,1.000),(48,19,1,'2018-10-13 22:31:52','Edición Manual de Cantidad',1,0.000),(49,20,1,'2018-10-14 00:07:24','Edición Manual de Cantidad',1,12.000),(50,21,1,'2018-10-14 00:13:48','Edición Manual de Cantidad',1,1.000),(51,22,1,'2018-10-14 11:34:41','Edición Manual de Cantidad',1,0.000),(52,23,1,'2018-10-14 11:38:26','Edición Manual de Cantidad',1,14.000),(53,25,1,'2018-10-14 11:38:42','Edición Manual de Cantidad',1,14.000),(54,17,1,'2018-10-14 16:38:53','Eliminado',1,-4.000),(55,18,1,'2018-10-14 16:38:53','Eliminado',1,-1.000),(56,20,1,'2018-10-14 16:38:53','Eliminado',1,-12.000),(57,21,1,'2018-10-14 16:38:53','Eliminado',1,-1.000),(58,23,1,'2018-10-14 16:38:53','Eliminado',1,-14.000),(59,25,1,'2018-10-14 16:38:53','Eliminado',1,-14.000),(60,27,1,'2018-10-14 11:39:52','Edición Manual de Cantidad',1,11.000),(61,29,1,'2018-10-14 11:40:25','Edición Manual de Cantidad',1,4.000),(62,31,1,'2018-10-14 11:46:24','Edición Manual de Cantidad',1,1.000),(63,33,1,'2018-10-14 11:46:29','Edición Manual de Cantidad',1,1.000),(64,27,1,'2018-10-14 16:50:42','Eliminado',1,-11.000),(65,29,1,'2018-10-14 16:50:42','Eliminado',1,-4.000),(66,31,1,'2018-10-14 16:50:42','Eliminado',1,-1.000),(67,33,1,'2018-10-14 16:50:42','Eliminado',1,-1.000),(68,35,1,'2018-10-14 11:51:17','Edición Manual de Cantidad',1,0.000),(69,37,1,'2018-10-14 11:52:04','Edición Manual de Cantidad',1,0.000),(70,39,1,'2018-10-14 11:59:40','Edición Manual de Cantidad',1,0.000),(71,41,1,'2018-10-14 12:04:28','Edición Manual de Cantidad',1,0.000),(72,43,1,'2018-10-14 12:09:35','Edición Manual de Cantidad',1,3.000),(73,45,1,'2018-10-14 12:09:52','Edición Manual de Cantidad',1,3.000),(74,47,1,'2018-10-14 12:15:05','Edición Manual de Cantidad',1,3.000),(75,49,1,'2018-10-14 12:16:17','Edición Manual de Cantidad',1,3.000),(76,51,1,'2018-10-14 12:17:13','Edición Manual de Cantidad',1,3.000),(77,53,1,'2018-10-14 12:17:44','Edición Manual de Cantidad',1,3.000),(78,54,1,'2018-10-14 12:17:54','Edición Manual de Cantidad',1,3.000),(79,55,1,'2018-10-14 12:18:40','Edición Manual de Cantidad',1,3.000),(80,57,1,'2018-10-14 12:19:55','Edición Manual de Cantidad',1,3.000),(81,58,1,'2018-10-14 12:21:35','Edición Manual de Cantidad',1,3.000),(82,60,1,'2018-10-14 14:15:04','Edición Manual de Cantidad',1,5.000),(83,62,1,'2018-10-14 14:15:38','Edición Manual de Cantidad',1,5.000),(84,43,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(85,45,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(86,47,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(87,49,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(88,51,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(89,53,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(90,54,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(91,55,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(92,57,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(93,58,1,'2018-10-14 19:16:42','Eliminado',1,-3.000),(94,60,1,'2018-10-14 19:16:42','Eliminado',1,-5.000),(95,62,1,'2018-10-14 19:16:42','Eliminado',1,-5.000),(96,64,1,'2018-10-14 15:49:06','Edición Manual de Cantidad',1,2.000),(97,66,1,'2018-10-14 16:00:57','Edición Manual de Cantidad',1,2.000),(98,68,1,'2018-10-14 16:38:18','Edición Manual de Cantidad',1,2.000),(99,70,1,'2018-10-14 16:38:36','Edición Manual de Cantidad',1,2.000),(100,72,1,'2018-10-14 16:38:49','Edición Manual de Cantidad',1,2.000),(101,64,1,'2018-10-14 21:39:08','Eliminado',1,-2.000),(102,66,1,'2018-10-14 21:39:08','Eliminado',1,-2.000),(103,68,1,'2018-10-14 21:39:08','Eliminado',1,-2.000),(104,70,1,'2018-10-14 21:39:08','Eliminado',1,-2.000),(105,72,1,'2018-10-14 21:39:08','Eliminado',1,-2.000),(106,74,1,'2018-10-14 16:40:20','Edición Manual de Cantidad',1,1.000),(107,76,1,'2018-10-14 16:40:27','Edición Manual de Cantidad',1,1.000),(108,78,1,'2018-10-14 16:41:13','Edición Manual de Cantidad',1,1.000),(109,80,1,'2018-10-14 16:42:03','Edición Manual de Cantidad',1,1.000),(110,81,1,'2018-10-14 16:42:03','Edición Manual de Cantidad',1,1.000),(111,82,1,'2018-10-14 16:42:15','Edición Manual de Cantidad',1,1.000),(112,83,1,'2018-10-14 16:42:15','Edición Manual de Cantidad',1,1.000),(113,74,1,'2018-10-14 21:43:11','Eliminado',1,-1.000),(114,76,1,'2018-10-14 21:43:11','Eliminado',1,-1.000),(115,78,1,'2018-10-14 21:43:11','Eliminado',1,-1.000),(116,80,1,'2018-10-14 21:43:11','Eliminado',1,-1.000),(117,81,1,'2018-10-14 21:43:11','Eliminado',1,-1.000),(118,82,1,'2018-10-14 21:43:11','Eliminado',1,-1.000),(119,83,1,'2018-10-14 21:43:11','Eliminado',1,-1.000),(120,84,1,'2018-10-14 16:44:04','Edición Manual de Cantidad',1,12.000),(121,86,1,'2018-10-14 16:44:30','Edición Manual de Cantidad',1,0.000),(122,88,1,'2018-10-14 16:45:07','Edición Manual de Cantidad',1,1.000),(123,90,1,'2018-10-14 16:46:12','Edición Manual de Cantidad',1,1.000),(124,91,1,'2018-10-14 16:46:12','Edición Manual de Cantidad',1,1.000),(125,84,1,'2018-10-14 21:46:27','Eliminado',1,-12.000),(126,88,1,'2018-10-14 21:46:27','Eliminado',1,-1.000),(127,90,1,'2018-10-14 21:46:27','Eliminado',1,-1.000),(128,91,1,'2018-10-14 21:46:27','Eliminado',1,-1.000),(129,92,1,'2018-10-14 18:05:54','Edición Manual de Cantidad',1,12.000),(130,93,1,'2018-10-14 18:05:54','Edición Manual de Cantidad',1,12.000),(131,26,1,'2018-10-14 18:45:41','RECV 8',2,22.000),(132,26,1,'2018-10-14 18:45:41','RECV 8',1,-22.000),(133,30,1,'2018-10-14 18:45:41','RECV 8',2,3.000),(134,30,1,'2018-10-14 18:45:41','RECV 8',1,-3.000),(135,87,1,'2018-10-14 18:45:41','RECV 8',2,1.000),(136,87,1,'2018-10-14 18:45:41','RECV 8',1,-1.000),(137,46,1,'2018-10-14 18:45:41','RECV 8',2,2.000),(138,46,1,'2018-10-14 18:45:41','RECV 8',1,-2.000),(139,59,1,'2018-10-14 18:45:41','RECV 8',2,2.000),(140,59,1,'2018-10-14 18:45:41','RECV 8',1,-2.000),(141,94,1,'2018-10-14 19:37:11','Edición Manual de Cantidad',1,0.000),(142,95,1,'2018-10-14 19:37:11','Edición Manual de Cantidad',1,0.000),(143,96,1,'2018-10-14 19:37:53','Edición Manual de Cantidad',1,1.000),(144,97,1,'2018-10-14 19:37:53','Edición Manual de Cantidad',1,1.000),(145,98,1,'2018-10-14 19:38:38','Edición Manual de Cantidad',1,1.000),(146,99,1,'2018-10-14 19:38:38','Edición Manual de Cantidad',1,1.000),(147,100,2,'2018-10-25 00:56:42','Edición Manual de Cantidad',1,4.000),(148,100,2,'2018-10-25 00:56:42','Edición Manual de Cantidad',2,2.000),(149,101,2,'2018-10-25 01:08:46','Edición Manual de Cantidad',1,5.000),(150,101,2,'2018-10-25 01:08:46','Edición Manual de Cantidad',2,6.000),(151,102,2,'2018-10-25 01:08:46','Edición Manual de Cantidad',1,5.000),(152,102,2,'2018-10-25 01:08:46','Edición Manual de Cantidad',2,6.000),(153,103,2,'2018-10-25 01:08:46','Edición Manual de Cantidad',1,5.000),(154,103,2,'2018-10-25 01:08:46','Edición Manual de Cantidad',2,6.000),(155,104,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',1,12.000),(156,104,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',2,21.000),(157,105,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',1,12.000),(158,105,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',2,21.000),(159,106,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',1,12.000),(160,106,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',2,21.000),(161,107,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',1,12.000),(162,107,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',2,21.000),(163,108,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',1,12.000),(164,108,2,'2018-10-25 01:09:45','Edición Manual de Cantidad',2,21.000),(165,26,2,'2018-10-25 06:09:58','Eliminado',2,-22.000),(166,30,2,'2018-10-25 06:09:58','Eliminado',2,-3.000),(167,46,2,'2018-10-25 06:09:58','Eliminado',2,-2.000),(168,59,2,'2018-10-25 06:09:58','Eliminado',2,-2.000),(169,87,2,'2018-10-25 06:09:58','Eliminado',2,-1.000),(170,92,2,'2018-10-25 06:09:58','Eliminado',1,-12.000),(171,93,2,'2018-10-25 06:09:58','Eliminado',1,-12.000),(172,96,2,'2018-10-25 06:09:58','Eliminado',1,-1.000),(173,97,2,'2018-10-25 06:09:58','Eliminado',1,-1.000),(174,98,2,'2018-10-25 06:09:58','Eliminado',1,-1.000),(175,99,2,'2018-10-25 06:09:58','Eliminado',1,-1.000),(176,100,2,'2018-10-25 06:09:58','Eliminado',1,-4.000),(177,101,2,'2018-10-25 06:09:58','Eliminado',1,-5.000),(178,102,2,'2018-10-25 06:09:58','Eliminado',1,-5.000),(179,103,2,'2018-10-25 06:09:58','Eliminado',1,-5.000),(180,104,2,'2018-10-25 06:09:58','Eliminado',1,-12.000),(181,105,2,'2018-10-25 06:09:58','Eliminado',1,-12.000),(182,106,2,'2018-10-25 06:09:58','Eliminado',1,-12.000),(183,107,2,'2018-10-25 06:09:58','Eliminado',1,-12.000),(184,108,2,'2018-10-25 06:09:58','Eliminado',1,-12.000);
/*!40000 ALTER TABLE `ospos_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_kit_items`
--

DROP TABLE IF EXISTS `ospos_item_kit_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_item_kit_items` (
  `item_kit_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL,
  `kit_sequence` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_kit_id`,`item_id`,`quantity`),
  KEY `ospos_item_kit_items_ibfk_2` (`item_id`),
  CONSTRAINT `ospos_item_kit_items_ibfk_1` FOREIGN KEY (`item_kit_id`) REFERENCES `ospos_item_kits` (`item_kit_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_item_kit_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_kit_items`
--

LOCK TABLES `ospos_item_kit_items` WRITE;
/*!40000 ALTER TABLE `ospos_item_kit_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_item_kit_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_kits`
--

DROP TABLE IF EXISTS `ospos_item_kits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_item_kits` (
  `item_kit_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `item_id` int(10) NOT NULL DEFAULT '0',
  `kit_discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `price_option` tinyint(2) NOT NULL DEFAULT '0',
  `print_option` tinyint(2) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`item_kit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_kits`
--

LOCK TABLES `ospos_item_kits` WRITE;
/*!40000 ALTER TABLE `ospos_item_kits` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_item_kits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_item_quantities`
--

DROP TABLE IF EXISTS `ospos_item_quantities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_item_quantities` (
  `item_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `quantity` decimal(15,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`item_id`,`location_id`),
  KEY `item_id` (`item_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_item_quantities_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_item_quantities`
--

LOCK TABLES `ospos_item_quantities` WRITE;
/*!40000 ALTER TABLE `ospos_item_quantities` DISABLE KEYS */;
INSERT INTO `ospos_item_quantities` VALUES (1,1,0.000),(2,1,0.000),(2,2,0.000),(3,1,0.000),(3,2,0.000),(4,1,0.000),(5,1,0.000),(6,1,0.000),(7,1,0.000),(8,1,0.000),(9,1,0.000),(10,1,0.000),(11,1,0.000),(12,1,0.000),(13,1,0.000),(14,1,0.000),(15,1,0.000),(16,1,0.000),(17,1,0.000),(18,1,0.000),(19,1,0.000),(20,1,0.000),(21,1,0.000),(22,1,0.000),(23,1,0.000),(25,1,0.000),(26,1,0.000),(26,2,0.000),(27,1,0.000),(29,1,0.000),(30,1,0.000),(30,2,0.000),(31,1,0.000),(33,1,0.000),(35,1,0.000),(37,1,0.000),(39,1,0.000),(41,1,0.000),(43,1,0.000),(45,1,0.000),(46,1,0.000),(46,2,0.000),(47,1,0.000),(49,1,0.000),(51,1,0.000),(53,1,0.000),(54,1,0.000),(55,1,0.000),(57,1,0.000),(58,1,0.000),(59,1,0.000),(59,2,0.000),(60,1,0.000),(62,1,0.000),(64,1,0.000),(66,1,0.000),(68,1,0.000),(70,1,0.000),(72,1,0.000),(74,1,0.000),(76,1,0.000),(78,1,0.000),(80,1,0.000),(81,1,0.000),(82,1,0.000),(83,1,0.000),(84,1,0.000),(86,1,0.000),(87,1,0.000),(87,2,0.000),(88,1,0.000),(90,1,0.000),(91,1,0.000),(92,1,0.000),(93,1,0.000),(94,1,0.000),(95,1,0.000),(96,1,0.000),(97,1,0.000),(98,1,0.000),(99,1,0.000),(100,1,0.000),(100,2,0.000),(101,1,0.000),(101,2,0.000),(102,1,0.000),(102,2,0.000),(103,1,0.000),(103,2,0.000),(104,1,0.000),(104,2,0.000),(105,1,0.000),(105,2,0.000),(106,1,0.000),(106,2,0.000),(107,1,0.000),(107,2,0.000),(108,1,0.000),(108,2,0.000);
/*!40000 ALTER TABLE `ospos_item_quantities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_items`
--

DROP TABLE IF EXISTS `ospos_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_items` (
  `name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `item_number` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cost_price` decimal(15,2) NOT NULL,
  `unit_price` decimal(15,2) NOT NULL,
  `reorder_level` decimal(15,3) NOT NULL DEFAULT '0.000',
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  `item_id` int(10) NOT NULL AUTO_INCREMENT,
  `pic_filename` varchar(255) DEFAULT NULL,
  `allow_alt_description` tinyint(1) NOT NULL,
  `is_serialized` tinyint(1) NOT NULL,
  `stock_type` tinyint(2) NOT NULL DEFAULT '0',
  `item_type` tinyint(2) NOT NULL DEFAULT '0',
  `tax_category_id` int(10) NOT NULL DEFAULT '1',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `custom1` varchar(255) DEFAULT NULL,
  `custom2` varchar(255) DEFAULT NULL,
  `custom3` varchar(255) DEFAULT NULL,
  `custom4` varchar(255) DEFAULT NULL,
  `custom5` varchar(255) DEFAULT NULL,
  `custom6` varchar(255) DEFAULT NULL,
  `custom7` varchar(255) DEFAULT NULL,
  `custom8` varchar(255) DEFAULT NULL,
  `custom9` varchar(255) DEFAULT NULL,
  `custom10` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  KEY `item_number` (`item_number`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `ospos_items_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_items`
--

LOCK TABLES `ospos_items` WRITE;
/*!40000 ALTER TABLE `ospos_items` DISABLE KEYS */;
INSERT INTO `ospos_items` VALUES ('Iphone X','Celular',3,'0001','',26536.31,25000.00,5.000,30.000,1,NULL,0,1,0,0,0,1,'','','','','','','','','',''),('Iphone X','Celulares',3,'17067917','',21644.58,25000.00,5.000,30.000,2,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('Huawei Honor','Celulares',3,'348372493274932','Celular Chafa',3500.00,5200.00,1.000,15.000,3,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Celulares',NULL,'1','',12.00,13.00,57.000,46.000,4,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celular','Celulares',6,'12121212','desc',11.00,22.00,3.000,2.000,5,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celular','Celulares',6,'12121212','desc',11.00,22.00,3.000,2.000,6,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celular','Celulares',6,'12121212','desc',11.00,22.00,3.000,2.000,7,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celular','Celulares',6,'12121212','desc',11.00,22.00,3.000,2.000,8,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celular','Celulares',6,'12121212','desc',11.00,22.00,3.000,2.000,9,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celular','Celulares',6,'12121212','desc',11.00,22.00,3.000,2.000,10,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celular','Celulares',6,'12121212','desc',11.00,22.00,3.000,2.000,11,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celular','Celulares',6,'12121212','desc',11.00,22.00,3.000,2.000,12,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('12121','Celulares',NULL,'98765','',10.00,20.00,1.000,1.000,13,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celuae','b',6,'1234','',12.00,13.00,1.000,1.000,14,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celuae','b',6,'1234','',12.00,13.00,1.000,1.000,15,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('celuae','D',6,'1234','',12.00,13.00,1.000,1.000,16,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('Celular','Nueva',6,'00001','',12.00,14.00,1.000,2.000,17,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,'12','',1.00,2.00,1.000,2.000,18,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,'14','',1.00,2.00,1.000,1.000,19,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('Test','Nueva',6,'98','',0.00,0.00,4.000,3.000,20,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'8787','',1212.00,1414.00,1.000,1.000,21,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'212121221','',333.00,222.00,1.000,1.000,22,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'343434','',33.00,55.00,1.000,11.000,23,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'4343434343','',33.00,55.00,1.000,11.000,24,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'343434','',33.00,55.00,1.000,11.000,25,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'4343434343','',33.00,55.00,1.000,11.000,26,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('ROLE_PCEC_USER','Nueva',6,'123456','',45.00,5.00,1.000,1.000,27,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('ROLE_PCEC_USER','Nueva',6,'123456','',45.00,5.00,1.000,1.000,28,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',NULL,'123456qW','',12.00,11.00,2.000,3.000,29,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,'654321qW','',12.00,11.00,2.000,3.000,30,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'12','',43.00,233.00,5.000,23.000,31,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'34','',43.00,233.00,5.000,23.000,32,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'12','',43.00,233.00,5.000,23.000,33,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'34','',43.00,233.00,5.000,23.000,34,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'eddy1','',15.00,12.00,1.000,1.000,35,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'eddy2','',15.00,12.00,1.000,1.000,36,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'eddy3','',12.00,34.00,1.000,1.000,37,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'eddy4','',12.00,34.00,1.000,1.000,38,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'eddy3','',12.00,34.00,1.000,1.000,39,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'eddy4','',12.00,34.00,1.000,1.000,40,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'eddy5','',12.00,34.00,1.000,1.000,41,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'eddy6','',12.00,34.00,1.000,1.000,42,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'qaz','',12.00,11.00,3.000,2.000,43,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz1','',12.00,11.00,3.000,2.000,44,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'qaz2','',12.00,11.00,3.000,2.000,45,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz3','',12.00,11.00,3.000,2.000,46,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz4','',12.00,11.00,3.000,2.000,47,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz5','',12.00,11.00,3.000,2.000,48,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'qaz4','',12.00,11.00,3.000,2.000,49,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz5','',12.00,11.00,3.000,2.000,50,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'qaz4','',12.00,11.00,3.000,2.000,51,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz5','',12.00,11.00,3.000,2.000,52,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'qaz5','',12.00,11.00,3.000,2.000,53,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz5','',12.00,11.00,3.000,2.000,54,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz4','',12.00,11.00,3.000,2.000,55,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz5','',12.00,11.00,3.000,2.000,56,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'qaz5','',12.00,11.00,3.000,2.000,57,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz4','',12.00,11.00,3.000,2.000,58,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'qaz5','',12.00,11.00,3.000,2.000,59,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'1222','',12.00,15.00,1.000,1.000,60,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'1333','',12.00,15.00,1.000,1.000,61,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'1222','',12.00,15.00,1.000,1.000,62,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'1333','',12.00,15.00,1.000,1.000,63,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'12','',0.00,0.00,1.000,1.000,64,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'32','',0.00,0.00,1.000,1.000,65,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'12','',0.00,0.00,1.000,1.000,66,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'32','',0.00,0.00,1.000,1.000,67,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'12','',0.00,0.00,1.000,1.000,68,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'32','',0.00,0.00,1.000,1.000,69,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'12','',12.00,15.00,1.000,1.000,70,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'32','',12.00,15.00,1.000,1.000,71,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'pinguino1','',12.00,15.00,1.000,1.000,72,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'pinguino2','',12.00,15.00,1.000,1.000,73,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'1','',1.00,2.00,1.000,1.000,74,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'2','',1.00,2.00,1.000,1.000,75,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'1','',1.00,2.00,1.000,1.000,76,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'2','',1.00,2.00,1.000,1.000,77,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'1','',1.00,2.00,1.000,1.000,78,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'2','',1.00,2.00,1.000,1.000,79,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',3,'1','',1.00,2.00,1.000,1.000,80,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'2','',1.00,2.00,1.000,1.000,81,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'a','',1.00,2.00,1.000,1.000,82,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'b','',1.00,2.00,1.000,1.000,83,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'a','',14.00,13.00,1.000,11.000,84,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'b','',14.00,13.00,1.000,11.000,85,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',6,'ab','',12.00,10.00,1.000,1.000,86,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',6,'cd','',12.00,10.00,1.000,1.000,87,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,'m','',10.00,20.00,1.000,1.000,88,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,'n','',10.00,20.00,1.000,1.000,89,NULL,0,0,0,0,0,0,'','','','','','','','','',''),('admin','Nueva',NULL,'do','',10.00,20.00,1.000,1.000,90,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,'re','',10.00,20.00,1.000,1.000,91,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','s',NULL,'asa','',1.00,3.00,1.000,1.000,92,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','s',NULL,'ezsasa','',1.00,3.00,1.000,1.000,93,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'eddy01','',12.00,1.00,1.000,1.000,94,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',3,'eddy02','',12.00,1.00,1.000,1.000,95,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('dsdsd','Nueva',NULL,'a1','',111.00,222.00,1.000,1.000,96,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('dsdsd','Nueva',NULL,'a2ds','',111.00,222.00,1.000,1.000,97,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('alfa','Nueva',6,'alfa','',12.00,3.00,1.000,1.000,98,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('alfa','Nueva',6,'gamma','',12.00,3.00,1.000,1.000,99,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('a','s',6,'4332423423432','',12.00,34.00,1.000,1.000,100,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('erlopezo','Nueva',NULL,NULL,'',12.00,16.00,1.000,1.000,101,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('erlopezo','Nueva',NULL,'1qaz','',12.00,16.00,1.000,1.000,102,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('erlopezo','Nueva',NULL,'124566','',12.00,16.00,1.000,1.000,103,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,NULL,'',12.00,34.00,1.000,12.000,104,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,'dias','',12.00,34.00,1.000,12.000,105,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,NULL,'',12.00,34.00,1.000,12.000,106,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,'secrea','',12.00,34.00,1.000,12.000,107,NULL,0,0,0,0,0,1,'','','','','','','','','',''),('admin','Nueva',NULL,NULL,'',12.00,34.00,1.000,12.000,108,NULL,0,0,0,0,0,1,'','','','','','','','','','');
/*!40000 ALTER TABLE `ospos_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_items_taxes`
--

DROP TABLE IF EXISTS `ospos_items_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_items_taxes` (
  `item_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,3) NOT NULL,
  PRIMARY KEY (`item_id`,`name`,`percent`),
  CONSTRAINT `ospos_items_taxes_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_items_taxes`
--

LOCK TABLES `ospos_items_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_items_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_migrations`
--

DROP TABLE IF EXISTS `ospos_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_migrations`
--

LOCK TABLES `ospos_migrations` WRITE;
/*!40000 ALTER TABLE `ospos_migrations` DISABLE KEYS */;
INSERT INTO `ospos_migrations` VALUES (20180501100000);
/*!40000 ALTER TABLE `ospos_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_modules`
--

DROP TABLE IF EXISTS `ospos_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_modules` (
  `name_lang_key` varchar(255) NOT NULL,
  `desc_lang_key` varchar(255) NOT NULL,
  `sort` int(10) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  PRIMARY KEY (`module_id`),
  UNIQUE KEY `desc_lang_key` (`desc_lang_key`),
  UNIQUE KEY `name_lang_key` (`name_lang_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_modules`
--

LOCK TABLES `ospos_modules` WRITE;
/*!40000 ALTER TABLE `ospos_modules` DISABLE KEYS */;
INSERT INTO `ospos_modules` VALUES ('module_config','module_config_desc',110,'config'),('module_customers','module_customers_desc',10,'customers'),('module_employees','module_employees_desc',80,'employees'),('module_expenses','module_expenses_desc',108,'expenses'),('module_expenses_categories','module_expenses_categories_desc',109,'expenses_categories'),('module_giftcards','module_giftcards_desc',90,'giftcards'),('module_home','module_home_desc',1,'home'),('module_items','module_items_desc',20,'items'),('module_item_kits','module_item_kits_desc',30,'item_kits'),('module_messages','module_messages_desc',98,'messages'),('module_office','module_office_desc',999,'office'),('module_receivings','module_receivings_desc',60,'receivings'),('module_reports','module_reports_desc',50,'reports'),('module_sales','module_sales_desc',70,'sales'),('module_suppliers','module_suppliers_desc',40,'suppliers'),('module_taxes','module_taxes_desc',105,'taxes');
/*!40000 ALTER TABLE `ospos_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_people`
--

DROP TABLE IF EXISTS `ospos_people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_people` (
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` int(1) DEFAULT NULL,
  `phone_number` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `person_id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`person_id`),
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_people`
--

LOCK TABLES `ospos_people` WRITE;
/*!40000 ALTER TABLE `ospos_people` DISABLE KEYS */;
INSERT INTO `ospos_people` VALUES ('John','Doe',NULL,'555-555-5555','changeme@example.com','Address 1','','','','','','',1),('Administrador','1',1,'5518547329','vendedor01@mail.com','','','','','','','',2),('Jorge','Ramírez',1,'14321543','telcel@telcel.com','','','','','','','',3),('Cliente 1','Nombre',NULL,'','','','','','','','','',4),('Jonathan','Monje Aguirre',1,'34343434','jmonje@mail.com','','','','','','','',5),('Juana','Martinez',1,'','','','','','','','','',6),('43434','Ewewew',1,'','','','','','','','','',7),('A','B',NULL,'','','','','','','','','',8),('C','D',NULL,'','','','','','','','','',9),('e','G',NULL,'','','','','','','','','',10);
/*!40000 ALTER TABLE `ospos_people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_permissions`
--

DROP TABLE IF EXISTS `ospos_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_permissions` (
  `permission_id` varchar(255) NOT NULL,
  `module_id` varchar(255) NOT NULL,
  `location_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `module_id` (`module_id`),
  KEY `ospos_permissions_ibfk_2` (`location_id`),
  CONSTRAINT `ospos_permissions_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `ospos_modules` (`module_id`) ON DELETE CASCADE,
  CONSTRAINT `ospos_permissions_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `ospos_stock_locations` (`location_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_permissions`
--

LOCK TABLES `ospos_permissions` WRITE;
/*!40000 ALTER TABLE `ospos_permissions` DISABLE KEYS */;
INSERT INTO `ospos_permissions` VALUES ('config','config',NULL),('customers','customers',NULL),('employees','employees',NULL),('expenses','expenses',NULL),('expenses_categories','expenses_categories',NULL),('giftcards','giftcards',NULL),('home','home',NULL),('items','items',NULL),('items_Teresa-01','items',1),('items_Teresa-02','items',2),('item_kits','item_kits',NULL),('messages','messages',NULL),('office','office',NULL),('receivings','receivings',NULL),('receivings_Teresa-01','receivings',1),('receivings_Teresa-02','receivings',2),('reports','reports',NULL),('reports_categories','reports',NULL),('reports_customers','reports',NULL),('reports_discounts','reports',NULL),('reports_employees','reports',NULL),('reports_expenses_categories','reports',NULL),('reports_inventory','reports',NULL),('reports_items','reports',NULL),('reports_payments','reports',NULL),('reports_receivings','reports',NULL),('reports_sales','reports',NULL),('reports_suppliers','reports',NULL),('reports_taxes','reports',NULL),('sales','sales',NULL),('sales_delete','sales',NULL),('sales_Teresa-01','sales',1),('sales_Teresa-02','sales',2),('suppliers','suppliers',NULL),('taxes','taxes',NULL);
/*!40000 ALTER TABLE `ospos_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_receivings`
--

DROP TABLE IF EXISTS `ospos_receivings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_receivings` (
  `receiving_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplier_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text,
  `receiving_id` int(10) NOT NULL AUTO_INCREMENT,
  `payment_type` varchar(20) DEFAULT NULL,
  `reference` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`receiving_id`),
  KEY `supplier_id` (`supplier_id`),
  KEY `employee_id` (`employee_id`),
  KEY `reference` (`reference`),
  CONSTRAINT `ospos_receivings_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_receivings_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `ospos_suppliers` (`person_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_receivings`
--

LOCK TABLES `ospos_receivings` WRITE;
/*!40000 ALTER TABLE `ospos_receivings` DISABLE KEYS */;
INSERT INTO `ospos_receivings` VALUES ('2018-10-04 23:08:15',3,2,'',1,'Efectivo','001'),('2018-10-04 23:08:50',3,2,'',2,'Efectivo',NULL),('2018-10-04 23:10:47',NULL,2,'',3,'Efectivo',NULL),('2018-10-04 23:34:32',6,2,'',4,NULL,NULL),('2018-10-06 09:08:30',NULL,2,'',5,NULL,NULL),('2018-10-06 09:22:09',NULL,2,'',6,'Efectivo',NULL),('2018-10-06 09:35:57',6,2,'',7,'Tarjeta de Crédito','0001'),('2018-10-14 18:45:41',NULL,1,'',8,NULL,NULL);
/*!40000 ALTER TABLE `ospos_receivings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_receivings_items`
--

DROP TABLE IF EXISTS `ospos_receivings_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_receivings_items` (
  `receiving_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(30) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL,
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `receiving_quantity` decimal(15,3) NOT NULL DEFAULT '1.000',
  PRIMARY KEY (`receiving_id`,`item_id`,`line`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_receivings_items_ibfk_2` FOREIGN KEY (`receiving_id`) REFERENCES `ospos_receivings` (`receiving_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_receivings_items`
--

LOCK TABLES `ospos_receivings_items` WRITE;
/*!40000 ALTER TABLE `ospos_receivings_items` DISABLE KEYS */;
INSERT INTO `ospos_receivings_items` VALUES (1,1,'',NULL,1,1.000,19000.00,19000.00,0.00,1,30.000),(2,1,'','',1,1.000,19000.00,19000.00,0.00,1,30.000),(3,1,'',NULL,1,10.000,50000.00,22000.00,0.00,1,30.000),(4,2,'','',1,1.000,23000.00,23000.00,0.00,1,30.000),(4,2,'','',2,-1.000,23000.00,23000.00,0.00,2,30.000),(5,2,'','',1,6.000,23000.00,23000.00,0.00,2,30.000),(5,2,'','',2,-6.000,23000.00,23000.00,0.00,1,30.000),(6,2,'',NULL,1,1.000,23000.00,8000.00,0.00,1,30.000),(7,3,'Celular Chafa','',1,1.000,3500.00,3500.00,0.00,1,15.000),(8,26,'','',6,2.000,33.00,33.00,0.00,2,11.000),(8,26,'','',7,-2.000,33.00,33.00,0.00,1,11.000),(8,30,'','',8,1.000,12.00,12.00,0.00,2,3.000),(8,30,'','',9,-1.000,12.00,12.00,0.00,1,3.000),(8,46,'','',12,1.000,12.00,12.00,0.00,2,2.000),(8,46,'','',13,-1.000,12.00,12.00,0.00,1,2.000),(8,59,'','',14,1.000,12.00,12.00,0.00,2,2.000),(8,59,'','',15,-1.000,12.00,12.00,0.00,1,2.000),(8,87,'','',10,1.000,12.00,12.00,0.00,2,1.000),(8,87,'','',11,-1.000,12.00,12.00,0.00,1,1.000);
/*!40000 ALTER TABLE `ospos_receivings_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales`
--

DROP TABLE IF EXISTS `ospos_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales` (
  `sale_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `customer_id` int(10) DEFAULT NULL,
  `employee_id` int(10) NOT NULL DEFAULT '0',
  `comment` text,
  `invoice_number` varchar(32) DEFAULT NULL,
  `quote_number` varchar(32) DEFAULT NULL,
  `sale_id` int(10) NOT NULL AUTO_INCREMENT,
  `sale_status` tinyint(2) NOT NULL DEFAULT '0',
  `dinner_table_id` int(11) DEFAULT NULL,
  `work_order_number` varchar(32) DEFAULT NULL,
  `sale_type` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`),
  UNIQUE KEY `invoice_number` (`invoice_number`),
  KEY `customer_id` (`customer_id`),
  KEY `employee_id` (`employee_id`),
  KEY `sale_time` (`sale_time`),
  KEY `dinner_table_id` (`dinner_table_id`),
  CONSTRAINT `ospos_sales_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `ospos_employees` (`person_id`),
  CONSTRAINT `ospos_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `ospos_customers` (`person_id`),
  CONSTRAINT `ospos_sales_ibfk_3` FOREIGN KEY (`dinner_table_id`) REFERENCES `ospos_dinner_tables` (`dinner_table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales`
--

LOCK TABLES `ospos_sales` WRITE;
/*!40000 ALTER TABLE `ospos_sales` DISABLE KEYS */;
INSERT INTO `ospos_sales` VALUES ('2018-10-04 00:04:10',NULL,2,'',NULL,NULL,1,0,NULL,NULL,0),('2018-10-04 23:02:49',4,1,'',NULL,NULL,2,0,NULL,NULL,0),('2018-10-05 00:13:01',NULL,2,'',NULL,NULL,3,0,NULL,NULL,4),('2018-10-05 00:15:00',5,2,'',NULL,NULL,4,0,NULL,NULL,4);
/*!40000 ALTER TABLE `ospos_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_items`
--

DROP TABLE IF EXISTS `ospos_sales_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_items` (
  `sale_id` int(10) NOT NULL DEFAULT '0',
  `item_id` int(10) NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `serialnumber` varchar(30) DEFAULT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `quantity_purchased` decimal(15,3) NOT NULL DEFAULT '0.000',
  `item_cost_price` decimal(15,2) NOT NULL,
  `item_unit_price` decimal(15,2) NOT NULL,
  `discount_percent` decimal(15,2) NOT NULL DEFAULT '0.00',
  `item_location` int(11) NOT NULL,
  `print_option` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`,`item_id`,`line`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  KEY `item_location` (`item_location`),
  CONSTRAINT `ospos_sales_items_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`),
  CONSTRAINT `ospos_sales_items_ibfk_2` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`),
  CONSTRAINT `ospos_sales_items_ibfk_3` FOREIGN KEY (`item_location`) REFERENCES `ospos_stock_locations` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_items`
--

LOCK TABLES `ospos_sales_items` WRITE;
/*!40000 ALTER TABLE `ospos_sales_items` DISABLE KEYS */;
INSERT INTO `ospos_sales_items` VALUES (1,1,'','',1,1.000,19000.00,25000.00,0.00,1,0),(2,1,'','',1,1.000,19000.00,25000.00,0.00,1,0),(3,2,'','',1,-1.000,23000.00,25000.00,0.00,1,0),(4,2,'','',1,-1.000,23000.00,25000.00,0.00,1,0);
/*!40000 ALTER TABLE `ospos_sales_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_items_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_items_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_items_taxes` (
  `sale_id` int(10) NOT NULL,
  `item_id` int(10) NOT NULL,
  `line` int(3) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `percent` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax_type` tinyint(2) NOT NULL DEFAULT '0',
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_tax` tinyint(2) NOT NULL DEFAULT '0',
  `cascade_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `item_tax_amount` decimal(15,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`sale_id`,`item_id`,`line`,`name`,`percent`),
  KEY `sale_id` (`sale_id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales_items` (`sale_id`),
  CONSTRAINT `ospos_sales_items_taxes_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `ospos_items` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_items_taxes`
--

LOCK TABLES `ospos_sales_items_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_sales_items_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_items_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_payments`
--

DROP TABLE IF EXISTS `ospos_sales_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_payments` (
  `sale_id` int(10) NOT NULL,
  `payment_type` varchar(40) NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  PRIMARY KEY (`sale_id`,`payment_type`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_sales_payments_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_payments`
--

LOCK TABLES `ospos_sales_payments` WRITE;
/*!40000 ALTER TABLE `ospos_sales_payments` DISABLE KEYS */;
INSERT INTO `ospos_sales_payments` VALUES (1,'Efectivo',25000.00),(2,'Deudado',25000.00),(3,'Efectivo',-25000.00),(4,'Efectivo',-25000.00);
/*!40000 ALTER TABLE `ospos_sales_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_reward_points`
--

DROP TABLE IF EXISTS `ospos_sales_reward_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_reward_points` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `earned` float NOT NULL,
  `used` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sale_id` (`sale_id`),
  CONSTRAINT `ospos_sales_reward_points_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `ospos_sales` (`sale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_reward_points`
--

LOCK TABLES `ospos_sales_reward_points` WRITE;
/*!40000 ALTER TABLE `ospos_sales_reward_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_reward_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sales_taxes`
--

DROP TABLE IF EXISTS `ospos_sales_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sales_taxes` (
  `sale_id` int(10) NOT NULL,
  `tax_type` smallint(2) NOT NULL,
  `tax_group` varchar(32) NOT NULL,
  `sale_tax_basis` decimal(15,4) NOT NULL,
  `sale_tax_amount` decimal(15,4) NOT NULL,
  `print_sequence` tinyint(2) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL,
  `sales_tax_code` varchar(32) NOT NULL DEFAULT '',
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sale_id`,`tax_type`,`tax_group`),
  KEY `print_sequence` (`sale_id`,`print_sequence`,`tax_type`,`tax_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sales_taxes`
--

LOCK TABLES `ospos_sales_taxes` WRITE;
/*!40000 ALTER TABLE `ospos_sales_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_sales_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_sessions`
--

DROP TABLE IF EXISTS `ospos_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_sessions`
--

LOCK TABLES `ospos_sessions` WRITE;
/*!40000 ALTER TABLE `ospos_sessions` DISABLE KEYS */;
INSERT INTO `ospos_sessions` VALUES ('d92d1dbda0edae80aecdeecb889a04c5a3e20c0f','192.168.64.1',1539558237,'__ci_last_regenerate|i:1539558237;person_id|s:1:\"1\";menu_group|s:4:\"home\";item_location|s:1:\"1\";sale_id|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:0;cash_rounding|i:0;sales_invoice_number|N;recv_cart|a:0:{}recv_mode|s:6:\"return\";recv_supplier|i:-1;'),('dd875f4926d82c47d822360a43113337dc0b8a32','192.168.64.1',1539559217,'__ci_last_regenerate|i:1539559217;person_id|s:1:\"1\";menu_group|s:4:\"home\";item_location|s:1:\"1\";sale_id|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:0;cash_rounding|i:0;sales_invoice_number|N;recv_cart|a:0:{}recv_mode|s:11:\"requisition\";recv_supplier|i:-1;recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";'),('9028e76e6a76abef44f6bbb6630c2473ebbf0f50','192.168.64.1',1539560649,'__ci_last_regenerate|i:1539560649;person_id|s:1:\"1\";menu_group|s:4:\"home\";item_location|s:1:\"1\";sale_id|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:0;cash_rounding|i:0;sales_invoice_number|N;recv_cart|a:0:{}recv_mode|s:11:\"requisition\";recv_supplier|i:-1;recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"1\";'),('826c4de0be3dca755699e1f3fb99c6269ae35970','192.168.64.1',1539561064,'__ci_last_regenerate|i:1539561064;person_id|s:1:\"1\";menu_group|s:4:\"home\";item_location|s:1:\"1\";sale_id|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:0;cash_rounding|i:0;sales_invoice_number|N;recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"2\";'),('40131e99a2d5d92fcfbbe4b471af28ef68a9d70e','192.168.64.1',1539562430,'__ci_last_regenerate|i:1539562430;person_id|s:1:\"1\";menu_group|s:6:\"office\";item_location|s:1:\"1\";sale_id|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:0;cash_rounding|i:0;sales_invoice_number|N;recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"2\";'),('d370c4361be9af6871f24d7710e869f67ad342d6','192.168.64.1',1539563796,'__ci_last_regenerate|i:1539563796;person_id|s:1:\"1\";menu_group|s:4:\"home\";item_location|s:1:\"1\";sale_id|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:0;cash_rounding|i:0;sales_invoice_number|N;recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"2\";'),('776f4dc17bf51266423eb89eb9e7088575c9bf6b','192.168.64.1',1539563940,'__ci_last_regenerate|i:1539563796;person_id|s:1:\"1\";menu_group|s:4:\"home\";item_location|s:1:\"1\";sale_id|i:-1;sales_cart|a:0:{}sales_customer|i:-1;sales_mode|s:4:\"sale\";sales_location|s:1:\"1\";sales_payments|a:0:{}cash_mode|i:0;cash_rounding|i:0;sales_invoice_number|N;recv_stock_source|s:1:\"1\";recv_stock_destination|s:1:\"2\";recv_cart|a:1:{i:1;a:15:{s:7:\"item_id\";s:2:\"98\";s:13:\"item_location\";s:1:\"1\";s:10:\"stock_name\";s:9:\"Teresa-01\";s:4:\"line\";i:1;s:4:\"name\";s:4:\"alfa\";s:11:\"description\";s:0:\"\";s:12:\"serialnumber\";s:0:\"\";s:21:\"allow_alt_description\";s:1:\"0\";s:13:\"is_serialized\";s:1:\"0\";s:8:\"quantity\";i:1;s:8:\"discount\";i:0;s:8:\"in_stock\";s:5:\"1.000\";s:5:\"price\";s:5:\"12.00\";s:18:\"receiving_quantity\";s:5:\"1.000\";s:5:\"total\";s:7:\"12.0000\";}}recv_mode|s:7:\"receive\";recv_supplier|i:-1;'),('802e22a15e894ad1bfcc896dd618e603620b39e4','127.0.0.1',1540179356,'__ci_last_regenerate|i:1540179356;'),('9d83ee3971072cf1072f56d1f106accaf10e9186','192.168.64.1',1540175281,'__ci_last_regenerate|i:1540175281;person_id|s:1:\"1\";menu_group|s:4:\"home\";'),('dcb3cc66f09c198b6835636b9c022923705f74b4','192.168.64.1',1540176960,'__ci_last_regenerate|i:1540176960;person_id|s:1:\"1\";menu_group|s:6:\"office\";'),('6aa267d1e04293c22c8c18305293c138da9e22f1','192.168.64.1',1540181733,'__ci_last_regenerate|i:1540181733;person_id|s:1:\"1\";menu_group|s:4:\"home\";'),('bad1224b57bbc2d1a38b83a29d6d86d6afa8e42d','127.0.0.1',1540179356,'__ci_last_regenerate|i:1540179356;'),('bcbdbe49eebbc2e63df9c73aec0d3943ce3f13fb','192.168.64.1',1540184018,'__ci_last_regenerate|i:1540184018;person_id|s:1:\"1\";menu_group|s:4:\"home\";'),('dea4feb525f228627e06eeb5efd15e0f95dbb5d0','192.168.64.1',1540184018,'__ci_last_regenerate|i:1540184018;person_id|s:1:\"1\";menu_group|s:4:\"home\";'),('1936d866a1a704af56a73b8a8ad8b8af787d64ad','192.168.64.1',1540270067,'__ci_last_regenerate|i:1540270012;person_id|s:1:\"1\";menu_group|s:6:\"office\";'),('84aa5dab6da65c7a420868bbe305c0bba1983a57','192.168.64.1',1540448569,'__ci_last_regenerate|i:1540443659;person_id|s:1:\"1\";menu_group|s:6:\"office\";'),('b989be822fcf7c378207464904c10f67181bce0e','192.168.64.1',1540444080,'__ci_last_regenerate|i:1540444080;person_id|s:1:\"2\";menu_group|s:4:\"home\";'),('15850773002b8a7609418474f770db31734f840c','192.168.64.1',1540444423,'__ci_last_regenerate|i:1540444423;person_id|s:1:\"2\";menu_group|s:4:\"home\";'),('1ecb807e32321cfca44f2875e9040e82237dbba1','192.168.64.1',1540444991,'__ci_last_regenerate|i:1540444991;person_id|s:1:\"2\";menu_group|s:4:\"home\";'),('46fa0fbde74ac8f6e830fc00020a52ba5af1622d','192.168.64.1',1540445308,'__ci_last_regenerate|i:1540445308;person_id|s:1:\"2\";menu_group|s:4:\"home\";'),('8538bb13943d8952d443ebb6ef4726057f52de59','192.168.64.1',1540445650,'__ci_last_regenerate|i:1540445650;person_id|s:1:\"2\";menu_group|s:4:\"home\";'),('b38b31ea3d94e2c69e6206c08326f7cede1da334','192.168.64.1',1540446261,'__ci_last_regenerate|i:1540446261;person_id|s:1:\"2\";menu_group|s:4:\"home\";'),('68d0586c5ef8e42c20325026631bdcf26b0e29b7','192.168.64.1',1540446923,'__ci_last_regenerate|i:1540446923;person_id|s:1:\"2\";menu_group|s:4:\"home\";item_location|s:1:\"1\";'),('f6b4f1c6d81e8f7d8683052503d94b62a39f9f1b','192.168.64.1',1540447691,'__ci_last_regenerate|i:1540447691;person_id|s:1:\"2\";menu_group|s:4:\"home\";item_location|s:1:\"1\";'),('504fcb99f680dd52b5d4ec28c5b6c7f34b6c7473','192.168.64.1',1540448033,'__ci_last_regenerate|i:1540448033;person_id|s:1:\"2\";menu_group|s:4:\"home\";item_location|s:1:\"1\";'),('a32df73bffdde7ab6416ea7f1a12829cd5f6e72b','192.168.64.1',1540448347,'__ci_last_regenerate|i:1540448347;person_id|s:1:\"2\";menu_group|s:4:\"home\";item_location|s:1:\"1\";'),('3bce945fef262900e751dece5172c75c83bad258','192.168.64.1',1540448673,'__ci_last_regenerate|i:1540448673;person_id|s:1:\"2\";menu_group|s:4:\"home\";item_location|s:1:\"1\";'),('89b1e77091018cbfffd3b4091f9b2213b8ea9bcf','192.168.64.1',1540448761,'__ci_last_regenerate|i:1540448673;person_id|s:1:\"2\";menu_group|s:4:\"home\";item_location|s:1:\"1\";');
/*!40000 ALTER TABLE `ospos_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_stock_locations`
--

DROP TABLE IF EXISTS `ospos_stock_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_stock_locations` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `location_name` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_stock_locations`
--

LOCK TABLES `ospos_stock_locations` WRITE;
/*!40000 ALTER TABLE `ospos_stock_locations` DISABLE KEYS */;
INSERT INTO `ospos_stock_locations` VALUES (1,'Teresa-01',0),(2,'Teresa-02',0);
/*!40000 ALTER TABLE `ospos_stock_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_suppliers`
--

DROP TABLE IF EXISTS `ospos_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_suppliers` (
  `person_id` int(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `agency_name` varchar(255) NOT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `deleted` int(1) NOT NULL DEFAULT '0',
  UNIQUE KEY `account_number` (`account_number`),
  KEY `person_id` (`person_id`),
  CONSTRAINT `ospos_suppliers_ibfk_1` FOREIGN KEY (`person_id`) REFERENCES `ospos_people` (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_suppliers`
--

LOCK TABLES `ospos_suppliers` WRITE;
/*!40000 ALTER TABLE `ospos_suppliers` DISABLE KEYS */;
INSERT INTO `ospos_suppliers` VALUES (3,'Telcel','Agencia Telcel','1',0),(6,'Chispita','Chispita CDMX','JM01',0);
/*!40000 ALTER TABLE `ospos_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_categories`
--

DROP TABLE IF EXISTS `ospos_tax_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_tax_categories` (
  `tax_category_id` int(10) NOT NULL AUTO_INCREMENT,
  `tax_category` varchar(32) NOT NULL,
  `tax_group_sequence` tinyint(2) NOT NULL,
  PRIMARY KEY (`tax_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_categories`
--

LOCK TABLES `ospos_tax_categories` WRITE;
/*!40000 ALTER TABLE `ospos_tax_categories` DISABLE KEYS */;
INSERT INTO `ospos_tax_categories` VALUES (1,'Standard',10),(2,'Service',12),(3,'Alcohol',11);
/*!40000 ALTER TABLE `ospos_tax_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_code_rates`
--

DROP TABLE IF EXISTS `ospos_tax_code_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_tax_code_rates` (
  `rate_tax_code` varchar(32) NOT NULL,
  `rate_tax_category_id` int(10) NOT NULL,
  `tax_rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `rounding_code` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rate_tax_code`,`rate_tax_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_code_rates`
--

LOCK TABLES `ospos_tax_code_rates` WRITE;
/*!40000 ALTER TABLE `ospos_tax_code_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_tax_code_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ospos_tax_codes`
--

DROP TABLE IF EXISTS `ospos_tax_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ospos_tax_codes` (
  `tax_code` varchar(32) NOT NULL,
  `tax_code_name` varchar(255) NOT NULL DEFAULT '',
  `tax_code_type` tinyint(2) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`tax_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ospos_tax_codes`
--

LOCK TABLES `ospos_tax_codes` WRITE;
/*!40000 ALTER TABLE `ospos_tax_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `ospos_tax_codes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-25  7:10:59
