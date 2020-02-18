-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: gfast
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `casbin_rule`
--

DROP TABLE IF EXISTS `casbin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `casbin_rule` (
  `ptype` varchar(10) DEFAULT NULL,
  `v0` varchar(256) DEFAULT NULL,
  `v1` varchar(256) DEFAULT NULL,
  `v2` varchar(256) DEFAULT NULL,
  `v3` varchar(256) DEFAULT NULL,
  `v4` varchar(256) DEFAULT NULL,
  `v5` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `casbin_rule`
--

LOCK TABLES `casbin_rule` WRITE;
/*!40000 ALTER TABLE `casbin_rule` DISABLE KEYS */;
INSERT INTO `casbin_rule` VALUES ('p','g_27','r_5','All','','',''),('p','g_27','r_9','All','','',''),('p','g_27','r_10','All','','',''),('g','u_31','g_1','','','',''),('g','u_31','g_2','','','',''),('p','g_1','r_5','All','','',''),('p','g_1','r_9','All','','',''),('p','g_1','r_10','All','','',''),('p','g_2','r_11','All','','',''),('p','g_2','r_12','All','','',''),('p','g_2','r_42','All','','','');
/*!40000 ALTER TABLE `casbin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qxkj_auth_rule`
--

DROP TABLE IF EXISTS `qxkj_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qxkj_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='菜单节点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qxkj_auth_rule`
--

LOCK TABLES `qxkj_auth_rule` WRITE;
/*!40000 ALTER TABLE `qxkj_auth_rule` DISABLE KEYS */;
INSERT INTO `qxkj_auth_rule` VALUES (5,'file',0,'auth','权限管理','fa fa-group','','',1,1497429920,1497430092,99,1),(9,'file',5,'auth/admin','管理员管理','fa fa-user','','Admin tips',1,1497429920,1497430320,118,1),(10,'file',5,'auth/adminlog','管理员日志','fa fa-list-alt','','Admin log tips',1,1497429920,1497430307,113,1),(11,'file',5,'auth/group','角色组','fa fa-group','','Group tips',1,1497429920,1497429920,109,1),(12,'file',5,'auth/rule','菜单规则','fa fa-bars','','Rule tips',1,1497429920,1497430581,104,1),(43,'file',9,'auth/admin/del','删除','fa fa-circle-o','','',0,1497429920,1497429920,114,1),(42,'file',9,'auth/admin/edit','修改','fa fa-circle-o','','',0,1497429920,1497429920,115,1),(41,'file',9,'auth/admin/add','添加','fa fa-circle-o','','',0,1497429920,1497429920,116,1),(40,'file',9,'auth/admin/index','查看','fa fa-circle-o','','Admin tips',0,1497429920,1497429920,117,1),(44,'file',5,'test/test','测试菜单','fa fa-circle-o','','备注',0,1581752604,1581758616,100,0);
/*!40000 ALTER TABLE `qxkj_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qxkj_role`
--

DROP TABLE IF EXISTS `qxkj_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qxkj_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qxkj_role`
--

LOCK TABLES `qxkj_role` WRITE;
/*!40000 ALTER TABLE `qxkj_role` DISABLE KEYS */;
INSERT INTO `qxkj_role` VALUES (1,0,1,1329633709,1581673885,0,'超级管理员','备注'),(2,0,1,1329633709,1581674154,0,'普通管理员','备注'),(3,0,1,0,0,0,'站点管理员','站点管理人员'),(4,0,1,0,0,0,'初级管理员','初级管理员'),(5,0,1,0,0,0,'高级管理员','高级管理员'),(6,0,0,0,0,0,'超级管理员','超级管理员'),(7,0,1,0,0,0,'系统管理员','包含所有系统设置权限'),(8,0,1,0,0,0,'区级管理员',''),(26,1,1,1580975018,1580975018,0,'测试组','备注'),(27,1,1,0,1581064765,0,'修改测试','备注');
/*!40000 ALTER TABLE `qxkj_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qxkj_user`
--

DROP TABLE IF EXISTS `qxkj_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qxkj_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login` (`user_name`) USING BTREE,
  UNIQUE KEY `mobile` (`mobile`) USING BTREE,
  KEY `user_nickname` (`user_nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qxkj_user`
--

LOCK TABLES `qxkj_user` WRITE;
/*!40000 ALTER TABLE `qxkj_user` DISABLE KEYS */;
INSERT INTO `qxkj_user` VALUES (1,'admin','18687460581','超级管理员',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh669@qq.com',0,'',1581491047,'192.168.31.221'),(2,'yixiaohu','13699885599','易小虎',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh@qq.com',1,'',1581513065,'192.168.31.221'),(3,'zs','16399669855','张三',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'zs@qq.com',0,'',1559293160,'127.0.0.1'),(4,'qlgl','13758596696','测试',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'qlgl@qq.com',0,'',1559293134,'127.0.0.1'),(5,'test','13845696696','测试2',0,0,'9OFlt5qzzvCiZWhe7ilcLA==',1,'123@qq.com',0,'',0,''),(6,'18999998889','13755866654','刘大大',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'1223@qq.com',0,'',0,''),(7,'zmm','13788566696','张明明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'11123@qq.com',0,'',0,''),(8,'lxx','13756566696','李小小',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'123333@qq.com',0,'',1571729563,'127.0.0.1'),(10,'xmm','13588999969','小秘密',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(14,'cd_19','123154564','看金利科技',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(15,'lmm','135877545454','刘敏敏',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(16,'ldn','13899658874','李大牛',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(20,'dbc','13877555566','大百词',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(22,'yxfmlbb','15969423326','袁学飞',0,1557715675,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'yxh6691@qq.com',0,'',1565059554,'127.0.0.1'),(23,'wangming','13699888855','王明',0,0,'IJ1xz+Wve+ZONVMFfXJQMw==',1,'',0,'',0,''),(24,'zhk','13699885591','综合科',0,0,'IZNU7Pn91/++830Pi6HAWA==',1,'',0,'',1569288069,'192.168.0.146'),(28,'demo3','18699888855','测试账号1',0,1581314035,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',0,''),(31,'demo','18699888856','测试账号1',0,1581314770,'9OFlt5qzzvCiZWhe7ilcLA==',1,'',0,'',1581911691,'192.168.31.221');
/*!40000 ALTER TABLE `qxkj_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-17 15:06:29
