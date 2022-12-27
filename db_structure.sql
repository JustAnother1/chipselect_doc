-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: 172.18.0.4    Database: microcontrollis
-- ------------------------------------------------------
-- Server version	10.10.2-MariaDB-1:10.10.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `microcontrollis`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `microcontrollis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `microcontrollis`;

--
-- Table structure for table `microcontroller`
--

DROP TABLE IF EXISTS `microcontroller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `microcontroller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `CPU_clock_max_MHz` float DEFAULT NULL,
  `Flash_size_kB` int(11) DEFAULT NULL,
  `RAM_size_kB` int(11) DEFAULT NULL,
  `Supply_Voltage_min_V` float DEFAULT NULL,
  `Supply_Voltage_max_V` float DEFAULT NULL,
  `Operating_Temperature_min_degC` float DEFAULT NULL,
  `Operating_Temperature_max_degC` float DEFAULT NULL,
  `svd_id` int(11) DEFAULT NULL,
  `Addressable_unit_bit` int(11) DEFAULT NULL,
  `bus_width_bit` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `market_state_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `RAM_size_byte` text DEFAULT NULL,
  `RAM_start_address` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(768))
) ENGINE=InnoDB AUTO_INCREMENT=20763 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_address_block`
--

DROP TABLE IF EXISTS `p_address_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_address_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_offset` text DEFAULT NULL,
  `size` text DEFAULT NULL,
  `mem_usage` text DEFAULT NULL,
  `protection` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35558 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_architecture`
--

DROP TABLE IF EXISTS `p_architecture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_architecture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `alternative` int(11) NOT NULL DEFAULT 0,
  `svd_name` text DEFAULT NULL,
  `revision` text DEFAULT NULL,
  `endian` text DEFAULT NULL,
  `hasMPU` tinyint(1) DEFAULT NULL,
  `hasFPU` tinyint(1) DEFAULT NULL,
  `interrupt_prio_bits` int(11) DEFAULT NULL,
  `ARM_Vendor_systick` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_enumeration`
--

DROP TABLE IF EXISTS `p_enumeration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_enumeration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `usage_right` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4150622 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_enumeration_element`
--

DROP TABLE IF EXISTS `p_enumeration_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_enumeration_element` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `isDefault` tinyint(1) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17562571 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_field`
--

DROP TABLE IF EXISTS `p_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `bit_offset` int(11) DEFAULT NULL,
  `size_bit` int(11) DEFAULT NULL,
  `access` text DEFAULT NULL,
  `modified_write_values` text DEFAULT NULL,
  `read_action` text DEFAULT NULL,
  `is_Enum` tinyint(1) DEFAULT NULL,
  `enum_name` text DEFAULT NULL,
  `enum_usage_right` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20440398 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_flash_bank`
--

DROP TABLE IF EXISTS `p_flash_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_flash_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_address` text DEFAULT NULL,
  `size` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32610 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_interrupt`
--

DROP TABLE IF EXISTS `p_interrupt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_interrupt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43031 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_log`
--

DROP TABLE IF EXISTS `p_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` text NOT NULL,
  `on_table` text NOT NULL,
  `on_id` int(11) DEFAULT NULL,
  `on_column` text DEFAULT NULL,
  `old_value` text DEFAULT NULL,
  `new_value` text DEFAULT NULL,
  `user` text NOT NULL,
  `time_of_change` datetime NOT NULL DEFAULT current_timestamp(),
  `accepted_by` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24524 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_market_state`
--

DROP TABLE IF EXISTS `p_market_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_market_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_package`
--

DROP TABLE IF EXISTS `p_package`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_package` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_peripheral`
--

DROP TABLE IF EXISTS `p_peripheral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_peripheral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113988 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_peripheral_instance`
--

DROP TABLE IF EXISTS `p_peripheral_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_peripheral_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `base_address` text DEFAULT NULL,
  `peripheral_id` int(11) DEFAULT NULL,
  `disable_Condition` text DEFAULT NULL,
  `group_name` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142818 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_register`
--

DROP TABLE IF EXISTS `p_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `display_name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `address_offset` text DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `access` text DEFAULT NULL,
  `reset_value` text DEFAULT NULL,
  `alternate_register` text DEFAULT NULL,
  `reset_mask` text DEFAULT NULL,
  `read_action` text DEFAULT NULL,
  `modified_write_values` text DEFAULT NULL,
  `data_type` text DEFAULT NULL,
  `alternate_group` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4419096 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_user`
--

DROP TABLE IF EXISTS `p_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `password` text NOT NULL,
  `full_name` text NOT NULL,
  `email` text NOT NULL,
  `roles` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `p_vendor`
--

DROP TABLE IF EXISTS `p_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_vendor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alternative` int(11) NOT NULL DEFAULT 0,
  `url` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=322 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_address_block`
--

DROP TABLE IF EXISTS `pl_address_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_address_block` (
  `per_id` int(11) NOT NULL,
  `addr_id` int(11) NOT NULL,
  PRIMARY KEY (`per_id`,`addr_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_enum_element`
--

DROP TABLE IF EXISTS `pl_enum_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_enum_element` (
  `field_id` int(11) NOT NULL,
  `enum_element_id` int(11) NOT NULL,
  PRIMARY KEY (`field_id`,`enum_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_enumeration`
--

DROP TABLE IF EXISTS `pl_enumeration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_enumeration` (
  `field_id` int(11) NOT NULL,
  `enum_id` int(11) NOT NULL,
  PRIMARY KEY (`field_id`,`enum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_enumeration_element`
--

DROP TABLE IF EXISTS `pl_enumeration_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_enumeration_element` (
  `enum_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  PRIMARY KEY (`enum_id`,`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_field`
--

DROP TABLE IF EXISTS `pl_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_field` (
  `reg_id` int(11) NOT NULL,
  `field_id` int(11) NOT NULL,
  PRIMARY KEY (`reg_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_field_enum_element`
--

DROP TABLE IF EXISTS `pl_field_enum_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_field_enum_element` (
  `field_id` int(11) NOT NULL,
  `value_id` int(11) NOT NULL,
  PRIMARY KEY (`field_id`,`value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_flash_bank`
--

DROP TABLE IF EXISTS `pl_flash_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_flash_bank` (
  `dev_id` int(11) NOT NULL,
  `flash_id` int(11) NOT NULL,
  PRIMARY KEY (`dev_id`,`flash_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_interrupt`
--

DROP TABLE IF EXISTS `pl_interrupt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_interrupt` (
  `per_in_id` int(11) NOT NULL,
  `irq_id` int(11) NOT NULL,
  PRIMARY KEY (`per_in_id`,`irq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_peripheral_instance`
--

DROP TABLE IF EXISTS `pl_peripheral_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_peripheral_instance` (
  `dev_id` int(11) NOT NULL,
  `per_in_id` int(11) NOT NULL,
  PRIMARY KEY (`dev_id`,`per_in_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pl_register`
--

DROP TABLE IF EXISTS `pl_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pl_register` (
  `per_id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  PRIMARY KEY (`per_id`,`reg_id`),
  KEY `per_idx` (`per_id`),
  KEY `reg_idx` (`reg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-26 22:53:54
