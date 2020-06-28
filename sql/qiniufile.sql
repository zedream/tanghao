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

 Date: 28/06/2020 11:14:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qiniufile
-- ----------------------------
DROP TABLE IF EXISTS `qiniufile`;
CREATE TABLE `qiniufile`  (
  `file_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`file_path`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qiniufile
-- ----------------------------
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/Chrysanthemum.jpg', 'Chrysanthemum.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/Hydrangeas.jpg', 'Hydrangeas.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/Jellyfish.jpg', 'Jellyfish.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/Koala.jpg', 'Koala.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/Penguins.jpg', 'Penguins.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/Tulips.jpg', 'Tulips.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200430193459.jpg', '微信图片_20200430193459.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502144757.jpg', '微信图片_20200502144757.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502144807.jpg', '微信图片_20200502144807.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502145408.jpg', '微信图片_20200502145408.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502145416.jpg', '微信图片_20200502145416.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502152154.jpg', '微信图片_20200502152154.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502152159.jpg', '微信图片_20200502152159.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502152206.jpg', '微信图片_20200502152206.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502152210.jpg', '微信图片_20200502152210.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200503123747.jpg', '微信图片_20200503123747.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200503123752.jpg', '微信图片_20200503123752.jpg');
INSERT INTO `qiniufile` VALUES ('http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200503124128.jpg', '微信图片_20200503124128.jpg');

SET FOREIGN_KEY_CHECKS = 1;
