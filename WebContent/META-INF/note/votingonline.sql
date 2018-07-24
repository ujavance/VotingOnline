/*
 Navicat Premium Data Transfer

 Source Server         : demo
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : votingonline

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 24/07/2018 13:45:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_folder
-- ----------------------------
DROP TABLE IF EXISTS `t_folder`;
CREATE TABLE `t_folder`  (
  `folderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `folderName` char(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`folderId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_folder
-- ----------------------------
INSERT INTO `t_folder` VALUES ('1', '默认');
INSERT INTO `t_folder` VALUES ('2', '其他');

-- ----------------------------
-- Table structure for t_folder_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `t_folder_questionnaire`;
CREATE TABLE `t_folder_questionnaire`  (
  `folderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionnaireId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`folderId`, `questionnaireId`) USING BTREE,
  INDEX `FK_Reference_7`(`questionnaireId`) USING BTREE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`folderId`) REFERENCES `t_folder` (`folderId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`questionnaireId`) REFERENCES `t_questionnaire` (`questionnaireId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_folder_questionnaire
-- ----------------------------
INSERT INTO `t_folder_questionnaire` VALUES ('1', '1');
INSERT INTO `t_folder_questionnaire` VALUES ('1', '2');
INSERT INTO `t_folder_questionnaire` VALUES ('2', '3');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question`  (
  `questionId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `questionType` tinyint(4) NULL DEFAULT NULL,
  `questionOption` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`questionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES ('1', '您会向朋友推荐我们的产品/服务么？', 1, '[\"会\", \"不会\", \"不确定\"]');
INSERT INTO `t_question` VALUES ('2', '您对我们的产品/服务满意么？', 2, '[\"非常满意\", \"满意\", \"一般\", \"不满意\", \"非常不满意\"]');
INSERT INTO `t_question` VALUES ('3', '您使用我们的产品/服务有多久了', 2, '[\"从来没用过\", \"一个月\", \"半年\", \"一年\", \"超过一年\"]');
INSERT INTO `t_question` VALUES ('4', '您对我们的产品/服务最满意的是什么？', 1, '[\"质量\", \"价格\", \"购买体验\", \"第一次使用时的体验\", \"客户服务\"]');

-- ----------------------------
-- Table structure for t_questionnaire
-- ----------------------------
DROP TABLE IF EXISTS `t_questionnaire`;
CREATE TABLE `t_questionnaire`  (
  `questionnaireId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `isDelete` tinyint(4) NULL DEFAULT NULL,
  `isImportant` tinyint(4) NULL DEFAULT NULL,
  `questionnaireName` char(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`questionnaireId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_questionnaire
-- ----------------------------
INSERT INTO `t_questionnaire` VALUES ('1', 1, 0, '暑假作业调查');
INSERT INTO `t_questionnaire` VALUES ('2', 1, 0, '寒假作业调查');
INSERT INTO `t_questionnaire` VALUES ('3', 1, 0, '水果喜爱调查');

-- ----------------------------
-- Table structure for t_questionnaire_question
-- ----------------------------
DROP TABLE IF EXISTS `t_questionnaire_question`;
CREATE TABLE `t_questionnaire_question`  (
  `questionnaireId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `questionId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`questionnaireId`, `questionId`) USING BTREE,
  INDEX `FK_Reference_1`(`questionId`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`questionId`) REFERENCES `t_question` (`questionId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`questionnaireId`) REFERENCES `t_questionnaire` (`questionnaireId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_questionnaire_question
-- ----------------------------
INSERT INTO `t_questionnaire_question` VALUES ('1', '1');
INSERT INTO `t_questionnaire_question` VALUES ('2', '1');
INSERT INTO `t_questionnaire_question` VALUES ('3', '1');
INSERT INTO `t_questionnaire_question` VALUES ('1', '2');
INSERT INTO `t_questionnaire_question` VALUES ('2', '2');
INSERT INTO `t_questionnaire_question` VALUES ('3', '2');
INSERT INTO `t_questionnaire_question` VALUES ('1', '3');
INSERT INTO `t_questionnaire_question` VALUES ('2', '3');
INSERT INTO `t_questionnaire_question` VALUES ('3', '3');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `userId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'hujin', '123');
INSERT INTO `t_user` VALUES ('2', 'leike', '123');
INSERT INTO `t_user` VALUES ('3', 'caoxuhua', '123');
INSERT INTO `t_user` VALUES ('5', 'xiaoming', '123');

-- ----------------------------
-- Table structure for t_user_folder
-- ----------------------------
DROP TABLE IF EXISTS `t_user_folder`;
CREATE TABLE `t_user_folder`  (
  `folderId` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userId` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`userId`, `folderId`) USING BTREE,
  INDEX `FK_Reference_4`(`folderId`) USING BTREE,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`folderId`) REFERENCES `t_folder` (`folderId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`userId`) REFERENCES `t_user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_folder
-- ----------------------------
INSERT INTO `t_user_folder` VALUES ('1', '1');
INSERT INTO `t_user_folder` VALUES ('1', '2');
INSERT INTO `t_user_folder` VALUES ('1', '3');
INSERT INTO `t_user_folder` VALUES ('2', '1');
INSERT INTO `t_user_folder` VALUES ('2', '2');
INSERT INTO `t_user_folder` VALUES ('2', '3');

SET FOREIGN_KEY_CHECKS = 1;
