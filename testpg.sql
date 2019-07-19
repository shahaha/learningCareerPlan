/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : testpg

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 16/07/2019 21:44:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '班级名称',
  `profsId` int(11) NULL DEFAULT NULL COMMENT '专业ID（所属专业）',
  `grade` year NULL DEFAULT NULL COMMENT '年级',
  `headmasterId` bigint(11) NULL DEFAULT NULL COMMENT '教师ID（班主任）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `headmasterId`(`headmasterId`) USING BTREE,
  INDEX `profsId`(`profsId`) USING BTREE,
  CONSTRAINT `t_class_ibfk_3` FOREIGN KEY (`profsId`) REFERENCES `t_profession` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_class_ibfk_4` FOREIGN KEY (`headmasterId`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '班级表; InnoDB free: 11264 kB; (`headmasterId`) REFER `graduation_project/t_user`(`' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_college
-- ----------------------------
DROP TABLE IF EXISTS `t_college`;
CREATE TABLE `t_college`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `collegeName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '大学名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10421 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '大学表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_economy
-- ----------------------------
DROP TABLE IF EXISTS `t_economy`;
CREATE TABLE `t_economy`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `economyState` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '经济状况描述（贫困、一般、富裕...）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '家庭经济状况表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_majormembers
-- ----------------------------
DROP TABLE IF EXISTS `t_majormembers`;
CREATE TABLE `t_majormembers`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键（无实际意义）',
  `stuId` bigint(11) NULL DEFAULT NULL COMMENT '学生ID（该成员属于哪个学生）',
  `membersName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '成员姓名',
  `membersRelationship` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '成员与学生的关系（称呼[爷爷、奶奶]）',
  `membersJob` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '成员的工作',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `stuId`(`stuId`) USING BTREE,
  CONSTRAINT `t_majormembers_ibfk_1` FOREIGN KEY (`stuId`) REFERENCES `t_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '主要家庭成员表; InnoDB free: 11264 kB; (`stuId`) REFER `graduation_project/t_student`(`' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_profession
-- ----------------------------
DROP TABLE IF EXISTS `t_profession`;
CREATE TABLE `t_profession`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `profsName` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '专业名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '专业表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`  (
  `id` bigint(11) NOT NULL COMMENT '主键',
  `stuSex` bit(1) NULL DEFAULT b'0' COMMENT '性别（1代表男，0代表女）',
  `stuBirthday` date NULL DEFAULT NULL COMMENT '出生年月',
  `stuOrgin` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '生源地',
  `registeredResidence` bit(1) NULL DEFAULT NULL COMMENT '户籍（1代表城镇，0代表农村）',
  `stuIdeal` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '毕业后的职业理想',
  `economyId` int(11) NULL DEFAULT NULL COMMENT '家庭经济状况（下拉框[贫困、一般、富裕...]）',
  `targetId` int(11) NULL DEFAULT NULL COMMENT '毕业后目标（下拉框[考研、就业、创业...]）',
  `classId` int(11) NULL DEFAULT NULL COMMENT '班级ID',
  `collegeId` int(11) NULL DEFAULT NULL COMMENT '大学ID',
  `employmentId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `collegeId`(`collegeId`) USING BTREE,
  INDEX `cId`(`classId`) USING BTREE,
  INDEX `targetId`(`targetId`) USING BTREE,
  INDEX `economyId`(`economyId`) USING BTREE,
  INDEX `employmentId`(`employmentId`) USING BTREE,
  INDEX `FK4B90757039C79A18`(`employmentId`) USING BTREE,
  CONSTRAINT `FK4B90757039C79A18` FOREIGN KEY (`employmentId`) REFERENCES `t_target` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_student_ibfk_11` FOREIGN KEY (`id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_student_ibfk_12` FOREIGN KEY (`employmentId`) REFERENCES `t_target` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_student_ibfk_4` FOREIGN KEY (`collegeId`) REFERENCES `t_college` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_student_ibfk_7` FOREIGN KEY (`targetId`) REFERENCES `t_target` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_student_ibfk_8` FOREIGN KEY (`economyId`) REFERENCES `t_economy` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_student_ibfk_9` FOREIGN KEY (`classId`) REFERENCES `t_class` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '学生基本信息表; InnoDB free: 11264 kB; (`collegeId`) REFER `graduation_project/t_colleg' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_target
-- ----------------------------
DROP TABLE IF EXISTS `t_target`;
CREATE TABLE `t_target`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `targetCaption` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '目标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '目标表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_trem
-- ----------------------------
DROP TABLE IF EXISTS `t_trem`;
CREATE TABLE `t_trem`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stuId` bigint(11) NOT NULL COMMENT '学生ID',
  `semester` int(11) NOT NULL COMMENT '学期号',
  `smallTarget` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '小目标',
  `teacherAudit` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '教师审核',
  `targetFeedback` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '目标反馈',
  `teacherComment` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '教师评语',
  `score` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '打分',
  PRIMARY KEY (`stuId`, `semester`) USING BTREE,
  INDEX `stuId`(`stuId`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  CONSTRAINT `t_trem_ibfk_1` FOREIGN KEY (`stuId`) REFERENCES `t_student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7194 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '学期表，表示每个学期学生的状态; InnoDB free: 11264 kB; (`stuId`) REFER `graduation_project/t_st' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `account` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '账号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '123456' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '' COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account`(`account`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1273 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '教师表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `userId` bigint(11) NOT NULL COMMENT '学生学号或教师工号（外键）',
  `roleId` int(11) NOT NULL COMMENT '角色号（外键）',
  PRIMARY KEY (`userId`, `roleId`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `t_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_role_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '学生表和角色表多对多的中间表; InnoDB free: 11264 kB; (`roleId`) REFER `graduation_project/t_ro' ROW_FORMAT = Compact;

-- ----------------------------
-- Procedure structure for product
-- ----------------------------
DROP PROCEDURE IF EXISTS `product`;
delimiter ;;
CREATE PROCEDURE `product`()
BEGIN
	SELECT
		* 
	FROM
	t_user ;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for targeTotal
-- ----------------------------
DROP PROCEDURE IF EXISTS `targeTotal`;
delimiter ;;
CREATE PROCEDURE `targeTotal`(IN targetID INT, IN grade INT, OUT oTotal INT)
BEGIN
	DECLARE
		total INT;
	SELECT
		COUNT( * ) 
	FROM
		t_student,
		t_class 
	WHERE
		t_student.classId = t_class.id 
		AND t_class.grade = grade 
		AND t_student.targetId = targetID INTO total;
	SELECT
	total INTO oTotal;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
