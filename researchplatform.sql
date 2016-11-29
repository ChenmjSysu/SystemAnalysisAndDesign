/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50096
Source Host           : localhost:3306
Source Database       : researchplatform

Target Server Type    : MYSQL
Target Server Version : 50096
File Encoding         : 65001

Date: 2016-11-29 01:42:15
*/

CREATE DATABASE IF NOT EXISTS researchplatform default character set utf8; 
use researchplatform;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can view group', '2', 'view_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can view permission', '1', 'view_permission');
INSERT INTO `auth_permission` VALUES ('12', 'Can view user', '3', 'view_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add site', '6', 'add_site');
INSERT INTO `auth_permission` VALUES ('22', 'Can change site', '6', 'change_site');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete site', '6', 'delete_site');
INSERT INTO `auth_permission` VALUES ('24', 'Can view site', '6', 'view_site');
INSERT INTO `auth_permission` VALUES ('25', 'Can add user type', '7', 'add_usertype');
INSERT INTO `auth_permission` VALUES ('26', 'Can change user type', '7', 'change_usertype');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete user type', '7', 'delete_usertype');
INSERT INTO `auth_permission` VALUES ('28', 'Can add permission', '8', 'add_permission');
INSERT INTO `auth_permission` VALUES ('29', 'Can change permission', '8', 'change_permission');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete permission', '8', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('31', 'Can add member', '9', 'add_member');
INSERT INTO `auth_permission` VALUES ('32', 'Can change member', '9', 'change_member');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete member', '9', 'delete_member');
INSERT INTO `auth_permission` VALUES ('34', 'Can add team', '10', 'add_team');
INSERT INTO `auth_permission` VALUES ('35', 'Can change team', '10', 'change_team');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete team', '10', 'delete_team');
INSERT INTO `auth_permission` VALUES ('37', 'Can add article', '11', 'add_article');
INSERT INTO `auth_permission` VALUES ('38', 'Can change article', '11', 'change_article');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete article', '11', 'delete_article');
INSERT INTO `auth_permission` VALUES ('40', 'Can add biological category', '12', 'add_biologicalcategory');
INSERT INTO `auth_permission` VALUES ('41', 'Can change biological category', '12', 'change_biologicalcategory');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete biological category', '12', 'delete_biologicalcategory');
INSERT INTO `auth_permission` VALUES ('43', 'Can add biological name', '13', 'add_biologicalname');
INSERT INTO `auth_permission` VALUES ('44', 'Can change biological name', '13', 'change_biologicalname');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete biological name', '13', 'delete_biologicalname');
INSERT INTO `auth_permission` VALUES ('46', 'Can add project', '14', 'add_project');
INSERT INTO `auth_permission` VALUES ('47', 'Can change project', '14', 'change_project');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete project', '14', 'delete_project');
INSERT INTO `auth_permission` VALUES ('49', 'Can add project progress', '15', 'add_projectprogress');
INSERT INTO `auth_permission` VALUES ('50', 'Can change project progress', '15', 'change_projectprogress');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete project progress', '15', 'delete_projectprogress');
INSERT INTO `auth_permission` VALUES ('52', 'Can add academic conference', '16', 'add_academicconference');
INSERT INTO `auth_permission` VALUES ('53', 'Can change academic conference', '16', 'change_academicconference');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete academic conference', '16', 'delete_academicconference');
INSERT INTO `auth_permission` VALUES ('55', 'Can add announcement', '17', 'add_announcement');
INSERT INTO `auth_permission` VALUES ('56', 'Can change announcement', '17', 'change_announcement');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete announcement', '17', 'delete_announcement');
INSERT INTO `auth_permission` VALUES ('58', 'Can view academic conference', '16', 'view_academicconference');
INSERT INTO `auth_permission` VALUES ('59', 'Can view announcement', '17', 'view_announcement');
INSERT INTO `auth_permission` VALUES ('60', 'Can view article', '11', 'view_article');
INSERT INTO `auth_permission` VALUES ('61', 'Can view biological category', '12', 'view_biologicalcategory');
INSERT INTO `auth_permission` VALUES ('62', 'Can view biological name', '13', 'view_biologicalname');
INSERT INTO `auth_permission` VALUES ('63', 'Can view member', '9', 'view_member');
INSERT INTO `auth_permission` VALUES ('64', 'Can view permission', '8', 'view_permission');
INSERT INTO `auth_permission` VALUES ('65', 'Can view project', '14', 'view_project');
INSERT INTO `auth_permission` VALUES ('66', 'Can view project progress', '15', 'view_projectprogress');
INSERT INTO `auth_permission` VALUES ('67', 'Can view team', '10', 'view_team');
INSERT INTO `auth_permission` VALUES ('68', 'Can view user type', '7', 'view_usertype');
INSERT INTO `auth_permission` VALUES ('69', 'Can add Bookmark', '18', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('70', 'Can change Bookmark', '18', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete Bookmark', '18', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('72', 'Can add User Setting', '19', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('73', 'Can change User Setting', '19', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('74', 'Can delete User Setting', '19', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('75', 'Can add User Widget', '20', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('76', 'Can change User Widget', '20', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('77', 'Can delete User Widget', '20', 'delete_userwidget');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL auto_increment,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$10000$r6SQ1UvhM7h1$kwo/ZlWSAf7+BclqIdrTAN4FFaVcWgAurXcrCNisf3o=', '2016-11-27 14:30:43', '1', 'fuhuamosi', '', '', '', '1', '1', '2016-11-27 14:29:33');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$10000$vPKNgwin0rRx$lGnJp1lffTJ3n/XaBDTiv2WkyzuEbzkAOf/Uq4Eb0oE=', '2016-11-28 04:18:55', '0', 'fuyanjiuyuan', '', '', '', '0', '1', '2016-11-28 04:18:55');
INSERT INTO `auth_user` VALUES ('3', 'pbkdf2_sha256$10000$FdnPjyz0LOqt$OgF6EtGFYGsgonOhfUH+73J92wa3V3aD+jdMBoLI7AM=', '2016-11-28 04:20:25', '0', 'chenyanjiuyuan', '', '', '', '0', '1', '2016-11-28 04:20:25');
INSERT INTO `auth_user` VALUES ('4', 'pbkdf2_sha256$10000$TOePgEXBwAzp$mI1MHs56z1J3JSwyraGHuo7cb4o1Vd5xA+jSV9XnDoQ=', '2016-11-28 04:24:07', '0', 'liyanjiuyuan', '', '', '', '0', '1', '2016-11-28 04:24:07');
INSERT INTO `auth_user` VALUES ('5', 'pbkdf2_sha256$10000$5N0Tt2zJp6CM$XG8s3t5oygJLmk5Ji1BtSRcs2DEv3KPn9QJdbBepq6M=', '2016-11-28 04:25:58', '0', 'zengyanjiuyuan', '', '', '', '0', '1', '2016-11-28 04:25:58');
INSERT INTO `auth_user` VALUES ('6', 'pbkdf2_sha256$10000$0UFqCCRM7dlb$rSRrvQjcF8RHqbqOJGBlCVFPZhJR7IzgPzivihX/W4Y=', '2016-11-28 06:11:35', '0', 'yuanyanjiuyuan', '', '', '', '0', '1', '2016-11-28 06:11:35');
INSERT INTO `auth_user` VALUES ('7', 'pbkdf2_sha256$10000$UR9NubGGtrOY$LhT7elHW2E0MlFB3mIdT3gnOXbUCjEjsx2qWAgU+pFo=', '2016-11-28 06:14:06', '0', 'yangfuyanjiuyuan', '', '', '', '0', '1', '2016-11-28 06:14:06');
INSERT INTO `auth_user` VALUES ('8', 'pbkdf2_sha256$10000$qslsjdnuCLwh$XQF/2PKTP8g2p4zzrEH0hlFtrjac3GTOUl/sDBFUEXc=', '2016-11-28 06:15:40', '0', 'zhangyanjiuyuan', '', '', '', '0', '1', '2016-11-28 06:15:40');
INSERT INTO `auth_user` VALUES ('9', 'pbkdf2_sha256$10000$YQPAc8ci9VA5$U2pdph0s66ajg8bKEmGvu9D5gKk6prxKHLgyKivAkUM=', '2016-11-28 06:19:37', '0', 'huyanjiuyuan', '', '', '', '0', '1', '2016-11-28 06:19:37');
INSERT INTO `auth_user` VALUES ('10', 'pbkdf2_sha256$10000$LtwOAKeXmGQv$qqzotXjT6Mw4xzwqJ7UQclpULwYNvEhVM8giT7zc1Hk=', '2016-11-28 06:20:31', '0', 'huangfuyanjiuyuan', '', '', '', '0', '1', '2016-11-28 06:20:31');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'site', 'sites', 'site');
INSERT INTO `django_content_type` VALUES ('7', 'user type', 'ResearchPlatform', 'usertype');
INSERT INTO `django_content_type` VALUES ('8', 'permission', 'ResearchPlatform', 'permission');
INSERT INTO `django_content_type` VALUES ('9', 'member', 'ResearchPlatform', 'member');
INSERT INTO `django_content_type` VALUES ('10', 'team', 'ResearchPlatform', 'team');
INSERT INTO `django_content_type` VALUES ('11', 'article', 'ResearchPlatform', 'article');
INSERT INTO `django_content_type` VALUES ('12', 'biological category', 'ResearchPlatform', 'biologicalcategory');
INSERT INTO `django_content_type` VALUES ('13', 'biological name', 'ResearchPlatform', 'biologicalname');
INSERT INTO `django_content_type` VALUES ('14', 'project', 'ResearchPlatform', 'project');
INSERT INTO `django_content_type` VALUES ('15', 'project progress', 'ResearchPlatform', 'projectprogress');
INSERT INTO `django_content_type` VALUES ('16', 'academic conference', 'ResearchPlatform', 'academicconference');
INSERT INTO `django_content_type` VALUES ('17', 'announcement', 'ResearchPlatform', 'announcement');
INSERT INTO `django_content_type` VALUES ('18', 'Bookmark', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('19', 'User Setting', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('20', 'User Widget', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY  (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('zgmbpvmssnpaubz0hs0lboh0l9a8criv', 'YjgzMGZkZDlmODAwZjllNDlhMzM0NzU4MGQzMTVkMDc2OTFjZDM4Njp7IkxJU1RfUVVFUlkiOltbImF1dGgiLCJwZXJtaXNzaW9uIl0sIiJdLCJfYXV0aF91c2VyX2lkIjoxLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCJ9', '2016-12-12 17:06:30');

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL auto_increment,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES ('1', 'example.com', 'example.com');

-- ----------------------------
-- Table structure for researchplatform_academicconference
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_academicconference`;
CREATE TABLE `researchplatform_academicconference` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `detail` longtext NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_academicconference
-- ----------------------------
INSERT INTO `researchplatform_academicconference` VALUES ('1', '第六届中国二次离子质谱会议', '第六届中国二次离子质谱会议将于2016年10月8-11日在中国科学院大连化学物理研究所（地址详见附件1）举行。会议将为我国二次离子质谱界的学术 研讨、技术交流与合作提供平台，推动二次离子质谱的发展，促进二次离子质谱技术在各领域的应用。会议热诚邀请中国大陆、港澳台地区以及海外从事二次离子质 谱相关工作的同仁相聚美丽海滨城市大连，展示最新的研究成果，共同推动我国二次离子质谱的发展。会议热诚欢迎国内外相关厂商参展。\r\n\r\n　　一、发起单位和承办、协办单位\r\n\r\n　　1．发起单位：中国质谱学会\r\n\r\n　　2．承办单位：中国科学院大连化学物理研究所中国科学院分离分析重点实验室\r\n\r\n　 　3．协办单位：清华大学分析中心、国家科技基础条件平台北京离子探针中心、中国科学院金属研究所沈阳材料科学国家（联合）实验室、中国科学院半导体研究 所半导体照明联合创新国家重点实验室、中国矿业大学煤炭资源与安全开采国家重点实验室、中国科学院广州地球化学研究所同位素地球化学国家重点实验室、中国 科学院活体分析化学重点实验室、中国科学院地质与地球物理研究所岩石圈演化国家重点实验室\r\n\r\n　　二、会议组织机构\r\n\r\n　　1. 大会主席\r\n\r\n　　李海洋、凌永健\r\n\r\n　　2．学术委员会\r\n\r\n　　主任：凌永健、汪福意\r\n\r\n　　委员：查良镇、刘敦一、周新华、李金英、翁禄涛、麦富德、赵永刚、陈焕文、梁汉东、\r\n\r\n　　李海洋、曹永明、马农农、韦刚健、朱梓华、李献华\r\n\r\n　　3．组织委员会\r\n\r\n　　主任：李海洋\r\n\r\n　　委员：杨蔚、张玉海、李展平、赵丽霞、李秋立、张磊、夏小平、肖国平、文彦杰、杨莉、\r\n\r\n　　侯可勇，王卫国\r\n\r\n　　4．会务组\r\n\r\n　　组长：花磊、王爱博\r\n\r\n　　成员：陈平、谢园园、陈创、黄卫、李金旭、鞠帮玉\r\n\r\n　　联系人：王爱博、谢园园\r\n\r\n　　电话：0411-84379510；0411-84379517\r\n\r\n　　传真：0411-84379517\r\n\r\n　　E-mail：sims_china@163.com\r\n\r\n　　三、研讨专题征集\r\n\r\n　　1.二次离子质谱仪器和理论；\r\n\r\n　　2.地球科学中的元素与同位素分析；\r\n\r\n　　3.核科学中的微区分析和同位素分析\r\n\r\n　　4.材料的微区分析、表面分析和3D分析\r\n\r\n　　5.半导体/微电子科学中的表面分析；\r\n\r\n　　6.生命科学和临床医学中质谱原位分析、质谱成像和单细胞质谱分析；\r\n\r\n　　7.环境科学中的微区和原位分析\r\n\r\n　　8.微纳尺度样品的质谱分析\r\n\r\n　　9.二次离子质谱的样品前处理方法和复杂样品分析\r\n\r\n　　10.原子探针/质谱原位分析新技术\r\n\r\n　　11.新型离子源（纳米/团簇）和后电离技术；\r\n\r\n　　12.质谱成像数据分析、数据处理、数据融合和识别方法\r\n\r\n　　注：论文摘要截止日期：2016年9月15日\r\n\r\n　　四、会议组织方式\r\n\r\n　　会议由会前课程短训、大会特邀报告、专题研讨和离子探针实验室考察参观等4部分内容组成。时间安排如下：\r\n\r\n　　10月8日：会前课程短训报到\r\n\r\n　　10月9日：会前课程短训 & 会议注册报到\r\n\r\n　　10月10日上午：开幕式和大会报告\r\n\r\n　　10月10日上午-11日上午：专题研讨、展板交流\r\n\r\n　　10月11日下午：大连化物所实验室考察与交流\r\n\r\n　　1.会前课程短训\r\n\r\n　　学术委员会和组织委员会邀请安排二次离子质谱领域的专家教授，为研究生和青年科研人员举行1天的二次离子质谱基础、仪器和分析应用的会前课程短训（中文授课）。\r\n\r\n　　注：短训课程免费，会议为参加短训课程的成员提供免费午餐。\r\n\r\n　　2. 会议报告\r\n\r\n　　包括大会特邀报告和专题研讨。会议将邀请国内外知名学者做大会特邀报告。专题研讨包括口头报告和展板交流两部分，由组织委员会负责组织和安排。\r\n\r\n　　已确认特邀报告人：\r\n\r\n　　Prof. Jiro Matsuo，Quantum Science and Engineering Center, Kyoto University, Japan\r\n\r\n　　Prof. David G. Castner ,Director, Departments of Bioengineering & Chemical Engineering,University of Washington,USA\r\n\r\n　　Prof. Ian Gilmore FInstP, NPL Head of Science National Physical Laboratory, UK\r\n\r\n　　 Prof. Zihua Zhu, Environmental Molecular Sciences Laboratory, Pacific Northwest National Laboratory,USA\r\n\r\n　　Prof. Xiaoying Yu, Atmospheric Sciences and Global Climate Change Division, Pacific Northwest National Laboratory,USA\r\n\r\n　　3. 会后实验室考察参观\r\n\r\n　　组织委员会拟安排与会代表参观中国科学院大连化学物理研究所清洁能源国家实验室分析平台、催化基础国家重点实验室、分子反应动力学国家重点实验室、大连化学物理研究所中国科学院分离分析重点实验室和化物所科技园等。\r\n\r\n　　五、会议报名与注册\r\n\r\n　　会议注册费金额：1200元/人，学生700元/人（2016年9月15日前）\r\n\r\n　　　　　　　　　　 1400元/人，学生900元/人（2016年9月15日后）\r\n\r\n　　注册费缴纳方式：汇款或会议报到时缴纳现金（采用汇款方式可在报到领取发票，采用现金付款方式将在会议结束后，两周内统一邮寄发票）\r\n\r\n　　汇款账户：单位名称--中国科学院大连化学物理研究所，账号--3400200309014415739，开户行--中国工商银行大连市分行青泥洼桥支行，汇款后请将汇款底单以及开具发票信息发送至会议邮箱sims_china@163.com，汇款时请备注：二次离子质谱，102组。\r\n\r\n　　可开具会议费发票，开具发票单位：中国科学院大连化学物理研究所\r\n\r\n　　六、会议住宿安排\r\n\r\n　　会务组可帮忙预定住宿酒店，合作酒店：大连国航酒店，协议价格：318元/间；\r\n\r\n　　酒店地址及电话：沙河口区中山路578号国航大厦，0411-84801188，步行至化物所约10分钟。\r\n\r\n　　请拟参加会议人员填写“第六届中国二次离子质谱学会议回执”（附件2），以及提交论文摘要（附件3），并用电子邮件方式提交给会务组 (sims_china@163.com)。', '2016');
INSERT INTO `researchplatform_academicconference` VALUES ('2', '第34届中国质谱学会学术年会暨全国会员代表大会', '由中国质谱学会主办，中国科学院青海盐湖研究所和安特百科（北京）技术发展有限公司联合承办的“第34届中国质谱学会学术年会暨全国会员代表大会将于2016年9月9-12日在青海省西宁市举办。组委会期待大家在2016年9月相聚。\r\n\r\n　　一、大会组织机构\r\n\r\n　　大会主席：李金英理事长\r\n\r\n　　副主席：张新荣 再帕尔•阿不力孜\r\n\r\n　　学术委员会主任： 柴之芳院士\r\n\r\n　　副主任：陈洪渊院士 张玉奎院士 江桂斌院士 樊明武院士 王海舟院士 王方定院士 郑兰荪院士 刘淑莹 张新荣 再帕尔•阿不力孜 廖宝琦\r\n\r\n　 　委 员（按姓氏字母排列）：常志远 陈焕文 陈笑艳 崔建勇 丁传凡 邓玉林 冯 芳 冯金生 高友鹤 郭冬发 郭寅龙 顾景凯 杭 纬 侯贤灯 江 骥 蒋少涌 李 冰 李红梅 李怀坤 李金英 李智立 林金明 梁汉东 刘虎威 刘丽萍 刘志强 欧阳津 潘远江 钱小红 汪福意 王京宇 王 融 谢孟峡 许国旺 杨芃原 再帕尔•阿不力孜 张金兰 张新荣 张养军 张玉海 周 涛 周 振\r\n\r\n　　组织委员会主任：谢孟峡\r\n\r\n　　副主任：吴志坚 韩凤清 马云麒 肖国平 张瑞萍 苏玉兰 石 磊\r\n\r\n　 　委 员（按姓氏字母排列）：卞利萍 冯先进 郭春华 郭继芬 郭敬华 国新华 郝樊华 黄冬生 姜 山 李继东 李力力 李延河 廖俊生 林 峰 刘海灵 刘 媛 陆豪杰 逯 海 栾天罡 罗盛旭 马安德 马晓东 那 娜 潘 洋 漆 亮 宋 彪 孙瑞祥 苏玉兰 王宝瑞 王全会 王香凤 王 勇 吴惠勤 武朝辉 肖应凯 熊少祥 徐友宣 闫存玉 杨福全 杨洪梅 余 兴 翟利华 张东翔 张丽华 张瑞萍 张 颖 张志忠 周 红 周 江 周抗寒 朱祥坤 邹会军 邹盛强\r\n\r\n　　二、会议时间和地点及日程安排\r\n\r\n　　会议时间：2016年9月9日下午―12日\r\n\r\n　　会议地点：青海省西宁市新华联索菲特酒店\r\n\r\n　　会议日程：\r\n\r\n　　2016年9月9日 全天注册报到\r\n\r\n　　9月10日 开幕式 大会报告\r\n\r\n　　9月11日 分组邀请报告 口头报告\r\n\r\n　　9月12日上午大会报告 闭幕式 下午离会\r\n\r\n　　三、学术交流\r\n\r\n　　本次会议的学术交流将采用邀请报告和口头报告以及墙报展示相结合的方式，邀请报告的专家学者名单如下（排名不分先后，按确认时间顺序列出），具体的报告安排在会议的第三轮通知中告知。\r\n\r\n　　3.1邀请报告(光谱网持续更新中)：\r\n\r\n    中科院高能物理所  柴之芳 院士  南京大学  陈洪渊院士\r\n    中科院大连化物所 张玉奎院士 钢铁研究总院  王海舟 院士\r\n    国家自然科学基金委 庄乾坤 教授  清华大学  张新荣 教授\r\n    中央民族大学  再帕尔 教授  中国计量科学研究院 方 向 研究员\r\n    清华大学         林金明 教授  复旦大学  丁传凡 教授\r\n    北京大学          刘虎威 教授  清华大学  欧阳正 教授\r\n    厦门大学          杭 纬 教授  复旦大学  杨芃原 教授\r\n             \r\n　　请邀请报告专家在光谱网上会议稿件提交系统中提交报告摘要，提交办法见会议第一轮通知：第34届中国质谱学会学术年会暨全国会员代表大会第一轮通知\r\n\r\n　　以及在会议注册系统中提交报告题目，住宿预定、往返航班等信息。\r\n\r\n　　若有申请邀请报告的学者，可提供个人简历及报告的ppt文件，会议学术委员会将根据情况发出邀请，学术委员会的联系方式：刘海灵 liuhailing@bnu.edu.cn\r\n\r\n　　3.2口头报告\r\n\r\n　　会议也将开放一定数量的口头报告，拟做口头报告的代表，请在2016年8月10日前在会议注册系统中提交口头报告报告题目（并在稿件提交系统中提交报告摘要），组委会将尽力安排，请大家在注册时完整填写自己的身份信息。\r\n\r\n　　3.3优秀青年报告奖\r\n\r\n　　为了鼓励博士硕士研究生积极开展学术交流，组委会将对做口头报告的研究生设立优秀青年报告奖（报告时间10分钟左右），组织专家对口头报告进行评选，请研究生在会议注册系统中填写自己的身份信息和口头报告题目，并在稿件提交系统中提交报告摘要。\r\n\r\n　　3.4优秀墙报奖\r\n\r\n　　墙报展示作为本次会议的一种主要形式，会议将组织专家对墙报论文评选优秀墙报奖，请拟作墙报展示的作者在稿件提交系统中提交报告摘要，并在会议注册系统提交墙报的题目和编号（稿件提交时系统自动形成的编号）。\r\n\r\n　　墙报要求制作规范，内容体现研究工作的创新点。在准备墙报时注意以下几个方面：\r\n\r\n　　 1. 墙报尺寸：高110公分×宽80公分。\r\n\r\n　　 2. 墙报内容以图文为主，层次分明，主要体现研究工作的创新性，主要结果和结论。墙报右上侧写上论文编号。\r\n\r\n　　组委会将给以上两项获奖作者颁发优秀论文证书和奖金。\r\n\r\n　　四、会议注册：\r\n\r\n　　4.1.会议注册费：\r\n\r\n　　8月30日前缴费：参会代表1000元/人（研究生凭学生证 800元/人）\r\n\r\n　　8月31日后及会议现场缴费：参会代表1200元/人（研究生凭学生证 1000元/人）。\r\n\r\n　　会议注册费发票将在会议注册报到时领取，如需提前报销，可告知。现场缴费，发票会在会议结束后2周内寄出。如无特殊要求，会议费统一开具增值税普通发票。\r\n\r\n　　4.2提前缴费办法如下：\r\n\r\n　　4.2.1 通过银行汇款（账户信息如下）：\r\n\r\n　　开户行：北京银行燕园支行\r\n\r\n　　户名：安特百科(北京)技术发展有限公司\r\n\r\n　　账号：0109 0327 8001 2010 2310 193\r\n\r\n　　进行银行汇款时，请备注发票抬头和会议费缴纳人员姓名；如缴纳多人会议费或需开具增值税专用发票，请详细填写附件中的开票信息，并邮件发送给联系人。\r\n\r\n　　4.2.2 通过网上支付缴费\r\n\r\n　　在线缴费链接：在线缴费入口\r\n\r\n　　登录页面，点击立即购买，注册获取用户名和密码，并登陆按提示缴费，若缴纳多人会议费，买家留言处备注缴费人员姓名（我们会与注册系统核对），提交订单付费即可。\r\n\r\n　　会议费事宜联系人：\r\n\r\n　　刘会兰 电话：18942663827邮箱：huilan_liu@antpedia.net\r\n\r\n　　4.3 住宿预定：\r\n\r\n　　组委会已经开通会议注册系统，参会代表可以在会议注册时预定房间和提交报告题目。因9月份西宁还是旅游旺季，房间非常紧张，会务组将首先保证先注册并交纳注册费代表的住宿预定。\r\n\r\n　　参会代表建议在新华联索菲特酒店住宿，组委会在酒店周边还联系了两家酒店供学生住宿，其他参会代表不要预定。6-9月份西宁房价有较大幅度上浮，下面链接给出了中央和国家机关国内差旅住宿费标准，供大家参考，预定房间时请咨询自己单位的财务部门本单位的住宿标准）：中央和国家机关国内差旅住宿费标准\r\n\r\n　　4.4会议注册系统：\r\n\r\n　　 请登陆光谱网注册您的参会信息，包括个人信息（希望大家留下联系方式，以便会务组与大家联络，学生代表注明身份）、报告题目、墙报题目、住房预定以及往返航班信息等。\r\n\r\n　　注册办法：\r\n\r\n　　A.在光谱网，注册（已经注册的用户，请修正和完善您的个人信息），获取用户名和密码。\r\n\r\n　　B.点击光谱网会议会展栏目，选择《第34届中国质谱学会学术年会暨全国会员代表大会》。\r\n\r\n　　C. 点击会议基本情况下的会议快捷通道中的参会申请。\r\n\r\n　　D 输入用户名和密码登陆，在页面下选择参会信息。\r\n\r\n　　E. 按照提示填写参会信息。\r\n\r\n　　F.点击保存后，您会在您的邮箱内收到您的注册信息，请仔细核对，在9月1日前您可随时修改您的信息。\r\n\r\n　　五、会务组分工及联系方式：\r\n\r\n　　会务组负责人：\r\n\r\n　　马云麒，电话：0971-6301684，13897464883 E-mail：yqma@isl.ac.cn\r\n\r\n　　厂商联络：\r\n\r\n　　刘媛电话：010-58807981，18911558583 E-mail:liuy@bnu.edu.cn\r\n\r\n　　会议摘要征文及论文集：\r\n\r\n　　肖国平，电话：010-88305698，13811597264 E-mail ：xiaoguoping@vip.163.com\r\n\r\n　　彭章旷电话: 13897410217 E-mail: 1962976398@qq.com\r\n\r\n　　会议注册：\r\n\r\n　　郭敬华，电话： 13811562941 E-mail：gjh@bnu.edu.cn\r\n\r\n　　王香凤，电话： 13520034335 E-mail：xiangfeng@bnu.edu.cn\r\n\r\n　　报告安排事宜：\r\n\r\n　　刘海灵，电话： 15010928428 E-mail ：liuhailing@bnu.edu.cn\r\n\r\n　　主办单位：中国质谱学会（中国物理学会质谱分会）\r\n\r\n　　承办单位：中国科学院青海盐湖研究所\r\n\r\n　　安特百科（北京）技术发展有限公司', '2016');
INSERT INTO `researchplatform_academicconference` VALUES ('3', '第三届空间光学仪器与应用国际研讨会征文通知', ' 为提升空间光学领域的国际交流与合作，提升我国技术创新能力，提高空间光学的研究水平和工程研制能力，共同促进空间光学技术国际合作，中荷空间光学仪器联合实验室（Sino-Holland Joint Laboratory of Space Optical Instrument）于2014年正式揭牌成立，搭建起了中荷两国空间光学领域的合作平台。借助此平台，联合实验室已在中荷两国召开两届学术研讨会，第三届会议将针对业内关心的问题展开研讨，为空间光学遥感专业技术发展提供思路及途径，交流近年来中欧遥感领域在理论、技术与应用等方面的最新进展，共享经验和成果。\r\n\r\n拟邀大会报告人及报告方向\r\n\r\n    Jean-Loup Bezy (ESA) – Sentinel-3: First In-Flight Results\r\n\r\n    Paul Urbach (TU Delft) – Aberration retrieval for imaging systems with unknown objects\r\n\r\n    Bart Snijders (TNO) - Compact Spectrometers for Earth Observation\r\n\r\n    Wim van Westrenen (VU)– The application of Raman/LIBS technology to the exploration of the Moon and/or Mars\r\n\r\n    Avri Selig (SRON) – Optimization of instrument development: a close iteration with end users, retrieval and calibration experts\r\n\r\n    Pieternel Levelt (KNMI) - OMI, TROPOMI , TROPOLITE and their role in Air Quality and Emission monitoring\r\n\r\n    尤政院士，清华大学，一体化空间智能载荷技术\r\n\r\n    李圣怡教授，国防科技大学，先进光学加工技术\r\n\r\n    王涌天教授，北京理工大学，自由曲面设计\r\n\r\n    赵慧洁教授，北京航空航天大学，光谱仪仿真技术\r\n\r\n    李增元研究员，中国林业科学研究院资源信息研究所，ESA-MOST Dragon Programme\r\n\r\n    唐新明研究员，国家测绘地理信息局卫星应用中心，数据处理及应用\r\n\r\n    报告人待定，国家航天局对地观测与数据中心，高分系列卫星介绍\r\n\r\n会议主题及方向\r\n\r\n    会议以“精确感知，深度应用”为主题，主要征集遥感领域的新理论、新技术、新方法及遥感应用等方面的论文，包括以下领域：\r\n\r\n（1）空间光学遥感系统设计技术\r\n\r\n    光谱类载荷技术\r\n\r\n    微小型载荷技术\r\n\r\n    卫星遥感成像系统仿真技术\r\n\r\n    先进探测器及焦平面技术\r\n\r\n    卫星平台与有效载荷一体化设计技术\r\n\r\n（2）先进光学系统及制造技术\r\n\r\n   先进光学系统设计技术；\r\n\r\n    先进材料技术及应用；\r\n\r\n    先进光学加工及检测技术；\r\n\r\n    3D打印技术及应用；\r\n\r\n（3）空间光学遥感定标和计量技术\r\n\r\n    在轨定标方法及技术；\r\n\r\n    实验室定标方法及技术；\r\n\r\n    在轨计量基准技术\r\n\r\n（4）空间光学遥感数据处理和信息提取技术\r\n\r\n    在轨参数修正和调整技术；\r\n\r\n    星上数据处理技术与方法；\r\n\r\n    遥感信息提取、分析与增强技术；\r\n\r\n（5）空间光学遥感数据应用技术\r\n\r\n    空间光学遥感数据定量化应用技术\r\n\r\n    空间光学遥感数据产品化技术\r\n\r\n    空间光学遥感数据产业化应用和推广技术\r\n\r\n投稿说明\r\n\r\n    1、会议可收录摘要投稿和全文投稿两种形式的英文稿件，通过会议邮箱issoia@qq.com提交；\r\n\r\n    2、为保证会议论文的质量，全文投稿经大会学术委员会及出版社评审后，优选论文将被收录到会议论文集中，由SPRINGER出版社在会后出版电子文集（EI检索）；同时优选论文将被推荐到EOS出版的电子期刊《Journal of the European Optical Society:Rapid Publications》（2014年SCI影响因子1.231），及期刊《Journal of Optics》（2014年SCI影响因子2.059），要求论文内容未在国内外学术刊物或学术会议上正式发表。\r\n\r\n    3、摘要投稿和全文投稿提交摘要的长度均为300-400个单词，英文。会议录用稿件（全文或摘要）均提供在会议上安排口头报告或论文展示的机会。\r\n\r\n    4、会议属非密级，请作者按各单位要求做好保密审查工作，文责自负。\r\n\r\n会议重要日期\r\n\r\n    全文投稿：\r\n\r\n    延期至2016年4月20日，论文摘要征稿截止；\r\n\r\n    2016年4月30日，通知作者摘要录用及会议邀请函；\r\n\r\n    2016年6月20日，论文作者提交论文全文；\r\n\r\n    2016年8月30日通知录取情况；\r\n\r\n    2016年12月20日发送电子版论文集。\r\n\r\n摘要投稿：\r\n\r\n    2016年5月20日前提交论文摘要，\r\n\r\n    6月10日前通知摘要录用情况并发送录用通知及会议邀请函。\r\n\r\n联系方式：\r\n\r\n    联系人   李悦    010-68113632-8001\r\n\r\n    王盟    010-68113632-8006\r\n\r\n    丛振江    010-68113632-8002\r\n\r\n    邮箱   issoia@qq.com     info@sinohollandjiontlab.com\r\n\r\n    传真   010-68113608', '2016');
INSERT INTO `researchplatform_academicconference` VALUES ('4', '第一届卫星重力与水文学研讨会第一轮通知', '主办单位：\r\n    首都师范大学\r\n    清华大学\r\n    中科院测量与地球物理研究所\r\n \r\n承办单位：\r\n    水资源安全北京实验室\r\n    三维信息获取与应用教育部重点实验室\r\n    城市环境过程与数字模拟国家重点实验室培育基地\r\n  \r\n一、会议背景、目的与主题\r\n\r\n    重力卫星以其独特的视角，为水文研究提供了与众不同的数据来源。特别是GRACE（Gravity Recovery and Climate Experiment）卫星，自发射以来，在地下水、地表水、土壤水、冰川与积雪,以及地震、海洋等众多方面的应用都取得了令人瞩目的成果。\r\n    本次会议以学术交流为目的，为水文、地球物理、遥感等不同领域学者提供学术交流平台，推进重力卫星在水文领域的应用，促进中国大尺度水文研究、水资源管理的发展。\r\n    大会主题包括水文水资源、卫星重力测量以及相关领域。\r\n \r\n二、会议费用与形式\r\n\r\n    本次会议无会议注册费，与会者的来回路费和住宿费自理，会议期间的会务费用由会务组承担。\r\n    大会报告可以使用中文。但为了更好地进行国际交流，建议适当增加PPT中图表等关键内容的英文表达。\r\n \r\n三、重要日期\r\n\r\n    提交参会回执截止日期：2016年5月10日；\r\n    第二轮通知：2016年6月1日；\r\n    会议报到：2016年6月24日；\r\n    会议开始：2016年6月25日。\r\n \r\n四、特邀报告\r\n\r\n    Bridget R. Scanlon（The University of Texas at Austin）\r\n    Yoshihide Wada（Utrecht University）\r\n    Pat J.-F. Yeh（National University of Singapore）\r\n    龙笛（清华大学）\r\n \r\n五、会议组织委员会\r\n\r\n主席:\r\n    宫辉力（首都师范大学）\r\n\r\n联合主席:\r\n    洪阳（清华大学）\r\n    钟敏（中科院测量与地球物理研究所）\r\n    Pat J.-F. Yeh（National University of Singapore）\r\n\r\n执行主席:\r\n    潘云（首都师范大学）\r\n    龙笛（清华大学）\r\n    冯伟（中科院测量与地球物理研究所）\r\n\r\n会务联系:\r\n    刘晓萌（010-68903262）\r\n    黄志勇（15010214934）   \r\n    张  翀（18811305767）\r\n    郑龙群（15064153105）   \r\n    杨小芳（13126623322）\r\n    E-mail: SGHydro2016@163.com\r\n ', '2016');
INSERT INTO `researchplatform_academicconference` VALUES ('5', '第二届全国辐射物理学术交流会（CRPS\'2016）征文（第二轮）通知', ' 全国辐射物理学术交流会旨在给从事辐射物理研究的同仁们搭建一个高层次学术交流、成果展示的平台，使大家能共享资源，同时也是促进辐射物理协同创新、学科高效发展的盛会。第二届会议由中国核学会辐射物理分会主办，中科院近代物理研究所承办。欢迎各高校和科研院所从事相关研究的科技人员踊跃投稿。现将大会征文主要事项通知如下：\r\n \r\n一、征文范围\r\n \r\n1.辐射环境生成与模拟\r\n \r\n    核与空间辐射环境\r\n \r\n    高功率电子束/离子束物理、脉冲伽马射线/X射线产生、Z箍缩物理\r\n \r\n    重离子同步加速器束流慢引出与微束技术、质子加速器慢引出与均匀性、高能单色伽马射线源、中子辐照试验装置\r\n \r\n    强电磁脉冲环境\r\n \r\n2.辐射测量与诊断\r\n \r\n    空间辐射环境测量\r\n \r\n    质子/重离子加速器辐射场测量、中子测量\r\n \r\n    强脉冲辐射场测量\r\n \r\n    强电磁脉冲辐射测量\r\n \r\n    新型辐射探测器\r\n \r\n    辐射损伤在轨监测和诊断\r\n \r\n3.辐射效应与加固技术\r\n \r\n    单粒子效应\r\n \r\n    总剂量效应\r\n \r\n    位移损伤效应\r\n \r\n    剂量率效应\r\n \r\n    热力学效应\r\n \r\n    充放电效应\r\n \r\n    电磁脉冲效应\r\n \r\n4.辐射应用及其它方面\r\n \r\n    辐射生物学\r\n \r\n    辐射材料改性\r\n \r\n    脱硫脱硝等环境治理\r\n \r\n    其它方面\r\n \r\n5.辐射效应中的数值模拟与仿真技术\r\n \r\n    粒子输运技术\r\n \r\n    器件仿真技术\r\n \r\n    电路级仿真技术\r\n \r\n    系统级仿真技术\r\n \r\n    软件国产化\r\n \r\n二、征文要求\r\n \r\n    1、论文应是未公开发表的研究成果或阶段性成果，具有新颖性、创新性和参考价值。\r\n \r\n    2、论文应主题鲜明，重点突出，公式正确，数据可靠，文字流畅，图表清晰。\r\n \r\n    3、论文应为不涉密的公开交流读物，论文中不要涉及应用背景和保密的技术，请作者和提交论文单位负责保密审查，涉密单位请附保密审查意见（加盖公章）。\r\n \r\n    4、本次交流会务组将制作会议摘要文集（文本型）和论文全文集（光盘型）。请在2016年3月1日前将摘要回执返回会务组，在2016年6月1日前将全文交会务组（全文格式见附件）。\r\n \r\n    5、论文电子文稿（word版）以及保密审查表扫描版请发送至论文收取专用邮箱：fushewuli@sina.com。论文标题请注明投稿方向，以便分方向安排专家编审。稿件投稿后有重新修改的，请一定注明第几版。\r\n \r\n三、论文发表\r\n \r\n    将编辑制作\"第二届全国辐射物理学术交流会CRPS`2016\"论文集（光盘），并由学术委员会组织评选出优秀论文，推荐给《现代应用物理》期刊。\r\n \r\n四、新品展示\r\n \r\n    为了便于有关单位展示新产品、高新技术，请与主办方联系，经准许方可携带小型展板、产品样本、项目简介展示交流。\r\n \r\n五、联系方式：\r\n \r\n    李楠：029-84765135  13892878075\r\n \r\n    李婷：029-84765139  13572467046', '2016');

-- ----------------------------
-- Table structure for researchplatform_announcement
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_announcement`;
CREATE TABLE `researchplatform_announcement` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(50) NOT NULL,
  `content` longtext NOT NULL,
  `editor_id` int(11) NOT NULL,
  `type` varchar(10) NOT NULL,
  `readCount` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `submittime` datetime NOT NULL,
  `passtime` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `ResearchPlatform_announcement_c2be667f` (`editor_id`),
  CONSTRAINT `editor_id_refs_id_9beab757` FOREIGN KEY (`editor_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_announcement
-- ----------------------------
INSERT INTO `researchplatform_announcement` VALUES ('1', '英国研发新药治疗3种“被忽视的热带病”', '英国知名科学杂志《Nature》于2016年8月8日刊文称，科学家成功研发出一种单一疗法，或能够有效治疗3种被统称为“被忽视的热带病（NTD）”的致死性传染病。“被忽视的热带病”主要是指在贫困地区尤其是热带地区炎热潮湿气候环境下流行的传染病，每年全球都会有数千万的人患病，导致超过5万人的死亡。\r\n美洲锥虫病、睡眠病（又称非洲锥虫病)、利什曼病--这三种热带病的最大共同点就是，它们都是通过拥有类似遗传基因特征的原生动物寄生虫感染引发的。\r\n研究人员成功找到了3种病原体内共通的酶，开发出能够阻碍其作用能力的化学物质。\r\n英国约克大学免疫学·感染症研究中心教授杰莱米·莫特拉姆（Jeremy Mottram）是该论文的作者。他强调，本次研究让人们对引发3种传染病的原生动物寄生虫有了突破性认知，让这些传染病的治愈成为可能。\r\n莫特拉姆教授在声明中表示，在进行人体临床试验之前需要检查化合物的毒性。不过在已经完成的动物实验中，已经确认了极佳的耐量性。\r\n小组成员为了研发出这种“特效药”，从瑞士诺华制药有限公司（Novartis）的化合物库中，先后挑选了300万种化合物进行活体原生动物寄生虫试验。\r\n之后，研究人员又利用针对有望分子的化学合成法，对其进行了微调整，让这种新药能够对3种传染病全部具有有效性。\r\n■会发光的原生动物寄生虫\r\n这三种传染病中致死率最高的是睡眠病，引发该病的寄生虫在侵入人体中枢神经系统后，会导致神经机能的下降，让人陷入昏睡状态并导致死亡。\r\n想要研发能够以侵入脑内的病原体为目标的药剂是非常困难的，而在被本次研究中小组成员突破了这一难关。在实验初期，成功利用遗传基因编辑技术制作出会发光的原生动物寄生虫，并让小鼠感染该寄生虫。\r\n该论文联合作者约克大学教授艾鲁玛丽·玛巴拉（Elmarie Myburgh）表示，这种手法让研究人员可以使用摄像系统去检测脑内寄生虫的状况。利用摄像检测法可以观察到，诺华制药有限公司开发的化学物质到达至大脑内并杀死了寄生虫。\r\n相关试验证实，这种化合物对美洲锥虫病和利什曼病也有相同效果。\r\n这三种传染病都有相应的疗法，不过现有的疗法全部都需要高额的治疗费用，而且均会带来副作用，治疗效果也并不理想。\r\n小鼠实验证实，本次新发现的化合物并没有损害小鼠细胞的正常机能，未观察到明显副作用。\r\n世界卫生组织（WHO）表示，被分类为“被忽视的热带病”的这三种传染病，均常见于公共卫生环境较差的地区，严重影响着世界贫困人群的健康。', '1', 'News', '0', 'Passed', '2016-11-28 14:23:35', '2016-11-28 14:23:38');
INSERT INTO `researchplatform_announcement` VALUES ('2', '专家研讨全球公共卫生视角下中国热带病防治策略', '新华网上海4月25日电（仇逸、严晓慧）由中华医学会主办 ，复旦大学附属上海市公共卫生临床中心承办的“2016年中华医学会热带病与寄生虫学分会年会”23日召开。我国传染病领域专家汇聚，共同探讨全球传染病预防机制与救治进展，合力应对中国热带病防治重任。\r\n\r\n    知名传染病专家、上海市公共卫生临床中心党委书记卢洪洲教授介绍，热带病广义上是指主要发生在热带或亚热带地区的常见感染性疾病，以及少量热带地区所特有的非感染性疾病，狭义的热带病则是指在热带地区多发和常见的传染病、寄生虫病和虫媒病等。世界卫生组织（WHO）规定了8种最重要和最常见的热带病，即疟疾、血吸虫病、黑热病、锥虫病、丝虫病、麻风病、登革热和结核。\r\n\r\n    近年来，随着经济快速发展、日益频繁的国内外交流等，热带病“去国籍化”现象日益凸显。全球面临的热带病输入、传播、复现和发生突发公共卫生事件的风险日益加大。热带病的流行、发病特点显著变化，扩大传播和疫情暴发风险增加，已引起国际社会广泛关注。\r\n\r\n    据中国CDC曹建平教授介绍，2010年10月14日，WHO首次发布了题为“努力消除被忽视热带疾病产生的全球影响”的报告。报告有17种 ，其中包括：狂犬病，登革热，致盲性沙眼等。2014年12月5日，第四届金砖国家卫生部长会议，中国卫生计生委主任李斌介绍我国被忽略的热带病防控情况。WHO发出抗击被忽视的热带病全球计划，要求各成员国加强防治。其中要求加强诊断、治疗、预防、媒介防制、保护（疫苗、预防药物、药浸蚊帐）等措施的实施与研究。\r\n\r\n    我国是热带病危害最为严重的国家之一 。输入性热带病常见的有：疟疾、血吸虫病、登革热。上海市热带病的防治依然是不容忽视的公共卫生问题，热带病防治研究亟需加强。历史上，上海是疟疾、血吸虫病、丝虫病等的严重流行地区。近年，上海市对口援建新疆喀什地区及云南省部分地区是包虫病等流行区。上海每年还会收治大量的国内外就医者，其中不乏输入性热带病患者，甚至海外热带病求医者。\r\n\r\n    大会由国家卫生计生委公共卫生应急相关部门召集业内专家共同分析我国热带病领域防控现况、援外经验与全球卫生事业发展需求，提出我国在热带病重点领域工作路线图。会议期间发起成立了热带病领域的五个学组（艾滋病、结核、肝病、寄生虫、虫媒传染病），学组将分别制定领域内相关诊疗指南与规范，定期组织学术研究，推动后续工作的落实。', '1', 'News', '0', 'Passed', '2016-11-28 14:31:00', '2016-11-28 14:31:02');
INSERT INTO `researchplatform_announcement` VALUES ('3', 'DNDi：打破受忽视疾病新药开发的窘境', '近日《自然》杂志报道了DNDi（Drugs for neglected disease initiatives）的一个开发新药的新模式。DNDi只用10年多一点的时间、2.9亿美元就上市了6个新药，还有26个在临床研究。\r\n这个组织声称他们的模式平均开发一个新药只要1.1-1.7亿美元，远低于制药工业10亿美元一个新药的成本，这在传统的新药研发模式下，几乎是不可能。创造了这个不可能的DNDi是一个非盈利新药研发组织，旨在以在通过研发新药，提高“受忽视疾病”（neglected diseases）患者的生活质量与健康状况。\r\n“受忽视疾病”这个说起来有些拗口的名词让很多人听起来有些陌生。“疾病有一条长尾——少数疾病影响着数亿人口，而其他多数疾病则困扰着较少的人。”受忽视疾病就是这条长尾，昏睡病、利什曼原虫病、南美锥虫病、儿童艾滋病、丝虫病、以及疟疾等都隶属在内，世界上有超过10亿人口正在受其困扰，这些很多患者每天的收入低于1.25美元。受忽视疾病包括一些在发展中国家最常见的感染，而且是造成低收入和中等收入国家人民慢性致残的主要原因。\r\n这些疾病不仅限于贫困的热带地区，其中一些疾病也是，或曾经是美国、欧洲南部和土耳其的流行病。但它们和这些贫穷地区的人们一样，几乎没有吸引到公众的注意，而它们造成的严重的健康问题和沉重的经济负担，却与那些严重疾病一样巨大。 \r\n昏睡病引是一种叫做锥虫的寄生虫感染造成的疾病，流行于中部非洲\r\nDNDi是怎么成立起来的？\r\n1975年到1999年，只有1.1%的新药用于治疗被忽视疾病，而在2000年到2011年的十年间，这个数字也仅仅增长到4%。在1975年到1997年期间研发的1000多种新药中，只有13个新药与它们有关，这些疾病缺乏现代、安全、有效的治疗方案。\r\n药物研发是以市场为导向的，这类疾病多发生在贫穷地区，厂家即使投入小也无法获得足够利润。因此商业主体缺乏足够的动力进行针对于被忽视疾病的研发，但是把所有的过错推给制药公司是不太公平的。“我们需要记住，研发一种新药可能要花费10亿美元。研究资金很少，所以得按优先级别来投入资金。只要药物研发成本仍然这么贵，现实就不会改变。同时，药物研发总是遵循着同一种模式。”\r\n无国界医生组织是一个非牟利团体(NPO)。1999年诺贝尔和平奖的得主，组织的成员深深意识到发展中国家的普通百姓极度缺乏救命良药，并捐出诺贝尔奖金，启动了DNDi\r\n为了改变这一情况，2003年七个国际性的组织联合成立了DNDi，他们分别是无国界医生组织，奥斯瓦尔多·克鲁兹基金会，印度医学研究委员会，肯尼亚医学研究所，马来西亚卫生部，法国巴斯德研究所，热带病研究和培训特别规划（作为这个组织的长期观察员），DNDi希望通过联合国际研究组织，政府部门、医药产业及相关的合作机构，为被忽视疾病患者提供有效的新药。\r\n在DNDi成立之初，诸多业内人士对于他们的理想赞誉有加，但是新药研发是一项复杂、昂贵、耗时良久的工程，这样一个松散的组织是否完成如此艰巨的任务大部分人持保留态度。然而在短短13年里，DNDi所取得的成就让人惊喜。\r\n降低90%的研发成本如何做到？\r\nDNDi实际采用的是一个虚拟化的运作模式，为了控制研发成本，它的研发活动都是外包的，DNDi和企业保持着密切的合作，同时充分调动公共资源。药企为其提供开放式技术，科学咨询师为其出谋划策；通过与大型药企富有效率的合作，能省去建立筛选文库等重复劳动，同时受忽视疾病的研发领域相对来说还是一片蓝海，这也让DNDi的临床试验与市场推广进行得非常顺利，这一切让DNDi在药品研发上与传统的企业研发相比具备很大的成本优势。\r\n前一阵默沙东在已经做了8000多人的临床试验后放弃一周一次DPP4抑制剂，并非因为这个药无效，而是无法在拥挤的市场上生存。很多药物如抗凝药Zontivity、丙肝药物Incivek在厂家投入大量资本上市后被更好的药物挤出市场。同样为了在激烈的竞争中领先，很多项目要在数据不完整的情况下冒险前进，增加失败几率。但是这些成本都是DNDi不需要考虑的。DNDi的疟疾新药就可以视作为“精简模式”的缩影。\r\n在DNDi创立的早期，世界卫生组织正呼吁利用复方药控制疟疾。看到这个机会之后，DNDi的执行主任Bernard Pécoul博士联系了拥有两款疟疾药物的赛诺菲公司，建议由DNDi进行复方药的临床试验，而赛诺菲则放弃该复方药的专利，并以不到1美元的价格为成人进行治疗。这次合作取得了空前的成功。自2007年上市后，数亿粒新药被运往非洲，极好地对疟疾进行了控制。而在于赛诺菲的合作下，这一新药的研发成本仅仅是1400万美元。\r\n或许在药品研发上，DNDi外包的方式显得似乎有些取巧，但是能够协调众多的合作机构为一个目标服务是DNDi的过人之处，平衡不同类型合作机构的利益需求，特别是设计知识产权、保密协议、许可权利等一些关键资源的调配是其成功的关键，为了解决这一困境，DNDi针对不同的合作方开发了多种合作模式。\r\n “长久以来，人们认为新药研发过于复杂，只有大型药企才能完成这一任务，”哈佛大学公共健康学院的全球健康管理论坛研究主任，同时也是DNDi董事会成员的Suerie Moon博士说：“我认为如今我们能从DNDi的例子中学到很多经验，并把它们应用到其他更受关注的疾病中去。”虽然很多人认为DNDi所取得的成功是基于其非盈利的组织性质，是否能够适应商业运用仍然保持怀疑态度，但是作为众筹行业的一名从业者，投壶网认为DNDi所实践的这种众包的模式，或许真是一剂良方。', '1', 'News', '0', 'Passed', '2016-11-28 14:33:00', '2016-11-28 14:33:02');
INSERT INTO `researchplatform_announcement` VALUES ('4', '新发现：热带病锥虫病药物', '佐治亚大学的研究人员正在努力寻找最快的办法来治疗人类非洲锥虫病，其长期被称为昏睡病。通过努力改善已经在人类临床试验中测试的化学实体，他们希望有一个更快的路线研究可以口服给患者的药物以治疗疾病。\r\n\r\n 该研究“咔唑源先导药物治疗人类非洲锥虫病的发现，”发表在8月26日的《科学报告》中。\r\n\r\n非洲人类锥虫病，或HAT，是一种在撒哈拉以南非洲的一些农村社区的热带病。一种媒介传播的寄生虫病，现有的诊断和治疗方案是复杂的，特别是在一些世界上最贫困的地区具有挑战性。\r\n\r\n“这是在试图寻找新的药物来控制疾病方面的一个重大的挑战，”Kojo Mensa Wilmot说，他是富兰克林文理学院细胞生物学系的主任、教授。“目前使用的治疗药物不能口服，并要求人们去一个设置在农村的诊所，无论是对卫生专业人士，还是那些感染了这种疾病的人，这都是一个问题，。\r\n\r\n新文章中乔治亚领导的团队提出的“药物改造”，是用一种疾病在其他疾病中进行进行测试的药物开发方法。其作为一个药物发现计划由美国国家卫生研究院资助一部分克利夫兰生物公司合成的一类化合物，试验研究小组从中选出对寄生虫有效的药物。使用疾病的动物模型，研究人员给小鼠口服药物并治愈疾病。\r\n\r\n他们最初的目标是创造化合物来治疗某些类型的癌症。超过30种化合物筛选，我们发现了一个治愈疾病和两个潜在消除感染的药物”，Mensa-Wilmot说。\r\n\r\n“两个化合物在临床试验中，但发现这些反锥虫药的研发管线是可悲的，”Mensa Wilmot说。“HAT是一种贫穷的疾病，真的，所以很少有制药行业大量投资的动机。由于寄生虫可以产生抗药性，我们要提高警惕，寻找新的有效的，治疗疾病的口服药物。\r\n\r\nHAT是感染布氏锥虫属原生动物寄生虫传播给人类的疾病，通过采采蝇传播。农村人口生活在依赖于农业、渔业区、畜牧或狩猎最易暴露采采蝇环境，并因此感染疾病。该疾病的发展范围从单一的村庄到整个地区的地区。根据世界卫生组织的报告，持续的控制努力减少了新病例的数量，并在2009报告的数量下降了50，这是10000年来的第一次。\r\n', '1', 'News', '0', 'Passed', '2016-11-28 14:34:27', '2016-11-28 14:34:29');
INSERT INTO `researchplatform_announcement` VALUES ('5', '世卫组织总干事陈冯富珍出席世界卫生组织热带病合作中心', '2015年10月17日上午，世界卫生组织热带病合作中心揭牌仪式在上海举行，世卫组织总干事陈冯富珍、国家卫生计生委副主任马晓伟、上海市副市长翁铁慧等出席，为合作中心揭牌并致辞。 \r\n　　陈冯富珍总干事高度评价了中国消除丝虫病、疟疾和血吸虫病等寄生虫病的进展，赞扬了中国疾病预防控制中心寄生虫病所取得的成绩，期待合作中心今后在中国和全球热带病防控工作中发挥更大作用，同时祝贺中国女药学家屠呦呦因成功制取青蒿素有效成分而获取医学领域诺贝尔奖，肯定了中国在医学研究和创新方面对世界的贡献。 \r\n　　马晓伟副主任祝贺中国疾控中心寄生虫病所成为世界卫生组织热带病合作中心，希望寄生虫病所继续总结成功经验，发挥专业技术优势，与世卫组织开展广泛深入合作，为中国“一带一路”、公共卫生援非等国际合作提供技术支撑，为加强全球热带病防控工作和实现联合国可持续发展目标而努力。 \r\n　　中国疾控中心寄生虫病所建所65年，1980年成为第一批世卫组织在华合作中心。2015年世卫组织“疟疾、血吸虫病和丝虫病合作中心”更名为“热带病合作中心”，与世卫组织进一步扩大了合作领域。 \r\n　　世卫组织相关官员，国家卫生计生委国际司、疾控局，上海市政府、卫生计生委，中国疾控中心相关人员陪同参加揭牌仪式。', '1', 'News', '0', 'Passed', '2016-11-28 14:35:08', '2016-11-28 14:35:10');
INSERT INTO `researchplatform_announcement` VALUES ('6', '构建公共卫生安全防控屏障', '“十三五”时期，应进一步突出预防为主、防治结合和全程管理的指导思想，积极预防可控的危险因素，降低感染性疾病危害，遏止并扭转慢性非传染性疾病的蔓延，切实维护好人民健康。\r\n“十二五”以来，我国基本公共卫生服务均等化和传染病防控工作取得良好进展，但是，不容忽视的是由于预防保健战略的碎片化，危害公众健康的危险因素未能得到有效控制。感染性疾病依然严重威胁公共安全和公众健康，突发急性传染病不断出现，常见急性传染病联防联控机制尚未有效运作。慢性非传染性疾病呈井喷趋势，严重影响人群健康。\r\n为此建议：扩展基本公共卫生服务项目，完善公共卫生服务模式，不断提高人均公共卫生服务的筹资水平。要明确政府主体职责，加大对公共卫生服务项目、人力资源、设备的投入，建立稳定长效的投入机制，并适当向农村贫困地区倾斜，保证贫困人口获得公平的公共卫生服务。建立多方筹资渠道，鼓励社会组织、企业、慈善机构等兴办公共卫生服务事业。合理设置公共卫生服务项目，科学界定重大和基本公共卫生服务项目范畴。各级政府在加大公共卫生服务资金支持力度的同时，制定配套的资金使用规范。\r\n加强传染病监测和防控，强化源头治理和联防联控，防范突发急性传染病发生。健全监测网络和预警平台，实现突发急性传染病早期发现和预警。强化隶属不同管理条块的基层单位之间的联合防控机制，明确各方责任区域和防控目标，督促落实各部门承担的防控任务。强化重大新发传染病防控，尤其是艾滋病、结核病、血吸虫病、乙型肝炎、人畜共患病等疾病的有效防控。发挥我国防控传统传染病与热带病的优势，积极实施走出去战略，扩大我国公共卫生的国际影响力。\r\n\r\n优化国家突发公共卫生事件应急指挥决策系统，提高我国卫生应急体系的前瞻性、集成度和有效性，全面提升突发急性传染病防治效率。完善突发急性传染病临床救治定点医院网络，提升重症病例救治水平。加强专家应急队伍和应急处置队伍建设。提升不明原因疾病和新发传染病的实验室检测鉴定技术、能力储备，增强病因快速调查和有毒物质的检测能力。\r\n此外，还要加强健康干预，遏制慢性疾病的井喷，加强重大慢性病的管理，减少慢性病导致的失能、伤残、早逝和经济负担。如制定有利于慢性病防控的公共政策体系，包括控烟、限酒、减盐、减糖、促进运动等有利于健康的配套措施。还如转变慢病管理模式，将疾病管理转为健康管理，将预防为主、关口前移、分级诊疗、防治结合、中西医并重落到实处，提供慢性病的临床预防性服务等。', '1', 'News', '0', 'Passed', '2016-11-28 14:35:59', '2016-11-28 14:36:01');
INSERT INTO `researchplatform_announcement` VALUES ('7', '领取体检结果通知', '各单位：\r\n南校区门诊部2016年在职教工体检工作已全部结束，请在南校园门诊部参加体检的单位派人前来门诊部护养院二楼保健科领取《教工健康手册》。\r\n领取时间：周一至周五上午8:00--11:30，下午：2:30--5:00\r\n（由于需要严格校对名单，请前来领取健康体检手册时预留充足的时间）\r\n另外，请在南校园门诊部参加体检，但没交手册的教工，带《教工健康手册》前来南校区门诊部护养院二楼保健科前来领取结果。谢谢配合！\r\n \r\n联系电话：84113092\r\n \r\n南校园门诊部\r\n2016-11-24', '1', 'Notice', '0', 'Passed', '2016-11-28 16:53:35', '2016-11-27 16:53:30');
INSERT INTO `researchplatform_announcement` VALUES ('8', '关于举办中山大学2016年“康乐杯”学生  十大体育赛事之【定向越野比赛】的通知', '各学院、直属系：\r\n为建设阳光、健康的校园体育文化，加强各校区院系的交流，使更多的学生参与课外体育活动和竞赛，更好地改善我校学生体质和精神面貌，服务于学校人才培养目标，根据《中山大学“十三五”体育发展规划》，我校体育部牵头，联合党委学生工作部、宣传部、校团委等相关部门共同制定了《中山大学“康乐杯”学生十大体育赛事及两大品牌体育赛事实施方案》，定于2016年12月上旬举办中山大学2016年“康乐杯”学生十大体育赛事之定向越野比赛，现将竞赛规程公布如下，请各学院、直属系按照规程要求报名参赛。\r\n                       \r\n中山大学体育运动委员会\r\n2016年11月16日', '1', 'Notice', '0', 'Passed', '2016-11-28 16:58:35', '2016-11-27 16:58:30');
INSERT INTO `researchplatform_announcement` VALUES ('9', '关于举办孙中山与中山大学历史图片展的通知', '广大师生校友：\r\n    今年是孙中山诞辰150周年，为纪念伟人创办我校的伟大功绩，彰显学校的办学成就，弘扬中山精神及传承校史文化，档案馆利用馆藏的历史图片和档案，举办“孙中山与中山大学”历史图片展览，欢迎广大师生莅临参观！\r\n \r\n时间：2016年11 月11日-20日\r\n地点：南校园外国语学院一楼大堂\r\n \r\n中山大学档案馆\r\n中山大学校史研究中心\r\n2016年11月8日', '1', 'Notice', '0', 'Passed', '2016-11-28 16:59:06', '2016-11-27 16:59:00');

-- ----------------------------
-- Table structure for researchplatform_article
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_article`;
CREATE TABLE `researchplatform_article` (
  `id` int(11) NOT NULL auto_increment,
  `order` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `author` varchar(50) NOT NULL,
  `year` int(11) NOT NULL,
  `link` varchar(200) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_article
-- ----------------------------
INSERT INTO `researchplatform_article` VALUES ('1', '1', 'Genome sequence of the metazoan plant-parasitic nematode Meloidogyne incognita', 'Abad P', '2008', 'http://www.ncbi.nlm.nih.gov/pubmed/18660804');
INSERT INTO `researchplatform_article` VALUES ('2', '2', 'A lover and a fighter: the genome sequence of an entomopathogenic nematode Heterorhabditis bacteriophora', 'Bai X', '2013', 'http://www.ncbi.nlm.nih.gov/pubmed/23874975');
INSERT INTO `researchplatform_article` VALUES ('3', '3', 'The genome of the blood fluke Schistosoma mansoni', 'Berriman M', '2009', 'http://www.ncbi.nlm.nih.gov/pubmed/19606141');
INSERT INTO `researchplatform_article` VALUES ('4', '4', 'Genome sequence of the nematode C. elegans: a platform for investigating biology', 'C. elegans Sequencing Consortium', '1998', 'http://www.ncbi.nlm.nih.gov/pubmed/9851916');
INSERT INTO `researchplatform_article` VALUES ('5', '5', 'Soil-transmitted helminth infections: ascariasis, trichuriasis, and hookworm', 'Bethony J', '2006', 'http://www.ncbi.nlm.nih.gov/pubmed/16679166');
INSERT INTO `researchplatform_article` VALUES ('6', '6', 'The genome and life-stage specific transcriptomes of Globodera pallida elucidate key aspects of plant parasitism by a cyst nematode.', 'Cotton JA', '2014', 'http://www.ncbi.nlm.nih.gov/pubmed/24580726');
INSERT INTO `researchplatform_article` VALUES ('7', '7', 'How to become a parasite - lessons from the genomes of nematodes', 'Dieterich C', '2009', 'http://www.ncbi.nlm.nih.gov/pubmed/19361881');
INSERT INTO `researchplatform_article` VALUES ('8', '8', 'Draft genome of the filarial nematode parasite Brugia malayi', 'Ghedin E', '2007', 'http://www.ncbi.nlm.nih.gov/pubmed/17885136');
INSERT INTO `researchplatform_article` VALUES ('9', '9', 'Impact of Leishmania metalloprotease GP63 on macrophage signaling', 'Isnard A', '2012', 'http://www.ncbi.nlm.nih.gov/pubmed/22919663');
INSERT INTO `researchplatform_article` VALUES ('10', '10', 'Large, rapidly evolving gene families are at the forefront of host-parasite interactions in Apicomplexa', 'Reid AJ', '2015', 'http://www.ncbi.nlm.nih.gov/pubmed/25257746');

-- ----------------------------
-- Table structure for researchplatform_biologicalcategory
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_biologicalcategory`;
CREATE TABLE `researchplatform_biologicalcategory` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_biologicalcategory
-- ----------------------------
INSERT INTO `researchplatform_biologicalcategory` VALUES ('1', '传染病');

-- ----------------------------
-- Table structure for researchplatform_biologicalname
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_biologicalname`;
CREATE TABLE `researchplatform_biologicalname` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `ResearchPlatform_biologicalname_6f33f001` (`category_id`),
  CONSTRAINT `category_id_refs_id_91adc771` FOREIGN KEY (`category_id`) REFERENCES `researchplatform_biologicalcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_biologicalname
-- ----------------------------
INSERT INTO `researchplatform_biologicalname` VALUES ('1', '热带病', '1');

-- ----------------------------
-- Table structure for researchplatform_member
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_member`;
CREATE TABLE `researchplatform_member` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(20) NOT NULL,
  `profile` longtext,
  `user_id` int(11) default NULL,
  `team_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `researchplatform_member_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `researchplatform_team` (`id`),
  CONSTRAINT `user_id_refs_id_97e1109e` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_member
-- ----------------------------
INSERT INTO `researchplatform_member` VALUES ('1', '符研究员', '符林春研究员，男，博士生导师，广州中医药大学热带医学研究所所长，广东省卫生系统“五个一工程”学术和技术带头人，国家中医药管理局中医药防治艾滋病专家组成员，中华中医药学会防治艾滋病分会副主任委员，广东省热带医学会副主任委员，中华医学会热带病和寄生虫分会委员，享受国务院政府特殊津贴专家。\r\n长期从事疟疾和中医药抗病毒研究。主持和参与青蒿素类4个一类新药8种制剂的临床研究，参与青蒿素类复方研究，这些药物已成为国际上最优秀的抗疟药，广泛使用于全球疟疾的防治。参与脑型疟的救治研究，使脑型疟病死亡率控制在10%以下，达到国际先进水平。研究成果曾获得国家科技进步二等奖、三等奖各1次，省部级一等奖3次。符老师还曾获“全国首届杰出青年中医奖”，国家教育部霍英东教育基金高校青年教师研究类二等奖。发表学术论文60多篇。\r\n符林春老师近年来主要开展中医药防治艾滋病的实验和临床研究，是我校中医临床基础国家重点学科中医药防治艾滋病研究方向的学术带头人。现主持国家“艾滋病和病毒性肝炎等重大传染病”科技重大专项以及中医药治疗艾滋病国际科技合作项目多项。已培养博士、硕士研究生20多名，博士后研究人员5名；指导的研究生学位论文获得2010年广东省优秀硕士论文。', '2', '1');
INSERT INTO `researchplatform_member` VALUES ('2', '陈研究员', '陈沛泉，男，广东省罗定市人，1949年9月出生。现任广州中医药大学研究员，中医临床基础学科温病学（热带病）专业博士生导师，中华医学会热带病与寄生虫学学会会员，广东省热带医学学会常委，国家自然科学基金评审专家库专家，广东省自然科学基金评审专家库专家。  陈沛泉研究员从事病原生物学和中医药防治热带病的教学与研究30多年，参与青蒿素的基础和临床研究，团结协作，发现了青蒿素类药的杀虫速度要比国际上常用的甲氟喹、奎宁、氯喹等快得多; 适当延迟长疗程，治愈率可达90%以上; 用于脑型疟救治，死亡率低于10%;海南南部恶性疟原虫对氯喹、哌喹的抗性曾经相当严重；甲氟喹、氯喹、哌喹、奎宁等对恶性疟原虫配子体无效，在首剂给药后3-4周还可感染蚊媒，而青素类药首次给药后14天即可阻断恶性疟传播；目前海南恶性疟对青蒿琥酯和双氢青蒿素是敏感的；复方双氢青蒿素有望成为WHO一线抗疟药；上世纪九十年代初开始涉足生物技术，把体内、体外试验联系起来，对药物阻断疾病传播的实验研究和临床应用方面有较深入的见解。当前的研究方向是以分子生物学和细胞生物学手段对中医药防治热带病（传染病）的作用机理和实用方法进行深入探讨。先后参加或主持完成WHO、国家、部（省）、厅（局）级和对外合作科研项目20多项，多次以专家身份出国进行合作研究、在国际学术会议上宣读论文。在省级以上刊物发表论文40多篇。已经培养和协助培养硕士、博士研究生10多名。  陈沛泉研究员教研作风严谨，成绩显著，曾被评为 “全国优秀教师” ，“南粤优秀教师”； 获国家科技进步二、三等奖各1项，部（省）级科技进步奖5项。 ', '3', '1');
INSERT INTO `researchplatform_member` VALUES ('3', '李研究员', '李常青，男，1965年9月生，湖南华容人，研究员，中医临床基础专业导师。  学术特长：中医药治疗慢性乙型肝炎、肝纤维化、肝硬化和脂肪肝的临床医疗实验研究工\r\n tob_id_3368\r\n作。  教学科研成果：近年来先后主持2项省级课题和1项厅级课题、参加1项国家自然科学基金课题和1项省级课题的研究，主要开展了苦参碱靶向制剂抗乙型肝炎病毒和抗免疫性肝损伤的实验研究，证实苦参碱靶向制剂可以提高苦参碱的抗乙型肝炎病毒作用效果，并可减少用药剂量，降低其毒性作用。完成了包括叶下珠复方在内的多个中药复方抗乙型肝炎病毒、抗肝损伤和抗肝纤维化作用的临床和药效学研究工作。  论文论著发表情况：发表学术论文三十余篇，参加编写论著1部。 招收研究人员人数：已毕业两名，在读三名。  对外学术交流情况：06、07年先后应邀出席台湾参加海峡两岸肝病治疗学术研讨会。', '4', '1');
INSERT INTO `researchplatform_member` VALUES ('4', '曾研究员', '曾庆平，男，湖南常德人，1961 年 4 月出生。理学硕士、工学博士，研究员。中国生\r\n\r\n物化学与分子生物学学会、中华医学会传染病与寄生虫病学分会、中国性病艾滋病防治协会\r\n\r\n和广东省热带病学会会员，受聘为国家药品食品监督管理局、国家自然科学基金、广东省自\r\n\r\n然科学基金、广州市生物医药评审专家库专家，现任广州中医药大学热带医学研究所生物技\r\n\r\n术研究室主任，曾先后主持和参加国家自然科学基金项目（青蒿素生物合成途径的局部重建\r\n\r\n及青蒿素前体的生物转化、关木通中马兜铃酸合成代谢基因敲除的研究、DNA 疫苗联用转\r\n\r\n基因中草药防治艾滋病的研究、转人α-干扰素基因苦瓜的抗病毒实验研究）、国家中医药管\r\n\r\n理局项目（面向高产青蒿素的代谢途径工程育种研究）、省自然科学基金项目（鲨烯合酶基\r\n\r\n因敲除与转基因青蒿素高产植株的培育、中药复方配合 DNA 疫苗防治猴艾滋病的研究）、\r\n\r\n省科技计划项目（转基因青蒿氧化胁迫诱导及青蒿素前体大规模转化）、省教育厅项目（集\r\n\r\n成化艾滋病、乙型肝炎和 STD 基因诊断用反义探针微球的研制）及多项横向合作项目（高\r\n\r\n效低价疟疾检测试剂盒的研制等），在国内外发表论文数十篇，专著 4 本。曾作为国家公派\r\n\r\n访问学者赴芬兰赫尔辛基大学生物工程研究所工作，并参访了英国牛津大学和剑桥大学、德\r\n\r\n国 Max-Plank 研究所、荷兰雷登大学和瑞士联邦技术研究所等著名学府及科研院所。曾获邀\r\n\r\n参加美国著名的 Gordon 科学会议（GRC）的植物代谢工程专题研讨会，并进行论文展示及\r\n\r\n开展学术交流，还与欧美多所大学及研究所建立了合作关系。\r\n\r\n自 1980 年以来，已在国内外发表学术论文 100 多篇（包括 SCI 论文），并在 GenBank\r\n\r\n发布基因序列 50 余条，主编专著《植物生物反应器》（2008，化学工业出版社）、《遗传\r\n\r\n修饰植物》（2006，科学出版社）、《生物医药前沿技术》（2004，人民卫生出版社）、《人\r\n\r\n类艾滋病》（2000，人民卫生出版社），参编专著《植物生物技术原理与方法》（1990，湖\r\n\r\n南科技出版社）。申请国家发明专利 2 项，获奖 8 项。现专业技术领域为生物工程，主要研\r\n\r\n究方向是中药生物工程（转基因中青蒿及青蒿素合成的微生物反应器研制）和分子中药学（青\r\n\r\n蒿基因组学、转录物组学、蛋白质组学、代谢物组学及其网络调控），并从事重大传染病（疟\r\n\r\n疾、AIDS、SARS、STD 等）病原体快速诊断试剂盒的开发。目前已完成或正在开展的研究项目包括青蒿紫穗槐二烯合酶基因克隆及其在大肠杆菌\r\n\r\n中的表达、青蒿素前体的微生物合成及其在青蒿无细胞提取液中的生物转化、青蒿 CYP 基\r\n\r\n因在酵母内膜上的表达及膜结合型 CYP 催化青蒿素前体的转变、酵母 SS 基因克隆及农杆菌\r\n\r\n介导的反义 SS 基因转移；青蒿鲨烯合酶反义基因转化培育青蒿素高产植株的研究、基于锚\r\n\r\n定 RT-PCR 的青蒿 EST 克隆、测序及生物信息学分析、青蒿 cDNA 文库构建与 CYP 基因克\r\n\r\n隆及其表达的发育调节模式研究、青蒿 ADS 基因启动子低温诱导结合转录因子的分离与鉴\r\n\r\n定、青蒿素生物合成调控及其人工干预、环境胁迫诱导的青蒿素合成基因表达及其信号转导\r\n\r\n机制、单线态氧介导青蒿酸转变成青蒿素的体内外途径、基于 PfLDH 靶点的中药抗疟成分\r\n\r\n高通量筛选与生物鉴定等。', '5', '1');
INSERT INTO `researchplatform_member` VALUES ('5', '袁研究员', '袁冬生，男，江西省乐安县人, 1964年10月出生，1991年广州中医药大学硕士研究生毕业，副教授、副主任医师,中医临床基础硕士生导师，现从事中医药抗乙肝病毒的基础与临床研究。担任《中医基础理论》、《中医诊断学》、《方剂学》的教学，年均110学时，教学效果优良；长期坚持肝炎专科门诊，积累了丰富的治疗慢性乙型肝炎的经验。2001年开始攻读中医临床基础专业在职博士生，导师为王新华研究员，进行中医药治疗乙型肝炎的研究；主持省级课题2项，参与省级课题2项，参与校级课题2项。发表论文国家级期刊8篇，省级期刊2篇', '6', '1');
INSERT INTO `researchplatform_member` VALUES ('6', '杨副研究员', '杨瑞仪，女，广东大埔县人，1972年5月出生，1998年暨南大学免疫遗传专业硕士研究生毕业，广州中医药大学热带医学研究所副研究员，中医临床基础硕士生导师，中华医学会传染病与寄生虫病学会会员。曾先后主持或参加国家自然科学基金、国家中医药管理局、广东省自然科学基金、广东省教育厅、广东省卫生厅、广东省中医药管理局等科研项目20余项。在国内有影响的核心期刊发表论文数十篇，参编著作3部。现专业技术领域为医药生物工程，主要研究方向为中药生物工程（包括转基因中药、中药活性成分的合成代谢研究、中药活性成分基因工程研究等）及中药对肿瘤的免疫调控研究。', '7', '1');
INSERT INTO `researchplatform_member` VALUES ('7', '张研究员', '张奉学研究员，安徽省人，1962年出生。广州中医药大学中西医结合基础专业博士生导师。热带医学研究所病毒学研究室主任，世界中医药学会联合会肝病专业委员会常务理事，广东省热带医学学会常务理事、副秘书长，是广东省“千百十人才工程”培养对象，中国科学院“西部之光”人才培养计划“联合学者”。《生物技术通讯》 理事，广州中医药大学学报 编委。\r\n1985年毕业于安徽中医学院，并获得学士学位，1991年获得广州中医药大学中西医结合基础专业硕士学位，2002年8月起广州中医药大学在职博士。2003年1月至2003年12月由国家科技部选派在日本长崎大学分子免疫遗传学系进修。2005年6月获得医学博士学位并获得香港求是科技基金会“求是优秀研究生奖”。\r\n长期从事病毒学研究和抗病毒药物的体内外活性研究开发与评价。作为主要成员完成国家自然科学基金三项，主持广东省自然科学基金项目3项，参与2项，主持广州市中药现代化重大专项1项；公开发表科研论文30余篇，SCI收录4篇。参编学术专著两部。负责核苷类抗乙型肝炎一类新药阿德福韦酯的药效学评价并于2003年7月获临床批文。另外，负责三个中药新药的主要药效学评价并已经通过省级鉴定。申请专利3项。\r\n近年主要在抗乙型肝炎病毒研究领域和美国Thomas Jefferson 大学的Dr. Mark Feitelson教授、中国科学院昆明植物研究所的陈纪军教授香港浸会大学徐敏博士等建立了稳定的研究伙伴关系，并同北京大学分子医学研究中心李刚教授在内啡肽类物质对SIV感染导致引起宿主细胞凋亡机制等领域进行了合作研究。\r\n开设并主讲《病毒学理论与技术》研究生课程一门，每学年30学时，教学效果良好。并编写研究生用教材一部。已独立招收硕士研究生8名并具体负责指导4名博士生学位论文实验。指导七年制学生参加“挑战杯”竞赛获得2003年省级二等奖。', '8', '1');
INSERT INTO `researchplatform_member` VALUES ('8', '胡研究员', '胡英杰研究员，男，1962年生，祖籍湖南。广州中医药大学热带医学研究所副所长兼药学研究室主任，博士研究生导师，广东省新药审评专家库专家，广东省、广州市科技项目评审专家。1983年毕业于上海第一医学院药物化学专业（学士）；1988年毕业于中国科学院昆明植物研究所植物化学专业（硕士）；2005年毕业于广州中医药大学（博士）。1988年起在西南林学院任教植物化学、有机化学、药用植物资源开发利用学等课程，并从事多项国家级、部省级项目植物化学方面的研究；1996年起在广州中医药大学热带医学研究所从事药物活性中草药研究。研究领域涉及创新中药新药研发和中草药化学成分结构与药物活性研究，特别是治疗艾滋病中药与抗肿瘤活性天然产物研究。作为编委和副主编编写《植物化学》和《药用植物资源开发利用学》等2本高校教材。参加或主持国家级和省部级科研项目10项；在Phytochemistry、化学学报、中草药等药学类期刊发表论文30多篇，其中在SCI收录期刊8篇。获得发明专利授权3项。2002年和2005年获广东省科学技术奖二等奖各1项。', '9', '1');
INSERT INTO `researchplatform_member` VALUES ('9', '黄副研究员', '黄玲，女，1963年11月生，江西省赣州市人，副研究员。主要研究方向：中药药理与毒理，中药对免疫性疾病的药效学和安全性评价及机制研究。\r\n2003年9月之前在广州中医药大学热带医学研究所工作，任药理毒理研究室副主任，主要从事抗疟疾、肝炎、艾滋病、自身免疫性疾病等的药效学和安全性评价。参与2个抗疟疾新药Artecom和Artekin的临床前研究，均已通过国家审批，其中Artekin的安全性评价为试验负责人，该药已获WHO推荐。现在《广州中医药大学学报》编辑部负责实验研究论文的编辑工作。\r\n在国家及省级杂志发表论文共26篇。主持厅局级课题3项，参与国家及省部级课题4项。\r\n已招收研究生人数：3人', '10', '1');

-- ----------------------------
-- Table structure for researchplatform_permission
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_permission`;
CREATE TABLE `researchplatform_permission` (
  `id` int(11) NOT NULL auto_increment,
  `type` varchar(20) NOT NULL,
  `write` tinyint(1) NOT NULL,
  `read` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_permission
-- ----------------------------
INSERT INTO `researchplatform_permission` VALUES ('1', 'SU', '1', '1');
INSERT INTO `researchplatform_permission` VALUES ('2', 'Ma', '1', '1');
INSERT INTO `researchplatform_permission` VALUES ('3', 'Lab', '0', '1');
INSERT INTO `researchplatform_permission` VALUES ('4', 'Co', '0', '0');

-- ----------------------------
-- Table structure for researchplatform_project
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_project`;
CREATE TABLE `researchplatform_project` (
  `id` int(11) NOT NULL auto_increment,
  `introduction` longtext NOT NULL,
  `biology_id` int(11) NOT NULL,
  `database` longtext NOT NULL,
  `progress_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `biology_id` (`biology_id`),
  UNIQUE KEY `progress_id` (`progress_id`),
  CONSTRAINT `progress_id_refs_id_0caa3cec` FOREIGN KEY (`progress_id`) REFERENCES `researchplatform_projectprogress` (`id`),
  CONSTRAINT `biology_id_refs_id_dabeebea` FOREIGN KEY (`biology_id`) REFERENCES `researchplatform_biologicalname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_project
-- ----------------------------
INSERT INTO `researchplatform_project` VALUES ('1', '热带医学是由热带病和公共卫生 2 部分组成，是研究发生或发现于热带、亚热带地区各种疾病的诊断、治疗、预防以及如何控制和消灭这些疾病的科学，是集基础医学、临床医学和预防医学为一体的综合性学科，涉及生物学、遗传学、寄生虫学、公共卫生学等多门交叉学科，既包括自然科学又包括社会科学。热带病一直是热带医学的研究重点，过去将热带病理解为寄生虫病，事实上，寄生虫病仅是热带病的重要组成部分，热带病还涉及许多由其他病原生物引起的感染性疾病。世界卫生组织认定了 8 种最重要、最常见的热带病：疟疾、血吸虫病、丝虫病、黑热病、锥虫病、麻风病、肺结核病和登革热，这些疾病是热带医学现在和今后研究的重点。\r\n世界经济和工业全球化进程的加快，全球气候的变暖，流动人口数量的急剧增加，皆使热带病发生的范围进一步扩大，同时，热带病防治中遇到的诸如贫穷、教育、初级卫生保健、传递系统、基础设施等制约热带病研究的问题仍然无法解决，因此，不仅要注重热带病的临床防治工作，还需要研究该病发生或流行与公共卫生意识与设施、环境条件及人们生活劳作习惯间的关系，是一项需要全民参与的社会工程。\r\n随着全球经济和科技的发展，社会的进步，很多热带病得到控制。但是，新发传染病不断涌现，一些原已控制的传染病仍有潜在流行趋势，不断关注新问题，努力探索热带病防治的新理念、诊断的新方法和提高治疗水平，是我们追求的目标。\r\n热带医学的研究现状世纪 70 年代以来，病原体生物学研究从细胞水平发展到基因水平，对细胞型病原体的抗生素类研发已经达到了成熟阶段，随着药理学先进技术和测试方法的应用，抗生素及化学药物治愈了许多传染性热带病疾病，化学性杀虫剂和消毒剂对节肢动物传播媒介和疫源地病原体进行有效杀灭和消毒，中断了传播环节，有效防治传染病。在免疫学领域内，用来预防不同传染病的新疫苗被发明，不但有控制白喉、脊髓灰质炎、麻疹等传染病的疫苗，而且也有效控制了须具传播媒介传播的黑热病、丝虫病、疟疾以及土源性和食源性寄生虫等疾病。\r\n分子生物学技术日新月异发展，使原始的病原检测发展为免疫学方法和核酸技术。基因探针和聚合酶链反应凭借快速、敏感性高、特异性强的特点，已经广泛用于病毒、细菌、寄生虫等的病原检测、药物敏感性实验、疗效监测和疾病流行病学研究中，先进的纳米技术和DNA 芯片逐渐应用于病毒和细菌的检测研究，DNA 疫苗的研制、转基因技术也在多项病毒抗原疫苗生产方面取得了进展。地理信息系统和遥感技术已经用于媒传疾病及媒介的监测，在疾病流行的早期监督和预警、危险地区的动态适时监测等方面发挥了极大作用。\r\n世纪初成立的英国皇家热带医学及卫生学会、澳大利亚寄生虫学会和美国热带医学学会均致力于促进和交流有关热带医学的研究、热带病的控制、治疗、预防等。我国近年来相继成立了多所热带医学研究所，如北京热带医学研究所、南方医科大学热带医学研究所、广州中医药大学热带医学研究所、海南热带病研究所等科研机构，在我国热带医学的临床与科研工作方面做出了突出的贡献。\r\n热带医学研究不可“高枕无忧预防传染病的疫苗不断研制应用，抗生素和杀虫剂的广泛开发使用，使传染病发病率和病死率已经维持相对稳定的低水平，于是很多人认为“传染病的问题已初步解决”或“人类与疾病斗争的重点应该转移至位居死因前列的非传染性慢性病方面”。事实上，由于近年来对自然疫源地的过度开发和对野生动物的滥杀，人类饮食习惯改变，气候、生态环境变化，抗生素和杀虫剂的滥用等多方面因素，促使病原物种变异，传染病疫情更加复杂，多种传染病仍未得到有效控制，且有进一步扩大流行趋势。例如血吸虫病、班氏丝虫病等寄生虫病流行于全世界 100 多个国家和地区，威胁 40％的地球人口，病毒病和细菌病等其他热带疾病发病迅猛，传染源、媒介昆虫活动途迁范围扩大，热带和非热带地区的传染病已很难严格区分，原已控制的传染病如疟疾、结核病等死灰复燃，重新肆虐人类。同时，也引发了一些新的人兽共患传染病，由于人群对新发现的传染病普遍易感，且无有效防治用药和措施，使病死率均高，人类面临着热带病新的严重挑战。2003 年在全球迅速扩散流行的急性传染性非典型肺炎(sARs)，虽然得到了及时控制并最后扑灭，但也说明需要时刻重视，不断加强公共卫生的防御系统及对突变疾病事件控制能力。热带病的侵袭对社会经济的发展和稳定产生极大破坏，对人类生存和发展构成严重威胁，是当今重大的公共卫生问题和社会问题。\r\n很多老的传染病被控制和消灭，新的传染病又被发现，人类消灭传染病的速度远远落后于新传染病出现的速度。热带病的防治任重而道远，我们应有保护全人类健康的长期性、艰巨性和复杂性的基本防制策略，对病原体病原学持续研究，研制有效的具有预防性和治疗性的免疫疫苗，不断及时发现新传染病，不断建立更敏感、特异的诊断技术。\r\n关注研究热点，展望未来发展趋势免疫预防工作将成为 21 世纪热带病防治工作的一个重要方面，HIV、囊虫病、疟疾、血吸虫病、弓形虫病、登革热、甲型和戊型肝炎作为现在主要影响我国人民健康的热带病，将成为攻关研究的重点，针对这些疾病研制重组疫苗、多肽疫苗、DNA 疫苗是今后的研究热点。\r\n随着分子生物学、细胞生物学、基因技术的飞速发展，后基因组学、比较基因组学和蛋白质组学的研究以及生物信息学、细胞微生物学将成为热带医学重要的研究手段；生物芯片技术研究重点将集中在感染性疾病诊断芯片、病原耐药谱监测芯片、遗传病检测和诊断芯片等，其应用前景十分广阔；利用最先进的纳米技术制造的生物传感器芯片，也将有利于今后的常规临床生化反应和代谢产物的检测；感染性疾病的基因工程疫苗的研究将全面走向开发应用，对肝炎、艾滋病、血吸虫病等的预防和治疗将起巨大的作用。\r\n\r\n在热带病的监测和防治方面，充分利用先进的监测技术，建立健全热带病监测评估体系和网络系统，对新发现和再出现传染病的全球监测系统是今后的发展趋势。进一步加强遥感技术和远程医疗技术的研究，将有利于提高疾病监测和防治水平刊，建立和分析各种生物体基因生命图谱，获取最根本原因证据，将有利于填补热带病防制措施和技术中的空白。\r\n中国传统医学在热带病防治中也将发挥重要的作用，将中西医结合、中药现代化等先进技术和理论运用于热带医学的研究中，使热带病的防治方法更新、更多、更有效，也将成为我国发展特色医疗优势的一个重要方面。国家应进一步加强疾病防治决策研究的力度，针对突发事件，不断总结经验，补充、完善具体方法，制定科学和明确的任务和措施。同时，加强健康教育与健康促进工作，普及卫生防病知识，动员社会全员参与，提高个人防护意识。将热带病的防治建成一个社会系统工程，也将成为今后我国热带医学发展的新策略。\r\n《东南哑热带病和卫生学杂志》社论指出：“社会进步、经济发展、文化提高、自我保健意识的建立，人类心理素质的增强，在控制传染病上发挥的作用比医学科学更加霞要。”改变热带病流行地区经济文化落后的现状，重视社会预防、康复医学、公共卫生教育，发展倡导全社会尊重、保护和爱护自然，达到人与自然的真正和谐，真正使热带病销声匿迹。', '1', '无', '1');

-- ----------------------------
-- Table structure for researchplatform_projectprogress
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_projectprogress`;
CREATE TABLE `researchplatform_projectprogress` (
  `id` int(11) NOT NULL auto_increment,
  `content` longtext NOT NULL,
  `abstract` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_projectprogress
-- ----------------------------
INSERT INTO `researchplatform_projectprogress` VALUES ('1', '进行中', '无');

-- ----------------------------
-- Table structure for researchplatform_project_publisharticles
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_project_publisharticles`;
CREATE TABLE `researchplatform_project_publisharticles` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `project_id` (`project_id`,`article_id`),
  KEY `ResearchPlatform_project_publishArticles_37952554` (`project_id`),
  KEY `ResearchPlatform_project_publishArticles_e669cc35` (`article_id`),
  CONSTRAINT `article_id_refs_id_bf8a977c` FOREIGN KEY (`article_id`) REFERENCES `researchplatform_article` (`id`),
  CONSTRAINT `project_id_refs_id_09909b28` FOREIGN KEY (`project_id`) REFERENCES `researchplatform_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_project_publisharticles
-- ----------------------------
INSERT INTO `researchplatform_project_publisharticles` VALUES ('1', '1', '1');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('2', '1', '2');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('3', '1', '3');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('4', '1', '4');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('5', '1', '5');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('6', '1', '6');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('7', '1', '7');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('8', '1', '8');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('9', '1', '9');
INSERT INTO `researchplatform_project_publisharticles` VALUES ('10', '1', '10');

-- ----------------------------
-- Table structure for researchplatform_project_relatedarticles
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_project_relatedarticles`;
CREATE TABLE `researchplatform_project_relatedarticles` (
  `id` int(11) NOT NULL auto_increment,
  `project_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `project_id` (`project_id`,`article_id`),
  KEY `ResearchPlatform_project_relatedArticles_37952554` (`project_id`),
  KEY `ResearchPlatform_project_relatedArticles_e669cc35` (`article_id`),
  CONSTRAINT `article_id_refs_id_03361aad` FOREIGN KEY (`article_id`) REFERENCES `researchplatform_article` (`id`),
  CONSTRAINT `project_id_refs_id_d54f28a0` FOREIGN KEY (`project_id`) REFERENCES `researchplatform_project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_project_relatedarticles
-- ----------------------------

-- ----------------------------
-- Table structure for researchplatform_team
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_team`;
CREATE TABLE `researchplatform_team` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(10) NOT NULL,
  `isMain` tinyint(1) NOT NULL,
  `introduction` longtext NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_team
-- ----------------------------
INSERT INTO `researchplatform_team` VALUES ('1', '中大团队', '1', '');

-- ----------------------------
-- Table structure for researchplatform_team_publisharticles
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_team_publisharticles`;
CREATE TABLE `researchplatform_team_publisharticles` (
  `id` int(11) NOT NULL auto_increment,
  `team_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `team_id` (`team_id`,`article_id`),
  KEY `ResearchPlatform_team_publishArticles_95e8aaa1` (`team_id`),
  KEY `ResearchPlatform_team_publishArticles_e669cc35` (`article_id`),
  CONSTRAINT `article_id_refs_id_9e9f1cf7` FOREIGN KEY (`article_id`) REFERENCES `researchplatform_article` (`id`),
  CONSTRAINT `team_id_refs_id_ea75f1e4` FOREIGN KEY (`team_id`) REFERENCES `researchplatform_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_team_publisharticles
-- ----------------------------

-- ----------------------------
-- Table structure for researchplatform_usertype
-- ----------------------------
DROP TABLE IF EXISTS `researchplatform_usertype`;
CREATE TABLE `researchplatform_usertype` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `permission_id_refs_id_c5b427c6` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_c5b427c6` FOREIGN KEY (`permission_id`) REFERENCES `researchplatform_permission` (`id`),
  CONSTRAINT `user_id_refs_id_92324a19` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of researchplatform_usertype
-- ----------------------------
INSERT INTO `researchplatform_usertype` VALUES ('1', '1', '1');
INSERT INTO `researchplatform_usertype` VALUES ('2', '2', '3');
INSERT INTO `researchplatform_usertype` VALUES ('3', '3', '3');
INSERT INTO `researchplatform_usertype` VALUES ('4', '4', '3');
INSERT INTO `researchplatform_usertype` VALUES ('5', '5', '3');
INSERT INTO `researchplatform_usertype` VALUES ('6', '6', '3');
INSERT INTO `researchplatform_usertype` VALUES ('7', '7', '3');
INSERT INTO `researchplatform_usertype` VALUES ('8', '8', '3');
INSERT INTO `researchplatform_usertype` VALUES ('9', '9', '3');
INSERT INTO `researchplatform_usertype` VALUES ('10', '10', '3');

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(128) NOT NULL,
  `user_id` int(11) default NULL,
  `url_name` varchar(64) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `xadmin_bookmark_6340c63c` (`user_id`),
  KEY `xadmin_bookmark_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_af66fd92` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_91d2dce8` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `xadmin_usersettings_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_a4128191` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', '1', 'dashboard:home:pos', '');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `xadmin_userwidget_6340c63c` (`user_id`),
  CONSTRAINT `user_id_refs_id_97371ff7` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
SET FOREIGN_KEY_CHECKS=1;
