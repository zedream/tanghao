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

 Date: 28/06/2020 11:14:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `hometown` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `residence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('黄迪莹', '123456', 'hdy', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502152206.jpg', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502152210.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('汤豪', '123456', 'tanghao', 'http://q9kx1a1ol.bkt.clouddn.com/Desert.jpg', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200430193459.jpg', 24, '四川省绵阳市盐亭县', '汉族', '广东省深圳市沙井街道壆岗社区');
INSERT INTO `user` VALUES ('汤豪的爹', '123456', 'xjx', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200503123747.jpg', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200503123752.jpg', 18, '祖安', '祖安', '祖安');
INSERT INTO `user` VALUES ('赵阿娇', '123456', 'zj', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502144807.jpg', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200503124128.jpg', NULL, NULL, NULL, NULL);
INSERT INTO `user` VALUES ('赵子琪', '123456', 'zzq', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502145408.jpg', 'http://q9kx1a1ol.bkt.clouddn.com/微信图片_20200502145416.jpg', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
