/*
SQLyog Community v13.1.9 (64 bit)
MySQL - 8.0.32 : Database - lilo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lilo` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `lilo`;

/*Table structure for table `customer` */

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `costomer_id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`costomer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `customer` */

insert  into `customer`(`costomer_id`,`address`,`city`,`name`,`phone_num`,`state`,`zip`) values 
(1,'No 5801, 23rd C Main 22md Cross Vijayanagara 2nd Stage','Mysore ','PREETHAM M','09844601556','Karnataka ','570017'),
(2,'KK gate, new Mangalore Port trust, Panambur beach road','Dakshina Kannada','Suraj','07856459621','Karnataka','575010'),
(3,'indra nagar bangalore','BANGALORE','Ram','7845456230','Karnataka','589120'),
(4,'Deputy Commissioner Office, GiribhoviPalya, Siddarthanagar, ','Mysore ','James','7856123695','Karnataka ','570011'),
(5,'NO. 1561, S.O, 1562, High Tension Double Rd, II STAGE, Vijay Nagar 2nd Stage','Mysore ','Roshan M','8553663056','Karnataka ','570017'),
(6,'','','','','','');

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `discriptions` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  `costomer_id` int DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `FKh8haug3womgx46ux0l4atvssl` (`costomer_id`),
  CONSTRAINT `FKh8haug3womgx46ux0l4atvssl` FOREIGN KEY (`costomer_id`) REFERENCES `customer` (`costomer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `product` */

insert  into `product`(`product_id`,`discriptions`,`name`,`price`,`qty`,`units`,`costomer_id`) values 
(1,'Sukhoi Su-30MKI','Fighter jet','69000','5','No\'s',1),
(2,'Boeing CH-47 Chinook','Helicopter','65000','10','No\'s',1),
(3,'MS bolt 10mm dia','Bolt','69','20','KG',2),
(4,'MS nit 10mm dia','Nuts','58','20','KG',2),
(5,'Star head screw driver','Screw Driver','245','5','No\'s',2),
(6,'15mm dia self tapping screws','Screw','450','52','KG',2),
(7,'Exterior Paint ','Paint','3790','20','Ltr',2),
(8,'samsung A13 ','cell phone','13500','1','No\'s',3),
(9,'mi power bank 20000 mah','power bank','2199','2','No\'s',3),
(10,'HP OfficeJet Pro 8034e All-in-One Printer ','Printer','18562','2','No\'s',4),
(11,'A4 sheets, %0 GR','Paper','498','50','No\'s',4),
(12,'K&N Bike Air Filter For Bajaj Pulsar 220 DTS-i','Air Filter','5360','2','No\'s',5),
(13,'ESSON ACTION 20W40 4T 900ML P4 ACTION 900 P4 Conventional Engine Oil  (3600 ml)','Engine Oil','693','6','litre',5);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `emailadd` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

insert  into `user`(`user_id`,`emailadd`,`password`,`phone_number`,`user_name`) values 
(1,'admin@admin.com','admin@123','9844601556','admin'),
(2,'john@hotmail.com','12345678','8529637415','John'),
(3,'xyz@xyz.com','xyz','0000000000','xyz'),
(4,'jack@reddifmail.com','78956','8787959621','Jack'),
(5,'akash.ma@infopine.com','123456','9738232149','akash');

/*Table structure for table `xls_upload` */

DROP TABLE IF EXISTS `xls_upload`;

CREATE TABLE `xls_upload` (
  `xls_id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `discriptions` varchar(255) DEFAULT NULL,
  `phone_num` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `qty` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `units` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`xls_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `xls_upload` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
