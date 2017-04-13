-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: base
-- ------------------------------------------------------
-- Server version	5.1.73

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
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `menu_type` tinyint(4) DEFAULT '0' COMMENT '菜单类型（1-根节点；2-子结点；3-按钮）',
  `button_id` varchar(50) DEFAULT NULL COMMENT '按钮的ID名称',
  `icon_name` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `target` varchar(50) DEFAULT NULL COMMENT '菜单指向',
  `extra_url` varchar(200) DEFAULT NULL COMMENT '额外参数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `create_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_id` (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='系统菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',NULL,0,2,1,1,NULL,NULL,NULL,NULL,0,0,0),(2,'用户管理','/jsp/sysManage/sysUser/sysUserList.jsp',1,1,1,2,'','',NULL,'',0,1473785365,0),(3,'角色管理','/jsp/sysManage/sysRole/sysRoleList.jsp',1,2,1,2,NULL,NULL,NULL,NULL,0,0,0),(4,'菜单管理','/jsp/sysManage/sysMenu/sysMenuList.jsp',1,3,1,2,NULL,NULL,NULL,NULL,0,0,0),(5,'查询角色列表','',3,1,1,3,'','',NULL,'sysRoleList.jsp,sysRoleSearch.jsp,queryAllSysRole.do',0,1473870231,0),(6,'新增角色','',3,2,1,3,'addSysRoleBtn','',NULL,'sysRoleEdit.jsp',0,1473870264,0),(9,'修改角色','',3,3,1,3,'editSysRoleBtn','',NULL,'sysRoleEdit.jsp',0,1473783724,0),(10,'保存角色','',3,4,1,3,'saveSysRoleBtn','',NULL,'saveSysRole.do',0,1473443318,0),(11,'删除角色','',3,5,1,3,'delSysRoleBtn','',NULL,'deleteSysRole.do',0,1473443347,0),(12,'查询角色权限','',3,6,1,3,'viewRoleMenuBtn','',NULL,'sysRoleMenuEdit.jsp,queryAllSysMenu.do,querySysMenuByRoleId.do',0,1473608555,0),(13,'保存角色权限','',3,7,1,3,'saveRoleMenuBtn','',NULL,'saveSysRoleMenu.do',0,1473608585,0),(14,'查询用户列表','',2,1,1,3,'','',NULL,'sysUserList.jsp,sysUserSearch.jsp,queryAllSysUser.do,queryAllStoreInfo.do',0,1473787183,0),(15,'新增用户','',2,2,1,3,'addSysUserBtn','',NULL,'sysUserEdit.jsp,queryAllStoreInfo.do,queryAllSysRole.do,selectByUserId.do',0,1473784520,0),(16,'修改用户','',2,3,1,3,'editSysUserBtn','',NULL,'sysUserEdit.jsp,queryAllStoreInfo.do,queryAllSysRole.do,selectByUserId.do',0,1473442993,0),(17,'保存用户','',2,4,1,3,'saveSysUserBtn','',NULL,'saveSysUser.do',0,1473917939,0),(18,'删除用户','',2,5,1,3,'delSysUserBtn','',NULL,'deleteSysUser.do',0,1473917951,0),(43,'修改密码','/jsp/sysManage/pwdManage/modifyPwd.jsp',1,5,1,2,'','',NULL,'modifyPwd.jsp,pwdPanel.jsp,modifyPwd.do',0,1474784508,0),(46,'用户组管理','/jsp/sysManage/sysUserGroup/userGroupList.jsp',1,6,2,2,NULL,NULL,NULL,'queryAllSysUserGroup.do',0,0,0),(47,'查询',NULL,46,1,1,3,NULL,NULL,NULL,'queryAllSysUserGroup.do',0,0,0),(48,'新增',NULL,46,2,1,3,'addUserGroupBtn',NULL,NULL,'userGroupEdit.jsp',0,0,0),(49,'修改',NULL,46,3,1,3,'editUserGroupBtn',NULL,NULL,'userGroupEdit.jsp',0,0,0),(50,'删除',NULL,46,4,1,3,'delUserGroupBtn',NULL,NULL,'deleteSysUserGroup.do',0,0,0),(51,'保存',NULL,46,5,1,3,'saveUserGroupBtn',NULL,NULL,'saveSysUserGroup.do',0,0,0),(52,'配置用户组用户','',46,6,1,3,'configUserGroupUserBtn','',NULL,'userGroupUser.jsp,queryForSelectUserByGroupId.do,querySysUserGroupByGroupId.do',0,0,0),(53,'保存配置用户组用户','',46,7,1,3,'saveConfigUserGroupUserBtn','',NULL,'addSysUserGroupUser.do',0,0,0),(54,'查看用户详情','',2,6,1,3,'viewSysUserBtn','',NULL,'sysUserEdit.jsp,queryAllStoreInfo.do,queryAllSysRole.do,selectByUserId.do',0,1473785237,0),(55,'查看角色详情','',3,8,1,3,'viewSysRoleBtn','',NULL,'sysRoleEdit.jsp',0,1473911016,0),(56,'详情','',46,8,1,3,'detailUserGroupBtn','',NULL,'userGroupEdit.jsp',0,0,0),(106,'区域管理','/jsp/sysManage/sysRegion/sysRegionList.jsp',1,5,1,2,'','',NULL,'sysRegionList.jsp,sysRegionRight.jsp,queryAllRegion.do,deleteSysregion.do,saveSysRegion.do',1477573845,1477573906,1);
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
  UNIQUE KEY `pwd_his_id` (`pwd_his_id`) USING BTREE
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
  `parent_region_id` int(11) DEFAULT NULL COMMENT '父节点ID',
  `sort_number` int(11) DEFAULT NULL COMMENT '地区排序',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_id` (`region_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8 COMMENT='地区表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_region`
--

LOCK TABLES `sys_region` WRITE;
/*!40000 ALTER TABLE `sys_region` DISABLE KEYS */;
INSERT INTO `sys_region` VALUES (1,'安徽','551',0,NULL,1),(2,'北京','100',0,NULL,1),(3,'福建','591',0,NULL,1),(4,'甘肃','931',0,NULL,1),(5,'广东','200',0,NULL,1),(6,'广西','771',0,NULL,1),(7,'贵州','851',0,NULL,1),(8,'海南','898',0,NULL,1),(9,'河北','311',0,NULL,1),(10,'河南','371',0,NULL,1),(11,'黑龙江','451',0,NULL,1),(12,'湖北','270',0,NULL,1),(13,'湖南','731',0,NULL,1),(14,'吉林','431',0,NULL,1),(15,'江苏','250',0,NULL,1),(16,'江西','791',0,NULL,1),(17,'辽宁','240',0,NULL,1),(18,'内蒙古','471',0,NULL,1),(19,'宁夏','951',0,NULL,1),(20,'青海','971',0,NULL,1),(21,'山东','531',0,NULL,1),(22,'山西','351',0,NULL,1),(23,'陕西','290',0,NULL,1),(24,'上海','210',0,NULL,1),(25,'四川','280',0,NULL,1),(26,'天津','220',0,NULL,1),(27,'西藏','891',0,NULL,1),(28,'新疆','991',0,NULL,1),(29,'云南','871',0,NULL,1),(30,'浙江','571',0,NULL,1),(31,'重庆','023',0,NULL,1),(32,'凉山','0834',25,NULL,1),(33,'眉山','0833',25,NULL,1),(34,'绵阳','0816',25,NULL,1),(35,'南充','0817',25,NULL,1),(36,'内江','0832',25,NULL,1),(37,'攀枝花','0812',25,NULL,1),(38,'遂宁','0825',25,NULL,1),(39,'雅安','0835',25,NULL,1),(40,'宜宾','0831',25,NULL,1),(41,'资阳','0832',25,NULL,1),(42,'自贡','0813',25,NULL,1),(43,'泸州','0830',25,NULL,1),(44,'天津','022',26,NULL,1),(45,'阿里','0897',27,NULL,1),(46,'昌都','0895',27,NULL,1),(47,'拉萨','0891',27,NULL,1),(48,'林芝','0894',27,NULL,1),(49,'那曲','0896',27,NULL,1),(50,'日喀则','0892',27,NULL,1),(51,'山南','0893',27,NULL,1),(52,'阿克苏','0997',28,NULL,1),(53,'阿勒泰','0906',28,NULL,1),(54,'博乐','0909',28,NULL,1),(55,'昌吉','0994',28,NULL,1),(56,'哈密','0902',28,NULL,1),(57,'和田','0903',28,NULL,1),(58,'喀什','0998',28,NULL,1),(59,'克拉玛依','0990',28,NULL,1),(60,'克州','0908',28,NULL,1),(61,'库尔勒','0996',28,NULL,1),(62,'奎屯','0992',28,NULL,1),(63,'石河子','0993',28,NULL,1),(64,'塔城','0901',28,NULL,1),(65,'吐鲁番','0995',28,NULL,1),(66,'乌鲁木齐','0991',28,NULL,1),(67,'伊犁','0999',28,NULL,1),(68,'版纳','0691',29,NULL,1),(69,'保山','0875',29,NULL,1),(70,'楚雄','0878',29,NULL,1),(71,'大理','0872',29,NULL,1),(72,'德宏','0692',29,NULL,1),(73,'迪庆','0887',29,NULL,1),(74,'红河','0873',29,NULL,1),(75,'昆明','0871',29,NULL,1),(76,'丽江','0888',29,NULL,1),(77,'临沧','0883',29,NULL,1),(78,'怒江','0886',29,NULL,1),(79,'曲靖','0874',29,NULL,1),(80,'思茅','0879',29,NULL,1),(81,'文山','0876',29,NULL,1),(82,'玉溪','0877',29,NULL,1),(83,'昭通','0870',29,NULL,1),(84,'杭州','0571',30,NULL,1),(85,'湖州','0572',30,NULL,1),(86,'嘉兴','0573',30,NULL,1),(87,'金华','0579',30,NULL,1),(88,'丽水','0578',30,NULL,1),(89,'宁波','0574',30,NULL,1),(90,'绍兴','0575',30,NULL,1),(91,'台州','0576',30,NULL,1),(92,'温州','0577',30,NULL,1),(93,'舟山','0580',30,NULL,1),(94,'衢州','0570',30,NULL,1),(95,'涪陵','023',31,NULL,1),(96,'黔江','023',31,NULL,1),(97,'万州','023',31,NULL,1),(98,'赣州','0797',16,NULL,1),(99,'萍乡','0799',16,NULL,1),(100,'鹰潭','0701',16,NULL,1),(101,'抚顺','0413',17,NULL,1),(102,'辽阳','0419',17,NULL,1),(103,'巴彦浩特','0483',18,NULL,1),(104,'呼和浩特','0471',18,NULL,1),(105,'锡林浩特','0479',18,NULL,1),(106,'德令哈','0977',20,NULL,1),(107,'黄南','0973',20,NULL,1),(108,'东营','0546',21,NULL,1),(109,'青岛','0532',21,NULL,1),(110,'烟台','0535',21,NULL,1),(111,'晋城','0356',22,NULL,1),(112,'太原','0351',22,NULL,1),(113,'汉中','0916',23,NULL,1),(114,'咸阳','029',23,NULL,1),(115,'巴中','0827',25,NULL,1),(116,'广安','0826',25,NULL,1),(117,'吴忠','0953',19,NULL,1),(118,'共和','0974',20,NULL,1),(119,'西宁','0971',20,NULL,1),(120,'菏泽','0530',21,NULL,1),(121,'临沂','0539',21,NULL,1),(122,'潍坊','0536',21,NULL,1),(123,'大同','0352',22,NULL,1),(124,'朔州','0349',22,NULL,1),(125,'安康','0915',23,NULL,1),(126,'渭南','0913',23,NULL,1),(127,'上海','021',24,NULL,1),(128,'德阳','0838',25,NULL,1),(129,'安庆','0556',1,NULL,1),(130,'蚌埠','0552',1,NULL,1),(131,'巢湖','0565',1,NULL,1),(132,'池州','0566',1,NULL,1),(133,'滁州','0550',1,NULL,1),(134,'阜阳','0558',1,NULL,1),(135,'合肥','0551',1,NULL,1),(136,'淮北','0561',1,NULL,1),(137,'淮南','0554',1,NULL,1),(138,'黄山','0559',1,NULL,1),(139,'六安','0564',1,NULL,1),(140,'马鞍山','0555',1,NULL,1),(141,'宿州','0557',1,NULL,1),(142,'铜陵','0562',1,NULL,1),(143,'芜湖','0553',1,NULL,1),(144,'宣城','0563',1,NULL,1),(145,'北京','010',2,NULL,1),(146,'福州','0591',3,NULL,1),(147,'龙岩','0597',3,NULL,1),(148,'南平','0599',3,NULL,1),(149,'宁德','0593',3,NULL,1),(150,'莆田','0594',3,NULL,1),(151,'泉州','0595',3,NULL,1),(152,'三明','0598',3,NULL,1),(153,'厦门','0592',3,NULL,1),(154,'漳州','0596',3,NULL,1),(155,'白银','0943',4,NULL,1),(156,'定西','0932',4,NULL,1),(157,'甘南','0941',4,NULL,1),(158,'金昌武威','0935',4,NULL,1),(159,'酒泉嘉峪关','0937',4,NULL,1),(160,'兰州','0931',4,NULL,1),(161,'临夏','0930',4,NULL,1),(162,'陇南','0939',4,NULL,1),(163,'平凉','0933',4,NULL,1),(164,'庆阳','0934',4,NULL,1),(165,'天水','0938',4,NULL,1),(166,'张掖','0936',4,NULL,1),(167,'潮州','0768',5,NULL,1),(168,'东莞','0769',5,NULL,1),(169,'佛山','0757',5,NULL,1),(170,'广州','020',5,NULL,1),(171,'河源','0762',5,NULL,1),(172,'惠州','0752',5,NULL,1),(173,'江门','0750',5,NULL,1),(174,'揭阳','0663',5,NULL,1),(175,'茂名','0668',5,NULL,1),(176,'梅州','0753',5,NULL,1),(177,'清远','0763',5,NULL,1),(178,'汕头','0754',5,NULL,1),(179,'汕尾','0660',5,NULL,1),(180,'韶关','0751',5,NULL,1),(181,'深圳','0755',5,NULL,1),(182,'阳江','0662',5,NULL,1),(183,'云浮','0766',5,NULL,1),(184,'湛江','0759',5,NULL,1),(185,'肇庆','0758',5,NULL,1),(186,'中山','0760',5,NULL,1),(187,'珠海','0756',5,NULL,1),(188,'百色','0776',6,NULL,1),(189,'北海','0779',6,NULL,1),(190,'防城港','0770',6,NULL,1),(191,'桂林','0773',6,NULL,1),(192,'河池','0778',6,NULL,1),(193,'柳州','0772',6,NULL,1),(194,'南宁','0771',6,NULL,1),(195,'钦州','0777',6,NULL,1),(196,'梧州','0774',6,NULL,1),(197,'玉林','0775',6,NULL,1),(198,'安顺','0853',7,NULL,1),(199,'毕节','0857',7,NULL,1),(200,'都匀','0854',7,NULL,1),(201,'贵阳','0851',7,NULL,1),(202,'凯里','0855',7,NULL,1),(203,'六盘水','0858',7,NULL,1),(204,'铜仁','0856',7,NULL,1),(205,'兴义','0859',7,NULL,1),(206,'遵义','0852',7,NULL,1),(207,'海口','0898',8,NULL,1),(208,'保定','0312',9,NULL,1),(209,'沧州','0317',9,NULL,1),(210,'承德','0314',9,NULL,1),(211,'邯郸','0310',9,NULL,1),(212,'衡水','0318',9,NULL,1),(213,'廊坊','0316',9,NULL,1),(214,'石家庄','0311',9,NULL,1),(215,'邢台','0319',9,NULL,1),(216,'张家口','0313',9,NULL,1),(217,'安阳','0372',10,NULL,1),(218,'鹤壁','0392',10,NULL,1),(219,'焦作','0391',10,NULL,1),(220,'开封','0378',10,NULL,1),(221,'洛阳','0379',10,NULL,1),(222,'南阳','0377',10,NULL,1),(223,'平顶山','0375',10,NULL,1),(224,'三门峡','0398',10,NULL,1),(225,'商丘','0370',10,NULL,1),(226,'新乡','0373',10,NULL,1),(227,'信阳','0376',10,NULL,1),(228,'许昌','0374',10,NULL,1),(229,'郑州','0371',10,NULL,1),(230,'周口','0394',10,NULL,1),(231,'驻马店','0396',10,NULL,1),(232,'潢川','0376',10,NULL,1),(233,'漯河','0395',10,NULL,1),(234,'濮阳','0393',10,NULL,1),(235,'大庆','0459',11,NULL,1),(236,'大兴安岭','0456',11,NULL,1),(237,'哈尔滨','0451',11,NULL,1),(238,'鹤岗','0454',11,NULL,1),(239,'黑河','0456',11,NULL,1),(240,'鸡西','0453',11,NULL,1),(241,'佳木斯','0454',11,NULL,1),(242,'牡丹江','0453',11,NULL,1),(243,'七台河','0453',11,NULL,1),(244,'齐齐哈尔','0452',11,NULL,1),(245,'双鸭山','0454',11,NULL,1),(246,'绥化','0458',11,NULL,1),(247,'伊春','0458',11,NULL,1),(248,'鄂州','0711',12,NULL,1),(249,'恩施','0718',12,NULL,1),(250,'黄冈','0713',12,NULL,1),(251,'黄石','0714',12,NULL,1),(252,'江汉','0728',12,NULL,1),(253,'荆门','0724',12,NULL,1),(254,'荆州','0716',12,NULL,1),(255,'十堰','0719',12,NULL,1),(256,'随州','0722',12,NULL,1),(257,'武汉','027',12,NULL,1),(258,'咸宁','0715',12,NULL,1),(259,'襄樊','0710',12,NULL,1),(260,'孝感','0712',12,NULL,1),(261,'宜昌','0717',12,NULL,1),(262,'常德','0736',13,NULL,1),(263,'长沙','0731',13,NULL,1),(264,'郴州','0735',13,NULL,1),(265,'衡阳','0734',13,NULL,1),(266,'怀化','0745',13,NULL,1),(267,'吉首','0743',13,NULL,1),(268,'娄底','0738',13,NULL,1),(269,'邵阳','0739',13,NULL,1),(270,'湘潭','0732',13,NULL,1),(271,'益阳','0737',13,NULL,1),(272,'永州','0746',13,NULL,1),(273,'岳阳','0730',13,NULL,1),(274,'张家界','0744',13,NULL,1),(275,'株洲','0733',13,NULL,1),(276,'白城','0436',14,NULL,1),(277,'白山','0439',14,NULL,1),(278,'长春','0431',14,NULL,1),(279,'吉林','0432',14,NULL,1),(280,'辽源','0437',14,NULL,1),(281,'梅河口','0435',14,NULL,1),(282,'四平','0434',14,NULL,1),(283,'松原','0438',14,NULL,1),(284,'通化','0435',14,NULL,1),(285,'延吉','0433',14,NULL,1),(286,'珲春','0433',14,NULL,1),(287,'常州','0519',15,NULL,1),(288,'淮安','0517',15,NULL,1),(289,'连云港','0518',15,NULL,1),(290,'南京','025',15,NULL,1),(291,'南通','0513',15,NULL,1),(292,'苏州','0512',15,NULL,1),(293,'宿迁','0527',15,NULL,1),(294,'泰州','0523',15,NULL,1),(295,'无锡','0510',15,NULL,1),(296,'徐州','0516',15,NULL,1),(297,'盐城','0515',15,NULL,1),(298,'扬州','0514',15,NULL,1),(299,'镇江','0511',15,NULL,1),(300,'抚州','0794',16,NULL,1),(301,'吉安','0796',16,NULL,1),(302,'景德镇','0798',16,NULL,1),(303,'九江','0792',16,NULL,1),(304,'南昌','0791',16,NULL,1),(305,'上饶','0793',16,NULL,1),(306,'新余','0790',16,NULL,1),(307,'宜春','0795',16,NULL,1),(308,'鞍山','0412',17,NULL,1),(309,'朝阳','0421',17,NULL,1),(310,'大连','0411',17,NULL,1),(311,'阜新','0418',17,NULL,1),(312,'葫芦岛','0429',17,NULL,1),(313,'锦州','0416',17,NULL,1),(314,'盘锦','0427',17,NULL,1),(315,'沈阳','024',17,NULL,1),(316,'铁岭','0410',17,NULL,1),(317,'营口','0417',17,NULL,1),(318,'包头','0472',18,NULL,1),(319,'赤峰','0476',18,NULL,1),(320,'鄂尔多斯','0477',18,NULL,1),(321,'海拉尔','0470',18,NULL,1),(322,'集宁','0474',18,NULL,1),(323,'临河','0478',18,NULL,1),(324,'通辽','0475',18,NULL,1),(325,'乌兰浩特','0482',18,NULL,1),(326,'固原','0954',19,NULL,1),(327,'石嘴山','0952',19,NULL,1),(328,'银川','0951',19,NULL,1),(329,'中卫','0955',19,NULL,1),(330,'格尔木','0979',20,NULL,1),(331,'果洛','0975',20,NULL,1),(332,'海东','0972',20,NULL,1),(333,'海晏','0970',20,NULL,1),(334,'玉树','0976',20,NULL,1),(335,'滨州','0543',21,NULL,1),(336,'德州','0534',21,NULL,1),(337,'济南','0531',21,NULL,1),(338,'济宁','0537',21,NULL,1),(339,'莱芜','0634',21,NULL,1),(340,'聊城','0635',21,NULL,1),(341,'日照','0633',21,NULL,1),(342,'泰安','0538',21,NULL,1),(343,'威海','0631',21,NULL,1),(344,'枣庄','0632',21,NULL,1),(345,'淄博','0533',21,NULL,1),(346,'长治','0355',22,NULL,1),(347,'晋中','0354',22,NULL,1),(348,'临汾','0357',22,NULL,1),(349,'吕梁','0358',22,NULL,1),(350,'忻州','0350',22,NULL,1),(351,'阳泉','0353',22,NULL,1),(352,'运城','0359',22,NULL,1),(353,'宝鸡','0917',23,NULL,1),(354,'商洛','0914',23,NULL,1),(355,'铜川','0919',23,NULL,1),(356,'西安','029',23,NULL,1),(357,'延安','0911',23,NULL,1),(358,'榆林','0912',23,NULL,1),(359,'阿坝','0837',25,NULL,1),(360,'成都','028',25,NULL,1),(361,'达州','0818',25,NULL,1),(362,'甘孜','0836',25,NULL,1),(363,'广元','0839',25,NULL,1),(366,'测试节点',NULL,0,1000,1),(368,'方法',NULL,366,1,1);
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
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '角色状态',
  `create_user_id` int(11) DEFAULT '0' COMMENT '创建者ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_id` (`role_id`) USING BTREE,
  UNIQUE KEY `role_name` (`role_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='系统角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'店长','啊的说法',1,1,0,1477480914),(2,'前台','前台',1,2,0,1475379967),(3,'财务','',1,1,1475379977,1475379977);
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
INSERT INTO `sys_role_menu` VALUES (2,43),(2,75),(2,76),(2,77),(2,78),(2,79),(2,80),(2,81),(2,82),(2,83),(2,84),(2,85),(2,86),(2,87),(2,88),(2,89),(2,90),(2,91),(2,92),(2,93),(2,94),(2,95),(2,96),(2,97),(2,98),(2,100),(2,105),(2,101),(2,102),(2,103),(2,104),(1,14),(1,15),(1,16),(1,17),(1,18),(1,5),(1,6),(1,9),(1,10),(1,11),(1,12),(1,13),(1,43),(1,63),(1,64),(1,65),(1,66),(1,67),(1,69),(1,70),(1,71),(1,72),(1,73),(1,75),(1,76),(1,77),(1,78),(1,79),(1,80),(1,81),(1,82),(1,83),(1,84),(1,85),(1,86),(1,87),(1,88),(1,89),(1,90),(1,91),(1,92),(1,93),(1,94),(1,95),(1,96),(1,97),(1,98),(1,100),(1,105),(1,101),(1,102),(1,103),(1,104),(3,14),(3,15),(3,16),(3,17),(3,18),(3,5),(3,6),(3,9),(3,10),(3,11),(3,12),(3,13),(3,43),(3,63),(3,64),(3,65),(3,66),(3,67),(3,69),(3,70),(3,71),(3,72),(3,73),(3,75),(3,76),(3,77),(3,78),(3,79),(3,80),(3,81),(3,82),(3,83),(3,84),(3,85),(3,86),(3,87),(3,88),(3,89),(3,90),(3,91),(3,92),(3,93),(3,94),(3,95),(3,96),(3,97),(3,98),(3,100),(3,105),(3,101),(3,102),(3,103),(3,104);
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
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号码',
  `phone_number` varchar(20) DEFAULT '' COMMENT '固定电话',
  `address` varchar(200) DEFAULT '' COMMENT '用户地址',
  `email` varchar(100) DEFAULT '' COMMENT 'email',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态（1-正常；2-已删除；3-无效）',
  `create_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID',
  `last_login_time` int(11) DEFAULT '0' COMMENT '最后一次登录时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `identity` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户身份（1-超级管理员；2-店长；3-店员）',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  UNIQUE KEY `login_name` (`login_name`) USING BTREE,
  UNIQUE KEY `user_name` (`user_name`) USING BTREE,
  UNIQUE KEY `user_name_2` (`user_name`) USING BTREE,
  UNIQUE KEY `login_name_2` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='系统用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,'艾德敏','admin','21232f297a57a5a743894a0e4a801fc3','','','','',1,0,1477917596,0,1477480894,1),(10,'前台妮可1','qiantai','21232f297a57a5a743894a0e4a801fc3','15951924092','','','',1,1,1477488372,1475380431,1477480908,3),(11,'店长谢明亮','dianzhang1','e06f1e64ef4d6b6958ade918e1a20bec','13645184113','','','',1,1,1477017102,1475381432,1475381432,2),(14,'财务1','caiwu','e06f1e64ef4d6b6958ade918e1a20bec','13601468984','','','530627340@qq.com',1,11,NULL,1475393009,1475393009,1);
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
  `log_type` tinyint(4) NOT NULL COMMENT '日志类型（1-登录；2-查询；3-新增；4-修改；5-删除）',
  `user_ip` varchar(100) DEFAULT NULL COMMENT '用户IP',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `log_class` varchar(500) DEFAULT NULL COMMENT '日志的操作CLASS类名',
  PRIMARY KEY (`log_id`),
  UNIQUE KEY `log_id` (`log_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='系统操作日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_action_log`
--

LOCK TABLES `sys_user_action_log` WRITE;
/*!40000 ALTER TABLE `sys_user_action_log` DISABLE KEYS */;
INSERT INTO `sys_user_action_log` VALUES (1,0,'1',2,'11',0,NULL);
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
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建日期',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_group`
--

LOCK TABLES `sys_user_group` WRITE;
/*!40000 ALTER TABLE `sys_user_group` DISABLE KEYS */;
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

CREATE TABLE `sys_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_key` varchar(50) DEFAULT NULL COMMENT '配置key',
  `config_value` varchar(500) DEFAULT NULL COMMENT '配置值',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `config_desc` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_config_key` (`config_key`),
  KEY `IDX_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='配置表';




LOCK TABLES `sys_user_group_user` WRITE;
/*!40000 ALTER TABLE `sys_user_group_user` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `sys_user_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `role_id` int(11) NOT NULL DEFAULT '0' COMMENT '角色id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (11,1),(14,3),(10,2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'base'
--
DROP FUNCTION IF EXISTS `getChildUserById`;
DELIMITER ;;
CREATE  FUNCTION `getChildUserById`(rootId VARCHAR(100)) RETURNS varchar(1000) CHARSET utf8
    READS SQL DATA
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

  END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getParentsMenuIdByMenuId`
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentsMenuIdByMenuId`;
DELIMITER ;;
CREATE  FUNCTION `getParentsMenuIdByMenuId`(rootId VARCHAR(5000)) RETURNS varchar(5000) CHARSET utf8
    READS SQL DATA
    COMMENT '向上递归查询所有父菜单节点'
BEGIN

    DECLARE sTemp VARCHAR(5000);

    DECLARE sTempChd VARCHAR(5000);

    SET sTemp = '$';

    SET sTempChd =cast(rootId as CHAR);

      WHILE sTempChd is not null DO

        SET sTemp = concat(sTemp,',',sTempChd);

        SELECT group_concat(parent_menu_id) INTO sTempChd FROM sys_menu where FIND_IN_SET(menu_id,sTempChd)>0;

      END WHILE;

    RETURN sTemp;

  END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for `getParentsRegionIdByRegionId`
-- ----------------------------
DROP FUNCTION IF EXISTS `getParentsRegionIdByRegionId`;
DELIMITER ;;
CREATE  FUNCTION `getParentsRegionIdByRegionId`(rootId VARCHAR(100)) RETURNS varchar(1000) CHARSET utf8
    READS SQL DATA
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

  END
;;

-- Dump completed on 2016-12-11  0:19:07
