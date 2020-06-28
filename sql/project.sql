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

 Date: 28/06/2020 11:14:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `period` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `duty` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `work_content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES ('项目一,项目二', '2019.3-2019.4,2019.5-2019.6', '前端开发\n前端开发,前端开发', '写代码,写代码', 1, 'tanghao');
INSERT INTO `project` VALUES ('无', '0', '无', '无', 3, 'zzq');
INSERT INTO `project` VALUES ('无', '0', '无', '无', 4, 'zj');
INSERT INTO `project` VALUES ('无', '0', '无', '无', 5, 'xjx');
INSERT INTO `project` VALUES ('无', '0', '无', '无', 6, 'hdy');

SET FOREIGN_KEY_CHECKS = 1;
