/*
Navicat MySQL Data Transfer

Source Server         : mysql2
Source Server Version : 50621
Source Host           : 127.0.0.1:3306
Source Database       : db_hospital

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2023-11-15 19:53:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  `username` varchar(255) DEFAULT NULL COMMENT '账户',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `sid` int(4) DEFAULT NULL COMMENT '部门id',
  `type` int(4) DEFAULT NULL COMMENT '类别',
  `num` int(4) DEFAULT NULL COMMENT '预约数量',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `age` int(4) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `isdel` int(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('1', '3.png', 'd111', '111', '1', '1', '10', '女', '方方', '12', '15011111111', '0');
INSERT INTO `doctor` VALUES ('2', '4.png', 'd222', '222', '2', '0', '28', '男', '陈秋实', '10', '15011111111', '0');
INSERT INTO `doctor` VALUES ('5', '3.png', 'p444', '444', '2', '0', '10', '女', '新华网', '8', '13367890900', '0');
INSERT INTO `doctor` VALUES ('6', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '张三', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('7', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '李四', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('8', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '王五', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('9', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '李勇', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('10', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '李刚', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('11', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '王二', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('12', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '蒋中', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('13', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '李文', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('14', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '艾芬', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('15', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '艾迪', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('16', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '吴锡', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('17', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', '黎金', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('18', '3.png', 'daaa', 'aaa', '1', '1', '10', '男', 'TOKYO', '10', '13112345678', '0');
INSERT INTO `doctor` VALUES ('19', '4.jpg', 'kkk', 'kkk', '1', '0', '101', '男', '新华网', '20', '13367890900', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(5000) DEFAULT NULL COMMENT '内容',
  `type` int(4) DEFAULT NULL COMMENT '新闻0公告1',
  `time` date DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('2', 'b2.jpg', '新华网', '新华网<p><br></p>', '1', '2020-08-03');
INSERT INTO `news` VALUES ('4', 'pic4.jpg', '新华网', '新华网', '1', '2020-06-18');
INSERT INTO `news` VALUES ('5', 'pic4.jpg', '锵锵三人行', '锵锵三人行', '1', '2020-06-17');
INSERT INTO `news` VALUES ('6', 'pic4.jpg', '锵锵三人行', '锵锵三人行', '1', '2020-06-10');
INSERT INTO `news` VALUES ('7', 'pic4.jpg', '锵锵三人行', '锵锵三人行', '1', '2020-06-09');
INSERT INTO `news` VALUES ('8', 'pic4.jpg', '锵锵三人行', '锵锵三人行锵锵三人行锵锵三人行锵锵三人行锵锵三人行', '0', '2020-06-09');
INSERT INTO `news` VALUES ('9', 'pic4.jpg', '锵锵三人行', '锵锵三人行锵锵三人行锵锵三人行锵锵三人行锵锵三人行', '0', '2020-06-09');
INSERT INTO `news` VALUES ('10', 'pic4.jpg', '锵锵三人行', '锵锵三人行锵锵三人行锵锵三人行锵锵三人行锵锵三人行', '0', '2020-06-09');
INSERT INTO `news` VALUES ('11', 'pic4.jpg', '锵锵三人行', '锵锵三人行锵锵三人行锵锵三人行锵锵三人行锵锵三人行', '0', '2020-06-09');
INSERT INTO `news` VALUES ('12', 'pic4.jpg', '锵锵三人行', '锵锵三人行锵锵三人行锵锵三人行锵锵三人行锵锵三人行', '0', '2020-06-09');
INSERT INTO `news` VALUES ('13', 'pic4.jpg', '锵锵三人行', '锵锵三人行锵锵三人行锵锵三人行锵锵三人行锵锵三人行', '0', '2020-06-09');
INSERT INTO `news` VALUES ('14', 'pic4.jpg', '锵锵三人行', '锵锵三人行锵锵三人行锵锵三人行锵锵三人行锵锵三人行', '0', '2020-06-09');
INSERT INTO `news` VALUES ('19', 'ins11.jpg', 'announcements', '<p>1<img src=\"/hospital/images/b2.jpg\" style=\"max-width: 100%;\"></p>', '1', '2023-11-15');

-- ----------------------------
-- Table structure for no
-- ----------------------------
DROP TABLE IF EXISTS `no`;
CREATE TABLE `no` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `date` date DEFAULT NULL COMMENT '日期',
  `time` int(4) DEFAULT NULL COMMENT '1(8:00-9:30)2(9:30-11:00)3(2:00-3:30)4(3:30-5:00)',
  `did` int(4) DEFAULT NULL COMMENT '医生id',
  `pid` int(4) DEFAULT NULL COMMENT '患者id',
  `price` double DEFAULT NULL COMMENT '金额',
  `state` int(4) DEFAULT NULL COMMENT '0未预约1已预约2已赴约3预约被拒',
  `isdel` int(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of no
-- ----------------------------
INSERT INTO `no` VALUES ('1', '2020-06-26', '1', '1', '1', '100', '1', '0');
INSERT INTO `no` VALUES ('2', '2020-06-26', '1', '2', '1', '100', '0', '0');
INSERT INTO `no` VALUES ('3', '2020-06-26', '1', '3', '1', '100', '0', '0');
INSERT INTO `no` VALUES ('4', '2020-07-08', '3', '1', '1', null, '1', '0');
INSERT INTO `no` VALUES ('5', '2020-07-08', '3', '1', '1', null, '1', '0');
INSERT INTO `no` VALUES ('6', '2020-07-08', '3', '1', '1', null, '0', '0');
INSERT INTO `no` VALUES ('7', '2020-07-08', '3', '1', '1', null, '2', '0');
INSERT INTO `no` VALUES ('8', '2020-07-08', '3', '1', '1', null, '0', '0');
INSERT INTO `no` VALUES ('9', '2020-07-08', '3', '1', '1', null, '2', '0');
INSERT INTO `no` VALUES ('10', '2020-07-08', '3', '1', '1', null, '0', '0');
INSERT INTO `no` VALUES ('11', '2020-07-08', '3', '1', '1', null, '1', '0');
INSERT INTO `no` VALUES ('12', '2020-07-08', '3', '1', '1', null, '1', '0');
INSERT INTO `no` VALUES ('13', '2020-07-07', '3', '1', '1', null, '3', '0');
INSERT INTO `no` VALUES ('14', '2020-07-07', '3', '1', '1', null, '1', '0');
INSERT INTO `no` VALUES ('15', '2020-07-07', '2', '1', '1', null, '1', '0');
INSERT INTO `no` VALUES ('16', '2020-07-07', '2', '1', '1', null, '1', '0');
INSERT INTO `no` VALUES ('17', '2020-09-29', '2', '14', '5', null, '0', '0');
INSERT INTO `no` VALUES ('18', '2020-09-29', '2', '14', '5', null, '0', '0');
INSERT INTO `no` VALUES ('19', '2020-11-21', '2', '1', null, null, '0', '0');
INSERT INTO `no` VALUES ('20', '2023-11-17', '1', '6', '3', null, '1', '0');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `pic` varchar(255) DEFAULT NULL COMMENT '图片',
  `card` varchar(255) DEFAULT NULL COMMENT '医保卡号',
  `username` varchar(255) DEFAULT NULL COMMENT '账户',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `role` int(4) DEFAULT NULL COMMENT '管理员0普通用户1',
  `sex` varchar(255) DEFAULT NULL COMMENT '性别',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `age` int(4) DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `isdel` int(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '4.png', '2020/6/14', 'p111', '111', '1', '女', '可可', '30', '15111111112', '0');
INSERT INTO `person` VALUES ('2', '1.png', '11111111111', 'p222', '222', '1', '女', '新华网', '10', '13367890900', '0');
INSERT INTO `person` VALUES ('3', '3.png', '2222222', 'p333', '333', '0', '男', '笔记本', '20', '13367890900', '0');
INSERT INTO `person` VALUES ('5', '4.png', '11111111111', 'p444', '444', '0', '男', '笔记本', '20', '13367890900', '0');
INSERT INTO `person` VALUES ('6', '4.png', '11111111111', 'p555', '555', '0', '男', '新华网', '20', '13367890900', '0');

-- ----------------------------
-- Table structure for sector
-- ----------------------------
DROP TABLE IF EXISTS `sector`;
CREATE TABLE `sector` (
  `id` int(4) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) DEFAULT NULL COMMENT '部门名',
  `isdel` int(4) DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sector
-- ----------------------------
INSERT INTO `sector` VALUES ('1', '骨科', '0');
INSERT INTO `sector` VALUES ('2', '皮肤科', '0');
