/*
SQLyog Professional v12.5.1 (64 bit)
MySQL - 8.0.25 : Database - oadb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oadb` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `oadb`;

/*Table structure for table `depart` */

DROP TABLE IF EXISTS `depart`;

CREATE TABLE `depart` (
  `did` int NOT NULL AUTO_INCREMENT,
  `dname` varchar(50) NOT NULL,
  `duty` varchar(255) NOT NULL,
  `credate` date NOT NULL,
  `dstatus` int DEFAULT '0',
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;

/*Data for the table `depart` */

insert  into `depart`(`did`,`dname`,`duty`,`credate`,`dstatus`) values 
(1,'boss','负责下达任务','2022-05-04',0),
(2,'行政部','负责传达领导通知，反馈各部门问题，打杂','2022-05-04',0),
(3,'人事部','负责公司员工招聘，培训，员工管理','2022-05-04',0),
(4,'开发部','负责产品开发','2022-05-04',0),
(5,'测试部','负责产品测试','2022-05-04',0),
(6,'市场部','负责业务销售','2022-05-04',0),
(7,'实施部','负责产品部署和客户培训','2022-05-04',1),
(8,'2','111','2022-07-14',1),
(9,'1','222','2022-07-21',1),
(10,'111','111','2022-07-21',1),
(11,'222','222','2022-07-21',1),
(12,'333','3339','2022-07-25',0),
(13,'菜市场','负责卖菜','2022-07-25',0);

/*Table structure for table `employee` */

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `eid` int NOT NULL AUTO_INCREMENT,
  `ename` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `epass` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '123456',
  `realname` varchar(50) NOT NULL,
  `esex` int NOT NULL,
  `entrydate` date NOT NULL,
  `leavedate` date DEFAULT NULL,
  `position` int NOT NULL,
  `sal` int NOT NULL,
  `estatus` int NOT NULL DEFAULT '0',
  `did` int DEFAULT NULL,
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;

/*Data for the table `employee` */

insert  into `employee`(`eid`,`ename`,`epass`,`realname`,`esex`,`entrydate`,`leavedate`,`position`,`sal`,`estatus`,`did`) values 
(1,'he','123456','boss',0,'2022-05-04',NULL,0,10000,0,1),
(2,'hjm','123456','黄佳敏',0,'2022-05-04',NULL,1,10000,0,2),
(3,'glx','123456','郭凌霞',1,'2022-05-04',NULL,1,10000,0,3),
(4,'cl','123456','成龙',0,'2022-05-04','2022-07-25',1,10000,0,3),
(5,'ft','123456','符涛',1,'2022-07-25',NULL,1,10000,0,5),
(6,'yc','123456','余灿',0,'2022-05-04',NULL,1,10000,0,6),
(7,'lxf','123456','廖晓凤',1,'2022-05-04',NULL,1,10000,0,7),
(8,'cgr','123456','陈桂荣',0,'2022-05-04',NULL,2,10000,1,2),
(9,'csq','123456','陈树琦',1,'2022-07-25',NULL,2,10000,1,2),
(10,'hhh','123456','胡鸿华',0,'2022-05-04',NULL,2,10000,0,2),
(11,'llt','123456','雷龙腾',1,'2022-05-04',NULL,2,10000,1,3),
(12,'pl','123456','彭雷',0,'2022-05-04',NULL,2,10000,1,3),
(13,'tyl','123456','谭延龙',1,'2022-05-04',NULL,2,10000,1,3),
(14,'wf','123456','王飞',0,'2022-05-04',NULL,2,10000,1,4),
(15,'wk','123456','王康',1,'2022-05-04',NULL,2,10000,1,4),
(16,'zj','123456','曾捷',0,'2022-05-04',NULL,2,10000,1,4),
(17,'jl','123456','蒋靓',1,'2022-05-04',NULL,2,10000,0,5),
(18,'lw','123456','刘雯',0,'2022-05-04',NULL,2,10000,0,5),
(19,'wjy','123456','王嘉义',1,'2022-05-04',NULL,2,10000,0,5),
(20,'wly','123456','文凌云',0,'2022-05-04',NULL,2,10000,1,6),
(21,'llf','123456','李念峰',1,'2022-05-04',NULL,2,10000,1,6),
(22,'lb','123456','罗斌',0,'2022-05-04',NULL,2,10000,1,6),
(23,'lzy','123456','罗志勇',1,'2022-05-04',NULL,2,10000,0,7),
(24,'scb','123456','苏成博',0,'2022-05-04',NULL,2,10000,0,7),
(25,'sxw','123456','孙小炜',1,'2022-05-04',NULL,2,10000,0,7),
(26,'hh','123456','QIU',1,'2022-07-19',NULL,1,10000,1,2),
(27,'hh','123456','213',0,'2022-07-19',NULL,0,10000,0,4),
(28,'hh','123456','342',0,'2022-07-19',NULL,1,10000,1,2),
(29,'1','123456','1',1,'2022-07-19',NULL,2,1,1,3),
(30,'2','123456','2',0,'2022-07-21','2022-07-25',2,2,1,4),
(31,'hh','123456','111',0,'2022-07-25','2022-07-25',0,10000,1,12),
(32,'ad','123456','成龙1',0,'2022-07-25',NULL,2,10000,0,3);

/*Table structure for table `imgpath` */

DROP TABLE IF EXISTS `imgpath`;

CREATE TABLE `imgpath` (
  `eid` int NOT NULL,
  `imgPath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '/img/timg.gif'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `imgpath` */

insert  into `imgpath`(`eid`,`imgPath`) values 
(1,'/img/timg.gif'),
(2,'/img/timg.gif'),
(3,'/img/timg.gif'),
(4,'/img/timg.gif'),
(5,'/img/timg.gif'),
(6,'/img/timg.gif'),
(7,'/img/timg.gif'),
(8,'/img/timg.gif'),
(9,'/img/timg.gif'),
(10,'/img/timg.gif'),
(11,'/img/timg.gif'),
(12,'/img/timg.gif'),
(13,'/img/timg.gif'),
(14,'/img/timg.gif'),
(15,'/img/timg.gif'),
(16,'/img/timg.gif'),
(17,'/img/timg.gif'),
(18,'/img/timg.gif'),
(19,'/img/timg.gif'),
(20,'/img/timg.gif'),
(21,'/img/timg.gif'),
(22,'/img/timg.gif'),
(23,'/img/timg.gif'),
(24,'/img/timg.gif'),
(25,'/img/timg.gif'),
(26,'/img/timg.gif'),
(27,'/img/timg.gif'),
(28,'/img/timg.gif'),
(29,'/img/timg.gif'),
(30,'/img/timg.gif');

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `nid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `context` varchar(255) NOT NULL,
  `startdate` date NOT NULL,
  `enddate` date NOT NULL,
  `length` float NOT NULL,
  `subdate` date NOT NULL,
  `estatus` int NOT NULL DEFAULT '0',
  `reldate` date DEFAULT NULL,
  `eid` int DEFAULT '1',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

/*Data for the table `note` */

insert  into `note`(`nid`,`title`,`context`,`startdate`,`enddate`,`length`,`subdate`,`estatus`,`reldate`,`eid`) values 
(1,'111','请假','2022-05-04','2022-05-05',1,'2022-05-04',1,'2022-05-04',1),
(2,'1','1','2022-07-02','2022-07-03',1,'2022-07-23',1,'2022-07-25',1),
(3,'1','1','2022-07-01','2022-07-02',1,'2022-07-23',3,NULL,1),
(4,'111','111','2022-07-21','2022-07-23',2,'2022-07-23',1,'2022-07-25',1),
(5,'111','111','2022-07-21','2022-07-23',2,'2022-07-23',2,NULL,1),
(6,'111','111','2022-07-21','2022-07-22',1,'2022-07-23',3,'2022-07-25',1),
(7,'111','111','2022-07-21','2022-07-23',111,'2022-07-23',3,NULL,1),
(8,'111','111','2022-07-21','2022-07-23',2,'2022-07-23',1,NULL,4),
(9,'222','222','2022-07-21','2022-07-23',1,'2022-07-25',0,NULL,4),
(10,'111','111','2022-07-21','2022-07-22',1,'2022-07-25',1,'2022-07-25',1),
(11,'4444','333','2022-07-23','2022-07-24',1,'2022-07-25',2,'2022-07-25',1),
(12,'7777','1111','2022-07-21','2022-07-23',2,'2022-07-25',1,'2022-07-25',1),
(13,'333','333','2022-07-21','2022-07-23',2,'2022-07-25',0,'2022-07-25',4),
(14,'回家','回家','2022-07-21','2022-07-23',2,'2022-07-25',0,NULL,1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
