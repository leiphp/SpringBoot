/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : springboot

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-09-30 17:33:56
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
  `description` text,
  `content` text COMMENT '内容文字',
  `author_id` int(10) unsigned DEFAULT '0',
  `type` varchar(16) DEFAULT 'post',
  `status` varchar(16) DEFAULT 'publish',
  `tags` varchar(200) DEFAULT NULL,
  `categories` varchar(200) DEFAULT '',
  `hits` int(10) unsigned DEFAULT '0',
  `comments_num` int(10) unsigned DEFAULT '0',
  `allow_comment` tinyint(1) DEFAULT '1',
  `allow_ping` tinyint(1) DEFAULT '1',
  `allow_feed` tinyint(1) DEFAULT '1',
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `slug` (`slug`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
INSERT INTO `articles` VALUES ('1', 'about my blog', 'about', '1487853610', '1487872488', '', '### Hello World\r\n\r\nabout me\r\n\r\n### ...\r\n\r\n...', '1', 'page', 'publish', null, null, '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('2', '你面对的是生活而不是手机', null, '1487861184', '1569219016', '每一次与别人吃饭，总会有人会拿出手机。以为他们在打电话或者有紧急的短信，但用余光瞟了一眼之后发现无非就两件事：1、看小说，2、上人人或者QQ...', '## Hello  World.\r\n\r\n> ...\r\n\r\n----------\r\n\r\n\r\n<!--more-->\r\n\r\n```java\r\npublic static void main(String[] args){\r\n    System.out.println(\"Hello 13 Blog.\");\r\n}\r\n```', '1', 'post', 'publish', '生活', '手机', '1', '0', '1', '1', '1', '1');
INSERT INTO `articles` VALUES ('3', '手机的16个惊人小秘密，据说99.999%的人都不知', '20', '1566569614', '1569209356', '引导语：知道么，手机有备用电池，手机拨号码12593+电话号码=陷阱……手机具有很多你不知道的小秘密，说出来一定很惊奇！不信的话就来看看吧！...\r\n\r\n', '引导语：知道么，手机有备用电池，手机拨号码12593+电话号码=陷阱……手机具有很多你不知道的小秘密，说出来一定很惊奇！不信的话就来看看吧！...\r\n\r\n这是文章内容', '1', 'post', 'publish', 'uu', '手机', '1', '0', '1', '1', '1', '1');
INSERT INTO `articles` VALUES ('4', '豪雅手机正式发布! 在法国全手工打造的奢侈品', 'test', '1567786007', '1569219069', '现在跨界联姻，时尚、汽车以及运动品牌联合手机制造商联合发布手机产品在行业里已经不再新鲜，上周我们给大家报道过著名手表制造商瑞士泰格·豪雅（Tag Heuer） 联合法国的手机制造商Modelabs发布的一款奢华手机的部分谍照，而近日该手机终于被正式发布了...', '现在跨界联姻，时尚、汽车以及运动品牌联合手机制造商联合发布手机产品在行业里已经不再新鲜，上周我们给大家报道过著名手表制造商瑞士泰格·豪雅（Tag Heuer） 联合法国的手机制造商Modelabs发布的一款奢华手机的部分谍照，而近日该手机终于被正式发布了...', '0', 'post', 'publish', '钉钉', '手机', '1', '0', '1', '1', '1', '1');
INSERT INTO `articles` VALUES ('14', 'PHP程序员这行能干多久？', '11', '1566977685', '1569219281', 'PHP程序员这行能干多久？我搞了开发这么久怎么还没有找到方向感，我现在非常焦虑，我很困惑，我对未来充满了恐惧，谁来帮帮我...', 'PHP程序员这行能干多久？我搞了开发这么久怎么还没有找到方向感，我现在非常焦虑，我很困惑，我对未来充满了恐惧，谁来帮帮我...', '0', 'post', 'publish', '一样', '工作', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('15', 'Java程序员晋升之路有哪些？？', '22', '1566977688', '1569751748', '这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述这是描述', '哒哒哒哒哒哒', '0', 'post', 'publish', '刚刚', '电脑', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('16', '雷小天测试tag保存', '33', '1566977685', '1567860198', '', '哒哒哒哒哒哒多多多多多多多多', '0', 'post', 'publish', '钉钉', '运维', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('17', '网站架构设计之高可用原则', '44', '1566977685', '1569650914', '网站架构设计之高可用原则，有哪些呢？第一，无状态', '1.1无状态\r\n\r\n如果设计的应用是无状态的，那么应用比较容易进行水平扩展。实际生产环境可能是这样的：应用无状态，配置文件有状态。比如，不同的机房需要读取不同的数据源，此时，就需要通过配置文件或者配置中心指定。\r\n\r\n1.2拆分\r\n\r\n在设计一个系统的初期，我们首先要考虑是做一个大而全的系统还是按功能模块拆分系统。像京东秒杀系统，访问量是非常大的，而且投入的资源还是蛮充足的，这种情况下，就可以考虑按功能拆分系统。那么拆分的标准是什么？\r\n\r\n', '0', 'post', 'publish', '222', '电脑', '0', '6', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('19', 'git工具分支创建管理案例分析', '55', '1566977685', '1566977685', '', '1111\r\n2133333333333333', '0', 'post', 'publish', null, 'default', '0', '2', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('21', '3333', '66', '1566977685', '1566977685', '', '8888888888888', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('22', 'PHP程序员这行能干多久？9999', '77', '1566977685', '1566977685', '', '分隔符', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('23', 'PHP程序员这行能干多久？88', '88', '1566977685', '1566977685', '', '888888888888888888', '0', 'post', 'publish', null, ' ', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('25', 'PHP程序员这行能干多久？77', '99', '1566977685', '1566977685', '', '7777777777', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('26', 'PHP程序员这行能干多久？123', '100', '1566977685', '1566977685', '', '123', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('28', 'PHP程序员这行能干多久？1234', '101', '1566977685', '1566977685', '', '444545', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('29', 'PHP程序员这行能干多久？1234', '102', '1566977685', '1566977685', '', '444545', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('30', 'PHP程序员这行能干多久？7879', '103', '1566977685', '1566977685', '', '1111111', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('31', '测试标题45454', '104', '1566977685', '1566977685', '', '454545', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('32', 'PHP程序员这行能干多久？888', '105', '1566977685', '1566977685', '', '88888888888888', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('33', '雷小天测试', '106', '1566977685', '1566977685', '', '雷小天', '0', 'post', 'publish', null, 'default', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('42', '关于', 'aboutme', '1566920166', '1566977785', '', 'aboutme', '4', 'page', 'publish', null, '', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('43', '相册', 'pincture', '1566921035', '1566921035', '', '这是相册页面', '4', 'page', 'publish', null, '', '0', '0', '1', '1', '1', '0');
INSERT INTO `articles` VALUES ('44', '原来以为，一个人的勇敢是，删掉他的手机号码...', null, '1567677494', '1569209187', '原来以为，一个人的勇敢是，删掉他的手机号码、QQ号码等等一切，努力和他保持距离。等着有一天，习惯不想念他，习惯他不在身边,习惯时间把他在我记忆里的身影磨蚀干净...', '雷小天顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '4', 'post', 'publish', '当达', '手机', '1', '0', '1', '1', '1', '1');
INSERT INTO `articles` VALUES ('45', ' 教你怎样用欠费手机拨打电话', null, '1567787007', '1569209128', '初次相识的喜悦，让你觉得似乎找到了知音。于是，对于投缘的人，开始了较频繁的交往。渐渐地，初识的喜悦退尽，接下来就是仅仅保持着联系，平淡到偶尔在节假曰发短信互致问候...', '初次相识的喜悦，让你觉得似乎找到了知音。于是，对于投缘的人，开始了较频繁的交往。渐渐地，初识的喜悦退尽，接下来就是仅仅保持着联系，平淡到偶尔在节假曰发短信互致问候...', '4', 'post', 'publish', '电话技巧', '电话', '1', '0', '1', '1', '1', '1');
INSERT INTO `articles` VALUES ('46', '住在手机里的朋友', null, '1566977685', '1569225318', '通信时代，无论是初次相见还是老友重逢，交换联系方式，常常是彼此交换名片，然后郑重或是出于礼貌用手机记下对方的电话号码。在快节奏的生活里，我们不知不觉中就成为住在别人手机里的朋友。又因某些意外，变成了别人手机里匆忙的过客，这种快餐式的友谊 ...', '通信时代，无论是初次相见还是老友重逢，交换联系方式，常常是彼此交换名片，然后郑重或是出于礼貌用手机记下对方的电话号码。在快节奏的生活里，我们不知不觉中就成为住在别人手机里的朋友。又因某些意外，变成了别人手机里匆忙的过客，这种快餐式的友谊 ...\r\n/upload/2019/08/rj85i5gasejovohqpic80aubf2.jpg\r\n', '4', 'post', 'publish', '手机配件,朋友', '手机', '1', '1', '1', '1', '1', '1');

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
  `status` varchar(16) DEFAULT 'not_audit',
  `parent` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`coid`),
  KEY `cid` (`cid`),
  KEY `created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('2', '19', '1566912607', 'xiao', '0', '1', '1124378213@qq.com', 'https://github.com/leiphp/sshflower', '0:0:0:0:0:0:0:1', null, '我来快快快测试', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('3', '17', '1566912678', '雷小天', '0', '1', '1124378213@qq.com', 'https://github.com/leiphp/sshflower', '0:0:0:0:0:0:0:1', null, '我可以看看 你的源码吗', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('4', '17', '1569565403', 'lei', '0', '0', '1124378213@qq.com', 'http://www.lxtkj.cn', '0:0:0:0:0:0:0:1', null, 'ddddddddddddddddddddddddddddd', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('5', '17', '1569565537', 'lei', '0', '0', '1124378213@qq.com', 'http://www.lxtkj.cn', '0:0:0:0:0:0:0:1', null, 'aaaaaaaaaaaaaaddddddddddddddddff', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('6', '17', '1569565877', '雷小天22', '0', '0', '1124378213@qq.com', 'http://www.lxtkj.cn', '0:0:0:0:0:0:0:1', null, '你是睡，拉我来敢来吗', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('7', '17', '1569566649', '雷小天22', '0', '0', '1124378213@qq.com', 'http://www.lxtkj.cn', '0:0:0:0:0:0:0:1', null, '顶顶顶顶顶顶顶顶顶顶啊啊啊啊', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('8', '17', '1569566870', '功林', '0', '0', '1124378213@qq.com', 'http://www.lxtkj.cn', '0:0:0:0:0:0:0:1', null, '啵啵啵啵啵啵啵啵啵啵啵啵宝宝', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('9', '19', '1569650477', '功林', '0', '0', '1124378213@qq.com', 'http://www.lxtkj.cn', '0:0:0:0:0:0:0:1', null, '测试评论的条数', 'comment', 'approved', '0');
INSERT INTO `comments` VALUES ('10', '46', '1569650522', '功林', '0', '0', '1124378213@qq.com', 'http://www.lxtkj.cn', '0:0:0:0:0:0:0:1', null, '我来测试评论行不行', 'comment', 'approved', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566312818');
INSERT INTO `logs` VALUES ('2', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566400842');
INSERT INTO `logs` VALUES ('3', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566489734');
INSERT INTO `logs` VALUES ('4', '登录后台', null, '1', '0:0:0:0:0:0:0:1', '1566569572');
INSERT INTO `logs` VALUES ('5', '保存系统设置', '{\"site_record\":\"21000\",\"site_description\":\"13 Blog\",\"site_title\":\"My Blog\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '4', '0:0:0:0:0:0:0:1', '1567348241');
INSERT INTO `logs` VALUES ('6', '保存系统设置', '{\"site_record\":\"666666666\",\"site_description\":\"13 Blog\",\"site_title\":\"My Blog\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '4', '0:0:0:0:0:0:0:1', '1567348465');
INSERT INTO `logs` VALUES ('7', '保存系统设置', '{\"site_record\":\"\",\"site_description\":\"13 Blog\",\"site_title\":\"My Blog\",\"site_theme\":\"default\",\"allow_install\":\"\"}', '4', '0:0:0:0:0:0:0:1', '1567348471');
INSERT INTO `logs` VALUES ('8', '保存系统设置', '{\"social_zhihu\":\"22\",\"social_github\":\"33\",\"social_twitter\":\"\",\"social_weibo\":\"11\"}', '4', '0:0:0:0:0:0:0:1', '1567348506');
INSERT INTO `logs` VALUES ('9', '保存系统设置', '{\"social_zhihu\":\"22\",\"social_github\":\"33\",\"social_twitter\":\"666\",\"social_weibo\":\"11\"}', '4', '0:0:0:0:0:0:0:1', '1567348540');
INSERT INTO `logs` VALUES ('10', '保存系统设置', '{\"social_zhihu\":\"22\",\"social_github\":\"33\",\"social_twitter\":\"677\",\"social_weibo\":\"11\"}', '4', '0:0:0:0:0:0:0:1', '1567349218');
INSERT INTO `logs` VALUES ('11', '修改个人信息', '{\"id\":4,\"name\":\"admin22\",\"email\":\"tian-lei-happy@163.com\"}', '4', '0:0:0:0:0:0:0:1', '1568285445');
INSERT INTO `logs` VALUES ('12', '修改个人信息', '{\"id\":4,\"name\":\"admin33\",\"email\":\"tian-lei-happy@163.com\"}', '4', '0:0:0:0:0:0:0:1', '1568285660');
INSERT INTO `logs` VALUES ('13', '修改个人信息', '{\"id\":4,\"name\":\"admin222\",\"email\":\"tian-lei-happy@163.com\"}', '4', '0:0:0:0:0:0:0:1', '1568285850');
INSERT INTO `logs` VALUES ('14', '修改个人信息', '{\"id\":4,\"name\":\"admin\",\"email\":\"tian-lei-happy@163.com\"}', '4', '0:0:0:0:0:0:0:1', '1568285868');
INSERT INTO `logs` VALUES ('15', '修改密码', null, '4', '0:0:0:0:0:0:0:1', '1568286893');
INSERT INTO `logs` VALUES ('16', '修改密码', null, '4', '0:0:0:0:0:0:0:1', '1568287022');
INSERT INTO `logs` VALUES ('17', '修改密码', null, '4', '0:0:0:0:0:0:0:1', '1568287213');
INSERT INTO `logs` VALUES ('18', '修改密码', null, '4', '0:0:0:0:0:0:0:1', '1568287240');
INSERT INTO `logs` VALUES ('19', '修改密码', null, '4', '0:0:0:0:0:0:0:1', '1569754383');
INSERT INTO `logs` VALUES ('20', '修改密码', null, '4', '0:0:0:0:0:0:0:1', '1569836015');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of metas
-- ----------------------------
INSERT INTO `metas` VALUES ('1', 'iPad', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('6', '雷小天博客', 'https://www.100txy.com', 'link', null, '0', '0');
INSERT INTO `metas` VALUES ('9', '手机', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('11', '笔记本', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('12', '电脑', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('13', 'github', 'https://github.com/leiphp', 'link', null, '0', '0');
INSERT INTO `metas` VALUES ('14', '百度', 'http://www.baidu.com', 'link', null, '2', '0');
INSERT INTO `metas` VALUES ('15', '手机配件', '手机配件', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('16', '顶顶顶', '顶顶顶', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('17', '电话', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('18', '电话技巧', '电话技巧', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('19', '当达', '当达', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('20', 'uu', 'uu', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('21', '生活', '生活', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('22', '钉钉', '钉钉', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('23', '工作', null, 'category', null, '0', '0');
INSERT INTO `metas` VALUES ('24', '一样', '一样', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('25', '朋友', '朋友', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('26', '222', '222', 'tag', null, '0', '0');
INSERT INTO `metas` VALUES ('27', '刚刚', '刚刚', 'tag', null, '0', '0');

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
INSERT INTO `options` VALUES ('allow_install', '', null);
INSERT INTO `options` VALUES ('site_description', '13 Blog', null);
INSERT INTO `options` VALUES ('site_keywords', '13 Blog', null);
INSERT INTO `options` VALUES ('site_record', '', '备案号');
INSERT INTO `options` VALUES ('site_theme', 'default', null);
INSERT INTO `options` VALUES ('site_title', 'My Blog', '');
INSERT INTO `options` VALUES ('social_github', '33', null);
INSERT INTO `options` VALUES ('social_twitter', '677', null);
INSERT INTO `options` VALUES ('social_weibo', '11', null);
INSERT INTO `options` VALUES ('social_zhihu', '22', null);

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
INSERT INTO `relationships` VALUES ('2', '9');
INSERT INTO `relationships` VALUES ('2', '21');
INSERT INTO `relationships` VALUES ('3', '1');
INSERT INTO `relationships` VALUES ('3', '7');
INSERT INTO `relationships` VALUES ('3', '9');
INSERT INTO `relationships` VALUES ('3', '20');
INSERT INTO `relationships` VALUES ('4', '9');
INSERT INTO `relationships` VALUES ('4', '22');
INSERT INTO `relationships` VALUES ('14', '23');
INSERT INTO `relationships` VALUES ('14', '24');
INSERT INTO `relationships` VALUES ('15', '12');
INSERT INTO `relationships` VALUES ('15', '27');
INSERT INTO `relationships` VALUES ('17', '12');
INSERT INTO `relationships` VALUES ('17', '26');
INSERT INTO `relationships` VALUES ('44', '9');
INSERT INTO `relationships` VALUES ('44', '19');
INSERT INTO `relationships` VALUES ('45', '16');
INSERT INTO `relationships` VALUES ('45', '17');
INSERT INTO `relationships` VALUES ('45', '18');
INSERT INTO `relationships` VALUES ('46', '9');
INSERT INTO `relationships` VALUES ('46', '15');
INSERT INTO `relationships` VALUES ('46', '25');

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
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL DEFAULT '',
  `age` int(3) NOT NULL DEFAULT '1',
  `role` varchar(20) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'leixiaotian', 'leixiaotian', '123456', '28', 'test', '');
INSERT INTO `users` VALUES ('2', 'leixiaotian', 'user', '35c5c7aa87c4d6915be5a44b0181b370', '28', 'user', '');
INSERT INTO `users` VALUES ('3', 'leiwen', 'vip', '112233', '23', 'vip', '');
INSERT INTO `users` VALUES ('4', 'admin', 'admin', 'addb450b8a9264810c5c006c59892192', '28', 'admin', 'tian-lei-happy@163.com');
INSERT INTO `users` VALUES ('5', 'test', '', '', '33', '', '');
