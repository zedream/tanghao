/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : th

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 28/06/2020 11:13:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for extrainfo
-- ----------------------------
DROP TABLE IF EXISTS `extrainfo`;
CREATE TABLE `extrainfo`  (
  `education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `study_years` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `school` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_years` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of extrainfo
-- ----------------------------
INSERT INTO `extrainfo` VALUES ('本科', '2014-2018', '软件工程', '西南科技大学', '爱德数智,中亚集团', '2019.3-2019.4,2019.4-2020.4', '前端开发工程师,前端开发工程师', 'tanghao');
INSERT INTO `extrainfo` VALUES ('无', '0', '无', '无', '无', '0', '无', 'zzq');
INSERT INTO `extrainfo` VALUES ('无', '0', '无', '无', '无', '0', '无', 'zj');
INSERT INTO `extrainfo` VALUES ('硕士', '0', '祖安骂人公主', '无', '祖安骂人公司', '0', '祖安公主', 'xjx');
INSERT INTO `extrainfo` VALUES ('无', '0', '无', '无', '无', '0', '无', 'hdy');

SET FOREIGN_KEY_CHECKS = 1;
