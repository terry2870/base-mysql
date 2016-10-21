-- MySQL dump 10.13  Distrib 5.5.36, for Win64 (x86)
--
-- Host: 192.168.126.157    Database: base_project
-- ------------------------------------------------------
-- Server version	5.1.54

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
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(100) NOT NULL COMMENT '菜单名称',
  `menu_url` varchar(200) DEFAULT NULL COMMENT '菜单地址',
  `parent_menu_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `sort_number` int(11) DEFAULT NULL COMMENT '排序号',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `menu_type` varchar(50) DEFAULT NULL COMMENT '菜单类型',
  `button_id` varchar(50) DEFAULT NULL COMMENT '按钮的ID名称',
  `icon_name` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `target` varchar(50) DEFAULT NULL COMMENT '菜单指向',
  `extra_url` varchar(200) DEFAULT NULL COMMENT '额外参数',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',NULL,0,2,'A','2013-12-31 16:00:01','ROOT',NULL,NULL,NULL,NULL),(2,'用户管理','/jsp/sysManage/sysUser/userList.jsp',1,1,'A','2013-12-31 16:00:01','CHILD',NULL,NULL,NULL,NULL),(3,'角色管理','/jsp/sysManage/sysRole/roleList.jsp',1,2,'A','2013-12-31 16:00:01','CHILD',NULL,NULL,NULL,NULL),(4,'菜单管理','/jsp/sysManage/sysMenu/menuList.jsp',1,3,'A','2013-12-31 16:00:01','CHILD',NULL,NULL,NULL,NULL),(5,'查询角色',NULL,3,1,'A','2013-12-31 16:00:01','BUTTON',NULL,NULL,NULL,'queryAllRoles.do'),(6,'新增角色','',3,2,'A','2013-12-31 16:00:01','BUTTON','addRoleBtn','',NULL,'roleEdit.jsp'),(9,'修改角色','',3,3,'A','2013-12-31 16:00:01','BUTTON','editRoleBtn','',NULL,'roleEdit.jsp'),(10,'保存角色','',3,4,'A','2013-12-31 16:00:01','BUTTON','saveRoleBtn','',NULL,'roleSave.do'),(11,'删除角色','',3,5,'A','2013-12-31 16:00:01','BUTTON','delRoleBtn','',NULL,'roleDelete.do'),(12,'查询角色权限','',3,6,'A','2013-12-31 16:00:01','BUTTON','addMenuRightBtn','',NULL,'roleMenuEdit.jsp,queryAllMenu.do,queryRoleMenuByRoleId.do'),(13,'保存角色权限','',3,7,'A','2013-12-31 16:00:01','BUTTON','saveMenuRightBtn','',NULL,'addRoleMenu.do'),(14,'查询用户',NULL,2,1,'A','2013-12-31 16:00:01','BUTTON',NULL,NULL,NULL,'userSearch.jsp,queryAllSysUser.do'),(15,'新增用户','',2,2,'A','2013-12-31 16:00:01','BUTTON','addUserBtn','',NULL,'userEdit.jsp,queryUserRegion.do'),(16,'修改用户','',2,3,'A','2013-12-31 16:00:01','BUTTON','editUserBtn','',NULL,'userEdit.jsp,queryUserRegion.do'),(17,'保存用户','',2,4,'A','2013-12-31 16:00:01','BUTTON','saveUserBtn','',NULL,'saveUser.do'),(18,'删除用户','',2,5,'A','2013-12-31 16:00:01','BUTTON','delUserBtn','',NULL,'deleteUser.do'),(43,'修改密码','/jsp/sysManage/pwdManage/modifyPwd.jsp',1,5,'A','2013-12-31 16:00:01','CHILD',NULL,'',NULL,''),(44,'地区管理','/jsp/sysManage/sysRegion/regionList.jsp',1,4,'A','2014-03-14 02:22:39','CHILD',NULL,'',NULL,'queryAllRegion.do,regionRight.jsp,deleteSysregion.do,saveSysRegion.do'),(46,'用户组管理','/jsp/sysManage/sysUserGroup/userGroupList.jsp',1,6,'A','2014-03-15 02:17:49','CHILD',NULL,NULL,NULL,'queryAllSysUserGroup.do'),(47,'查询',NULL,46,1,'A','2014-03-15 02:17:49','BUTTON',NULL,NULL,NULL,'queryAllSysUserGroup.do'),(48,'新增',NULL,46,2,'A','2014-03-15 02:17:49','BUTTON','addUserGroupBtn',NULL,NULL,'userGroupEdit.jsp'),(49,'修改',NULL,46,3,'A','2014-03-15 02:17:49','BUTTON','editUserGroupBtn',NULL,NULL,'userGroupEdit.jsp'),(50,'删除',NULL,46,4,'A','2014-03-15 02:17:49','BUTTON','delUserGroupBtn',NULL,NULL,'deleteSysUserGroup.do'),(51,'保存',NULL,46,5,'A','2014-03-15 02:17:49','BUTTON','saveUserGroupBtn',NULL,NULL,'saveSysUserGroup.do'),(52,'配置用户组用户','',46,6,'A','2014-03-25 06:48:21','BUTTON','configUserGroupUserBtn','',NULL,'userGroupUser.jsp,queryForSelectUserByGroupId.do,querySysUserGroupByGroupId.do'),(53,'保存配置用户组用户','',46,7,'A','2014-03-25 06:49:08','BUTTON','saveConfigUserGroupUserBtn','',NULL,'addSysUserGroupUser.do'),(54,'详情','',2,6,'A','2014-05-28 12:08:38','BUTTON','detailUserBtn','',NULL,'userEdit.jsp,queryUserRegion.do'),(55,'详情','',3,8,'A','2014-05-28 12:09:13','BUTTON','detailRoleBtn','',NULL,'roleEdit.jsp'),(56,'详情','',46,8,'A','2014-05-28 12:09:47','BUTTON','detailUserGroupBtn','',NULL,'userGroupEdit.jsp'),(57,'asd','asd',1,33,'A','2014-12-25 05:56:14','CHILD','','22',NULL,'sad'),(7,'新增节点',NULL,0,3,'A','2013-12-31 16:00:01','ROOT',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_pwd_history`
--

DROP TABLE IF EXISTS `sys_pwd_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_pwd_history` (
  `pwd_his_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '历史密码ID',
  `login_pwd` varchar(200) NOT NULL COMMENT '历史密码',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `pwd_create_date` timestamp NOT NULL DEFAULT '1989-12-31 16:00:01' COMMENT '密码创建日期',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`pwd_his_id`),
  UNIQUE KEY `pwd_his_id` (`pwd_his_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户历史密码';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_pwd_history`
--

LOCK TABLES `sys_pwd_history` WRITE;
/*!40000 ALTER TABLE `sys_pwd_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_pwd_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_region`
--

DROP TABLE IF EXISTS `sys_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_region` (
  `region_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '地区ID',
  `region_name` varchar(100) NOT NULL COMMENT '地区名称',
  `region_code` varchar(100) DEFAULT NULL COMMENT '地区编号',
  `region_type` varchar(50) DEFAULT NULL COMMENT '地区类型',
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父节点ID',
  `sort_number` int(11) DEFAULT NULL COMMENT '地区排序',
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=367 DEFAULT CHARSET=utf8 COMMENT='地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_region`
--

LOCK TABLES `sys_region` WRITE;
/*!40000 ALTER TABLE `sys_region` DISABLE KEYS */;
INSERT INTO `sys_region` VALUES (1,'安徽','551','PROVINCE',0,NULL),(2,'北京','100','PROVINCE',0,NULL),(3,'福建','591','PROVINCE',0,NULL),(4,'甘肃','931','PROVINCE',0,NULL),(5,'广东','200','PROVINCE',0,NULL),(6,'广西','771','PROVINCE',0,NULL),(7,'贵州','851','PROVINCE',0,NULL),(8,'海南','898','PROVINCE',0,NULL),(9,'河北','311','PROVINCE',0,NULL),(10,'河南','371','PROVINCE',0,NULL),(11,'黑龙江','451','PROVINCE',0,NULL),(12,'湖北','270','PROVINCE',0,NULL),(13,'湖南','731','PROVINCE',0,NULL),(14,'吉林','431','PROVINCE',0,NULL),(15,'江苏','250','PROVINCE',0,NULL),(16,'江西','791','PROVINCE',0,NULL),(17,'辽宁','240','PROVINCE',0,NULL),(18,'内蒙古','471','PROVINCE',0,NULL),(19,'宁夏','951','PROVINCE',0,NULL),(20,'青海','971','PROVINCE',0,NULL),(21,'山东','531','PROVINCE',0,NULL),(22,'山西','351','PROVINCE',0,NULL),(23,'陕西','290','PROVINCE',0,NULL),(24,'上海','210','PROVINCE',0,NULL),(25,'四川','280','PROVINCE',0,NULL),(26,'天津','220','PROVINCE',0,NULL),(27,'西藏','891','PROVINCE',0,NULL),(28,'新疆','991','PROVINCE',0,NULL),(29,'云南','871','PROVINCE',0,NULL),(30,'浙江','571','PROVINCE',0,NULL),(31,'重庆','023','PROVINCE',0,NULL),(32,'凉山','0834','CITY',25,NULL),(33,'眉山','0833','CITY',25,NULL),(34,'绵阳','0816','CITY',25,NULL),(35,'南充','0817','CITY',25,NULL),(36,'内江','0832','CITY',25,NULL),(37,'攀枝花','0812','CITY',25,NULL),(38,'遂宁','0825','CITY',25,NULL),(39,'雅安','0835','CITY',25,NULL),(40,'宜宾','0831','CITY',25,NULL),(41,'资阳','0832','CITY',25,NULL),(42,'自贡','0813','CITY',25,NULL),(43,'泸州','0830','CITY',25,NULL),(44,'天津','022','CITY',26,NULL),(45,'阿里','0897','CITY',27,NULL),(46,'昌都','0895','CITY',27,NULL),(47,'拉萨','0891','CITY',27,NULL),(48,'林芝','0894','CITY',27,NULL),(49,'那曲','0896','CITY',27,NULL),(50,'日喀则','0892','CITY',27,NULL),(51,'山南','0893','CITY',27,NULL),(52,'阿克苏','0997','CITY',28,NULL),(53,'阿勒泰','0906','CITY',28,NULL),(54,'博乐','0909','CITY',28,NULL),(55,'昌吉','0994','CITY',28,NULL),(56,'哈密','0902','CITY',28,NULL),(57,'和田','0903','CITY',28,NULL),(58,'喀什','0998','CITY',28,NULL),(59,'克拉玛依','0990','CITY',28,NULL),(60,'克州','0908','CITY',28,NULL),(61,'库尔勒','0996','CITY',28,NULL),(62,'奎屯','0992','CITY',28,NULL),(63,'石河子','0993','CITY',28,NULL),(64,'塔城','0901','CITY',28,NULL),(65,'吐鲁番','0995','CITY',28,NULL),(66,'乌鲁木齐','0991','CITY',28,NULL),(67,'伊犁','0999','CITY',28,NULL),(68,'版纳','0691','CITY',29,NULL),(69,'保山','0875','CITY',29,NULL),(70,'楚雄','0878','CITY',29,NULL),(71,'大理','0872','CITY',29,NULL),(72,'德宏','0692','CITY',29,NULL),(73,'迪庆','0887','CITY',29,NULL),(74,'红河','0873','CITY',29,NULL),(75,'昆明','0871','CITY',29,NULL),(76,'丽江','0888','CITY',29,NULL),(77,'临沧','0883','CITY',29,NULL),(78,'怒江','0886','CITY',29,NULL),(79,'曲靖','0874','CITY',29,NULL),(80,'思茅','0879','CITY',29,NULL),(81,'文山','0876','CITY',29,NULL),(82,'玉溪','0877','CITY',29,NULL),(83,'昭通','0870','CITY',29,NULL),(84,'杭州','0571','CITY',30,NULL),(85,'湖州','0572','CITY',30,NULL),(86,'嘉兴','0573','CITY',30,NULL),(87,'金华','0579','CITY',30,NULL),(88,'丽水','0578','CITY',30,NULL),(89,'宁波','0574','CITY',30,NULL),(90,'绍兴','0575','CITY',30,NULL),(91,'台州','0576','CITY',30,NULL),(92,'温州','0577','CITY',30,NULL),(93,'舟山','0580','CITY',30,NULL),(94,'衢州','0570','CITY',30,NULL),(95,'涪陵','023','CITY',31,NULL),(96,'黔江','023','CITY',31,NULL),(97,'万州','023','CITY',31,NULL),(98,'赣州','0797','CITY',16,NULL),(99,'萍乡','0799','CITY',16,NULL),(100,'鹰潭','0701','CITY',16,NULL),(101,'抚顺','0413','CITY',17,NULL),(102,'辽阳','0419','CITY',17,NULL),(103,'巴彦浩特','0483','CITY',18,NULL),(104,'呼和浩特','0471','CITY',18,NULL),(105,'锡林浩特','0479','CITY',18,NULL),(106,'德令哈','0977','CITY',20,NULL),(107,'黄南','0973','CITY',20,NULL),(108,'东营','0546','CITY',21,NULL),(109,'青岛','0532','CITY',21,NULL),(110,'烟台','0535','CITY',21,NULL),(111,'晋城','0356','CITY',22,NULL),(112,'太原','0351','CITY',22,NULL),(113,'汉中','0916','CITY',23,NULL),(114,'咸阳','029','CITY',23,NULL),(115,'巴中','0827','CITY',25,NULL),(116,'广安','0826','CITY',25,NULL),(117,'吴忠','0953','CITY',19,NULL),(118,'共和','0974','CITY',20,NULL),(119,'西宁','0971','CITY',20,NULL),(120,'菏泽','0530','CITY',21,NULL),(121,'临沂','0539','CITY',21,NULL),(122,'潍坊','0536','CITY',21,NULL),(123,'大同','0352','CITY',22,NULL),(124,'朔州','0349','CITY',22,NULL),(125,'安康','0915','CITY',23,NULL),(126,'渭南','0913','CITY',23,NULL),(127,'上海','021','CITY',24,NULL),(128,'德阳','0838','CITY',25,NULL),(129,'安庆','0556','CITY',1,NULL),(130,'蚌埠','0552','CITY',1,NULL),(131,'巢湖','0565','CITY',1,NULL),(132,'池州','0566','CITY',1,NULL),(133,'滁州','0550','CITY',1,NULL),(134,'阜阳','0558','CITY',1,NULL),(135,'合肥','0551','CITY',1,NULL),(136,'淮北','0561','CITY',1,NULL),(137,'淮南','0554','CITY',1,NULL),(138,'黄山','0559','CITY',1,NULL),(139,'六安','0564','CITY',1,NULL),(140,'马鞍山','0555','CITY',1,NULL),(141,'宿州','0557','CITY',1,NULL),(142,'铜陵','0562','CITY',1,NULL),(143,'芜湖','0553','CITY',1,NULL),(144,'宣城','0563','CITY',1,NULL),(145,'北京','010','CITY',2,NULL),(146,'福州','0591','CITY',3,NULL),(147,'龙岩','0597','CITY',3,NULL),(148,'南平','0599','CITY',3,NULL),(149,'宁德','0593','CITY',3,NULL),(150,'莆田','0594','CITY',3,NULL),(151,'泉州','0595','CITY',3,NULL),(152,'三明','0598','CITY',3,NULL),(153,'厦门','0592','CITY',3,NULL),(154,'漳州','0596','CITY',3,NULL),(155,'白银','0943','CITY',4,NULL),(156,'定西','0932','CITY',4,NULL),(157,'甘南','0941','CITY',4,NULL),(158,'金昌武威','0935','CITY',4,NULL),(159,'酒泉嘉峪关','0937','CITY',4,NULL),(160,'兰州','0931','CITY',4,NULL),(161,'临夏','0930','CITY',4,NULL),(162,'陇南','0939','CITY',4,NULL),(163,'平凉','0933','CITY',4,NULL),(164,'庆阳','0934','CITY',4,NULL),(165,'天水','0938','CITY',4,NULL),(166,'张掖','0936','CITY',4,NULL),(167,'潮州','0768','CITY',5,NULL),(168,'东莞','0769','CITY',5,NULL),(169,'佛山','0757','CITY',5,NULL),(170,'广州','020','CITY',5,NULL),(171,'河源','0762','CITY',5,NULL),(172,'惠州','0752','CITY',5,NULL),(173,'江门','0750','CITY',5,NULL),(174,'揭阳','0663','CITY',5,NULL),(175,'茂名','0668','CITY',5,NULL),(176,'梅州','0753','CITY',5,NULL),(177,'清远','0763','CITY',5,NULL),(178,'汕头','0754','CITY',5,NULL),(179,'汕尾','0660','CITY',5,NULL),(180,'韶关','0751','CITY',5,NULL),(181,'深圳','0755','CITY',5,NULL),(182,'阳江','0662','CITY',5,NULL),(183,'云浮','0766','CITY',5,NULL),(184,'湛江','0759','CITY',5,NULL),(185,'肇庆','0758','CITY',5,NULL),(186,'中山','0760','CITY',5,NULL),(187,'珠海','0756','CITY',5,NULL),(188,'百色','0776','CITY',6,NULL),(189,'北海','0779','CITY',6,NULL),(190,'防城港','0770','CITY',6,NULL),(191,'桂林','0773','CITY',6,NULL),(192,'河池','0778','CITY',6,NULL),(193,'柳州','0772','CITY',6,NULL),(194,'南宁','0771','CITY',6,NULL),(195,'钦州','0777','CITY',6,NULL),(196,'梧州','0774','CITY',6,NULL),(197,'玉林','0775','CITY',6,NULL),(198,'安顺','0853','CITY',7,NULL),(199,'毕节','0857','CITY',7,NULL),(200,'都匀','0854','CITY',7,NULL),(201,'贵阳','0851','CITY',7,NULL),(202,'凯里','0855','CITY',7,NULL),(203,'六盘水','0858','CITY',7,NULL),(204,'铜仁','0856','CITY',7,NULL),(205,'兴义','0859','CITY',7,NULL),(206,'遵义','0852','CITY',7,NULL),(207,'海口','0898','CITY',8,NULL),(208,'保定','0312','CITY',9,NULL),(209,'沧州','0317','CITY',9,NULL),(210,'承德','0314','CITY',9,NULL),(211,'邯郸','0310','CITY',9,NULL),(212,'衡水','0318','CITY',9,NULL),(213,'廊坊','0316','CITY',9,NULL),(214,'石家庄','0311','CITY',9,NULL),(215,'邢台','0319','CITY',9,NULL),(216,'张家口','0313','CITY',9,NULL),(217,'安阳','0372','CITY',10,NULL),(218,'鹤壁','0392','CITY',10,NULL),(219,'焦作','0391','CITY',10,NULL),(220,'开封','0378','CITY',10,NULL),(221,'洛阳','0379','CITY',10,NULL),(222,'南阳','0377','CITY',10,NULL),(223,'平顶山','0375','CITY',10,NULL),(224,'三门峡','0398','CITY',10,NULL),(225,'商丘','0370','CITY',10,NULL),(226,'新乡','0373','CITY',10,NULL),(227,'信阳','0376','CITY',10,NULL),(228,'许昌','0374','CITY',10,NULL),(229,'郑州','0371','CITY',10,NULL),(230,'周口','0394','CITY',10,NULL),(231,'驻马店','0396','CITY',10,NULL),(232,'潢川','0376','CITY',10,NULL),(233,'漯河','0395','CITY',10,NULL),(234,'濮阳','0393','CITY',10,NULL),(235,'大庆','0459','CITY',11,NULL),(236,'大兴安岭','0456','CITY',11,NULL),(237,'哈尔滨','0451','CITY',11,NULL),(238,'鹤岗','0454','CITY',11,NULL),(239,'黑河','0456','CITY',11,NULL),(240,'鸡西','0453','CITY',11,NULL),(241,'佳木斯','0454','CITY',11,NULL),(242,'牡丹江','0453','CITY',11,NULL),(243,'七台河','0453','CITY',11,NULL),(244,'齐齐哈尔','0452','CITY',11,NULL),(245,'双鸭山','0454','CITY',11,NULL),(246,'绥化','0458','CITY',11,NULL),(247,'伊春','0458','CITY',11,NULL),(248,'鄂州','0711','CITY',12,NULL),(249,'恩施','0718','CITY',12,NULL),(250,'黄冈','0713','CITY',12,NULL),(251,'黄石','0714','CITY',12,NULL),(252,'江汉','0728','CITY',12,NULL),(253,'荆门','0724','CITY',12,NULL),(254,'荆州','0716','CITY',12,NULL),(255,'十堰','0719','CITY',12,NULL),(256,'随州','0722','CITY',12,NULL),(257,'武汉','027','CITY',12,NULL),(258,'咸宁','0715','CITY',12,NULL),(259,'襄樊','0710','CITY',12,NULL),(260,'孝感','0712','CITY',12,NULL),(261,'宜昌','0717','CITY',12,NULL),(262,'常德','0736','CITY',13,NULL),(263,'长沙','0731','CITY',13,NULL),(264,'郴州','0735','CITY',13,NULL),(265,'衡阳','0734','CITY',13,NULL),(266,'怀化','0745','CITY',13,NULL),(267,'吉首','0743','CITY',13,NULL),(268,'娄底','0738','CITY',13,NULL),(269,'邵阳','0739','CITY',13,NULL),(270,'湘潭','0732','CITY',13,NULL),(271,'益阳','0737','CITY',13,NULL),(272,'永州','0746','CITY',13,NULL),(273,'岳阳','0730','CITY',13,NULL),(274,'张家界','0744','CITY',13,NULL),(275,'株洲','0733','CITY',13,NULL),(276,'白城','0436','CITY',14,NULL),(277,'白山','0439','CITY',14,NULL),(278,'长春','0431','CITY',14,NULL),(279,'吉林','0432','CITY',14,NULL),(280,'辽源','0437','CITY',14,NULL),(281,'梅河口','0435','CITY',14,NULL),(282,'四平','0434','CITY',14,NULL),(283,'松原','0438','CITY',14,NULL),(284,'通化','0435','CITY',14,NULL),(285,'延吉','0433','CITY',14,NULL),(286,'珲春','0433','CITY',14,NULL),(287,'常州','0519','CITY',15,NULL),(288,'淮安','0517','CITY',15,NULL),(289,'连云港','0518','CITY',15,NULL),(290,'南京','025','CITY',15,NULL),(291,'南通','0513','CITY',15,NULL),(292,'苏州','0512','CITY',15,NULL),(293,'宿迁','0527','CITY',15,NULL),(294,'泰州','0523','CITY',15,NULL),(295,'无锡','0510','CITY',15,NULL),(296,'徐州','0516','CITY',15,NULL),(297,'盐城','0515','CITY',15,NULL),(298,'扬州','0514','CITY',15,NULL),(299,'镇江','0511','CITY',15,NULL),(300,'抚州','0794','CITY',16,NULL),(301,'吉安','0796','CITY',16,NULL),(302,'景德镇','0798','CITY',16,NULL),(303,'九江','0792','CITY',16,NULL),(304,'南昌','0791','CITY',16,NULL),(305,'上饶','0793','CITY',16,NULL),(306,'新余','0790','CITY',16,NULL),(307,'宜春','0795','CITY',16,NULL),(308,'鞍山','0412','CITY',17,NULL),(309,'朝阳','0421','CITY',17,NULL),(310,'大连','0411','CITY',17,NULL),(311,'阜新','0418','CITY',17,NULL),(312,'葫芦岛','0429','CITY',17,NULL),(313,'锦州','0416','CITY',17,NULL),(314,'盘锦','0427','CITY',17,NULL),(315,'沈阳','024','CITY',17,NULL),(316,'铁岭','0410','CITY',17,NULL),(317,'营口','0417','CITY',17,NULL),(318,'包头','0472','CITY',18,NULL),(319,'赤峰','0476','CITY',18,NULL),(320,'鄂尔多斯','0477','CITY',18,NULL),(321,'海拉尔','0470','CITY',18,NULL),(322,'集宁','0474','CITY',18,NULL),(323,'临河','0478','CITY',18,NULL),(324,'通辽','0475','CITY',18,NULL),(325,'乌兰浩特','0482','CITY',18,NULL),(326,'固原','0954','CITY',19,NULL),(327,'石嘴山','0952','CITY',19,NULL),(328,'银川','0951','CITY',19,NULL),(329,'中卫','0955','CITY',19,NULL),(330,'格尔木','0979','CITY',20,NULL),(331,'果洛','0975','CITY',20,NULL),(332,'海东','0972','CITY',20,NULL),(333,'海晏','0970','CITY',20,NULL),(334,'玉树','0976','CITY',20,NULL),(335,'滨州','0543','CITY',21,NULL),(336,'德州','0534','CITY',21,NULL),(337,'济南','0531','CITY',21,NULL),(338,'济宁','0537','CITY',21,NULL),(339,'莱芜','0634','CITY',21,NULL),(340,'聊城','0635','CITY',21,NULL),(341,'日照','0633','CITY',21,NULL),(342,'泰安','0538','CITY',21,NULL),(343,'威海','0631','CITY',21,NULL),(344,'枣庄','0632','CITY',21,NULL),(345,'淄博','0533','CITY',21,NULL),(346,'长治','0355','CITY',22,NULL),(347,'晋中','0354','CITY',22,NULL),(348,'临汾','0357','CITY',22,NULL),(349,'吕梁','0358','CITY',22,NULL),(350,'忻州','0350','CITY',22,NULL),(351,'阳泉','0353','CITY',22,NULL),(352,'运城','0359','CITY',22,NULL),(353,'宝鸡','0917','CITY',23,NULL),(354,'商洛','0914','CITY',23,NULL),(355,'铜川','0919','CITY',23,NULL),(356,'西安','029','CITY',23,NULL),(357,'延安','0911','CITY',23,NULL),(358,'榆林','0912','CITY',23,NULL),(359,'阿坝','0837','CITY',25,NULL),(360,'成都','028','CITY',25,NULL),(361,'达州','0818','CITY',25,NULL),(362,'甘孜','0836','CITY',25,NULL),(363,'广元','0839','CITY',25,NULL);
/*!40000 ALTER TABLE `sys_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(50) NOT NULL COMMENT '角色名称',
  `role_info` varchar(400) DEFAULT NULL COMMENT '角色描述',
  `status` char(1) DEFAULT NULL COMMENT '角色状态',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建者ID',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id` (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'测试','','A',1,'2014-03-12 02:38:19');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统角色菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (1,14),(1,54),(1,5),(1,55),(1,43),(1,47),(1,56);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(100) NOT NULL COMMENT '用户名',
  `login_name` varchar(50) NOT NULL COMMENT '登录名',
  `login_pwd` varchar(100) NOT NULL COMMENT '登录密码',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `address` varchar(200) DEFAULT NULL COMMENT '用户地址',
  `email` varchar(100) DEFAULT NULL COMMENT 'email',
  `role_id` int(11) DEFAULT NULL COMMENT '角色ID',
  `status` char(1) NOT NULL COMMENT '用户状态',
  `last_login_date` timestamp NOT NULL DEFAULT '1989-12-31 16:00:01' COMMENT '最后登录日期',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `create_user_id` int(11) NOT NULL COMMENT '创建者ID',
  `time_out_date` timestamp NOT NULL DEFAULT '1989-12-31 16:00:01' COMMENT '用户失效日期',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `login_name` (`login_name`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_name_2` (`user_name`),
  UNIQUE KEY `login_name_2` (`login_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'艾德敏','admin','21232f297a57a5a743894a0e4a801fc3','13951882433','0514-4688386','江苏南京','terry1255@163.com',0,'A','2014-12-25 05:55:46','2013-12-31 16:00:01',0,'2014-03-11 07:00:29'),(2,'test','test','670b14728ad9902aecba32e22fa4f6bd','','','','',1,'A','2014-05-28 12:12:05','2014-03-12 01:53:52',1,'2014-06-11 16:00:00'),(14,'test1','test1','670b14728ad9902aecba32e22fa4f6bd','','','','',0,'A','1989-12-31 16:00:01','2014-03-25 09:55:16',2,'2014-06-22 16:00:00'),(15,'test2','test2','670b14728ad9902aecba32e22fa4f6bd','','','','',0,'A','1989-12-31 16:00:01','2014-03-25 09:55:43',2,'2014-06-22 16:00:00');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_action_log`
--

DROP TABLE IF EXISTS `sys_user_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_action_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `log_info` longtext COMMENT '日志信息',
  `log_type` varchar(50) NOT NULL COMMENT '日志类型',
  `user_ip` varchar(100) DEFAULT NULL COMMENT '用户IP',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期',
  `log_class` varchar(500) DEFAULT NULL COMMENT '日志的操作CLASS类名',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `log_id` (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_action_log`
--

LOCK TABLES `sys_user_action_log` WRITE;
/*!40000 ALTER TABLE `sys_user_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_user_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_group`
--

DROP TABLE IF EXISTS `sys_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户组ID',
  `group_name` varchar(50) NOT NULL COMMENT '用户组名称',
  `group_info` varchar(500) DEFAULT NULL COMMENT '用户组描述',
  `create_user_id` int(11) NOT NULL COMMENT '创建者ID',
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建日期',
  `status` char(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_id` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_group`
--

LOCK TABLES `sys_user_group` WRITE;
/*!40000 ALTER TABLE `sys_user_group` DISABLE KEYS */;
INSERT INTO `sys_user_group` VALUES (2,'用户组1','用户组13445',1,'2014-03-24 10:18:37','A'),(4,'用户组2','用户组2',2,'2014-03-25 07:07:14','A'),(5,'用户组3','333',2,'2014-03-25 09:35:48','A'),(6,'用户组4','444',2,'0000-00-00 00:00:00','A');
/*!40000 ALTER TABLE `sys_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_group_user`
--

DROP TABLE IF EXISTS `sys_user_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_group_user` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `group_id` int(11) NOT NULL COMMENT '用户组ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_group_user`
--

LOCK TABLES `sys_user_group_user` WRITE;
/*!40000 ALTER TABLE `sys_user_group_user` DISABLE KEYS */;
INSERT INTO `sys_user_group_user` VALUES (15,6);
/*!40000 ALTER TABLE `sys_user_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_region`
--

DROP TABLE IF EXISTS `sys_user_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_region` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `region_id` int(11) NOT NULL COMMENT '地区ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户与地区关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_region`
--

LOCK TABLES `sys_user_region` WRITE;
/*!40000 ALTER TABLE `sys_user_region` DISABLE KEYS */;
INSERT INTO `sys_user_region` VALUES (10,129),(10,130),(10,131),(10,132),(10,133),(10,134),(10,135),(10,136),(10,137),(10,138),(10,139),(10,140),(10,141),(10,142),(10,143),(10,144),(9,167),(9,168),(9,169),(9,170),(9,171),(9,172),(9,173),(9,174),(9,175),(9,176),(9,177),(9,178),(9,179),(9,180),(9,181),(9,182),(9,183),(9,184),(9,185),(9,186),(9,187),(11,188),(11,189),(11,190),(11,191),(11,192),(11,193),(11,194),(11,195),(11,196),(11,197),(2,287),(2,288),(2,289),(2,290),(2,291),(2,292),(2,293),(2,294),(2,295),(2,296),(2,297),(2,298),(2,299),(12,289),(12,291),(13,287),(13,293),(14,288),(15,289);
/*!40000 ALTER TABLE `sys_user_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'base_project'
--
/*!50003 DROP FUNCTION IF EXISTS `getChildUserIdBy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getChildUserIdBy`(rootId VARCHAR(100)) RETURNS varchar(1000) CHARSET utf8
    COMMENT '递归查询所有子用户'
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempChd VARCHAR(1000);
    SET sTemp = '$';
    SET sTempChd =cast(rootId as CHAR);
      WHILE sTempChd is not null DO
        SET sTemp = concat(sTemp,',',sTempChd);
        SELECT group_concat(user_id) INTO sTempChd FROM sys_user where FIND_IN_SET(create_user_id,sTempChd)>0;
      END WHILE;
    RETURN sTemp;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getParentsMenuIdByMenuId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getParentsMenuIdByMenuId`(rootId VARCHAR(100)) RETURNS varchar(1000) CHARSET utf8
    COMMENT '向上递归查询所有父菜单节点'
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempChd VARCHAR(1000);
    SET sTemp = '$';
    SET sTempChd =cast(rootId as CHAR);
      WHILE sTempChd is not null DO
        SET sTemp = concat(sTemp,',',sTempChd);
        SELECT group_concat(parent_menu_id) INTO sTempChd FROM sys_menu where FIND_IN_SET(menu_id,sTempChd)>0;
      END WHILE;
    RETURN sTemp;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getParentsRegionIdByRegionId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `getParentsRegionIdByRegionId`(
        rootId VARCHAR(100)
    ) RETURNS varchar(1000) CHARSET utf8
    COMMENT '向上递归查询地区'
BEGIN
    DECLARE sTemp VARCHAR(1000);
    DECLARE sTempChd VARCHAR(1000);
    SET sTemp = '$';
    SET sTempChd =cast(rootId as CHAR);
      WHILE sTempChd is not null DO
        SET sTemp = concat(sTemp,',',sTempChd);
        SELECT group_concat(parent_region_id) INTO sTempChd FROM sys_region where FIND_IN_SET(region_id,sTempChd)>0;
      END WHILE;
    RETURN sTemp;
  END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-25 19:50:38
