/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : springboot

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-01 00:16:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `content` text COMMENT '内容文字',
  `author_id` int(10) unsigned DEFAULT '0',
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `tags` varchar(200) DEFAULT NULL,
  `categories` varchar(200) DEFAULT NULL,
  `hits` int(10) unsigned DEFAULT '0',
  `comments_num` int(10) unsigned DEFAULT '0',
  `allow_comment` tinyint(1) DEFAULT '1',
  `allow_ping` tinyint(1) DEFAULT '1',
  `allow_feed` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', 'about my blog', 'about', '1487853610', '1487872488', '### Hello World\r\n\r\nabout me\r\n\r\n### ...\r\n\r\n...', '1', 'page', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('2', 'Hello My Blog', null, '1487861184', '1487872798', '## Hello  World.\r\n\r\n> ...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello 13 Blog.\");\r\n}\r\n```', '1', 'post', 'publish', '', 'default', '10', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('3', '雷小天测试文章', '20', '1566569614', '1566569614', '这是一篇测试的文章', '1', 'post', 'publish', '测试', 'default', '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('4', 'PHP程序员这行能干多久？', 'test', '0', '0', '沉甸甸的多多', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('14', '测试标题2', '11', '0', '1566920424', '哒哒哒哒哒哒多多', '0', 'post', 'publish', '', '', '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('15', 'PHP程序员这行能干多久？22', '22', '0', '0', '哒哒哒哒哒哒', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('16', '到订单 的', '33', '0', '0', '哒哒哒哒哒哒多多多多多多多多', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('17', '网站架构设计之高可用原则', '44', '0', '0', '88888888888888888888888888888', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('19', 'git工具分支创建管理案例分析', '55', '0', '0', '1111\r\n2133333333333333', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('21', '3333', '66', '0', '0', '8888888888888', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('22', 'PHP程序员这行能干多久？9999', '77', '0', '0', '分隔符', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('23', 'PHP程序员这行能干多久？88', '88', '0', '0', '888888888888888888', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('25', 'PHP程序员这行能干多久？77', '99', '0', '0', '7777777777', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('26', 'PHP程序员这行能干多久？123', '100', '0', '0', '123', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('28', 'PHP程序员这行能干多久？1234', '101', '0', '0', '444545', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('29', 'PHP程序员这行能干多久？1234', '102', '0', '0', '444545', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('30', 'PHP程序员这行能干多久？7879', '103', '0', '0', '1111111', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('31', '测试标题45454', '104', '0', '0', '454545', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('32', 'PHP程序员这行能干多久？888', '105', '0', '0', '88888888888888', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('33', '雷小天测试', '106', '0', '0', '雷小天', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('36', 'PHP程序员这行能干多久？', '1010', '0', '0', 'ddddddddd ', '0', 'post', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('37', '雷小天继续', null, '0', '0', '侧是是是', '0', 'post', 'publish', '测试', 'default', '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('42', '关于', 'aboutme', '1566920166', '1566977785', 'aboutme', '4', 'page', 'publish', null, '', '0', '0', '1', '1', '1');
INSERT INTO `articles` VALUES ('43', '相册', 'pincture', '1566921035', '1566921035', '这是相册页面', '4', 'page', 'publish', null, '', '0', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for attach
-- ----------------------------
DROP TABLE IF EXISTS `attach`;
CREATE TABLE `attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL DEFAULT '',
  `ftype` varchar(50) DEFAULT '',
  `fkey` varchar(100) NOT NULL DEFAULT '',
  `author_id` int(10) DEFAULT NULL,
  `created` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attach
-- ----------------------------
INSERT INTO `attach` VALUES ('1', '1.jpg', 'image', '/upload/2019/08/rj85i5gasejovohqpic80aubf2.jpg', '1', '1567063704');
INSERT INTO `attach` VALUES ('2', '微信图片_20190819095358.png', 'image', '/upload/2019/08/7pb9iolu7mi7bpcj929o8spjig.png', '4', '1567075366');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT '0',
  `owner_id` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `content` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('2', '19', '1566912607', 'xiao', '0', '1', '1124378213@qq.com', 'https://github.com/leiphp/sshflower', '0:0:0:0:0:0:0:1', null, '我来快快快测试', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('3', '17', '1566912678', '雷小天', '0', '1', '1124378213@qq.com', 'https://github.com/leiphp/sshflower', '0:0:0:0:0:0:0:1', null, '我可以看看 你的源码吗', 'comment', 'approved', '0');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  `data` varchar(2000) DEFAULT NULL,
  `author_id` int(10) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `created` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566312818');
INSERT INTO `logs` VALUES ('2', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566400842');
INSERT INTO `logs` VALUES ('3', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566489734');
INSERT INTO `logs` VALUES ('4', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566569572');

-- ----------------------------
-- Table structure for metas
-- ----------------------------
DROP TABLE IF EXISTS `metas`;
CREATE TABLE `metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of metas
-- ----------------------------
INSERT INTO `metas` VALUES ('1', 'default', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('6', 'my github', 'https://github.com/ZHENFENG13', 'link', null, '0', '0');
INSERT INTO `metas` VALUES ('9', '运维', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('11', 'html5', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('12', 'python', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('13', '雷小天博客', 'https://www.100txy.com', 'link', null, '0', '0');
INSERT INTO `metas` VALUES ('14', '雷小天科技', 'http://www.lxtkj.cn', 'link', null, '2', '0');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` varchar(1000) DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('site_description', '13 Blog', null);
INSERT INTO `options` VALUES ('site_keywords', '13 Blog', null);
INSERT INTO `options` VALUES ('site_record', '', '备案号');
INSERT INTO `options` VALUES ('site_theme', 'default', null);
INSERT INTO `options` VALUES ('site_title', 'My Blog', '');
INSERT INTO `options` VALUES ('social_github', '', null);
INSERT INTO `options` VALUES ('social_twitter', '', null);
INSERT INTO `options` VALUES ('social_weibo', '', null);
INSERT INTO `options` VALUES ('social_zhihu', '', null);

-- ----------------------------
-- Table structure for relationships
-- ----------------------------
DROP TABLE IF EXISTS `relationships`;
CREATE TABLE `relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relationships
-- ----------------------------
INSERT INTO `relationships` VALUES ('2', '1');
INSERT INTO `relationships` VALUES ('3', '1');
INSERT INTO `relationships` VALUES ('3', '7');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for t_attach
-- ----------------------------
DROP TABLE IF EXISTS `t_attach`;
CREATE TABLE `t_attach` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) NOT NULL DEFAULT '',
  `ftype` varchar(50) DEFAULT '',
  `fkey` varchar(100) NOT NULL DEFAULT '',
  `author_id` int(10) DEFAULT NULL,
  `created` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attach
-- ----------------------------

-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments` (
  `coid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cid` int(10) unsigned DEFAULT '0',
  `created` int(10) unsigned DEFAULT '0',
  `author` varchar(200) DEFAULT NULL,
  `author_id` int(10) unsigned DEFAULT '0',
  `owner_id` int(10) unsigned DEFAULT '0',
  `mail` varchar(200) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `ip` varchar(64) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `content` text,
  `type` varchar(16) DEFAULT 'comment',
  `status` varchar(16) DEFAULT 'approved',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comments
-- ----------------------------
INSERT INTO `t_comments` VALUES ('1', '19', '1566912526', 'xiaotian lei', '0', '1', '1124378213@qq.com', '', '0:0:0:0:0:0:0:1', null, 'cessssssss', 'comment', 'approved', '0');
INSERT INTO `t_comments` VALUES ('2', '19', '1566912607', 'xiao', '0', '1', '1124378213@qq.com', 'https://github.com/leiphp/sshflower', '0:0:0:0:0:0:0:1', null, '我来快快快测试', 'comment', 'approved', '0');
INSERT INTO `t_comments` VALUES ('3', '17', '1566912678', '雷小天', '0', '1', '1124378213@qq.com', 'https://github.com/leiphp/sshflower', '0:0:0:0:0:0:0:1', null, '我可以看看 你的源码吗', 'comment', 'not_audit', '0');

-- ----------------------------
-- Table structure for t_contents
-- ----------------------------
DROP TABLE IF EXISTS `t_contents`;
CREATE TABLE `t_contents` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `modified` int(10) unsigned DEFAULT '0',
  `content` text COMMENT '内容文字',
  `author_id` int(10) unsigned DEFAULT '0',
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `tags` varchar(200) DEFAULT NULL,
  `categories` varchar(200) DEFAULT NULL,
  `hits` int(10) unsigned DEFAULT '0',
  `comments_num` int(10) unsigned DEFAULT '0',
  `allow_comment` tinyint(1) DEFAULT '1',
  `allow_ping` tinyint(1) DEFAULT '1',
  `allow_feed` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_contents
-- ----------------------------
INSERT INTO `t_contents` VALUES ('1', 'about my blog', 'about', '1487853610', '1487872488', '### Hello World\r\n\r\nabout me\r\n\r\n### ...\r\n\r\n...', '1', 'page', 'publish', null, null, '0', '0', '1', '1', '1');
INSERT INTO `t_contents` VALUES ('2', 'Hello My Blog', null, '1487861184', '1487872798', '## Hello  World.\r\n\r\n> ...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello 13 Blog.\");\r\n}\r\n```', '1', 'post', 'publish', '', 'default', '10', '0', '1', '1', '1');

-- ----------------------------
-- Table structure for t_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(100) DEFAULT NULL,
  `data` varchar(2000) DEFAULT NULL,
  `author_id` int(10) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `created` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_logs
-- ----------------------------
INSERT INTO `t_logs` VALUES ('1', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566312818');
INSERT INTO `t_logs` VALUES ('2', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566400842');
INSERT INTO `t_logs` VALUES ('3', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566489734');
INSERT INTO `t_logs` VALUES ('4', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566569572');

-- ----------------------------
-- Table structure for t_metas
-- ----------------------------
DROP TABLE IF EXISTS `t_metas`;
CREATE TABLE `t_metas` (
  `mid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `slug` varchar(200) DEFAULT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  `sort` int(10) unsigned DEFAULT '0',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_metas
-- ----------------------------
INSERT INTO `t_metas` VALUES ('1', 'default', null, 'category', null, '0', '0');
INSERT INTO `t_metas` VALUES ('6', '默认分类', 'https://github.com/ZHENFENG13', 'link', null, '0', '0');

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` varchar(1000) DEFAULT '',
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_options
-- ----------------------------
INSERT INTO `t_options` VALUES ('site_description', '13 Blog', null);
INSERT INTO `t_options` VALUES ('site_keywords', '13 Blog', null);
INSERT INTO `t_options` VALUES ('site_record', '', '备案号');
INSERT INTO `t_options` VALUES ('site_theme', 'default', null);
INSERT INTO `t_options` VALUES ('site_title', 'My Blog', '');
INSERT INTO `t_options` VALUES ('social_github', '', null);
INSERT INTO `t_options` VALUES ('social_twitter', '', null);
INSERT INTO `t_options` VALUES ('social_weibo', '', null);
INSERT INTO `t_options` VALUES ('social_zhihu', '', null);

-- ----------------------------
-- Table structure for t_relationships
-- ----------------------------
DROP TABLE IF EXISTS `t_relationships`;
CREATE TABLE `t_relationships` (
  `cid` int(10) unsigned NOT NULL,
  `mid` int(10) unsigned NOT NULL,
  PRIMARY KEY (`cid`,`mid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_relationships
-- ----------------------------
INSERT INTO `t_relationships` VALUES ('2', '1');
INSERT INTO `t_relationships` VALUES ('3', '1');
INSERT INTO `t_relationships` VALUES ('3', '7');

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `home_url` varchar(200) DEFAULT NULL,
  `screen_name` varchar(32) DEFAULT NULL,
  `created` int(10) unsigned DEFAULT '0',
  `activated` int(10) unsigned DEFAULT '0',
  `logged` int(10) unsigned DEFAULT '0',
  `group_name` varchar(16) DEFAULT 'visitor',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`username`),
  UNIQUE KEY `mail` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES ('1', 'admin', 'a66abb5684c45962d887564f08346e8d', '1034683568@qq.com', null, 'admin', '1490756162', '0', '0', 'visitor');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(20) NOT NULL DEFAULT '',
  `age` int(3) NOT NULL DEFAULT '1',
  `role` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'leixiaotian', 'leixiaotian', '123456', '28', 'test');
INSERT INTO `users` VALUES ('2', 'leixiaotian', 'user', '112233', '28', 'user');
INSERT INTO `users` VALUES ('3', 'leiwen', 'vip', '112233', '23', 'vip');
INSERT INTO `users` VALUES ('4', 'admin', 'admin', '123456', '28', 'admin');
INSERT INTO `users` VALUES ('5', 'test', '', '', '33', '');
