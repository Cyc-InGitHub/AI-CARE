/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : ai_care

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 11/11/2022 09:48:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dept_ill_class
-- ----------------------------
DROP TABLE IF EXISTS `dept_ill_class`;
CREATE TABLE `dept_ill_class`  (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '疾病子类ID',
  `class_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '疾病子类名称',
  `parent_id` int(5) NULL DEFAULT NULL COMMENT '父级ID，所属科目',
  `order_num` int(11) NULL DEFAULT NULL COMMENT '排列顺序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标志 0代表存在 2代表删除',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`class_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '科目疾病子类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept_ill_class
-- ----------------------------
INSERT INTO `dept_ill_class` VALUES (1, '呼吸系统疾病', 1, 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class` VALUES (2, '循环系统疾病', 1, 2, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class` VALUES (3, '消化系统疾病', 1, 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class` VALUES (4, '泌尿系统疾病', 1, 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class` VALUES (5, '血液系统疾病', 1, 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class` VALUES (6, '内分泌和代谢性疾病', 1, 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class` VALUES (7, '风湿性疾病', 1, 7, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);

-- ----------------------------
-- Table structure for dept_ill_class_type
-- ----------------------------
DROP TABLE IF EXISTS `dept_ill_class_type`;
CREATE TABLE `dept_ill_class_type`  (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '疾病ID',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '疾病名称',
  `top_id` int(5) NULL DEFAULT NULL COMMENT '顶层ID，所属科目',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父级ID，所属类别',
  `order_num` bigint(20) NULL DEFAULT NULL COMMENT '排列顺序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标志 0代表存在 2代表删除',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '科室疾病子类类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dept_ill_class_type
-- ----------------------------
INSERT INTO `dept_ill_class_type` VALUES (1, '急性上呼吸道感染', 1, 1, 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (2, '急性气管-支气管炎', 1, 1, 2, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (3, '慢性支气管炎', 1, 1, 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (4, '慢性阻塞性肺疾病', 1, 1, 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (5, '支气管哮喘', 1, 1, 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (6, '支气管扩张症', 1, 1, 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (7, '肺炎链球菌肺炎', 1, 1, 7, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (8, '葡萄球菌肺炎', 1, 1, 8, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (9, '肺炎支原体肺炎', 1, 1, 9, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (10, '肺炎衣原体肺炎', 1, 1, 10, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (11, '病毒性肺炎', 1, 1, 11, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (12, '严重急性呼吸综合征', 1, 1, 12, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (13, '高致病性人禽流感病毒性肺炎', 1, 1, 13, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (14, '肺真菌病', 1, 1, 14, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (15, '肺脓肿', 1, 1, 15, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (16, '肺结核', 1, 1, 16, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (17, '肺癌', 1, 1, 17, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (18, '特发性肺纤维化', 1, 1, 18, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (19, '结节病', 1, 1, 19, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (20, '过敏性肺炎', 1, 1, 20, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (21, '嗜酸性粒细胞性肺炎', 1, 1, 21, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (22, '肺朗格汉斯细胞组织细胞增生症', 1, 1, 22, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (23, '肺淋巴管平滑肌瘤病', 1, 1, 23, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (24, '肺泡蛋白沉着症', 1, 1, 24, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (25, '特发性肺含铁血黄素沉着症', 1, 1, 25, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (26, '肺血栓栓塞症', 1, 1, 26, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (27, '特发性肺动脉高压', 1, 1, 27, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (28, '慢性肺源性心脏病', 1, 1, 28, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (29, '胸腔积液', 1, 1, 29, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (30, '气胸', 1, 1, 30, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (31, '睡眠呼吸暂停低通气综合征', 1, 1, 31, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (32, '急性呼吸窘迫综合征', 1, 1, 32, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (33, '急性呼吸衰竭', 1, 1, 33, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (34, '慢性呼吸衰竭', 1, 1, 34, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (35, '慢性心力衰竭', 1, 2, 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (36, '急性心力衰竭', 1, 2, 2, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (37, '动脉粥样硬化', 1, 2, 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (38, '冠状动脉粥样硬化型心脏病', 1, 2, 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (39, '稳定型心绞痛', 1, 2, 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (40, '隐匿型冠心病', 1, 2, 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (41, '缺血性心肌病', 1, 2, 7, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (42, '非ST段抬高型心肌梗死', 1, 2, 8, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (43, '急性ST段抬高型心肌梗死', 1, 2, 9, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (44, '心肌桥', 1, 2, 10, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (45, 'X综合征', 1, 2, 11, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (46, '扩张型心肌病', 1, 2, 12, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (47, '肥厚型心肌病', 1, 2, 13, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (48, '限制型心肌病', 1, 2, 14, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (49, '心肌炎', 1, 2, 15, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (50, '房间隔缺损', 1, 2, 16, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (51, '室间隔缺损', 1, 2, 17, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (52, '动脉导管未闭', 1, 2, 18, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (53, '卵圆孔未闭', 1, 2, 19, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (54, '肺动脉瓣狭窄', 1, 2, 20, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (55, '二叶主动脉瓣', 1, 2, 21, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (56, '三尖瓣下移畸形', 1, 2, 22, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (57, '先天性主动脉狭窄', 1, 2, 23, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (58, '主动脉窦瘤', 1, 2, 24, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (59, '冠状动脉窦', 1, 2, 25, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (60, '法洛四联症', 1, 2, 26, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (61, '艾森门格综合征', 1, 2, 27, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (62, '二尖瓣狭窄', 1, 2, 28, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (63, '二尖瓣关闭不全', 1, 2, 29, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (64, '主动脉瓣狭窄', 1, 2, 30, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (65, '主动脉瓣关闭不全', 1, 2, 31, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (66, '多瓣膜病', 1, 2, 32, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (67, '急性心包炎', 1, 2, 33, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (68, '心包积液及心脏压塞', 1, 2, 34, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (69, '缩窄性心包炎', 1, 2, 35, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (70, '自体瓣膜心内膜炎', 1, 2, 36, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (71, '人工瓣膜和静脉药瘾者心内膜炎', 1, 2, 37, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (72, '主动脉夹层', 1, 2, 38, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (73, '闭塞性周围动脉粥样硬化', 1, 2, 39, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (74, '静脉血栓症', 1, 2, 40, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (75, '静脉血栓性疾病', 1, 2, 41, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (76, '动脉血栓性疾病', 1, 2, 42, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (77, '外周血管疾病', 1, 2, 43, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (78, '胃食管反流病', 1, 3, 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (79, '食管癌', 1, 3, 2, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (80, '急性胃炎', 1, 3, 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (81, '慢性胃炎', 1, 3, 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (82, '特殊类型的胃炎或胃病', 1, 3, 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (83, '消化性溃疡', 1, 3, 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (84, '胃癌', 1, 3, 7, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (85, '肠结核', 1, 3, 8, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (86, '结核性腹膜炎', 1, 3, 9, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (87, '溃疡性结肠炎', 1, 3, 10, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (88, '克罗恩病', 1, 3, 11, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (89, '结直肠癌', 1, 3, 12, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (90, '功能性消化不良', 1, 3, 13, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (91, '肠易激综合征', 1, 3, 14, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (92, '病毒性肝炎', 1, 3, 15, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (93, '非酒精性脂肪性肝病', 1, 3, 16, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (94, '酒精性肝病', 1, 3, 17, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (95, '自身免疫性肝炎', 1, 3, 18, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (96, '原发性胆汁性胆管炎', 1, 3, 19, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (97, '原发性硬化性胆管炎', 1, 3, 20, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (98, '药物性肝病', 1, 3, 21, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (99, '肝硬化', 1, 3, 22, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (100, '原发性肝癌', 1, 3, 23, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (101, '急性肝衰竭', 1, 3, 24, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (102, '胆囊结石及胆囊炎', 1, 3, 25, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (103, '肝外胆管结石及胆管炎', 1, 3, 26, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (104, '胆道系统良性肿瘤', 1, 3, 27, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (105, '胆囊癌', 1, 3, 28, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (106, '胆囊癌', 1, 3, 29, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (107, '急性胰腺炎', 1, 3, 30, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (108, '慢性胰腺炎', 1, 3, 31, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (109, '胰腺癌', 1, 3, 32, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (110, '腹痛', 1, 3, 33, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (111, '慢性腹泻', 1, 3, 34, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (112, '便秘', 1, 3, 35, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (113, '消化道出血', 1, 3, 36, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (114, '急性肾小球肾炎', 1, 4, 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (115, '急进性肾小球肾炎', 1, 4, 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (116, 'IGA肾病', 1, 4, 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (117, '肾病综合征', 1, 4, 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (118, '慢性肾小球肾炎', 1, 4, 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (119, '狼疮肾炎', 1, 4, 7, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (120, '糖尿病肾病', 1, 4, 8, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (121, '血管炎肾损害', 1, 4, 9, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (122, '高尿酸肾损害', 1, 4, 10, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (123, '急性间质性肾炎', 1, 4, 11, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (124, '慢性间质性肾炎', 1, 4, 12, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (125, '尿路感染', 1, 4, 13, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (126, '肾动脉狭窄', 1, 4, 14, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (127, '肾动脉栓塞和血栓形成', 1, 4, 15, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (128, '良性小动脉性肾硬化症', 1, 4, 16, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (129, '恶性小动脉性肾硬化症', 1, 4, 17, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (130, '肾静脉血栓形成', 1, 4, 18, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (131, '常染色体显性遗传性多囊肾病', 1, 4, 19, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (132, 'Alport综合征', 1, 4, 20, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (133, '急性肾损伤', 1, 4, 21, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (134, '慢性肾衰竭', 1, 4, 22, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (135, '急性白血病', 1, 5, 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (136, '慢性髓系白血病', 1, 5, 2, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (137, '慢性淋巴细胞白血病', 1, 5, 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (138, '霍奇金淋巴瘤', 1, 5, 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (139, '非霍奇金淋巴瘤', 1, 5, 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (140, '多发性骨髓瘤', 1, 5, 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (141, '原发性骨髓纤维化', 1, 5, 7, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (142, '垂体瘤', 1, 6, 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (143, '肢端肥大症和巨人症', 1, 6, 2, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (144, '腺垂体功能减退症', 1, 6, 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (145, '生长激素缺乏性矮小症', 1, 6, 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (146, '尿崩症', 1, 6, 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (147, '抗利尿激素分泌失调综合征', 1, 6, 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (148, '弥漫性非毒性甲状腺肿', 1, 6, 7, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (149, '非毒性多结节性甲状腺肿', 1, 6, 8, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (150, '甲状腺功能亢进症', 1, 6, 9, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (151, '甲状腺功能减退症', 1, 6, 10, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (152, '甲状腺结节', 1, 6, 11, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (153, '甲状腺癌', 1, 6, 12, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (154, '库欣综合征', 1, 6, 13, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (155, '原发性醛固酮增多症', 1, 6, 14, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (156, '原发性肾上腺皮质功能减退症', 1, 6, 15, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (157, '嗜铬细胞瘤', 1, 6, 16, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (158, '原发性甲状旁腺功能亢进症', 1, 6, 17, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (159, '甲状旁腺功能减退症', 1, 6, 18, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (160, '多发性内分泌腺瘤病', 1, 6, 19, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (161, '胰岛素瘤', 1, 6, 20, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (162, '风湿热', 1, 7, 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (163, '类风湿关节炎', 1, 7, 2, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (164, '成人Still病', 1, 7, 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (165, '系统性红斑狼疮', 1, 7, 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (166, '强直性脊柱炎', 1, 7, 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (167, '脊柱关节炎', 1, 7, 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (168, '干燥综合征', 1, 7, 7, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (169, '大动脉炎', 1, 7, 8, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (170, '巨细胞动脉炎', 1, 7, 9, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (171, '结节性多动脉炎', 1, 7, 10, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (172, 'ANCA相关动脉炎', 1, 7, 11, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (173, '贝赫切特病', 1, 7, 12, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (174, '特发性炎症性肌病', 1, 7, 13, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (175, '特发性炎症性肌病', 1, 7, 14, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (176, '复发性多软骨炎', 1, 7, 15, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (177, '复发性多软骨炎', 1, 7, 16, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (178, '痛风', 1, 7, 17, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `dept_ill_class_type` VALUES (179, '纤维肌痛综合征', 1, 7, 18, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (6, 'medical_data_type', '医学数据案例类型表', '', NULL, 'MedicalDataType', 'crud', 'com.aicare.medical', 'medical', 'type', '医学数据案例类型', 'zhyl', '0', '/', '{\"parentMenuId\":\"105\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"字典管理\",\"treeCode\":\"\"}', 'admin', '2022-10-05 11:14:15', '', '2022-10-05 16:56:15', '');
INSERT INTO `gen_table` VALUES (7, 'hosp_dept', '医学数据科目表', '', NULL, 'HospDept', 'crud', 'com.aicare.medical', 'medical', 'dept', '医学数据科目', 'zhyl', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统管理\",\"treeCode\":\"\"}', 'admin', '2022-10-07 19:44:10', '', '2022-10-07 19:53:52', '');
INSERT INTO `gen_table` VALUES (8, 'dept_ill_class', '科目疾病子类表', '', NULL, 'DeptIllClass', 'crud', 'com.aicare.medical', 'medical', 'classes', '科目疾病子类', 'zhyl', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统管理\",\"treeCode\":\"\"}', 'admin', '2022-10-07 20:06:59', '', '2022-10-07 20:35:28', '');
INSERT INTO `gen_table` VALUES (9, 'dept_ill_class_type', '科室疾病子类类型表', '', NULL, 'DeptIllClassType', 'crud', 'com.aicare.medical', 'medical', 'classtype', '科室疾病子类类型', 'zhyl', '0', '/', '{\"parentMenuId\":\"1\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"系统管理\",\"treeCode\":\"\"}', 'admin', '2022-10-07 20:06:59', '', '2022-10-07 20:46:13', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (71, '6', 'type_id', '类型ID', 'bigint(20)', 'Long', 'typeId', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (72, '6', 'type_name', '类型名称', 'varchar(50)', 'String', 'typeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (73, '6', 'top_type_id', '顶层类型ID', 'bigint(20)', 'Long', 'topTypeId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (74, '6', 'parent_id', '父级类型ID', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (75, '6', 'level_num', '级别', 'int(2)', 'Integer', 'levelNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (76, '6', 'is_final', '是否末级', 'int(2)', 'Integer', 'isFinal', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (77, '6', 'order_num', '显示顺序', 'bigint(20)', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (78, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (79, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (80, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (81, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (82, '6', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (83, '6', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-10-05 11:14:15', NULL, '2022-10-05 16:56:15');
INSERT INTO `gen_table_column` VALUES (84, '7', 'dept_id', '科目ID', 'int(5)', 'Integer', 'deptId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (85, '7', 'dept_name', '科目名称', 'varchar(50)', 'String', 'deptName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (86, '7', 'order_num', '排列顺序', 'int(5)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (87, '7', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (88, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (89, '7', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (90, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (91, '7', 'del_flag', '删除标志 0代表存在 2代表删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (92, '7', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2022-10-07 19:44:10', NULL, '2022-10-07 19:53:52');
INSERT INTO `gen_table_column` VALUES (93, '8', 'class_id', '疾病子类ID', 'int(11)', 'Long', 'classId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (94, '8', 'class_name', '疾病子类名称', 'varchar(50)', 'String', 'className', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (95, '8', 'parent_id', '父级ID，所属科目', 'int(5)', 'Integer', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (96, '8', 'order_num', '排列顺序', 'int(11)', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (97, '8', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (98, '8', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (99, '8', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (100, '8', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (101, '8', 'del_flag', '删除标志 0代表存在 2代表删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (102, '8', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:35:28');
INSERT INTO `gen_table_column` VALUES (103, '9', 'type_id', '疾病ID', 'bigint(20)', 'Long', 'typeId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (104, '9', 'type_name', '疾病名称', 'varchar(50)', 'String', 'typeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (105, '9', 'top_id', '顶层ID，所属科目', 'int(5)', 'Integer', 'topId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (106, '9', 'parent_id', '父级ID，所属类别', 'int(11)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (107, '9', 'order_num', '排列顺序', 'bigint(20)', 'Long', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (108, '9', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (109, '9', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (110, '9', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (111, '9', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (112, '9', 'del_flag', '删除标志 0代表存在 2代表删除', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');
INSERT INTO `gen_table_column` VALUES (113, '9', 'remark', '备注', 'varchar(50)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2022-10-07 20:06:59', NULL, '2022-10-07 20:46:13');

-- ----------------------------
-- Table structure for hosp_dept
-- ----------------------------
DROP TABLE IF EXISTS `hosp_dept`;
CREATE TABLE `hosp_dept`  (
  `dept_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '科目ID',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '科目名称',
  `order_num` int(5) NULL DEFAULT NULL COMMENT '排列顺序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标志 0代表存在 2代表删除',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医学数据科目表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hosp_dept
-- ----------------------------
INSERT INTO `hosp_dept` VALUES (1, '内科学', 1, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_dept` VALUES (2, '外科学', 2, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_dept` VALUES (3, '病理学', 3, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_dept` VALUES (4, '妇产科学', 4, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_dept` VALUES (5, '口腔医学', 5, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_dept` VALUES (6, '儿科学', 6, 'admin', '2022-10-07 00:00:00', NULL, NULL, '0', NULL);

-- ----------------------------
-- Table structure for hosp_report
-- ----------------------------
DROP TABLE IF EXISTS `hosp_report`;
CREATE TABLE `hosp_report`  (
  `report_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '报告ID',
  `type_id` bigint(20) NOT NULL COMMENT '疾病ID',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '疾病名称',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别（0男 1女 2未知）',
  `age` int(2) NULL DEFAULT NULL COMMENT '年龄',
  `modality` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图像模态',
  `file_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件路径',
  `img_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图地址',
  `dicom_num` int(11) NULL DEFAULT NULL COMMENT 'dicom数量',
  `hospital_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `report_time` datetime NULL DEFAULT NULL COMMENT '记录时间',
  `narrator` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '病史摘要',
  `image_performance` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '影像学表现',
  `conclusion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '结论',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标志 0代表存在 2代表删除',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医学诊断报告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hosp_report
-- ----------------------------
INSERT INTO `hosp_report` VALUES (1, 1, '急性上呼吸道感染', '0', 3, 'CT', NULL, NULL, NULL, '2022-07-17 15:43:52', '2022-07-17 16:10:25', '咳嗽3天，发热2天。双肺未闻及干湿性啰音', '<p><span style=\"font-size:12.0pt;font-family:宋体;\r\nmso-ascii-theme-font:minor-fareast;mso-fareast-theme-font:minor-fareast;\r\nmso-hansi-theme-font:minor-fareast;mso-bidi-font-family:&quot;Times New Roman&quot;;\r\nmso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:\r\nZH-CN;mso-bidi-language:AR-SA\">双侧胸廓对称。双肺支气管壁增厚，左肺下叶见点片状稍高密度，边缘模糊。双肺门大\r\n小、形态、密度未见明显异常，气管及段以上支气管通畅，纵隔居中，其内未见明显肿大淋巴结。心脏大小、形态未见明显异常。双侧腋窝内未见明显肿大淋巴结。</span><br></p>', '<p><span style=\"font-size:12.0pt;font-family:宋体;\r\nmso-ascii-theme-font:minor-fareast;mso-fareast-theme-font:minor-fareast;\r\nmso-hansi-theme-font:minor-fareast;mso-bidi-font-family:&quot;Times New Roman&quot;;\r\nmso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:\r\nZH-CN;mso-bidi-language:AR-SA\">1. 支气管炎。\r\n2. 考虑左肺炎症。</span><br></p>', 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (2, 2, '急性气管-支气管炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (3, 3, '慢性支气管炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (4, 4, '慢性阻塞性肺疾病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (5, 5, '支气管哮喘', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (6, 6, '支气管扩张症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (7, 7, '肺炎链球菌肺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (8, 8, '葡萄球菌肺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (9, 9, '肺炎支原体肺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (10, 10, '肺炎支原体肺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (11, 11, '病毒性肺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (12, 12, '严重急性呼吸综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (13, 13, '高致病性人禽流感病毒性肺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (14, 14, '肺真菌病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (15, 15, '肺脓肿', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (16, 16, '肺结核', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (17, 17, '肺癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (18, 18, '特发性肺纤维化', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (19, 19, '结节病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (20, 20, '过敏性肺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (21, 21, '嗜酸性粒细胞性肺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (22, 22, '肺朗格汉斯细胞组织细胞增生症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (23, 23, '肺淋巴管平滑肌瘤病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (24, 24, '肺泡蛋白沉着症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (25, 25, '特发性肺含铁血黄素沉着症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (26, 26, '肺血栓栓塞症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (27, 27, '特发性肺动脉高压', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (28, 28, '慢性肺源性心脏病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (29, 29, '胸腔积液', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (30, 30, '气胸', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (31, 31, '睡眠呼吸暂停低通气综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (32, 32, '急性呼吸窘迫综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (33, 33, '急性呼吸衰竭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (34, 34, '慢性呼吸衰竭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (35, 35, '慢性心力衰竭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (36, 36, '急性心力衰竭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (37, 37, '动脉粥样硬化', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (38, 38, '冠状动脉粥样硬化型心脏病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (39, 39, '稳定型心绞痛', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (40, 40, '隐匿型冠心病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (41, 41, '缺血性心肌病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (42, 42, '非ST段抬高型心肌梗死', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (43, 43, '急性ST段抬高型心肌梗死', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (44, 44, '心肌桥', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (45, 45, 'X综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (46, 46, '扩张型心肌病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (47, 47, '肥厚型心肌病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (48, 48, '限制型心肌病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (49, 49, '心肌炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (50, 50, '房间隔缺损', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (51, 51, '室间隔缺损', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (52, 52, '动脉导管未闭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (53, 53, '卵圆孔未闭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (54, 54, '肺动脉瓣狭窄', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (55, 55, '二叶主动脉瓣', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (56, 56, '三尖瓣下移畸形', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (57, 57, '先天性主动脉狭窄', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (58, 58, '主动脉窦瘤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (59, 59, '冠状动脉窦', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (60, 60, '法洛四联症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (61, 61, '艾森门格综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (62, 62, '二尖瓣狭窄', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (63, 63, '二尖瓣关闭不全', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (64, 64, '主动脉瓣狭窄', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (65, 65, '主动脉瓣关闭不全', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (66, 66, '多瓣膜病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (67, 67, '急性心包炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (68, 68, '心包积液及心脏压塞', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (69, 69, '缩窄性心包炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (70, 70, '自体瓣膜心内膜炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (71, 71, '人工瓣膜和静脉药瘾者心内膜炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (72, 72, '主动脉夹层', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (73, 73, '闭塞性周围动脉粥样硬化', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (74, 74, '静脉血栓症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (75, 75, '静脉血栓性疾病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (76, 76, '动脉血栓性疾病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (77, 77, '外周血管疾病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (78, 78, '胃食管反流病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (79, 79, '食管癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (80, 80, '急性胃炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (81, 81, '慢性胃炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (82, 82, '特殊类型的胃炎或胃病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (83, 83, '消化性溃疡', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (84, 84, '胃癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (85, 85, '肠结核', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (86, 86, '结核性腹膜炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (87, 87, '溃疡性结肠炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (88, 88, '克罗恩病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (89, 89, '结直肠癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (90, 90, '功能性消化不良', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (91, 91, '肠易激综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (92, 92, '病毒性肝炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (93, 93, '非酒精性脂肪性肝病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (94, 94, '酒精性肝病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (95, 95, '自身免疫性肝炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (96, 96, '原发性胆汁性胆管炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (97, 97, '原发性硬化性胆管炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (98, 98, '药物性肝病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (99, 99, '肝硬化', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (100, 100, '原发性肝癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (101, 101, '急性肝衰竭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (102, 102, '胆囊结石及胆囊炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (103, 103, '肝外胆管结石及胆管炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (104, 104, '胆道系统良性肿瘤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (105, 105, '胆囊癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (106, 106, '胆囊癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (107, 107, '急性胰腺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (108, 108, '慢性胰腺炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (109, 109, '胰腺癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (110, 110, '腹痛', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (111, 111, '慢性腹泻', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (112, 112, '便秘', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (113, 113, '消化道出血', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (114, 114, '急性肾小球肾炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (115, 115, '急进性肾小球肾炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (116, 116, 'IGA肾病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (117, 117, '肾病综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (118, 118, '慢性肾小球肾炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (119, 119, '狼疮肾炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (120, 120, '糖尿病肾病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (121, 121, '血管炎肾损害', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (122, 122, '高尿酸肾损害', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (123, 123, '急性间质性肾炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (124, 124, '慢性间质性肾炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (125, 125, '尿路感染', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (126, 126, '肾动脉狭窄', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (127, 127, '肾动脉栓塞和血栓形成', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (128, 128, '良性小动脉性肾硬化症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (129, 129, '恶性小动脉性肾硬化症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (130, 130, '肾静脉血栓形成', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (131, 131, '常染色体显性遗传性多囊肾病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (132, 132, 'Alport综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (133, 133, '急性肾损伤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (134, 134, '慢性肾衰竭', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (135, 135, '急性白血病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (136, 136, '慢性髓系白血病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (137, 137, '慢性淋巴细胞白血病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (138, 138, '霍奇金淋巴瘤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (139, 139, '非霍奇金淋巴瘤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (140, 140, '多发性骨髓瘤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (141, 141, '原发性骨髓纤维化', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (142, 142, '垂体瘤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (143, 143, '肢端肥大症和巨人症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (144, 144, '腺垂体功能减退症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (145, 145, '生长激素缺乏性矮小症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (146, 146, '尿崩症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (147, 147, '抗利尿激素分泌失调综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (148, 148, '弥漫性非毒性甲状腺肿', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (149, 149, '非毒性多结节性甲状腺肿', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (150, 150, '甲状腺功能亢进症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (151, 151, '甲状腺功能减退症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (152, 152, '甲状腺结节', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (153, 153, '甲状腺癌', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (154, 154, '库欣综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (155, 155, '原发性醛固酮增多症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (156, 156, '原发性肾上腺皮质功能减退症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (157, 157, '嗜铬细胞瘤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (158, 158, '原发性甲状旁腺功能亢进症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (159, 159, '甲状旁腺功能减退症', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (160, 160, '多发性内分泌腺瘤病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (161, 161, '胰岛素瘤', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (162, 162, '风湿热', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (163, 163, '类风湿关节炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (164, 164, '成人Still病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (165, 165, '系统性红斑狼疮', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (166, 166, '强直性脊柱炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (167, 167, '脊柱关节炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (168, 168, '干燥综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (169, 169, '大动脉炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (170, 170, '巨细胞动脉炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (171, 171, '结节性多动脉炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (172, 172, 'ANCA相关动脉炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (173, 173, '贝赫切特病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (174, 174, '特发性炎症性肌病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (175, 175, '特发性炎症性肌病', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (176, 176, '复发性多软骨炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (177, 177, '复发性多软骨炎', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (178, 178, '痛风', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (179, 179, '纤维肌痛综合征', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);
INSERT INTO `hosp_report` VALUES (180, 1, '急性上呼吸道感染', '1', 4, 'CT', NULL, NULL, NULL, '2022-07-27 08:44:56', '2022-07-27 09:14:14', '患儿男，5岁，因“间断发热8天”入院，', '<p><span style=\"font-size:12.0pt;font-family:宋体;\r\nmso-ascii-theme-font:minor-fareast;mso-fareast-theme-font:minor-fareast;\r\nmso-hansi-theme-font:minor-fareast;mso-bidi-font-family:&quot;Times New Roman&quot;;\r\nmso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:\r\nZH-CN;mso-bidi-language:AR-SA\">双侧胸廓对称。双肺支气管壁增厚。双肺门影大小、形态、密度未见明显异常；气管及段以上支气管通畅。纵隔居中，其内未见明显肿大淋巴结。心脏大小、形态未见明显异常。</span><br></p>', '<p><span style=\"font-size:12.0pt;font-family:宋体;\r\nmso-ascii-theme-font:minor-fareast;mso-fareast-theme-font:minor-fareast;\r\nmso-hansi-theme-font:minor-fareast;mso-bidi-font-family:&quot;Times New Roman&quot;;\r\nmso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:\r\nZH-CN;mso-bidi-language:AR-SA\">提示支气管炎。</span><br></p>', 'admin', '2022-10-13 00:00:00', NULL, NULL, '0', NULL);

-- ----------------------------
-- Table structure for medical_data
-- ----------------------------
DROP TABLE IF EXISTS `medical_data`;
CREATE TABLE `medical_data`  (
  `dicom_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '知识点主键',
  `dicom_name` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '案例名称',
  `dicom_type_id` int(11) NULL DEFAULT 0 COMMENT '案例类型',
  `introduce` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简介说明',
  `file_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图地址',
  `view_count` int(11) NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `collection_count` int(11) NULL DEFAULT 0 COMMENT '收藏量',
  `praise_count` int(11) NULL DEFAULT 0 COMMENT '点赞量',
  `comment_count` int(11) NULL DEFAULT 0 COMMENT '评论数',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` int(2) NULL DEFAULT 0 COMMENT '删除标志（0代表存在 2代表删除）',
  `recommend_status` int(2) NULL DEFAULT 0 COMMENT '记录状态',
  `dicom_num` int(11) NOT NULL DEFAULT 0 COMMENT 'dicom数量',
  PRIMARY KEY (`dicom_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = tis620 COLLATE = tis620_thai_ci COMMENT = '医学数据案例表' ROW_FORMAT = DYNAMIC STATS_PERSISTENT = 0;

-- ----------------------------
-- Records of medical_data
-- ----------------------------

-- ----------------------------
-- Table structure for medical_data_report
-- ----------------------------
DROP TABLE IF EXISTS `medical_data_report`;
CREATE TABLE `medical_data_report`  (
  `report_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dicom_id` int(11) NULL DEFAULT 0 COMMENT '关联案例主键',
  `sex` int(2) NULL DEFAULT NULL COMMENT '性别',
  `age` int(2) NULL DEFAULT NULL COMMENT '年龄',
  `nation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '民族',
  `marriage` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻状态',
  `occupation` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职业',
  `hospital_time` datetime NULL DEFAULT NULL COMMENT '入院时间',
  `report_time` datetime NULL DEFAULT NULL COMMENT '记录时间',
  `narrator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病史陈述者',
  `image_performance` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '影像学表现',
  `conclusion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '结论',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `del_flag` int(2) NULL DEFAULT 0 COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`report_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医学数据案例诊断报告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medical_data_report
-- ----------------------------

-- ----------------------------
-- Table structure for medical_data_type
-- ----------------------------
DROP TABLE IF EXISTS `medical_data_type`;
CREATE TABLE `medical_data_type`  (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '类型ID',
  `type_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型名称',
  `top_type_id` bigint(20) NULL DEFAULT NULL COMMENT '顶层类型ID',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父级类型ID',
  `level_num` int(2) NULL DEFAULT NULL COMMENT '级别',
  `is_final` int(2) NULL DEFAULT 0 COMMENT '是否末级',
  `order_num` bigint(20) NULL DEFAULT 0 COMMENT '显示顺序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医学数据案例类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medical_data_type
-- ----------------------------
INSERT INTO `medical_data_type` VALUES (1, '内科学', 1, 0, 1, 0, 1, 'admin', '2022-10-05 00:00:00', '', '2022-10-05 16:53:54', 'test', '0');
INSERT INTO `medical_data_type` VALUES (2, '外科学', 2, 0, 1, 0, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (3, '病理学', 3, 0, 1, 0, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (4, '妇产科学', 4, 0, 1, 0, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (5, '口腔医学', 5, 0, 1, 0, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (6, '儿科学', 6, 0, 1, 0, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (7, '呼吸系统疾病', 1, 1, 2, 0, 1, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (8, '循环系统疾病', 1, 1, 2, 0, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (9, '消化系统疾病', 1, 1, 2, 0, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (10, '泌尿系统疾病', 1, 1, 2, 0, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (11, '血液系统疾病', 1, 1, 2, 0, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (12, '内分泌和代谢性疾病', 1, 1, 2, 0, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (13, '风湿性疾病', 1, 1, 2, 0, 7, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (14, '急性上呼吸道感染', 1, 7, 3, 1, 1, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (15, '急性气管-支气管炎', 1, 7, 3, 1, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (16, '慢性支气管炎', 1, 7, 3, 1, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (17, '慢性阻塞性肺疾病', 1, 7, 3, 1, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (18, '支气管哮喘', 1, 7, 3, 1, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (19, '支气管扩张症', 1, 7, 3, 1, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (20, '肺炎链球菌肺炎', 1, 7, 3, 1, 7, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (21, '葡萄球菌肺炎', 1, 7, 3, 1, 8, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (22, '肺炎支原体肺炎', 1, 7, 3, 1, 9, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (23, '肺炎衣原体肺炎', 1, 7, 3, 1, 10, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (24, '病毒性肺炎', 1, 7, 3, 1, 11, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (25, '严重急性呼吸综合征', 1, 7, 3, 1, 12, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (26, '高致病性人禽流感病毒性肺炎', 1, 7, 3, 1, 13, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (27, '肺真菌病', 1, 7, 3, 1, 14, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (28, '肺脓肿', 1, 7, 3, 1, 15, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (29, '肺结核', 1, 7, 3, 1, 16, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (30, '肺癌', 1, 7, 3, 1, 17, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (31, '特发性肺纤维化', 1, 7, 3, 1, 18, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (32, '结节病', 1, 7, 3, 1, 19, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (33, '过敏性肺炎', 1, 7, 3, 1, 20, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (34, '嗜酸性粒细胞性肺炎', 1, 7, 3, 1, 21, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (35, '肺朗格汉斯细胞组织细胞增生症', 1, 7, 3, 1, 22, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (36, '肺淋巴管平滑肌瘤病', 1, 7, 3, 1, 23, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (37, '肺泡蛋白沉着症', 1, 7, 3, 1, 24, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (38, '特发性肺含铁血黄素沉着症', 1, 7, 3, 1, 25, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (39, '肺血栓栓塞症', 1, 7, 3, 1, 26, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (40, '特发性肺动脉高压', 1, 7, 3, 1, 27, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (41, '慢性肺源性心脏病', 1, 7, 3, 1, 28, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (42, '胸腔积液', 1, 7, 3, 1, 29, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (43, '气胸', 1, 7, 3, 1, 30, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (44, '睡眠呼吸暂停低通气综合征', 1, 7, 3, 1, 31, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (45, '急性呼吸窘迫综合征', 1, 7, 3, 1, 32, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (46, '急性呼吸衰竭', 1, 7, 3, 1, 33, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (47, '慢性呼吸衰竭', 1, 7, 3, 1, 34, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (48, '慢性心力衰竭', 1, 8, 3, 1, 1, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (49, '急性心力衰竭', 1, 8, 3, 1, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (50, '动脉粥样硬化', 1, 8, 3, 1, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (51, '冠状动脉粥样硬化型心脏病', 1, 8, 3, 1, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (52, '稳定型心绞痛', 1, 8, 3, 1, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (53, '隐匿型冠心病', 1, 8, 3, 1, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (54, '缺血性心肌病', 1, 8, 3, 1, 7, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (55, '非ST段抬高型心肌梗死', 1, 8, 3, 1, 8, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (56, '急性ST段抬高型心肌梗死', 1, 8, 3, 1, 9, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (57, '心肌桥', 1, 8, 3, 1, 10, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (58, 'X综合征', 1, 8, 3, 1, 11, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (59, '扩张型心肌病', 1, 8, 3, 1, 12, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (60, '肥厚型心肌病', 1, 8, 3, 1, 13, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (61, '限制型心肌病', 1, 8, 3, 1, 14, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (62, '心肌炎', 1, 8, 3, 1, 15, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (63, '房间隔缺损', 1, 8, 3, 1, 16, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (64, '室间隔缺损', 1, 8, 3, 1, 17, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (65, '动脉导管未闭', 1, 8, 3, 1, 18, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (66, '卵圆孔未闭', 1, 8, 3, 1, 19, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (67, '肺动脉瓣狭窄', 1, 8, 3, 1, 20, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (68, '二叶主动脉瓣', 1, 8, 3, 1, 21, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (69, '三尖瓣下移畸形', 1, 8, 3, 1, 22, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (70, '先天性主动脉狭窄', 1, 8, 3, 1, 23, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (71, '主动脉窦瘤', 1, 8, 3, 1, 24, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (72, '冠状动脉窦', 1, 8, 3, 1, 25, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (73, '法洛四联症', 1, 8, 3, 1, 26, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (74, '艾森门格综合征', 1, 8, 3, 1, 27, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (75, '二尖瓣狭窄', 1, 8, 3, 1, 28, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (76, '二尖瓣关闭不全', 1, 8, 3, 1, 29, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (77, '主动脉瓣狭窄', 1, 8, 3, 1, 30, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (78, '主动脉瓣关闭不全', 1, 8, 3, 1, 31, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (79, '多瓣膜病', 1, 8, 3, 1, 32, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (80, '急性心包炎', 1, 8, 3, 1, 33, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (81, '心包积液及心脏压塞', 1, 8, 3, 1, 34, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (82, '缩窄性心包炎', 1, 8, 3, 1, 35, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (83, '自体瓣膜心内膜炎', 1, 8, 3, 1, 36, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (84, '人工瓣膜和静脉药瘾者心内膜炎', 1, 8, 3, 1, 37, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (85, '主动脉夹层', 1, 8, 3, 1, 38, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (86, '闭塞性周围动脉粥样硬化', 1, 8, 3, 1, 39, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (87, '静脉血栓症', 1, 8, 3, 1, 40, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (88, '静脉血栓性疾病', 1, 8, 3, 1, 41, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (89, '动脉血栓性疾病', 1, 8, 3, 1, 42, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (90, '外周血管疾病', 1, 8, 3, 1, 43, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (91, '胃食管反流病', 1, 9, 3, 1, 1, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (92, '食管癌', 1, 9, 3, 1, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (93, '急性胃炎', 1, 9, 3, 1, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (94, '慢性胃炎', 1, 9, 3, 1, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (95, '特殊类型的胃炎或胃病', 1, 9, 3, 1, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (96, '消化性溃疡', 1, 9, 3, 1, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (97, '胃癌', 1, 9, 3, 1, 7, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (98, '肠结核', 1, 9, 3, 1, 8, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (99, '结核性腹膜炎', 1, 9, 3, 1, 9, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (100, '溃疡性结肠炎', 1, 9, 3, 1, 10, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (101, '克罗恩病', 1, 9, 3, 1, 11, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (102, '结直肠癌', 1, 9, 3, 1, 12, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (103, '功能性消化不良', 1, 9, 3, 1, 13, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (104, '肠易激综合征', 1, 9, 3, 1, 14, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (105, '病毒性肝炎', 1, 9, 3, 1, 15, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (106, '非酒精性脂肪性肝病', 1, 9, 3, 1, 16, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (107, '酒精性肝病', 1, 9, 3, 1, 17, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (108, '自身免疫性肝炎', 1, 9, 3, 1, 18, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (109, '原发性胆汁性胆管炎', 1, 9, 3, 1, 19, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (110, '原发性硬化性胆管炎', 1, 9, 3, 1, 20, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (111, '药物性肝病', 1, 9, 3, 1, 21, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (112, '肝硬化', 1, 9, 3, 1, 22, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (113, '原发性肝癌', 1, 9, 3, 1, 23, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (114, '急性肝衰竭', 1, 9, 3, 1, 24, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (115, '胆囊结石及胆囊炎', 1, 9, 3, 1, 25, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (116, '肝外胆管结石及胆管炎', 1, 9, 3, 1, 26, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (117, '胆道系统良性肿瘤', 1, 9, 3, 1, 27, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (118, '胆囊癌', 1, 9, 3, 1, 28, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (119, '胆管癌', 1, 9, 3, 1, 29, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (120, '急性胰腺炎', 1, 9, 3, 1, 30, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (121, '慢性胰腺炎', 1, 9, 3, 1, 31, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (122, '胰腺癌', 1, 9, 3, 1, 32, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (123, '腹痛', 1, 9, 3, 1, 33, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (124, '慢性腹泻', 1, 9, 3, 1, 34, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (125, '便秘', 1, 9, 3, 1, 35, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (126, '消化道出血', 1, 9, 3, 1, 36, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (127, '急性肾小球肾炎', 1, 10, 3, 1, 1, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (128, '急进性肾小球肾炎', 1, 10, 3, 1, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (129, 'IGA肾病', 1, 10, 3, 1, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (130, '肾病综合征', 1, 10, 3, 1, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (131, '慢性肾小球肾炎', 1, 10, 3, 1, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (132, '狼疮肾炎', 1, 10, 3, 1, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (133, '糖尿病肾病', 1, 10, 3, 1, 7, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (134, '血管炎肾损害', 1, 10, 3, 1, 8, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (135, '高尿酸肾损害', 1, 10, 3, 1, 9, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (136, '急性间质性肾炎', 1, 10, 3, 1, 10, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (137, '慢性间质性肾炎', 1, 10, 3, 1, 11, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (138, '尿路感染', 1, 10, 3, 1, 12, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (139, '肾动脉狭窄', 1, 10, 3, 1, 13, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (140, '肾动脉栓塞和血栓形成', 1, 10, 3, 1, 14, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (141, '良性小动脉性肾硬化症', 1, 10, 3, 1, 15, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (142, '恶性小动脉性肾硬化症', 1, 10, 3, 1, 16, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (143, '肾静脉血栓形成', 1, 10, 3, 1, 17, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (144, '常染色体显性遗传性多囊肾病', 1, 10, 3, 1, 18, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (145, 'Alport综合征', 1, 10, 3, 1, 19, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (146, '急性肾损伤', 1, 10, 3, 1, 20, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (147, '慢性肾衰竭', 1, 10, 3, 1, 21, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (148, '急性白血病', 1, 11, 3, 1, 1, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (149, '慢性髓系白血病', 1, 11, 3, 1, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (150, '慢性淋巴细胞白血病', 1, 11, 3, 1, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (151, '霍奇金淋巴瘤', 1, 11, 3, 1, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (152, '非霍奇金淋巴瘤', 1, 11, 3, 1, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (153, '多发性骨髓瘤', 1, 11, 3, 1, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (154, '原发性骨髓纤维化', 1, 11, 3, 1, 7, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (155, '垂体瘤', 1, 12, 3, 1, 1, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (156, '肢端肥大症和巨人症', 1, 12, 3, 1, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (157, '腺垂体功能减退症', 1, 12, 3, 1, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (158, '生长激素缺乏性矮小症', 1, 12, 3, 1, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (159, '尿崩症', 1, 12, 3, 1, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (160, '抗利尿激素分泌失调综合征', 1, 12, 3, 1, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (161, '弥漫性非毒性甲状腺肿', 1, 12, 3, 1, 7, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (162, '非毒性多结节性甲状腺肿', 1, 12, 3, 1, 8, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (163, '甲状腺功能亢进症', 1, 12, 3, 1, 9, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (164, '甲状腺功能减退症', 1, 12, 3, 1, 10, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (165, '甲状腺结节', 1, 12, 3, 1, 11, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (166, '甲状腺癌', 1, 12, 3, 1, 12, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (167, '库欣综合征', 1, 12, 3, 1, 13, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (168, '原发性醛固酮增多症', 1, 12, 3, 1, 14, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (169, '原发性肾上腺皮质功能减退症', 1, 12, 3, 1, 15, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (170, '嗜铬细胞瘤', 1, 12, 3, 1, 16, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (171, '原发性甲状旁腺功能亢进症', 1, 12, 3, 1, 17, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (172, '甲状旁腺功能减退症', 1, 12, 3, 1, 18, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (173, '多发性内分泌腺瘤病', 1, 12, 3, 1, 19, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (174, '胰岛素瘤', 1, 12, 3, 1, 20, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (175, '风湿热', 1, 13, 3, 1, 1, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (176, '类风湿关节炎', 1, 13, 3, 1, 2, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (177, '成人Still病', 1, 13, 3, 1, 3, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (178, '系统性红斑狼疮', 1, 13, 3, 1, 4, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (179, '强直性脊柱炎', 1, 13, 3, 1, 5, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (180, '脊柱关节炎', 1, 13, 3, 1, 6, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (181, '干燥综合征', 1, 13, 3, 1, 7, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (182, '大动脉炎', 1, 13, 3, 1, 8, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (183, '巨细胞动脉炎', 1, 13, 3, 1, 9, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (184, '巨细胞动脉炎', 1, 13, 3, 1, 10, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (185, 'ANCA相关动脉炎', 1, 13, 3, 1, 11, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (186, '贝赫切特病', 1, 13, 3, 1, 12, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (187, '特发性炎症性肌病', 1, 13, 3, 1, 13, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (188, '系统性硬化症', 1, 13, 3, 1, 14, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (189, '复发性多软骨炎', 1, 13, 3, 1, 15, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (190, '骨关节炎', 1, 13, 3, 1, 16, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (191, '痛风', 1, 13, 3, 1, 17, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');
INSERT INTO `medical_data_type` VALUES (192, '纤维肌痛综合征', 1, 13, 3, 1, 18, 'admin', '2022-10-05 00:00:00', '', NULL, '', '0');

-- ----------------------------
-- Table structure for medical_mr
-- ----------------------------
DROP TABLE IF EXISTS `medical_mr`;
CREATE TABLE `medical_mr`  (
  `mr_id` varchar(99) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mr_usr_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mr_par_id` bigint(20) NOT NULL,
  `mr_patient_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mr_patient_sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mr_acquisition_time` datetime(6) NULL DEFAULT NULL,
  `mr_chief_complaint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '??',
  `mr_present_Illness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `mr_history_illness` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '???',
  `mr__img_performance` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '?????',
  `mr_creattime` datetime(6) NULL DEFAULT NULL,
  `mr_modify` datetime(6) NULL DEFAULT NULL COMMENT '????',
  `mr_delete` char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除标志（0代表存在 2代表删除）',
  `mr_img_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mr_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of medical_mr
-- ----------------------------

-- ----------------------------
-- Table structure for modal_transformation
-- ----------------------------
DROP TABLE IF EXISTS `modal_transformation`;
CREATE TABLE `modal_transformation`  (
  `model_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模态转换id',
  `number` int(11) NULL DEFAULT NULL COMMENT '编号',
  `path_ori` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '处理前路径(源路径)',
  `path_process` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模态转换后路径',
  `state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（是否处理：1 已处理；0 未处理）',
  `state_process` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态（处理是否成功：1 成功；0 失败）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志 0代表存在 2代表删除',
  `time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注（处理失败信息）',
  PRIMARY KEY (`model_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of modal_transformation
-- ----------------------------
INSERT INTO `modal_transformation` VALUES (1, 1, '/Dicom/', '/DicomTrans/', '1', '1', '0', '2022-11-04 21:35:31', NULL);
INSERT INTO `modal_transformation` VALUES (2, 2, '/Dicom/', '/DicomTrans/', '0', '', '0', '2022-11-04 21:36:31', NULL);

-- ----------------------------
-- Table structure for mr_img
-- ----------------------------
DROP TABLE IF EXISTS `mr_img`;
CREATE TABLE `mr_img`  (
  `mr_img_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mr_img_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mr_usrid` bigint(20) NULL DEFAULT NULL,
  `mr_img_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mr_img_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mr_img_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of mr_img
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
INSERT INTO `sys_config` VALUES (6, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '0', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (7, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '主框架页-菜单导航显示风格', 'sys.index.menuStyle', 'default', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
INSERT INTO `sys_config` VALUES (9, '主框架页-是否开启页脚', 'sys.index.footer', 'true', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '是否开启底部页脚显示（true显示，false隐藏）');
INSERT INTO `sys_config` VALUES (10, '主框架页-是否开启页签', 'sys.index.tagsView', 'true', 'Y', 'admin', '2022-10-04 16:40:23', '', NULL, '是否开启菜单多页签显示（true显示，false隐藏）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '????',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = sjis COLLATE = sjis_japanese_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-10-04 16:40:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-10-04 16:40:23', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-10-04 16:40:23', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 303 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-04 20:01:18');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-04 21:15:43');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-04 22:08:38');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 08:35:20');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 08:49:01');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 09:23:03');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 09:27:01');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 10:07:56');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 10:10:31');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 10:14:27');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 10:36:23');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 10:48:04');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 11:40:48');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 16:25:52');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 16:45:27');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 17:26:04');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 18:05:18');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-05 20:58:55');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 08:53:41');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 09:12:15');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 11:05:01');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 11:24:59');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 11:39:36');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 12:07:10');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 12:09:45');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 12:10:36');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 15:05:39');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 15:27:53');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 15:32:25');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 15:36:32');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 16:30:12');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 17:45:30');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 19:14:44');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 19:37:44');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 19:59:23');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 20:03:58');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-06 20:49:21');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 08:41:18');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 08:42:25');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 08:44:36');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 08:45:08');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 08:46:27');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 08:47:52');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 08:48:29');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 08:52:00');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 10:21:08');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 11:43:54');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 14:31:42');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 15:50:41');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 17:44:14');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 19:43:43');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:01:37');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:25:12');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:35:04');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:39:17');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:45:59');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:49:08');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:52:47');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:55:04');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:56:18');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 20:57:31');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 21:27:27');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 21:34:16');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 21:45:08');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 21:48:34');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 21:49:28');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 22:12:59');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 22:20:24');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 22:22:35');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-07 22:27:00');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-08 10:16:28');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-08 10:25:51');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-08 12:04:54');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-08 12:09:58');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-08 12:21:43');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-08 19:21:18');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-08 20:01:39');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 09:29:37');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 09:32:10');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 09:39:09');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 09:44:16');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 10:06:12');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 10:13:41');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 10:24:31');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 10:49:36');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 11:15:45');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 11:16:11');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 21:58:14');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-09 22:15:27');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-10 10:19:45');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-10 15:35:15');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-10 15:54:18');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-10 16:43:28');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-10 21:32:08');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 08:33:11');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 17:22:49');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 17:26:15');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 18:05:25');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 19:55:28');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-11 21:11:35');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-12 09:15:54');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-12 10:38:44');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-12 10:42:35');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-12 10:50:56');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-12 10:54:41');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-12 11:00:25');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-13 15:33:30');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-14 10:24:02');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-17 15:55:58');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-17 16:41:33');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 10:09:54');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 10:35:07');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 11:47:07');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 15:18:55');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 15:22:39');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 15:24:37');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 15:26:44');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 15:27:57');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 15:49:15');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 15:53:11');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 16:04:13');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 19:33:46');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-19 10:27:13');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-19 10:48:27');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-19 10:54:18');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-19 10:59:48');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-19 15:37:35');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-20 11:43:17');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-20 17:42:01');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:13:47');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:29:28');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:33:12');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:36:33');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:45:28');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:50:47');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:51:12');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:53:20');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 10:54:04');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 11:00:21');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 11:16:44');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 11:28:33');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 11:29:25');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 11:50:27');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 14:38:53');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 14:46:02');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 14:54:17');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 14:57:39');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 16:04:03');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 16:04:57');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 16:12:41');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 16:24:55');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 16:32:34');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 16:33:17');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 16:54:18');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 20:26:29');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-21 20:29:55');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 14:17:07');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 15:07:09');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 15:46:49');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 16:41:11');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 16:46:08');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 16:51:01');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 20:40:00');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 21:25:11');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 22:06:42');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-22 22:07:16');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:02:43');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:15:37');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:23:18');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:27:05');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:27:58');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:32:31');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:33:41');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:34:02');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:35:46');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:41:26');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:44:20');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:49:08');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-23 10:50:27');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-24 08:47:30');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-24 09:41:05');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-24 10:56:00');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-24 14:43:30');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-24 15:40:49');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-24 16:25:07');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-25 15:29:41');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-26 21:04:59');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 10:29:59');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 11:14:21');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 11:58:19');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 14:53:28');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:08:58');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:10:23');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:13:28');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:14:13');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:37:15');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:39:14');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:46:47');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 15:52:00');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 16:06:10');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 16:12:12');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 16:47:08');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 16:48:52');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-28 08:40:07');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '是否刷新（0刷新 1不刷新）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '1', '', 'fa fa-gear', 'admin', '2022-10-04 16:40:22', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '1', '', 'fa fa-video-camera', 'admin', '2022-10-04 16:40:22', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '1', '', 'fa fa-bars', 'admin', '2022-10-04 16:40:22', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', 'menuBlank', 'C', '0', '1', '', 'fa fa-location-arrow', 'admin', '2022-10-04 16:40:22', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', '1', 'system:user:view', 'fa fa-user-o', 'admin', '2022-10-04 16:40:22', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', '1', 'system:role:view', 'fa fa-user-secret', 'admin', '2022-10-04 16:40:22', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', '1', 'system:menu:view', 'fa fa-th-list', 'admin', '2022-10-04 16:40:22', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', '1', 'system:dept:view', 'fa fa-outdent', 'admin', '2022-10-04 16:40:22', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', '1', 'system:post:view', 'fa fa-address-card-o', 'admin', '2022-10-04 16:40:22', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', '1', 'system:dict:view', 'fa fa-bookmark-o', 'admin', '2022-10-04 16:40:22', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', '1', 'system:config:view', 'fa fa-sun-o', 'admin', '2022-10-04 16:40:22', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', '1', 'system:notice:view', 'fa fa-bullhorn', 'admin', '2022-10-04 16:40:22', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '1', '', 'fa fa-pencil-square-o', 'admin', '2022-10-04 16:40:22', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', '1', 'monitor:online:view', 'fa fa-user-circle', 'admin', '2022-10-04 16:40:22', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', '1', 'monitor:job:view', 'fa fa-tasks', 'admin', '2022-10-04 16:40:22', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', '1', 'monitor:data:view', 'fa fa-bug', 'admin', '2022-10-04 16:40:22', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, '/monitor/server', '', 'C', '0', '1', 'monitor:server:view', 'fa fa-server', 'admin', '2022-10-04 16:40:22', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, '/monitor/cache', '', 'C', '0', '1', 'monitor:cache:view', 'fa fa-cube', 'admin', '2022-10-04 16:40:22', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, '/tool/build', '', 'C', '0', '1', 'tool:build:view', 'fa fa-wpforms', 'admin', '2022-10-04 16:40:22', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', '1', 'tool:gen:view', 'fa fa-code', 'admin', '2022-10-04 16:40:22', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', '1', 'tool:swagger:view', 'fa fa-gg', 'admin', '2022-10-04 16:40:22', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', '1', 'monitor:operlog:view', 'fa fa-address-book', 'admin', '2022-10-04 16:40:22', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', '1', 'monitor:logininfor:view', 'fa fa-file-image-o', 'admin', '2022-10-04 16:40:22', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', '1', 'system:user:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', '1', 'system:user:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', '1', 'system:user:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', '1', 'system:user:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', '1', 'system:user:export', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', '1', 'system:user:import', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', '1', 'system:user:resetPwd', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', '1', 'system:role:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', '1', 'system:role:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', '1', 'system:role:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', '1', 'system:role:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', '1', 'system:role:export', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', '1', 'system:menu:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', '1', 'system:menu:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', '1', 'system:menu:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', '1', 'system:menu:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', '1', 'system:dept:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', '1', 'system:dept:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', '1', 'system:dept:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', '1', 'system:dept:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', '1', 'system:post:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', '1', 'system:post:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', '1', 'system:post:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', '1', 'system:post:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', '1', 'system:post:export', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', '1', 'system:dict:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', '1', 'system:dict:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', '1', 'system:dict:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', '1', 'system:dict:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', '1', 'system:dict:export', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', '1', 'system:config:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', '1', 'system:config:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', '1', 'system:config:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', '1', 'system:config:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', '1', 'system:config:export', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', '1', 'system:notice:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', '1', 'system:notice:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', '1', 'system:notice:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', '1', 'system:notice:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', '1', 'monitor:operlog:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', '1', 'monitor:operlog:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', '1', 'monitor:operlog:detail', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', '1', 'monitor:operlog:export', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', '1', 'monitor:logininfor:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', '1', 'monitor:logininfor:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', '1', 'monitor:logininfor:export', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', '1', 'monitor:logininfor:unlock', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', '1', 'monitor:online:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', '1', 'monitor:online:batchForceLogout', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', '1', 'monitor:online:forceLogout', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', '1', 'monitor:job:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', '1', 'monitor:job:add', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', '1', 'monitor:job:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', '1', 'monitor:job:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', '1', 'monitor:job:changeStatus', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', '1', 'monitor:job:detail', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', '1', 'monitor:job:export', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 115, 1, '#', '', 'F', '0', '1', 'tool:gen:list', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 115, 2, '#', '', 'F', '0', '1', 'tool:gen:edit', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 115, 3, '#', '', 'F', '0', '1', 'tool:gen:remove', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 115, 4, '#', '', 'F', '0', '1', 'tool:gen:preview', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 115, 5, '#', '', 'F', '0', '1', 'tool:gen:code', '#', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '医学数据案例类型', 105, 1, '/medical/type', '', 'C', '0', '1', 'medical:type:view', '#', 'admin', '2022-10-05 16:39:04', '', NULL, '医学数据案例类型菜单');
INSERT INTO `sys_menu` VALUES (2001, '医学数据案例类型查询', 2000, 1, '#', '', 'F', '0', '1', 'medical:type:list', '#', 'admin', '2022-10-05 16:39:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '医学数据案例类型新增', 2000, 2, '#', '', 'F', '0', '1', 'medical:type:add', '#', 'admin', '2022-10-05 16:39:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '医学数据案例类型修改', 2000, 3, '#', '', 'F', '0', '1', 'medical:type:edit', '#', 'admin', '2022-10-05 16:39:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '医学数据案例类型删除', 2000, 4, '#', '', 'F', '0', '1', 'medical:type:remove', '#', 'admin', '2022-10-05 16:39:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '医学数据案例类型导出', 2000, 5, '#', '', 'F', '0', '1', 'medical:type:export', '#', 'admin', '2022-10-05 16:39:04', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2022-10-04 16:40:23', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '代码生成', 6, 'com.aicare.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"medical_data_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-04 20:06:39');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 3, 'com.aicare.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"1\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-04 20:07:12');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 6, 'com.aicare.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"medical_data_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-04 21:16:18');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/medical_data_type', '127.0.0.1', '内网IP', '\"medical_data_type\"', NULL, 0, NULL, '2022-10-04 21:16:37');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 3, 'com.aicare.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"2\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-04 21:48:57');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.aicare.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"medical_data_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-04 21:49:04');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.aicare.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/medical_data_type', '127.0.0.1', '内网IP', '\"medical_data_type\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-04 21:49:12');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/medical_data_type', '127.0.0.1', '内网IP', '\"medical_data_type\"', NULL, 0, NULL, '2022-10-04 21:49:24');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.aicare.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"medical_data\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-04 21:51:24');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 3, 'com.aicare.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 10:22:57');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 3, 'com.aicare.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 10:22:59');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 6, 'com.aicare.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"medical_data_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 10:23:04');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/medical_data_type', '127.0.0.1', '内网IP', '\"medical_data_type\"', NULL, 0, NULL, '2022-10-05 10:23:19');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"58\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"59\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"60\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"61\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"62\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"63\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"colu', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 10:30:42');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/medical_data_type', '127.0.0.1', '内网IP', '\"medical_data_type\"', NULL, 0, NULL, '2022-10-05 10:30:53');
INSERT INTO `sys_oper_log` VALUES (115, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"5\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"58\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"59\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"60\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"61\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"62\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"63\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"colu', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 10:56:25');
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/medical_data_type', '127.0.0.1', '内网IP', '\"medical_data_type\"', NULL, 0, NULL, '2022-10-05 10:56:34');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 3, 'com.aicare.generator.controller.GenController.remove()', 'POST', 1, 'admin', '研发部门', '/tool/gen/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"5\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 10:59:58');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 6, 'com.aicare.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"medical_data_type\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 11:14:15');
INSERT INTO `sys_oper_log` VALUES (119, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"colu', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 11:14:35');
INSERT INTO `sys_oper_log` VALUES (120, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 11:16:42');
INSERT INTO `sys_oper_log` VALUES (121, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 11:17:55');
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 16:28:09');
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"colum', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 16:30:19');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"columns[5].javaField\":[\"isFinal\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 16:35:09');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"columns[5].javaField\":[\"isFinal\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 16:35:27');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"columns[5].javaField\":[\"isFinal\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 16:35:41');
INSERT INTO `sys_oper_log` VALUES (127, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/medical_data_type', '127.0.0.1', '内网IP', '\"medical_data_type\"', NULL, 0, NULL, '2022-10-05 16:35:45');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"columns[5].javaField\":[\"isFinal\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 16:52:33');
INSERT INTO `sys_oper_log` VALUES (129, '医学数据案例类型', 2, 'com.aicare.web.controller.medical.MedicalDataTypeController.editSave()', 'POST', 1, 'admin', '研发部门', '/medical/type/edit', '127.0.0.1', '内网IP', '{\"typeId\":[\"1\"],\"typeName\":[\"内科学\"],\"topTypeId\":[\"1\"],\"parentId\":[\"0\"],\"levelNum\":[\"1\"],\"isFinal\":[\"0\"],\"orderNum\":[\"1\"],\"remark\":[\"test\"],\"delFlag\":[\"0\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 16:53:54');
INSERT INTO `sys_oper_log` VALUES (130, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"6\"],\"tableName\":[\"medical_data_type\"],\"tableComment\":[\"医学数据案例类型表\"],\"className\":[\"MedicalDataType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"71\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"类型ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"72\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"类型名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"73\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层类型ID\"],\"columns[2].javaType\":[\"Long\"],\"columns[2].javaField\":[\"topTypeId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"74\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级类型ID\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"75\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"级别\"],\"columns[4].javaType\":[\"Integer\"],\"columns[4].javaField\":[\"levelNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"76\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"是否末级\"],\"columns[5].javaType\":[\"Integer\"],\"columns[5].javaField\":[\"isFinal\"]', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-05 16:56:15');
INSERT INTO `sys_oper_log` VALUES (131, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/medical_data_type', '127.0.0.1', '内网IP', '\"medical_data_type\"', NULL, 0, NULL, '2022-10-05 16:56:19');
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 6, 'com.aicare.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"hosp_dept\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 19:44:11');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"hosp_dept\"],\"tableComment\":[\"医学数据科目表\"],\"className\":[\"HospDept\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"84\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"科目ID\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"deptId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"85\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"科目名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"deptName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"86\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"排列顺序\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"orderNum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"87\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建者\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"createBy\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"88\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"89\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"更新者\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"updateBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 19:45:12');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"hosp_dept\"],\"tableComment\":[\"医学数据科目表\"],\"className\":[\"HospDept\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"84\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"科目ID\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"deptId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"85\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"科目名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"deptName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"86\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"排列顺序\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"orderNum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"87\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建者\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"createBy\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"88\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"89\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"更新者\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"updateBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 19:53:39');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"7\"],\"tableName\":[\"hosp_dept\"],\"tableComment\":[\"医学数据科目表\"],\"className\":[\"HospDept\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"84\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"科目ID\"],\"columns[0].javaType\":[\"Integer\"],\"columns[0].javaField\":[\"deptId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"85\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"科目名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"deptName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"86\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"排列顺序\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"orderNum\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"87\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"创建者\"],\"columns[3].javaType\":[\"String\"],\"columns[3].javaField\":[\"createBy\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"88\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建时间\"],\"columns[4].javaType\":[\"Date\"],\"columns[4].javaField\":[\"createTime\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"datetime\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"89\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"更新者\"],\"columns[5].javaType\":[\"String\"],\"columns[5].javaField\":[\"updateBy\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].isEdit\":[\"1\"],\"columns[5].queryType\":[\"EQ\"],\"columns[5].htmlType\":[\"input\"],\"columns[5].dictType\":[\"\"', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 19:53:52');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/hosp_dept', '127.0.0.1', '内网IP', '\"hosp_dept\"', NULL, 0, NULL, '2022-10-07 19:54:38');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 6, 'com.aicare.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":[\"dept_ill_class_type,dept_ill_class\"]}', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:06:59');
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"dept_ill_class\"],\"tableComment\":[\"科目疾病子类表\"],\"className\":[\"DeptIllClass\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"93\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病子类ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"classId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病子类名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"className\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"95\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"父级ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"parentId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"96\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"排列顺序\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"orderNum\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"97\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"98\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryTyp', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:08:34');
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"dept_ill_class\"],\"tableComment\":[\"科目疾病子类表\"],\"className\":[\"DeptIllClass\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"93\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病子类ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"classId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病子类名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"className\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"95\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"父级ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"parentId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"96\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"排列顺序\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"orderNum\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"97\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"98\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:08:53');
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/dept_ill_class', '127.0.0.1', '内网IP', '\"dept_ill_class\"', NULL, 0, NULL, '2022-10-07 20:09:00');
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"dept_ill_class\"],\"tableComment\":[\"科目疾病子类表\"],\"className\":[\"DeptIllClass\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"93\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病子类ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"classId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病子类名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"className\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"95\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"父级ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"parentId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"96\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"排列顺序\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"orderNum\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"97\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"98\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:25:25');
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"dept_ill_class\"],\"tableComment\":[\"科目疾病子类表\"],\"className\":[\"DeptIllClass\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"93\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病子类ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"classId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病子类名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"className\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"95\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"父级ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"parentId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"96\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"排列顺序\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"orderNum\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"97\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"98\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:25:34');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"dept_ill_class_type\"],\"tableComment\":[\"科室疾病子类类型表\"],\"className\":[\"DeptIllClassType\"],\"functionAuthor\":[\"ruoyi\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"103\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"104\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"105\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"topId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"106\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级ID，所属类别\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"107\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"排列顺序\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"orderNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"108\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建者\"],\"columns[5].javaType\":[\"Str', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:26:48');
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"dept_ill_class_type\"],\"tableComment\":[\"科室疾病子类类型表\"],\"className\":[\"DeptIllClassType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"103\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"104\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"105\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"topId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"106\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级ID，所属类别\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"107\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"排列顺序\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"orderNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"108\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建者\"],\"columns[5].javaType\":[\"Stri', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:27:00');
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"dept_ill_class\"],\"tableComment\":[\"科目疾病子类表\"],\"className\":[\"DeptIllClass\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"93\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病子类ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"classId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病子类名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"className\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"95\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"父级ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"parentId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"96\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"排列顺序\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"orderNum\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"97\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"98\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:27:11');
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 8, 'com.aicare.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":[\"dept_ill_class,dept_ill_class_type\"]}', NULL, 0, NULL, '2022-10-07 20:27:29');
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/dept_ill_class', '127.0.0.1', '内网IP', '\"dept_ill_class\"', NULL, 0, NULL, '2022-10-07 20:27:54');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"8\"],\"tableName\":[\"dept_ill_class\"],\"tableComment\":[\"科目疾病子类表\"],\"className\":[\"DeptIllClass\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"93\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病子类ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"classId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"94\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病子类名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"className\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"95\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"父级ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"parentId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"96\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"排列顺序\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"orderNum\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"97\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"创建者\"],\"columns[4].javaType\":[\"String\"],\"columns[4].javaField\":[\"createBy\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"98\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建时间\"],\"columns[5].javaType\":[\"Date\"],\"columns[5].javaField\":[\"createTime\"],\"columns[5].isInsert\":[\"1\"],\"columns[5].queryType', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:35:28');
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/dept_ill_class', '127.0.0.1', '内网IP', '\"dept_ill_class\"', NULL, 0, NULL, '2022-10-07 20:35:32');
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"dept_ill_class_type\"],\"tableComment\":[\"科室疾病子类类型表\"],\"className\":[\"DeptIllClassType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"103\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"104\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"105\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"topId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"106\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级ID，所属类别\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"107\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"排列顺序\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"orderNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"108\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建者\"],\"columns[5].javaType\":[\"Stri', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:39:41');
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/dept_ill_class_type', '127.0.0.1', '内网IP', '\"dept_ill_class_type\"', NULL, 0, NULL, '2022-10-07 20:39:45');
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.aicare.generator.controller.GenController.editSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/edit', '127.0.0.1', '内网IP', '{\"tableId\":[\"9\"],\"tableName\":[\"dept_ill_class_type\"],\"tableComment\":[\"科室疾病子类类型表\"],\"className\":[\"DeptIllClassType\"],\"functionAuthor\":[\"zhyl\"],\"remark\":[\"\"],\"columns[0].columnId\":[\"103\"],\"columns[0].sort\":[\"1\"],\"columns[0].columnComment\":[\"疾病ID\"],\"columns[0].javaType\":[\"Long\"],\"columns[0].javaField\":[\"typeId\"],\"columns[0].isInsert\":[\"1\"],\"columns[0].queryType\":[\"EQ\"],\"columns[0].htmlType\":[\"input\"],\"columns[0].dictType\":[\"\"],\"columns[1].columnId\":[\"104\"],\"columns[1].sort\":[\"2\"],\"columns[1].columnComment\":[\"疾病名称\"],\"columns[1].javaType\":[\"String\"],\"columns[1].javaField\":[\"typeName\"],\"columns[1].isInsert\":[\"1\"],\"columns[1].isEdit\":[\"1\"],\"columns[1].isList\":[\"1\"],\"columns[1].isQuery\":[\"1\"],\"columns[1].queryType\":[\"LIKE\"],\"columns[1].isRequired\":[\"1\"],\"columns[1].htmlType\":[\"input\"],\"columns[1].dictType\":[\"\"],\"columns[2].columnId\":[\"105\"],\"columns[2].sort\":[\"3\"],\"columns[2].columnComment\":[\"顶层ID，所属科目\"],\"columns[2].javaType\":[\"Integer\"],\"columns[2].javaField\":[\"topId\"],\"columns[2].isInsert\":[\"1\"],\"columns[2].isEdit\":[\"1\"],\"columns[2].isList\":[\"1\"],\"columns[2].isQuery\":[\"1\"],\"columns[2].queryType\":[\"EQ\"],\"columns[2].htmlType\":[\"input\"],\"columns[2].dictType\":[\"\"],\"columns[3].columnId\":[\"106\"],\"columns[3].sort\":[\"4\"],\"columns[3].columnComment\":[\"父级ID，所属类别\"],\"columns[3].javaType\":[\"Long\"],\"columns[3].javaField\":[\"parentId\"],\"columns[3].isInsert\":[\"1\"],\"columns[3].isEdit\":[\"1\"],\"columns[3].isList\":[\"1\"],\"columns[3].isQuery\":[\"1\"],\"columns[3].queryType\":[\"EQ\"],\"columns[3].htmlType\":[\"input\"],\"columns[3].dictType\":[\"\"],\"columns[4].columnId\":[\"107\"],\"columns[4].sort\":[\"5\"],\"columns[4].columnComment\":[\"排列顺序\"],\"columns[4].javaType\":[\"Long\"],\"columns[4].javaField\":[\"orderNum\"],\"columns[4].isInsert\":[\"1\"],\"columns[4].isEdit\":[\"1\"],\"columns[4].isList\":[\"1\"],\"columns[4].isQuery\":[\"1\"],\"columns[4].queryType\":[\"EQ\"],\"columns[4].htmlType\":[\"input\"],\"columns[4].dictType\":[\"\"],\"columns[5].columnId\":[\"108\"],\"columns[5].sort\":[\"6\"],\"columns[5].columnComment\":[\"创建者\"],\"columns[5].javaType\":[\"Stri', '{\"msg\":\"操作成功\",\"code\":0}', 0, NULL, '2022-10-07 20:46:13');
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.aicare.generator.controller.GenController.download()', 'GET', 1, 'admin', '研发部门', '/tool/gen/download/dept_ill_class_type', '127.0.0.1', '内网IP', '\"dept_ill_class_type\"', NULL, 0, NULL, '2022-10-07 20:46:16');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-10-04 16:40:22', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-10-04 16:40:22', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2022-10-04 16:40:22', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2022-10-28 08:40:08', '2022-10-04 16:40:22', 'admin', '2022-10-04 16:40:22', '', '2022-10-28 08:40:07', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2022-10-04 16:40:22', '2022-10-04 16:40:22', 'admin', '2022-10-04 16:40:22', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
