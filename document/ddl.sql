/*
Navicat MySQL Data Transfer

Source Server         : yanyanghong
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : mps

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2017-12-08 02:21:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for mps_category
-- ----------------------------
DROP TABLE IF EXISTS `mps_category`;
CREATE TABLE `mps_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_x` varchar(20) COLLATE utf8_bin NOT NULL,
  `active_c` char(1) COLLATE utf8_bin NOT NULL,
  `crtBy_m` varchar(20) COLLATE utf8_bin NOT NULL,
  `crtOn_dt` datetime NOT NULL,
  `updBy_m` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `updOn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for mps_categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `mps_categorysecond`;
CREATE TABLE `mps_categorysecond` (
  `secondCategory_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name_x` varchar(20) COLLATE utf8_bin NOT NULL,
  `active_c` char(1) COLLATE utf8_bin NOT NULL,
  `crtBy_m` varchar(20) COLLATE utf8_bin NOT NULL,
  `crtOn_dt` datetime NOT NULL,
  `updBy_m` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `updOn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`secondCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for mps_company
-- ----------------------------
DROP TABLE IF EXISTS `mps_company`;
CREATE TABLE `mps_company` (
  `company_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_x` varchar(20) COLLATE utf8_bin NOT NULL,
  `active_c` char(1) COLLATE utf8_bin NOT NULL,
  `crtBy_m` varchar(20) COLLATE utf8_bin NOT NULL,
  `crtOn_dt` datetime NOT NULL,
  `updBy_m` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `updOn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Table structure for mps_user
-- ----------------------------
DROP TABLE IF EXISTS `mps_user`;
CREATE TABLE `mps_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username_m` varchar(20) COLLATE utf8_bin NOT NULL,
  `realName_m` varchar(20) COLLATE utf8_bin NOT NULL,
  `password_x` varchar(200) COLLATE utf8_bin NOT NULL,
  `sex_x` varchar(2) COLLATE utf8_bin NOT NULL,
  `age_n` int(11) DEFAULT NULL,
  `email_x` varchar(200) COLLATE utf8_bin NOT NULL,
  `phone_x` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `amount_n` double DEFAULT NULL,
  `authority_x` varchar(10) COLLATE utf8_bin NOT NULL,
  `active_c` char(1) COLLATE utf8_bin NOT NULL,
  `crtBy_m` varchar(20) COLLATE utf8_bin NOT NULL,
  `crtOn_dt` datetime NOT NULL,
  `updBy_m` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `updOn_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
