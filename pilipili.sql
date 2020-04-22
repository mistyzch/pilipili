/*
 Navicat Premium Data Transfer

 Source Server         : mysql连接
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : pilipili

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 22/04/2020 09:12:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for p_category
-- ----------------------------
DROP TABLE IF EXISTS `p_category`;
CREATE TABLE `p_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(11) NULL DEFAULT NULL,
  `english_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `category_ibfk_1`(`parent_id`) USING BTREE,
  CONSTRAINT `p_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `p_category` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_category
-- ----------------------------
INSERT INTO `p_category` VALUES (1, '鬼畜', '鬼畜', NULL, 'ghost');
INSERT INTO `p_category` VALUES (2, '游戏', '游戏', NULL, 'game');
INSERT INTO `p_category` VALUES (3, '电影', '电影', NULL, 'fime');
INSERT INTO `p_category` VALUES (4, '动画', '动画', NULL, 'animation');
INSERT INTO `p_category` VALUES (5, '舞蹈', '舞蹈', NULL, 'dance');

-- ----------------------------
-- Table structure for p_user
-- ----------------------------
DROP TABLE IF EXISTS `p_user`;
CREATE TABLE `p_user`  (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gender` int(1) NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `tel` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `portraitUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_user
-- ----------------------------
INSERT INTO `p_user` VALUES (2, 'goast', 'E10ADC3949BA59ABBE56E057F20F883E', 0, 12, '15242163245', 'static/images/akari.jpg');
INSERT INTO `p_user` VALUES (3, 'misty', 'E10ADC3949BA59ABBE56E057F20F883E', 1, 12, '15242152365', '/imgs/portrait/142919-1535610559a83a-1577948116226.jpg');
INSERT INTO `p_user` VALUES (4, '1', 'C4CA4238A0B923820DCC509A6F75849B', 0, 12, '1', 'static/images/akari.jpg');
INSERT INTO `p_user` VALUES (5, '1111', 'B59C67BF196A4758191E42F76670CEBA', 0, 12, '2544', 'static/images/akari.jpg');
INSERT INTO `p_user` VALUES (6, '1634064086', 'E10ADC3949BA59ABBE56E057F20F883E', 0, 12, '1165', 'static/images/akari.jpg');
INSERT INTO `p_user` VALUES (8, '123456', 'C4CA4238A0B923820DCC509A6F75849B', 0, 12, '1', '/imgs/portrait/IMG_20170612_101314-1577878336838.jpg');
INSERT INTO `p_user` VALUES (9, 'aaaaaaa', 'E10ADC3949BA59ABBE56E057F20F883E', 0, 12, '12536524521', 'static/images/akari.jpg');

-- ----------------------------
-- Table structure for p_video
-- ----------------------------
DROP TABLE IF EXISTS `p_video`;
CREATE TABLE `p_video`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `desc` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '视频简介',
  `releaseDate` datetime(0) NULL DEFAULT NULL,
  `clickTimes` int(11) NULL DEFAULT NULL,
  `pictureUrls` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片路径',
  `videoUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `video_length` time(0) NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `p_video_ibfk_2`(`category_id`) USING BTREE,
  CONSTRAINT `p_video_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `p_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `p_video_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `p_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of p_video
-- ----------------------------
INSERT INTO `p_video` VALUES (1, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 158, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/ghost/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:00:30', NULL);
INSERT INTO `p_video` VALUES (2, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 104, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/ghost/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (3, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 105, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/ghost/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (4, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 111, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/ghost/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (67, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 108, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/ghost/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (69, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 103, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 2, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (70, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 2, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (71, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 2, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (72, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 2, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (73, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 102, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 3, '00:00:30', NULL);
INSERT INTO `p_video` VALUES (74, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 3, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (75, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 3, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (76, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 100, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 3, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (77, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 3, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (78, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 103, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 4, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (79, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 4, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (80, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 4, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (81, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 102, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 4, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (82, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 4, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (83, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 5, '00:00:30', NULL);
INSERT INTO `p_video` VALUES (84, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 5, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (85, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 5, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (86, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 100, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 5, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (87, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 102, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 5, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (88, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 103, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (96, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 101, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (97, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 100, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (98, '华农兄弟', '华农兄弟和竹鼠的故事', '2019-12-26 15:19:48', 100, '/imgs/cover/ghost/华农兄弟.PNG', '/videos/0001.哔哩哔哩-华农兄弟：摘点大叔家的香菇，捉2只兄弟家的小鸡，做美味的小鸡炖蘑菇.mp4', 1, 3, 1, '00:38:53', NULL);
INSERT INTO `p_video` VALUES (99, '266', '262', NULL, NULL, '/imgs/cover/animation/video_20191231_145841-1577775752298.jpg', '/videos/animation/video_20191231_145841-1577775752298.mp4', NULL, 3, 4, '00:00:01', 'video_20191231_145841-1577775752298.mp4');
INSERT INTO `p_video` VALUES (100, '5645', '11515', NULL, NULL, '/imgs/cover/ghost/video_20191231_145841-1577777079795.jpg', '/videos/ghost/video_20191231_145841-1577777079795.mp4', NULL, 3, 1, '00:00:01', 'video_20191231_145841-1577777079795.mp4');
INSERT INTO `p_video` VALUES (101, '2223', '23232', NULL, NULL, '/imgs/cover/animation/video_20191231_145841-1577777129498.jpg', '/videos/animation/video_20191231_145841-1577777129498.mp4', NULL, 3, 4, '00:00:01', 'video_20191231_145841-1577777129498.mp4');
INSERT INTO `p_video` VALUES (102, 'afa ', 'dadada', NULL, NULL, '/imgs/cover/dance/video_20191231_145841-1577777150665.jpg', '/videos/dance/video_20191231_145841-1577777150665.mp4', NULL, 3, 5, '00:00:01', 'video_20191231_145841-1577777150665.mp4');
INSERT INTO `p_video` VALUES (103, 'gsegs', 'sfsfes', NULL, NULL, '/imgs/cover/game/video_20191231_145841-1577777297307.jpg', '/videos/game/video_20191231_145841-1577777297307.mp4', NULL, 3, 2, '00:00:01', 'video_20191231_145841-1577777297307.mp4');
INSERT INTO `p_video` VALUES (104, 'ywtwer', 'aafa', NULL, NULL, '/imgs/cover/fime/video_20191231_145841-1577777336364.jpg', '/videos/fime/video_20191231_145841-1577777336364.mp4', NULL, 3, 3, '00:00:01', 'video_20191231_145841-1577777336364.mp4');
INSERT INTO `p_video` VALUES (105, 'dada', 'dawda', '2019-12-31 15:48:35', NULL, '/imgs/cover/dance/video_20191231_145841-1577778505807.jpg', '/videos/dance/video_20191231_145841-1577778505807.mp4', NULL, 3, 5, '00:00:01', 'video_20191231_145841-1577778505807.mp4');
INSERT INTO `p_video` VALUES (106, 'adadaw', 'agaga', '2020-01-01 19:31:57', NULL, '/imgs/cover/ghost/IMG_20170614_122316-1577878314256.jpg', '/videos/ghost/IMG_20170614_122316-1577878314256.mp4', NULL, 8, 1, '00:00:02', 'IMG_20170614_122316-1577878314256.mp4');
INSERT INTO `p_video` VALUES (107, '大大', '大大哇', '2020-01-02 14:54:52', NULL, '/imgs/cover/game/20191220_172754-1577948075082.jpg', '/videos/game/20191220_172754-1577948075082.mp4', NULL, 3, 2, '00:07:10', '20191220_172754-1577948075082.mp4');
INSERT INTO `p_video` VALUES (108, '曾春华', '达娃大', '2020-01-18 22:15:20', NULL, '/imgs/cover/fime/dada-1579356918146.jpg', '/videos/fime/dada-1579356918146.mp4', NULL, 3, 3, '00:00:02', 'dada-1579356918146.mp4');

-- ----------------------------
-- Table structure for user_collection
-- ----------------------------
DROP TABLE IF EXISTS `user_collection`;
CREATE TABLE `user_collection`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `video_id`(`video_id`) USING BTREE,
  CONSTRAINT `user_collection_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `p_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_collection_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `p_video` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_collection
-- ----------------------------
INSERT INTO `user_collection` VALUES (17, '2019-12-27 21:09:51', 0, 2, 1);
INSERT INTO `user_collection` VALUES (18, '2019-12-28 10:51:40', 0, 2, 3);
INSERT INTO `user_collection` VALUES (19, '2019-12-28 13:58:05', 1, 2, 69);
INSERT INTO `user_collection` VALUES (20, '2019-12-28 15:16:13', 0, 2, 87);
INSERT INTO `user_collection` VALUES (21, '2019-12-31 10:34:22', 1, 3, 78);
INSERT INTO `user_collection` VALUES (22, '2019-12-31 10:59:12', 0, 3, 1);
INSERT INTO `user_collection` VALUES (23, '2019-12-31 13:30:00', 1, 3, 67);
INSERT INTO `user_collection` VALUES (24, '2020-01-01 19:04:01', 1, 6, 1);
INSERT INTO `user_collection` VALUES (25, '2020-01-01 19:26:24', 1, 3, 4);
INSERT INTO `user_collection` VALUES (26, '2020-01-18 22:17:34', 1, 3, 108);

-- ----------------------------
-- Table structure for user_comments
-- ----------------------------
DROP TABLE IF EXISTS `user_comments`;
CREATE TABLE `user_comments`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(7) NOT NULL,
  `video_id` int(11) NOT NULL,
  `comment_date` datetime(0) NOT NULL,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `video_id`(`video_id`) USING BTREE,
  CONSTRAINT `user_comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `p_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_comments_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `p_video` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_comments
-- ----------------------------
INSERT INTO `user_comments` VALUES (64, 3, 1, '2019-12-28 16:15:28', 'dadada', NULL);
INSERT INTO `user_comments` VALUES (65, 3, 1, '2019-12-28 16:15:39', '44', NULL);
INSERT INTO `user_comments` VALUES (66, 3, 1, '2019-12-28 16:22:37', '45454545', NULL);
INSERT INTO `user_comments` VALUES (67, 3, 4, '2019-12-28 16:36:12', 'dadadada', NULL);
INSERT INTO `user_comments` VALUES (68, 2, 4, '2019-12-28 16:48:40', 'dada', NULL);
INSERT INTO `user_comments` VALUES (69, 2, 4, '2019-12-28 16:49:27', 'dada', NULL);
INSERT INTO `user_comments` VALUES (70, 2, 75, '2019-12-28 16:52:32', 'dadad', NULL);
INSERT INTO `user_comments` VALUES (71, 2, 75, '2019-12-28 16:52:41', 'dadad', NULL);
INSERT INTO `user_comments` VALUES (72, 2, 3, '2019-12-28 16:53:54', '155', NULL);
INSERT INTO `user_comments` VALUES (73, 3, 4, '2019-12-28 17:19:25', '111', NULL);
INSERT INTO `user_comments` VALUES (74, 3, 4, '2019-12-28 17:19:34', '111', NULL);
INSERT INTO `user_comments` VALUES (75, 3, 4, '2019-12-28 17:19:35', '111', NULL);
INSERT INTO `user_comments` VALUES (76, 3, 4, '2019-12-28 17:19:36', '111', NULL);
INSERT INTO `user_comments` VALUES (77, 3, 4, '2019-12-28 17:19:37', '111', NULL);
INSERT INTO `user_comments` VALUES (78, 3, 4, '2019-12-28 17:19:37', '111', NULL);
INSERT INTO `user_comments` VALUES (79, 3, 4, '2019-12-28 17:19:38', '111', NULL);
INSERT INTO `user_comments` VALUES (80, 3, 1, '2019-12-31 10:15:32', '54545', NULL);
INSERT INTO `user_comments` VALUES (81, 3, 1, '2019-12-31 10:15:34', '54545', NULL);
INSERT INTO `user_comments` VALUES (82, 3, 1, '2019-12-31 10:15:34', '54545', NULL);
INSERT INTO `user_comments` VALUES (83, 3, 1, '2019-12-31 10:15:34', '54545', NULL);
INSERT INTO `user_comments` VALUES (84, 3, 1, '2019-12-31 10:15:35', '54545', NULL);
INSERT INTO `user_comments` VALUES (85, 3, 1, '2019-12-31 10:15:35', '54545', NULL);
INSERT INTO `user_comments` VALUES (86, 3, 1, '2019-12-31 10:15:35', '54545', NULL);
INSERT INTO `user_comments` VALUES (87, 3, 1, '2019-12-31 10:15:35', '54545', NULL);
INSERT INTO `user_comments` VALUES (88, 3, 1, '2019-12-31 10:15:35', '54545', NULL);
INSERT INTO `user_comments` VALUES (89, 3, 84, '2019-12-31 10:16:34', '2616', NULL);
INSERT INTO `user_comments` VALUES (90, 3, 78, '2019-12-31 10:34:29', '1515', NULL);
INSERT INTO `user_comments` VALUES (91, 3, 1, '2020-01-01 18:39:31', 'sxczc', NULL);
INSERT INTO `user_comments` VALUES (92, 3, 1, '2020-01-01 18:39:35', 'sxczcczczsczczsczsczsc', NULL);
INSERT INTO `user_comments` VALUES (93, 3, 4, '2020-01-01 19:26:27', '1515', NULL);
INSERT INTO `user_comments` VALUES (94, 3, 1, '2020-01-02 08:55:03', 'jsoifsofsfsfesfsfse', NULL);
INSERT INTO `user_comments` VALUES (95, 3, 1, '2020-01-02 08:55:06', 'jsoifsofsfsfesfsfserwrwrwtw', NULL);
INSERT INTO `user_comments` VALUES (96, 3, 1, '2020-01-02 08:55:09', 'jsoifsofsfsfesfsfserwrwrwtw', NULL);
INSERT INTO `user_comments` VALUES (97, 3, 1, '2020-01-02 14:51:59', 'ffafa', NULL);
INSERT INTO `user_comments` VALUES (98, 3, 1, '2020-01-02 14:53:16', '66', NULL);
INSERT INTO `user_comments` VALUES (99, 3, 108, '2020-01-18 22:17:17', '15155', NULL);
INSERT INTO `user_comments` VALUES (100, 3, 108, '2020-01-18 22:17:21', '15155', NULL);
INSERT INTO `user_comments` VALUES (101, 3, 108, '2020-01-18 22:17:28', '15、6、\n6、\n76\n', NULL);

-- ----------------------------
-- Table structure for user_likes
-- ----------------------------
DROP TABLE IF EXISTS `user_likes`;
CREATE TABLE `user_likes`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime(0) NULL DEFAULT NULL,
  `state` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `video_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `video_id`(`video_id`) USING BTREE,
  CONSTRAINT `user_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `p_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_likes_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `p_video` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_likes
-- ----------------------------
INSERT INTO `user_likes` VALUES (44, '2019-12-27 20:55:49', 1, 2, 1);
INSERT INTO `user_likes` VALUES (46, '2019-12-28 10:51:50', 0, 2, 3);
INSERT INTO `user_likes` VALUES (47, '2019-12-28 13:58:11', 1, 2, 69);
INSERT INTO `user_likes` VALUES (48, '2019-12-28 15:16:06', 0, 2, 87);
INSERT INTO `user_likes` VALUES (49, '2019-12-28 16:49:05', 0, 2, 4);
INSERT INTO `user_likes` VALUES (50, '2019-12-31 10:16:30', 1, 2, 84);
INSERT INTO `user_likes` VALUES (51, '2019-12-31 10:34:24', 1, 3, 78);
INSERT INTO `user_likes` VALUES (52, '2019-12-31 10:59:01', 1, 3, 1);
INSERT INTO `user_likes` VALUES (53, '2019-12-31 13:29:59', 1, 3, 67);
INSERT INTO `user_likes` VALUES (54, '2019-12-31 16:33:59', 1, 3, 101);
INSERT INTO `user_likes` VALUES (55, '2020-01-01 19:03:48', 1, 6, 1);
INSERT INTO `user_likes` VALUES (56, '2020-01-01 19:26:22', 1, 3, 4);
INSERT INTO `user_likes` VALUES (57, '2020-01-18 22:17:32', 1, 3, 108);

-- ----------------------------
-- Table structure for video_upload
-- ----------------------------
DROP TABLE IF EXISTS `video_upload`;
CREATE TABLE `video_upload`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(7) NOT NULL,
  `video_id` int(11) NOT NULL,
  `upload_date` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `video_upload_ibfk_1`(`user_id`) USING BTREE,
  INDEX `video_upload_ibfk_2`(`video_id`) USING BTREE,
  CONSTRAINT `video_upload_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `p_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `video_upload_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `p_video` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_upload
-- ----------------------------
INSERT INTO `video_upload` VALUES (69, 3, 105, '2019-12-31 15:48:36');
INSERT INTO `video_upload` VALUES (70, 8, 106, '2020-01-01 19:31:57');
INSERT INTO `video_upload` VALUES (71, 3, 107, '2020-01-02 14:54:52');
INSERT INTO `video_upload` VALUES (72, 3, 108, '2020-01-18 22:15:20');

-- ----------------------------
-- Table structure for view_record
-- ----------------------------
DROP TABLE IF EXISTS `view_record`;
CREATE TABLE `view_record`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(7) NOT NULL,
  `video_id` int(11) NOT NULL,
  `view_date` date NOT NULL,
  `view_progress` time(0) NULL DEFAULT '00:00:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
