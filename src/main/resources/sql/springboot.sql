/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : springboot

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-08-20 18:17:29
*/

SET FOREIGN_KEY_CHECKS=0;

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
