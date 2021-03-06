/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.6.40 : Database - managesystem
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`managesystem` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `managesystem`;

/*Table structure for table `data` */

DROP TABLE IF EXISTS `data`;

CREATE TABLE `data` (
  `no` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `airtem` double DEFAULT NULL,
  `airhum` int(11) DEFAULT NULL,
  `soiltem` double DEFAULT NULL,
  `soilwater` int(11) DEFAULT NULL,
  `windspeed` double DEFAULT NULL,
  `winddir` double DEFAULT NULL,
  `light` double DEFAULT NULL,
  `thinkness` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `data` */

insert  into `data`(`no`,`time`,`airtem`,`airhum`,`soiltem`,`soilwater`,`windspeed`,`winddir`,`light`,`thinkness`) values 
(7501,'2018-10-03 11:13:36',29.78,26,29.25,0,0.3,177.1405,0,29.9987),
(7501,'2018-10-03 11:18:31',29.73,26,29.375,0,0.3,177.4124,0,29.9987),
(7501,'2018-10-03 11:24:37',29.97,25,29.1875,0,0.3,177.4124,0,29.9987),
(7501,'2018-10-20 17:53:51',22.35,27,21,0,0.3,179.2254,0,29.9987),
(7501,'2018-10-20 18:11:05',22.04,28,20.875,0,0.3,179.4066,0,29.9987),
(7501,'2018-10-20 18:17:11',21.99,29,20.8125,0,0.3,179.8599,0,29.9987),
(7501,'2018-10-20 18:37:17',22,29,20.75,0,0.3,179.9505,0,29.9987),
(7501,'2018-10-20 18:43:27',21.97,29,20.75,0,0.3,180.0412,0,29.9987),
(7501,'2018-10-20 18:55:58',21.91,29,20.6875,0,0.3,180.1318,0,29.9987),
(7501,'2018-10-20 19:23:14',21.78,30,20.625,0,0.3,180.0412,0,29.9987),
(7501,'2018-10-20 19:28:14',21.64,30,20.625,0,0.3,180.2225,0,29.9987),
(7501,'2018-10-20 19:32:21',21.76,30,20.625,0,0.3,180.0412,0,29.9987),
(7501,'2018-10-20 19:37:21',21.58,30,20.625,0,0.3,180.1318,0,29.9987),
(7501,'2018-10-20 19:44:37',21.74,30,20.5625,0,0.3,180.1318,0,29.9987),
(7501,'2018-10-20 19:50:29',21.69,30,20.5625,0,0.3,180.2225,0,29.9987),
(7501,'2018-10-20 20:02:37',21.66,31,20.5625,0,0.3,180.0412,0,29.9987),
(7501,'2018-10-20 20:11:41',21.64,31,20.5,0,0.3,180.1318,0,29.9987),
(7501,'2018-10-20 20:22:49',21.63,31,20.5,0,0.3,180.1318,0,29.9987),
(7501,'2018-10-20 20:27:49',21.46,31,20.5,0,0.3,180.0412,0,29.9987),
(7501,'2018-10-20 20:32:52',21.59,31,20.5,0,0.3,180.1318,0,29.9987),
(7501,'2018-10-20 20:37:52',21.45,31,20.4375,0,0.3,180.1318,0,29.9987),
(7501,'2018-10-20 20:44:57',21.58,31,20.4375,0,0.3,180.2225,0,29.9987),
(7501,'2018-10-20 21:00:02',21.38,31,20.4375,0,0.3,180.0412,0,29.9987),
(7501,'2018-10-20 21:04:10',21.53,31,20.4375,0,0.3,179.7693,0,29.9987),
(7501,'2018-10-23 20:58:57',22.19,34,21.1875,0,0.3,181.4009,0,29.9987),
(7501,'2018-10-23 21:17:08',22.28,34,21.1875,0,0.3,181.4916,0,29.9987),
(7501,'2018-10-23 21:22:08',22.11,34,21.125,0,0.3,181.4916,0,29.9987),
(7501,'2018-10-23 21:26:14',22.25,34,21.125,0,0.3,181.4009,0,29.9987),
(7501,'2018-10-23 21:31:14',22.08,34,21.125,0,0.3,181.4916,0,29.9987),
(7501,'2018-10-23 21:34:21',22.18,34,21.125,0,0.3,181.4009,0,29.9987),
(7501,'2018-10-23 21:39:21',22.04,34,21.0625,0,0.3,181.4916,0,29.9987),
(7501,'2018-10-23 21:46:27',22.16,34,21.0625,0,0.3,181.3103,0,29.9987),
(7501,'2018-10-25 19:45:37',21.78,36,20.9375,0,0.3,181.0384,0,29.9987),
(7501,'2018-10-25 19:50:37',21.62,36,20.9375,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 19:55:48',21.76,36,20.9375,0,0.3,181.0384,0,29.9987),
(7501,'2018-10-25 20:12:00',21.69,36,20.875,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 20:25:05',21.68,36,20.875,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 20:52:20',21.62,36,20.8125,0,0.3,181.2196,0,29.9987),
(7501,'2018-10-25 21:06:29',21.6,36,20.75,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 21:41:40',21.37,36,20.6875,0,0.3,181.0384,0,29.9987),
(7501,'2018-10-25 21:44:47',21.5,36,20.6875,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 21:49:47',21.36,36,20.6875,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 21:53:54',21.5,36,20.6875,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 21:58:54',21.35,36,20.6875,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 22:04:59',21.51,36,20.6875,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 22:09:59',21.34,36,20.6875,0,0.3,181.129,0,29.9987),
(7501,'2018-10-25 22:16:12',21.5,36,20.75,0,0.3,181.129,0,29.9987);

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `username` varchar(10) DEFAULT NULL,
  `password` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`username`,`password`) values 
('root','root');

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `no` int(11) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `grade` int(5) DEFAULT NULL,
  `thickness` double DEFAULT NULL,
  `operation` varchar(100) DEFAULT NULL,
  `operator` varchar(20) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record` */

insert  into `record`(`no`,`time`,`grade`,`thickness`,`operation`,`operator`,`remarks`) values 
(7501,'2018-10-26 22:26:12',1,29.9987,'无','谢洪鑫',''),
(7501,'2018-10-26 22:22:51',1,29.9987,'无','王岩','无'),
(7501,'2018-10-26 22:26:13',1,29.9987,'无','李鹏熙',''),
(7501,'2018-10-26 22:26:13',1,29.9987,'无','谢洪鑫',''),
(7501,'2018-10-26 22:26:15',1,29.9987,'无','谢洪鑫',''),
(7501,'2018-10-26 22:27:13',1,29.9987,'无','谢洪鑫','无'),
(7501,'2018-10-26 22:27:36',1,29.9987,'无','谢洪鑫',''),
(7501,'2018-10-26 23:10:51',1,29.9987,'无','谢洪鑫',''),
(7501,'2018-10-27 08:48:04',1,29.9987,'','新信息',''),
(7501,'2018-10-27 08:55:09',1,29.9987,'无','谢洪鑫','无');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
