/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : scoremanagement

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2018-07-30 21:33:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `catalogId` int(8) NOT NULL AUTO_INCREMENT,
  `catalogName` varchar(255) NOT NULL COMMENT '分类名称',
  `parentId` int(255) DEFAULT NULL COMMENT '父级分类id',
  PRIMARY KEY (`catalogId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `classId` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `className` varchar(255) NOT NULL COMMENT '班级名称',
  `majorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '软件工程1401', '1');
INSERT INTO `class` VALUES ('2', '软件工程1402', '1');
INSERT INTO `class` VALUES ('3', '信息管理与信息系统1401', '3');
INSERT INTO `class` VALUES ('4', '工程管理1401', '4');
INSERT INTO `class` VALUES ('5', '自动化1401', '5');
INSERT INTO `class` VALUES ('6', '电信1402', '5');
INSERT INTO `class` VALUES ('7', '电信1501', '6');
INSERT INTO `class` VALUES ('8', '汽车1401', '7');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS `college`;
CREATE TABLE `college` (
  `collegeId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学院id',
  `collegeName` varchar(255) NOT NULL COMMENT '学院名称',
  PRIMARY KEY (`collegeId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO `college` VALUES ('1', '计算机学院');
INSERT INTO `college` VALUES ('2', '管理学院');
INSERT INTO `college` VALUES ('3', '信息学院');
INSERT INTO `college` VALUES ('4', '汽交学院');

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file` (
  `fileId` int(11) NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `fileName` varchar(255) DEFAULT NULL COMMENT '文件原名',
  `path` varchar(255) DEFAULT NULL COMMENT '文件路径',
  PRIMARY KEY (`fileId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of file
-- ----------------------------

-- ----------------------------
-- Table structure for judgerule
-- ----------------------------
DROP TABLE IF EXISTS `judgerule`;
CREATE TABLE `judgerule` (
  `j_id` varchar(255) NOT NULL,
  `score` float DEFAULT NULL,
  `rule` varchar(100) DEFAULT NULL,
  `ownLevel` int(11) DEFAULT NULL,
  `parentsId` varchar(255) DEFAULT NULL,
  `is_del` bit(1) DEFAULT NULL,
  PRIMARY KEY (`j_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of judgerule
-- ----------------------------
INSERT INTO `judgerule` VALUES ('1', '0', '科研成果和知识产权类', '1', '0', '\0');
INSERT INTO `judgerule` VALUES ('2', '0', '科技成果奖', '2', '1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa88265015aa8867d940000', '0', '国家级', '3', '2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa88265015aa886b9b80001', '0', '省级', '3', '2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa88265015aa887307c0002', '0', '一等奖', '4', '402879815aa88265015aa8867d940000', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa88265015aa88767d10003', '0', '二等奖', '4', '402879815aa88265015aa8867d940000', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa88265015aa88854390004', '30', '第一负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8dc6c5e0000', '27', '第二负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8dcb5820001', '24', '第三负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8dd26280002', '21', '第四负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8dda3830003', '18', '第五负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8dea8580004', '15', '第六负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8deef490005', '12', '第七负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8df31c80006', '9', '第八负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8df7ec80007', '6', '第九负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8dfeaab0008', '3', '第十负责人', '5', '402879815aa88265015aa887307c0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e04df60009', '20', '第一负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e09ae7000a', '18', '第二负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e0d448000b', '16', '第三负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e143ac000c', '14', '第四负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e17b61000d', '12', '第五负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e1c0f2000e', '10', '第六负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e20246000f', '8', '蒂奇负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e23d5a0010', '6', '第八负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e2708b0011', '4', '第九负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e2a9ec0012', '2', '第十负责人', '5', '402879815aa88265015aa88767d10003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e2f8240013', '0', '一等奖', '4', '402879815aa88265015aa886b9b80001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e325060014', '0', '二等奖', '4', '402879815aa88265015aa886b9b80001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e358620015', '0', '三等奖', '4', '402879815aa88265015aa886b9b80001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e51e8e0016', '15', '第一负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e69a0f0017', '13.5', '第二负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e70dde0018', '12', '第三负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e75e500019', '10.5', '第四负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e7a9bb001a', '9', '第五负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e81ca0001b', '7.5', '第六负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e8b29d001c', '6', '第七负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e8fbda001d', '4.5', '第八负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e95612001e', '3', '第九负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e996c5001f', '1.5', '第十负责人', '5', '402879815aa8c6bc015aa8e2f8240013', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8e9e9a30020', '10', '第一负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ea26da0021', '9', '第二负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ea64910022', '8', '第三负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8eaa9e50023', '7', '第四负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8eaef210024', '6', '第五负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8eb2d570025', '5', '第六负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8eb84c10026', '4', '第七负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ebc6110027', '3', '第八负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ebfc230028', '2', '第九负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ec43b90029', '1', '第十负责人', '5', '402879815aa8c6bc015aa8e325060014', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ec8b27002a', '8', '第一负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ecd0d5002b', '7', '第二负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ed3f24002c', '6', '第三负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8edd4cb002d', '5.5', '第四负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ee3976002e', '4.5', '第五负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ee75a3002f', '4', '第六负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8eeb6aa0030', '3', '第七负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8eefb990031', '2', '第八负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8ef6e3b0032', '1.5', '第九负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8efb9cb0033', '0.5', '第十负责人', '5', '402879815aa8c6bc015aa8e358620015', '\0');
INSERT INTO `judgerule` VALUES ('402879815aa8c6bc015aa8f057f40034', '0', '学术论文', '2', '1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac369b8b0000', '0', '被SCI、SSCI检索', '3', '402879815aa8c6bc015aa8f057f40034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac36ee460001', '0', '被EI、MEDLINE、CPCI检索', '3', '402879815aa8c6bc015aa8f057f40034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac37310d0002', '0', '中文核心期刊', '3', '402879815aa8c6bc015aa8f057f40034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3786220003', '0', '国际学术会议论文集', '3', '402879815aa8c6bc015aa8f057f40034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac37c6550004', '0', '国内公开出版的学术期刊', '3', '402879815aa8c6bc015aa8f057f40034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac380fcd0005', '0', '省级及以上学术会议论文', '3', '402879815aa8c6bc015aa8f057f40034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac38bf170006', '20', '第一作者', '4', '402879815aac35b6015aac369b8b0000', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac397fa60007', '12', '第二作者', '4', '402879815aac35b6015aac369b8b0000', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3a1f460008', '8', '第三作者', '4', '402879815aac35b6015aac369b8b0000', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3a79060009', '4', '第四作者', '4', '402879815aac35b6015aac369b8b0000', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3b1ce6000a', '10', '第一作者', '4', '402879815aac35b6015aac36ee460001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3b646a000b', '6', '第二作者', '4', '402879815aac35b6015aac36ee460001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3bc91d000c', '4', '第三作者', '4', '402879815aac35b6015aac36ee460001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3c0569000d', '2', '第四作者', '4', '402879815aac35b6015aac36ee460001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3c77b3000e', '5', '第一作者', '4', '402879815aac35b6015aac37310d0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3ccea8000f', '3', '第二作者', '4', '402879815aac35b6015aac37310d0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3d1a050010', '2', '第三作者', '4', '402879815aac35b6015aac37310d0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3d60400011', '1', '第四作者', '4', '402879815aac35b6015aac37310d0002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3dccaf0012', '3', '第一作者', '4', '402879815aac35b6015aac3786220003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3e17ad0013', '1.5', '第二作者', '4', '402879815aac35b6015aac3786220003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3e627c0014', '1', '第三作者', '4', '402879815aac35b6015aac3786220003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3eaaba0015', '0.5', '第四作者', '4', '402879815aac35b6015aac3786220003', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3f04470016', '2', '第一作者', '4', '402879815aac35b6015aac37c6550004', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3f4e900017', '1', '第二作者', '4', '402879815aac35b6015aac37c6550004', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac3fa9be0018', '0.5', '第三作者', '4', '402879815aac35b6015aac37c6550004', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac4015390019', '1', '第一作者', '4', '402879815aac35b6015aac380fcd0005', '\0');
INSERT INTO `judgerule` VALUES ('402879815aac35b6015aac404ae3001a', '0.5', '第二作者', '4', '402879815aac35b6015aac380fcd0005', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada2e7340000', '0', '文学作品、美术及艺术设计作品', '2', '1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada33d9e0001', '0', '中文核心期刊', '3', '402879815aad9baf015aada2e7340000', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada37e340002', '0', '国内公开出版期刊', '3', '402879815aad9baf015aada2e7340000', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada49c2a0003', '5', '第一作者', '4', '402879815aad9baf015aada33d9e0001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada4deca0004', '3', '第二作者', '4', '402879815aad9baf015aada33d9e0001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada522140005', '2', '第三作者', '4', '402879815aad9baf015aada33d9e0001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada552db0006', '1', '第四作者', '4', '402879815aad9baf015aada33d9e0001', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada5b2f60007', '2', '第一作者', '4', '402879815aad9baf015aada37e340002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada5ea310008', '1', '第二作者', '4', '402879815aad9baf015aada37e340002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada642760009', '0.5', '第三作者', '4', '402879815aad9baf015aada37e340002', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada69e6c000a', '0', '知识产权', '2', '1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada6e142000b', '0', '发明专利', '3', '402879815aad9baf015aada69e6c000a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aada716d0000c', '0', '实用新型、外观设计专利', '3', '402879815aad9baf015aada69e6c000a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadaa2fdb000d', '0', '软件著作权', '3', '402879815aad9baf015aada69e6c000a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadaa6c82000e', '0', '集成电路布图设计权', '3', '402879815aad9baf015aada69e6c000a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadaaf91d000f', '10', '第一发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadab6ebc0010', '9', '第二发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadabb7d00011', '8', '第三发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadac612a0012', '7', '第四发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadace9880013', '6', '第五发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadad33720014', '5', '第六发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadaf5e230015', '4', '第七发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadafa7b00016', '3', '第八发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadafea280017', '2', '第九发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadb03f670018', '1', '第十发明人', '4', '402879815aad9baf015aada6e142000b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadc8ef730019', '3', '第一权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadcb3f3d001a', '2.5', '第二权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadcb95a2001b', '2', '第三权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadcbed73001c', '2', '第四权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadcc424c001d', '1.5', '第五权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadcc927f001e', '1.5', '第六权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadcceccd001f', '1', '第七权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadcd5bf40020', '0.5', '第八权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadcdad080021', '0.5', '第九权利人', '4', '402879815aad9baf015aada716d0000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade206410022', '2', '第一权利人', '4', '402879815aad9baf015aadaa2fdb000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade26be90023', '1.5', '第二权利人', '4', '402879815aad9baf015aadaa2fdb000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade2b6ac0024', '1.5', '第三权利人', '4', '402879815aad9baf015aadaa2fdb000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade2fc2d0025', '1', '第四权利人', '4', '402879815aad9baf015aadaa2fdb000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade344fa0026', '1', '第五权利人', '4', '402879815aad9baf015aadaa2fdb000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade38f3a0027', '1', '第六权利人', '4', '402879815aad9baf015aadaa2fdb000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade410d00028', '0.5', '第七权利人', '4', '402879815aad9baf015aadaa2fdb000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade463a00029', '0.5', '第八权利人', '4', '402879815aad9baf015aadaa2fdb000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade4b00f002a', '2', '第一权利人', '4', '402879815aad9baf015aadaa6c82000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade761f1002b', '1.5', '第二权利人', '4', '402879815aad9baf015aadaa6c82000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aade7a6f8002c', '1.5', '第三权利人', '4', '402879815aad9baf015aadaa6c82000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadec36b0002d', '1', '第四权利人', '4', '402879815aad9baf015aadaa6c82000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadec85af002e', '1', '第五权利人', '4', '402879815aad9baf015aadaa6c82000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadeccf9e002f', '1', '第六权利人', '4', '402879815aad9baf015aadaa6c82000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aaded1dcf0030', '0.5', '第七权利人', '4', '402879815aad9baf015aadaa6c82000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aaded7b3d0031', '0.5', '第八权利人', '4', '402879815aad9baf015aadaa6c82000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadedcf860032', '0', '科研训练类', '1', '0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadf05b530033', '0', '科研项目', '2', '402879815aad9baf015aadedcf860032', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadf0cb300034', '0', '(国家级)完成立项申报、实验研究、结题等全过程且项目结题通过验收', '3', '402879815aad9baf015aadf05b530033', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadf115f00035', '0', '(省级)完成立项申报、实验研究、结题等全过程且项目结题通过验收', '3', '402879815aad9baf015aadf05b530033', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadf152a60036', '0', '(校级)完成立项申报、实验研究、结题等全过程且项目结题通过验收', '3', '402879815aad9baf015aadf05b530033', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadf29d5d0037', '20', '第一负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aad9baf015aadf43c2f0038', '9', '第二负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae0dcf990000', '8', '第三负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae0e128e0001', '7', '第四负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae0e54550002', '6', '第五负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae0e91a90003', '5', '第六负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae0ed2b00004', '4', '第七负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae0f1d9a0005', '3', '第八负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae0f6eae0006', '2', '第九负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae0faa450007', '1', '第十负责人', '4', '402879815aad9baf015aadf0cb300034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1006eb0008', '10', '第一负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae105f7e0009', '4.5', '第二负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae109938000a', '4', '第三负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae10e018000b', '3.5', '第四负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae11309a000c', '3', '第五负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae117f2f000d', '2.5', '第六负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae11c6ae000e', '2', '第七负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae121aba000f', '1.5', '第八负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1253560010', '1', '第九负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae129bb80011', '0.5', '第十负责人', '4', '402879815aad9baf015aadf115f00035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae12f4910012', '5', '第一负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae13475d0013', '2', '第二负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae138cb60014', '2', '第三负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae13d2f60015', '1.5', '第四负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1423d40016', '1.5', '第五负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1460fc0017', '1', '第六负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae14bb3d0018', '1', '第七负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae152f6c0019', '0.5', '第八负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae156eb0001a', '0.5', '第九负责人', '4', '402879815aad9baf015aadf152a60036', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1673f4001b', '0', '创新创业训练计划项目', '2', '402879815aad9baf015aadedcf860032', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae17a072001c', '0', '(国家级)完成立项申报、实验研究、结题等全过程且项目结题通过验收', '3', '402879815aae0bef015aae1673f4001b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae17e21c001d', '0', '(省级)完成立项申报、实验研究、结题等全过程且项目结题通过验收', '3', '402879815aae0bef015aae1673f4001b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae182d88001e', '0', '(校级)完成立项申报、实验研究、结题等全过程且项目结题通过验收', '3', '402879815aae0bef015aae1673f4001b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae189faa001f', '8', '第一负责人', '4', '402879815aae0bef015aae17a072001c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1cc48c0020', '3.5', '第二负责人', '4', '402879815aae0bef015aae17a072001c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1d13800021', '3', '第三负责人', '4', '402879815aae0bef015aae17a072001c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1d55ff0022', '2.5', '第四负责人', '4', '402879815aae0bef015aae17a072001c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1d9d040023', '5', '第一负责人', '4', '402879815aae0bef015aae17e21c001d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1ddc3d0024', '2', '第二负责人', '4', '402879815aae0bef015aae17e21c001d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1e26c70025', '1.5', '第三负责人', '4', '402879815aae0bef015aae17e21c001d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1e6e220026', '1.5', '第四负责人', '4', '402879815aae0bef015aae17e21c001d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae1fd8b30027', '3', '第一负责人', '4', '402879815aae0bef015aae182d88001e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae200e770028', '1', '第二负责人', '4', '402879815aae0bef015aae182d88001e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae20671d0029', '1', '第三负责人', '4', '402879815aae0bef015aae182d88001e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae20b2be002a', '0.5', '第四负责人', '4', '402879815aae0bef015aae182d88001e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae20ed16002b', '0', '学科与科技竞赛类', '1', '0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae283cff002c', '0', '中国“互联网+”大学生创新创业大赛、“挑战杯”大学生课外学术科技作品竞赛、“创青春”大学生创业大赛', '2', '402879815aae0bef015aae20ed16002b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2b9439002d', '0', '教育部主办的学科与科技竞赛', '2', '402879815aae0bef015aae20ed16002b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2bcf4d002e', '0', '一般性行业类学科与科技竞赛', '2', '402879815aae0bef015aae20ed16002b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2c77ca002f', '0', '国家级', '3', '402879815aae0bef015aae283cff002c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2cb8440030', '0', '省级', '3', '402879815aae0bef015aae283cff002c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2d00190031', '0', '校级', '3', '402879815aae0bef015aae283cff002c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2d88930032', '0', '一等奖', '4', '402879815aae0bef015aae2c77ca002f', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2dc4d60033', '0', '二等奖', '4', '402879815aae0bef015aae2c77ca002f', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2e030b0034', '0', '三等奖', '4', '402879815aae0bef015aae2c77ca002f', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2e70c30035', '0', '参与但未获奖', '4', '402879815aae0bef015aae2c77ca002f', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae2f53d70036', '20', '排序第一', '5', '402879815aae0bef015aae2d88930032', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3370450037', '10', '排序第二', '5', '402879815aae0bef015aae2d88930032', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae33ddc30038', '10', '排序第三', '5', '402879815aae0bef015aae2d88930032', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3448a20039', '6', '排序第四', '5', '402879815aae0bef015aae2d88930032', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae347e05003a', '6', '排序第五', '5', '402879815aae0bef015aae2d88930032', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3515d1003b', '15', '排序第一', '5', '402879815aae0bef015aae2dc4d60033', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae358f36003c', '7.5', '排序第二', '5', '402879815aae0bef015aae2dc4d60033', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3608b2003d', '7.5', '排序第三', '5', '402879815aae0bef015aae2dc4d60033', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3648f3003e', '4.5', '排序第四', '5', '402879815aae0bef015aae2dc4d60033', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae36a304003f', '4.5', '排序第五', '5', '402879815aae0bef015aae2dc4d60033', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae36feed0040', '10', '排序第一', '5', '402879815aae0bef015aae2e030b0034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae37421a0041', '5', '排序第二', '5', '402879815aae0bef015aae2e030b0034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae378dd50042', '5', '排序第三', '5', '402879815aae0bef015aae2e030b0034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae37cfb30043', '3', '排序第四', '5', '402879815aae0bef015aae2e030b0034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae38118f0044', '3', '排序第五', '5', '402879815aae0bef015aae2e030b0034', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae387bc00045', '5', '排序第一', '5', '402879815aae0bef015aae2e70c30035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae38c2d30046', '2.5', '排序第二', '5', '402879815aae0bef015aae2e70c30035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3900df0047', '2.5', '排序第三', '5', '402879815aae0bef015aae2e70c30035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3945600048', '1.5', '排序第四', '5', '402879815aae0bef015aae2e70c30035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3985490049', '1.5', '排序第五', '5', '402879815aae0bef015aae2e70c30035', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae39cf4d004a', '0', '一等奖', '4', '402879815aae0bef015aae2cb8440030', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3a080a004b', '0', '二等奖', '4', '402879815aae0bef015aae2cb8440030', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3a4b18004c', '0', '三等奖', '4', '402879815aae0bef015aae2cb8440030', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3a8e35004d', '0', '参与但未获奖', '4', '402879815aae0bef015aae2cb8440030', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3b0b37004e', '10', '排序第一', '5', '402879815aae0bef015aae39cf4d004a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3c5ce5004f', '5', '排序第二', '5', '402879815aae0bef015aae39cf4d004a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3ca79f0050', '5', '排序第三', '5', '402879815aae0bef015aae39cf4d004a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae3cf6fc0051', '3', '排序第四', '5', '402879815aae0bef015aae39cf4d004a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae41df950052', '3', '排序第五', '5', '402879815aae0bef015aae39cf4d004a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae424cfc0053', '8', '排序第一', '5', '402879815aae0bef015aae3a080a004b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae42866f0054', '4', '排序第二', '5', '402879815aae0bef015aae3a080a004b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae42c2330055', '4', '排序第三', '5', '402879815aae0bef015aae3a080a004b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae4311cc0056', '2', '排序第四', '5', '402879815aae0bef015aae3a080a004b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae434ece0057', '2', '排序第五', '5', '402879815aae0bef015aae3a080a004b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae48db700058', '7', '排序第一', '5', '402879815aae0bef015aae3a4b18004c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae4a00e80059', '3.5', '排序第二', '5', '402879815aae0bef015aae3a4b18004c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae4a4be1005a', '3.5', '排序第三', '5', '402879815aae0bef015aae3a4b18004c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae4a8c90005b', '2', '排序第四', '5', '402879815aae0bef015aae3a4b18004c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae4abd8a005c', '2', '排序第五', '5', '402879815aae0bef015aae3a4b18004c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae4b26f6005d', '3', '排序第一', '5', '402879815aae0bef015aae3a8e35004d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae4b6fc4005e', '1.5', '排序第二', '5', '402879815aae0bef015aae3a8e35004d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae4bb04d005f', '1.5', '排序第三', '5', '402879815aae0bef015aae3a8e35004d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae54a99d0060', '0.5', '排序第四', '5', '402879815aae0bef015aae3a8e35004d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae54debc0061', '0.5', '排序第五', '5', '402879815aae0bef015aae3a8e35004d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae551b560062', '0', '一等奖', '4', '402879815aae0bef015aae2d00190031', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae555a470063', '0', '二等奖', '4', '402879815aae0bef015aae2d00190031', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5592ec0064', '0', '三等奖', '4', '402879815aae0bef015aae2d00190031', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae55f8250065', '0', '参与但未获奖', '4', '402879815aae0bef015aae2d00190031', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5676810066', '6', '排序第一', '5', '402879815aae0bef015aae551b560062', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae56b7820067', '3', '排序第二', '5', '402879815aae0bef015aae551b560062', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5705410068', '3', '排序第三', '5', '402879815aae0bef015aae551b560062', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae576af90069', '1.5', '排序第四', '5', '402879815aae0bef015aae551b560062', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae57a780006a', '1.5', '排序第五', '5', '402879815aae0bef015aae551b560062', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae585f1e006b', '5', '排序第一', '5', '402879815aae0bef015aae555a470063', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae58b2ff006c', '2.5', '排序第二', '5', '402879815aae0bef015aae555a470063', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae590127006d', '2.5', '排序第三', '5', '402879815aae0bef015aae555a470063', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5958a5006e', '1.5', '排序第四', '5', '402879815aae0bef015aae555a470063', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae599fa7006f', '1.5', '排序第五', '5', '402879815aae0bef015aae555a470063', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5a7d200070', '4', '排序第一', '5', '402879815aae0bef015aae5592ec0064', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5ac57b0071', '2', '排序第二', '5', '402879815aae0bef015aae5592ec0064', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5b0be30072', '2', '排序第三', '5', '402879815aae0bef015aae5592ec0064', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5b561b0073', '1', '排序第四', '5', '402879815aae0bef015aae5592ec0064', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5b903b0074', '1', '排序第五', '5', '402879815aae0bef015aae5592ec0064', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5bf7b70075', '2', '排序第一', '5', '402879815aae0bef015aae55f8250065', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5c29740076', '1', '排序第二', '5', '402879815aae0bef015aae55f8250065', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5c5e4a0077', '1', '排序第三', '5', '402879815aae0bef015aae55f8250065', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5c9fe20078', '0.5', '排序第四', '5', '402879815aae0bef015aae55f8250065', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5ce3750079', '0.5', '排序第五', '5', '402879815aae0bef015aae55f8250065', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5d342e007a', '0', '国家级', '3', '402879815aae0bef015aae2b9439002d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5d6293007b', '0', '省级', '3', '402879815aae0bef015aae2b9439002d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5d8f24007c', '0', '校级', '3', '402879815aae0bef015aae2b9439002d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5edaff007d', '0', '国家级及以上', '3', '402879815aae0bef015aae2bcf4d002e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5f0a26007e', '0', '省级', '3', '402879815aae0bef015aae2bcf4d002e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae5f2f3d007f', '0', '校级', '3', '402879815aae0bef015aae2bcf4d002e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6092f20080', '0', '一等奖', '4', '402879815aae0bef015aae5d342e007a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae60c4880081', '0', '二等奖', '4', '402879815aae0bef015aae5d342e007a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae60ffa00082', '0', '三等奖', '4', '402879815aae0bef015aae5d342e007a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6163530083', '0', '参与但未获奖', '4', '402879815aae0bef015aae5d342e007a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae61ba4c0084', '10', '排序第一', '5', '402879815aae0bef015aae6092f20080', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6210ed0085', '5', '排序第二', '5', '402879815aae0bef015aae6092f20080', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6256090086', '5', '排序第三', '5', '402879815aae0bef015aae6092f20080', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae63fccf0087', '3', '排序第四', '5', '402879815aae0bef015aae6092f20080', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae643cdd0088', '3', '排序第五', '5', '402879815aae0bef015aae6092f20080', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6485860089', '8', '排序第一', '5', '402879815aae0bef015aae60c4880081', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae64c976008a', '4', '排序第二', '5', '402879815aae0bef015aae60c4880081', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae650f3a008b', '4', '排序第三', '5', '402879815aae0bef015aae60c4880081', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae65628b008c', '2', '排序第四', '5', '402879815aae0bef015aae60c4880081', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae65a042008d', '2', '排序第五', '5', '402879815aae0bef015aae60c4880081', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae65fd05008e', '6', '排序第一', '5', '402879815aae0bef015aae60ffa00082', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae663c15008f', '3', '排序第二', '5', '402879815aae0bef015aae60ffa00082', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae66871c0090', '3', '排序第三', '5', '402879815aae0bef015aae60ffa00082', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae66bfb50091', '1.5', '排序第四', '5', '402879815aae0bef015aae60ffa00082', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae66fec30092', '1.5', '排序第五', '5', '402879815aae0bef015aae60ffa00082', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6769f00093', '4', '排序第一', '5', '402879815aae0bef015aae6163530083', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae67ad890094', '2', '排序第二', '5', '402879815aae0bef015aae6163530083', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae67efe40095', '2', '排序第三', '5', '402879815aae0bef015aae6163530083', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6830820096', '1', '排序第四', '5', '402879815aae0bef015aae6163530083', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6879e80097', '1', '排序第五', '5', '402879815aae0bef015aae6163530083', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae68b7820098', '0', '一等奖', '4', '402879815aae0bef015aae5d6293007b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae68fe970099', '0', '二等奖', '4', '402879815aae0bef015aae5d6293007b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae692d3a009a', '0', '三等奖', '4', '402879815aae0bef015aae5d6293007b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae698871009b', '0', '参与但未获奖', '4', '402879815aae0bef015aae5d6293007b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae69d960009c', '6', '排序第一', '5', '402879815aae0bef015aae68b7820098', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6a4d5f009d', '3', '排序第二', '5', '402879815aae0bef015aae68b7820098', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6a9dc0009e', '3', '排序第三', '5', '402879815aae0bef015aae68b7820098', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6adef0009f', '1.5', '排序第四', '5', '402879815aae0bef015aae68b7820098', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6b1f6600a0', '1.5', '排序第五', '5', '402879815aae0bef015aae68b7820098', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6b8f3500a1', '5', '排序第一', '5', '402879815aae0bef015aae68fe970099', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6bd2bb00a2', '2.5', '排序第二', '5', '402879815aae0bef015aae68fe970099', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6c0ffe00a3', '2.5', '排序第三', '5', '402879815aae0bef015aae68fe970099', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6c5b4b00a4', '1.5', '排序第四', '5', '402879815aae0bef015aae68fe970099', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6c9d2500a5', '1.5', '排序第五', '5', '402879815aae0bef015aae68fe970099', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6cf29500a6', '4', '排序第一', '5', '402879815aae0bef015aae692d3a009a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6d3afa00a7', '2', '排序第二', '5', '402879815aae0bef015aae692d3a009a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6d77d600a8', '2', '排序第三', '5', '402879815aae0bef015aae692d3a009a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6da92600a9', '1', '排序第四', '5', '402879815aae0bef015aae692d3a009a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6dec5700aa', '1', '排序第五', '5', '402879815aae0bef015aae692d3a009a', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6e3ffe00ab', '2', '排序第一', '5', '402879815aae0bef015aae698871009b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6e84fb00ac', '1', '排序第二', '5', '402879815aae0bef015aae698871009b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6ebf1300ad', '1', '排序第三', '5', '402879815aae0bef015aae698871009b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6ef6a000ae', '0.5', '排序第四', '5', '402879815aae0bef015aae698871009b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6f3a6f00af', '0.5', '排序第五', '5', '402879815aae0bef015aae698871009b', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6f7bf600b0', '0', '一等奖', '4', '402879815aae0bef015aae5d8f24007c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6fb33d00b1', '0', '二等奖', '4', '402879815aae0bef015aae5d8f24007c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae6ff68900b2', '0', '三等奖', '4', '402879815aae0bef015aae5d8f24007c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae70415200b3', '0', '参与但未获奖', '4', '402879815aae0bef015aae5d8f24007c', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae70999e00b4', '4', '排序第一', '5', '402879815aae0bef015aae6f7bf600b0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae70de7700b5', '2', '排序第二', '5', '402879815aae0bef015aae6f7bf600b0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7122ce00b6', '2', '排序第三', '5', '402879815aae0bef015aae6f7bf600b0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae715bed00b7', '1', '排序第四', '5', '402879815aae0bef015aae6f7bf600b0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae718f4400b8', '1', '排序第五', '5', '402879815aae0bef015aae6f7bf600b0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae71df3200b9', '3', '排序第一', '5', '402879815aae0bef015aae6fb33d00b1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae723ba900ba', '1.5', '排序第二', '5', '402879815aae0bef015aae6fb33d00b1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae72846f00bb', '1.5', '排序第三', '5', '402879815aae0bef015aae6fb33d00b1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae72c6f200bc', '0.5', '排序第四', '5', '402879815aae0bef015aae6fb33d00b1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae730ec500bd', '0.5', '排序第五', '5', '402879815aae0bef015aae6fb33d00b1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae73680200be', '2', '排序第一', '5', '402879815aae0bef015aae6ff68900b2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae73ad0d00bf', '1', '排序第二', '5', '402879815aae0bef015aae6ff68900b2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae73f05e00c0', '1', '排序第三', '5', '402879815aae0bef015aae6ff68900b2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7432bb00c1', '0.5', '排序第四', '5', '402879815aae0bef015aae6ff68900b2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae746b0600c2', '0.5', '排序第五', '5', '402879815aae0bef015aae6ff68900b2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae74ba2900c3', '1', '排序第一', '5', '402879815aae0bef015aae70415200b3', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae74faee00c4', '0.5', '排序第二', '5', '402879815aae0bef015aae70415200b3', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae753b1a00c5', '0.5', '排序第三', '5', '402879815aae0bef015aae70415200b3', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7653c700c6', '0', '一等奖', '4', '402879815aae0bef015aae5edaff007d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae76842c00c7', '0', '二等奖', '4', '402879815aae0bef015aae5edaff007d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae76b4f200c8', '0', '三等奖', '4', '402879815aae0bef015aae5edaff007d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae76f98500c9', '0', '参与但未获奖', '4', '402879815aae0bef015aae5edaff007d', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae775a9000ca', '6', '排序第一', '5', '402879815aae0bef015aae7653c700c6', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae77a31300cb', '3', '排序第二', '5', '402879815aae0bef015aae7653c700c6', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae77df3c00cc', '3', '排序第三', '5', '402879815aae0bef015aae7653c700c6', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7829f500cd', '1.5', '排序第四', '5', '402879815aae0bef015aae7653c700c6', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae786e4500ce', '1.5', '排序第五', '5', '402879815aae0bef015aae7653c700c6', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae78c46c00cf', '5', '排序第一', '5', '402879815aae0bef015aae76842c00c7', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae79047200d0', '2.5', '排序第二', '5', '402879815aae0bef015aae76842c00c7', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae794aa500d1', '2.5', '排序第三', '5', '402879815aae0bef015aae76842c00c7', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae79874300d2', '1.5', '排序第四', '5', '402879815aae0bef015aae76842c00c7', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae79c87200d3', '1.5', '排序第五', '5', '402879815aae0bef015aae76842c00c7', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7a3eff00d4', '4', '排序第一', '5', '402879815aae0bef015aae76b4f200c8', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7a899100d5', '2', '排序第二', '5', '402879815aae0bef015aae76b4f200c8', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7acf3b00d6', '2', '排序第三', '5', '402879815aae0bef015aae76b4f200c8', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7b08b400d7', '1', '排序第四', '5', '402879815aae0bef015aae76b4f200c8', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7b445f00d8', '1', '排序第五', '5', '402879815aae0bef015aae76b4f200c8', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7b8cd300d9', '2', '排序第一', '5', '402879815aae0bef015aae76f98500c9', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7bf42600da', '1', '排序第二', '5', '402879815aae0bef015aae76f98500c9', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7c2c4d00db', '1', '排序第三', '5', '402879815aae0bef015aae76f98500c9', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7c786100dc', '0.5', '排序第四', '5', '402879815aae0bef015aae76f98500c9', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7cbb7600dd', '0.5', '排序第五', '5', '402879815aae0bef015aae76f98500c9', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7d02f400de', '0', '一等奖', '4', '402879815aae0bef015aae5f0a26007e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7d401900df', '0', '二等奖', '4', '402879815aae0bef015aae5f0a26007e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7d747100e0', '0', '三等奖', '4', '402879815aae0bef015aae5f0a26007e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7db42400e1', '0', '参与但未获奖', '4', '402879815aae0bef015aae5f0a26007e', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7dfc6400e2', '0', '一等奖', '4', '402879815aae0bef015aae5f2f3d007f', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7e31c100e3', '0', '二等奖', '4', '402879815aae0bef015aae5f2f3d007f', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7e6d7f00e4', '0', '三等奖', '4', '402879815aae0bef015aae5f2f3d007f', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7eb7f600e5', '0', '参与但未获奖', '4', '402879815aae0bef015aae5f2f3d007f', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7f29e700e6', '4', '排序第一', '5', '402879815aae0bef015aae7d02f400de', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7f812c00e7', '2', '排序第二', '5', '402879815aae0bef015aae7d02f400de', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae7fbd9100e8', '2', '排序第三', '5', '402879815aae0bef015aae7d02f400de', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae8003b400e9', '1', '排序第四', '5', '402879815aae0bef015aae7d02f400de', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae80448600ea', '1', '排序第五', '5', '402879815aae0bef015aae7d02f400de', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae81295b00eb', '3', '排序第一', '5', '402879815aae0bef015aae7d401900df', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae8174a300ec', '1.5', '排序第二', '5', '402879815aae0bef015aae7d401900df', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae81def700ed', '1.5', '排序第三', '5', '402879815aae0bef015aae7d401900df', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae822b6100ee', '0.5', '排序第四', '5', '402879815aae0bef015aae7d401900df', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae82673800ef', '0.5', '排序第五', '5', '402879815aae0bef015aae7d401900df', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae82c71100f0', '2', '排序第一', '5', '402879815aae0bef015aae7d747100e0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae8303fa00f1', '1', '排序第二', '5', '402879815aae0bef015aae7d747100e0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae835af000f2', '1', '排序第三', '5', '402879815aae0bef015aae7d747100e0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae83e2fc00f3', '0.5', '排序第四', '5', '402879815aae0bef015aae7d747100e0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae84296200f4', '0.5', '排序第五', '5', '402879815aae0bef015aae7d747100e0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae847d6600f5', '1', '排序第一', '5', '402879815aae0bef015aae7db42400e1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae84c7be00f6', '0.5', '排序第二', '5', '402879815aae0bef015aae7db42400e1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae850cb700f7', '0.5', '排序第三', '5', '402879815aae0bef015aae7db42400e1', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae8562e600f8', '2', '排序第一', '5', '402879815aae0bef015aae7dfc6400e2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae85997b00f9', '1', '排序第二', '5', '402879815aae0bef015aae7dfc6400e2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae85d82400fa', '1', '排序第三', '5', '402879815aae0bef015aae7dfc6400e2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae862c1e00fb', '0.5', '排序第四', '5', '402879815aae0bef015aae7dfc6400e2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae86636500fc', '0.5', '排序第五', '5', '402879815aae0bef015aae7dfc6400e2', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae86c63000fd', '1.5', '排序第一', '5', '402879815aae0bef015aae7e31c100e3', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae8708ef00fe', '0.5', '排序第二', '5', '402879815aae0bef015aae7e31c100e3', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae874c5400ff', '0.5', '排序第三', '5', '402879815aae0bef015aae7e31c100e3', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae878ed80100', '1', '排序第一', '5', '402879815aae0bef015aae7e6d7f00e4', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae87ca970101', '0.5', '排序第二', '5', '402879815aae0bef015aae7e6d7f00e4', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae8811450102', '0.5', '排序第三', '5', '402879815aae0bef015aae7e6d7f00e4', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae8854590103', '0.5', '排序第一', '5', '402879815aae0bef015aae7eb7f600e5', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae88b05a0104', '0', '技能证书类', '1', '0', '\0');
INSERT INTO `judgerule` VALUES ('402879815aae0bef015aae8912510105', '0', '技能 证书', '2', '402879815aae0bef015aae88b05a0104', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab19fa0270000', '0', '计算机类', '3', '402879815aae0bef015aae8912510105', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a004da0001', '0', '国家执业资格考试', '3', '402879815aae0bef015aae8912510105', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a04a750002', '0', '国家职业资格考试', '3', '402879815aae0bef015aae8912510105', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a11ee00003', '0', '普通话水平测试', '3', '402879815aae0bef015aae8912510105', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a18feb0004', '3', '全国计算机等级考试四级考试(非计算机专业)', '4', '402879815ab197c6015ab19fa0270000', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a202030005', '1', '全国计算机等级考试四级考试(计算机专业)', '4', '402879815ab197c6015ab19fa0270000', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a2590d0006', '2', '全国计算机等级考试三级考试(非计算机专业)', '4', '402879815ab197c6015ab19fa0270000', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a2c46e0007', '1', '全国计算机等级考试二级考试(非计算机专业)', '4', '402879815ab197c6015ab19fa0270000', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a31bba0008', '5', '获国家执业资格证书', '4', '402879815ab197c6015ab1a004da0001', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a38bf60009', '3', '获高级证书及以上', '4', '402879815ab197c6015ab1a04a750002', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a3f37b000a', '1', '获中级证书及以下', '4', '402879815ab197c6015ab1a04a750002', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a43ed7000b', '1', '二级乙等及以上', '4', '402879815ab197c6015ab1a11ee00003', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a4b234000c', '0', '创业实践和创新创业教育类', '1', '0', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a556fc000d', '0', '创业实践', '2', '402879815ab197c6015ab1a4b234000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a5b705000e', '0', '创新创业活动', '2', '402879815ab197c6015ab1a4b234000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a63311000f', '0', '创新创业教育', '2', '402879815ab197c6015ab1a4b234000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a9353b0010', '0', '创业项目资助', '2', '402879815ab197c6015ab1a4b234000c', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1a9c50a0011', '1', '创办企业并取得营业执照并入驻学校创业基地', '3', '402879815ab197c6015ab1a556fc000d', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1aa209c0012', '0.2', '参加学术报告和创新创业沙龙、讲座', '3', '402879815ab197c6015ab1a5b705000e', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1ab57380013', '1', '修读创新创业类课程并考核合格', '3', '402879815ab197c6015ab1a63311000f', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1ab9cf80014', '1', '参加创新创业实训班并获得结业证书', '3', '402879815ab197c6015ab1a63311000f', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1abf03a0015', '0', '获得省、市创业项目资助', '3', '402879815ab197c6015ab1a9353b0010', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1ae929b0016', '1', '第一负责人', '4', '402879815ab197c6015ab1abf03a0015', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1aeddb00017', '0.5', '第二负责人', '4', '402879815ab197c6015ab1abf03a0015', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1af20320018', '0.5', '第三负责人', '4', '402879815ab197c6015ab1abf03a0015', '\0');
INSERT INTO `judgerule` VALUES ('402879815ab197c6015ab1af20320019', '0.5', '第四负责人', '5', '402879815ab197c6015ab1af20320018', '\0');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major` (
  `majorId` int(11) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `majorName` varchar(255) NOT NULL COMMENT '专业名称',
  `collegeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`majorId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES ('1', '软件工程', '1');
INSERT INTO `major` VALUES ('2', '网络工程', '1');
INSERT INTO `major` VALUES ('3', '信息管理与信息系统', '2');
INSERT INTO `major` VALUES ('4', '工程管理', '2');
INSERT INTO `major` VALUES ('5', '自动化', '3');
INSERT INTO `major` VALUES ('6', '电信', '3');
INSERT INTO `major` VALUES ('7', '汽车制造', '4');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stuId` int(8) NOT NULL AUTO_INCREMENT,
  `stuNum` varchar(12) NOT NULL COMMENT '学号',
  `password` varchar(255) DEFAULT NULL COMMENT '学生密码',
  `name` varchar(255) NOT NULL COMMENT '学生姓名',
  `collegeId` int(8) NOT NULL COMMENT '学院id',
  `majorId` int(8) NOT NULL COMMENT '专业id',
  `classId` int(8) NOT NULL COMMENT '班级id',
  `graduateTime` datetime DEFAULT NULL COMMENT '毕业时间',
  `grade` varchar(255) DEFAULT NULL COMMENT '年级',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`stuId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '201405160001', '123456', '张烨', '2', '3', '3', '2018-05-03 22:47:25', '14', '15671554550');
INSERT INTO `student` VALUES ('3', '201405160002', '123456', '周洲', '2', '3', '3', '2018-05-04 23:12:09', '14', '15671554551');
INSERT INTO `student` VALUES ('4', '201405160003', '123456', '李思', '2', '4', '4', '2018-05-05 00:00:00', '14', '15671554552');
INSERT INTO `student` VALUES ('5', '201404130001', '123456', '王武', '3', '5', '5', '2018-05-05 00:00:00', '14', '15671554553');
INSERT INTO `student` VALUES ('6', '201404130002', '123456', '吴伟', '3', '5', '6', '2018-05-05 00:00:00', '14', '15671554554');
INSERT INTO `student` VALUES ('7', '201511111111', '123456', '郑和', '4', '6', '7', '2019-06-01 00:00:00', '15', '15671554555');
INSERT INTO `student` VALUES ('8', '201411111122', '123456', '高云', '4', '7', '8', '2018-05-05 00:00:00', '14', '15671554556');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `teacherId` int(8) NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `account` varchar(255) NOT NULL COMMENT '工号',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `college` varchar(255) DEFAULT NULL COMMENT '学院',
  PRIMARY KEY (`teacherId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('1', '1101', '123', '柳原', '1');
INSERT INTO `teacher` VALUES ('2', '2101', '123', '李玉英', '2');
INSERT INTO `teacher` VALUES ('3', '3101', '123', '何媛媛', '2');
INSERT INTO `teacher` VALUES ('4', '4101', '123', '张雅', '3');
INSERT INTO `teacher` VALUES ('5', '5101', '123', '李思哲', '4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `email` varchar(255) NOT NULL COMMENT '用户邮箱',
  `password` varchar(255) NOT NULL COMMENT '用户密码',
  `username` varchar(255) NOT NULL COMMENT '用户昵称',
  `role` varchar(255) NOT NULL COMMENT '用户身份',
  `status` int(1) NOT NULL COMMENT '用户状态',
  `regTime` datetime NOT NULL COMMENT '注册时间',
  `regIp` varchar(255) NOT NULL COMMENT '注册IP',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '823652992@qq.com', '123456', '田越', 'root', '0', '2017-03-28 09:40:31', '127.0.0.1');

-- ----------------------------
-- Table structure for ziliao
-- ----------------------------
DROP TABLE IF EXISTS `ziliao`;
CREATE TABLE `ziliao` (
  `id` int(8) NOT NULL AUTO_INCREMENT COMMENT '资料id',
  `catalogId` varchar(255) DEFAULT NULL COMMENT '目录',
  `content` varchar(255) DEFAULT NULL COMMENT '证明内容',
  `finishTime` varchar(20) DEFAULT NULL COMMENT '完成时间',
  `createScore` float(8,0) DEFAULT '0' COMMENT '学分',
  `stuId` int(8) DEFAULT NULL,
  `isCheck` tinyint(1) NOT NULL DEFAULT '0',
  `failReason` varchar(255) DEFAULT NULL COMMENT '不通过理由',
  `path` varchar(10000) DEFAULT NULL COMMENT '路径',
  `projectName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ziliao
-- ----------------------------
INSERT INTO `ziliao` VALUES ('16', '402879815aa88265015aa88854390004', '基于vue.js平台的系统设计', '2018-06-06', '3', '1', '0', '', '[{\"name\":\"settings.jpg\",\"url\":\"http://localhost:8080/ScoreManagement/upload/1527688476041settings.jpg\"},{\"name\":\"1.jpg\",\"url\":\"http://localhost:8080/ScoreManagement/upload/15282504618781.jpg\"}]', '期刊论文');
INSERT INTO `ziliao` VALUES ('17', '402879815aac35b6015aac3b1ce6000a', 'CET6', '2018-06-18', '2', '1', '1', '', '[{\"name\":\"space.png\",\"url\":\"http://localhost:8080/ScoreManagement/upload/1528127205370space.png\"}]', 'CET6：566');
INSERT INTO `ziliao` VALUES ('20', '402879815aa88265015aa88854390004', '软件著作权', '2018-06-05', '2', '1', '2', '格式', '[{\"name\":\"1.jpg\",\"url\":\"http://localhost:8080/ScoreManagement/upload/15281746577701.jpg\"}]', '软件著作权');
INSERT INTO `ziliao` VALUES ('21', '402879815aac35b6015aac3b1ce6000a', '高等', '2018-06-05', '2', '1', '1', '', '[{\"name\":\"timg.jpg\",\"url\":\"http://localhost:8080/ScoreManagement/upload/1528175257469timg.jpg\"}]', '故事');
INSERT INTO `ziliao` VALUES ('22', '402879815aad9baf015aada5b2f60007', '停用', '2018-06-05', '1', '1', '2', '请问', '[{\"name\":\"timg (1).jpg\",\"url\":\"http://localhost:8080/ScoreManagement/upload/1528175328400timg (1).jpg\"}]', '停用');
INSERT INTO `ziliao` VALUES ('23', '402879815aa88265015aa88854390004', '123', '2018-05-30', '2', '1', '0', '', '[{\"name\":\"1.jpg\",\"url\":\"http://localhost:8080/ScoreManagement/upload/15282505335331.jpg\"}]', '大学生123');
INSERT INTO `ziliao` VALUES ('24', '402879815aa88265015aa88854390004', '啊', '2018-06-06', '3', '1', '0', '1', '1', '你好');
