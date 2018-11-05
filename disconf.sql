# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 10.211.55.4 (MySQL 5.7.20)
# Database: disconf
# Generation Time: 2018-11-05 07:20:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table app
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app`;

CREATE TABLE `app` (
  `app_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一的ID（没有啥意义，主键，自增长而已）',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'APP名(一般是产品线+服务名)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '介绍',
  `create_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '生成时间',
  `update_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '修改时',
  `emails` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱列表逗号分隔',
  PRIMARY KEY (`app_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='app';

LOCK TABLES `app` WRITE;
/*!40000 ALTER TABLE `app` DISABLE KEYS */;

INSERT INTO `app` (`app_id`, `name`, `description`, `create_time`, `update_time`, `emails`)
VALUES
	(36,'sso','单点登录','20180608112438','20180608112438','');

/*!40000 ALTER TABLE `app` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '唯一的ID（没有啥意义，主键，自增长而已）',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '配置文件/配置项',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1是正常 0是删除',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '配置文件名/配置项KeY名',
  `value` text NOT NULL COMMENT '0 配置文件：文件的内容，1 配置项：配置值',
  `app_id` bigint(20) NOT NULL COMMENT 'appid',
  `version` varchar(255) NOT NULL DEFAULT 'DEFAULT_VERSION' COMMENT '版本',
  `env_id` bigint(20) NOT NULL COMMENT 'envid',
  `create_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '生成时间',
  `update_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '修改时间',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置';

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;

INSERT INTO `config` (`config_id`, `type`, `status`, `name`, `value`, `app_id`, `version`, `env_id`, `create_time`, `update_time`)
VALUES
	(396,0,1,'redis.properties','mcs.maxTotal=1024\nmcs.maxIdle=200\nmcs.minIdle=5\nmcs.host=10.211.55.4:6379\nmcs.testOnBorrow=true\nmcs.password=',36,'1_0_0_0',1,'20180608112511','20180626170715'),
	(397,0,1,'jdbc.properties','jdbc.driverClassName=com.mysql.jdbc.Driver\njdbc.jdbcUrl=jdbc:mysql://10.211.55.4:3306/devcommondb?useUnicode=true&characterEncoding=UTF-8\njdbc.username=devcommondb\njdbc.password=1234abcD\n\njdbc.autoCommit=false\njdbc.idleTimeout=20000\njdbc.maxLifetime=30000\njdbc.maximumPoolSize=40\njdbc.maxIdle=10\njdbc.maxTotal=30\njdbc.minEvictableIdleTimeMillis=180000\njdbc.timeBetweenEvictionRunsMillis=360000\njdbc.defaultAutoCommit=true\njdbc.connectionTimeout=10000',36,'1_0_0_0',1,'20180608112516','20180626153941'),
	(398,1,1,'/com/x/paas-cachens-mcs-mapped','{\"com.x.opt.uni.session.sessionclient.mgmtweb\": \"MCS001\",\"com.bonc.uni.session\": \"MCS001\",\"com.x.platform.common.cache.gnarea\": \"MCS001\",\"com.x.sso.unicache\": \"MCS001\"}',36,'1_0_0_0',1,'20180608112602','20180608112602'),
	(399,1,1,'/com/x/sdkmode-paas-mcs-redis-mapped','{\"MCS001\": {\"mcs.host\": \"10.211.55.4:6379\", \"mcs.maxtotal\": \"200\", \"mcs.maxIdle\": \"10\", \"mcs.minIdle\": \"5\", \"mcs.testOnBorrow\": \"true\", \"mcs.password\": \"\"}}',36,'1_0_0_0',1,'20180608112640','20180626170729');

/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table config_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `config_history`;

CREATE TABLE `config_history` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `config_id` bigint(20) NOT NULL,
  `old_value` longtext NOT NULL,
  `new_value` longtext NOT NULL,
  `create_time` varchar(14) NOT NULL DEFAULT '99991231235959',
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `config_history` WRITE;
/*!40000 ALTER TABLE `config_history` DISABLE KEYS */;

INSERT INTO `config_history` (`id`, `config_id`, `old_value`, `new_value`, `create_time`, `update_by`)
VALUES
	(890,397,'jdbc.driverClassName=com.mysql.jdbc.Driver\njdbc.jdbcUrl=jdbc:mysql://172.16.8.38:3306/devcommondb?useUnicode=true&characterEncoding=UTF-8\njdbc.username=devcommondb\njdbc.password=1234abcD\n\njdbc.autoCommit=false\njdbc.idleTimeout=20000\njdbc.maxLifetime=30000\njdbc.maximumPoolSize=40\njdbc.maxIdle=10\njdbc.maxTotal=30\njdbc.minEvictableIdleTimeMillis=180000\njdbc.timeBetweenEvictionRunsMillis=360000\njdbc.defaultAutoCommit=true\njdbc.connectionTimeout=10000','jdbc.driverClassName=com.mysql.jdbc.Driver\njdbc.jdbcUrl=jdbc:mysql://10.211.55.4:3306/devcommondb?useUnicode=true&characterEncoding=UTF-8\njdbc.username=devcommondb\njdbc.password=1234abcD\n\njdbc.autoCommit=false\njdbc.idleTimeout=20000\njdbc.maxLifetime=30000\njdbc.maximumPoolSize=40\njdbc.maxIdle=10\njdbc.maxTotal=30\njdbc.minEvictableIdleTimeMillis=180000\njdbc.timeBetweenEvictionRunsMillis=360000\njdbc.defaultAutoCommit=true\njdbc.connectionTimeout=10000','20180626153941',6),
	(891,396,'mcs.maxTotal=1024\nmcs.maxIdle=200\nmcs.minIdle=5\nmcs.host=172.16.8.30:6379\nmcs.testOnBorrow=true\nmcs.password=','mcs.maxTotal=1024\nmcs.maxIdle=200\nmcs.minIdle=5\nmcs.host=10.211.55.4:6379\nmcs.testOnBorrow=true\nmcs.password=','20180626170715',6),
	(892,399,'{\"MCS001\": {\"mcs.host\": \"172.16.8.30:6379\", \"mcs.maxtotal\": \"200\", \"mcs.maxIdle\": \"10\", \"mcs.minIdle\": \"5\", \"mcs.testOnBorrow\": \"true\", \"mcs.password\": \"\"}}','{\"MCS001\": {\"mcs.host\": \"10.211.55.4:6379\", \"mcs.maxtotal\": \"200\", \"mcs.maxIdle\": \"10\", \"mcs.minIdle\": \"5\", \"mcs.testOnBorrow\": \"true\", \"mcs.password\": \"\"}}','20180626170729',6);

/*!40000 ALTER TABLE `config_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table env
# ------------------------------------------------------------

DROP TABLE IF EXISTS `env`;

CREATE TABLE `env` (
  `env_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '环境ID（主键，自增长）',
  `name` varchar(255) NOT NULL DEFAULT 'DEFAULT_ENV' COMMENT '环境名字',
  PRIMARY KEY (`env_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='rd/qa/local可以自定义，默认为 DEFAULT_ENV';

LOCK TABLES `env` WRITE;
/*!40000 ALTER TABLE `env` DISABLE KEYS */;

INSERT INTO `env` (`env_id`, `name`)
VALUES
	(1,'rd'),
	(2,'qa'),
	(3,'local'),
	(4,'online');

/*!40000 ALTER TABLE `env` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_name` varchar(50) NOT NULL DEFAULT '' COMMENT '角色名',
  `create_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '创建时间',
  `create_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '更新时间',
  `update_by` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;

INSERT INTO `role` (`role_id`, `role_name`, `create_time`, `create_by`, `update_time`, `update_by`)
VALUES
	(1,'普通人','99991231235959',2,'99991231235959',2),
	(2,'管理员','99991231235959',2,'99991231235959',2),
	(3,'测试管理员','99991231235959',2,'99991231235959',2);

/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table role_resource
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_resource`;

CREATE TABLE `role_resource` (
  `role_res_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'role-resource id',
  `role_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户角色id',
  `url_pattern` varchar(200) NOT NULL DEFAULT '' COMMENT 'controller_requestMapping_value + method_requestMapping_value',
  `url_description` varchar(200) NOT NULL DEFAULT '' COMMENT 'url功能描述',
  `method_mask` varchar(4) NOT NULL DEFAULT '' COMMENT 'GET, PUT, POST, DELETE, 1: accessible',
  `update_time` varchar(14) NOT NULL DEFAULT '99991231235959' COMMENT '更新时间',
  PRIMARY KEY (`role_res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色_url访问权限表';

LOCK TABLES `role_resource` WRITE;
/*!40000 ALTER TABLE `role_resource` DISABLE KEYS */;

INSERT INTO `role_resource` (`role_res_id`, `role_id`, `url_pattern`, `url_description`, `method_mask`, `update_time`)
VALUES
	(1,1,'/api/app/list','app列表','1000','99991231235959'),
	(2,2,'/api/app/list','app列表','1000','99991231235959'),
	(3,3,'/api/app/list','app列表','1000','99991231235959'),
	(4,1,'/api/app','生成一个app','0000','99991231235959'),
	(5,2,'/api/app','生成一个app','0010','99991231235959'),
	(6,3,'/api/app','生成一个app','0000','99991231235959'),
	(7,1,'/api/env/list','env-list','1000','99991231235959'),
	(8,2,'/api/env/list','env-list','1000','99991231235959'),
	(9,3,'/api/env/list','env-list','1000','99991231235959'),
	(10,1,'/api/account/session','会话','1000','99991231235959'),
	(11,2,'/api/account/session','会话','1000','99991231235959'),
	(12,3,'/api/account/session','会话','1000','99991231235959'),
	(13,1,'/api/account/signin','登录','1000','99991231235959'),
	(14,2,'/api/account/signin','登录','1000','99991231235959'),
	(15,3,'/api/account/signin','登录','1000','99991231235959'),
	(16,1,'/api/account/signout','登出','1000','99991231235959'),
	(17,2,'/api/account/signout','登出','1000','99991231235959'),
	(18,3,'/api/account/signout','登出','1000','99991231235959'),
	(19,1,'/api/config/item','获取配置项','1000','99991231235959'),
	(20,2,'/api/config/item','获取配置项','1000','99991231235959'),
	(21,3,'/api/config/item','获取配置项','1000','99991231235959'),
	(22,1,'/api/config/file','获取配置文件','1000','99991231235959'),
	(23,2,'/api/config/file','获取配置文件','1000','99991231235959'),
	(24,3,'/api/config/file','获取配置文件','1000','99991231235959'),
	(25,1,'/api/zoo/hosts','zoo','1000','99991231235959'),
	(26,2,'/api/zoo/hosts','zoo','1000','99991231235959'),
	(27,3,'/api/zoo/hosts','zoo','1000','99991231235959'),
	(28,1,'/api/zoo/prefix','zoo','1000','99991231235959'),
	(29,2,'/api/zoo/prefix','zoo','1000','99991231235959'),
	(30,3,'/api/zoo/prefix','zoo','1000','99991231235959'),
	(31,1,'/api/zoo/zkdeploy','zoo','1000','99991231235959'),
	(32,2,'/api/zoo/zkdeploy','zoo','1000','99991231235959'),
	(33,3,'/api/zoo/zkdeploy','zoo','1000','99991231235959'),
	(34,1,'/api/web/config/item','创建item-config','0010','99991231235959'),
	(35,2,'/api/web/config/item','创建item-config','0010','99991231235959'),
	(36,3,'/api/web/config/item','创建item-config','0000','99991231235959'),
	(37,1,'/api/web/config/file','创建file-config','0010','99991231235959'),
	(38,2,'/api/web/config/file','创建file-config','0010','99991231235959'),
	(39,3,'/api/web/config/file','创建file-config','0000','99991231235959'),
	(40,1,'/api/web/config/filetext','创建file-config','0010','99991231235959'),
	(41,2,'/api/web/config/filetext','创建file-config','0010','99991231235959'),
	(42,3,'/api/web/config/filetext','创建file-config','0000','99991231235959'),
	(43,1,'/api/web/config/versionlist','版本list','1000','99991231235959'),
	(44,2,'/api/web/config/versionlist','版本list','1000','99991231235959'),
	(45,3,'/api/web/config/versionlist','版本list','1000','99991231235959'),
	(46,1,'/api/web/config/list','config-list','1000','99991231235959'),
	(47,2,'/api/web/config/list','config-list','1000','99991231235959'),
	(48,3,'/api/web/config/list','config-list','1000','99991231235959'),
	(49,1,'/api/web/config/simple/list','config-list','1000','99991231235959'),
	(50,2,'/api/web/config/simple/list','config-list','1000','99991231235959'),
	(51,3,'/api/web/config/simple/list','config-list','1000','99991231235959'),
	(52,1,'/api/web/config/{configId}','get/post','1001','99991231235959'),
	(53,2,'/api/web/config/{configId}','get/post','1001','99991231235959'),
	(54,3,'/api/web/config/{configId}','get/post','1000','99991231235959'),
	(55,1,'/api/web/config/zk/{configId}','get-zk','1000','99991231235959'),
	(56,2,'/api/web/config/zk/{configId}','get-zk','1000','99991231235959'),
	(57,3,'/api/web/config/zk/{configId}','get-zk','1000','99991231235959'),
	(58,1,'/api/web/config/download/{configId}','download','1000','99991231235959'),
	(59,2,'/api/web/config/download/{configId}','download','1000','99991231235959'),
	(60,3,'/api/web/config/download/{configId}','download','1000','99991231235959'),
	(61,1,'/api/web/config/downloadfilebatch','download','1000','99991231235959'),
	(62,2,'/api/web/config/downloadfilebatch','download','1000','99991231235959'),
	(63,3,'/api/web/config/downloadfilebatch','download','1000','99991231235959'),
	(64,1,'/api/web/config/item/{configId}','update','0100','99991231235959'),
	(65,2,'/api/web/config/item/{configId}','update','0100','99991231235959'),
	(66,3,'/api/web/config/item/{configId}','update','0000','99991231235959'),
	(67,1,'/api/web/config/file/{configId}','update/post','0010','99991231235959'),
	(68,2,'/api/web/config/file/{configId}','update/post','0010','99991231235959'),
	(69,3,'/api/web/config/file/{configId}','update/post','0000','99991231235959'),
	(70,1,'/api/web/config/filetext/{configId}','update','0100','99991231235959'),
	(71,2,'/api/web/config/filetext/{configId}','update','0100','99991231235959'),
	(72,3,'/api/web/config/filetext/{configId}','update','0000','99991231235959'),
	(73,1,'/api/account/password','修改密码','0100','99991231235959'),
	(74,2,'/api/account/password','修改密码','0100','99991231235959'),
	(75,3,'/api/account/password','修改密码','0000','99991231235959');

/*!40000 ALTER TABLE `role_resource` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `token` varchar(255) NOT NULL COMMENT 'token',
  `ownapps` varchar(255) NOT NULL DEFAULT '' COMMENT '能操作的APPID,逗号分隔',
  `role_id` bigint(20) NOT NULL DEFAULT '1' COMMENT '角色ID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`user_id`, `name`, `password`, `token`, `ownapps`, `role_id`)
VALUES
	(6,'admin','d033e22ae348aeb5660fc2140aec35850c4da997','f28d164d23291c732f64134e6b7d92be3ff8b1b3','',2),
	(7,'admin_read','b76f3e20d1c8d0bc17d40158e44097d5eeee8640','2022ab9c2754d62f9ddba5fded91e4238247ebaf','2',3),
	(8,'mobiledsp','0855b44a368e44dc6e6825532073b29a368584af','132069654193f802203d1c6c86e753ecede698f6','4',1);

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
