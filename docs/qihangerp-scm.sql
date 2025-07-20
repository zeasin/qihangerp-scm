/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云RDS开发库
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : rm-wz95h4f7996784subvo.mysql.rds.aliyuncs.com:3306
 Source Schema         : qihangerp-scm

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 20/07/2025 10:09:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for erp_goods
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods`;
CREATE TABLE `erp_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品名称',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片地址',
  `number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品编号',
  `unit_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '单位名称',
  `category_id` int NULL DEFAULT 0 COMMENT '商品分类ID',
  `bar_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '条码',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态1销售中2已下架',
  `length` float NOT NULL DEFAULT 0 COMMENT '衣长/裙长/裤长',
  `height` float NOT NULL DEFAULT 0 COMMENT '高度/袖长',
  `width` float NOT NULL DEFAULT 0 COMMENT '宽度/胸阔(围)',
  `width1` float NOT NULL DEFAULT 0 COMMENT '肩阔',
  `width2` float NOT NULL DEFAULT 0 COMMENT '腰阔',
  `width3` float NOT NULL DEFAULT 0 COMMENT '臀阔',
  `weight` float NOT NULL DEFAULT 0 COMMENT '重量',
  `disable` tinyint(1) NULL DEFAULT 0 COMMENT '0启用   1禁用',
  `period` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '保质期',
  `pur_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '预计采购价格',
  `whole_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议批发价',
  `retail_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议零售价',
  `unit_cost` decimal(8, 2) NULL DEFAULT NULL COMMENT '单位成本',
  `supplier_id` int NULL DEFAULT 0 COMMENT '供应商id',
  `brand_id` int NULL DEFAULT 0 COMMENT '品牌id',
  `attr1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性1：季节',
  `attr2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性2：分类',
  `attr3` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性3：风格',
  `attr4` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性4：年份',
  `attr5` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性5：面料',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外链url',
  `low_qty` int NULL DEFAULT 0 COMMENT '最低库存（预警）',
  `high_qty` int NULL DEFAULT 0 COMMENT '最高库存（预警）',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `number`(`number`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品库存管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods
-- ----------------------------
INSERT INTO `erp_goods` VALUES (9, 'HN8026牛仔短裤', 'http://img.huayiyungou.com/niuzaiduanku/HN8026.jpg', 'HN8026', '', 27, '', '80-130斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 19.00, 0.00, 29.00, NULL, 26, 0, '夏季', '', '', '2021', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (10, 'HN858牛仔短裤', 'http://img.huayiyungou.com/niuzaiduanku/HN858.jpg', 'HN858', '', 27, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 20.00, 0.00, 39.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (11, 'HN608牛仔短裤', 'http://img.huayiyungou.com/niuzaiduanku/HN608.jpg', 'HN608', '', 27, '', '建议80-120斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 19.00, 0.00, 29.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (12, 'HN270牛仔短裤', 'http://img.huayiyungou.com/niuzaiduanku/HN270.jpg', 'HN270', '', 27, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 19.00, 0.00, 29.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (13, '681直筒拖地牛仔裤夏款', 'https://cbu01.alicdn.com/img/ibank/O1CN01qHvRwi2FOyGhhNR4M_!!2208857268871-0-cib.jpg', 'HN681', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 49.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (14, '708灰色牛仔短裤', 'https://cbu01.alicdn.com/img/ibank/O1CN011fcYH72FOyGTbaYJO_!!2208857268871-0-cib.jpg', 'HN708', '', 27, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 24.00, 0.00, 40.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (15, '661高腰复古牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01rXl5A92FOyBlp8KB2_!!2208857268871-0-cib.jpg', 'HN661', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 49.00, NULL, 26, 0, '夏季', '', '', '2021', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (16, '678高腰直筒开叉拖地牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01adpyGm2FOyBpyqNJ5_!!2208857268871-0-cib.jpg', 'HN678', '', 28, '', '建议80-125斤', 1, 97, 0, 0, 0, 66, 93.5, 0, 0, '', 29.00, 0.00, 59.00, NULL, 26, 0, '夏季', '', '', '2021', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (17, '抽绳修身短袖T恤', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', '0320220801', '', 3, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 12.00, 0.00, 12.00, NULL, 28, 0, '夏季', '', '', '2022', '棉', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (18, 'HN0014前开叉微喇叭牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01kdGpaF2FOyFHMzMrK_!!2208857268871-0-cib.jpg', 'HN0014', '', 29, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 32.00, 0.00, 39.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (19, 'HN025紧身毛边小脚铅笔裤', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 'HN025', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (20, 'HN029小脚九分铅笔裤弹力紧身', 'https://cbu01.alicdn.com/img/ibank/O1CN01ptoyH92FOyCPES9l4_!!2208857268871-0-cib.jpg', 'HN029', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (21, 'HN0015裤脚开叉牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01xcpzIU2FOyBl2dOl6_!!2208857268871-0-cib.jpg', 'HN015', '', 29, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (22, 'HN0020九分铅笔小脚裤子', 'https://cbu01.alicdn.com/img/ibank/O1CN01hMirkD2FOyA8dH5gg_!!2208857268871-0-cib.jpg', 'HN020', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (23, 'HN0024小脚裤弹力九分铅笔牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01pMo6Nw2FOyH7h62R2_!!2208857268871-0-cib.jpg', 'HN024', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (24, 'HN0012竖条纹阔腿牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01fNcjNj2FOyFLNrkHL_!!2208857268871-0-cib.jpg', 'HN012', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 49.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (25, 'OXN691中腰薄款破洞七分小脚裤', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 'OXN0691', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 42.00, 0.00, 79.00, NULL, 29, 0, '春秋季', '裤子', '瑞丽', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (26, 'HN0630松紧腰九分老爹哈伦裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01emC4ZW2FOyCPWDBJP_!!2208857268871-0-cib.jpg', 'HN0630', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (27, 'HN023小直筒牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01oWnpE72FOyGvFmm8P_!!2208857268871-0-cib.jpg', 'HN023', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (28, 'HN670高腰哈伦牛仔裤', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 'HN670', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (29, 'HNP182弹力紧身贴标牛仔短裤女ins', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 'HNP182', '', 27, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 21.00, 0.00, 29.00, NULL, 26, 0, '夏季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (30, 'HN672微喇牛仔裤女', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 'HN672', '', 29, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (31, 'HN801九分哈伦萝卜老爹裤', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 'HN801', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 28.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (32, 'HN697双扣后松紧高腰宽松萝卜牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 'HN697', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (33, 'HN0801高腰弹力直筒哈伦老爹萝卜裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 'HN0801', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 25.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (34, 'HN621高腰直筒宽松破洞牛仔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 'HN621', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (35, 'HN662高腰直筒牛仔裤女泫雅bf风小雏菊绣花', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 'HN662', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (36, 'HN692松紧高腰宽松直筒萝卜哈伦九分裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 'HN692', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (37, 'HN106高腰弹力紧身小脚九分铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 'HN106', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (38, 'HN663高腰阔腿裤宽松直筒爱心刺绣拖地长裤潮', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 'HN663', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (39, 'HN022高腰弹力九分小脚铅笔裤', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 'HN022', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (40, 'HN668高腰哈伦松紧腰小个子束脚老爹九分裤子', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 'HN668', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (41, 'HN667可调节高腰直筒牛仔裤女', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 'HN667', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (42, 'HN222高腰宽松阔腿牛仔裤', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 'HN222', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 30.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (43, 'HN694半松紧高腰牛仔裤老爹裤', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 'HN694', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (44, 'HN660高腰直筒牛仔裤女腰围可调春秋季', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 'HN660', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (45, 'HN686牛仔裤女宽松vibe风', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 'HN686', '', 28, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 39.00, NULL, 26, 0, '不分季节', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (46, 'HN021豹纹加绒牛仔裤女铅笔小脚裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 'HN021', '', 31, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 31.00, 0.00, 39.00, NULL, 26, 0, '冬季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (47, 'JKL805高腰阔腿牛仔裤女直筒宽松', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 'JKL805', '', 28, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 40.00, 5.00, 69.00, NULL, 31, 0, '不分季节', '', '', '2022', '棉85% 聚酯纤维6.5% 再生纤维素纤维8.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (48, 'HN180高腰牛仔裤女秋季九分老爹裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 'HN180', '', 30, '', '建议80-125斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 29.00, 0.00, 39.00, NULL, 26, 0, '春秋季', '', '', '2022', '牛仔布', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (49, 'JKL9098哈伦裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9098.jpg', 'JKL9098', '', 30, '', '有弹力', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 48.00, 0.00, 69.00, NULL, 31, 0, '不分季节', '', '', '2022', '棉72% 聚酯纤维25.5% 氨纶2.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (53, 'JKL9907小直筒烟管裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9907.jpg', 'JKL9907', '', 32, '', '建议80-140斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 40.00, 0.00, 89.00, NULL, 31, 0, '不分季节', '微弹', '高腰', '2022', '棉72% 聚酯纤维25.5% 氨纶2.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (54, 'JKL6010松紧腰哈伦裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6010.jpg', 'JKL6010', '', 30, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 43.00, 0.00, 69.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '70%棉     20%聚酯纤维     10%再生纤维素纤维', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (55, 'JKL906阔腿牛仔裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL906.jpg', 'JKL906', '', 28, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 42.00, 0.00, 69.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '棉85% 聚酯纤维6.5% 再生纤维素纤维8.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (56, 'JKL9977喇叭牛仔裤锁边', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/9977.jpg', 'JKL9977', '', 29, '', '建议70-145斤', 1, 99, 0, 0, 103, 58, 75, 0, 0, '', 50.00, 0.00, 89.00, NULL, 31, 0, '不分季节', '中弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (59, 'JKL9978喇叭牛仔裤毛边', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/9978.jpg', 'JKL9978', '', 29, '', '建议70-145斤', 1, 99, 0, 0, 103, 58, 75, 0, 0, '', 50.00, 0.00, 89.00, NULL, 31, 0, '不分季节', '中弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (60, 'JKL9950高腰阔腿直筒牛仔裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9950_11.jpg', 'JKL9950', '', 28, '', '建议70-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 46.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '中弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (61, 'JKL8990高腰阔腿牛仔裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL8990.jpg', 'JKL8990', '', 28, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 43.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '棉93.6% 粘纤4.7% 聚酯纤维1.7%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (62, 'JKL9938牛仔微喇裤裤脚开叉', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 'JKL9938', '', 29, '', '建议70-150斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 44.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '高弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (63, 'JKL6001小脚牛仔裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 'JKL6001', '', 31, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 40.00, 0.00, 69.00, NULL, 31, 0, '不分季节', '中弹', '高腰', '2022', '棉：98% 氨纶：2%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (64, 'JKL9909开叉微喇叭裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 'JKL9909', '', 29, '', '建议80-145斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 50.00, 0.00, 89.00, NULL, 31, 0, '不分季节', '高弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (65, 'GZYYZ7277复古显瘦灯芯绒a字半身裙', 'https://cbu01.alicdn.com/img/ibank/O1CN01lfHUDo1p3HVme2o7Q_!!2214743335304-0-cib.jpg', 'GZYYZ7277', '', 8, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 54.00, 0.00, 79.00, NULL, 32, 0, '不分季节', '无弹', '高腰', '2022', '棉，涤纶（聚酯纤维）', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (66, 'JKL1973复古蓝哈伦牛仔裤长裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 'JKL1973', '', 30, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 44.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '棉85%再生纤维素纤维8.5%聚酯纤维6.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (67, 'JKL1951阔腿长裤加长裤', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 'JKL1951', '', 28, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 42.00, 0.00, 79.00, NULL, 31, 0, '不分季节', '无弹', '高腰', '2022', '棉85%再生纤维素纤维8.5%聚酯纤维6.5%', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (68, 'JKL3112松紧腰束脚哈伦裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 'JKL3112', '', 30, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 42.00, 0.00, 69.00, NULL, 31, 0, '春秋季', '无弹', '高腰', '2022', '72%棉 25.5%聚酯纤维 2.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (69, 'KH9734微喇叭牛仔裤女开叉', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 'KH9734', '', 29, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 39.00, 0.00, 69.00, NULL, 33, 0, '春秋季', '高弹', '高腰', '2022', '69%棉  29.5%聚酯纤维 1.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (70, 'KH9826小脚牛仔裤女', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 'KH9826', '', 31, '', '建议80-135斤', 1, 0, 0, 0, 0, 0, 0, 0, 0, '', 40.00, 0.00, 79.00, NULL, 33, 0, '春秋季', '中弹', '高腰', '2022', '69%棉  29.5%聚酯纤维 1.5%氨纶', NULL, 0, 0, 'admin', '2023-12-29 15:55:39', 'admin', '2023-12-29 15:55:39');
INSERT INTO `erp_goods` VALUES (71, 'aaa', 'aaa', 'aaaaa', '', 2, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 12.00, 0.00, 0.00, NULL, 33, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2024-01-14 21:52:30', NULL, NULL);
INSERT INTO `erp_goods` VALUES (74, '测试测试', 'http://localhost:8080/preview/images/47', 'A0012D', '', 2, '', '', 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 12.00, 0.00, 0.00, NULL, 33, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 'admin', '2024-01-16 10:34:33', NULL, NULL);

-- ----------------------------
-- Table structure for erp_goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_attribute`;
CREATE TABLE `erp_goods_attribute`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NULL DEFAULT 0 COMMENT '商品id',
  `attribute_id` int NULL DEFAULT NULL COMMENT '属性id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性名',
  `value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for erp_goods_brand
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_brand`;
CREATE TABLE `erp_goods_brand`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '品牌名',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_brand
-- ----------------------------
INSERT INTO `erp_goods_brand` VALUES (1, '梦小妮', 1, 'admin', '2023-12-29 13:44:29', 'admin', '2023-12-29 13:44:29');

-- ----------------------------
-- Table structure for erp_goods_category
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category`;
CREATE TABLE `erp_goods_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类编码',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` int NULL DEFAULT NULL COMMENT '上架分类id',
  `path` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类路径',
  `sort` int NULL DEFAULT 0 COMMENT '排序值',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片',
  `isDelete` tinyint(1) NULL DEFAULT 0 COMMENT '0正常  1删除',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10045 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_category
-- ----------------------------
INSERT INTO `erp_goods_category` VALUES (1, 'NVZHUANG', '女装', NULL, 0, '0', 0, '', 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (2, 'MAOYI', '毛衣/针织衫', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (3, 'TXU', 'T恤', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (4, 'LIANYIQUN', '连衣裙', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (5, 'XIUXIANKU', '休闲裤', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (6, 'WAITAO', '外套', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (7, 'ZHENZHIPJ', '内衣/背心', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (8, 'SUOZHI', '半身裙', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (9, NULL, '衬衫', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (10, NULL, '箱包', NULL, 0, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (11, NULL, '双肩包', NULL, 10, '0|10', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (12, NULL, '单肩包', NULL, 10, '0|10', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (13, NULL, '套装', NULL, 1, '0|1', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (14, NULL, '短裙', NULL, 10, '0|8', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (15, NULL, '半身裙', NULL, 10, '0|8', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (16, NULL, '连衣裙', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (17, NULL, '针织裤', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (18, NULL, '针织短裙', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (19, NULL, '针织外套', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (20, NULL, '针织背心', NULL, 10, '0|1', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (21, NULL, 'T恤衫', NULL, 10, '0|8', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (22, NULL, '梭织衬衫', NULL, 10, '0|8', 0, NULL, 1, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (23, 'BAIHUO', '百货', NULL, 0, '0', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (24, NULL, '调味调料', NULL, 23, '0|23', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (25, NULL, '小百货', NULL, 23, '0|23', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (26, 'NIUZAI', '牛仔裤', NULL, 1, '0|1|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (27, NULL, '牛仔短裤', NULL, 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (28, NULL, '阔腿裤', NULL, 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (29, NULL, '喇叭裤', NULL, 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (30, NULL, '哈伦裤', '哈伦萝卜老爹裤', 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (31, NULL, '铅笔裤', '小脚裤、紧身裤、铅笔裤', 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (32, NULL, '直筒裤', '小直筒烟管裤', 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);
INSERT INTO `erp_goods_category` VALUES (33, NULL, '背带裤', '', 26, '0|26', 0, NULL, 0, 'admin', '2023-12-29 14:42:36', NULL, NULL);

-- ----------------------------
-- Table structure for erp_goods_category_attribute
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category_attribute`;
CREATE TABLE `erp_goods_category_attribute`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `category_id` int NOT NULL,
  `type` int NOT NULL DEFAULT 0 COMMENT '类型：0属性1规格',
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '\'属性名\'',
  `code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定值color颜色size尺码style款式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 404676611 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_category_attribute
-- ----------------------------
INSERT INTO `erp_goods_category_attribute` VALUES (114, 1, 1, '颜色', 'color');
INSERT INTO `erp_goods_category_attribute` VALUES (115, 1, 1, '尺码', 'size');
INSERT INTO `erp_goods_category_attribute` VALUES (116, 1, 1, '款式', 'style');

-- ----------------------------
-- Table structure for erp_goods_category_attribute_value
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_category_attribute_value`;
CREATE TABLE `erp_goods_category_attribute_value`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键，属性值id',
  `category_attribute_id` int NULL DEFAULT NULL COMMENT '属性id',
  `value` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '属性值文本',
  `sku_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成SKU的编码',
  `orderNum` int NULL DEFAULT 0,
  `isDelete` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 424 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_category_attribute_value
-- ----------------------------
INSERT INTO `erp_goods_category_attribute_value` VALUES (308, 114, '黑色', '01', 999, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (309, 114, '米杏', '02', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (310, 114, '芒果黄', '03', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (311, 114, '中花灰', '04', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (312, 114, '浅杏', '05', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (313, 114, '中粉', '06', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (314, 114, '烟灰色', '07', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (315, 114, '秋香绿', '08', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (316, 114, '花兰', '09', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (317, 114, '杏色', '10', 698, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (318, 114, '芥黄', '11', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (319, 114, '深蓝色', '12', 993, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (320, 114, '大红', '13', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (321, 114, '彩兰', '14', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (322, 114, '白色', '15', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (323, 114, '花米驼', '16', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (324, 114, '粉红', '17', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (325, 114, '黄杏', '18', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (326, 114, '橙红', '19', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (327, 114, '木绿', '20', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (328, 114, '草绿', '21', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (329, 114, '早红', '22', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (330, 114, '咖啡', '23', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (331, 114, '灰色', '24', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (332, 114, '浅绿', '25', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (333, 114, '大红色', '26', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (334, 114, '桔色', '27', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (335, 114, '卡其', '28', 992, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (336, 114, '蓝灰色', '29', 996, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (337, 114, '湖蓝', '30', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (338, 114, '咖啡色', '31', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (339, 114, '蓝绿', '32', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (340, 115, '均码', '00', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (341, 115, 'S', '01', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (342, 115, 'M', '02', 87, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (343, 115, 'L', '03', 86, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (344, 115, 'XL', '04', 85, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (345, 115, '2XL', '05', 84, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (346, 115, '3XL', '06', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (347, 115, '4XL', '07', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (348, 115, '5XL', '08', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (349, 114, '雾霾蓝', '33', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (350, 114, '浅粉红', '34', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (351, 114, '蓝色', '35', 998, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (352, 114, '花色', '36', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (353, 114, '香槟色', '37', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (354, 114, '紫色', '38', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (355, 114, '砖红色', '39', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (356, 114, '复古蓝', '40', 995, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (357, 114, '烟灰', '41', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (358, 114, '橙黄', '42', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (359, 114, '黄色', '43', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (360, 114, '梅子色', '56', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (361, 114, '浅蓝色', '50', 994, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (362, 114, '宝蓝色', '44', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (363, 114, '浅黄', '45', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (364, 114, '浅紫', '49', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (365, 114, '酒红', '57', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (366, 114, '米白', '47', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (367, 114, '复古蓝九分', '48', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (368, 114, '卡灰', '51', 992, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (369, 114, '玫红', '52', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (370, 114, '彩蓝', '53', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (371, 114, '青蓝淡黄', '54', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (372, 114, '紫白', '55', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (373, 114, '碳灰', '58', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (374, 114, '深蓝色加绒', '59', 794, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (375, 114, '深紫色', '60', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (376, 114, '橙色', '61', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (377, 114, '墨绿色', '62', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (378, 114, '桃粉色', '63', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (379, 114, '蓝灰色九分', '64', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (380, 114, '黑色九分', '65', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (381, 114, '新洋米', '67', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (382, 114, '藏蓝色', '68', 99, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (383, 114, '深蓝九分', '69', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (384, 114, '深蓝长款', '70', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (385, 114, '米白色', '71', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (386, 114, '军绿色', '72', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (387, 114, '柠檬黄', '73', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (388, 114, '灰紫', '74', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (389, 114, '黑灰色', '75', 997, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (390, 114, '焦糖红', '76', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (391, 114, '酱紫', '78', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (392, 114, '红杏', '46', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (393, 114, '银灰', '79', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (394, 115, 'XS', '09', 89, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (395, 114, '无色', '00', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (396, 114, '条纹', '80', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (397, 114, '花色/彩色', '81', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (398, 114, '波点', '82', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (399, 114, '字母', '83', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (400, 114, '绿色', '84', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (401, 115, '25', '25', 69, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (402, 115, '26', '26', 68, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (403, 115, '27', '27', 67, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (404, 115, '28', '28', 66, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (405, 115, '29', '29', 65, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (406, 115, '30', '30', 64, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (407, 115, '31', '31', 63, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (408, 115, '32', '32', 62, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (409, 114, '黑色加绒', '101', 799, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (410, 114, '黑灰色加绒', '175', 798, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (411, 114, '蓝灰色加绒', '129', 797, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (412, 114, '复古蓝加绒', '140', 796, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (413, 114, '浅蓝色加绒', '150', 795, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (414, 116, '默认', NULL, 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (415, 116, '加长裤', 'JC', 66, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (416, 116, '长裤', 'CK', 68, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (417, 116, '九分', 'JF', 88, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (418, 116, '八分', 'BF', 86, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (419, 116, '九分加绒', 'JFR', 87, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (420, 116, '单裤', 'D', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (421, 116, '加绒', 'R', 0, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (422, 116, '长裤加绒', 'CR', 65, 0);
INSERT INTO `erp_goods_category_attribute_value` VALUES (423, 116, '加长裤加绒', 'JCR', 67, 0);

-- ----------------------------
-- Table structure for erp_goods_spec
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_spec`;
CREATE TABLE `erp_goods_spec`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `goods_id` bigint NOT NULL COMMENT '商品id',
  `spec_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '规格名',
  `spec_num` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格编码',
  `color_id` int NULL DEFAULT 0 COMMENT '颜色id',
  `color_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色值',
  `color_image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色图片',
  `size_id` int NULL DEFAULT 0 COMMENT '尺码id',
  `size_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '尺码值',
  `style_id` int NULL DEFAULT 0 COMMENT '款式id',
  `style_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '款式值',
  `bar_code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '库存条形码',
  `pur_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '预计采购价',
  `whole_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议批发价',
  `retail_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '建议零售价',
  `unit_cost` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '单位成本',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态',
  `low_qty` int NULL DEFAULT 0 COMMENT '最低库存（预警）',
  `high_qty` int NULL DEFAULT 0 COMMENT '最高库存（预警）',
  `disable` tinyint(1) NULL DEFAULT 0 COMMENT '0启用   1禁用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE,
  INDEX `number`(`spec_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1372 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品规格库存管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_spec
-- ----------------------------
INSERT INTO `erp_goods_spec` VALUES (23, 9, '', '2720210080260001', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (24, 9, '', '2720210080260002', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (25, 9, '', '2720210080260003', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (26, 9, '', '2720210080260004', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (27, 9, '', '2720210080260005', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (28, 9, '', '2720210080260101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (29, 9, '', '2720210080260102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (30, 9, '', '2720210080260103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (31, 9, '', '2720210080260104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (32, 9, '', '2720210080260105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (33, 9, '', '2720210080260201', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (34, 9, '', '2720210080260202', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (35, 9, '', '2720210080260203', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (36, 9, '', '2720210080260204', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (37, 9, '', '2720210080260205', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016mr0RO2FOyB3ItCEP_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (38, 9, '', '2720210080260301', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (39, 9, '', '2720210080260302', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (40, 9, '', '2720210080260303', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (41, 9, '', '2720210080260304', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (42, 9, '', '2720210080260305', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (43, 10, '', '27202208580101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (44, 10, '', '27202208580102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (45, 10, '', '27202208580103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (46, 10, '', '27202208580104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (47, 10, '', '27202208580105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (48, 10, '', '27202208580201', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (49, 10, '', '27202208580202', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (50, 10, '', '27202208580203', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (51, 10, '', '27202208580204', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (52, 10, '', '27202208580205', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (53, 10, '', '27202208580301', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (54, 10, '', '27202208580302', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (55, 10, '', '27202208580303', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (56, 10, '', '27202208580304', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (57, 10, '', '27202208580305', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 20.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (58, 11, '', '27202206080101', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (59, 11, '', '27202206080102', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (60, 11, '', '27202206080103', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (61, 11, '', '27202206080104', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (62, 11, '', '27202206080105', 322, '白色', 'http://img.huayikeji.com/zggrr12gadsncs7q4ecdy2v47cj7g073', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (63, 11, '', '27202206080201', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (64, 11, '', '27202206080202', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (65, 11, '', '27202206080203', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (66, 11, '', '27202206080204', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (67, 11, '', '27202206080205', 308, '黑色', 'http://img.huayikeji.com/jx2xgaui8rrw8ol4kazfgr0p7u3c3iqe', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (68, 11, '', '27202206080301', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (69, 11, '', '27202206080302', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (70, 11, '', '27202206080303', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (71, 11, '', '27202206080304', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (72, 11, '', '27202206080305', 389, '黑灰色', 'http://img.huayikeji.com/8gfzlq5mtu373cl4snlbpr1tsdty6fkp', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (73, 11, '', '27202206080401', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (74, 11, '', '27202206080402', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (75, 11, '', '27202206080403', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (76, 11, '', '27202206080404', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (77, 11, '', '27202206080405', 361, '浅蓝色', 'http://img.huayikeji.com/o91btx5iuz3qyl55u022m6zonzk7aykv', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (78, 11, '', '27202206080501', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (79, 11, '', '27202206080502', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (80, 11, '', '27202206080503', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (81, 11, '', '27202206080504', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (82, 11, '', '27202206080505', 319, '深蓝色', 'http://img.huayikeji.com/j7xyuq39n4fc7sb84yctn47iqsce9hkw', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (83, 12, '', '27202202700101', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (84, 12, '', '27202202700102', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (85, 12, '', '27202202700103', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (86, 12, '', '27202202700104', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (87, 12, '', '27202202700105', 308, '黑色', 'http://img.huayikeji.com/0wx2dy9e6yhrd2vy1y7lrr4e0bd1vvh3', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (88, 13, '', '28202206810101', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (89, 13, '', '28202206810102', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (90, 13, '', '28202206810103', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (91, 13, '', '28202206810104', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (92, 13, '', '28202206810105', 356, '复古蓝', 'http://img.huayikeji.com/6xzfygyzbjppcn51wxfmuoaikp4p0o7w', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (93, 13, '', '28202206810201', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (94, 13, '', '28202206810202', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (95, 13, '', '28202206810203', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (96, 13, '', '28202206810204', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (97, 13, '', '28202206810205', 361, '浅蓝色', 'http://img.huayikeji.com/eis9r0e4dnb7kis9qaia5xu4j9brkoof', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (98, 13, '', '28202206810301', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (99, 13, '', '28202206810302', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (100, 13, '', '28202206810303', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (101, 13, '', '28202206810304', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (102, 13, '', '28202206810305', 389, '黑灰色', 'http://img.huayikeji.com/2nqlidwzpxb5x836krxpge56x2l8003p', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (103, 14, '', '27202207080101', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 341, 'S', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (104, 14, '', '27202207080102', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 342, 'M', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (105, 14, '', '27202207080103', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 343, 'L', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (106, 14, '', '27202207080104', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 344, 'XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (107, 14, '', '27202207080105', 0, '灰色', 'http://img.huayikeji.com/5ztnyd9ahc2g6xw2l05kmcmcpk2rx6vh', 345, '2XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (108, 14, '', '27202207080201', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 341, 'S', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (109, 14, '', '27202207080202', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 342, 'M', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (110, 14, '', '27202207080203', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 343, 'L', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (111, 14, '', '27202207080204', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 344, 'XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (112, 14, '', '27202207080205', 308, '黑色', 'http://img.huayikeji.com/wx72lmbomku46xjskbp8nrsj346wamnk', 345, '2XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (113, 14, '', '27202207080301', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 341, 'S', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (114, 14, '', '27202207080302', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 342, 'M', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (115, 14, '', '27202207080303', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 343, 'L', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (116, 14, '', '27202207080304', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 344, 'XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (117, 14, '', '27202207080305', 361, '浅蓝色', 'http://img.huayikeji.com/jg9g9ntyor1c0khja0v6jn8qc0jzslgw', 345, '2XL', 0, '', NULL, 24.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (118, 15, '', '28202106610101', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (119, 15, '', '28202106610102', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (120, 15, '', '28202106610103', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (121, 15, '', '28202106610104', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (122, 15, '', '28202106610105', 356, '复古蓝', 'http://img.huayikeji.com/2a125jimb6nh37qjqp9k7jkov8hyo3ek', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (123, 15, '', '28202106610201', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (124, 15, '', '28202106610202', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (125, 15, '', '28202106610203', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (126, 15, '', '28202106610204', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (127, 15, '', '28202106610205', 361, '浅蓝色', 'http://img.huayikeji.com/600qtwzefc9qj9njwwoza2zllzph4p6n', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (128, 15, '', '28202106610301', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (129, 15, '', '28202106610302', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (130, 15, '', '28202106610303', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (131, 15, '', '28202106610304', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (132, 15, '', '28202106610305', 389, '黑灰色', 'http://img.huayikeji.com/qj2p2e89qmlk1fa0n1f43xr23a8r6gmc', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (133, 15, '', '28202106610401', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (134, 15, '', '28202106610402', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (135, 15, '', '28202106610403', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (136, 15, '', '28202106610404', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (137, 15, '', '28202106610405', 308, '黑色', 'http://img.huayikeji.com/zb6q0hbaqi6r9z1glijty6olfaijtnvv', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (138, 15, '', '28202106610501', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (139, 15, '', '28202106610502', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (140, 15, '', '28202106610503', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (141, 15, '', '28202106610504', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (142, 15, '', '28202106610505', 0, '粉色', 'http://img.huayikeji.com/icme41bh1veeeqadhqflep3rl3p0tsvq', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (143, 15, '', '28202106610601', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (144, 15, '', '28202106610602', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (145, 15, '', '28202106610603', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (146, 15, '', '28202106610604', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (147, 15, '', '28202106610605', 0, '黄色', 'http://img.huayikeji.com/ma9jyuic0d3p1mqt3afzahoev5ypzzby', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (148, 15, '', '28202106610701', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (149, 15, '', '28202106610702', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (150, 15, '', '28202106610703', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (151, 15, '', '28202106610704', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (152, 15, '', '28202106610705', 0, '薄荷绿', 'http://img.huayikeji.com/5e4mbxb12qt8j1hi2yrd92io21m8izrs', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (153, 15, '', '28202106610801', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (154, 15, '', '28202106610802', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (155, 15, '', '28202106610803', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (156, 15, '', '28202106610804', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (157, 15, '', '28202106610805', 0, '卡其色', 'http://img.huayikeji.com/us3g4u9qqoj3g8vxeedcjd8clv5estoo', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (158, 16, '', '28202106780001', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (159, 16, '', '28202106780002', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (160, 16, '', '28202106780003', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (161, 16, '', '28202106780004', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (162, 16, '', '28202106780005', 361, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (163, 17, '', '03202208010101', 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', 342, 'M', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (164, 17, '', '03202208010102', 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', 343, 'L', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (165, 17, '', '03202208010103', 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', 344, 'XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (166, 17, '', '03202208010104', 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv', 345, '2XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (167, 17, '', '03202208010201', 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m', 342, 'M', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (168, 17, '', '03202208010202', 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m', 343, 'L', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (169, 17, '', '03202208010203', 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m', 344, 'XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (170, 17, '', '03202208010204', 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m', 345, '2XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (171, 17, '', '03202208010301', 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4', 342, 'M', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (172, 17, '', '03202208010302', 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4', 343, 'L', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (173, 17, '', '03202208010303', 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4', 344, 'XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (174, 17, '', '03202208010304', 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4', 345, '2XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (175, 17, '', '03202208010401', 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484', 342, 'M', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (176, 17, '', '03202208010402', 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484', 343, 'L', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (177, 17, '', '03202208010403', 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484', 344, 'XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (178, 17, '', '03202208010404', 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484', 345, '2XL', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (179, 18, '', 'HN202200140101', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (180, 18, '', 'HN202200140102', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (181, 18, '', 'HN202200140103', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (182, 18, '', 'HN202200140104', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (183, 18, '', 'HN202200140105', 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (184, 18, '', 'HN202200140201', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (185, 18, '', 'HN202200140202', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (186, 18, '', 'HN202200140203', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (187, 18, '', 'HN202200140204', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (188, 18, '', 'HN202200140205', 356, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (189, 18, '', 'HN202200140301', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (190, 18, '', 'HN202200140302', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (191, 18, '', 'HN202200140303', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (192, 18, '', 'HN202200140304', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (193, 18, '', 'HN202200140305', 361, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (194, 19, '', 'HN202200250125', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (195, 19, '', 'HN202200250126', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (196, 19, '', 'HN202200250107', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (197, 19, '', 'HN202200250128', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (198, 19, '', 'HN202200250129', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (199, 19, '', 'HN202200250130', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (200, 19, '', 'HN202200250131', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (201, 19, '', 'HN202200250132', 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (202, 19, '', 'HN202200250225', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (203, 19, '', 'HN202200250226', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (204, 19, '', 'HN202200250227', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (205, 19, '', 'HN202200250228', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (206, 19, '', 'HN202200250229', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (207, 19, '', 'HN202200250230', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (208, 19, '', 'HN202200250231', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (209, 19, '', 'HN202200250232', 389, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (210, 19, '', 'HN202200250325', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (211, 19, '', 'HN202200250326', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (212, 19, '', 'HN202200250327', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (213, 19, '', 'HN202200250328', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (214, 19, '', 'HN202200250329', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (215, 19, '', 'HN202200250330', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (216, 19, '', 'HN202200250331', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (217, 19, '', 'HN202200250332', 361, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (218, 19, '', 'HN202200250425', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (219, 19, '', 'HN202200250426', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (220, 19, '', 'HN202200250427', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (221, 19, '', 'HN202200250428', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (222, 19, '', 'HN202200250429', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (223, 19, '', 'HN202200250430', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (224, 19, '', 'HN202200250431', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (225, 19, '', 'HN202200250432', 336, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (226, 20, '', 'HN202200290125', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (227, 20, '', 'HN202200290126', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (228, 20, '', 'HN202200290127', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (229, 20, '', 'HN202200290128', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (230, 20, '', 'HN202200290129', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (231, 20, '', 'HN202200290130', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (232, 20, '', 'HN202200290131', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (233, 20, '', 'HN202200290132', 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (234, 20, '', 'HN202200290225', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (235, 20, '', 'HN202200290226', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (236, 20, '', 'HN202200290227', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (237, 20, '', 'HN202200290228', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (238, 20, '', 'HN202200290229', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (239, 20, '', 'HN202200290230', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (240, 20, '', 'HN202200290231', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (241, 20, '', 'HN202200290232', 389, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (242, 20, '', 'HN202200290325', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (243, 20, '', 'HN202200290326', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (244, 20, '', 'HN202200290327', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (245, 20, '', 'HN202200290328', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (246, 20, '', 'HN202200290329', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (247, 20, '', 'HN202200290330', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (248, 20, '', 'HN202200290331', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (249, 20, '', 'HN202200290332', 356, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (250, 21, '', 'HN202200150125', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 394, 'XS', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (251, 21, '', 'HN202200150126', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (252, 21, '', 'HN202200150127', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (253, 21, '', 'HN202200150128', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (254, 21, '', 'HN202200150129', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (255, 21, '', 'HN202200150130', 361, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (256, 21, '', 'HN202200150225', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 394, 'XS', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (257, 21, '', 'HN202200150226', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (258, 21, '', 'HN202200150227', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (259, 21, '', 'HN202200150228', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (260, 21, '', 'HN202200150229', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (261, 21, '', 'HN202200150230', 356, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (262, 21, '', 'HN202200150325', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 394, 'XS', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (263, 21, '', 'HN202200150326', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (264, 21, '', 'HN202200150327', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (265, 21, '', 'HN202200150328', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (266, 21, '', 'HN202200150329', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (267, 21, '', 'HN202200150330', 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (268, 22, '', 'HN202200200125', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (269, 22, '', 'HN202200200126', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (270, 22, '', 'HN202200200127', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (271, 22, '', 'HN202200200128', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (272, 22, '', 'HN202200200129', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (273, 22, '', 'HN202200200130', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (274, 22, '', 'HN202200200131', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (275, 22, '', 'HN202200200132', 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (276, 22, '', 'HN202200200225', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (277, 22, '', 'HN202200200226', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (278, 22, '', 'HN202200200227', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (279, 22, '', 'HN202200200228', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (280, 22, '', 'HN202200200229', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (281, 22, '', 'HN202200200230', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (282, 22, '', 'HN202200200231', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (283, 22, '', 'HN202200200232', 389, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (284, 22, '', 'HN202200200325', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (285, 22, '', 'HN202200200326', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (286, 22, '', 'HN202200200327', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (287, 22, '', 'HN202200200328', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (288, 22, '', 'HN202200200329', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (289, 22, '', 'HN202200200330', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (290, 22, '', 'HN202200200331', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (291, 22, '', 'HN202200200332', 361, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (292, 22, '', 'HN202200200425', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (293, 22, '', 'HN202200200426', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (294, 22, '', 'HN202200200427', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (295, 22, '', 'HN202200200428', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (296, 22, '', 'HN202200200429', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (297, 22, '', 'HN202200200430', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (298, 22, '', 'HN202200200431', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (299, 22, '', 'HN202200200435', 336, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (300, 23, '', 'HN202200240125', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (301, 23, '', 'HN202200240126', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (302, 23, '', 'HN202200240127', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (303, 23, '', 'HN202200240128', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (304, 23, '', 'HN202200240129', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (305, 23, '', 'HN202200240130', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (306, 23, '', 'HN202200240131', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (307, 23, '', 'HN202200240132', 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (308, 23, '', 'HN202200240225', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (309, 23, '', 'HN202200240226', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (310, 23, '', 'HN202200240227', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (311, 23, '', 'HN202200240228', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (312, 23, '', 'HN202200240229', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (313, 23, '', 'HN202200240230', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (314, 23, '', 'HN202200240231', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (315, 23, '', 'HN202200240232', 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (316, 23, '', 'HN202200240325', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (317, 23, '', 'HN202200240326', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (318, 23, '', 'HN202200240327', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (319, 23, '', 'HN202200240328', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (320, 23, '', 'HN202200240329', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (321, 23, '', 'HN202200240330', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (322, 23, '', 'HN202200240331', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (323, 23, '', 'HN202200240332', 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (324, 23, '', 'HN202200240425', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (325, 23, '', 'HN202200240426', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (326, 23, '', 'HN202200240427', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (327, 23, '', 'HN202200240428', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (328, 23, '', 'HN202200240429', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (329, 23, '', 'HN202200240430', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (330, 23, '', 'HN202200240431', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (331, 23, '', 'HN202200240432', 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr', 0, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (332, 24, '', 'HN202200120101', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (333, 24, '', 'HN202200120102', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (334, 24, '', 'HN202200120103', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (335, 24, '', 'HN202200120104', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (336, 24, '', 'HN202200120105', 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (337, 25, '', 'OXN06910125', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '25', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (338, 25, '', 'OXN06910126', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '26', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (339, 25, '', 'OXN06910127', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '27', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (340, 25, '', 'OXN06910128', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '28', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (341, 25, '', 'OXN06910129', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '29', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (342, 25, '', 'OXN06910130', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '30', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (343, 25, '', 'OXN06910131', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '31', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (344, 25, '', 'OXN06910132', 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0', 0, '32', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (345, 25, '', 'OXN06910225', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '25', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (346, 25, '', 'OXN06910226', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '26', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (347, 25, '', 'OXN06910227', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '27', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (348, 25, '', 'OXN06910228', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '28', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (349, 25, '', 'OXN06910229', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '29', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (350, 25, '', 'OXN06910230', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '30', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (351, 25, '', 'OXN06910231', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '31', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (352, 25, '', 'OXN06910232', 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql', 0, '32', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (353, 26, '', 'HN06300101', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (354, 26, '', 'HN06300102', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (355, 26, '', 'HN06300103', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (356, 26, '', 'HN06300104', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (357, 26, '', 'HN06300105', 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (358, 26, '', 'HN06300201', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (359, 26, '', 'HN06300202', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (360, 26, '', 'HN06300203', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (361, 26, '', 'HN06300204', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (362, 26, '', 'HN06300205', 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (363, 26, '', 'HN06300301', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (364, 26, '', 'HN06300302', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (365, 26, '', 'HN06300303', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (366, 26, '', 'HN06300304', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (367, 26, '', 'HN06300305', 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (368, 27, '', 'HN0234025', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 401, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (369, 27, '', 'HN0234026', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 402, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (370, 27, '', 'HN0234027', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (371, 27, '', 'HN0234028', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 404, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (372, 27, '', 'HN0234029', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 405, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (373, 27, '', 'HN0234030', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 406, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (374, 27, '', 'HN0234031', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 407, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (375, 27, '', 'HN0234032', 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1', 408, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (376, 27, '', 'HN0237525', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 401, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (377, 27, '', 'HN0237526', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 402, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (378, 27, '', 'HN0237527', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (379, 27, '', 'HN0237528', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 404, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (380, 27, '', 'HN0237529', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 405, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (381, 27, '', 'HN0237530', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 406, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (382, 27, '', 'HN0237531', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 407, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (383, 27, '', 'HN0237532', 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw', 408, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (384, 27, '', 'HN0232925', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 401, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (385, 27, '', 'HN0232926', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 402, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (386, 27, '', 'HN0232927', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (387, 27, '', 'HN0232928', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 404, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (388, 27, '', 'HN0232929', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 405, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (389, 27, '', 'HN0232930', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 406, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (390, 27, '', 'HN0232931', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 407, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (391, 27, '', 'HN0232932', 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo', 408, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (392, 27, '', 'HN0230125', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 401, '25', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (393, 27, '', 'HN0230126', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 402, '26', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (394, 27, '', 'HN0230127', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 403, '27', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (395, 27, '', 'HN0230128', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 404, '28', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (396, 27, '', 'HN0230129', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 405, '29', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (397, 27, '', 'HN0230130', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 406, '30', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (398, 27, '', 'HN0230131', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 407, '31', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (399, 27, '', 'HN0230132', 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7', 408, '32', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (400, 9, '', 'HN80264001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (401, 9, '', 'HN80264002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (402, 9, '', 'HN80264003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (403, 9, '', 'HN80264004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (404, 9, '', 'HN80264005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (405, 9, '', 'HN80267501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (406, 9, '', 'HN80267502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (407, 9, '', 'HN80267503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (408, 9, '', 'HN80267504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (409, 9, '', 'HN80267505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xa9IvK2FOyB0MYQJW_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 19.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (410, 28, '', 'HN6705001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (411, 28, '', 'HN6705002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (412, 28, '', 'HN6705003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (413, 28, '', 'HN6705004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (414, 28, '', 'HN6705005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (415, 28, '', 'HN6707501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (416, 28, '', 'HN6707502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (417, 28, '', 'HN6707503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (418, 28, '', 'HN6707504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (419, 28, '', 'HN6707505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (420, 28, '', 'HN6704001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (421, 28, '', 'HN6704002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (422, 28, '', 'HN6704003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (423, 28, '', 'HN6704004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (424, 28, '', 'HN6704005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (425, 29, '', 'HNP1820101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (426, 29, '', 'HNP1820102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (427, 29, '', 'HNP1820103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (428, 29, '', 'HNP1820104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (429, 29, '', 'HNP1820105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (430, 29, '', 'HNP1821501', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (431, 29, '', 'HNP1821502', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (432, 29, '', 'HNP1821503', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (433, 29, '', 'HNP1821504', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (434, 29, '', 'HNP1821505', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (435, 29, '', 'HNP1825001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (436, 29, '', 'HNP1825002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (437, 29, '', 'HNP1825003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (438, 29, '', 'HNP1825004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (439, 29, '', 'HNP1825005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 21.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (440, 30, '', 'HN6724001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (441, 30, '', 'HN6724002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (442, 30, '', 'HN6724003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (443, 30, '', 'HN6724004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (444, 30, '', 'HN6724005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (445, 31, '', 'HN8010101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (446, 31, '', 'HN8010102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (447, 31, '', 'HN8010103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (448, 31, '', 'HN8010104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (449, 31, '', 'HN8010105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (450, 31, '', 'HN8017501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (451, 31, '', 'HN8017502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (452, 31, '', 'HN8017503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (453, 31, '', 'HN8017504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (454, 31, '', 'HN8017505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (455, 31, '', 'HN8014001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (456, 31, '', 'HN8014002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (457, 31, '', 'HN8014003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (458, 31, '', 'HN8014004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (459, 31, '', 'HN8014005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (460, 31, '', 'HN8012901', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (461, 31, '', 'HN8012902', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (462, 31, '', 'HN8012903', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (463, 31, '', 'HN8012904', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (464, 31, '', 'HN8012905', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (465, 31, '', 'HN8015001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (466, 31, '', 'HN8015002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (467, 31, '', 'HN8015003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (468, 31, '', 'HN8015004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (469, 31, '', 'HN8015005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (470, 31, '', 'HN8011001', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 341, 'S', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (471, 31, '', 'HN8011002', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 342, 'M', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (472, 31, '', 'HN8011003', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 343, 'L', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (473, 31, '', 'HN8011004', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 344, 'XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (474, 31, '', 'HN8011005', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg', 345, '2XL', 0, '', NULL, 28.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (475, 32, '', 'HN6975001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (476, 32, '', 'HN6975002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (477, 32, '', 'HN6975003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (478, 32, '', 'HN6975004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (479, 32, '', 'HN6975005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (480, 32, '', 'HN6977501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (481, 32, '', 'HN6977502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (482, 32, '', 'HN6977503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (483, 32, '', 'HN6977504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (484, 32, '', 'HN6977505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (485, 32, '', 'HN6971001', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (486, 32, '', 'HN6971002', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (487, 32, '', 'HN6971003', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (488, 32, '', 'HN6971004', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (489, 32, '', 'HN6971005', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (490, 33, '', 'HN08010101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (491, 33, '', 'HN08010102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (492, 33, '', 'HN08010103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (493, 33, '', 'HN08010104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (494, 33, '', 'HN08010105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (495, 33, '', 'HN08017501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (496, 33, '', 'HN08017502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (497, 33, '', 'HN08017503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (498, 33, '', 'HN08017504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (499, 33, '', 'HN08017505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (500, 33, '', 'HN08012901', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (501, 33, '', 'HN08012902', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (502, 33, '', 'HN08012903', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (503, 33, '', 'HN08012904', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (504, 33, '', 'HN08012905', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (505, 33, '', 'HN08014001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (506, 33, '', 'HN08014002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (507, 33, '', 'HN08014003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (508, 33, '', 'HN08014004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (509, 33, '', 'HN08014005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (510, 34, '', 'HN6210101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (511, 34, '', 'HN6210102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (512, 34, '', 'HN6210103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (513, 34, '', 'HN6210104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (514, 34, '', 'HN6210105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (515, 34, '', 'HN6217501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (516, 34, '', 'HN6217502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (517, 34, '', 'HN6217503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (518, 34, '', 'HN6217504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (519, 34, '', 'HN6217505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (520, 34, '', 'HN6215001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (521, 34, '', 'HN6215002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (522, 34, '', 'HN6215003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (523, 34, '', 'HN6215004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (524, 34, '', 'HN6215005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (525, 34, '', 'HN6214001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (526, 34, '', 'HN6214002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (527, 34, '', 'HN6214003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (528, 34, '', 'HN6214004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (529, 34, '', 'HN6214005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (530, 35, '', 'HN6625001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (531, 35, '', 'HN6625002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (532, 35, '', 'HN6625003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (533, 35, '', 'HN6625004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (534, 35, '', 'HN6625005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (535, 36, '', 'HN6927501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (536, 36, '', 'HN6927502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (537, 36, '', 'HN6927503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (538, 36, '', 'HN6927504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (539, 36, '', 'HN6927505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (540, 36, '', 'HN6925001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (541, 36, '', 'HN6925002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (542, 36, '', 'HN6925003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (543, 36, '', 'HN6925004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (544, 36, '', 'HN6925005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (545, 37, '', 'HN1060101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (546, 37, '', 'HN1060102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (547, 37, '', 'HN1060103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (548, 37, '', 'HN1060104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (549, 37, '', 'HN1060105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (550, 37, '', 'HN1064001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (551, 37, '', 'HN1064002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (552, 37, '', 'HN1064003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (553, 37, '', 'HN1064004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (554, 37, '', 'HN1064005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (555, 37, '', 'HN1062901', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (556, 37, '', 'HN1062902', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (557, 37, '', 'HN1062903', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (558, 37, '', 'HN1062904', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (559, 37, '', 'HN1062905', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (560, 38, '', 'HN6635001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (561, 38, '', 'HN6635002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (562, 38, '', 'HN6635003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (563, 38, '', 'HN6635004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (564, 38, '', 'HN6635005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (565, 38, '', 'HN6637501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (566, 38, '', 'HN6637502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (567, 38, '', 'HN6637503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (568, 38, '', 'HN6637504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (569, 38, '', 'HN6637505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (570, 39, '', 'HN0220126', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (571, 39, '', 'HN0220127', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (572, 39, '', 'HN0220128', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (573, 39, '', 'HN0220129', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (574, 39, '', 'HN0220130', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (575, 39, '', 'HN0220131', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (576, 39, '', 'HN0220132', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (577, 39, '', 'HN0222926', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (578, 39, '', 'HN0222927', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (579, 39, '', 'HN0222928', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (580, 39, '', 'HN0222929', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (581, 39, '', 'HN0222930', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (582, 39, '', 'HN0222931', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (583, 39, '', 'HN0222932', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (584, 40, '', 'HN6685001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (585, 40, '', 'HN6685002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (586, 40, '', 'HN6685003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (587, 40, '', 'HN6685004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (588, 40, '', 'HN6685005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (589, 40, '', 'HN6681201', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (590, 40, '', 'HN6681202', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (591, 40, '', 'HN6681203', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (592, 40, '', 'HN6681204', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (593, 40, '', 'HN6681205', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (594, 40, '', 'HN6687501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (595, 40, '', 'HN6687502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (596, 40, '', 'HN6687503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (597, 40, '', 'HN6687504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (598, 40, '', 'HN6687505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (599, 41, '', 'HN6675001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (600, 41, '', 'HN6675002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (601, 41, '', 'HN6675003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (602, 41, '', 'HN6675004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (603, 41, '', 'HN6675005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (604, 41, '', 'HN6674001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (605, 41, '', 'HN6674002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (606, 41, '', 'HN6674003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (607, 41, '', 'HN6674004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (608, 41, '', 'HN6674005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (609, 42, '', 'HN2221226', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 402, '26', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (610, 42, '', 'HN2221227', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 403, '27', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (611, 42, '', 'HN2221228', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 404, '28', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (612, 42, '', 'HN2221229', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 405, '29', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (613, 42, '', 'HN2221230', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 406, '30', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (614, 42, '', 'HN2221231', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 407, '31', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (615, 42, '', 'HN2221232', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg', 408, '32', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (616, 42, '', 'HN2225026', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 402, '26', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (617, 42, '', 'HN2225027', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 403, '27', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (618, 42, '', 'HN2225028', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 404, '28', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (619, 42, '', 'HN2225029', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 405, '29', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (620, 42, '', 'HN2225030', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 406, '30', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (621, 42, '', 'HN2225031', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 407, '31', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (622, 42, '', 'HN2225032', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg', 408, '32', 0, '', NULL, 30.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (623, 43, '', 'HN6945001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (624, 43, '', 'HN6945002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (625, 43, '', 'HN6945003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (626, 43, '', 'HN6945004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (627, 43, '', 'HN6945005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (628, 43, '', 'HN6947501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (629, 43, '', 'HN6947502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (630, 43, '', 'HN6947503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (631, 43, '', 'HN6947504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (632, 43, '', 'HN6947505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (633, 44, '', 'HN6600101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (634, 44, '', 'HN6600102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (635, 44, '', 'HN6600103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (636, 44, '', 'HN6600104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (637, 44, '', 'HN6600105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (638, 44, '', 'HN6605001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (639, 44, '', 'HN6605002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (640, 44, '', 'HN6605003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (641, 44, '', 'HN6605004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (642, 44, '', 'HN6605005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (643, 44, '', 'HN6607501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (644, 44, '', 'HN6607502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (645, 44, '', 'HN6607503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (646, 44, '', 'HN6607504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (647, 44, '', 'HN6607505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (648, 44, '', 'HN6604001', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (649, 44, '', 'HN6604002', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (650, 44, '', 'HN6604003', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (651, 44, '', 'HN6604004', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (652, 44, '', 'HN6604005', 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (653, 45, '', 'HN6861501', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (654, 45, '', 'HN6861502', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (655, 45, '', 'HN6861503', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (656, 45, '', 'HN6861504', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (657, 45, '', 'HN6861505', 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (658, 45, '', 'HN6860101', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (659, 45, '', 'HN6860102', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (660, 45, '', 'HN6860103', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (661, 45, '', 'HN6860104', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (662, 45, '', 'HN6860105', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (663, 45, '', 'HN6865001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (664, 45, '', 'HN6865002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (665, 45, '', 'HN6865003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (666, 45, '', 'HN6865004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (667, 45, '', 'HN6865005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (668, 45, '', 'HN6867501', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (669, 45, '', 'HN6867502', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (670, 45, '', 'HN6867503', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (671, 45, '', 'HN6867504', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (672, 45, '', 'HN6867505', 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (673, 46, '', 'HN0210126', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (674, 46, '', 'HN0210127', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (675, 46, '', 'HN0210128', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (676, 46, '', 'HN0210129', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (677, 46, '', 'HN0210130', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (678, 46, '', 'HN0210131', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (679, 46, '', 'HN0210132', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (680, 46, '', 'HN0212826', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (681, 46, '', 'HN0212827', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (682, 46, '', 'HN0212828', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (683, 46, '', 'HN0212829', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (684, 46, '', 'HN0212830', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (685, 46, '', 'HN0212831', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (686, 46, '', 'HN0212832', 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (687, 46, '', 'HN0215026', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (688, 46, '', 'HN0215027', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (689, 46, '', 'HN0215028', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (690, 46, '', 'HN0215029', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (691, 46, '', 'HN0215030', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (692, 46, '', 'HN0215031', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (693, 46, '', 'HN0215032', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (694, 46, '', 'HN0212926', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (695, 46, '', 'HN0212927', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (696, 46, '', 'HN0212928', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (697, 46, '', 'HN0212929', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (698, 46, '', 'HN0212930', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (699, 46, '', 'HN0212931', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (700, 46, '', 'HN0212932', 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (701, 46, '', 'HN02110026', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (702, 46, '', 'HN02110027', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (703, 46, '', 'HN02110028', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (704, 46, '', 'HN02110029', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (705, 46, '', 'HN02110030', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (706, 46, '', 'HN02110031', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (707, 46, '', 'HN02110032', 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (708, 46, '', 'HN02128026', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (709, 46, '', 'HN02128027', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (710, 46, '', 'HN02128028', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (711, 46, '', 'HN02128029', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (712, 46, '', 'HN02128030', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (713, 46, '', 'HN02128031', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (714, 46, '', 'HN02128032', 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (715, 46, '', 'HN02129026', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (716, 46, '', 'HN02129027', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (717, 46, '', 'HN02129028', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (718, 46, '', 'HN02129029', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (719, 46, '', 'HN02129030', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (720, 46, '', 'HN02129031', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (721, 46, '', 'HN02129032', 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (722, 46, '', 'HN02150026', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (723, 46, '', 'HN02150027', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (724, 46, '', 'HN02150028', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (725, 46, '', 'HN02150029', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (726, 46, '', 'HN02150030', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (727, 46, '', 'HN02150031', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (728, 46, '', 'HN02150032', 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 31.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (729, 47, '', 'JKL8051209', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 394, 'XS', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (730, 47, '', 'JKL8051201', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 341, 'S', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (731, 47, '', 'JKL8051202', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 342, 'M', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (732, 47, '', 'JKL8051203', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 343, 'L', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (733, 47, '', 'JKL8051204', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 344, 'XL', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (734, 47, '', 'JKL8051205', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg', 345, '2XL', 0, '长款', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (735, 47, '', 'JKL80512009', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 394, 'XS', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (736, 47, '', 'JKL80512001', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 341, 'S', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (737, 47, '', 'JKL80512002', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 342, 'M', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (738, 47, '', 'JKL80512003', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 343, 'L', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (739, 47, '', 'JKL80512004', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 344, 'XL', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (740, 47, '', 'JKL80512005', 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg', 345, '2XL', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (741, 33, '', 'HN08015001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (742, 33, '', 'HN08015002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (743, 33, '', 'HN08015003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (744, 33, '', 'HN08015004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (745, 33, '', 'HN08015005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (746, 33, '', 'HN08011001', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (747, 33, '', 'HN08011002', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (748, 33, '', 'HN08011003', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (749, 33, '', 'HN08011004', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (750, 33, '', 'HN08011005', 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 25.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (751, 33, '', 'HN080110101', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (752, 33, '', 'HN080110102', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (753, 33, '', 'HN080110103', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (754, 33, '', 'HN080110104', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (755, 33, '', 'HN080110105', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (756, 33, '', 'HN080117501', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (757, 33, '', 'HN080117502', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (758, 33, '', 'HN080117503', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (759, 33, '', 'HN080117504', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (760, 33, '', 'HN080117505', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (761, 33, '', 'HN080112901', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (762, 33, '', 'HN080112902', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (763, 33, '', 'HN080112903', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (764, 33, '', 'HN080112904', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (765, 33, '', 'HN080112905', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (766, 33, '', 'HN080114001', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (767, 33, '', 'HN080114002', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (768, 33, '', 'HN080114003', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (769, 33, '', 'HN080114004', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (770, 33, '', 'HN080114005', 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (771, 33, '', 'HN080115001', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (772, 33, '', 'HN080115002', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (773, 33, '', 'HN080115003', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (774, 33, '', 'HN080115004', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (775, 33, '', 'HN080115005', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 32.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (776, 22, '', 'HN2022002010125', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 401, '25', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (777, 22, '', 'HN2022002010126', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (778, 22, '', 'HN2022002010127', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (779, 22, '', 'HN2022002010128', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (780, 22, '', 'HN2022002010129', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (781, 22, '', 'HN2022002010130', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (782, 22, '', 'HN2022002010131', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (783, 22, '', 'HN2022002010132', 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (784, 22, '', 'HN2022002017525', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 401, '25', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (785, 22, '', 'HN2022002017526', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (786, 22, '', 'HN2022002017527', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (787, 22, '', 'HN2022002017528', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (788, 22, '', 'HN2022002017529', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (789, 22, '', 'HN2022002017530', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (790, 22, '', 'HN2022002017531', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (791, 22, '', 'HN2022002017532', 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (792, 22, '', 'HN2022002012925', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 401, '25', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (793, 22, '', 'HN2022002012926', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (794, 22, '', 'HN2022002012927', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (795, 22, '', 'HN2022002012928', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (796, 22, '', 'HN2022002012929', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (797, 22, '', 'HN2022002012930', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (798, 22, '', 'HN2022002012931', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (799, 22, '', 'HN2022002012932', 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (800, 22, '', 'HN2022002015025', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 401, '25', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (801, 22, '', 'HN2022002015026', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 402, '26', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (802, 22, '', 'HN2022002015027', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 403, '27', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (803, 22, '', 'HN2022002015028', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 404, '28', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (804, 22, '', 'HN2022002015029', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 405, '29', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (805, 22, '', 'HN2022002015030', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 406, '30', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (806, 22, '', 'HN2022002015031', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 407, '31', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (807, 22, '', 'HN2022002015032', 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg', 408, '32', 0, '', NULL, 35.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (808, 48, '', 'HN1805001', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 341, 'S', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (809, 48, '', 'HN1805002', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 342, 'M', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (810, 48, '', 'HN1805003', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 343, 'L', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (811, 48, '', 'HN1805004', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 344, 'XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (812, 48, '', 'HN1805005', 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg', 345, '2XL', 0, '', NULL, 29.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (813, 49, '', 'JKL90984026', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 402, '26', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (814, 49, '', 'JKL90984027', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 403, '27', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (815, 49, '', 'JKL90984028', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 404, '28', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (816, 49, '', 'JKL90984029', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 405, '29', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (817, 49, '', 'JKL90984030', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 406, '30', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (818, 49, '', 'JKL90984031', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 407, '31', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (819, 49, '', 'JKL90984032', 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 408, '32', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (820, 49, '', 'JKL90982926', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 402, '26', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (821, 49, '', 'JKL90982927', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 403, '27', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (822, 49, '', 'JKL90982928', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 404, '28', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (823, 49, '', 'JKL90982929', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 405, '29', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (824, 49, '', 'JKL90982930', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 406, '30', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (825, 49, '', 'JKL90982931', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 407, '31', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (826, 49, '', 'JKL90982932', 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 408, '32', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (827, 49, '', 'JKL90980126', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 402, '26', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (828, 49, '', 'JKL90980127', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 403, '27', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (829, 49, '', 'JKL90980128', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 404, '28', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (830, 49, '', 'JKL90980129', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 405, '29', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (831, 49, '', 'JKL90980130', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 406, '30', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (832, 49, '', 'JKL90980131', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 407, '31', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (833, 49, '', 'JKL90980132', 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 408, '32', 416, '长裤', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (834, 49, '', 'JKL909814026', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 402, '26', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (835, 49, '', 'JKL909814027', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 403, '27', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (836, 49, '', 'JKL909814028', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 404, '28', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (837, 49, '', 'JKL909814029', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 405, '29', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (838, 49, '', 'JKL909814030', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 406, '30', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (839, 49, '', 'JKL909814031', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 407, '31', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (840, 49, '', 'JKL909814032', 412, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 408, '32', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (841, 49, '', 'JKL909812926', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 402, '26', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (842, 49, '', 'JKL909812927', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 403, '27', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (843, 49, '', 'JKL909812928', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 404, '28', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (844, 49, '', 'JKL909812929', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 405, '29', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (845, 49, '', 'JKL909812930', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 406, '30', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (846, 49, '', 'JKL909812931', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 407, '31', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (847, 49, '', 'JKL909812932', 411, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 408, '32', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (848, 49, '', 'JKL909810126', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 402, '26', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (849, 49, '', 'JKL909810127', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 403, '27', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (850, 49, '', 'JKL909810128', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 404, '28', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (851, 49, '', 'JKL909810129', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 405, '29', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (852, 49, '', 'JKL909810130', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 406, '30', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (853, 49, '', 'JKL909810131', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 407, '31', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (854, 49, '', 'JKL909810132', 409, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 408, '32', 422, '长裤加绒', NULL, 56.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (855, 49, '', 'JKL90984826', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 402, '26', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (856, 49, '', 'JKL90984827', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 403, '27', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (857, 49, '', 'JKL90984828', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 404, '28', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (858, 49, '', 'JKL90984829', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 405, '29', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (859, 49, '', 'JKL90984830', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 406, '30', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (860, 49, '', 'JKL90984831', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 407, '31', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (861, 49, '', 'JKL90984832', 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4', 408, '32', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (862, 49, '', 'JKL90986426', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 402, '26', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (863, 49, '', 'JKL90986427', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 403, '27', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (864, 49, '', 'JKL90986428', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 404, '28', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (865, 49, '', 'JKL90986429', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 405, '29', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (866, 49, '', 'JKL90986430', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 406, '30', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (867, 49, '', 'JKL90986431', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 407, '31', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (868, 49, '', 'JKL90986432', 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp', 408, '32', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (869, 49, '', 'JKL90986526', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 402, '26', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (870, 49, '', 'JKL90986527', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 403, '27', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (871, 49, '', 'JKL90986528', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 404, '28', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (872, 49, '', 'JKL90986529', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 405, '29', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (873, 49, '', 'JKL90986530', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 406, '30', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (874, 49, '', 'JKL90986531', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 407, '31', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (875, 49, '', 'JKL90986532', 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2', 408, '32', 0, '', NULL, 48.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (879, 53, '', 'JKL99070125JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 401, '25', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (880, 53, '', 'JKL99070125BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 401, '25', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (881, 53, '', 'JKL99070125JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 401, '25', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (882, 53, '', 'JKL99070126JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 402, '26', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (883, 53, '', 'JKL99070126BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 402, '26', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (884, 53, '', 'JKL99070126JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 402, '26', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (885, 53, '', 'JKL99070127JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 403, '27', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (886, 53, '', 'JKL99070127BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 403, '27', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (887, 53, '', 'JKL99070127JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 403, '27', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (888, 53, '', 'JKL99070128JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 404, '28', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (889, 53, '', 'JKL99070128BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 404, '28', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (890, 53, '', 'JKL99070128JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 404, '28', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (891, 53, '', 'JKL99070129JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 405, '29', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (892, 53, '', 'JKL99070129BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 405, '29', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (893, 53, '', 'JKL99070129JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 405, '29', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (894, 53, '', 'JKL99070130JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 406, '30', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (895, 53, '', 'JKL99070130BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 406, '30', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (896, 53, '', 'JKL99070130JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 406, '30', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (897, 53, '', 'JKL99070131JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 407, '31', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (898, 53, '', 'JKL99070131BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 407, '31', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (899, 53, '', 'JKL99070131JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 407, '31', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (900, 53, '', 'JKL99070132JIU', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 408, '32', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (901, 53, '', 'JKL99070132BA', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 408, '32', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (902, 53, '', 'JKL99070132JR', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BdL9qd2Arl3f70ZFz_!!2513908257-0-cib.jpg', 408, '32', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (903, 53, '', 'JKL99072825JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 401, '25', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (904, 53, '', 'JKL99072825BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 401, '25', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (905, 53, '', 'JKL99072825JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 401, '25', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (906, 53, '', 'JKL99072826JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 402, '26', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (907, 53, '', 'JKL99072826BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 402, '26', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (908, 53, '', 'JKL99072826JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 402, '26', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (909, 53, '', 'JKL99072827JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 403, '27', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (910, 53, '', 'JKL99072827BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 403, '27', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (911, 53, '', 'JKL99072827JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 403, '27', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (912, 53, '', 'JKL99072828JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 404, '28', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (913, 53, '', 'JKL99072828BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 404, '28', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (914, 53, '', 'JKL99072828JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 404, '28', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (915, 53, '', 'JKL99072829JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 405, '29', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (916, 53, '', 'JKL99072829BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 405, '29', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (917, 53, '', 'JKL99072829JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 405, '29', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (918, 53, '', 'JKL99072830JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 406, '30', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (919, 53, '', 'JKL99072830BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 406, '30', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (920, 53, '', 'JKL99072830JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 406, '30', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (921, 53, '', 'JKL99072831JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 407, '31', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (922, 53, '', 'JKL99072831BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 407, '31', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (923, 53, '', 'JKL99072831JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 407, '31', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (924, 53, '', 'JKL99072832JIU', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 408, '32', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (925, 53, '', 'JKL99072832BA', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 408, '32', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (926, 53, '', 'JKL99072832JR', 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80', 408, '32', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (927, 53, '', 'JKL99074725JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 401, '25', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (928, 53, '', 'JKL99074725BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 401, '25', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (929, 53, '', 'JKL99074725JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 401, '25', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (930, 53, '', 'JKL99074726JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 402, '26', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (931, 53, '', 'JKL99074726BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 402, '26', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (932, 53, '', 'JKL99074726JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 402, '26', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (933, 53, '', 'JKL99074727JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 403, '27', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (934, 53, '', 'JKL99074727BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 403, '27', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (935, 53, '', 'JKL99074727JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 403, '27', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (936, 53, '', 'JKL99074728JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 404, '28', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (937, 53, '', 'JKL99074728BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 404, '28', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (938, 53, '', 'JKL99074728JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 404, '28', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (939, 53, '', 'JKL99074729JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 405, '29', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (940, 53, '', 'JKL99074729BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 405, '29', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (941, 53, '', 'JKL99074729JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 405, '29', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (942, 53, '', 'JKL99074730JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 406, '30', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (943, 53, '', 'JKL99074730BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 406, '30', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (944, 53, '', 'JKL99074730JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 406, '30', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (945, 53, '', 'JKL99074731JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 407, '31', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (946, 53, '', 'JKL99074731BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 407, '31', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (947, 53, '', 'JKL99074731JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 407, '31', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (948, 53, '', 'JKL99074732JIU', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 408, '32', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (949, 53, '', 'JKL99074732BA', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 408, '32', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (950, 53, '', 'JKL99074732JR', 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9', 408, '32', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (951, 53, '', 'JKL99075125JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 401, '25', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (952, 53, '', 'JKL99075125BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 401, '25', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (953, 53, '', 'JKL99075125JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 401, '25', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (954, 53, '', 'JKL99075126JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 402, '26', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (955, 53, '', 'JKL99075126BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 402, '26', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (956, 53, '', 'JKL99075126JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 402, '26', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (957, 53, '', 'JKL99075127JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 403, '27', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (958, 53, '', 'JKL99075127BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 403, '27', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (959, 53, '', 'JKL99075127JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 403, '27', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (960, 53, '', 'JKL99075128JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 404, '28', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (961, 53, '', 'JKL99075128BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 404, '28', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (962, 53, '', 'JKL99075128JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 404, '28', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (963, 53, '', 'JKL99075129JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 405, '29', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (964, 53, '', 'JKL99075129BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 405, '29', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (965, 53, '', 'JKL99075129JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 405, '29', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (966, 53, '', 'JKL99075130JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 406, '30', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (967, 53, '', 'JKL99075130BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 406, '30', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (968, 53, '', 'JKL99075130JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 406, '30', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (969, 53, '', 'JKL99075131JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 407, '31', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (970, 53, '', 'JKL99075131BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 407, '31', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (971, 53, '', 'JKL99075131JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 407, '31', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (972, 53, '', 'JKL99075132JIU', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 408, '32', 417, '九分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (973, 53, '', 'JKL99075132BA', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 408, '32', 418, '八分', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (974, 53, '', 'JKL99075132JR', 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6', 408, '32', 419, '九分加绒', NULL, 53.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (975, 54, '', 'JKL60103526', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 402, '26', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (976, 54, '', 'JKL60103527', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 403, '27', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (977, 54, '', 'JKL60103528', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 404, '28', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (978, 54, '', 'JKL60103529', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 405, '29', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (979, 54, '', 'JKL60103530', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 406, '30', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (980, 54, '', 'JKL60103531', 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi', 407, '31', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (981, 54, '', 'JKL60107526', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 402, '26', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (982, 54, '', 'JKL60107527', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 403, '27', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (983, 54, '', 'JKL60107528', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 404, '28', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (984, 54, '', 'JKL60107529', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 405, '29', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (985, 54, '', 'JKL60107530', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 406, '30', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (986, 54, '', 'JKL60107531', 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4', 407, '31', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (987, 55, '', 'JKL9064009', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 394, 'XS', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (988, 55, '', 'JKL9064001', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 341, 'S', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (989, 55, '', 'JKL9064002', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 342, 'M', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (990, 55, '', 'JKL9064003', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 343, 'L', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (991, 55, '', 'JKL9064004', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 344, 'XL', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (992, 55, '', 'JKL9064005', 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5', 345, '2XL', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (993, 55, '', 'JKL9065009', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 394, 'XS', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (994, 55, '', 'JKL9065001', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 341, 'S', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (995, 55, '', 'JKL9065002', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 342, 'M', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (996, 55, '', 'JKL9065003', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 343, 'L', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (997, 55, '', 'JKL9065004', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 344, 'XL', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (998, 55, '', 'JKL9065005', 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h', 345, '2XL', 0, '', NULL, 47.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (999, 56, '', 'JKL99774009CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 394, 'XS', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1000, 56, '', 'JKL99774009JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 394, 'XS', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1001, 56, '', 'JKL99774001CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 341, 'S', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1002, 56, '', 'JKL99774001JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 341, 'S', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1003, 56, '', 'JKL99774002CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 342, 'M', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1004, 56, '', 'JKL99774002JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 342, 'M', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1005, 56, '', 'JKL99774003CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 343, 'L', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1006, 56, '', 'JKL99774003JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 343, 'L', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1007, 56, '', 'JKL99774004CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 344, 'XL', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1008, 56, '', 'JKL99774004JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 344, 'XL', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1009, 56, '', 'JKL99774005CK', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 345, '2XL', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1010, 56, '', 'JKL99774005JC', 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk', 345, '2XL', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1031, 59, '', 'JKL99784009CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 394, 'XS', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1032, 59, '', 'JKL99784009JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 394, 'XS', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1033, 59, '', 'JKL99784001CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 341, 'S', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1034, 59, '', 'JKL99784001JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 341, 'S', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1035, 59, '', 'JKL99784002CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 342, 'M', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1036, 59, '', 'JKL99784002JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 342, 'M', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1037, 59, '', 'JKL99784003CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 343, 'L', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1038, 59, '', 'JKL99784003JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 343, 'L', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1039, 59, '', 'JKL99784004CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 344, 'XL', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1040, 59, '', 'JKL99784004JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 344, 'XL', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1041, 59, '', 'JKL99784005CK', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 345, '2XL', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1042, 59, '', 'JKL99784005JC', 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k', 345, '2XL', 415, '加长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1043, 60, '', 'JKL99505025', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 401, '25', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1044, 60, '', 'JKL99505026', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 402, '26', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1045, 60, '', 'JKL99505027', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 403, '27', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1046, 60, '', 'JKL99505028', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 404, '28', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1047, 60, '', 'JKL99505029', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 405, '29', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1048, 60, '', 'JKL99505030', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 406, '30', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1049, 60, '', 'JKL99505031', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 407, '31', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1050, 60, '', 'JKL99505032', 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr', 408, '32', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1051, 60, '', 'JKL99501225', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 401, '25', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1052, 60, '', 'JKL99501226', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 402, '26', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1053, 60, '', 'JKL99501227', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 403, '27', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1054, 60, '', 'JKL99501228', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 404, '28', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1055, 60, '', 'JKL99501229', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 405, '29', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1056, 60, '', 'JKL99501230', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 406, '30', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1057, 60, '', 'JKL99501231', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 407, '31', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1058, 60, '', 'JKL99501232', 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q', 408, '32', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1059, 60, '', 'JKL99505925', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 401, '25', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1060, 60, '', 'JKL99505926', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 402, '26', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1061, 60, '', 'JKL99505927', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 403, '27', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1062, 60, '', 'JKL99505928', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 404, '28', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1063, 60, '', 'JKL99505929', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 405, '29', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1064, 60, '', 'JKL99505930', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 406, '30', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1065, 60, '', 'JKL99505931', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 407, '31', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1066, 60, '', 'JKL99505932', 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi', 408, '32', 0, '', NULL, 41.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1067, 61, '', 'JKL89903509', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 394, 'XS', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1068, 61, '', 'JKL89903501', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 341, 'S', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1069, 61, '', 'JKL89903502', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 342, 'M', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1070, 61, '', 'JKL89903503', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 343, 'L', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1071, 61, '', 'JKL89903504', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 344, 'XL', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1072, 61, '', 'JKL89903505', 351, '蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_蓝色.jpg', 345, '2XL', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1073, 61, '', 'JKL89907509', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 394, 'XS', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1074, 61, '', 'JKL89907501', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 341, 'S', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1075, 61, '', 'JKL89907502', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 342, 'M', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1076, 61, '', 'JKL89907503', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 343, 'L', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1077, 61, '', 'JKL89907504', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 344, 'XL', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1078, 61, '', 'JKL89907505', 389, '黑灰色', 'http://img.huayiyungou.com/ecom_goods_img_2022/JKL8990_黑色.jpg', 345, '2XL', 0, '', NULL, 43.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1079, 62, '', 'JKL99380109JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 394, 'XS', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1080, 62, '', 'JKL99380109CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 394, 'XS', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1081, 62, '', 'JKL99380101JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 341, 'S', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1082, 62, '', 'JKL99380101CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 341, 'S', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1083, 62, '', 'JKL99380102JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 342, 'M', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1084, 62, '', 'JKL99380102CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 342, 'M', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1085, 62, '', 'JKL99380103JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 343, 'L', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1086, 62, '', 'JKL99380103CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 343, 'L', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1087, 62, '', 'JKL99380104JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 344, 'XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1088, 62, '', 'JKL99380104CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 344, 'XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1089, 62, '', 'JKL99380105JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 345, '2XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1090, 62, '', 'JKL99380105CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg', 345, '2XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1091, 62, '', 'JKL99384009JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 394, 'XS', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1092, 62, '', 'JKL99384009CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 394, 'XS', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1093, 62, '', 'JKL99384001JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 341, 'S', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1094, 62, '', 'JKL99384001CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 341, 'S', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1095, 62, '', 'JKL99384002JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 342, 'M', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1096, 62, '', 'JKL99384002CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 342, 'M', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1097, 62, '', 'JKL99384003JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 343, 'L', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1098, 62, '', 'JKL99384003CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 343, 'L', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1099, 62, '', 'JKL99384004JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 344, 'XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1100, 62, '', 'JKL99384004CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 344, 'XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1101, 62, '', 'JKL99384005JIU', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 345, '2XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1102, 62, '', 'JKL99384005CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg', 345, '2XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1103, 62, '', 'JKL99385009JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 394, 'XS', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1104, 62, '', 'JKL99385009CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 394, 'XS', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1105, 62, '', 'JKL99385001JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 341, 'S', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1106, 62, '', 'JKL99385001CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 341, 'S', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1107, 62, '', 'JKL99385002JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 342, 'M', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1108, 62, '', 'JKL99385002CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 342, 'M', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1109, 62, '', 'JKL99385003JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 343, 'L', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1110, 62, '', 'JKL99385003CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 343, 'L', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1111, 62, '', 'JKL99385004JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 344, 'XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1112, 62, '', 'JKL99385004CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 344, 'XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1113, 62, '', 'JKL99385005JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 345, '2XL', 417, '九分', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1114, 62, '', 'JKL99385005CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg', 345, '2XL', 416, '长款', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1115, 63, '', 'JKL600101258', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 401, '25', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1116, 63, '', 'JKL600101259', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 401, '25', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1117, 63, '', 'JKL600101268', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 402, '26', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1118, 63, '', 'JKL600101269', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 402, '26', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1119, 63, '', 'JKL600101278', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 403, '27', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1120, 63, '', 'JKL600101279', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 403, '27', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1121, 63, '', 'JKL600101288', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 404, '28', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1122, 63, '', 'JKL600101289', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 404, '28', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1123, 63, '', 'JKL600101298', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 405, '29', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1124, 63, '', 'JKL600101299', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 405, '29', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1125, 63, '', 'JKL600101308', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 406, '30', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1126, 63, '', 'JKL600101309', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 406, '30', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1127, 63, '', 'JKL600101318', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 407, '31', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1128, 63, '', 'JKL600101319', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 407, '31', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1129, 63, '', 'JKL600101328', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 408, '32', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1130, 63, '', 'JKL600101329', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg', 408, '32', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1131, 63, '', 'JKL600128258', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 401, '25', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1132, 63, '', 'JKL600128259', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 401, '25', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1133, 63, '', 'JKL600128268', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 402, '26', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1134, 63, '', 'JKL600128269', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 402, '26', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1135, 63, '', 'JKL600128278', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 403, '27', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1136, 63, '', 'JKL600128279', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 403, '27', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1137, 63, '', 'JKL600128288', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 404, '28', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1138, 63, '', 'JKL600128289', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 404, '28', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1139, 63, '', 'JKL600128298', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 405, '29', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1140, 63, '', 'JKL600128299', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 405, '29', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1141, 63, '', 'JKL600128308', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 406, '30', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1142, 63, '', 'JKL600128309', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 406, '30', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1143, 63, '', 'JKL600128318', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 407, '31', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1144, 63, '', 'JKL600128319', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 407, '31', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1145, 63, '', 'JKL600128328', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 408, '32', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1146, 63, '', 'JKL600128329', 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg', 408, '32', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1147, 63, '', 'JKL600151258', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 401, '25', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1148, 63, '', 'JKL600151259', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 401, '25', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1149, 63, '', 'JKL600151268', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 402, '26', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1150, 63, '', 'JKL600151269', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 402, '26', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1151, 63, '', 'JKL600151278', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 403, '27', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1152, 63, '', 'JKL600151279', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 403, '27', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1153, 63, '', 'JKL600151288', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 404, '28', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1154, 63, '', 'JKL600151289', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 404, '28', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1155, 63, '', 'JKL600151298', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 405, '29', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1156, 63, '', 'JKL600151299', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 405, '29', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1157, 63, '', 'JKL600151308', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 406, '30', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1158, 63, '', 'JKL600151309', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 406, '30', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1159, 63, '', 'JKL600151318', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 407, '31', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1160, 63, '', 'JKL600151319', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 407, '31', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1161, 63, '', 'JKL600151328', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 408, '32', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1162, 63, '', 'JKL600151329', 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg', 408, '32', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1163, 63, '', 'JKL600147258', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 401, '25', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1164, 63, '', 'JKL600147259', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 401, '25', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1165, 63, '', 'JKL600147268', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 402, '26', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1166, 63, '', 'JKL600147269', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 402, '26', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1167, 63, '', 'JKL600147278', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 403, '27', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1168, 63, '', 'JKL600147279', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 403, '27', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1169, 63, '', 'JKL600147288', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 404, '28', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1170, 63, '', 'JKL600147289', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 404, '28', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1171, 63, '', 'JKL600147298', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 405, '29', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1172, 63, '', 'JKL600147299', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 405, '29', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1173, 63, '', 'JKL600147308', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 406, '30', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1174, 63, '', 'JKL600147309', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 406, '30', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1175, 63, '', 'JKL600147318', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 407, '31', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1176, 63, '', 'JKL600147319', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 407, '31', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1177, 63, '', 'JKL600147328', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 408, '32', 420, '单裤', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1178, 63, '', 'JKL600147329', 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg', 408, '32', 421, '加绒', NULL, 45.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1179, 64, '', 'JKL99090125JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 401, '25', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1180, 64, '', 'JKL99090125CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 401, '25', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1181, 64, '', 'JKL99090126JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 402, '26', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1182, 64, '', 'JKL99090126CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 402, '26', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1183, 64, '', 'JKL99090127JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 403, '27', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1184, 64, '', 'JKL99090127CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 403, '27', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1185, 64, '', 'JKL99090128JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 404, '28', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1186, 64, '', 'JKL99090128CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 404, '28', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1187, 64, '', 'JKL99090129JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 405, '29', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1188, 64, '', 'JKL99090129CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 405, '29', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1189, 64, '', 'JKL99090130JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 406, '30', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1190, 64, '', 'JKL99090130CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 406, '30', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1191, 64, '', 'JKL99090131JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 407, '31', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1192, 64, '', 'JKL99090131CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 407, '31', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1193, 64, '', 'JKL99090132JIU', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 408, '32', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1194, 64, '', 'JKL99090132CK', 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg', 408, '32', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1195, 64, '', 'JKL99091225JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 401, '25', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1196, 64, '', 'JKL99091225CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 401, '25', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1197, 64, '', 'JKL99091226JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 402, '26', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1198, 64, '', 'JKL99091226CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 402, '26', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1199, 64, '', 'JKL99091227JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 403, '27', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1200, 64, '', 'JKL99091227CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 403, '27', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1201, 64, '', 'JKL99091228JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 404, '28', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1202, 64, '', 'JKL99091228CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 404, '28', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1203, 64, '', 'JKL99091229JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 405, '29', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1204, 64, '', 'JKL99091229CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 405, '29', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1205, 64, '', 'JKL99091230JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 406, '30', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1206, 64, '', 'JKL99091230CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 406, '30', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1207, 64, '', 'JKL99091231JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 407, '31', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1208, 64, '', 'JKL99091231CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 407, '31', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1209, 64, '', 'JKL99091232JIU', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 408, '32', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1210, 64, '', 'JKL99091232CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg', 408, '32', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1211, 64, '', 'JKL99095025JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 401, '25', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1212, 64, '', 'JKL99095025CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 401, '25', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1213, 64, '', 'JKL99095026JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 402, '26', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1214, 64, '', 'JKL99095026CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 402, '26', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1215, 64, '', 'JKL99095027JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 403, '27', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1216, 64, '', 'JKL99095027CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 403, '27', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1217, 64, '', 'JKL99095028JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 404, '28', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1218, 64, '', 'JKL99095028CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 404, '28', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1219, 64, '', 'JKL99095029JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 405, '29', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1220, 64, '', 'JKL99095029CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 405, '29', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1221, 64, '', 'JKL99095030JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 406, '30', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1222, 64, '', 'JKL99095030CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 406, '30', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1223, 64, '', 'JKL99095031JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 407, '31', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1224, 64, '', 'JKL99095031CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 407, '31', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1225, 64, '', 'JKL99095032JIU', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 408, '32', 417, '九分', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1226, 64, '', 'JKL99095032CK', 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG', 408, '32', 416, '长款', NULL, 50.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1227, 65, '', 'GZYYZ72770100', 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lfHUDo1p3HVme2o7Q_!!2214743335304-0-cib.jpg', 340, '均码', 0, '', NULL, 54.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1228, 65, '', 'GZYYZ72773100', 338, '咖啡色', 'https://cbu01.alicdn.com/img/ibank/O1CN01kneLsV1p3HVu8u1xi_!!2214743335304-0-cib.jpg', 340, '均码', 0, '', NULL, 54.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1229, 65, '', 'GZYYZ72776200', 377, '墨绿色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nPrwCh1p3HVouHmtq_!!2214743335304-0-cib.jpg', 340, '均码', 0, '', NULL, 54.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1230, 66, '', 'JKL197340098', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 394, 'XS', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1231, 66, '', 'JKL197340099', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 394, 'XS', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1232, 66, '', 'JKL197340018', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 341, 'S', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1233, 66, '', 'JKL197340019', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 341, 'S', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1234, 66, '', 'JKL197340028', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 342, 'M', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1235, 66, '', 'JKL197340029', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 342, 'M', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1236, 66, '', 'JKL197340038', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 343, 'L', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1237, 66, '', 'JKL197340039', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 343, 'L', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1238, 66, '', 'JKL197340048', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 344, 'XL', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1239, 66, '', 'JKL197340049', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 344, 'XL', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1240, 66, '', 'JKL197340058', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 345, '2XL', 420, '单裤', NULL, 44.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1241, 66, '', 'JKL197340059', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg', 345, '2XL', 421, '加绒', NULL, 52.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1242, 67, '', 'JKL19511225CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 401, '25', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1243, 67, '', 'JKL19511225CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 401, '25', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1244, 67, '', 'JKL19511225JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 401, '25', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1245, 67, '', 'JKL19511225JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 401, '25', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1246, 67, '', 'JKL19511226CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 402, '26', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1247, 67, '', 'JKL19511226CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 402, '26', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1248, 67, '', 'JKL19511226JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 402, '26', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1249, 67, '', 'JKL19511226JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 402, '26', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1250, 67, '', 'JKL19511227CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 403, '27', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1251, 67, '', 'JKL19511227CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 403, '27', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1252, 67, '', 'JKL19511227JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 403, '27', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1253, 67, '', 'JKL19511227JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 403, '27', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1254, 67, '', 'JKL19511228CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 404, '28', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1255, 67, '', 'JKL19511228CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 404, '28', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1256, 67, '', 'JKL19511228JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 404, '28', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1257, 67, '', 'JKL19511228JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 404, '28', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1258, 67, '', 'JKL19511229CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 405, '29', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1259, 67, '', 'JKL19511229CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 405, '29', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1260, 67, '', 'JKL19511229JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 405, '29', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1261, 67, '', 'JKL19511229JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 405, '29', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1262, 67, '', 'JKL19511230CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 406, '30', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1263, 67, '', 'JKL19511230CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 406, '30', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1264, 67, '', 'JKL19511230JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 406, '30', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1265, 67, '', 'JKL19511230JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 406, '30', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1266, 67, '', 'JKL19511231CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 407, '31', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1267, 67, '', 'JKL19511231CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 407, '31', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1268, 67, '', 'JKL19511231JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 407, '31', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1269, 67, '', 'JKL19511231JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 407, '31', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1270, 67, '', 'JKL19511232CK', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 408, '32', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1271, 67, '', 'JKL19511232CR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 408, '32', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1272, 67, '', 'JKL19511232JC', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 408, '32', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1273, 67, '', 'JKL19511232JCR', 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg', 408, '32', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1274, 67, '', 'JKL19514025CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 401, '25', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1275, 67, '', 'JKL19514025CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 401, '25', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1276, 67, '', 'JKL19514025JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 401, '25', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1277, 67, '', 'JKL19514025JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 401, '25', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1278, 67, '', 'JKL19514026CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 402, '26', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1279, 67, '', 'JKL19514026CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 402, '26', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1280, 67, '', 'JKL19514026JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 402, '26', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1281, 67, '', 'JKL19514026JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 402, '26', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1282, 67, '', 'JKL19514027CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 403, '27', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1283, 67, '', 'JKL19514027CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 403, '27', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1284, 67, '', 'JKL19514027JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 403, '27', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1285, 67, '', 'JKL19514027JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 403, '27', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1286, 67, '', 'JKL19514028CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 404, '28', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1287, 67, '', 'JKL19514028CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 404, '28', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1288, 67, '', 'JKL19514028JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 404, '28', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1289, 67, '', 'JKL19514028JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 404, '28', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1290, 67, '', 'JKL19514029CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 405, '29', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1291, 67, '', 'JKL19514029CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 405, '29', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1292, 67, '', 'JKL19514029JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 405, '29', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1293, 67, '', 'JKL19514029JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 405, '29', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1294, 67, '', 'JKL19514030CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 406, '30', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1295, 67, '', 'JKL19514030CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 406, '30', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1296, 67, '', 'JKL19514030JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 406, '30', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1297, 67, '', 'JKL19514030JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 406, '30', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1298, 67, '', 'JKL19514031CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 407, '31', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1299, 67, '', 'JKL19514031CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 407, '31', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1300, 67, '', 'JKL19514031JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 407, '31', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1301, 67, '', 'JKL19514031JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 407, '31', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1302, 67, '', 'JKL19514032CK', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 408, '32', 416, '长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1303, 67, '', 'JKL19514032CR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 408, '32', 422, '长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1304, 67, '', 'JKL19514032JC', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 408, '32', 415, '加长裤', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1305, 67, '', 'JKL19514032JCR', 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png', 408, '32', 423, '加长裤加绒', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1306, 62, '', 'JKL99387009', 384, '深蓝长款', '', 394, 'XS', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1307, 62, '', 'JKL99387001', 384, '深蓝长款', '', 341, 'S', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1308, 62, '', 'JKL99387002', 384, '深蓝长款', '', 342, 'M', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1309, 62, '', 'JKL99387003', 384, '深蓝长款', '', 343, 'L', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1310, 62, '', 'JKL99387004', 384, '深蓝长款', '', 344, 'XL', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1311, 62, '', 'JKL99387005', 384, '深蓝长款', '', 345, '2XL', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1312, 62, '', 'JKL99386909', 383, '深蓝九分', '', 394, 'XS', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1313, 62, '', 'JKL99386901', 383, '深蓝九分', '', 341, 'S', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1314, 62, '', 'JKL99386902', 383, '深蓝九分', '', 342, 'M', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1315, 62, '', 'JKL99386903', 383, '深蓝九分', '', 343, 'L', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1316, 62, '', 'JKL99386904', 383, '深蓝九分', '', 344, 'XL', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1317, 62, '', 'JKL99386905', 383, '深蓝九分', '', 345, '2XL', 0, '', NULL, 0.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1318, 68, '', 'JKL31121201', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 341, 'S', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1319, 68, '', 'JKL31121202', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 342, 'M', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1320, 68, '', 'JKL31121203', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 343, 'L', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1321, 68, '', 'JKL31121204', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 344, 'XL', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1322, 68, '', 'JKL31121205', 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg', 345, '2XL', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1323, 68, '', 'JKL31120701', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 341, 'S', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1324, 68, '', 'JKL31120702', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 342, 'M', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1325, 68, '', 'JKL31120703', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 343, 'L', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1326, 68, '', 'JKL31120704', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 344, 'XL', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1327, 68, '', 'JKL31120705', 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg', 345, '2XL', 0, '', NULL, 42.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1328, 69, '', 'KH97347526', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 402, '26', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1329, 69, '', 'KH97347527', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 403, '27', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1330, 69, '', 'KH97347528', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 404, '28', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1331, 69, '', 'KH97347529', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 405, '29', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1332, 69, '', 'KH97347530', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 406, '30', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1333, 69, '', 'KH97347531', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 407, '31', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1334, 69, '', 'KH97347532', 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg', 408, '32', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1335, 69, '', 'KH97345026', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 402, '26', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1336, 69, '', 'KH97345027', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 403, '27', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1337, 69, '', 'KH97345028', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 404, '28', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1338, 69, '', 'KH97345029', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 405, '29', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1339, 69, '', 'KH97345030', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 406, '30', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1340, 69, '', 'KH97345031', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 407, '31', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1341, 69, '', 'KH97345032', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg', 408, '32', 0, '', NULL, 39.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1342, 70, '', 'KH98265026', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 402, '26', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1343, 70, '', 'KH98265027', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 403, '27', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1344, 70, '', 'KH98265028', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 404, '28', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1345, 70, '', 'KH98265029', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 405, '29', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1346, 70, '', 'KH98265030', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 406, '30', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1347, 70, '', 'KH98265031', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 407, '31', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1348, 70, '', 'KH98265032', 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg', 408, '32', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1349, 70, '', 'KH98260126', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 402, '26', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1350, 70, '', 'KH98260127', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 403, '27', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1351, 70, '', 'KH98260128', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 404, '28', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1352, 70, '', 'KH98260129', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 405, '29', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1353, 70, '', 'KH98260130', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 406, '30', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1354, 70, '', 'KH98260131', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 407, '31', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1355, 70, '', 'KH98260132', 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg', 408, '32', 0, '', NULL, 40.00, 0.00, 0.00, 0.00, '', 0, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1356, 71, '', 'aaaaa15030', 413, '浅蓝色加绒', 'aaa', 406, '30', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1357, 71, '', 'aaaaa15029', 413, '浅蓝色加绒', 'aaa', 405, '29', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1358, 71, '', 'aaaaa14030', 412, '复古蓝加绒', 'aaa', 406, '30', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1359, 71, '', 'aaaaa14029', 412, '复古蓝加绒', 'aaa', 405, '29', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1368, 74, '', 'A0012D15032', 413, '浅蓝色加绒', 'http://localhost:8080/preview/images/48', 408, '32', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1369, 74, '', 'A0012D15031', 413, '浅蓝色加绒', 'http://localhost:8080/preview/images/48', 407, '31', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1370, 74, '', 'A0012D14032', 412, '复古蓝加绒', 'http://localhost:8080/preview/images/49', 408, '32', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);
INSERT INTO `erp_goods_spec` VALUES (1371, 74, '', 'A0012D14031', 412, '复古蓝加绒', 'http://localhost:8080/preview/images/49', 407, '31', 0, '', NULL, 12.00, 0.00, 0.00, 0.00, '', 1, 0, 0, 0);

-- ----------------------------
-- Table structure for erp_goods_spec_attr
-- ----------------------------
DROP TABLE IF EXISTS `erp_goods_spec_attr`;
CREATE TABLE `erp_goods_spec_attr`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `goods_id` int NOT NULL,
  `type` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `k` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `kid` int NULL DEFAULT NULL,
  `vid` int NULL DEFAULT NULL,
  `v` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 603 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_goods_spec_attr
-- ----------------------------
INSERT INTO `erp_goods_spec_attr` VALUES (1, 1, 'color', '颜色', 1, 0, '250ml', 'http://img.huayikeji.com/wveyzkbvilkzaj3eu9084pmqb9405hag');
INSERT INTO `erp_goods_spec_attr` VALUES (2, 4, 'color', '颜色', 1, 0, '香辣味1瓶+麻辣味1瓶', 'http://img.huayikeji.com/kw5i7anb3tydpu8kz0f7o8jrszuczlw1');
INSERT INTO `erp_goods_spec_attr` VALUES (3, 4, 'color', '颜色', 1, 0, '麻辣味420g*2瓶中辣', 'http://img.huayikeji.com/8ltvsrs9huscohzi2qd20qj0daynz012');
INSERT INTO `erp_goods_spec_attr` VALUES (4, 4, 'color', '颜色', 1, 0, '香辣味420g*2瓶微辣', 'http://img.huayikeji.com/z01l0tjah6vwpwdp4yhppthum9l44our');
INSERT INTO `erp_goods_spec_attr` VALUES (5, 5, 'color', '颜色', 1, 0, '5A精品', 'http://img.huayikeji.com/kx3ikkjuand5huibpsh3s4o7jsuzilfa');
INSERT INTO `erp_goods_spec_attr` VALUES (6, 6, 'color', '颜色', 1, 0, '甜味型20袋', 'http://img.huayikeji.com/u4ga7xp1swww4t7y40eh3gvgs3kikf83');
INSERT INTO `erp_goods_spec_attr` VALUES (7, 7, 'color', '颜色', 1, 0, '深蓝色', 'http://img.huayikeji.com/0lzoyn7adrkv8iv7xjy8kcejl9yelkcg');
INSERT INTO `erp_goods_spec_attr` VALUES (8, 7, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ahc832bn59qoxq7vlrnvue9lrsiqxsbd');
INSERT INTO `erp_goods_spec_attr` VALUES (9, 7, 'color', '颜色', 1, 0, '欧美白', 'http://img.huayikeji.com/df8eqd6e9t46vfjx3j7tk84z72yhc3uy');
INSERT INTO `erp_goods_spec_attr` VALUES (10, 7, 'size', '尺码', 2, 0, '5寸', '');
INSERT INTO `erp_goods_spec_attr` VALUES (11, 7, 'size', '尺码', 2, 0, '6寸', '');
INSERT INTO `erp_goods_spec_attr` VALUES (12, 7, 'size', '尺码', 2, 0, '8寸', '');
INSERT INTO `erp_goods_spec_attr` VALUES (13, 8, 'color', '颜色', 1, 0, '30g * 5包', 'http://img.huayikeji.com/0n40n4ctz61o2rtdlt9wldmxucsio789');
INSERT INTO `erp_goods_spec_attr` VALUES (14, 9, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eJxjQM2FOyB3IsiuU_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (15, 9, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (16, 9, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01F1W2O12FOyB2UfQnX_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (17, 9, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01PHFmsX2FOyB14fPie_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (18, 9, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (19, 9, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (20, 9, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (21, 9, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (22, 9, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (23, 10, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SJelLi2FOyFPEQgvg_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (24, 10, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AWoRY32FOyFNn0erQ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (25, 10, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jpsOio2FOyFVLvlmx_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (26, 10, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (27, 10, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (28, 10, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (29, 10, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (30, 10, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (31, 11, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN013LdA8s2FOyBfwOjXh_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (32, 11, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01giGdo92FOyBjYLUBx_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (33, 11, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN017OhDC42FOyBpOE5Xh_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (34, 11, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN018SPmsV1Bs2ghEUUei_!!0-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (35, 11, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01BMEINy2FOyBhvpaPZ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (36, 11, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (37, 11, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (38, 11, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (39, 11, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (40, 11, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (41, 12, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01UR16Tw2FOyJNPJHCZ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (42, 12, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (43, 12, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (44, 12, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (45, 12, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (46, 12, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (47, 13, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gJpwlK2FOyGoJJ3sH_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (48, 13, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01wZ3ye12FOyGhhUDOe_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (49, 13, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01453F082FOyGp5H3Gv_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (50, 13, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (51, 13, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (52, 13, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (53, 13, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (54, 13, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (55, 14, 'color', '颜色', 1, 331, '灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J0a5Ij2FOyGVsqune_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (56, 14, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01i45X3r2FOyGVsraSQ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (57, 14, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yx4kr52FOyGOtErWx_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (58, 14, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (59, 14, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (60, 14, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (61, 14, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (62, 14, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (63, 15, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01rXl5A92FOyBlp8KB2_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (64, 15, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lW8xsq2FOyBboDwmS_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (65, 15, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eRnnro2FOyBl7HmaB_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (66, 15, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN010pmtuT2FOyGqBp6dx_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (67, 15, 'color', '颜色', 1, 324, '粉色', 'https://cbu01.alicdn.com/img/ibank/O1CN01jE2Cq12FOyGlWgGFO_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (68, 15, 'color', '颜色', 1, 359, '黄色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Fc0SiP2FOyGwQA0CS_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (69, 15, 'color', '颜色', 1, 0, '薄荷绿', 'https://cbu01.alicdn.com/img/ibank/O1CN010KmHBz2FOyGrTpnqo_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (70, 15, 'color', '颜色', 1, 335, '卡其色', 'https://cbu01.alicdn.com/img/ibank/O1CN01VRmnz72FOyGuOVemn_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (71, 15, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (72, 15, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (73, 15, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (74, 15, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (75, 15, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (76, 16, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ux09zfd120aalurr55707gndmhn1rf21');
INSERT INTO `erp_goods_spec_attr` VALUES (77, 16, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (78, 16, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (79, 16, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (80, 16, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (81, 16, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (82, 17, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/gm40mpqfc53scyxjou2epwqhjqbqp8cv');
INSERT INTO `erp_goods_spec_attr` VALUES (83, 17, 'color', '颜色', 1, 322, '白色', 'http://img.huayikeji.com/k1bcjvacakh7t65tt541z636hrbv086m');
INSERT INTO `erp_goods_spec_attr` VALUES (84, 17, 'color', '颜色', 1, 0, '粉色', 'http://img.huayikeji.com/wsqqp8sdqc5e8x9noarg9fswdo17wtu4');
INSERT INTO `erp_goods_spec_attr` VALUES (85, 17, 'color', '颜色', 1, 0, '深灰色', 'http://img.huayikeji.com/68dgqc2s773upieznl528i0sqs8ib484');
INSERT INTO `erp_goods_spec_attr` VALUES (86, 17, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (87, 17, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (88, 17, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (89, 17, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (90, 18, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/pofzt3pqrtravmzd1jrnd605xqu0usic');
INSERT INTO `erp_goods_spec_attr` VALUES (91, 18, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/tc51gyersphju6cgsns937bc3x7m2ph5');
INSERT INTO `erp_goods_spec_attr` VALUES (92, 18, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/l1dj9ovhl9xkcln5lrv09txbvbd4i4ug');
INSERT INTO `erp_goods_spec_attr` VALUES (93, 18, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (94, 18, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (95, 18, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (96, 18, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (97, 18, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (98, 19, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/eih7qcgodthjs3v6oiwl49s0ngs6opjs');
INSERT INTO `erp_goods_spec_attr` VALUES (99, 19, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/x29km17ivbfkzzcuqvjrxwpzo52l9jzf');
INSERT INTO `erp_goods_spec_attr` VALUES (100, 19, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/kh86knehjulsigqzexr4jgknbkrwcarr');
INSERT INTO `erp_goods_spec_attr` VALUES (101, 19, 'color', '颜色', 1, 0, '蓝灰色', 'http://img.huayikeji.com/wgn8xbsgs3mac0j8uqc7xcebeziu3lc2');
INSERT INTO `erp_goods_spec_attr` VALUES (102, 19, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (103, 19, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (104, 19, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (105, 19, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (106, 19, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (107, 19, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (108, 19, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (109, 19, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (110, 20, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/rbmhovahs9a3hqvq28z2d00h3qt6ko38');
INSERT INTO `erp_goods_spec_attr` VALUES (111, 20, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/k0vt2gtit508e8yt36o04jdijk1ukgr4');
INSERT INTO `erp_goods_spec_attr` VALUES (112, 20, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/crqikzuy0nm2e4yem856va2xk48i7cf4');
INSERT INTO `erp_goods_spec_attr` VALUES (113, 20, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (114, 20, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (115, 20, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (116, 20, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (117, 20, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (118, 20, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (119, 20, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (120, 20, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (121, 21, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/jw7wxsu4uwiv7khvaocru7t9yhhdodol');
INSERT INTO `erp_goods_spec_attr` VALUES (122, 21, 'color', '颜色', 1, 0, '复古蓝', 'http://img.huayikeji.com/o1pijvy2umsa8mlgfkyjbgs3vwmotkdh');
INSERT INTO `erp_goods_spec_attr` VALUES (123, 21, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/1mcrsm44mbg8ekvlayfjwulvdzzhl9ym');
INSERT INTO `erp_goods_spec_attr` VALUES (124, 21, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (125, 21, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (126, 21, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (127, 21, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (128, 21, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (129, 21, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (130, 22, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/b2z1rl4pv3rzhotpxeoru2k8okkscy0f');
INSERT INTO `erp_goods_spec_attr` VALUES (131, 22, 'color', '颜色', 1, 0, '黑灰色', 'http://img.huayikeji.com/1xye55g2xefzzxm883tvxq5v1z75r82z');
INSERT INTO `erp_goods_spec_attr` VALUES (132, 22, 'color', '颜色', 1, 0, '浅蓝色', 'http://img.huayikeji.com/ms87oxxsvn3fi422bsil1rgnqbko3wf8');
INSERT INTO `erp_goods_spec_attr` VALUES (133, 22, 'color', '颜色', 1, 0, '蓝灰色', 'http://img.huayikeji.com/32e4srov0ypum7hy03oxtwc8p6jejy4g');
INSERT INTO `erp_goods_spec_attr` VALUES (134, 22, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (135, 22, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (136, 22, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (137, 22, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (138, 22, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (139, 22, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (140, 22, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (141, 22, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (142, 23, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/po0fayle1t2gsas9jh0rhkgytkyze9ig');
INSERT INTO `erp_goods_spec_attr` VALUES (143, 23, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/k2klo0djjmqvrg72zqkwpz303zyxbpik');
INSERT INTO `erp_goods_spec_attr` VALUES (144, 23, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/jobye46pas210pj9ltbh81kagpn87uuj');
INSERT INTO `erp_goods_spec_attr` VALUES (145, 23, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/66vexicx9dqs2terim416pbyw6cimwzr');
INSERT INTO `erp_goods_spec_attr` VALUES (146, 23, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (147, 23, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (148, 23, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (149, 23, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (150, 23, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (151, 23, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (152, 23, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (153, 23, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (154, 24, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/tglr5vq19k3f9kpt25bn3hxvwue8s8o9');
INSERT INTO `erp_goods_spec_attr` VALUES (155, 24, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (156, 24, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (157, 24, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (158, 24, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (159, 24, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (160, 25, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/76yre98jhd5mgvkhgvqcdlktdthof0z0');
INSERT INTO `erp_goods_spec_attr` VALUES (161, 25, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/tmx42ow0jykbhjrid8d41cr1lsvaidql');
INSERT INTO `erp_goods_spec_attr` VALUES (162, 25, 'size', '尺码', 2, 0, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (163, 25, 'size', '尺码', 2, 0, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (164, 25, 'size', '尺码', 2, 0, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (165, 25, 'size', '尺码', 2, 0, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (166, 25, 'size', '尺码', 2, 0, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (167, 25, 'size', '尺码', 2, 0, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (168, 25, 'size', '尺码', 2, 0, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (169, 25, 'size', '尺码', 2, 0, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (170, 26, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/kcjtgriwhgpz0njn420akyrcfflk6yrd');
INSERT INTO `erp_goods_spec_attr` VALUES (171, 26, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/86rh8lzpijus7pc7zcx4ld052uyzew7p');
INSERT INTO `erp_goods_spec_attr` VALUES (172, 26, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/6193racfe6v2gls3c5582rxs6h6xpvqo');
INSERT INTO `erp_goods_spec_attr` VALUES (173, 26, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (174, 26, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (175, 26, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (176, 26, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (177, 26, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (178, 27, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/g0gsgjfmuvl7jkl22sdbfpbcvb2ozki1');
INSERT INTO `erp_goods_spec_attr` VALUES (179, 27, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/zydifc6i4epw9fnf192l6la94vu18pyw');
INSERT INTO `erp_goods_spec_attr` VALUES (180, 27, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/6mux70whkwvf28pb6k9avl8ql7m9hnyo');
INSERT INTO `erp_goods_spec_attr` VALUES (181, 27, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/8p4iw27ejggt0fr66jpbbwxrif65aey7');
INSERT INTO `erp_goods_spec_attr` VALUES (182, 27, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (183, 27, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (184, 27, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (185, 27, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (186, 27, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (187, 27, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (188, 27, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (189, 27, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (190, 9, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01gpoCDV2FOyAxsRAur_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (191, 9, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01AfNgvA2FOyAvwXZxv_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (197, 28, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/033/066/21020660330_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (198, 28, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/657/708/20862807756_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (199, 28, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/080/060/20938060080_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (200, 28, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (201, 28, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (202, 28, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (203, 28, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (204, 28, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (205, 29, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O6JSPt2FOyGJVlNSt_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (206, 29, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nMB3GV2FOyGSIAxrm_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (207, 29, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yp4pfJ2FOyGRQhOVF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (208, 29, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (209, 29, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (210, 29, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (211, 29, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (212, 29, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (213, 30, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01O9k7a72FOyF40eXdL_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (214, 30, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (215, 30, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (216, 30, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (217, 30, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (218, 30, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (219, 31, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/2020/995/164/22330461599_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (220, 31, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/343/344/22330443343_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (221, 31, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/2020/195/327/22411723591_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (222, 31, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/2020/281/876/22411678182_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (223, 31, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/024/282/22502282420_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (224, 31, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/2020/685/864/22502468586_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (225, 31, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (226, 31, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (227, 31, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (228, 31, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (229, 31, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (230, 32, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN011EipyD2FOyGlVSb58_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (231, 32, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01zhhpHl2FOyGk0i8Nf_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (232, 32, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01u87ebo2FOyGsDbhyd_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (233, 32, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (234, 32, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (235, 32, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (236, 32, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (237, 32, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (238, 33, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01veMucP2FOyCvGWh20_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (239, 33, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01T4m3Jm2FOyCuMBQ9v_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (240, 33, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01eWGzKH2FOyCrd3HjP_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (241, 33, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01zJ8R7I2FOyCr3v2cC_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (242, 33, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (243, 33, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (244, 33, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (245, 33, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (246, 33, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (247, 34, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DMb5Yv2FOyEph4yYB_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (248, 34, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01HLBVQl2FOyEn4nMnB_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (249, 34, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YPm5Yc2FOyEkRHf9E_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (250, 34, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01TLlyFy2FOyEkRLLyI_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (251, 34, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (252, 34, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (253, 34, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (254, 34, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (255, 34, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (256, 35, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/732/346/22406643237_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (257, 35, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (258, 35, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (259, 35, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (260, 35, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (261, 35, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (262, 36, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01FDRxMp2FOyDOB1iTE_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (263, 36, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kn6Ove2FOyDUNlzou_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (264, 36, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (265, 36, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (266, 36, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (267, 36, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (268, 36, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (269, 37, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01xwzF522FOyCIOnqKM_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (270, 37, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01C6Sn4s2FOyCMDu0n5_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (271, 37, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN013vTM8R2FOyCEFuCQk_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (272, 37, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (273, 37, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (274, 37, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (275, 37, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (276, 37, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (277, 38, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01ARPAL32FOyAcs8t96_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (278, 38, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01y01tnq2FOyAbctZxT_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (279, 38, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (280, 38, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (281, 38, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (282, 38, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (283, 38, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (284, 39, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN018JTrMY2FOyA4kgljs_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (285, 39, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN012TyoAb2FOyA5iihhy_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (286, 39, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (287, 39, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (288, 39, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (289, 39, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (290, 39, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (291, 39, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (292, 39, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (293, 40, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lUqTwm2FOy9rP6Jod_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (294, 40, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D3ndSV2FOy9hbKsqA_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (295, 40, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01YsByd92FOy9lGqpvL_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (296, 40, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (297, 40, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (298, 40, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (299, 40, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (300, 40, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (301, 41, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01J3Quqe2FOyH5tjtiy_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (302, 41, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01a2j3nN2FOyHBXnetl_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (303, 41, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (304, 41, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (305, 41, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (306, 41, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (307, 41, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (308, 42, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/176/214/19868412671_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (309, 42, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/537/457/19941754735_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (310, 42, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (311, 42, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (312, 42, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (313, 42, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (314, 42, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (315, 42, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (316, 42, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (317, 43, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/2020/842/093/21808390248_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (318, 43, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/2020/705/941/21730149507_900849200.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (319, 43, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (320, 43, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (321, 43, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (322, 43, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (323, 43, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (324, 44, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01DIe7Es2FOyCYIZFWt_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (325, 44, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN016QWq2N2FOyCSH3gt9_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (326, 44, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01evRAWu2FOyCUPwcyo_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (327, 44, 'color', '颜色', 1, 356, '复古蓝', 'https://cbu01.alicdn.com/img/ibank/O1CN01ZxdpVe2FOyCUVHjc2_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (328, 44, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (329, 44, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (330, 44, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (331, 44, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (332, 44, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (333, 45, 'color', '颜色', 1, 322, '白色', 'https://cbu01.alicdn.com/img/ibank/O1CN01E4FgMe2FOyCf3EUih_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (334, 45, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01WpxUo32FOyCb3IFRu_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (335, 45, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01LNgHTm2FOyCf3KXQX_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (336, 45, 'color', '颜色', 1, 389, '黑灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01A6gZ4a2FOyChQ6oRF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (337, 45, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (338, 45, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (339, 45, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (340, 45, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (341, 45, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (342, 46, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Nak9ys2FOyE9IvLef_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (343, 46, 'color', '颜色', 1, 336, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Oi8GB62FOyEARfNQF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (344, 46, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01yMCDYu2FOyEARqBVY_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (345, 46, 'color', '颜色', 1, 336, '蓝灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01SzZ7qE2FOyE5Ahn5c_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (346, 46, 'color', '颜色', 1, 0, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01GXj19V2FOyDvtRpMI_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (347, 46, 'color', '颜色', 1, 0, '烟灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01nw66Rp2FOyECsleSF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (348, 46, 'color', '颜色', 1, 0, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tCa6sF2FOyE8JtRoh_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (349, 46, 'color', '颜色', 1, 0, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01XHjrys2FOyE9si0Q8_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (350, 46, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (351, 46, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (352, 46, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (353, 46, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (354, 46, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (355, 46, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (356, 46, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (357, 47, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01KtZqKM2Arl3fk5KtK_!!2513908257-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (358, 47, 'color', '颜色', 1, 0, '深蓝色加长', 'https://cbu01.alicdn.com/img/ibank/O1CN01fz1zp42Arl3SMD5sS_!!2513908257-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (359, 47, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (360, 47, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (361, 47, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (362, 47, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (363, 47, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (364, 47, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (365, 33, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01Kv2ymz2FOyCNsDP1S_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (366, 33, 'color', '颜色', 1, 317, '杏色', 'https://cbu01.alicdn.com/img/ibank/O1CN01O3yq8p2FOyCOMzdUR_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (367, 33, 'color', '颜色', 1, 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01wWwtXm2FOyDIpC0BY_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (368, 33, 'color', '颜色', 1, 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01lqQeRn2FOyDLJRi9c_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (369, 33, 'color', '颜色', 1, 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tQBYWC2FOyD8HYB3p_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (370, 33, 'color', '颜色', 1, 412, '复古蓝加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01tS1yRE2FOyDMvwj7p_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (371, 33, 'color', '颜色', 1, 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN010gs0ON2FOyDNfPddh_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (372, 33, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (373, 33, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (374, 33, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (375, 33, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (376, 33, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (377, 22, 'color', '颜色', 1, 409, '黑色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN01yUmRNW2FOyDTbXvyF_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (378, 22, 'color', '颜色', 1, 410, '黑灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN016nREfS2FOyDXxglpQ_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (379, 22, 'color', '颜色', 1, 411, '蓝灰色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN0121IGEy2FOyDeZm8MH_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (380, 22, 'color', '颜色', 1, 413, '浅蓝色加绒', 'https://cbu01.alicdn.com/img/ibank/O1CN013dvLD62FOyDS4ElK6_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (381, 22, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (382, 22, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (383, 22, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (384, 22, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (385, 22, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (386, 22, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (387, 22, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (388, 22, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (389, 48, 'color', '颜色', 1, 361, '浅蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01D94VIz2FOyCZdAhrE_!!2208857268871-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (390, 48, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (391, 48, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (392, 48, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (393, 48, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (394, 48, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (395, 49, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `erp_goods_spec_attr` VALUES (396, 49, 'color', '颜色', 1, 336, '蓝灰色', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `erp_goods_spec_attr` VALUES (397, 49, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `erp_goods_spec_attr` VALUES (398, 49, 'color', '颜色', 1, 412, '复古蓝加绒', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `erp_goods_spec_attr` VALUES (399, 49, 'color', '颜色', 1, 411, '蓝灰色加绒', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `erp_goods_spec_attr` VALUES (400, 49, 'color', '颜色', 1, 409, '黑色加绒', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `erp_goods_spec_attr` VALUES (401, 49, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (402, 49, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (403, 49, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (404, 49, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (405, 49, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (406, 49, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (407, 49, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (408, 49, 'color', '颜色', 1, 367, '复古蓝九分', 'http://img.huayikeji.com/wom2cb3klac7d95x97wwxyck8n7eb5a4');
INSERT INTO `erp_goods_spec_attr` VALUES (409, 49, 'color', '颜色', 1, 379, '蓝灰色九分', 'http://img.huayikeji.com/imrkrpuewyt1y7bfgewp99moz6qs8hzp');
INSERT INTO `erp_goods_spec_attr` VALUES (410, 49, 'color', '颜色', 1, 380, '黑色九分', 'http://img.huayikeji.com/0teyrqyzfhwyvgvxf8gyo1lzdxs20gr2');
INSERT INTO `erp_goods_spec_attr` VALUES (411, 49, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (412, 49, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (413, 49, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (414, 49, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (415, 49, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (416, 49, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (417, 49, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (418, 53, 'color', '颜色', 1, 308, '黑色', 'http://img.huayikeji.com/2ekpro9obesysm6vf1h0ihhfx1z9bgqz');
INSERT INTO `erp_goods_spec_attr` VALUES (419, 53, 'color', '颜色', 1, 335, '卡其', 'http://img.huayikeji.com/59ihabwqyajwiik7cf4364zpsta40w80');
INSERT INTO `erp_goods_spec_attr` VALUES (420, 53, 'color', '颜色', 1, 366, '米白', 'http://img.huayikeji.com/4cptgqnxzy9ftbi8l3x6tb1t1fv4vfz9');
INSERT INTO `erp_goods_spec_attr` VALUES (421, 53, 'color', '颜色', 1, 368, '卡灰', 'http://img.huayikeji.com/dh7fvio3h8zyqs5fbtzb5oxqovvmrol6');
INSERT INTO `erp_goods_spec_attr` VALUES (422, 53, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (423, 53, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (424, 53, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (425, 53, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (426, 53, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (427, 53, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (428, 53, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (429, 53, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (430, 53, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (431, 53, 'style', '款式', 3, 418, '八分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (432, 53, 'style', '款式', 3, 419, '九分加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (433, 54, 'color', '颜色', 1, 351, '蓝色', 'http://img.huayikeji.com/fex2kmy8mmraboudesodz9mig2wcbidi');
INSERT INTO `erp_goods_spec_attr` VALUES (434, 54, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayikeji.com/8okq5agwo00vy221pyylgvu47va7pet4');
INSERT INTO `erp_goods_spec_attr` VALUES (435, 54, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (436, 54, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (437, 54, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (438, 54, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (439, 54, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (440, 54, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (441, 55, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/egma3seljl77hcbpjpw9ks000kkf3rs5');
INSERT INTO `erp_goods_spec_attr` VALUES (442, 55, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/zgtp829lecxrqml16kqkfuo5ajxoh49h');
INSERT INTO `erp_goods_spec_attr` VALUES (443, 55, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (444, 55, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (445, 55, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (446, 55, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (447, 55, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (448, 55, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (449, 56, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/0ac55odg8e0d7y714svpcvtoqfxld5dk');
INSERT INTO `erp_goods_spec_attr` VALUES (450, 56, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (451, 56, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (452, 56, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (453, 56, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (454, 56, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (455, 56, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (456, 56, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (457, 56, 'style', '款式', 3, 415, '加长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (458, 59, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayikeji.com/n732o54er4aigs0vl0k2mmu1koqwgu6k');
INSERT INTO `erp_goods_spec_attr` VALUES (459, 59, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (460, 59, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (461, 59, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (462, 59, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (463, 59, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (464, 59, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (465, 59, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (466, 59, 'style', '款式', 3, 415, '加长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (467, 60, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayikeji.com/lmk2699b6lpcoraaxij10kemlqmkqfgr');
INSERT INTO `erp_goods_spec_attr` VALUES (468, 60, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayikeji.com/fzvbk24z186xmk1nmtsobbasv4quxv8q');
INSERT INTO `erp_goods_spec_attr` VALUES (469, 60, 'color', '颜色', 1, 374, '深蓝色加绒', 'http://img.huayikeji.com/0yzpga8017ikg8on2ejo03dgo2uulzbi');
INSERT INTO `erp_goods_spec_attr` VALUES (470, 60, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (471, 60, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (472, 60, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (473, 60, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (474, 60, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (475, 60, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (476, 60, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (477, 60, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (478, 61, 'color', '颜色', 1, 351, '蓝色', 'http://img.huayiyungou.com/q3t7loa0mz6lokizz93fp52cltgxhuq2');
INSERT INTO `erp_goods_spec_attr` VALUES (479, 61, 'color', '颜色', 1, 389, '黑灰色', 'http://img.huayiyungou.com/qx67wj65nlvrs514g02bs7ocptl5b6ec');
INSERT INTO `erp_goods_spec_attr` VALUES (480, 61, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (481, 61, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (482, 61, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (483, 61, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (484, 61, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (485, 61, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (486, 62, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_黑色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (487, 62, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_复古蓝.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (488, 62, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9938_浅蓝色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (489, 62, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (490, 62, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (491, 62, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (492, 62, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (493, 62, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (494, 62, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (495, 62, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (496, 62, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (497, 63, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_黑色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (498, 63, 'color', '颜色', 1, 335, '卡其', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡其.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (499, 63, 'color', '颜色', 1, 368, '卡灰', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_卡灰.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (500, 63, 'color', '颜色', 1, 366, '米白', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL6001_米白.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (501, 63, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (502, 63, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (503, 63, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (504, 63, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (505, 63, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (506, 63, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (507, 63, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (508, 63, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (509, 63, 'style', '款式', 3, 420, '单裤', '');
INSERT INTO `erp_goods_spec_attr` VALUES (510, 63, 'style', '款式', 3, 421, '加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (511, 64, 'color', '颜色', 1, 308, '黑色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_黑色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (512, 64, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_深蓝色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (513, 64, 'color', '颜色', 1, 361, '浅蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-11/JKL9909_浅蓝色.JPG');
INSERT INTO `erp_goods_spec_attr` VALUES (514, 64, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (515, 64, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (516, 64, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (517, 64, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (518, 64, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (519, 64, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (520, 64, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (521, 64, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (522, 64, 'style', '款式', 3, 417, '九分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (523, 64, 'style', '款式', 3, 416, '长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (524, 65, 'color', '颜色', 1, 308, '黑色', 'https://cbu01.alicdn.com/img/ibank/O1CN01lfHUDo1p3HVme2o7Q_!!2214743335304-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (525, 65, 'color', '颜色', 1, 338, '咖啡色', 'https://cbu01.alicdn.com/img/ibank/O1CN01kneLsV1p3HVu8u1xi_!!2214743335304-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (526, 65, 'color', '颜色', 1, 377, '墨绿色', 'https://cbu01.alicdn.com/img/ibank/O1CN01nPrwCh1p3HVouHmtq_!!2214743335304-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (527, 65, 'size', '尺码', 2, 340, '均码', '');
INSERT INTO `erp_goods_spec_attr` VALUES (528, 66, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1973_复古蓝.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (529, 66, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (530, 66, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (531, 66, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (532, 66, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (533, 66, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (534, 66, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (535, 66, 'style', '款式', 3, 420, '单裤', '');
INSERT INTO `erp_goods_spec_attr` VALUES (536, 66, 'style', '款式', 3, 421, '加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (537, 67, 'color', '颜色', 1, 319, '深蓝色', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_深蓝色.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (538, 67, 'color', '颜色', 1, 356, '复古蓝', 'http://img.huayiyungou.com/ecom_goods_img_2022-12/JKL1951_复古蓝.png');
INSERT INTO `erp_goods_spec_attr` VALUES (539, 67, 'size', '尺码', 2, 401, '25', '');
INSERT INTO `erp_goods_spec_attr` VALUES (540, 67, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (541, 67, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (542, 67, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (543, 67, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (544, 67, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (545, 67, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (546, 67, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (547, 67, 'style', '款式', 3, 416, '长裤', '');
INSERT INTO `erp_goods_spec_attr` VALUES (548, 67, 'style', '款式', 3, 422, '长裤加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (549, 67, 'style', '款式', 3, 415, '加长裤', '');
INSERT INTO `erp_goods_spec_attr` VALUES (550, 67, 'style', '款式', 3, 423, '加长裤加绒', '');
INSERT INTO `erp_goods_spec_attr` VALUES (551, 62, 'color', '颜色', 1, 384, '深蓝长款', '');
INSERT INTO `erp_goods_spec_attr` VALUES (552, 62, 'color', '颜色', 1, 383, '深蓝九分', '');
INSERT INTO `erp_goods_spec_attr` VALUES (553, 62, 'size', '尺码', 2, 394, 'XS', '');
INSERT INTO `erp_goods_spec_attr` VALUES (554, 62, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (555, 62, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (556, 62, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (557, 62, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (558, 62, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (559, 68, 'color', '颜色', 1, 319, '深蓝色', 'https://cbu01.alicdn.com/img/ibank/O1CN01rCYlbl2Arl3CqVwkG_!!2513908257-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (560, 68, 'color', '颜色', 1, 314, '烟灰色', 'https://cbu01.alicdn.com/img/ibank/O1CN01vLP3RW2Arl35fOv3d_!!2513908257-0-cib.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (561, 68, 'size', '尺码', 2, 341, 'S', '');
INSERT INTO `erp_goods_spec_attr` VALUES (562, 68, 'size', '尺码', 2, 342, 'M', '');
INSERT INTO `erp_goods_spec_attr` VALUES (563, 68, 'size', '尺码', 2, 343, 'L', '');
INSERT INTO `erp_goods_spec_attr` VALUES (564, 68, 'size', '尺码', 2, 344, 'XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (565, 68, 'size', '尺码', 2, 345, '2XL', '');
INSERT INTO `erp_goods_spec_attr` VALUES (566, 69, 'color', '颜色', 1, 389, '黑灰色', 'https://gd1.alicdn.com/imgextra/i2/49616689/O1CN01NkZm6L1zHc5upnyRW_!!49616689.jpg_400x400.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (567, 69, 'color', '颜色', 1, 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i1/49616689/O1CN01bzPmrs1zHc5ynDOyo_!!49616689.jpg_400x400.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (568, 69, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (569, 69, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (570, 69, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (571, 69, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (572, 69, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (573, 69, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (574, 69, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (575, 70, 'color', '颜色', 1, 361, '浅蓝色', 'https://gd3.alicdn.com/imgextra/i2/49616689/O1CN01j5qyuA1zHc63KaMAY_!!49616689.jpg_400x400.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (576, 70, 'color', '颜色', 1, 308, '黑色', 'https://gd2.alicdn.com/imgextra/i4/49616689/O1CN01GAdjtB1zHc5yvskHx_!!49616689.jpg_400x400.jpg');
INSERT INTO `erp_goods_spec_attr` VALUES (577, 70, 'size', '尺码', 2, 402, '26', '');
INSERT INTO `erp_goods_spec_attr` VALUES (578, 70, 'size', '尺码', 2, 403, '27', '');
INSERT INTO `erp_goods_spec_attr` VALUES (579, 70, 'size', '尺码', 2, 404, '28', '');
INSERT INTO `erp_goods_spec_attr` VALUES (580, 70, 'size', '尺码', 2, 405, '29', '');
INSERT INTO `erp_goods_spec_attr` VALUES (581, 70, 'size', '尺码', 2, 406, '30', '');
INSERT INTO `erp_goods_spec_attr` VALUES (582, 70, 'size', '尺码', 2, 407, '31', '');
INSERT INTO `erp_goods_spec_attr` VALUES (583, 70, 'size', '尺码', 2, 408, '32', '');
INSERT INTO `erp_goods_spec_attr` VALUES (584, 71, 'color', '颜色', 114, 413, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (585, 71, 'color', '颜色', 114, 412, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (586, 71, 'size', '尺码', 115, 406, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (587, 71, 'size', '尺码', 115, 405, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (588, 71, 'style', '款式', 116, 413, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (589, 71, 'style', '款式', 116, 412, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (597, 74, 'color', '颜色', 114, 413, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (598, 74, 'color', '颜色', 114, 412, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (599, 74, 'size', '尺码', 115, 408, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (600, 74, 'size', '尺码', 115, 407, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (601, 74, 'style', '款式', 116, 413, NULL, NULL);
INSERT INTO `erp_goods_spec_attr` VALUES (602, 74, 'style', '款式', 116, 412, NULL, NULL);

-- ----------------------------
-- Table structure for erp_ship_logistics
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_logistics`;
CREATE TABLE `erp_ship_logistics`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司',
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递公司编码',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_ship_logistics
-- ----------------------------
INSERT INTO `erp_ship_logistics` VALUES (1, '中通快递', 'ZTO', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (2, '申通快递', 'STO', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (3, '圆通速递', 'YTO', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (4, '韵达速递', 'YD', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (5, '邮政快递包裹', 'YZPY', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (6, '顺丰速运', 'SF', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (7, '京东快递', 'JD', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (8, '德邦快递', 'DBL', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (9, '极兔速递', 'JTSD', NULL, 1);
INSERT INTO `erp_ship_logistics` VALUES (10, '菜鸟速递', 'CNSD', '0', 1);

-- ----------------------------
-- Table structure for erp_ship_order
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order`;
CREATE TABLE `erp_ship_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `shop_id` int NOT NULL COMMENT '店铺ID',
  `shop_type` int NOT NULL COMMENT '店铺平台',
  `supplier_id` int NOT NULL COMMENT 'erp系统商品id',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `erp_order_id` bigint NULL DEFAULT NULL COMMENT 'erp订单ID',
  `erp_order_item_id` bigint NOT NULL COMMENT 'erp子订单ID',
  `order_time` datetime NOT NULL COMMENT '订单日期',
  `goods_id` bigint NOT NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `spec_id` bigint NOT NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `spec_num` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品规格编码',
  `quantity` int NOT NULL COMMENT '商品数量',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '说明',
  `logistics_company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `logistics_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `logistics_fee` decimal(6, 2) NULL DEFAULT NULL COMMENT '运费',
  `ship_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `ship_man` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `out_operator` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库人',
  `out_position` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出库仓位',
  `out_time` datetime NULL DEFAULT NULL COMMENT '出库时间',
  `ship_type` int NOT NULL COMMENT '发货类型（0仓库发货；1供应商代发）',
  `ship_status` int NOT NULL COMMENT '状态（1出库中2已出库3已发货）',
  `package_weight` float NULL DEFAULT NULL COMMENT '包裹重量',
  `package_length` float NULL DEFAULT NULL COMMENT '包裹长度',
  `package_width` float NULL DEFAULT NULL COMMENT '包裹宽度',
  `package_height` float NULL DEFAULT NULL COMMENT '包裹高度',
  `packsge_operator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '打包操作人',
  `packsge_time` datetime NULL DEFAULT NULL COMMENT '打包时间',
  `packages` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '包裹内容JSON',
  `receiver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家/地区',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786204816567873539 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单发货表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_ship_order
-- ----------------------------
INSERT INTO `erp_ship_order` VALUES (1785676692335767553, 6, 4, 0, '2055782964491095876', 38, 442, '2024-02-01 11:39:21', 9, 23, '2720210080260001', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '胥**', '*******8279', '高*街道江苏省高邮市北**村**幢***室', '中国', '江苏省', '扬州市', '高邮市', '2024-05-01 22:24:34', '生成拣货单', NULL, NULL);
INSERT INTO `erp_ship_order` VALUES (1785852155209383937, 6, 4, 26, '3763030608986745044', 39, 443, '2024-01-31 10:42:58', 9, 23, '2720210080260001', 1, NULL, '菜鸟速递', '11111', 11.00, '2024-05-02 15:12:17', NULL, NULL, NULL, NULL, 1, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '张**', '*******4678', '大*镇*城**路下段泰舂小吃', '中国', '云南省', '大理白族自治州', '大理市', '2024-05-02 10:01:48', '分配给供应商发货', '2024-05-02 15:12:36', '发货');
INSERT INTO `erp_ship_order` VALUES (1786204816567873538, 6, 4, 26, '2137984935735126281', 41, 1785584827112509446, '2024-05-02 12:47:02', 9, 32, '2720210080260105', 1, NULL, '京东快递', 'JD903989932', 5.00, '2024-05-03 11:32:15', NULL, 'admin', '20', '2024-05-03 10:56:43', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '刘**', '*******6949', '东**街道湖南省社会**院**栋***', '中国', '湖南省', '长沙市', '开福区', '2024-05-03 09:23:09', '生成拣货单', '2024-05-03 11:38:48', '发货');

-- ----------------------------
-- Table structure for erp_ship_order_agent_fee
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order_agent_fee`;
CREATE TABLE `erp_ship_order_agent_fee`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `supplier_id` bigint NOT NULL COMMENT '供应商id',
  `supplier_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `date` date NOT NULL COMMENT '日期',
  `logistics_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流公司',
  `logistics_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流单号',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '应付总金额',
  `ship_amount` decimal(5, 2) NOT NULL COMMENT '物流费用',
  `goods_amount` decimal(10, 2) NOT NULL COMMENT '商品金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NOT NULL COMMENT '状态（0已生成1已结算)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785930405289799682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '供应商代发账单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_ship_order_agent_fee
-- ----------------------------
INSERT INTO `erp_ship_order_agent_fee` VALUES (1785930405289799681, '3763030608986745044', 6, 26, NULL, '2024-05-02', '菜鸟速递', '11111', 30.00, 11.00, 19.00, NULL, 0, '2024-05-02 15:12:44', '发货生成账单', NULL, NULL);

-- ----------------------------
-- Table structure for erp_ship_order_fee
-- ----------------------------
DROP TABLE IF EXISTS `erp_ship_order_fee`;
CREATE TABLE `erp_ship_order_fee`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `logistics_company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流公司',
  `logistics_company_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司id',
  `logistics_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '物流单号',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `amount` decimal(10, 2) NOT NULL COMMENT '应付金额',
  `date` date NOT NULL COMMENT '应付日期',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` int NOT NULL COMMENT '状态（0已生成1已结算)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `length` float NULL DEFAULT 0 COMMENT '长',
  `width` float NULL DEFAULT 0 COMMENT '宽',
  `height` float NULL DEFAULT 0 COMMENT '高',
  `weight` float NULL DEFAULT NULL COMMENT '重量',
  `receiver_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786238985318604802 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单发货物流费用' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_ship_order_fee
-- ----------------------------
INSERT INTO `erp_ship_order_fee` VALUES (1786238985318604801, '京东快递', NULL, 'JD903989932', '2137984935735126281', 6, 5.00, '2024-05-03', NULL, 0, '2024-05-03 11:38:54', '发货', NULL, NULL, 0, 0, 0, NULL, '刘**', '*******6949', '湖南省', '长沙市', '开福区');

-- ----------------------------
-- Table structure for erp_shop_platform
-- ----------------------------
DROP TABLE IF EXISTS `erp_shop_platform`;
CREATE TABLE `erp_shop_platform`  (
  `id` int NOT NULL COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '平台名',
  `app_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'appKey',
  `app_secret` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'appSecret',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `server_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务url',
  `redirect_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '回调url',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `status` int NOT NULL COMMENT '状态（0启用1关闭）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '电商平台配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of erp_shop_platform
-- ----------------------------
INSERT INTO `erp_shop_platform` VALUES (1, '淘宝天猫', '', '', '淘宝开放平台', 'http://gw.api.taobao.com/router/rest', 'http://qihangerp.cn', '2024-06-04 11:10:58', '2024-06-04 11:10:58', 0);
INSERT INTO `erp_shop_platform` VALUES (2, '京东POP', '', '', '京东开放平台', NULL, 'http://qihangerp.cn', '2024-06-04 11:10:58', '2024-06-04 11:10:58', 0);
INSERT INTO `erp_shop_platform` VALUES (3, '拼多多', '', '', '拼多多开放平台', 'https://gw-api.pinduoduo.com/api/router', 'http://qihangerp.cn', '2024-06-04 11:10:58', '2024-06-04 11:10:58', 0);
INSERT INTO `erp_shop_platform` VALUES (4, '抖店', '', '', '抖店开放平台', 'https://openapi-fxg.jinritemai.com', 'http://qihangerp.cn', '2024-06-04 11:10:58', '2024-06-04 11:10:58', 0);
INSERT INTO `erp_shop_platform` VALUES (5, '视频号', ' ', ' ', '视频号小店开放平台', 'https://api.weixin.qq.com/', 'http://qihangerp.cn', '2024-06-04 11:10:58', '2024-06-04 11:10:58', 0);
INSERT INTO `erp_shop_platform` VALUES (99, '其他渠道', '', '', '其他线下渠道', NULL, 'http://qihangerp.cn', '2024-06-04 11:10:58', '2024-06-04 11:10:58', 0);

-- ----------------------------
-- Table structure for oms_jd_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_after_sale`;
CREATE TABLE `oms_jd_after_sale`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `apply_id` bigint NULL DEFAULT NULL COMMENT '申请单号',
  `service_id` bigint NULL DEFAULT NULL COMMENT '服务单号',
  `refund_id` bigint NULL DEFAULT NULL COMMENT '退款单id',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单号',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `apply_refund_sum` double NULL DEFAULT NULL COMMENT '退款金额(单位分)',
  `customer_expect` int NULL DEFAULT NULL COMMENT '客户期望(1-售前退款 10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `customer_expect_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户期望名称',
  `service_status` int NULL DEFAULT NULL COMMENT '服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）',
  `service_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务单状态名称',
  `customer_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户账号',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `pickware_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取件地址',
  `pickware_type` int NULL DEFAULT NULL COMMENT '取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)',
  `order_type` int NULL DEFAULT NULL COMMENT '订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)',
  `order_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型名称',
  `actual_pay_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品编号',
  `ware_type` int NULL DEFAULT NULL COMMENT '售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)',
  `ware_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品类型名称',
  `ware_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_type` int NULL DEFAULT NULL COMMENT '商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)',
  `sku_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'skuType对应名称',
  `approve_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人账号',
  `approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `approve_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `approve_result` int NULL DEFAULT NULL COMMENT '审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)',
  `approve_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核结果名称',
  `process_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人账号',
  `process_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人姓名',
  `process_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `process_result` int NULL DEFAULT NULL COMMENT '处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)',
  `process_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果名称',
  `platform_src` int NULL DEFAULT NULL COMMENT '平台来源',
  `platform_src_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台来源名称',
  `service_count` int NULL DEFAULT NULL COMMENT '服务单售后数量',
  `desen_customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `buyer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户帐号',
  `buyer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `refund_check_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核日期',
  `refund_status` int NULL DEFAULT NULL COMMENT '退款审核状态: 0代表未审核， 1代表审核通过 2代表审核不通过 3代表京东财务审核通过；4代表京东财务审核不通过',
  `refund_check_username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `refund_check_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注',
  `refund_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `refund_system_id` int NULL DEFAULT NULL COMMENT ' 退款来源(10:客服; 11:网站; 12:配送拒收; 28:APP; 87:分拣中心,逆向物流; 98:微信手Q;)',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东退款与售后表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_after_sale
-- ----------------------------

-- ----------------------------
-- Table structure for oms_jd_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order`;
CREATE TABLE `oms_jd_order`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单id（京东平台）',
  `vender_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家id',
  `order_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	订单类型（22 SOP；75 LOC） 可选字段，需要在输入参数optional_fields中写入才能返回',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式（1货到付款, 2邮局汇款, 3自提, 4在线支付, 5公司转账, 6银行卡转账）',
  `order_total_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单总金额。总金额=订单金额（不减优惠，不加运费服务费税费）',
  `order_seller_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单货款金额（订单总金额-商家优惠金额）',
  `order_payment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户应付金额。应付款=货款-用户优惠-余额+运费+税费+服务费。',
  `freight_price` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品的运费',
  `seller_discount` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家优惠金额',
  `order_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	1）WAIT_SELLER_STOCK_OUT 等待出库 2）WAIT_GOODS_RECEIVE_CONFIRM 等待确认收货 3）WAIT_SELLER_DELIVERY等待发货（只适用于海外购商家，含义为\'等待境内发货\'标签下的订单,非海外购商家无需使用） 4) POP_ORDER_PAUSE POP暂停 5）FINISHED_L 完成 6）TRADE_CANCELED 取消 7）LOCKED 已锁定 8）WAIT_SEND_CODE 等待发码',
  `order_state_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态说明（中文）',
  `delivery_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '送货（日期）类型（1-只工作日送货(双休日、假日不用送);2-只双休日、假日送货(工作日不用送);3-工作日、双休日与假日均可送货;其他值-返回“任意时间”）',
  `invoice_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发票信息 “invoice_info: 不需要开具发票”下无需开具发票；其它返回值请正常开具发票 。（没有电子发票具体信息）',
  `invoice_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '普通发票纳税人识别码',
  `order_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家下单时订单备注',
  `order_start_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单时间',
  `order_end_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结单时间 如返回信息为“0001-01-01 00:00:00”和“1970-01-01 00:00:00”，可认为此订单为未完成状态。',
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '固定电话',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `full_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `county` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `province_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `county_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `town_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `vender_remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家订单备注（不大于500字符） 可选字段，需要在输入参数optional_fields中写入才能返回',
  `balance_used` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '余额支付金额 可选字段，需要在输入参数optional_fields中写入才能返回',
  `pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家的账号信息',
  `return_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后订单标记 0:不是换货订单 1返修发货,直接赔偿,客服补件 2售后调货 可选字段，需要在输入参数optional_fields中写入才能返回',
  `payment_confirm_time` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款确认时间 如果没有付款时间 默认返回0001-01-01 00:00:00 可选字段，需要在输入参数optional_fields中写入才能返回',
  `waybill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '运单号(当厂家自送时运单号可为空，不同物流公司的运单号用|分隔，如果同一物流公司有多个运单号，则用英文逗号分隔) 可选字段，需要在输入参数optional_fields中写入才能返回',
  `logistics_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司ID 可选字段，需要在输入参数optional_fields中写入才能返回',
  `modified` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单更新时间',
  `direct_parent_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	直接父订单号 可选字段，需要在输入参数optional_fields中写入才能返回',
  `parent_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	根父订单号 可选字段，需要在输入参数optional_fields中写入才能返回',
  `order_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单来源。如：移动端订单',
  `store_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '京仓订单/云仓订单/空“”',
  `id_sop_shipmenttype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否京配。68=京配，69=京配自提',
  `real_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家的账号信息(区分大小写) 可选字段，需要在输入参数optional_fields中写入才能返回',
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家的账号信息 ',
  `open_id_buyer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家的账号信息(区分大小写) 可选字段',
  `create_time` datetime NULL DEFAULT NULL,
  `audit_status` int NULL DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_order
-- ----------------------------

-- ----------------------------
-- Table structure for oms_jd_order_after
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_after`;
CREATE TABLE `oms_jd_order_after`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `apply_id` bigint NULL DEFAULT NULL COMMENT '申请单号',
  `service_id` bigint NULL DEFAULT NULL COMMENT '服务单号',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `customer_expect` int NULL DEFAULT NULL COMMENT '客户期望(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `customer_expect_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户期望名称',
  `service_status` int NULL DEFAULT NULL COMMENT '服务单状态（10000-待审核领取 10001-待审核 10002-待客户反馈 10004-审核关闭 10005-待收货 10006-待处理领取 10007-待处理 10009-待用户确认 10010-完成 10011-取消 10012-客户已反馈 10013-待审核和待客户反馈 10041-提交退款申请 1100-待下发维修中心接单 12000-上门维修中 14000-上门检测中 13000-商家催收待处理 13000-未收货，待收款 13000-已收货，待收款）',
  `service_status_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务单状态名称',
  `customer_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户账号',
  `customer_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户姓名',
  `customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话',
  `pickware_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '取件地址',
  `pickware_type` int NULL DEFAULT NULL COMMENT '取件方式(4-上门取件 5-上门换新取件 7-客户送货 8-大家电上门取件 9-大家电换新取件 40-客户发货 70-送货至门店 71-快递至门店 72-门店上门取件 80-京东快运上门取件 85-德邦取件)',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单号',
  `order_type` int NULL DEFAULT NULL COMMENT '订单类型(0-一般订单 2-拍卖订单 11-售后调货 15-返修发货 16-直接赔偿 21-POPFBP 22-POPSOP 23-POPLBP 24-POPLBV 25-POPSOPL 18-厂商直送 19-客服补件 42-通用合约 61-EPT订单 69-京东服务产品订单 19-客服补件 75-LOC订单 77-LSP订单 42-虚拟订单 88-总代订单 96-sop虚拟订单 100-提货卡订单 33-电子礼品卡 49-礼品卡 108-京东维修服务产品订单 131-X无人超市订单 142-企业店铺IBS订单 151-品牌门店线下订单 112-自营采购，以销定结 159-领货码订单 89-移动仓库订单 170-实体领货码订单 140-商家采购订单 193-scf订单 54-线下礼品卡订单 202-月卡订单 4-虚拟商品)',
  `order_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型名称',
  `actual_pay_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '实付金额',
  `sku_id` bigint NULL DEFAULT NULL COMMENT '商品编号',
  `ware_type` int NULL DEFAULT NULL COMMENT '售后商品类型(10-申请主商品 20-申请的赠品 30-附件 40-发票 50-发票复印件 60-出检报告 70-包装 80-防损吊牌 90-贺卡 100-礼品购包装 110-loc订单验证码 120-服务产品标识)',
  `ware_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品类型名称',
  `ware_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_type` int NULL DEFAULT NULL COMMENT '商品类型(1-单品 2-赠品套装中的主商品 3-赠品套装中的赠品 4-套装中的单品 5-套装中的赠品 6-加价购赠品 7-延保通 8-延保通赠品)',
  `sku_type_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'skuType对应名称',
  `approve_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人账号',
  `approve_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人姓名',
  `approve_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `approve_result` int NULL DEFAULT NULL COMMENT '审核结果(11-直赔积分 12-直赔余额 13-直赔优惠卷 14-直赔京豆 21-直赔商品 22-上门换新 31-自营取件 32-客户送货 33-客户发货 34-闪电退款 35-虚拟退款 36-上门检测 37-客户送货至门店 38-保外维修 39-快递至门店 40-门店上门取件 80-大家电检测 81-大家电安装 82-大家电移机 83-大家电维修 84-大家电其它 85-闪电催收 86-上门维修 87-补发商品 91-退款不退货 92-预授权冻结 93-ACS换新 95-(超级体验店)门店换新 96-(超级体验店)主站换新 97-厂商维修-寄修 98-厂商维修-上门维修 99-厂商维修-送修 101-厂商大家电检测鉴定 102-厂商大家电安装 103-厂商大家电移机拆机 104-厂商大家电维修(上门维修) 105-厂商大家电拆机鉴定 106-换货 100-客户退货至团长 107-3c上门维修 108-增值服务 109-退货(筋斗云使用) 110-直赔(筋斗云使用) 111-上门检测取件)',
  `approve_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核结果名称',
  `process_pin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人账号',
  `process_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理人姓名',
  `process_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `process_result` int NULL DEFAULT NULL COMMENT '处理结果(0-初始化 1-安装完成 2-维修完成 3-检测完成 4-拆机完成 5-咨询解释 6-取消 70-原返 80-换货 100-赔付)',
  `process_result_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理结果名称',
  `platform_src` int NULL DEFAULT NULL COMMENT '平台来源',
  `platform_src_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台来源名称',
  `service_count` int NULL DEFAULT NULL COMMENT '服务单售后数量',
  `desen_customer_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户电话'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单售后表（废弃）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_order_after
-- ----------------------------

-- ----------------------------
-- Table structure for oms_jd_order_coupon
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_coupon`;
CREATE TABLE `oms_jd_order_coupon`  (
  `id` bigint NOT NULL,
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单编号',
  `skuId` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '京东sku编号。(只有30-单品促销优惠 此skuId才非空)',
  `coupon_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠类型: 20-套装优惠, 28-闪团优惠, 29-团购优惠, 30-单品促销优惠, 34-手机红包, 35-满返满送(返现), 39-京豆优惠,41-京东券优惠, 52-礼品卡优惠,100-店铺优惠',
  `coupon_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠金额。',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单优惠明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_order_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for oms_jd_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_jd_order_item`;
CREATE TABLE `oms_jd_order_item`  (
  `id` bigint NOT NULL,
  `order_id` bigint NOT NULL COMMENT '订单id（京东平台）',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '京东内部SKU的ID',
  `outer_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU外部ID（极端情况下不保证返回，建议从商品接口获取',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品的名称+SKU规格',
  `jd_price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU的京东价',
  `gift_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '赠送积分',
  `ware_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	京东内部商品ID（极端情况下不保证返回，建议从商品接口获取）',
  `item_total` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数量',
  `product_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `service_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_store_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_jd_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for oms_menu
-- ----------------------------
DROP TABLE IF EXISTS `oms_menu`;
CREATE TABLE `oms_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2094 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_menu
-- ----------------------------
INSERT INTO `oms_menu` VALUES (1, '订单管理', 0, 1, '/order', 'Layout', '', 1, 0, 'M', '0', '0', '', 'shopping', 'admin', '2023-12-27 15:00:27', 'admin', '2024-03-30 17:44:37', '系统管理目录');
INSERT INTO `oms_menu` VALUES (2, '售后管理', 0, 3, '/afterSale', 'Layout', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 14:49:33', '至简官网地址');
INSERT INTO `oms_menu` VALUES (3, '店铺管理', 0, 5, '/shop', 'Layout', '', 1, 0, 'M', '0', '0', '', 'dict', 'admin', '2023-12-29 13:29:44', 'admin', '2024-03-30 17:43:35', '');
INSERT INTO `oms_menu` VALUES (4, '商品库', 0, 4, '/goods', 'Layout', '', 1, 0, 'M', '0', '0', '', 'build', 'admin', '2023-12-29 16:53:03', 'admin', '2024-03-30 17:43:57', '');
INSERT INTO `oms_menu` VALUES (101, '发货订单管理', 1, 0, 'order_list', 'order/index', '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 11:18:00', '菜单管理菜单');
INSERT INTO `oms_menu` VALUES (102, '店铺订单管理', 1, 0, 'shop_order_list', 'shop/order/index', '', 1, 0, 'C', '0', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 11:18:00', '菜单管理菜单');
INSERT INTO `oms_menu` VALUES (103, '手动创建订单', 1, 0, 'create', 'order/create', '', 1, 0, 'C', '1', '0', '', 'monitor', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 11:18:00', '菜单管理菜单');
INSERT INTO `oms_menu` VALUES (105, '发货物流跟踪', 1, 2, 'ship', 'ship/index', NULL, 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2024-03-30 17:37:42', 'admin', '2024-04-06 14:49:59', '');
INSERT INTO `oms_menu` VALUES (201, '店铺售后管理', 2, 2, 'shop_refund_list', 'shop/refund/index', '', 1, 0, 'C', '0', '0', '', 'edit', 'admin', '2023-12-27 15:00:27', 'admin', '2024-04-06 15:48:21', '参数设置菜单');
INSERT INTO `oms_menu` VALUES (204, '售后处理查询', 2, 0, 'processing', 'afterSale/index', NULL, 1, 0, 'C', '0', '0', '', 'documentation', 'admin', '2024-04-06 17:27:03', 'admin', '2024-04-06 17:31:12', '');
INSERT INTO `oms_menu` VALUES (301, '店铺管理', 3, 9, 'shop_list', 'shop/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 09:14:02', 'admin', '2024-03-21 17:01:52', '');
INSERT INTO `oms_menu` VALUES (305, '店铺商品管理', 3, 88, 'goods_list', 'shop/goods/index', '', 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2023-12-29 13:32:41', 'admin', '2024-03-21 13:46:05', '');
INSERT INTO `oms_menu` VALUES (401, '商品库', 4, 1, 'goods_list', 'goods/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 16:35:55', 'admin', '2024-03-21 11:40:29', '');
INSERT INTO `oms_menu` VALUES (402, '商品SKU查询', 4, 1, 'sku_list', 'goods/spec/index', '', 1, 0, 'C', '0', '0', '', 'tree', 'admin', '2023-12-29 16:35:55', 'admin', '2024-03-21 11:40:29', '');
INSERT INTO `oms_menu` VALUES (405, '商品上架管理', 4, 2, 'shop_goods', 'goods/shopGoods/index', NULL, 1, 0, 'C', '0', '0', '', 'shopping', 'admin', '2024-03-28 10:29:59', 'admin', '2024-03-28 10:30:59', '');

-- ----------------------------
-- Table structure for oms_merchant
-- ----------------------------
DROP TABLE IF EXISTS `oms_merchant`;
CREATE TABLE `oms_merchant`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID(tenantId)',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_merchant
-- ----------------------------
INSERT INTO `oms_merchant` VALUES (1, '15818590119', '启航', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-05-08 18:53:46', 'admin', '2023-08-07 19:31:37', '', '2024-05-18 18:50:24', '');
INSERT INTO `oms_merchant` VALUES (101, '15818590110', '上海人工集团aa', 'admin@qq.com', '15818590119', '0', '', '$2a$10$BXnTczO7JDkXtcWtLhAy4Ohi1y9FDLfGZm6pwGisi0JHr2wt/MlUK', '0', '0', '127.0.0.1', '2024-06-22 16:42:58', '', '2024-06-22 16:37:25', '', '2024-06-22 16:41:29', NULL);

-- ----------------------------
-- Table structure for oms_merchant_shop
-- ----------------------------
DROP TABLE IF EXISTS `oms_merchant_shop`;
CREATE TABLE `oms_merchant_shop`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '店铺名',
  `nick_name` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺别名',
  `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺主题',
  `type` int NOT NULL COMMENT '对应第三方平台Id',
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺url',
  `status` int NOT NULL DEFAULT 0 COMMENT '是否删除0正常1禁用',
  `api_status` int NOT NULL COMMENT 'api开关0未开启1开启',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `seller_user_id` bigint NOT NULL DEFAULT 0 COMMENT '第三方平台店铺id，淘宝天猫开放平台使用',
  `seller_user_id_str` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家userId',
  `appkey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Appkey',
  `app_sercet` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Appsercet',
  `access_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方平台sessionKey（access_token）',
  `access_expires_in` bigint NULL DEFAULT NULL COMMENT '到期',
  `access_token_begin` bigint NULL DEFAULT NULL COMMENT 'access_token开始时间',
  `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '刷新token',
  `refresh_token_timeout` bigint NULL DEFAULT NULL COMMENT '刷新token过期时间',
  `server_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务请求url',
  `callback_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务回调URL',
  `merchant_id` bigint NOT NULL COMMENT '租户ID（distributor）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户店铺表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_merchant_shop
-- ----------------------------
INSERT INTO `oms_merchant_shop` VALUES (1, '其他渠道', NULL, NULL, 99, NULL, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_merchant_shop` VALUES (2, '视频号店铺-测试', '拼多多-梦小妮', '煜梦服饰', 2, NULL, 0, 0, 'pdd10006159121', 100061591, '', 'd332', '332ss', '80_iOXcFHBFAb3NX2ieFAuXu5mKxvqar8aGhk9ea23Ivo7P5nhuFLYtYeZiJttJYANjCv_dY7yLO5Ft9-pcyxApcdnNbth0j2zhJZXR8t3a6VD8jOCDv2Xljvh2ujUNIDiADAHCX', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_merchant_shop` VALUES (3, '测试京东', '拼多多-梦小妮', '煜梦服饰', 3, NULL, 0, 0, 'pdd10006159121', 100061591, '', NULL, NULL, '87f8044d2a5f45a489aa3a952785b0d35e61788a', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_merchant_shop` VALUES (5, '梦小妮潮流女装', '拼多多-梦小妮', '煜梦服饰', 5, NULL, 0, 0, 'pdd10006159121', 100061591, '', NULL, NULL, '87f8044d2a5f45a489aa3a952785b0d35e61788a', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_merchant_shop` VALUES (6, '梦小妮牛仔裤', '淘宝-梦小妮', '煜梦服饰', 4, '', 0, 0, '', 2200787809358, '0', '31014100', '7b0769269b0c0ca88949791c14eb3a5c', '610140071d1070a37cecea89f1c1f3d6e5d19bf4b58dd942200787809358', NULL, NULL, NULL, NULL, 'http://gw.api.taobao.com/router/rest', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_merchant_shop` VALUES (13, '梦小妮牛仔裤-快手', '快手小店', '华衣云商', 8, NULL, 1, 0, NULL, 0, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_merchant_shop` VALUES (21, '珍姐姐de衣柜的店', '启航家常菜的店-小红书', '启航', 7, 'https://ark.xiaohongshu.com/ark/open_api/v3/common_controller', 0, 0, NULL, 21, '6255224c3801e1000190d3d0', '621919dd99484598a69c', '1747d77da2ce58b97483932041c5503e', 'token-0f3f8a5fc5aa465aa29a66d27c6cf170-dad68769d83e4e1a9f52a950a680b9f2', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_merchant_shop` VALUES (22, '梦小妮牛仔裤', '抖音-梦小妮', '华衣云商', 6, 'http://openapi.jinritemai.com', 0, 0, NULL, 4463798, '0', '7249607407477720636', '36a12497-fb9d-4b54-8cd1-fd1617346687', '', NULL, NULL, NULL, NULL, '2', NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `oms_merchant_shop` VALUES (23, '孟小妮牛仔裤专营店', 'add', NULL, 3, NULL, 0, 0, NULL, 12, '12', 'aaaa', 'aaaaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-06-23 11:55:35', NULL, '2024-06-23 15:46:51', NULL);
INSERT INTO `oms_merchant_shop` VALUES (24, 'BBB', 'BB', NULL, 2, NULL, 0, 0, NULL, 12580, '12580', 'AA22', '6555', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2024-06-23 13:52:46', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_tao_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order`;
CREATE TABLE `oms_tao_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `shop_id` int NOT NULL DEFAULT 0 COMMENT '店铺id',
  `tid` bigint NOT NULL COMMENT '交易编号 (父订单的交易编号)',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易标题，以店铺名作为此标题的值。',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易类型列表，同时查询多种交易类型可用逗号分隔。',
  `seller_flag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家备注旗帜（与淘宝网上订单的卖家备注旗帜对应，只有卖家才能查看该字段）红、黄、绿、蓝、紫 分别对应 1、2、3、4、5',
  `has_buyer_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '判断订单是否有买家留言，有买家留言返回true，否则返回false',
  `credit_card_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用信用卡支付金额数',
  `step_trade_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分阶段付款的订单状态（例如万人团订单等），目前有三返回状态FRONT_NOPAID_FINAL_NOPAID(定金未付尾款未付)，FRONT_PAID_FINAL_NOPAID(定金已付尾款未付)，FRONT_PAID_FINAL_PAID(定金和尾款都付)',
  `step_paid_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分阶段付款的已付金额（万人团订单已付金额）',
  `buyer_open_uid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家OpenUid',
  `mark_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单出现异常问题的时候，给予用户的描述,没有异常的时候，此值为空',
  `buyer_nick` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '买家昵称',
  `num_iid` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品数字编号',
  `num` int NULL DEFAULT NULL COMMENT '商品购买数量。取值范围：大于零的整数,对于一个trade对应多个order的时候（一笔主订单，对应多笔子订单），num=0，num是一个跟商品关联的属性，一笔订单对应多比子订单的时候，主订单上的num无意义。',
  `price` float NULL DEFAULT NULL COMMENT '商品价格。精确到2位小数；单位：元。如：200.07，表示：200元7分',
  `total_fee` float NULL DEFAULT NULL COMMENT '商品金额（商品价格乘以数量的总金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `adjust_fee` float NULL DEFAULT NULL COMMENT '卖家手工调整金额，精确到2位小数，单位：元。如：200.07',
  `post_fee` decimal(5, 2) NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `discount_fee` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
  `payment` decimal(10, 2) NOT NULL COMMENT '实付金额',
  `received_payment` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '卖家实际收到的支付宝打款金额（由于子订单可以部分确认收货，这个金额会随着子订单的确认收货而不断增加，交易成功后等于买家实付款减去退款金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `available_confirm_fee` float NULL DEFAULT NULL COMMENT '交易中剩余的确认收货金额（这个金额会随着子订单确认收货而不断减少，交易成功后会变为零）。精确到2位小数;单位:元。如:200.07，表示:200 元7分',
  `cod_fee` float NULL DEFAULT NULL COMMENT '货到付款服务费。',
  `cod_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货到付款物流状态。初始状态 NEW_CREATED,接单成功 ACCEPTED_BY_COMPANY,接单失败 REJECTED_BY_COMPANY,接单超时 RECIEVE_TIMEOUT,揽收成功 TAKEN_IN_SUCCESS,揽收失败 TAKEN_IN_FAILED,揽收超时 TAKEN_TIMEOUT,签收成功 SIGN_IN,签收失败 REJECTED_BY_OTHER_SIDE,订单等待发送给物流公司 WAITING_TO_BE_SENT,用户取消物流订单 CANCELED',
  `buyer_cod_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家货到付款服务费',
  `seller_cod_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家货到付款服务费',
  `express_agency_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递代收款。',
  `commission_fee` float NULL DEFAULT NULL COMMENT '交易佣金。',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建交易时的物流方式（交易完成前，物流方式有可能改变，但系统里的这个字段一直不变）。可选值：free(卖家包邮),post(平邮),express(快递),ems(EMS),virtual(虚拟发货)，25(次日必达)，26(预约配送)。',
  `created` datetime NOT NULL COMMENT '交易创建时间。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime NULL DEFAULT NULL COMMENT '交易修改时间(用户对订单的任何修改都会更新此字段)。格式:yyyy-MM-dd HH:mm:ss',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '付款时间。格式:yyyy-MM-dd HH:mm:ss。订单的付款时间即为物流订单的创建时间。',
  `consign_time` datetime NULL DEFAULT NULL COMMENT '卖家发货时间。格式:yyyy-MM-dd HH:mm:ss',
  `end_time` datetime NULL DEFAULT NULL COMMENT '交易结束时间。交易成功时间(更新交易状态为成功的同时更新)/确认收货时间或者交易关闭时间 。格式:yyyy-MM-dd HH:mm:ss',
  `seller_memo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家备忘信息',
  `buyer_memo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家备注',
  `buyer_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '买家留言',
  `point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家使用积分,下单时生成，且一直不变。格式:100;单位:个.',
  `real_point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家实际使用积分（扣除部分退款使用的积分），交易完成后生成（交易成功或关闭），交易未完成时该字段值为0。格式:100;单位:个',
  `buyer_obtain_point_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家获得积分,返点的积分。格式:100;单位:个。返点的积分要交易成功之后才能获得。',
  `receiving_time` datetime NULL DEFAULT NULL COMMENT '收货时间，这里返回的是完全收货时间',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '交易状态。可选值: * TRADE_NO_CREATE_PAY(没有创建支付宝交易) * WAIT_BUYER_PAY(等待买家付款) * SELLER_CONSIGNED_PART(卖家部分发货) * WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) * WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) * TRADE_BUYER_SIGNED(买家已签收,货到付款专用) * TRADE_FINISHED(交易成功) * TRADE_CLOSED(付款以后用户退款成功，交易自动关闭) * TRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易) * PAY_PENDING(国际信用卡支付付款确认中) * WAIT_PRE_AUTH_CONFIRM(0元购合约中) * PAID_FORBID_CONSIGN(拼团中订单或者发货强管控的订单，已付款但禁止发货)',
  `trade_memo` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易备注。',
  `erp_send_company` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递公司',
  `erp_send_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'erp发货快递单号',
  `erp_send_status` int NULL DEFAULT 0 COMMENT 'erp发货状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '数据库创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '数据库更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据库更新人',
  `oaid` varchar(2552) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '（收货人+手机号+座机+收货地址+create）5个字段组合成oaid，原始订单上座机为空也满足条件，否则生成不了oaid',
  `aid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址aid字段',
  `receiver_country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人国籍',
  `receiver_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在省份',
  `receiver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在城市',
  `receiver_district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的所在地区',
  `receiver_town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人街道地址',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的详细地址',
  `receiver_zip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的邮编',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的姓名',
  `receiver_mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的手机号码',
  `receiver_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人的电话号码',
  `seller_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家是否已评价。可选值:true(已评价),false(未评价)',
  `seller_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `buyer_rate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '买家是否已评价。可选值:true(已评价),false(未评价)。如买家只评价未打分，此字段仍返回false',
  `buyer_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家下单的地区',
  `alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号，如：2009112081173831',
  `buyer_alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家支付宝账号',
  `buyer_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家邮件地址',
  `seller_alipay_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家支付宝账号',
  `has_post_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否包含邮费。与available_confirm_fee同时使用。可选值:true(包含),false(不包含)',
  `timeout_action_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '超时到期时间。格式:yyyy-MM-dd HH:mm:ss。业务规则：前提条件：只有在买家已付款，卖家已发货的情况下才有效如果申请了退款，那么超时会落在子订单上；比如说3笔ABC，A申请了，那么返回的是BC的列表, 主定单不存在如果没有申请过退款，那么超时会挂在主定单上；比如ABC，返回主定单，ABC的超时和主定单相同',
  `snapshot_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易快照地址',
  `promotion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '交易促销详细信息',
  `yfx_fee` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单的运费险，单位为元',
  `has_yfx` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单中是否包含运费险订单，如果包含运费险订单返回true，不包含运费险订单，返回false',
  `send_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单将在此时间前发出，主要用于预售订单',
  `is_part_consign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是多次发货的订单如果卖家对订单进行多次发货，则为true否则为false',
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流运单号',
  `tmall_coupon_fee` bigint NULL DEFAULT NULL COMMENT '天猫商家使用，订单使用的红包信息',
  `audit_status` int NULL DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785992384864010243 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tao_order
-- ----------------------------

-- ----------------------------
-- Table structure for oms_tao_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order_item`;
CREATE TABLE `oms_tao_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tid` bigint NOT NULL COMMENT '订单id',
  `oid` bigint NOT NULL COMMENT '子订单编号',
  `total_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '应付金额（商品价格 * 商品数量 + 手工调整金额 - 子订单级订单优惠金额）。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `discount_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '子订单级订单优惠金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `adjust_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '手工调整金额.格式为:1.01;单位:元;精确到小数点后两位.',
  `divide_order_fee` float NULL DEFAULT NULL COMMENT '分摊之后的实付金额',
  `part_mjz_discount` float NULL DEFAULT NULL COMMENT '优惠分摊',
  `payment` float NULL DEFAULT NULL COMMENT '子订单实付金额。精确到2位小数，单位:元。如:200.07，表示:200元7分。对于多子订单的交易，计算公式如下：payment = price * num + adjust_fee - discount_fee ；单子订单交易，payment与主订单的payment一致，对于退款成功的子订单，由于主订单的优惠分摊金额，会造成该字段可能不为0.00元。建议使用退款前的实付金额减去退款单中的实际退款金额计算。',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `pic_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品主图',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品价格',
  `num_iid` bigint NULL DEFAULT NULL COMMENT '商品数字ID',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品的最小库存单位Sku的id.可以通过taobao.item.sku.get获取详细的Sku信息天猫的SKUID',
  `outer_iid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商家外部编码(可与商家外部系统对接)。',
  `outer_sku_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部网店自己定义的Sku编号',
  `sku_properties_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU的值。如：机身颜色:黑色;手机套餐:官方标配',
  `item_meal_id` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐ID',
  `item_meal_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '套餐的值。如：M8原装电池:便携支架:M8专用座充:莫凡保护袋',
  `num` int NULL DEFAULT NULL COMMENT '数量',
  `timeout_action_time` datetime NULL DEFAULT NULL COMMENT '订单超时到期时间。格式:yyyy-MM-dd HH:mm:ss',
  `item_memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品备注',
  `buyer_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家是否已评价。可选值：true(已评价)，false(未评价)',
  `seller_rate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家是否已评价。可选值：true(已评价)，false(未评价)',
  `seller_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家类型，可选值为：B（商城商家），C（普通卖家）',
  `cid` bigint NULL DEFAULT NULL COMMENT '交易商品对应的类目ID',
  `is_oversold` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '	是否超卖',
  `end_time` datetime NULL DEFAULT NULL COMMENT '子订单的交易结束时间说明：子订单有单独的结束时间，与主订单的结束时间可能有所不同，在有退款发起的时候或者是主订单分阶段付款的时候，子订单的结束时间会早于主订单的结束时间，所以开放这个字段便于订单结束状态的判断',
  `order_from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单来源,如jhs(聚划算)、taobao(淘宝)、wap(无线)',
  `is_service_order` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否是服务订单，是返回true，否返回false。',
  `consign_time` datetime NULL DEFAULT NULL COMMENT '子订单发货时间，当卖家对订单进行了多次发货，子订单的发货时间和主订单的发货时间可能不一样了，那么就需要以子订单的时间为准。（没有进行多次发货的订单，主订单的发货时间和子订单的发货时间都一样）',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单的运送方式（卖家对订单进行多次发货之后，一个主订单下的子订单的运送方式可能不同，用order.shipping_type来区分子订单的运送方式）',
  `logistics_company` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单发货的快递公司名称',
  `invoice_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单所在包裹的运单号',
  `bind_oid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '捆绑的子订单号，表示该子订单要和捆绑的子订单一起发货，用于卖家子订单捆绑发货',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态（请关注此状态，如果为TRADE_CLOSED_BY_TAOBAO状态，则不要对此订单进行发货，切记啊！）。可选值:\r\nTRADE_NO_CREATE_PAY(没有创建支付宝交易)\r\nWAIT_BUYER_PAY(等待买家付款)\r\nWAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款)\r\nWAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货)\r\nTRADE_BUYER_SIGNED(买家已签收,货到付款专用)\r\nTRADE_FINISHED(交易成功)\r\nTRADE_CLOSED(付款以后用户退款成功，交易自动关闭)\r\nTRADE_CLOSED_BY_TAOBAO(付款以前，卖家或买家主动关闭交易)\r\nPAY_PENDING(国际信用卡支付付款确认中)',
  `refund_status` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'NO_REFUND' COMMENT '退款状态。退款状态。可选值 WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `refund_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近退款ID',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785992385006616578 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tao_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for oms_tao_order_promotion
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_order_promotion`;
CREATE TABLE `oms_tao_order_promotion`  (
  `id` bigint NOT NULL COMMENT '交易的主订单或子订单号',
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠信息的名称',
  `discount_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠金额（免运费、限时打折时为空）,单位：元',
  `gift_item_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '满就送商品时，所送商品的名称',
  `gift_item_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '赠品的宝贝id',
  `gift_item_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '满就送礼物的礼物数量',
  `promotion_desc` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠活动的描述',
  `promotion_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '优惠id，(由营销工具id、优惠活动id和优惠详情id组成，结构为：营销工具id-优惠活动id_优惠详情id，如mjs-123024_211143）',
  `kd_discount_fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分摊优惠金额（免运费、限时打折时为空）,单位：元',
  `kd_child_discount_fee` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '若优惠项在主订单上，返回子订单的分摊信息'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单优惠明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tao_order_promotion
-- ----------------------------

-- ----------------------------
-- Table structure for oms_tao_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_tao_refund`;
CREATE TABLE `oms_tao_refund`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refund_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款id',
  `dispute_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款类型，可选值REFUND(仅退款),REFUND_AND_RETURN(退货退款),TMALL_EXCHANGE(天猫换货),TAOBAO_EXCHANGE(淘宝换货),REPAIR(维修),RESHIPPING(补寄),OTHERS(其他)',
  `shop_id` int NOT NULL COMMENT '店铺id',
  `tid` bigint NULL DEFAULT NULL COMMENT '淘宝交易单号（订单号）',
  `oid` bigint NULL DEFAULT NULL COMMENT '子订单号。如果是单笔交易oid会等于tid',
  `payment` float NULL DEFAULT NULL COMMENT '支付给卖家的金额(交易总金额-退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `price` float NULL DEFAULT NULL COMMENT '商品价格。',
  `total_fee` float NULL DEFAULT NULL COMMENT '交易总金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `refund_fee` float NULL DEFAULT NULL COMMENT '退还金额(退还给买家的金额)。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `split_seller_fee` float NULL DEFAULT NULL COMMENT '	分账给卖家的钱',
  `split_taobao_fee` float NULL DEFAULT NULL COMMENT '分账给淘宝的钱',
  `created` datetime NULL DEFAULT NULL COMMENT '退款申请时间。格式:yyyy-MM-dd HH:mm:ss',
  `modified` datetime NULL DEFAULT NULL COMMENT '更新时间。格式:yyyy-MM-dd HH:mm:ss',
  `seller_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家昵称',
  `cs_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '不需客服介入1;需要客服介入2;客服已经介入3;客服初审完成4;客服主管复审失败5;客服处理完成6;系统撤销(B2B使用)，维权撤销(集市使用) 7;支持买家 8;支持卖家 9;举证中 10;开放申诉 11;',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款状态。可选值WAIT_SELLER_AGREE(买家已经申请退款，等待卖家同意) WAIT_BUYER_RETURN_GOODS(卖家已经同意退款，等待买家退货) WAIT_SELLER_CONFIRM_GOODS(买家已经退货，等待卖家确认收货) SELLER_REFUSE_BUYER(卖家拒绝退款) CLOSED(退款关闭) SUCCESS(退款成功)',
  `order_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款对应的订单交易状态。可选值TRADE_NO_CREATE_PAY(没有创建支付宝交易) WAIT_BUYER_PAY(等待买家付款) WAIT_SELLER_SEND_GOODS(等待卖家发货,即:买家已付款) WAIT_BUYER_CONFIRM_GOODS(等待买家确认收货,即:卖家已发货) TRADE_BUYER_SIGNED(买家已签收,货到付款专用) TRADE_FINISHED(交易成功) TRADE_CLOSED(交易关闭) TRADE_CLOSED_BY_TAOBAO(交易被淘宝关闭) ALL_WAIT_PAY(包含：WAIT_BUYER_PAY、TRADE_NO_CREATE_PAY) ALL_CLOSED(包含：TRADE_CLOSED、TRADE_CLOSED_BY_TAOBAO) 取自\"http://open.taobao.com/dev/index.php/%E4%BA%A4%E6%98%93%E7%8A%B6%E6%80%81\"',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '卖家收货地址',
  `advance_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款先行垫付默认的未申请状态 0;退款先行垫付申请中 1;退款先行垫付，垫付完成 2;退款先行垫付，卖家拒绝收货 3;退款先行垫付，垫付关闭 4;退款先行垫付，垫付分账成功 5;',
  `alipay_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号',
  `good_return_time` datetime NULL DEFAULT NULL COMMENT '退货时间。格式:yyyy-MM-dd HH:mm:ss',
  `good_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货物状态。可选值BUYER_NOT_RECEIVED (买家未收到货) BUYER_RECEIVED (买家已收到货) BUYER_RETURNED_GOODS (买家已退货)',
  `has_good_return` int NULL DEFAULT NULL COMMENT '买家是否需要退货。可选值:true(是),false(否)',
  `num_iid` bigint NULL DEFAULT NULL COMMENT '申请退款的商品数字编号',
  `num` bigint NOT NULL DEFAULT 0 COMMENT '退货数量',
  `outer_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品外部商家编码',
  `reason` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `refund_phase` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款阶段，可选值：onsale/aftersale',
  `shipping_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流方式.可选值:free(卖家包邮),post(平邮),express(快递),ems(EMS).',
  `desc1` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款说明',
  `company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `sid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退货运单号',
  `send_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家发货时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '	完结时间。格式:yyyy-MM-dd HH:mm:ss',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品SKU信息',
  `buyer_open_uid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家openUid',
  `buyer_nick` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家昵称',
  `combine_item_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组合品信息\r\nnum_iid	String	2342344	商品数字编号\r\nitem_name	String	测试商品	商品标题\r\nquantity	Number	123	数量\r\nsku_id	String	123	sku_id\r\nouter_iid	String	123	商家外部编码(可与商家外部系统对接)\r\nouter_sku_id	String	123	123',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pull_status` int NULL DEFAULT NULL COMMENT '推送状态（0未推送；1推送成功；2推送失败）',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1786655103824936964 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝退款表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tao_refund
-- ----------------------------
INSERT INTO `oms_tao_refund` VALUES (1786655103661359105, '154686037032128162', 'REFUND', 6, 2137984935735126281, 2137984935736126281, 0, NULL, 3378, 3378, NULL, NULL, '2024-05-04 13:04:42', '2024-05-04 13:04:43', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 13:04:43', '曲美家居现代简约双人板式床舒适婚床卧室多功能储物床', '4988190157320|颜色分类:木本色架子床+独袋乳胶床垫;尺寸:1500mm*2000mm', 'AAH3HVMUAAJ_dKyzaDW__rrF', '阿绿碎碎念', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103690719234, '272863119053250876', 'REFUND', 6, 3873446498759257608, 3873446498760257608, 0, NULL, 9999, 9999, NULL, NULL, '2024-05-04 09:10:40', '2024-05-04 09:10:54', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '订单信息拍错（规格/尺码/颜色等）', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 09:10:54', '曲美lab墩墩沙发现代简约轻奢风自由模块组合布艺别墅客厅沙发', '5015802656260|适用人数:组合;颜色分类:【适用4人】灯芯绒-燕麦白', 'AAEeHVMUAAJ_dKyzaDWtYDsb', 'yina_1217', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103757828097, '272811564981003461', 'REFUND', 6, 3867452064428006134, 3867452064429006134, 0, NULL, 12359, 12359, NULL, NULL, '2024-05-04 00:20:08', '2024-05-04 08:46:35', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '没用/少用优惠', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-04 08:46:36', '曲美lab墩墩沙发现代简约轻奢风自由模块组合布艺别墅客厅沙发', '5015802656265|适用人数:组合;颜色分类:【适用4人】灯芯绒-奶茶灰', 'AAFlHVMUAAJ_dKyzaDUeaMJi', '亲你妹夫亲', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103757828098, '272807678894920119', 'REFUND_AND_RETURN', 6, 3851109505623921901, 3851109505624921901, 0, NULL, 2104.03, 2104.03, NULL, NULL, '2024-05-03 19:17:13', '2024-05-03 19:42:33', '曲美家具官方旗舰店', NULL, 'WAIT_SELLER_AGREE', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 1, 1298098439, 1, 'ZQB-2011C-WG1', '商品无法安装使用', 'aftersale', NULL, '', NULL, NULL, NULL, NULL, '【新风潮价】曲美家居现代简约实木衣柜卧室衣帽柜平开门衣橱环保板材储物柜', '4600898994639|颜色分类:木本色衣柜;门数量:2门;是否组装:组装', 'AAGyHVMUAAJ_dKyzaDUwia6Q', '无忌上', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 16:16:34', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103824936962, '154544811395929773', 'REFUND', 6, 2121326583552927397, 2121326583553927397, 0, NULL, 2135, 2135, NULL, NULL, '2024-05-03 17:49:22', '2024-05-03 17:49:23', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_CLOSED', NULL, NULL, NULL, NULL, 'BUYER_NOT_RECEIVED', 0, NULL, 1, NULL, '拍错/多拍/不喜欢', 'onsale', NULL, '', NULL, NULL, NULL, '2024-05-03 17:49:23', '【活动价】曲美lab墩墩沙发现代简约模块布艺真皮沙发别墅客厅沙发自由搭配', '5451881559814|适用人数:组合;颜色分类:灯芯绒坐包-燕麦白;尺寸:84x84x40cm', 'AAHCHVMUAAJ_dKyzaDUfiNYK', 'nono璐hly', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 15:13:53', NULL, NULL);
INSERT INTO `oms_tao_refund` VALUES (1786655103824936963, '154486920027549058', 'REFUND', 6, 2088964452215545890, 2088964452216545890, 1236.4, NULL, 1256.4, 20, NULL, NULL, '2024-05-03 17:10:19', '2024-05-03 17:10:21', '曲美家具官方旗舰店', NULL, 'SUCCESS', 'TRADE_FINISHED', NULL, NULL, NULL, NULL, 'BUYER_RECEIVED', 0, 1684779514, 2, 'ZH-SF-04-DS-F9-QM20A-NT3', '与商家协商一致退款', 'aftersale', NULL, '', NULL, NULL, NULL, '2024-05-03 17:10:21', '曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', '4902529397704|颜色分类:奶油白;安装方式:组装', 'AAHRHVMUAAJ_dKyzaDVwM06l', 'cfzxl365', NULL, '2024-05-04 15:12:26', NULL, NULL, '2024-05-04 20:31:50', 1, '2024-05-04 20:31:55');

-- ----------------------------
-- Table structure for oms_tenant_shop_goods
-- ----------------------------
DROP TABLE IF EXISTS `oms_tenant_shop_goods`;
CREATE TABLE `oms_tenant_shop_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `platform_goods_id` bigint NOT NULL COMMENT '平台商品id',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT '供应链商品ID',
  `goods_num` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品货号，erp系统商品编码',
  `price` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '参考价格，返回价格区间，可能为空',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '主图',
  `total_sales` int NULL DEFAULT 0 COMMENT '累计销量',
  `status` int NULL DEFAULT NULL COMMENT '状态（1上架2下架）',
  `remark` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `tenant_id` bigint NOT NULL COMMENT '租户ID（distributor）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tenant_shop_goods
-- ----------------------------
INSERT INTO `oms_tenant_shop_goods` VALUES (1, 23, 392657083276, 9, '2720218026', NULL, '高腰宽松直筒牛仔短裤女夏a字型显瘦甜欲风辣妹毛边2022新款黑色', 'https://img.pddpic.com/gaudit-image/2022-09-28/ed63f69d82e863972d1633cad97352a2.jpeg', 1024, 1, NULL, 1, '2022-10-08 20:36:12', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (2, 23, 393216514010, 11, '2720220608', NULL, '高腰直筒牛仔短裤女夏天a字型翻边热裤显瘦甜欲辣妹新款学生黑色', 'https://img.pddpic.com/gaudit-image/2022-09-17/cafc8ca9dbc964862ee35c4429383f74.jpeg', 56, 1, NULL, 1, '2022-10-08 20:36:12', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (3, 23, 393654097571, 0, 'HN270', NULL, '高腰弹力紧身牛仔打底短裤女显瘦显高辣妹a字型热裤2022夏天学生', 'https://img.pddpic.com/gaudit-image/2022-07-23/58da809ecc22d16d8dc360d31e4cd064.jpeg', 30, 1, NULL, 1, '2022-10-08 20:36:12', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (4, 23, 393659007414, 10, '2720220858', NULL, '高腰弹力a字型牛仔短裤女学生紧身显瘦辣妹纯欲风抽绳绑带炸街潮', 'https://img.pddpic.com/gaudit-image/2022-09-24/1c30e57d86fc72f3e5ba10ec860b24d2.jpeg', 486, 1, NULL, 1, '2022-10-08 20:36:12', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (5, 23, 394814708558, 13, '2820220681', NULL, '高腰阔腿牛仔裤女宽松直筒学生复古港风泫雅风拖地裤chic交叉腰头', 'https://img.pddpic.com/gaudit-image/2022-10-06/f671e813ff967e02f4421229be8f1c4a.jpeg', 45, 1, NULL, 1, '2022-10-08 20:36:13', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (6, 23, 395429166799, 15, '2820210661', NULL, '高腰直筒牛仔裤女宽松阔腿垂坠感设计感潮炸街学生复古港风拖地潮', 'https://img.pddpic.com/gaudit-image/2022-10-06/b1405a6b88893d52fd4197dcb652e7fa.jpeg', 141, 1, NULL, 1, '2022-10-08 20:36:13', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (7, 23, 395930868595, 0, 'HN0708', NULL, '高腰牛仔短裤女夏天a字型翻边热裤双扣ins网红卷边阔腿时尚辣妹潮', 'https://img.pddpic.com/gaudit-image/2022-08-24/424f2fe63587326c7c75973c42572176.jpeg', 69, 1, NULL, 1, '2022-10-08 20:36:13', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (8, 23, 398085327353, 0, 'yfz-tb-650212367541', NULL, '薄款裤脚开叉牛仔裤女夏季高腰新款微喇叭弹力修身显瘦拖地长裤子', 'https://img.pddpic.com/gaudit-image/2022-08-04/c18d2469f3eb07968f4dd36ab4a00486.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:13', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (9, 23, 398667645632, 0, '', NULL, '美式复古经典基础款超高腰显瘦弹力修身牛仔短裤女包臀性感热裤夏', 'https://img.pddpic.com/gaudit-image/2022-09-17/e4021e68d40d8919bb319b7fe89f1b31.jpeg', 41, 0, NULL, 1, '2022-10-08 20:36:14', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (10, 23, 401654801488, 0, 'HN0025', NULL, '修身毛边九分小脚铅笔裤牛仔裤女高腰弹力修身显瘦紧身2022年新款', 'https://img.pddpic.com/gaudit-image/2022-08-22/b99ead8c07a6743735e7e586bdb3eca4.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:14', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (11, 23, 401781697078, 16, '2820210678', NULL, '高腰直筒显瘦微喇叭牛仔裤女开叉裤宽松垂坠感泫雅风浅蓝色拖地长', 'https://img.pddpic.com/gaudit-image/2022-09-29/ecef07b65c530ba38561516ecb5c343b.jpeg', 23, 1, NULL, 1, '2022-10-08 20:36:14', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (12, 23, 401781826934, 18, 'HN0014', NULL, '浅色高腰微喇叭牛仔裤女双扣修身弹力春秋新款显瘦微喇叭开叉拖地', 'https://img.pddpic.com/gaudit-image/2022-09-29/a98e7a25ec6651fcdadfacd09872b47b.jpeg', 68, 1, NULL, 1, '2022-10-08 20:36:14', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (13, 23, 401993680807, 0, '', NULL, '高腰牛仔背带短裤女热裤夏季新款学院风减龄卷边吊带连体裤直筒裤', 'https://img.pddpic.com/gaudit-image/2022-08-14/edfc54f4eebf2392c7d6675a21a5a7c7.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:14', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (14, 23, 403434723538, 24, 'HN20220012', NULL, '高腰阔腿牛仔裤女宽松直筒竖条纹高街vibe风拖地长裤子ins潮垂感', 'https://img.pddpic.com/gaudit-image/2022-09-29/daee228c044d11aef6a59ba707284da8.jpeg', 42, 1, NULL, 1, '2022-10-08 20:36:15', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (15, 23, 403438406420, 0, 'HN0010', NULL, '修身毛边破洞九分裤小脚铅笔裤高腰牛仔裤女2022新款韩版显瘦百搭', 'https://img.pddpic.com/gaudit-image/2022-08-18/3f2fbb00a6cd6ba918ab7fcb923fc24c.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:15', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (16, 23, 403654853255, 0, 'HN015', NULL, '高腰弹力微喇叭牛仔裤女学生网红同款裤脚前开叉显瘦修身拖地长裤', 'https://img.pddpic.com/gaudit-image/2022-10-01/0317d2b3193307c71ffa05fd80fb6860.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:15', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (17, 23, 403877249755, 0, 'yfz-tb-670085078625', NULL, '牛仔裤直筒高腰修身弹力2022年新款微喇叭显瘦小个子直筒裤拖地裤', 'https://img.pddpic.com/gaudit-image/2022-08-19/714ddb39d6867687ed2a3f9be6789889.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:15', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (18, 23, 403877355587, 0, 'yfz-tb-638661096456', NULL, '牛仔裤铅笔裤韩版高腰显瘦弹力新款百搭紧身九分铅笔小脚裤子', 'https://img.pddpic.com/gaudit-image/2022-08-19/597fa2707d56eb0c91e3c94f88acdb0b.jpeg', 1, 0, NULL, 1, '2022-10-08 20:36:15', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (19, 23, 403877444479, 0, 'yfz-tb-639346263403', NULL, '黑色修身毛边九分小脚铅笔牛仔裤女高腰弹力显瘦显高紧身韩版百搭', 'https://img.pddpic.com/gaudit-image/2022-09-14/c0889b9ba1dc4d1884b8cdfae91889a9.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:15', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (20, 23, 403877488703, 27, 'HN023', NULL, '高腰直筒牛仔裤女2022秋季黑色新款百搭显瘦宽松九分烟管裤子潮流', 'https://img.pddpic.com/gaudit-image/2022-09-24/9f69abd98877eb721a475af487bae74e.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:16', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (21, 23, 403877607629, 23, 'HN20220024', NULL, '高腰提臀牛仔裤女弹力九分小脚铅笔裤双扣修身显瘦显高2022秋新款', 'https://img.pddpic.com/gaudit-image/2022-08-19/c21e2ae2c578ce11e9abc6dece6d6c0e.jpeg', 10, 1, NULL, 1, '2022-10-08 20:36:16', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (22, 23, 403877716388, 0, 'HN0029', NULL, '修身毛边九分铅笔裤高腰小脚牛仔裤女2022年新款弹力显瘦百搭紧身', 'https://img.pddpic.com/gaudit-image/2022-08-19/c1405585b4a6135a5b54dfb93c14893f.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:16', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (23, 23, 404300819650, 0, '', NULL, '牛仔裤女夏2022年新款高腰哈伦裤显瘦气质百搭小脚裤时尚九分裤薄', 'https://img.pddpic.com/gaudit-image/2022-08-20/f90369c63c3cca6aa012e71fbeeb0d8d.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:16', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (24, 23, 408225561862, 0, 'T610041890003', NULL, '高腰弹力牛仔裤九分小脚铅笔裤紧身显瘦显高修身百搭2022年新款女', 'https://img.pddpic.com/gaudit-image/2022-08-30/109763d466358b6845392d07323ae03c.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:16', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (25, 23, 409855932902, 0, 'HN180', NULL, '高腰九分哈伦牛仔裤女小脚萝卜老爹裤小个显高新款韩版宽松显瘦潮', 'https://img.pddpic.com/gaudit-image/2022-09-15/d2f7884f4ea03f5580843171d190c407.jpeg', 0, 1, NULL, 1, '2022-10-08 20:36:17', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (26, 23, 409864423309, 37, 'HN106', NULL, '高腰弹力九分小脚铅笔裤紧身牛仔裤女修身毛边显瘦显高百搭蓝灰色', 'https://img.pddpic.com/gaudit-image/2022-09-28/3a3aa28f0de00054d4ebb3bec4190432.jpeg', 12, 1, NULL, 1, '2022-10-08 20:36:17', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (27, 23, 409866847439, 42, 'HN222', NULL, '高腰直筒宽松阔腿牛仔裤女胖妹妹粗腿梨型身材泫雅垂感秋冬拖地裤', 'https://img.pddpic.com/gaudit-image/2022-09-03/316f35a521c20cc7aa5f3e5d6f48936a.jpeg', 3, 1, NULL, 1, '2022-10-08 20:36:17', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (28, 23, 409879757750, 0, 'HN620', NULL, '破洞牛仔裤女高腰直筒爱心2022春夏新款显瘦百搭拖地阔腿长裤时尚', 'https://img.pddpic.com/gaudit-image/2022-09-03/a9cfcd02574bc7babd42d1ac9c32bc7d.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:17', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (29, 23, 409883128005, 34, 'HN621', NULL, '高腰直筒牛仔裤女宽松阔腿老爹裤破洞新款垂感百搭拖地长裤时尚潮', 'https://img.pddpic.com/gaudit-image/2022-09-03/03500eb346573bc8804e5a8f053b52ed.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:17', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (30, 23, 409885859735, 0, 'HN630', NULL, '高腰九分哈伦牛仔裤女新款秋季韩版显瘦松紧腰小脚萝卜老爹裤休闲', 'https://img.pddpic.com/gaudit-image/2022-09-03/d7cb2c2f269b9e70fae7cf08c16de704.jpeg', 1, 1, NULL, 1, '2022-10-08 20:36:18', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (31, 23, 410305683990, 44, 'HN660', NULL, '高腰阔腿牛仔裤女学生直筒拖地长裤宽松调节腰韩版简约时尚垂感潮', 'https://img.pddpic.com/gaudit-image/2022-09-04/ef88fbd43b7d99b8916087a3843c0cdc.jpeg', 1, 1, NULL, 1, '2022-10-08 20:36:18', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (32, 23, 410308626596, 35, 'HN662', NULL, '高腰直筒阔腿牛仔裤女韩版宽松显瘦泫雅风小雏菊绣花拖地裤浅蓝', 'https://img.pddpic.com/gaudit-image/2022-09-04/b276eaa49fd18e61d0f181cf01dd8256.jpeg', 0, 1, NULL, 1, '2022-10-08 20:36:18', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (33, 23, 410688391724, 38, 'HN663', NULL, '高腰直筒阔腿牛仔裤女宽松拖地长裤2022新款爱心刺绣张极同款裤子', 'https://img.pddpic.com/gaudit-image/2022-09-05/a1c7708baeebd04294489303981bf1a4.jpeg', 2, 1, NULL, 1, '2022-10-08 20:36:18', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (34, 23, 410692286065, 0, 'HN665', NULL, '高腰直筒黑色牛仔裤女秋冬新款韩版阔腿宽松显瘦垂坠感校园风裤子', 'https://img.pddpic.com/gaudit-image/2022-09-05/03d7e1fe2aac50ffea1f54332de9cc48.jpeg', 0, 1, NULL, 1, '2022-10-08 20:36:18', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (35, 23, 410693529689, 0, 'HN666', NULL, '高腰直筒九分哈伦老爹萝卜牛仔裤女小个子2022新款百搭韩版显瘦潮', 'https://img.pddpic.com/gaudit-image/2022-09-28/d20f19284a3ec6e8d5dfaa22fb60c4da.jpeg', 0, 1, NULL, 1, '2022-10-08 20:36:19', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (36, 23, 410694952121, 41, 'HN667', NULL, '高腰直筒牛仔裤女小个子新款2022年秋装显瘦宽松阔腿垂感拖地裤潮', 'https://img.pddpic.com/gaudit-image/2022-09-05/8bd4388f10a7c0fedef8d1513104b1ab.jpeg', 17, 1, NULL, 1, '2022-10-08 20:36:19', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (37, 23, 410695996318, 40, 'HN668', NULL, '高腰束脚九分哈伦牛仔裤女显瘦小个子宽松腰2022新款萝卜老爹裤bf', 'https://img.pddpic.com/gaudit-image/2022-09-05/17d871fc332e40f04caff43fa952fed0.jpeg', 1, 1, NULL, 1, '2022-10-08 20:36:19', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (38, 23, 410697172304, 0, 'HN669', NULL, '高腰直筒牛仔裤女学生松紧腰哈伦老爹裤2022新款显瘦百搭chic潮流', 'https://img.pddpic.com/gaudit-image/2022-09-05/d611d19b8e7b76dc77287a4709cc3cfb.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:19', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (39, 23, 411361540533, 28, 'HN670', NULL, '哈伦牛仔裤女直筒宽松春装2022年新款高腰显瘦九分春季老爹萝卜裤', 'https://img.pddpic.com/gaudit-image/2022-10-01/895026ef7ecadcd6f9fda2cfe446ac90.jpeg', 7, 1, NULL, 1, '2022-10-08 20:36:19', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (40, 23, 411366495987, 0, '665779472192', NULL, '新款高腰黑色阔腿牛仔裤女小众辣妹拖地老爹裤直筒宽松显瘦设计感', 'https://img.pddpic.com/gaudit-image/2022-09-07/0194e1652ad7a11307157f30cb9e4f6f.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:20', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (41, 23, 411370161999, 0, '670461866109', NULL, '高腰直筒微喇叭牛仔裤女学生复古不开叉长裤2022秋冬新款宽松百搭', 'https://img.pddpic.com/gaudit-image/2022-09-07/f5abdaf1b5b54114f50b08a45ed4a3e9.jpeg', 2, 1, NULL, 1, '2022-10-08 20:36:20', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (42, 23, 411378921081, 0, '637993903547', NULL, '哈伦牛仔裤女学生直筒宽松2022秋冬新款小个子显瘦高腰萝卜老爹裤', 'https://img.pddpic.com/gaudit-image/2022-09-07/cbebf578bbc128c9c701d6ca8bfd5f98.jpeg', 0, 1, NULL, 1, '2022-10-08 20:36:20', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (43, 23, 411379965590, 0, '668784844135', NULL, '黑色高腰直筒开叉微喇叭牛仔裤女2022年新款修身拖地垂坠感显瘦潮', 'https://img.pddpic.com/gaudit-image/2022-09-07/b66cca1fa97d2f8abdad3af6b76717f8.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:20', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (44, 23, 411726911306, 45, 'HN686', NULL, '百搭简约牛仔裤白色高腰阔腿牛仔裤女宽松vibe风显瘦直筒可调节腰', 'https://img.pddpic.com/gaudit-image/2022-10-01/87f687ae1ad35b37f41184fc9751775a.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:20', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (45, 23, 411728903206, 0, '', NULL, '扎染高腰阔腿牛仔裤女宽松vibe风裤子百搭显瘦直筒彩色拖地裤子夏', 'https://img.pddpic.com/gaudit-image/2022-09-08/9c2159800f4698b5ba78f39bb18fedc8.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:20', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (46, 23, 411729694401, 36, 'HN692', NULL, '九分牛仔裤女小个子哈伦老爹萝卜裤松紧高腰2022新款百搭宽松显瘦', 'https://img.pddpic.com/gaudit-image/2022-09-17/6e54ebddf5ae7f009c369c09b42deed2.jpeg', 7, 1, NULL, 1, '2022-10-08 20:36:21', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (47, 23, 411731178725, 43, 'HN694', NULL, '老爹裤女小个子网红chic宽松大码直筒裤秋季新款松紧百搭阔腿裤潮', 'https://img.pddpic.com/gaudit-image/2022-09-08/3d52f55f19e6062d22b9f92bbd625f60.jpeg', 1, 1, '供应商无货准备下架', 1, '2022-10-08 20:36:21', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (48, 23, 411732581938, 32, 'HN697', NULL, '哈伦裤九分裤韩版双扣后松紧高腰宽松萝卜牛仔裤女2022年夏季新款', 'https://img.pddpic.com/gaudit-image/2022-09-27/01b7f53789a750c360e7e51850618299.jpeg', 8, 1, NULL, 1, '2022-10-08 20:36:21', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (49, 23, 412120506598, 33, 'HN0801', NULL, '高腰哈伦牛仔裤女九分直筒宽松老爹萝卜裤2022新款韩版显瘦休闲潮', 'https://img.pddpic.com/gaudit-image/2022-09-09/9341ee50b7003832ccee394d68a340bf.jpeg', 63, 1, NULL, 1, '2022-10-08 20:36:21', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (50, 23, 412133591017, 31, 'HN801', NULL, '老爹萝卜裤九分牛仔直筒哈伦裤女学生秋装2022年新款显瘦高腰宽松', 'https://img.pddpic.com/gaudit-image/2022-09-09/6e17994bb795bfa7f00c1d89c24afb16.jpeg', 4, 1, NULL, 1, '2022-10-08 20:36:21', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (51, 23, 412137132774, 0, 'HN802', NULL, '复古牛仔裤女黑灰色九分裤2022秋季新款高腰阔腿宽松老爹裤chic潮', 'https://img.pddpic.com/gaudit-image/2022-09-09/779f5bd008d0a9f2c7ec85c4524ee087.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:22', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (52, 23, 412138772165, 0, 'HN805', NULL, '破洞牛仔裤女学生韩版九分阔腿裤显瘦高腰宽松新款2022秋装chic潮', 'https://img.pddpic.com/gaudit-image/2022-09-09/0443f63986467ecc60b800b87f994ee0.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:22', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (53, 23, 412139652425, 0, 'HN807', NULL, '高腰直筒九分萝卜哈伦牛仔裤小个子松紧腰老爹裤子女春秋款韩版潮', 'https://img.pddpic.com/gaudit-image/2022-09-09/b46bd47c3fdd61fcf36bff584778562a.jpeg', 0, 0, NULL, 1, '2022-10-08 20:36:22', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (54, 23, 414594889986, 0, '', NULL, '弹力紧身贴标牛仔短裤女ins夏薄款a字裤打底外穿提臀直筒阔腿热裤', 'https://img.pddpic.com/gaudit-image/2022-09-16/238138bf7bc905fdd2b874e2f1e04059.jpeg', 3, 1, NULL, 1, '2022-10-08 20:36:22', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (55, 23, 415222366821, 0, '', NULL, '开衫v领针织衫女新款洋气外穿高档2022款毛衣外套针织上衣春秋ins', 'https://img.pddpic.com/gaudit-image/2022-09-18/eb3104f22378716c41323375ebf61a71.jpeg', 0, 1, NULL, 1, '2022-10-08 20:36:22', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (56, 23, 418757536479, 47, 'JKL805', NULL, '高腰阔腿裤女秋冬复古法式牛仔裤宽松直筒垂坠感设计感潮炸街显瘦', 'https://img.pddpic.com/gaudit-image/2022-09-28/a2937266502b0e40b13c5d297f65f69a.jpeg', 0, 1, NULL, 1, '2022-10-08 20:36:23', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (57, 23, 420535061032, 0, '', NULL, '高腰弹力微喇叭裤开叉裤脚直筒牛仔裤女修身显瘦收腰小个子九分裤', 'https://img.pddpic.com/gaudit-image/2022-10-06/64a7ae96630893e2986678cc0dbe85fa.jpeg', 0, 1, NULL, 1, '2022-10-08 20:36:23', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (58, 22, 3572881699002051281, 44, 'HN660', NULL, '腰围可调牛仔裤女春秋季高腰直筒裤宽松韩版显瘦小个子阔腿拖地裤', 'https://cbu01.alicdn.com/img/ibank/O1CN01PyeFAc2FOyCUPpZr7_!!2208857268871-0-cib.jpg', 0, 1, NULL, 1, '2022-10-08 20:45:53', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (59, 14, 398847598958, 0, '', NULL, '黑灰色松紧绑带牛仔短裤女宽松高腰弹力显瘦热裤阔腿胖MMa字型', 'https://img.pddpic.com/gaudit-image/2022-08-06/1ddd0e51a7d17a4cbbb0b654d93bc03e.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:28', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (60, 14, 399063348248, 0, '', NULL, '复古新款微喇牛仔裤女夏季高腰显瘦chic港味直筒宽松阔脚喇叭裤子', 'https://img.pddpic.com/gaudit-image/2022-08-07/a5377af55bc46da117fb838acefd4752.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:28', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (61, 14, 399063851678, 0, 't651428823385', NULL, '高腰微喇牛仔裤女开叉显瘦喇叭长裤弹力修身百搭直筒阔腿侧开纽扣', 'https://img.pddpic.com/gaudit-image/2022-09-18/c245ce52dcf00faeb70fbeb70ff95759.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:28', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (62, 14, 407249067559, 0, 't622135144835', NULL, '牛仔裤小脚长裤女2022秋季新款韩版高腰弹力修身显瘦休闲百搭钉珠', 'https://img.pddpic.com/gaudit-image/2022-08-28/2f00e9b96e58363c6163eee632053cb0.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:28', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (63, 14, 407356168572, 0, 'T624078788603', NULL, '牛仔裤女高腰微喇叭长裤秋季新款弹力紧身修身显瘦显高休闲百搭', 'https://img.pddpic.com/gaudit-image/2022-08-28/9ec229b3320b6323a0af604193a48f94.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:29', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (64, 14, 408246660557, 0, 'T610270951823', NULL, '高腰牛仔喇叭裤韩版显瘦紧身弹力百搭收腹港风宽松长裤春秋款洋气', 'https://img.pddpic.com/gaudit-image/2022-08-30/104e8f9c2637c2f40adc79cb4d632b0e.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:29', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (65, 14, 408275614162, 0, 'T610041890003', NULL, '铅笔裤直筒小脚高腰牛仔裤女新款百搭显瘦修身紧身女裤显高铅笔裤', 'https://img.pddpic.com/gaudit-image/2022-08-30/bd786b8f2ea7621fa6b25b61936da0ed.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:29', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (66, 14, 411405520617, 0, '675027903686', NULL, '2022新款韩版炸街牛仔裤女夏季宽松直筒阔腿高腰显瘦拖地裤百搭', 'https://img.pddpic.com/gaudit-image/2022-09-07/f44e84454b21878f86aa369afe25db9b.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:29', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (67, 14, 415140360909, 0, 'HN014', NULL, '高腰微喇牛仔裤女开叉裤高个子加长版双扣显瘦弹性修身百搭通勤潮', 'https://img.pddpic.com/gaudit-image/2022-09-18/7c541fde9014bf21b704b2f0c7222972.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:29', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (68, 14, 415209134293, 0, '', NULL, '开衫v领针织衫女新款洋气外穿高档2022款毛衣外套针织上衣春秋ins', 'https://img.pddpic.com/gaudit-image/2022-09-18/d1310043dee0d103927764faff1472a8.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:29', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (69, 14, 418749496896, 47, 'JKL805', NULL, '高腰阔腿牛仔裤女直筒宽松高个子加长微喇叭显瘦垂感潮流气质百搭', 'https://img.pddpic.com/gaudit-image/2022-10-08/de29e8e044c1dece30901ede5b2147bb.jpeg', 0, 1, '10.8全站推广出1单', 1, '2022-10-08 21:40:30', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (70, 14, 421025454368, 0, 'JKL8990', NULL, '高腰阔腿裤牛仔裤女小个子直筒个性设计遮肉洋气秋冬通勤潮流网红', 'https://img.pddpic.com/gaudit-image/2022-10-08/ccaab6402c058b1785e734f427c0f454.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:30', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (71, 14, 421031955741, 33, 'HN0801', NULL, '老爹裤女春秋款哈伦裤高档上档次小脚修身牛仔裤加绒冬款通勤潮流', 'https://img.pddpic.com/gaudit-image/2022-10-08/bf6649625f7a93f810c190c4eb6836bc.jpeg', 0, 1, NULL, 1, '2022-10-08 21:40:30', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (72, 23, 421771728900, 33, 'HN0801', NULL, '加绒高腰哈伦牛仔裤女九分直筒宽松老爹萝卜裤秋冬新款韩版显瘦', 'https://img.pddpic.com/gaudit-image/2022-10-11/74a3befbd651d6346d88a1dadb2f2038.jpeg', 0, 1, NULL, 1, '2022-10-11 19:26:16', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (73, 23, 422383287651, 22, 'HN20220020', NULL, '新款加绒牛仔裤女修身弹力小脚铅笔裤冬季防寒保暖显瘦厚款个性潮', 'https://img.pddpic.com/gaudit-image/2022-10-13/b33268c1cf711a642e875428cab25dca.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:48', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (74, 23, 422437259657, 48, 'HN180', NULL, '浅蓝色高腰牛仔裤女修身款九分矮个子梨形身材哈伦老爹裤显高束脚', 'https://img.pddpic.com/gaudit-image/2022-10-13/2c846bb7a2e6c721bf568b7c700ad5c6.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:48', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (75, 23, 422742565233, 0, 'HN665', NULL, '阔腿高腰牛仔裤女秋季2022年新款显瘦直筒宽松垂感拖地加长裤子潮', 'https://img.pddpic.com/gaudit-image/2022-10-14/0a7922b5a51156df616b9c0f799f7d35.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:48', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (76, 23, 422744325067, 0, '', NULL, '港风复古牛仔裤子女春秋小个子小众设计感梨形身材紧身小脚铅笔裤', 'https://img.pddpic.com/gaudit-image/2022-10-14/a0e22024b4cfa11155cf757a9ff15b65.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:49', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (77, 23, 423260246680, 0, '', NULL, '高腰小脚牛仔裤女秋冬加绒加厚显瘦显高保暖铅笔长裤时尚百搭豹纹', 'https://img.pddpic.com/gaudit-image/2022-10-16/1db23144091189ca733a4b65741460d4.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:49', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (78, 23, 423441709778, 0, '', NULL, '【抖音爆款】马卡龙西装垂垂裤百搭显瘦阔腿裤女夏薄款粉色直筒裤', 'https://img.pddpic.com/gaudit-image/2022-10-17/159c43ae0f01443810f4fb995e3661a6.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:49', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (79, 23, 423486862283, 0, '', NULL, '哈伦老爹牛仔裤女高腰弹力撞色小个子九分直筒遮肉显腿长显瘦学生', 'https://img.pddpic.com/gaudit-image/2022-10-17/72d62fa205cb8dcc0bfea512950bde89.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:49', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (80, 23, 423492956829, 0, 'HN683', NULL, '牛仔裤女阔腿高腰宽松直筒大码拖地复古港风垂坠感显瘦潮便宜甩卖', 'https://img.pddpic.com/gaudit-image/2022-10-17/7b0e9e0aa6ccc4db258f8f3272a352d0.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:49', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (81, 23, 423502402446, 0, 'HN0802', NULL, '牛仔裤女烟管裤梨形身材高腰显瘦九分弹力直筒秋冬款修身百搭休闲', 'https://img.pddpic.com/gaudit-image/2022-10-17/5271991ad2674ff48d43edf9e7efed1e.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:49', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (82, 23, 423703312591, 0, 'JKL333', NULL, '加绒牛仔裤女小脚裤紧身显瘦秋冬款弹力中腰铅笔裤加厚保暖爆款潮', 'https://img.pddpic.com/gaudit-image/2022-10-18/d194906f1b1f52cd52d166a4866ff5ef.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:50', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (83, 23, 423758757026, 0, 'JKL906', NULL, '阔腿牛仔裤女高腰显瘦宽松垂坠感设计感潮流炸街直筒裤韩版梨形', 'https://img.pddpic.com/gaudit-image/2022-10-18/a63bcd8016f12c69daa29d0233fc9880.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:50', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods` VALUES (84, 23, 423990076571, 49, 'JKL9098', NULL, '哈伦老爹牛仔裤女弹力显瘦修身高腰直筒九分小个子萝卜裤梨形身材', 'https://img.pddpic.com/gaudit-image/2022-10-19/12cb7a79e5365c49be8c43dfc7f5e456.jpeg', 0, 1, NULL, 1, '2022-10-20 00:07:50', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_tenant_shop_goods_sku
-- ----------------------------
DROP TABLE IF EXISTS `oms_tenant_shop_goods_sku`;
CREATE TABLE `oms_tenant_shop_goods_sku`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sku_id` bigint NOT NULL COMMENT '平台商品skuid',
  `platform_goods_id` bigint NOT NULL COMMENT '平台商品id',
  `erp_goods_spec_id` bigint NULL DEFAULT NULL COMMENT '供应链商品规格ID',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT '供应链商品ID',
  `sku_code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'sku编码',
  `sku_img` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku图片',
  `goods_spec` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku描述',
  `sku_quantity` bigint NULL DEFAULT NULL COMMENT 'sku数量',
  `outer_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `outer_goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'spu编码',
  `consign_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '分销基准价。代销场景均使用该价格。无SKU商品查看saleInfo中的consignPrice',
  `retail_price` double NULL DEFAULT NULL COMMENT '建议零售价',
  `price` double NULL DEFAULT NULL COMMENT '报价时该规格的单价，国际站注意要点：含有SKU属性的在线批发产品设定具体价格时使用此值，若设置阶梯价格则使用priceRange',
  `amount_onsale` int NULL DEFAULT NULL COMMENT '可销售数量',
  `status` int NULL DEFAULT NULL COMMENT '状态1上架2下架',
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `tenant_id` bigint NOT NULL COMMENT '租户ID（distributor）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1484 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tenant_shop_goods_sku
-- ----------------------------
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1, 1262178610550, 392657083276, 400, 9, 'HN80264001', NULL, '复古蓝 S（80-95斤）', 105, 'HN80264001', '2720218026', NULL, NULL, NULL, NULL, 1, 23, 1, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (2, 1262178610548, 392657083276, 408, 9, 'HN80267504', NULL, '黑灰色 XL（115-125斤）', 20, 'HN80267504', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (3, 1262178610546, 392657083276, 406, 9, 'HN80267502', NULL, '黑灰色 M（95-105斤）', 20, 'HN80267502', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (4, 1262178610552, 392657083276, 402, 9, 'HN80264003', NULL, '复古蓝 L（105-115斤）', 105, 'HN80264003', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (5, 1262178610549, 392657083276, 409, 9, 'HN80267505', NULL, '黑灰色 2XL（125-135斤）', 20, 'HN80267505', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (6, 1236824368730, 392657083276, 30, 9, '2720210080260103', NULL, '黑色 L（105-115斤）', 20, '2720210080260103', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (7, 1262178610554, 392657083276, 404, 9, 'HN80264005', NULL, '复古蓝 2XL（125-135斤）', 115, 'HN80264005', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (8, 1236824368731, 392657083276, 31, 9, '2720210080260104', NULL, '黑色 XL（115-125斤）', 20, '2720210080260104', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (9, 1262178610553, 392657083276, 403, 9, 'HN80264004', NULL, '复古蓝 XL（115-125斤）', 105, 'HN80264004', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (10, 1262178610551, 392657083276, 401, 9, 'HN80264002', NULL, '复古蓝 M（95-105斤）', 105, 'HN80264002', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (11, 1236824368724, 392657083276, 24, 9, '2720210080260002', NULL, '白色 M（95-105斤）', 212, '2720210080260002', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (12, 1236824368737, 392657083276, 37, 9, '2720210080260205', NULL, '宝蓝色 2XL（125-135斤）', 65, '2720210080260205', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (13, 1262178610547, 392657083276, 407, 9, 'HN80267503', NULL, '黑灰色 L（105-115斤）', 20, 'HN80267503', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (14, 1236824368723, 392657083276, 23, 9, '2720210080260001', NULL, '白色 S（80-95斤）', 223, '2720210080260001', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (15, 1236824368742, 392657083276, 42, 9, '2720210080260305', NULL, '浅蓝色 2XL（125-135斤）', 115, '2720210080260305', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (16, 1236824368738, 392657083276, 38, 9, '2720210080260301', NULL, '浅蓝色 S（80-95斤）', 112, '2720210080260301', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (17, 1236824368740, 392657083276, 40, 9, '2720210080260303', NULL, '浅蓝色 L（105-115斤）', 96, '2720210080260303', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (18, 1236824368741, 392657083276, 41, 9, '2720210080260304', NULL, '浅蓝色 XL（115-125斤）', 122, '2720210080260304', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (19, 1236824368726, 392657083276, 26, 9, '2720210080260004', NULL, '白色 XL（115-125斤）', 204, '2720210080260004', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (20, 1236824368725, 392657083276, 25, 9, '2720210080260003', NULL, '白色 L（105-115斤）', 193, '2720210080260003', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (21, 1262178610545, 392657083276, 405, 9, 'HN80267501', NULL, '黑灰色 S（80-95斤）', 20, 'HN80267501', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (22, 1236824368735, 392657083276, 35, 9, '2720210080260203', NULL, '宝蓝色 L（105-115斤）', 70, '2720210080260203', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (23, 1236824368736, 392657083276, 36, 9, '2720210080260204', NULL, '宝蓝色 XL（115-125斤）', 71, '2720210080260204', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (24, 1236824368734, 392657083276, 34, 9, '2720210080260202', NULL, '宝蓝色 M（95-105斤）', 83, '2720210080260202', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (25, 1236824368732, 392657083276, 32, 9, '2720210080260105', NULL, '黑色 2XL（125-135斤）', 20, '2720210080260105', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (26, 1236824368727, 392657083276, 27, 9, '2720210080260005', NULL, '白色 2XL（125-135斤）', 218, '2720210080260005', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (27, 1236824368739, 392657083276, 39, 9, '2720210080260302', NULL, '浅蓝色 M（95-105斤）', 93, '2720210080260302', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (28, 1236824368729, 392657083276, 29, 9, '2720210080260102', NULL, '黑色 M（95-105斤）', 20, '2720210080260102', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (29, 1236824368728, 392657083276, 28, 9, '2720210080260101', NULL, '黑色 S（80-95斤）', 20, '2720210080260101', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (30, 1236824368733, 392657083276, 33, 9, '2720210080260201', NULL, '宝蓝色 S（80-95斤）', 98, '2720210080260201', '2720218026', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (31, 1249158140742, 393216514010, 59, 11, '27202206080102', NULL, '白色 M', 69, '27202206080102', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (32, 1249158140748, 393216514010, 70, 11, '27202206080303', NULL, '黑灰色 L', 10, '27202206080303', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (33, 1249158140744, 393216514010, 61, 11, '27202206080104', NULL, '白色 XL', 70, '27202206080104', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (34, 1249158140749, 393216514010, 71, 11, '27202206080304', NULL, '黑灰色 XL', 10, '27202206080304', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (35, 1249158140747, 393216514010, 69, 11, '27202206080302', NULL, '黑灰色 M', 10, '27202206080302', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (36, 1238187231207, 393216514010, 63, 11, '27202206080201', NULL, '黑色 S', 10, '27202206080201', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (37, 1238189648989, 393216514010, 75, 11, '27202206080403', NULL, '浅蓝色 L', 175, '27202206080403', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (38, 1238187231209, 393216514010, 65, 11, '27202206080203', NULL, '黑色 L', 9, '27202206080203', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (39, 1238189648988, 393216514010, 74, 11, '27202206080402', NULL, '浅蓝色 M', 178, '27202206080402', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (40, 1249158140738, 393216514010, 80, 11, '27202206080503', NULL, '深蓝色 L', 67, '27202206080503', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (41, 1238187231211, 393216514010, 67, 11, '27202206080205', NULL, '黑色 2XL', 9, '27202206080205', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (42, 1238187231208, 393216514010, 64, 11, '27202206080202', NULL, '黑色 M', 10, '27202206080202', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (43, 1249158140737, 393216514010, 79, 11, '27202206080502', NULL, '深蓝色 M', 66, '27202206080502', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (44, 1238189648991, 393216514010, 77, 11, '27202206080405', NULL, '浅蓝色 2XL', 178, '27202206080405', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (45, 1249158140739, 393216514010, 81, 11, '27202206080504', NULL, '深蓝色 XL', 68, '27202206080504', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (46, 1249158140741, 393216514010, 58, 11, '27202206080101', NULL, '白色 S', 70, '27202206080101', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (47, 1249158140745, 393216514010, 62, 11, '27202206080105', NULL, '白色 2XL', 68, '27202206080105', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (48, 1238189648987, 393216514010, 73, 11, '27202206080401', NULL, '浅蓝色 S', 175, '27202206080401', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (49, 1249158140746, 393216514010, 68, 11, '27202206080301', NULL, '黑灰色 S', 10, '27202206080301', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (50, 1249158140750, 393216514010, 72, 11, '27202206080305', NULL, '黑灰色 2XL', 10, '27202206080305', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (51, 1249158140736, 393216514010, 78, 11, '27202206080501', NULL, '深蓝色 S', 66, '27202206080501', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (52, 1238187231210, 393216514010, 66, 11, '27202206080204', NULL, '黑色 XL', 10, '27202206080204', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (53, 1238189648990, 393216514010, 76, 11, '27202206080404', NULL, '浅蓝色 XL', 178, '27202206080404', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (54, 1249158140740, 393216514010, 82, 11, '27202206080505', NULL, '深蓝色 2XL', 69, '27202206080505', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (55, 1249158140743, 393216514010, 60, 11, '27202206080103', NULL, '白色 L', 69, '27202206080103', '2720220608', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (56, 1239269861271, 393654097571, 85, 12, '27202202700103', NULL, '黑色 L', 39, '27202202700103', 'HN270', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (57, 1239269861273, 393654097571, 87, 12, '27202202700105', NULL, '黑色 2XL', 49, '27202202700105', 'HN270', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (58, 1239269861269, 393654097571, 83, 12, '27202202700101', NULL, '黑色 S', 44, '27202202700101', 'HN270', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (59, 1239269861270, 393654097571, 84, 12, '27202202700102', NULL, '黑色 M', 35, '27202202700102', 'HN270', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (60, 1239269861272, 393654097571, 86, 12, '27202202700104', NULL, '黑色 XL', 47, '27202202700104', 'HN270', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (61, 1239283006661, 393659007414, 51, 10, '27202208580204', NULL, '深灰色 XL', 134, '27202208580204', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (62, 1239283006672, 393659007414, 57, 10, '27202208580305', NULL, '浅蓝色 2XL', 135, '27202208580305', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (63, 1239283006666, 393659007414, 46, 10, '27202208580104', NULL, '黑色 XL', 128, '27202208580104', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (64, 1239283006660, 393659007414, 50, 10, '27202208580203', NULL, '深灰色 L', 123, '27202208580203', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (65, 1239283006662, 393659007414, 52, 10, '27202208580205', NULL, '深灰色 2XL', 134, '27202208580205', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (66, 1239283006670, 393659007414, 55, 10, '27202208580303', NULL, '浅蓝色 L', 120, '27202208580303', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (67, 1239283006659, 393659007414, 49, 10, '27202208580202', NULL, '深灰色 M', 106, '27202208580202', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (68, 1239283006668, 393659007414, 53, 10, '27202208580301', NULL, '浅蓝色 S', 102, '27202208580301', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (69, 1239283006669, 393659007414, 54, 10, '27202208580302', NULL, '浅蓝色 M', 115, '27202208580302', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (70, 1239283006664, 393659007414, 44, 10, '27202208580102', NULL, '黑色 M', 123, '27202208580102', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (71, 1239283006665, 393659007414, 45, 10, '27202208580103', NULL, '黑色 L', 106, '27202208580103', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (72, 1239283006658, 393659007414, 48, 10, '27202208580201', NULL, '深灰色 S', 112, '27202208580201', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (73, 1239283006667, 393659007414, 47, 10, '27202208580105', NULL, '黑色 2XL', 138, '27202208580105', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (74, 1239283006671, 393659007414, 56, 10, '27202208580304', NULL, '浅蓝色 XL', 126, '27202208580304', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (75, 1239283006663, 393659007414, 43, 10, '27202208580101', NULL, '黑色 S', 110, '27202208580101', '2720220858', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (76, 1241979453566, 394814708558, 102, 13, '28202206810305', NULL, '黑灰色 2XL', 1000, '28202206810305', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (77, 1241979453562, 394814708558, 98, 13, '28202206810301', NULL, '黑灰色 S', 1000, '28202206810301', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (78, 1241979453565, 394814708558, 101, 13, '28202206810304', NULL, '黑灰色 XL', 999, '28202206810304', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (79, 1241979453552, 394814708558, 88, 13, '28202206810101', NULL, '复古蓝 S', 987, '28202206810101', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (80, 1241979453561, 394814708558, 97, 13, '28202206810205', NULL, '浅蓝色 2XL', 1000, '28202206810205', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (81, 1241979453557, 394814708558, 93, 13, '28202206810201', NULL, '浅蓝色 S', 999, '28202206810201', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (82, 1241979453564, 394814708558, 100, 13, '28202206810303', NULL, '黑灰色 L', 999, '28202206810303', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (83, 1241979453555, 394814708558, 91, 13, '28202206810104', NULL, '复古蓝 XL', 989, '28202206810104', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (84, 1241979453560, 394814708558, 96, 13, '28202206810204', NULL, '浅蓝色 XL', 999, '28202206810204', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (85, 1241979453559, 394814708558, 95, 13, '28202206810203', NULL, '浅蓝色 L', 1000, '28202206810203', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (86, 1241979453553, 394814708558, 89, 13, '28202206810102', NULL, '复古蓝 M', 985, '28202206810102', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (87, 1241979453556, 394814708558, 92, 13, '28202206810105', NULL, '复古蓝 2XL', 994, '28202206810105', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (88, 1241979453563, 394814708558, 99, 13, '28202206810302', NULL, '黑灰色 M', 997, '28202206810302', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (89, 1241979453554, 394814708558, 90, 13, '28202206810103', NULL, '复古蓝 L', 997, '28202206810103', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (90, 1241979453558, 394814708558, 94, 13, '28202206810202', NULL, '浅蓝色 M', 999, '28202206810202', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (91, 1243466497221, 395429166799, 121, 15, '28202106610104', NULL, '复古蓝 XL（30码115-125斤）', 317, '28202106610104', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (92, 1243466497220, 395429166799, 120, 15, '28202106610103', NULL, '复古蓝 L（29码105-115斤）', 351, '28202106610103', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (93, 1243466497222, 395429166799, 122, 15, '28202106610105', NULL, '复古蓝 2XL（31码125-135斤）', 731, '28202106610105', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (94, 1243466497229, 395429166799, 129, 15, '28202106610302', NULL, '黑灰色 M（27-28码95-105斤）', 952, '28202106610302', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (95, 1243466497228, 395429166799, 128, 15, '28202106610301', NULL, '黑灰色 S（25-26码95斤以内）', 965, '28202106610301', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (96, 1243466497226, 395429166799, 126, 15, '28202106610204', NULL, '浅蓝色 XL（30码115-125斤）', 941, '28202106610204', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (97, 1243466497218, 395429166799, 118, 15, '28202106610101', NULL, '复古蓝 S（25-26码95斤以内）', 279, '28202106610101', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (98, 1243466497224, 395429166799, 124, 15, '28202106610202', NULL, '浅蓝色 M（27-28码95-105斤）', 920, '28202106610202', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (99, 1243466497230, 395429166799, 130, 15, '28202106610303', NULL, '黑灰色 L（29码105-115斤）', 951, '28202106610303', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (100, 1243466497232, 395429166799, 132, 15, '28202106610305', NULL, '黑灰色 2XL（31码125-135斤）', 961, '28202106610305', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (101, 1243466497225, 395429166799, 125, 15, '28202106610203', NULL, '浅蓝色 L（29码105-115斤）', 911, '28202106610203', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (102, 1243466497231, 395429166799, 131, 15, '28202106610304', NULL, '黑灰色 XL（30码115-125斤）', 973, '28202106610304', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (103, 1243466497227, 395429166799, 127, 15, '28202106610205', NULL, '浅蓝色 2XL（31码125-135斤）', 954, '28202106610205', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (104, 1243466497219, 395429166799, 119, 15, '28202106610102', NULL, '复古蓝 M（27-28码95-105斤）', 430, '28202106610102', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (105, 1243466497223, 395429166799, 123, 15, '28202106610201', NULL, '浅蓝色 S（25-26码95斤以内）', 941, '28202106610201', 'HN0661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (106, 1262362978280, 395930868595, 112, 14, '27202207080205', NULL, '黑色 2XL', 10, '27202207080205', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (107, 1244694390444, 395930868595, 103, 14, '27202207080101', NULL, '灰色 S', 104, '27202207080101', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (108, 1262362978278, 395930868595, 110, 14, '27202207080203', NULL, '黑色 L', 10, '27202207080203', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (109, 1244694390446, 395930868595, 105, 14, '27202207080103', NULL, '灰色 L', 84, '27202207080103', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (110, 1262362978277, 395930868595, 109, 14, '27202207080202', NULL, '黑色 M', 9, '27202207080202', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (111, 1244694390445, 395930868595, 104, 14, '27202207080102', NULL, '灰色 M', 90, '27202207080102', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (112, 1244694390447, 395930868595, 106, 14, '27202207080104', NULL, '灰色 XL', 99, '27202207080104', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (113, 1244694390448, 395930868595, 107, 14, '27202207080105', NULL, '灰色 2XL', 101, '27202207080105', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (114, 1262362978276, 395930868595, 108, 14, '27202207080201', NULL, '黑色 S', 10, '27202207080201', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (115, 1262362978279, 395930868595, 111, 14, '27202207080204', NULL, '黑色 XL', 10, '27202207080204', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (116, 1262362978285, 395930868595, 117, 14, '27202207080305', NULL, '浅蓝色 2XL', 8, '27202207080305', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (117, 1262362978284, 395930868595, 116, 14, '27202207080304', NULL, '浅蓝色 XL', 10, '27202207080304', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (118, 1262362978282, 395930868595, 114, 14, '27202207080302', NULL, '浅蓝色 M', 10, '27202207080302', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (119, 1262362978281, 395930868595, 113, 14, '27202207080301', NULL, '浅蓝色 S', 10, '27202207080301', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (120, 1262362978283, 395930868595, 115, 14, '27202207080303', NULL, '浅蓝色 L', 9, '27202207080303', 'HN0708', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (121, 1249444023929, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '浅蓝色 XS', 995, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (122, 1249444023917, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '黑色 XS', 994, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (123, 1249444023919, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '黑色 M', 976, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (124, 1249444023922, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '黑色 2XL', 981, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (125, 1249444023920, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '黑色 L', 979, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (126, 1249444023921, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '黑色 XL', 985, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (127, 1249444023931, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '浅蓝色 M', 882, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (128, 1249444023918, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '黑色 S', 987, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (129, 1249444023933, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '浅蓝色 XL', 910, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (130, 1249444023926, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '复古蓝 L', 881, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (131, 1249444023934, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '浅蓝色 2XL', 915, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (132, 1249444023925, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '复古蓝 M', 840, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (133, 1249444023930, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '浅蓝色 S', 885, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (134, 1249444023924, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '复古蓝 S', 915, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (135, 1249444023923, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '复古蓝 XS', 990, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (136, 1249444023927, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '复古蓝 XL', 907, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (137, 1249444023932, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '浅蓝色 L', 891, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (138, 1249444023928, 398085327353, 0, 0, 'yfz-tb-650212367541', NULL, '复古蓝 2XL', 907, 'yfz-tb-650212367541', 'yfz-tb-650212367541', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (139, 1250808763993, 398667645632, 0, 0, '2720220270', NULL, '黑色 XL', 94, '2720220270', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (140, 1250808225395, 398667645632, 0, 0, '2720220270', NULL, '黑色 S', 187, '2720220270', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (141, 1250808225397, 398667645632, 0, 0, '2720220270', NULL, '黑色 L', 190, '2720220270', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (142, 1250808763994, 398667645632, 0, 0, '2720220270', NULL, '黑色 2XL', 98, '2720220270', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (143, 1250808225396, 398667645632, 0, 0, '2720220270', NULL, '黑色 M', 177, '2720220270', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (144, 1264138569397, 401654801488, 0, 0, 'HN0025', NULL, '藏青色 26', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (145, 1264138569387, 401654801488, 0, 0, 'HN0025', NULL, '灰色 32', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (146, 1264138569394, 401654801488, 0, 0, 'HN0025', NULL, '浅蓝色 31', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (147, 1264138569403, 401654801488, 0, 0, 'HN0025', NULL, '藏青色 32', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (148, 1264138569399, 401654801488, 0, 0, 'HN0025', NULL, '藏青色 28', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (149, 1264138569389, 401654801488, 0, 0, 'HN0025', NULL, '浅蓝色 26', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (150, 1264138569391, 401654801488, 0, 0, 'HN0025', NULL, '浅蓝色 28', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (151, 1264138569388, 401654801488, 0, 0, 'HN0025', NULL, '浅蓝色 25', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (152, 1264138569374, 401654801488, 0, 0, 'HN0025', NULL, '黑色 27', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (153, 1264138569375, 401654801488, 0, 0, 'HN0025', NULL, '黑色 28', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (154, 1264138569393, 401654801488, 0, 0, 'HN0025', NULL, '浅蓝色 30', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (155, 1264138569384, 401654801488, 0, 0, 'HN0025', NULL, '灰色 29', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (156, 1264138569386, 401654801488, 0, 0, 'HN0025', NULL, '灰色 31', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (157, 1264138569390, 401654801488, 0, 0, 'HN0025', NULL, '浅蓝色 27', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (158, 1264138569401, 401654801488, 0, 0, 'HN0025', NULL, '藏青色 30', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (159, 1264138569372, 401654801488, 0, 0, 'HN0025', NULL, '黑色 25', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (160, 1264138569392, 401654801488, 0, 0, 'HN0025', NULL, '浅蓝色 29', 9, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (161, 1264138569377, 401654801488, 0, 0, 'HN0025', NULL, '黑色 30', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (162, 1264138569382, 401654801488, 0, 0, 'HN0025', NULL, '灰色 27', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (163, 1264138569378, 401654801488, 0, 0, 'HN0025', NULL, '黑色 31', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (164, 1264138569381, 401654801488, 0, 0, 'HN0025', NULL, '灰色 26', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (165, 1264138569373, 401654801488, 0, 0, 'HN0025', NULL, '黑色 26', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (166, 1264138569385, 401654801488, 0, 0, 'HN0025', NULL, '灰色 30', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (167, 1264138569402, 401654801488, 0, 0, 'HN0025', NULL, '藏青色 31', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (168, 1264138569398, 401654801488, 0, 0, 'HN0025', NULL, '藏青色 27', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (169, 1264138569379, 401654801488, 0, 0, 'HN0025', NULL, '黑色 32', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (170, 1264138569395, 401654801488, 0, 0, 'HN0025', NULL, '浅蓝色 32', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (171, 1264138569396, 401654801488, 0, 0, 'HN0025', NULL, '藏青色 25', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (172, 1264138569380, 401654801488, 0, 0, 'HN0025', NULL, '灰色 25', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (173, 1264138569383, 401654801488, 0, 0, 'HN0025', NULL, '灰色 28', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (174, 1264138569400, 401654801488, 0, 0, 'HN0025', NULL, '藏青色 29', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (175, 1264138569376, 401654801488, 0, 0, 'HN0025', NULL, '黑色 29', 10, 'HN0025', 'HN0025', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (176, 1257978437365, 401781697078, 159, 16, '28202106780002', NULL, '浅蓝 M', 1802, '28202106780002', '2820210678', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (177, 1257978437367, 401781697078, 161, 16, '28202106780004', NULL, '浅蓝 XL', 1855, '28202106780004', '2820210678', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (178, 1257978437366, 401781697078, 160, 16, '28202106780003', NULL, '浅蓝 L', 1815, '28202106780003', '2820210678', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (179, 1257978437364, 401781697078, 158, 16, '28202106780001', NULL, '浅蓝 S', 1826, '28202106780001', '2820210678', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (180, 1257978437368, 401781697078, 162, 16, '28202106780005', NULL, '浅蓝 2XL', 1866, '28202106780005', '2820210678', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (181, 1257978913179, 401781826934, 192, 18, 'HN202200140304', NULL, '浅蓝色 XL', 987, 'HN202200140304', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (182, 1257978913180, 401781826934, 193, 18, 'HN202200140305', NULL, '浅蓝色 2XL', 995, 'HN202200140305', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (183, 1257978913169, 401781826934, 182, 18, 'HN202200140104', NULL, '黑色 XL', 967, 'HN202200140104', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (184, 1257978913176, 401781826934, 189, 18, 'HN202200140301', NULL, '浅蓝色 S', 980, 'HN202200140301', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (185, 1257978913167, 401781826934, 180, 18, 'HN202200140102', NULL, '黑色 M', 903, 'HN202200140102', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (186, 1257978913173, 401781826934, 186, 18, 'HN202200140203', NULL, '复古蓝 L', 966, 'HN202200140203', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (187, 1257978913168, 401781826934, 181, 18, 'HN202200140103', NULL, '黑色 L', 952, 'HN202200140103', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (188, 1257978913166, 401781826934, 179, 18, 'HN202200140101', NULL, '黑色 S', 760, 'HN202200140101', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (189, 1257978913174, 401781826934, 187, 18, 'HN202200140204', NULL, '复古蓝 XL', 979, 'HN202200140204', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (190, 1257978913170, 401781826934, 183, 18, 'HN202200140105', NULL, '黑色 2XL', 979, 'HN202200140105', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (191, 1257978913178, 401781826934, 191, 18, 'HN202200140303', NULL, '浅蓝色 L', 987, 'HN202200140303', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (192, 1257978913175, 401781826934, 188, 18, 'HN202200140205', NULL, '复古蓝 2XL', 990, 'HN202200140205', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (193, 1257978913172, 401781826934, 185, 18, 'HN202200140202', NULL, '复古蓝 M', 958, 'HN202200140202', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (194, 1257978913177, 401781826934, 190, 18, 'HN202200140302', NULL, '浅蓝色 M', 978, 'HN202200140302', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (195, 1257978913171, 401781826934, 184, 18, 'HN202200140201', NULL, '复古蓝 S', 967, 'HN202200140201', 'HN0014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (196, 1258473180987, 401993680807, 0, 0, '', NULL, '背带裤+纯棉白T S', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (197, 1258473180985, 401993680807, 0, 0, '', NULL, '单件背带裤 L', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (198, 1258473180989, 401993680807, 0, 0, '', NULL, '背带裤+纯棉白T L', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (199, 1258473180983, 401993680807, 0, 0, '', NULL, '单件背带裤 S', 99, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (200, 1258473180986, 401993680807, 0, 0, '', NULL, '单件背带裤 XL', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (201, 1258473180984, 401993680807, 0, 0, '', NULL, '单件背带裤 M', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (202, 1258473180988, 401993680807, 0, 0, '', NULL, '背带裤+纯棉白T M', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (203, 1258473180990, 401993680807, 0, 0, '', NULL, '背带裤+纯棉白T XL', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (204, 1261841872282, 403434723538, 336, 24, 'HN202200120105', NULL, '深蓝色 2XL', 45, 'HN202200120105', 'HN0012', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (205, 1261841872279, 403434723538, 333, 24, 'HN202200120102', NULL, '深蓝色 M', 32, 'HN202200120102', 'HN0012', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (206, 1261841872278, 403434723538, 332, 24, 'HN202200120101', NULL, '深蓝色 S', 37, 'HN202200120101', 'HN0012', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (207, 1261841872281, 403434723538, 335, 24, 'HN202200120104', NULL, '深蓝色 XL', 45, 'HN202200120104', 'HN0012', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (208, 1261841872280, 403434723538, 334, 24, 'HN202200120103', NULL, '深蓝色 L', 44, 'HN202200120103', 'HN0012', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (209, 1261849774936, 403438406420, 0, 0, '', NULL, '蓝色 XL', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (210, 1261851471320, 403438406420, 0, 0, '', NULL, '蓝色 2XL', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (211, 1261849774929, 403438406420, 0, 0, '', NULL, '黑色 S', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (212, 1261849774933, 403438406420, 0, 0, '', NULL, '蓝色 S', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (213, 1261849774935, 403438406420, 0, 0, '', NULL, '蓝色 L', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (214, 1261849774932, 403438406420, 0, 0, '', NULL, '黑色 XL', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (215, 1261849774934, 403438406420, 0, 0, '', NULL, '蓝色 M', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (216, 1261849774930, 403438406420, 0, 0, '', NULL, '黑色 M', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (217, 1261851471319, 403438406420, 0, 0, '', NULL, '黑色 2XL', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (218, 1261849774931, 403438406420, 0, 0, '', NULL, '黑色 L', 20, '', 'HN0010', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (219, 1262268996969, 403654853255, 0, 0, 'HN015', NULL, '黑色 2XL', 1001, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (220, 1294385941600, 403654853255, 0, 0, 'HN015', NULL, '复古蓝 2XL', 20, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (221, 1262268996965, 403654853255, 0, 0, 'HN015', NULL, '黑色 S', 1006, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (222, 1262268996980, 403654853255, 0, 0, 'HN015', NULL, '浅蓝色 XL', 930, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (223, 1262268996964, 403654853255, 0, 0, 'HN015', NULL, '黑色 XS', 1014, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (224, 1262268996981, 403654853255, 0, 0, 'HN015', NULL, '浅蓝色 2XL', 935, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (225, 1294385941597, 403654853255, 0, 0, 'HN015', NULL, '复古蓝 M', 20, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (226, 1294385941595, 403654853255, 0, 0, 'HN015', NULL, '复古蓝 XS', 20, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (227, 1294385941599, 403654853255, 0, 0, 'HN015', NULL, '复古蓝 XL', 20, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (228, 1262268996979, 403654853255, 0, 0, 'HN015', NULL, '浅蓝色 L', 869, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (229, 1262268996967, 403654853255, 0, 0, 'HN015', NULL, '黑色 L', 996, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (230, 1262268996978, 403654853255, 0, 0, 'HN015', NULL, '浅蓝色 M', 869, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (231, 1262268996977, 403654853255, 0, 0, 'HN015', NULL, '浅蓝色 S', 872, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (232, 1262268996966, 403654853255, 0, 0, 'HN015', NULL, '黑色 M', 993, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (233, 1262268996976, 403654853255, 0, 0, 'HN015', NULL, '浅蓝色 XS', 1015, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (234, 1262268996968, 403654853255, 0, 0, 'HN015', NULL, '黑色 XL', 1005, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (235, 1294385941596, 403654853255, 0, 0, 'HN015', NULL, '复古蓝 S', 20, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (236, 1294385941598, 403654853255, 0, 0, 'HN015', NULL, '复古蓝 L', 20, 'HN015', 'HN015', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (237, 1262776022851, 403877249755, 0, 0, 'HN0016', NULL, '浅蓝色 M', 20, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (238, 1262776022853, 403877249755, 0, 0, 'HN0016', NULL, '浅蓝色 XL', 20, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (239, 1262776022852, 403877249755, 0, 0, 'HN0016', NULL, '浅蓝色 L', 20, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (240, 1262666161431, 403877249755, 0, 0, 'HN0016', NULL, '黑色 M', 1015, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (241, 1262666161432, 403877249755, 0, 0, 'HN0016', NULL, '黑色 L', 1018, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (242, 1262776022850, 403877249755, 0, 0, 'HN0016', NULL, '浅蓝色 S', 20, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (243, 1262666161430, 403877249755, 0, 0, 'HN0016', NULL, '黑色 S', 1016, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (244, 1262666161429, 403877249755, 0, 0, 'HN0016', NULL, '黑色 XS', 1017, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (245, 1262776022849, 403877249755, 0, 0, 'HN0016', NULL, '浅蓝色 XS', 20, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (246, 1262666161433, 403877249755, 0, 0, 'HN0016', NULL, '黑色 XL', 1017, 'HN0016', 'yfz-tb-670085078625', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (247, 1262852160966, 403877355587, 0, 0, 'HN0020', NULL, '石板灰 25', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (248, 1262666388065, 403877355587, 0, 0, 'HN0020', NULL, '浅蓝色 31', 508, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (249, 1262666388053, 403877355587, 0, 0, 'HN0020', NULL, '黑色 27', 434, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (250, 1262666388056, 403877355587, 0, 0, 'HN0020', NULL, '黑色 30', 462, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (251, 1262852160973, 403877355587, 0, 0, 'HN0020', NULL, '石板灰 32', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (252, 1262666388059, 403877355587, 0, 0, 'HN0020', NULL, '浅蓝色 25', 507, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (253, 1262852160960, 403877355587, 0, 0, 'HN0020', NULL, '深灰色 27', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (254, 1262852160972, 403877355587, 0, 0, 'HN0020', NULL, '石板灰 31', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (255, 1262666388052, 403877355587, 0, 0, 'HN0020', NULL, '黑色 26', 461, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (256, 1262666388055, 403877355587, 0, 0, 'HN0020', NULL, '黑色 29', 444, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (257, 1262666388060, 403877355587, 0, 0, 'HN0020', NULL, '浅蓝色 26', 461, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (258, 1262852160959, 403877355587, 0, 0, 'HN0020', NULL, '深灰色 26', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (259, 1262852160964, 403877355587, 0, 0, 'HN0020', NULL, '深灰色 31', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (260, 1262666388066, 403877355587, 0, 0, 'HN0020', NULL, '浅蓝色 32', 507, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (261, 1262666388054, 403877355587, 0, 0, 'HN0020', NULL, '黑色 28', 423, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (262, 1262852160958, 403877355587, 0, 0, 'HN0020', NULL, '深灰色 25', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (263, 1262852160967, 403877355587, 0, 0, 'HN0020', NULL, '石板灰 26', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (264, 1262666388062, 403877355587, 0, 0, 'HN0020', NULL, '浅蓝色 28', 468, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (265, 1262852160961, 403877355587, 0, 0, 'HN0020', NULL, '深灰色 28', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (266, 1262666388058, 403877355587, 0, 0, 'HN0020', NULL, '黑色 32', 480, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (267, 1262852160963, 403877355587, 0, 0, 'HN0020', NULL, '深灰色 30', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (268, 1262852160965, 403877355587, 0, 0, 'HN0020', NULL, '深灰色 32', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (269, 1262852160970, 403877355587, 0, 0, 'HN0020', NULL, '石板灰 29', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (270, 1262852160969, 403877355587, 0, 0, 'HN0020', NULL, '石板灰 28', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (271, 1262666388061, 403877355587, 0, 0, 'HN0020', NULL, '浅蓝色 27', 453, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (272, 1262666388057, 403877355587, 0, 0, 'HN0020', NULL, '黑色 31', 479, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (273, 1262666388051, 403877355587, 0, 0, 'HN0020', NULL, '黑色 25', 415, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (274, 1262852160962, 403877355587, 0, 0, 'HN0020', NULL, '深灰色 29', 18, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (275, 1262852160968, 403877355587, 0, 0, 'HN0020', NULL, '石板灰 27', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (276, 1262666388063, 403877355587, 0, 0, 'HN0020', NULL, '浅蓝色 29', 493, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (277, 1262666388064, 403877355587, 0, 0, 'HN0020', NULL, '浅蓝色 30', 493, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (278, 1262852160971, 403877355587, 0, 0, 'HN0020', NULL, '石板灰 30', 20, 'HN0020', 'yfz-tb-638661096456', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (279, 1262855741579, 403877444479, 0, 0, 'HN0022', NULL, '黑色 25', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (280, 1262855741584, 403877444479, 0, 0, 'HN0022', NULL, '灰色 29', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (281, 1262666558181, 403877444479, 0, 0, 'HN0022', NULL, '黑色 31', 519, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (282, 1262666558178, 403877444479, 0, 0, 'HN0022', NULL, '黑色 28', 518, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (283, 1262855741580, 403877444479, 0, 0, 'HN0022', NULL, '灰色 25', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (284, 1262855741585, 403877444479, 0, 0, 'HN0022', NULL, '灰色 30', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (285, 1262666558176, 403877444479, 0, 0, 'HN0022', NULL, '黑色 26', 520, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (286, 1262666558180, 403877444479, 0, 0, 'HN0022', NULL, '黑色 30', 520, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (287, 1262855741586, 403877444479, 0, 0, 'HN0022', NULL, '灰色 31', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (288, 1262855741581, 403877444479, 0, 0, 'HN0022', NULL, '灰色 26', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (289, 1262666558179, 403877444479, 0, 0, 'HN0022', NULL, '黑色 29', 518, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (290, 1262666558177, 403877444479, 0, 0, 'HN0022', NULL, '黑色 27', 520, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (291, 1262855741587, 403877444479, 0, 0, 'HN0022', NULL, '灰色 32', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (292, 1262855741583, 403877444479, 0, 0, 'HN0022', NULL, '灰色 28', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (293, 1262666558182, 403877444479, 0, 0, 'HN0022', NULL, '黑色 32', 520, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (294, 1262855741582, 403877444479, 0, 0, 'HN0022', NULL, '灰色 27', 20, 'HN0022', 'yfz-tb-639346263403', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (295, 1262666698661, 403877488703, 0, 0, 'HN0023', NULL, '黑色 31', 9987, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (296, 1262742707196, 403877488703, 0, 0, 'HN0023', NULL, '海蓝色 29', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (297, 1262742707198, 403877488703, 0, 0, 'HN0023', NULL, '海蓝色 31', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (298, 1262666698659, 403877488703, 0, 0, 'HN0023', NULL, '黑色 29', 9912, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (299, 1262666698662, 403877488703, 0, 0, 'HN0023', NULL, '黑色 32', 9981, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (300, 1262742707205, 403877488703, 0, 0, 'HN0023', NULL, '深灰色 30', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (301, 1262742707199, 403877488703, 0, 0, 'HN0023', NULL, '海蓝色 32', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (302, 1262742707197, 403877488703, 0, 0, 'HN0023', NULL, '海蓝色 30', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (303, 1262742707208, 403877488703, 0, 0, 'HN0023', NULL, '亮钢蓝 25', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (304, 1262742707212, 403877488703, 0, 0, 'HN0023', NULL, '亮钢蓝 29', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (305, 1262666698655, 403877488703, 0, 0, 'HN0023', NULL, '黑色 25', 9978, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (306, 1262742707209, 403877488703, 0, 0, 'HN0023', NULL, '亮钢蓝 26', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (307, 1262742707211, 403877488703, 0, 0, 'HN0023', NULL, '亮钢蓝 28', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (308, 1262742707210, 403877488703, 0, 0, 'HN0023', NULL, '亮钢蓝 27', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (309, 1262666698656, 403877488703, 0, 0, 'HN0023', NULL, '黑色 26', 9918, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (310, 1262742707193, 403877488703, 0, 0, 'HN0023', NULL, '海蓝色 26', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (311, 1262742707214, 403877488703, 0, 0, 'HN0023', NULL, '亮钢蓝 31', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (312, 1262742707202, 403877488703, 0, 0, 'HN0023', NULL, '深灰色 27', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (313, 1262666698660, 403877488703, 0, 0, 'HN0023', NULL, '黑色 30', 9923, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (314, 1262742707215, 403877488703, 0, 0, 'HN0023', NULL, '亮钢蓝 32', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (315, 1262742707194, 403877488703, 0, 0, 'HN0023', NULL, '海蓝色 27', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (316, 1262742707195, 403877488703, 0, 0, 'HN0023', NULL, '海蓝色 28', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (317, 1262742707203, 403877488703, 0, 0, 'HN0023', NULL, '深灰色 28', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (318, 1262666698658, 403877488703, 0, 0, 'HN0023', NULL, '黑色 28', 9876, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (319, 1262742707201, 403877488703, 0, 0, 'HN0023', NULL, '深灰色 26', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (320, 1262742707192, 403877488703, 0, 0, 'HN0023', NULL, '海蓝色 25', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (321, 1262742707207, 403877488703, 0, 0, 'HN0023', NULL, '深灰色 32', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (322, 1262742707213, 403877488703, 0, 0, 'HN0023', NULL, '亮钢蓝 30', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (323, 1262666698657, 403877488703, 0, 0, 'HN0023', NULL, '黑色 27', 9889, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (324, 1262742707204, 403877488703, 0, 0, 'HN0023', NULL, '深灰色 29', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (325, 1262742707200, 403877488703, 0, 0, 'HN0023', NULL, '深灰色 25', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (326, 1262742707206, 403877488703, 0, 0, 'HN0023', NULL, '深灰色 31', 20, 'HN0023', 'HN023', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (327, 1262666896377, 403877607629, 311, 23, 'HN202200240228', NULL, '黑灰色 28', 1011, 'HN202200240228', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (328, 1262666896370, 403877607629, 319, 23, 'HN202200240328', NULL, '浅蓝色 28', 1011, 'HN202200240328', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (329, 1262666896361, 403877607629, 301, 23, 'HN202200240126', NULL, '黑色 26', 1018, 'HN202200240126', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (330, 1262666896386, 403877607629, 329, 23, 'HN202200240430', NULL, '蓝灰色 30', 1013, 'HN202200240430', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (331, 1262666896374, 403877607629, 323, 23, 'HN202200240332', NULL, '浅蓝色 32', 1015, 'HN202200240332', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (332, 1262666896378, 403877607629, 312, 23, 'HN202200240229', NULL, '黑灰色 29', 1020, 'HN202200240229', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (333, 1262666896365, 403877607629, 305, 23, 'HN202200240130', NULL, '黑色 30', 1019, 'HN202200240130', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (334, 1262666896385, 403877607629, 328, 23, 'HN202200240429', NULL, '蓝灰色 29', 1018, 'HN202200240429', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (335, 1262666896381, 403877607629, 315, 23, 'HN202200240232', NULL, '黑灰色 32', 1019, 'HN202200240232', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (336, 1262666896368, 403877607629, 317, 23, 'HN202200240326', NULL, '浅蓝色 26', 1015, 'HN202200240326', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (337, 1262666896373, 403877607629, 322, 23, 'HN202200240331', NULL, '浅蓝色 31', 1017, 'HN202200240331', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (338, 1262666896383, 403877607629, 326, 23, 'HN202200240427', NULL, '蓝灰色 27', 1017, 'HN202200240427', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (339, 1262666896367, 403877607629, 307, 23, 'HN202200240132', NULL, '黑色 32', 1019, 'HN202200240132', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (340, 1262666896387, 403877607629, 330, 23, 'HN202200240431', NULL, '蓝灰色 31', 1018, 'HN202200240431', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (341, 1262666896388, 403877607629, 331, 23, 'HN202200240432', NULL, '蓝灰色 32', 1015, 'HN202200240432', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (342, 1262666896380, 403877607629, 314, 23, 'HN202200240231', NULL, '黑灰色 31', 1020, 'HN202200240231', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (343, 1262666896364, 403877607629, 304, 23, 'HN202200240129', NULL, '黑色 29', 1018, 'HN202200240129', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (344, 1262666896372, 403877607629, 321, 23, 'HN202200240330', NULL, '浅蓝色 30', 1010, 'HN202200240330', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (345, 1262666896363, 403877607629, 303, 23, 'HN202200240128', NULL, '黑色 28', 1018, 'HN202200240128', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (346, 1262666896371, 403877607629, 320, 23, 'HN202200240329', NULL, '浅蓝色 29', 1016, 'HN202200240329', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (347, 1262666896382, 403877607629, 325, 23, 'HN202200240426', NULL, '蓝灰色 26', 1016, 'HN202200240426', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (348, 1262666896366, 403877607629, 306, 23, 'HN202200240131', NULL, '黑色 31', 1019, 'HN202200240131', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (349, 1262666896362, 403877607629, 302, 23, 'HN202200240127', NULL, '黑色 27', 1019, 'HN202200240127', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (350, 1262666896376, 403877607629, 310, 23, 'HN202200240227', NULL, '黑灰色 27', 1015, 'HN202200240227', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (351, 1262666896369, 403877607629, 318, 23, 'HN202200240327', NULL, '浅蓝色 27', 1012, 'HN202200240327', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (352, 1262666896375, 403877607629, 309, 23, 'HN202200240226', NULL, '黑灰色 26', 1015, 'HN202200240226', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (353, 1262666896384, 403877607629, 327, 23, 'HN202200240428', NULL, '蓝灰色 28', 1014, 'HN202200240428', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (354, 1262666896379, 403877607629, 313, 23, 'HN202200240230', NULL, '黑灰色 30', 1020, 'HN202200240230', 'HN20220024', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (355, 1262667109644, 403877716388, 0, 0, 'HN0029', NULL, '黑色 28', 1020, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (356, 1262667109643, 403877716388, 0, 0, 'HN0029', NULL, '黑色 27', 1020, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (357, 1262783777281, 403877716388, 0, 0, 'HN0029', NULL, '蓝色 31', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (358, 1262783777288, 403877716388, 0, 0, 'HN0029', NULL, '深灰色 30', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (359, 1262667109647, 403877716388, 0, 0, 'HN0029', NULL, '黑色 31', 1019, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (360, 1262783777276, 403877716388, 0, 0, 'HN0029', NULL, '蓝色 26', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (361, 1262783777289, 403877716388, 0, 0, 'HN0029', NULL, '深灰色 31', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (362, 1262783777282, 403877716388, 0, 0, 'HN0029', NULL, '蓝色 32', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (363, 1262783777290, 403877716388, 0, 0, 'HN0029', NULL, '深灰色 32', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (364, 1262783777286, 403877716388, 0, 0, 'HN0029', NULL, '深灰色 28', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (365, 1262783777279, 403877716388, 0, 0, 'HN0029', NULL, '蓝色 29', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (366, 1262783777283, 403877716388, 0, 0, 'HN0029', NULL, '深灰色 25', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (367, 1262667109648, 403877716388, 0, 0, 'HN0029', NULL, '黑色 32', 1020, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (368, 1262667109645, 403877716388, 0, 0, 'HN0029', NULL, '黑色 29', 1020, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (369, 1262783777277, 403877716388, 0, 0, 'HN0029', NULL, '蓝色 27', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (370, 1262667109646, 403877716388, 0, 0, 'HN0029', NULL, '黑色 30', 1020, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (371, 1262783777285, 403877716388, 0, 0, 'HN0029', NULL, '深灰色 27', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (372, 1262667109641, 403877716388, 0, 0, 'HN0029', NULL, '黑色 25', 1020, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (373, 1262667109642, 403877716388, 0, 0, 'HN0029', NULL, '黑色 26', 1020, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (374, 1262783777287, 403877716388, 0, 0, 'HN0029', NULL, '深灰色 29', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (375, 1262783777275, 403877716388, 0, 0, 'HN0029', NULL, '蓝色 25', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (376, 1262783777280, 403877716388, 0, 0, 'HN0029', NULL, '蓝色 30', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (377, 1262783777278, 403877716388, 0, 0, 'HN0029', NULL, '蓝色 28', 19, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (378, 1262783777284, 403877716388, 0, 0, 'HN0029', NULL, '深灰色 26', 20, 'HN0029', 'HN0029', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (379, 1263497350054, 404300819650, 0, 0, '', NULL, '32 145斤到155斤左右', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (380, 1263497350052, 404300819650, 0, 0, '', NULL, '30 125斤到135斤左右', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (381, 1263497350051, 404300819650, 0, 0, '', NULL, '29 115斤到125斤左右', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (382, 1263497350055, 404300819650, 0, 0, '', NULL, '33 155斤到175斤左右', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (383, 1263497350050, 404300819650, 0, 0, '', NULL, '28 100斤到115斤左右', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (384, 1263497350053, 404300819650, 0, 0, '', NULL, '31 135斤到145斤左右', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (385, 1271533011330, 408225561862, 0, 0, 'KH9688', NULL, '黑灰 28', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (386, 1271533011332, 408225561862, 0, 0, 'KH9688', NULL, '黑灰 30', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (387, 1271533011327, 408225561862, 0, 0, 'KH9688', NULL, '蓝灰 32', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (388, 1271533011334, 408225561862, 0, 0, 'KH9688', NULL, '黑灰 32', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (389, 1271533011331, 408225561862, 0, 0, 'KH9688', NULL, '黑灰 29', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (390, 1271533011321, 408225561862, 0, 0, 'KH9688', NULL, '蓝灰 26', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (391, 1271533011323, 408225561862, 0, 0, 'KH9688', NULL, '蓝灰 28', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (392, 1271533011322, 408225561862, 0, 0, 'KH9688', NULL, '蓝灰 27', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (393, 1271533011326, 408225561862, 0, 0, 'KH9688', NULL, '蓝灰 31', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (394, 1271533011329, 408225561862, 0, 0, 'KH9688', NULL, '黑灰 27', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (395, 1271533011325, 408225561862, 0, 0, 'KH9688', NULL, '蓝灰 30', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (396, 1271533011333, 408225561862, 0, 0, 'KH9688', NULL, '黑灰 31', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (397, 1271533011324, 408225561862, 0, 0, 'KH9688', NULL, '蓝灰 29', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (398, 1271533011328, 408225561862, 0, 0, 'KH9688', NULL, '黑灰 26', 220, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (399, 1274875964281, 409855932902, 0, 0, 'HN0180', NULL, '浅蓝色 XL', 20, 'HN0180', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (400, 1274875964278, 409855932902, 0, 0, 'HN0180', NULL, '浅蓝色 S', 20, 'HN0180', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (401, 1274875964279, 409855932902, 0, 0, 'HN0180', NULL, '浅蓝色 M', 20, 'HN0180', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (402, 1274875964282, 409855932902, 0, 0, 'HN0180', NULL, '浅蓝色 2XL', 20, 'HN0180', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (403, 1274875964280, 409855932902, 0, 0, 'HN0180', NULL, '浅蓝色 L', 20, 'HN0180', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (404, 1274883221799, 409864423309, 553, 37, 'HN1064004', NULL, '蓝色 XL', 69, 'HN1064004', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (405, 1274883221793, 409864423309, 547, 37, 'HN1060103', NULL, '黑色 L', 69, 'HN1060103', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (406, 1274883221792, 409864423309, 546, 37, 'HN1060102', NULL, '黑色 M', 69, 'HN1060102', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (407, 1274883221800, 409864423309, 554, 37, 'HN1064005', NULL, '蓝色 2XL', 70, 'HN1064005', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (408, 1274883221803, 409864423309, 557, 37, 'HN1062903', NULL, '石板灰 L', 70, 'HN1062903', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (409, 1274883221795, 409864423309, 549, 37, 'HN1060105', NULL, '黑色 2XL', 68, 'HN1060105', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (410, 1274883221797, 409864423309, 551, 37, 'HN1064002', NULL, '蓝色 M', 67, 'HN1064002', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (411, 1274883221798, 409864423309, 552, 37, 'HN1064003', NULL, '蓝色 L', 69, 'HN1064003', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (412, 1274883221804, 409864423309, 558, 37, 'HN1062904', NULL, '石板灰 XL', 70, 'HN1062904', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (413, 1274883221791, 409864423309, 545, 37, 'HN1060101', NULL, '黑色 S', 70, 'HN1060101', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (414, 1274883221805, 409864423309, 559, 37, 'HN1062905', NULL, '石板灰 2XL', 70, 'HN1062905', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (415, 1274883221796, 409864423309, 550, 37, 'HN1064001', NULL, '蓝色 S', 68, 'HN1064001', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (416, 1274883221794, 409864423309, 548, 37, 'HN1060104', NULL, '黑色 XL', 70, 'HN1060104', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (417, 1274883221802, 409864423309, 556, 37, 'HN1062902', NULL, '石板灰 M', 69, 'HN1062902', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (418, 1274883221801, 409864423309, 555, 37, 'HN1062901', NULL, '石板灰 S', 69, 'HN1062901', 'HN106', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (419, 1274887667603, 409866847439, 0, 0, 'HN0222', NULL, '浅蓝色 29', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (420, 1274887667608, 409866847439, 0, 0, 'HN0222', NULL, '深蓝色 27', 18, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (421, 1274887667601, 409866847439, 0, 0, 'HN0222', NULL, '浅蓝色 27', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (422, 1274887667610, 409866847439, 0, 0, 'HN0222', NULL, '深蓝色 29', 19, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (423, 1274887667602, 409866847439, 0, 0, 'HN0222', NULL, '浅蓝色 28', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (424, 1274887667604, 409866847439, 0, 0, 'HN0222', NULL, '浅蓝色 30', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (425, 1274887667600, 409866847439, 0, 0, 'HN0222', NULL, '浅蓝色 26', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (426, 1274887667612, 409866847439, 0, 0, 'HN0222', NULL, '深蓝色 31', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (427, 1274887667611, 409866847439, 0, 0, 'HN0222', NULL, '深蓝色 30', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (428, 1274887667606, 409866847439, 0, 0, 'HN0222', NULL, '浅蓝色 32', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (429, 1274887667605, 409866847439, 0, 0, 'HN0222', NULL, '浅蓝色 31', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (430, 1274887667607, 409866847439, 0, 0, 'HN0222', NULL, '深蓝色 26', 18, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (431, 1274887667609, 409866847439, 0, 0, 'HN0222', NULL, '深蓝色 28', 20, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (432, 1274887667613, 409866847439, 0, 0, 'HN0222', NULL, '深蓝色 32', 19, 'HN0222', 'HN222', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (433, 1274915162081, 409879757750, 0, 0, 'HN0620', NULL, '深灰色 M', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (434, 1274915162088, 409879757750, 0, 0, 'HN0620', NULL, '浅蓝色 XL', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (435, 1274915162094, 409879757750, 0, 0, 'HN0620', NULL, '湖蓝色 2XL', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (436, 1274915162085, 409879757750, 0, 0, 'HN0620', NULL, '浅蓝色 S', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (437, 1274915162090, 409879757750, 0, 0, 'HN0620', NULL, '湖蓝色 S', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (438, 1274915162082, 409879757750, 0, 0, 'HN0620', NULL, '深灰色 L', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (439, 1274915162080, 409879757750, 0, 0, 'HN0620', NULL, '深灰色 S', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (440, 1274915162086, 409879757750, 0, 0, 'HN0620', NULL, '浅蓝色 M', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (441, 1274915162091, 409879757750, 0, 0, 'HN0620', NULL, '湖蓝色 M', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (442, 1274915162092, 409879757750, 0, 0, 'HN0620', NULL, '湖蓝色 L', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (443, 1274915162083, 409879757750, 0, 0, 'HN0620', NULL, '深灰色 XL', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (444, 1274915162084, 409879757750, 0, 0, 'HN0620', NULL, '深灰色 2XL', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (445, 1274915162087, 409879757750, 0, 0, 'HN0620', NULL, '浅蓝色 L', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (446, 1274915162089, 409879757750, 0, 0, 'HN0620', NULL, '浅蓝色 2XL', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (447, 1274915162093, 409879757750, 0, 0, 'HN0620', NULL, '湖蓝色 XL', 20, 'HN0620', 'HN620', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (448, 1274920833073, 409883128005, 0, 0, 'HN0621', NULL, '黑色 L', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (449, 1274920833090, 409883128005, 0, 0, 'HN0621', NULL, '浅蓝色 2XL', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (450, 1274920833087, 409883128005, 0, 0, 'HN0621', NULL, '浅蓝色 M', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (451, 1274920833079, 409883128005, 0, 0, 'HN0621', NULL, '深灰色 XL', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (452, 1274920833074, 409883128005, 0, 0, 'HN0621', NULL, '黑色 XL', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (453, 1274920833080, 409883128005, 0, 0, 'HN0621', NULL, '深灰色 2XL', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (454, 1274920833076, 409883128005, 0, 0, 'HN0621', NULL, '深灰色 S', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (455, 1274920833077, 409883128005, 0, 0, 'HN0621', NULL, '深灰色 M', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (456, 1274920833084, 409883128005, 0, 0, 'HN0621', NULL, '藏青色 XL', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (457, 1274920833072, 409883128005, 0, 0, 'HN0621', NULL, '黑色 M', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (458, 1274920833075, 409883128005, 0, 0, 'HN0621', NULL, '黑色 2XL', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (459, 1274920833083, 409883128005, 0, 0, 'HN0621', NULL, '藏青色 L', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (460, 1274920833078, 409883128005, 0, 0, 'HN0621', NULL, '深灰色 L', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (461, 1274920833086, 409883128005, 0, 0, 'HN0621', NULL, '浅蓝色 S', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (462, 1274920833082, 409883128005, 0, 0, 'HN0621', NULL, '藏青色 M', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (463, 1274920833089, 409883128005, 0, 0, 'HN0621', NULL, '浅蓝色 XL', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (464, 1274920833088, 409883128005, 0, 0, 'HN0621', NULL, '浅蓝色 L', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (465, 1274920833081, 409883128005, 0, 0, 'HN0621', NULL, '藏青色 S', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (466, 1274920833071, 409883128005, 0, 0, 'HN0621', NULL, '黑色 S', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (467, 1274920833085, 409883128005, 0, 0, 'HN0621', NULL, '藏青色 2XL', 20, 'HN0621', 'HN621', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (468, 1274926586717, 409885859735, 0, 0, 'HN0630', NULL, '宝蓝色 L', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (469, 1274926586713, 409885859735, 0, 0, 'HN0630', NULL, '深灰色 XL', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (470, 1274926586712, 409885859735, 0, 0, 'HN0630', NULL, '深灰色 L', 19, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (471, 1274926586710, 409885859735, 0, 0, 'HN0630', NULL, '深灰色 S', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (472, 1274926586715, 409885859735, 0, 0, 'HN0630', NULL, '宝蓝色 S', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (473, 1274926586722, 409885859735, 0, 0, 'HN0630', NULL, '浅蓝色 L', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (474, 1274926586714, 409885859735, 0, 0, 'HN0630', NULL, '深灰色 2XL', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (475, 1274926586716, 409885859735, 0, 0, 'HN0630', NULL, '宝蓝色 M', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (476, 1274926586719, 409885859735, 0, 0, 'HN0630', NULL, '宝蓝色 2XL', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (477, 1274926586723, 409885859735, 0, 0, 'HN0630', NULL, '浅蓝色 XL', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (478, 1274926586724, 409885859735, 0, 0, 'HN0630', NULL, '浅蓝色 2XL', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (479, 1274926586711, 409885859735, 0, 0, 'HN0630', NULL, '深灰色 M', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (480, 1274926586721, 409885859735, 0, 0, 'HN0630', NULL, '浅蓝色 M', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (481, 1274926586720, 409885859735, 0, 0, 'HN0630', NULL, '浅蓝色 S', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (482, 1274926586718, 409885859735, 0, 0, 'HN0630', NULL, '宝蓝色 XL', 20, 'HN0630', 'HN630', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (483, 1275780297875, 410305683990, 0, 0, 'HN0660', NULL, '宝蓝色 M', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (484, 1275780297878, 410305683990, 0, 0, 'HN0660', NULL, '宝蓝色 2XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (485, 1275780297882, 410305683990, 0, 0, 'HN0660', NULL, '浅蓝色 XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (486, 1275780297874, 410305683990, 0, 0, 'HN0660', NULL, '宝蓝色 S', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (487, 1275780297880, 410305683990, 0, 0, 'HN0660', NULL, '浅蓝色 M', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (488, 1275780297873, 410305683990, 0, 0, 'HN0660', NULL, '深灰色 2XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (489, 1275780297879, 410305683990, 0, 0, 'HN0660', NULL, '浅蓝色 S', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (490, 1275780297872, 410305683990, 0, 0, 'HN0660', NULL, '深灰色 XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (491, 1275780297869, 410305683990, 0, 0, 'HN0660', NULL, '深灰色 S', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (492, 1275780297864, 410305683990, 0, 0, 'HN0660', NULL, '黑色 S', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (493, 1275780297883, 410305683990, 0, 0, 'HN0660', NULL, '浅蓝色 2XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (494, 1275780297881, 410305683990, 0, 0, 'HN0660', NULL, '浅蓝色 L', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (495, 1275780297865, 410305683990, 0, 0, 'HN0660', NULL, '黑色 M', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (496, 1275780297867, 410305683990, 0, 0, 'HN0660', NULL, '黑色 XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (497, 1275780297876, 410305683990, 0, 0, 'HN0660', NULL, '宝蓝色 L', 19, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (498, 1275780297868, 410305683990, 0, 0, 'HN0660', NULL, '黑色 2XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (499, 1275780297870, 410305683990, 0, 0, 'HN0660', NULL, '深灰色 M', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (500, 1275780297866, 410305683990, 0, 0, 'HN0660', NULL, '黑色 L', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (501, 1275780297877, 410305683990, 0, 0, 'HN0660', NULL, '宝蓝色 XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (502, 1275780297871, 410305683990, 0, 0, 'HN0660', NULL, '深灰色 L', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (503, 1275783538406, 410308626596, 0, 0, 'HN0662', NULL, '浅蓝色 S', 20, 'HN0662', 'HN662', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (504, 1275783538409, 410308626596, 0, 0, 'HN0662', NULL, '浅蓝色 XL', 20, 'HN0662', 'HN662', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (505, 1275783538410, 410308626596, 0, 0, 'HN0662', NULL, '浅蓝色 2XL', 20, 'HN0662', 'HN662', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (506, 1275783538407, 410308626596, 0, 0, 'HN0662', NULL, '浅蓝色 M', 20, 'HN0662', 'HN662', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (507, 1275783538408, 410308626596, 0, 0, 'HN0662', NULL, '浅蓝色 L', 20, 'HN0662', 'HN662', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (508, 1276549759303, 410688391724, 0, 0, 'HN0663', NULL, '浅蓝色 2XL', 20, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (509, 1276549759304, 410688391724, 0, 0, 'HN0663', NULL, '黑灰色 S', 20, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (510, 1276549759300, 410688391724, 0, 0, 'HN0663', NULL, '浅蓝色 M', 19, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (511, 1276549759308, 410688391724, 0, 0, 'HN0663', NULL, '黑灰色 2XL', 20, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (512, 1276549759307, 410688391724, 0, 0, 'HN0663', NULL, '黑灰色 XL', 20, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (513, 1276549759299, 410688391724, 0, 0, 'HN0663', NULL, '浅蓝色 S', 20, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (514, 1276549759305, 410688391724, 0, 0, 'HN0663', NULL, '黑灰色 M', 19, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (515, 1276549759306, 410688391724, 0, 0, 'HN0663', NULL, '黑灰色 L', 20, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (516, 1276549759302, 410688391724, 0, 0, 'HN0663', NULL, '浅蓝色 XL', 20, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (517, 1276549759301, 410688391724, 0, 0, 'HN0663', NULL, '浅蓝色 L', 20, 'HN0663', 'HN663', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (518, 1276552341638, 410692286065, 0, 0, 'HN0665', NULL, '黑色 L', 20, 'HN0665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (519, 1276552341639, 410692286065, 0, 0, 'HN0665', NULL, '黑色 XL', 20, 'HN0665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (520, 1276552341637, 410692286065, 0, 0, 'HN0665', NULL, '黑色 M', 20, 'HN0665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (521, 1276552341640, 410692286065, 0, 0, 'HN0665', NULL, '黑色 2XL', 20, 'HN0665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (522, 1276552341636, 410692286065, 0, 0, 'HN0665', NULL, '黑色 S', 20, 'HN0665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (523, 1276555714237, 410693529689, 0, 0, 'HN0666', NULL, '深天蓝 L', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (524, 1276555714229, 410693529689, 0, 0, 'HN0666', NULL, '黑色 2XL', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (525, 1276555714242, 410693529689, 0, 0, 'HN0666', NULL, '浅蓝色 L', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (526, 1276555714239, 410693529689, 0, 0, 'HN0666', NULL, '深天蓝 2XL', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (527, 1276555714225, 410693529689, 0, 0, 'HN0666', NULL, '黑色 S', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (528, 1276555714228, 410693529689, 0, 0, 'HN0666', NULL, '黑色 XL', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (529, 1276555714243, 410693529689, 0, 0, 'HN0666', NULL, '浅蓝色 XL', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (530, 1276555714241, 410693529689, 0, 0, 'HN0666', NULL, '浅蓝色 M', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (531, 1276555714232, 410693529689, 0, 0, 'HN0666', NULL, '深灰色 L', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (532, 1276555714226, 410693529689, 0, 0, 'HN0666', NULL, '黑色 M', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (533, 1276555714227, 410693529689, 0, 0, 'HN0666', NULL, '黑色 L', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (534, 1276555714234, 410693529689, 0, 0, 'HN0666', NULL, '深灰色 2XL', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (535, 1276555714233, 410693529689, 0, 0, 'HN0666', NULL, '深灰色 XL', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (536, 1276555714235, 410693529689, 0, 0, 'HN0666', NULL, '深天蓝 S', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (537, 1276555714231, 410693529689, 0, 0, 'HN0666', NULL, '深灰色 M', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (538, 1276555714244, 410693529689, 0, 0, 'HN0666', NULL, '浅蓝色 2XL', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (539, 1276555714236, 410693529689, 0, 0, 'HN0666', NULL, '深天蓝 M', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (540, 1276555714240, 410693529689, 0, 0, 'HN0666', NULL, '浅蓝色 S', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (541, 1276555714230, 410693529689, 0, 0, 'HN0666', NULL, '深灰色 S', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (542, 1276555714238, 410693529689, 0, 0, 'HN0666', NULL, '深天蓝 XL', 20, 'HN0666', 'HN666', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (543, 1276557736043, 410694952121, 0, 0, 'HN0667', NULL, '宝蓝色 S', 18, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (544, 1276557736045, 410694952121, 0, 0, 'HN0667', NULL, '宝蓝色 L', 16, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (545, 1276557736047, 410694952121, 0, 0, 'HN0667', NULL, '宝蓝色 2XL', 19, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (546, 1276557736039, 410694952121, 0, 0, 'HN0667', NULL, '浅蓝色 M', 19, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (547, 1276557736041, 410694952121, 0, 0, 'HN0667', NULL, '浅蓝色 XL', 20, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (548, 1276557736046, 410694952121, 0, 0, 'HN0667', NULL, '宝蓝色 XL', 17, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (549, 1276557736038, 410694952121, 0, 0, 'HN0667', NULL, '浅蓝色 S', 18, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (550, 1276557736044, 410694952121, 0, 0, 'HN0667', NULL, '宝蓝色 M', 15, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (551, 1276557736040, 410694952121, 0, 0, 'HN0667', NULL, '浅蓝色 L', 20, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (552, 1276557736042, 410694952121, 0, 0, 'HN0667', NULL, '浅蓝色 2XL', 19, 'HN0667', 'HN667', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (553, 1276560236799, 410695996318, 592, 40, 'HN6681204', NULL, '宝蓝色 XL', 20, 'HN6681204', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (554, 1276560236801, 410695996318, 594, 40, 'HN6687501', NULL, '深灰色 S', 20, 'HN6687501', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (555, 1276560236804, 410695996318, 597, 40, 'HN6687504', NULL, '深灰色 XL', 20, 'HN6687504', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (556, 1276560236793, 410695996318, 586, 40, 'HN6685003', NULL, '浅蓝色 L', 20, 'HN6685003', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (557, 1276560236798, 410695996318, 591, 40, 'HN6681203', NULL, '宝蓝色 L', 20, 'HN6681203', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (558, 1276560236797, 410695996318, 590, 40, 'HN6681202', NULL, '宝蓝色 M', 20, 'HN6681202', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (559, 1276560236794, 410695996318, 587, 40, 'HN6685004', NULL, '浅蓝色 XL', 20, 'HN6685004', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (560, 1276560236792, 410695996318, 585, 40, 'HN6685002', NULL, '浅蓝色 M', 20, 'HN6685002', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (561, 1276560236791, 410695996318, 584, 40, 'HN6685001', NULL, '浅蓝色 S', 19, 'HN6685001', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (562, 1276560236796, 410695996318, 589, 40, 'HN6681201', NULL, '宝蓝色 S', 20, 'HN6681201', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (563, 1276560236805, 410695996318, 598, 40, 'HN6687505', NULL, '深灰色 2XL', 20, 'HN6687505', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (564, 1276560236795, 410695996318, 588, 40, 'HN6685005', NULL, '浅蓝色 2XL', 20, 'HN6685005', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (565, 1276560236803, 410695996318, 596, 40, 'HN6687503', NULL, '深灰色 L', 20, 'HN6687503', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (566, 1276560236800, 410695996318, 593, 40, 'HN6681205', NULL, '宝蓝色 2XL', 20, 'HN6681205', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (567, 1276560236802, 410695996318, 595, 40, 'HN6687502', NULL, '深灰色 M', 20, 'HN6687502', 'HN668', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (568, 1276562723239, 410697172304, 0, 0, 'HN0669', NULL, '宝蓝色 XL', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (569, 1276562723232, 410697172304, 0, 0, 'HN0669', NULL, '浅蓝色 M', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (570, 1276562723241, 410697172304, 0, 0, 'HN0669', NULL, '黑色 S', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (571, 1276562723233, 410697172304, 0, 0, 'HN0669', NULL, '浅蓝色 L', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (572, 1276562723231, 410697172304, 0, 0, 'HN0669', NULL, '浅蓝色 S', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (573, 1276562723242, 410697172304, 0, 0, 'HN0669', NULL, '黑色 M', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (574, 1276562723243, 410697172304, 0, 0, 'HN0669', NULL, '黑色 L', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (575, 1276562723237, 410697172304, 0, 0, 'HN0669', NULL, '宝蓝色 M', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (576, 1276562723238, 410697172304, 0, 0, 'HN0669', NULL, '宝蓝色 L', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (577, 1276562723235, 410697172304, 0, 0, 'HN0669', NULL, '浅蓝色 2XL', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (578, 1276562723240, 410697172304, 0, 0, 'HN0669', NULL, '宝蓝色 2XL', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (579, 1276562723245, 410697172304, 0, 0, 'HN0669', NULL, '黑色 2XL', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (580, 1276562723234, 410697172304, 0, 0, 'HN0669', NULL, '浅蓝色 XL', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (581, 1276562723236, 410697172304, 0, 0, 'HN0669', NULL, '宝蓝色 S', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (582, 1276562723244, 410697172304, 0, 0, 'HN0669', NULL, '黑色 XL', 20, 'HN0669', 'HN669', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (583, 1277927242201, 411361540533, 424, 28, 'HN6704005', NULL, '宝蓝色 2XL', 20, 'HN6704005', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (584, 1277927242203, 411361540533, 417, 28, 'HN6707503', NULL, '深灰色 L', 19, 'HN6707503', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (585, 1277926678779, 411361540533, 415, 28, 'HN6707501', NULL, '深灰色 S', 20, 'HN6707501', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (586, 1277926678778, 411361540533, 420, 28, 'HN6704001', NULL, '宝蓝色 S', 19, 'HN6704001', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (587, 1277927242196, 411361540533, 413, 28, 'HN6705004', NULL, '浅蓝色 XL', 20, 'HN6705004', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (588, 1277927242197, 411361540533, 414, 28, 'HN6705005', NULL, '浅蓝色 2XL', 20, 'HN6705005', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (589, 1277927242200, 411361540533, 423, 28, 'HN6704004', NULL, '宝蓝色 XL', 20, 'HN6704004', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (590, 1277927242204, 411361540533, 418, 28, 'HN6707504', NULL, '深灰色 XL', 19, 'HN6707504', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (591, 1277926678777, 411361540533, 410, 28, 'HN6705001', NULL, '浅蓝色 S', 20, 'HN6705001', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (592, 1277927242194, 411361540533, 411, 28, 'HN6705002', NULL, '浅蓝色 M', 20, 'HN6705002', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (593, 1277927242205, 411361540533, 419, 28, 'HN6707505', NULL, '深灰色 2XL', 19, 'HN6707505', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (594, 1277927242195, 411361540533, 412, 28, 'HN6705003', NULL, '浅蓝色 L', 20, 'HN6705003', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (595, 1277927242202, 411361540533, 416, 28, 'HN6707502', NULL, '深灰色 M', 18, 'HN6707502', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (596, 1277927242198, 411361540533, 421, 28, 'HN6704002', NULL, '宝蓝色 M', 19, 'HN6704002', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (597, 1277927242199, 411361540533, 422, 28, 'HN6704003', NULL, '宝蓝色 L', 19, 'HN6704003', 'HN670', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (598, 1277929165137, 411366495987, 0, 0, 'HN0671', NULL, '黑色 L', 20, 'HN0671', '665779472192', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (599, 1277929165138, 411366495987, 0, 0, 'HN0671', NULL, '黑色 XL', 20, 'HN0671', '665779472192', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (600, 1277929165139, 411366495987, 0, 0, 'HN0671', NULL, '黑色 2XL', 20, 'HN0671', '665779472192', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (601, 1277929165135, 411366495987, 0, 0, 'HN0671', NULL, '黑色 S', 20, 'HN0671', '665779472192', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (602, 1277929165136, 411366495987, 0, 0, 'HN0671', NULL, '黑色 M', 20, 'HN0671', '665779472192', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (603, 1277936821459, 411370161999, 0, 0, 'HN0672', NULL, '宝蓝色 L', 19, 'HN0672', '670461866109', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (604, 1277936821460, 411370161999, 0, 0, 'HN0672', NULL, '宝蓝色 XL', 20, 'HN0672', '670461866109', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (605, 1277936821457, 411370161999, 0, 0, 'HN0672', NULL, '宝蓝色 S', 20, 'HN0672', '670461866109', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (606, 1277936821458, 411370161999, 0, 0, 'HN0672', NULL, '宝蓝色 M', 19, 'HN0672', '670461866109', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (607, 1277936821461, 411370161999, 0, 0, 'HN0672', NULL, '宝蓝色 2XL', 20, 'HN0672', '670461866109', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (608, 1277953926674, 411378921081, 0, 0, 'HN0673', NULL, '浅蓝色 XL', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (609, 1277953926679, 411378921081, 0, 0, 'HN0673', NULL, '深灰色 XL', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (610, 1277953926675, 411378921081, 0, 0, 'HN0673', NULL, '浅蓝色 2XL', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (611, 1277953926677, 411378921081, 0, 0, 'HN0673', NULL, '深灰色 M', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (612, 1277953926671, 411378921081, 0, 0, 'HN0673', NULL, '浅蓝色 S', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (613, 1277953926678, 411378921081, 0, 0, 'HN0673', NULL, '深灰色 L', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (614, 1277953926680, 411378921081, 0, 0, 'HN0673', NULL, '深灰色 2XL', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (615, 1277953926672, 411378921081, 0, 0, 'HN0673', NULL, '浅蓝色 M', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (616, 1277953926676, 411378921081, 0, 0, 'HN0673', NULL, '深灰色 S', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (617, 1277953926673, 411378921081, 0, 0, 'HN0673', NULL, '浅蓝色 L', 20, 'HN0673', '637993903547', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (618, 1277957033281, 411379965590, 0, 0, 'HN0675', NULL, '黑色 M', 20, 'HN0675', '668784844135', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (619, 1277957033284, 411379965590, 0, 0, 'HN0675', NULL, '黑色 2XL', 20, 'HN0675', '668784844135', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (620, 1277957033280, 411379965590, 0, 0, 'HN0675', NULL, '黑色 S', 20, 'HN0675', '668784844135', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (621, 1277957033283, 411379965590, 0, 0, 'HN0675', NULL, '黑色 XL', 20, 'HN0675', '668784844135', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (622, 1277957033282, 411379965590, 0, 0, 'HN0675', NULL, '黑色 L', 20, 'HN0675', '668784844135', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (623, 1278685364127, 411726911306, 0, 0, 'HN0686', NULL, '黑灰色 M', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (624, 1278685364117, 411726911306, 0, 0, 'HN0686', NULL, '白色 M', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (625, 1278685364119, 411726911306, 0, 0, 'HN0686', NULL, '白色 XL', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (626, 1278685364129, 411726911306, 0, 0, 'HN0686', NULL, '黑灰色 XL', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (627, 1278685364121, 411726911306, 0, 0, 'HN0686', NULL, '黑色 S', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (628, 1278685364128, 411726911306, 0, 0, 'HN0686', NULL, '黑灰色 L', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (629, 1278685364118, 411726911306, 0, 0, 'HN0686', NULL, '白色 L', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (630, 1278685364130, 411726911306, 0, 0, 'HN0686', NULL, '黑灰色 2XL', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (631, 1278685364134, 411726911306, 0, 0, 'HN0686', NULL, '浅蓝色 XL', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (632, 1278685364122, 411726911306, 0, 0, 'HN0686', NULL, '黑色 M', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (633, 1278685364132, 411726911306, 0, 0, 'HN0686', NULL, '浅蓝色 M', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (634, 1278685364133, 411726911306, 0, 0, 'HN0686', NULL, '浅蓝色 L', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (635, 1278685364124, 411726911306, 0, 0, 'HN0686', NULL, '黑色 XL', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (636, 1278685364125, 411726911306, 0, 0, 'HN0686', NULL, '黑色 2XL', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (637, 1278685364135, 411726911306, 0, 0, 'HN0686', NULL, '浅蓝色 2XL', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (638, 1278685364120, 411726911306, 0, 0, 'HN0686', NULL, '白色 2XL', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (639, 1278685364131, 411726911306, 0, 0, 'HN0686', NULL, '浅蓝色 S', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (640, 1278685364126, 411726911306, 0, 0, 'HN0686', NULL, '黑灰色 S', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (641, 1278685364123, 411726911306, 0, 0, 'HN0686', NULL, '黑色 L', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (642, 1278685364116, 411726911306, 0, 0, 'HN0686', NULL, '白色 S', 20, 'HN0686', 'HN686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (643, 1278687408574, 411728903206, 0, 0, 'HN0687', NULL, '彩色 S', 20, 'HN0687', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (644, 1278687408576, 411728903206, 0, 0, 'HN0687', NULL, '彩色 L', 20, 'HN0687', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (645, 1278687408575, 411728903206, 0, 0, 'HN0687', NULL, '彩色 M', 20, 'HN0687', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (646, 1278687408577, 411728903206, 0, 0, 'HN0687', NULL, '彩色 XL', 20, 'HN0687', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (647, 1278687408578, 411728903206, 0, 0, 'HN0687', NULL, '彩色 2XL', 20, 'HN0687', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (648, 1278690383970, 411729694401, 539, 36, 'HN6927505', NULL, '黑灰色 2XL', 20, 'HN6927505', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (649, 1278690383962, 411729694401, 541, 36, 'HN6925002', NULL, '浅蓝色 M', 20, 'HN6925002', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (650, 1278690383964, 411729694401, 543, 36, 'HN6925004', NULL, '浅蓝色 XL', 19, 'HN6925004', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (651, 1278690383966, 411729694401, 535, 36, 'HN6927501', NULL, '黑灰色 S', 18, 'HN6927501', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (652, 1278690383961, 411729694401, 540, 36, 'HN6925001', NULL, '浅蓝色 S', 19, 'HN6925001', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (653, 1278690383963, 411729694401, 542, 36, 'HN6925003', NULL, '浅蓝色 L', 20, 'HN6925003', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (654, 1278690383969, 411729694401, 538, 36, 'HN6927504', NULL, '黑灰色 XL', 20, 'HN6927504', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (655, 1278690383968, 411729694401, 537, 36, 'HN6927503', NULL, '黑灰色 L', 17, 'HN6927503', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (656, 1278690383965, 411729694401, 544, 36, 'HN6925005', NULL, '浅蓝色 2XL', 20, 'HN6925005', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (657, 1278690383967, 411729694401, 536, 36, 'HN6927502', NULL, '黑灰色 M', 20, 'HN6927502', 'HN692', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (658, 1278693303512, 411731178725, 624, 43, 'HN0694', NULL, '蓝色 M', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (659, 1278693303514, 411731178725, 0, 0, 'HN0694', NULL, '蓝色 XL', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (660, 1278693303516, 411731178725, 0, 0, 'HN0694', NULL, '黑灰色 S', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (661, 1278693303520, 411731178725, 0, 0, 'HN0694', NULL, '黑灰色 2XL', 19, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (662, 1278693303517, 411731178725, 0, 0, 'HN0694', NULL, '黑灰色 M', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (663, 1278693303515, 411731178725, 0, 0, 'HN0694', NULL, '蓝色 2XL', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (664, 1278693303511, 411731178725, 0, 0, 'HN0694', NULL, '蓝色 S', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (665, 1278693303519, 411731178725, 0, 0, 'HN0694', NULL, '黑灰色 XL', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (666, 1278693303518, 411731178725, 0, 0, 'HN0694', NULL, '黑灰色 L', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (667, 1278693303513, 411731178725, 0, 0, 'HN0694', NULL, '蓝色 L', 20, 'HN0694', 'HN0694', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (668, 1278695025347, 411732581938, 0, 0, 'HN0697', NULL, '黑灰色 L', 19, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (669, 1278695025352, 411732581938, 0, 0, 'HN0697', NULL, '浅蓝色 L', 17, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (670, 1278695025353, 411732581938, 0, 0, 'HN0697', NULL, '浅蓝色 XL', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (671, 1278695025345, 411732581938, 0, 0, 'HN0697', NULL, '黑灰色 S', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (672, 1278695025349, 411732581938, 0, 0, 'HN0697', NULL, '黑灰色 2XL', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (673, 1278695025357, 411732581938, 0, 0, 'HN0697', NULL, '杏色 L', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (674, 1278695025346, 411732581938, 0, 0, 'HN0697', NULL, '黑灰色 M', 19, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (675, 1278695025354, 411732581938, 0, 0, 'HN0697', NULL, '浅蓝色 2XL', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (676, 1278695025359, 411732581938, 0, 0, 'HN0697', NULL, '杏色 2XL', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (677, 1278695025355, 411732581938, 0, 0, 'HN0697', NULL, '杏色 S', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (678, 1278695025348, 411732581938, 0, 0, 'HN0697', NULL, '黑灰色 XL', 19, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (679, 1278695025358, 411732581938, 0, 0, 'HN0697', NULL, '杏色 XL', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (680, 1278695025356, 411732581938, 0, 0, 'HN0697', NULL, '杏色 M', 20, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (681, 1278695025350, 411732581938, 0, 0, 'HN0697', NULL, '浅蓝色 S', 19, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (682, 1278695025351, 411732581938, 0, 0, 'HN0697', NULL, '浅蓝色 M', 16, 'HN0697', 'HN697', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (683, 1279515712395, 412120506598, 498, 33, 'HN08017504', NULL, '黑灰色 XL', 15, 'HN08017504', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (684, 1279515712388, 412120506598, 491, 33, 'HN08010102', NULL, '黑色 M', 16, 'HN08010102', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (685, 1279515712390, 412120506598, 493, 33, 'HN08010104', NULL, '黑色 XL', 19, 'HN08010104', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (686, 1279515712397, 412120506598, 505, 33, 'HN08014001', NULL, '复古蓝 S', 19, 'HN08014001', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (687, 1279515712405, 412120506598, 498, 33, 'HN08017504', NULL, '蓝灰色 XL', 17, 'HN08017504', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (688, 1279515712402, 412120506598, 495, 33, 'HN08017501', NULL, '蓝灰色 S', 18, 'HN08017501', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (689, 1279515712398, 412120506598, 506, 33, 'HN08014002', NULL, '复古蓝 M', 17, 'HN08014002', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (690, 1279515712400, 412120506598, 508, 33, 'HN08014004', NULL, '复古蓝 XL', 19, 'HN08014004', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (691, 1279515712389, 412120506598, 492, 33, 'HN08010103', NULL, '黑色 L', 14, 'HN08010103', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (692, 1279515712387, 412120506598, 490, 33, 'HN08010101', NULL, '黑色 S', 18, 'HN08010101', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (693, 1279515712401, 412120506598, 509, 33, 'HN08014005', NULL, '复古蓝 2XL', 20, 'HN08014005', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (694, 1279515712396, 412120506598, 499, 33, 'HN08017505', NULL, '黑灰色 2XL', 17, 'HN08017505', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (695, 1279515712406, 412120506598, 499, 33, 'HN08017505', NULL, '蓝灰色 2XL', 19, 'HN08017505', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (696, 1279515712393, 412120506598, 496, 33, 'HN08017502', NULL, '黑灰色 M', 14, 'HN08017502', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (697, 1279515712394, 412120506598, 497, 33, 'HN08017503', NULL, '黑灰色 L', 11, 'HN08017503', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (698, 1279515712391, 412120506598, 494, 33, 'HN08010105', NULL, '黑色 2XL', 18, 'HN08010105', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (699, 1279515712403, 412120506598, 496, 33, 'HN08017502', NULL, '蓝灰色 M', 14, 'HN08017502', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (700, 1279515712399, 412120506598, 507, 33, 'HN08014003', NULL, '复古蓝 L', 19, 'HN08014003', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (701, 1279515712392, 412120506598, 495, 33, 'HN08017501', NULL, '黑灰色 S', 15, 'HN08017501', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (702, 1279515712404, 412120506598, 497, 33, 'HN08017503', NULL, '蓝灰色 L', 10, 'HN08017503', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (703, 1279544038796, 412133591017, 0, 0, 'HN801', NULL, '浅蓝色 S', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (704, 1279544038800, 412133591017, 0, 0, 'HN801', NULL, '浅蓝色 2XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (705, 1279544038791, 412133591017, 0, 0, 'HN801', NULL, '蓝灰色 S', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (706, 1279544038779, 412133591017, 0, 0, 'HN801', NULL, '黑色 XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (707, 1279544038794, 412133591017, 0, 0, 'HN801', NULL, '蓝灰色 XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (708, 1279544038793, 412133591017, 0, 0, 'HN801', NULL, '蓝灰色 L', 19, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (709, 1279544038803, 412133591017, 0, 0, 'HN801', NULL, '杏色 L', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (710, 1279544038780, 412133591017, 0, 0, 'HN801', NULL, '黑色 2XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (711, 1279544038790, 412133591017, 0, 0, 'HN801', NULL, '复古蓝 2XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (712, 1279544038778, 412133591017, 0, 0, 'HN801', NULL, '黑色 L', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (713, 1279544038805, 412133591017, 0, 0, 'HN801', NULL, '杏色 2XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (714, 1279544038784, 412133591017, 0, 0, 'HN801', NULL, '黑灰色 XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (715, 1279544038786, 412133591017, 0, 0, 'HN801', NULL, '复古蓝 S', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (716, 1279544038797, 412133591017, 0, 0, 'HN801', NULL, '浅蓝色 M', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (717, 1279544038776, 412133591017, 0, 0, 'HN801', NULL, '黑色 S', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (718, 1279544038799, 412133591017, 0, 0, 'HN801', NULL, '浅蓝色 XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (719, 1279544038782, 412133591017, 0, 0, 'HN801', NULL, '黑灰色 M', 19, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (720, 1279544038787, 412133591017, 0, 0, 'HN801', NULL, '复古蓝 M', 18, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (721, 1279544038795, 412133591017, 0, 0, 'HN801', NULL, '蓝灰色 2XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (722, 1279544038777, 412133591017, 0, 0, 'HN801', NULL, '黑色 M', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (723, 1279544038802, 412133591017, 0, 0, 'HN801', NULL, '杏色 M', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (724, 1279544038785, 412133591017, 0, 0, 'HN801', NULL, '黑灰色 2XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (725, 1279544038788, 412133591017, 0, 0, 'HN801', NULL, '复古蓝 L', 19, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (726, 1279544038783, 412133591017, 0, 0, 'HN801', NULL, '黑灰色 L', 19, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (727, 1279544038798, 412133591017, 0, 0, 'HN801', NULL, '浅蓝色 L', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (728, 1279544038792, 412133591017, 0, 0, 'HN801', NULL, '蓝灰色 M', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (729, 1279544038789, 412133591017, 0, 0, 'HN801', NULL, '复古蓝 XL', 19, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (730, 1279544038781, 412133591017, 0, 0, 'HN801', NULL, '黑灰色 S', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (731, 1279544038804, 412133591017, 0, 0, 'HN801', NULL, '杏色 XL', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (732, 1279544038801, 412133591017, 0, 0, 'HN801', NULL, '杏色 S', 20, 'HN801', 'HN801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (733, 1279549091913, 412137132774, 0, 0, 'HN802', NULL, '黑灰色 S', 20, 'HN802', 'HN802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (734, 1279549091917, 412137132774, 0, 0, 'HN802', NULL, '黑灰色 2XL', 20, 'HN802', 'HN802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (735, 1279549091915, 412137132774, 0, 0, 'HN802', NULL, '黑灰色 L', 20, 'HN802', 'HN802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (736, 1279549091914, 412137132774, 0, 0, 'HN802', NULL, '黑灰色 M', 20, 'HN802', 'HN802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (737, 1279549091916, 412137132774, 0, 0, 'HN802', NULL, '黑灰色 XL', 20, 'HN802', 'HN802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (738, 1279551031198, 412138772165, 0, 0, 'HN805', NULL, '浅蓝色 M', 20, 'HN805', 'HN805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (739, 1279551031201, 412138772165, 0, 0, 'HN805', NULL, '浅蓝色 2XL', 20, 'HN805', 'HN805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (740, 1279551031197, 412138772165, 0, 0, 'HN805', NULL, '浅蓝色 S', 20, 'HN805', 'HN805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (741, 1279551031199, 412138772165, 0, 0, 'HN805', NULL, '浅蓝色 L', 20, 'HN805', 'HN805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (742, 1279551031200, 412138772165, 0, 0, 'HN805', NULL, '浅蓝色 XL', 20, 'HN805', 'HN805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (743, 1279553631566, 412139652425, 0, 0, 'HN807', NULL, '浅蓝色 M', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (744, 1279553631572, 412139652425, 0, 0, 'HN807', NULL, '复古蓝 L', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (745, 1279553631577, 412139652425, 0, 0, 'HN807', NULL, '蓝灰色 L', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (746, 1279553631578, 412139652425, 0, 0, 'HN807', NULL, '蓝灰色 XL', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (747, 1279553631575, 412139652425, 0, 0, 'HN807', NULL, '蓝灰色 S', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (748, 1279553631581, 412139652425, 0, 0, 'HN807', NULL, '黑灰色 M', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (749, 1279553631565, 412139652425, 0, 0, 'HN807', NULL, '浅蓝色 S', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (750, 1279553631576, 412139652425, 0, 0, 'HN807', NULL, '蓝灰色 M', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (751, 1279553631571, 412139652425, 0, 0, 'HN807', NULL, '复古蓝 M', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (752, 1279553631567, 412139652425, 0, 0, 'HN807', NULL, '浅蓝色 L', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (753, 1279553631574, 412139652425, 0, 0, 'HN807', NULL, '复古蓝 2XL', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (754, 1279553631583, 412139652425, 0, 0, 'HN807', NULL, '黑灰色 XL', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (755, 1279553631573, 412139652425, 0, 0, 'HN807', NULL, '复古蓝 XL', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (756, 1279553631568, 412139652425, 0, 0, 'HN807', NULL, '浅蓝色 XL', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (757, 1279553631579, 412139652425, 0, 0, 'HN807', NULL, '蓝灰色 2XL', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (758, 1279553631580, 412139652425, 0, 0, 'HN807', NULL, '黑灰色 S', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (759, 1279553631584, 412139652425, 0, 0, 'HN807', NULL, '黑灰色 2XL', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (760, 1279553631570, 412139652425, 0, 0, 'HN807', NULL, '复古蓝 S', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (761, 1279553631582, 412139652425, 0, 0, 'HN807', NULL, '黑灰色 L', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (762, 1279553631569, 412139652425, 0, 0, 'HN807', NULL, '浅蓝色 2XL', 20, 'HN807', 'HN807', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (763, 1284642162278, 414594889986, 0, 0, '', NULL, '白色 M', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (764, 1284642162280, 414594889986, 0, 0, '', NULL, '白色 XL', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (765, 1284642162287, 414594889986, 0, 0, '', NULL, '浅蓝色 S', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (766, 1284642162286, 414594889986, 0, 0, '', NULL, '黑色 2XL', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (767, 1284642162283, 414594889986, 0, 0, '', NULL, '黑色 M', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (768, 1284642162281, 414594889986, 0, 0, '', NULL, '白色 2XL', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (769, 1284642162291, 414594889986, 0, 0, '', NULL, '浅蓝色 2XL', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (770, 1284642162277, 414594889986, 0, 0, '', NULL, '白色 S', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (771, 1284642162284, 414594889986, 0, 0, '', NULL, '黑色 L', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (772, 1284642162285, 414594889986, 0, 0, '', NULL, '黑色 XL', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (773, 1284642162279, 414594889986, 0, 0, '', NULL, '白色 L', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (774, 1284642162282, 414594889986, 0, 0, '', NULL, '黑色 S', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (775, 1284642162288, 414594889986, 0, 0, '', NULL, '浅蓝色 M', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (776, 1284642162289, 414594889986, 0, 0, '', NULL, '浅蓝色 L', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (777, 1284642162290, 414594889986, 0, 0, '', NULL, '浅蓝色 XL', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (778, 1285881278694, 415222366821, 0, 0, '', NULL, '黑色 均码', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (779, 1285881278693, 415222366821, 0, 0, '', NULL, '白色 均码', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (780, 1285881278697, 415222366821, 0, 0, '', NULL, '浅蓝色 均码', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (781, 1285881278695, 415222366821, 0, 0, '', NULL, '粉红色 均码', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (782, 1285881278696, 415222366821, 0, 0, '', NULL, '杏色 均码', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (783, 1292691249711, 418757536479, 0, 0, 'JKL805', NULL, '深蓝色加长款 XS', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (784, 1292691249707, 418757536479, 0, 0, 'JKL805', NULL, '蓝色 M', 49, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (785, 1292691249708, 418757536479, 0, 0, 'JKL805', NULL, '蓝色 L', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (786, 1292691249706, 418757536479, 729, 47, 'JKL805', NULL, '蓝色 S', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (787, 1292691249713, 418757536479, 0, 0, 'JKL805', NULL, '深蓝色加长款 M', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (788, 1292691249705, 418757536479, 729, 47, 'JKL805', NULL, '蓝色 XS', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (789, 1292691249714, 418757536479, 0, 0, 'JKL805', NULL, '深蓝色加长款 L', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (790, 1292691249712, 418757536479, 0, 0, 'JKL805', NULL, '深蓝色加长款 S', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (791, 1292691249715, 418757536479, 0, 0, 'JKL805', NULL, '深蓝色加长款 XL', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (792, 1292691249710, 418757536479, 0, 0, 'JKL805', NULL, '蓝色 2XL', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (793, 1292691249716, 418757536479, 0, 0, 'JKL805', NULL, '深蓝色加长款 2XL', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (794, 1292691249709, 418757536479, 0, 0, 'JKL805', NULL, '蓝色 XL', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (795, 1295810387557, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝九分 S', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (796, 1295810387581, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝长款 S', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (797, 1295810387555, 420535061032, 0, 0, 'JKL9938', NULL, '黑色九分 2XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (798, 1295810387566, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝九分 XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (799, 1295810387564, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝九分 M', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (800, 1295810387585, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝长款 2XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (801, 1295810387551, 420535061032, 0, 0, 'JKL9938', NULL, '黑色九分 S', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (802, 1295810387567, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝九分 2XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (803, 1295810387569, 420535061032, 0, 0, 'JKL9938', NULL, '黑色长款 S', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (804, 1295810387578, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝长款 XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (805, 1295810387583, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝长款 L', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (806, 1295810387582, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝长款 M', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (807, 1295810387559, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝九分 L', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (808, 1295810387561, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝九分 2XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (809, 1295810387562, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝九分 XS', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (810, 1295810387577, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝长款 L', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (811, 1295810387558, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝九分 M', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (812, 1295810387571, 420535061032, 0, 0, 'JKL9938', NULL, '黑色长款 L', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (813, 1295810387576, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝长款 M', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (814, 1295810387553, 420535061032, 0, 0, 'JKL9938', NULL, '黑色九分 L', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (815, 1295810387552, 420535061032, 0, 0, 'JKL9938', NULL, '黑色九分 M', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (816, 1295810387568, 420535061032, 0, 0, 'JKL9938', NULL, '黑色长款 XS', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (817, 1295810387570, 420535061032, 0, 0, 'JKL9938', NULL, '黑色长款 M', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (818, 1295810387563, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝九分 S', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (819, 1295810387580, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝长款 XS', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (820, 1295810387565, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝九分 L', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (821, 1295810387560, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝九分 XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (822, 1295810387554, 420535061032, 0, 0, 'JKL9938', NULL, '黑色九分 XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (823, 1295810387573, 420535061032, 0, 0, 'JKL9938', NULL, '黑色长款 2XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (824, 1295810387556, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝九分 XS', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (825, 1295810387574, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝长款 XS', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (826, 1295810387584, 420535061032, 0, 0, 'JKL9938', NULL, '深蓝长款 XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (827, 1295810387575, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝长款 S', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (828, 1295810387579, 420535061032, 0, 0, 'JKL9938', NULL, '浅蓝长款 2XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (829, 1295810387572, 420535061032, 0, 0, 'JKL9938', NULL, '黑色长款 XL', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (830, 1295810387550, 420535061032, 0, 0, 'JKL9938', NULL, '黑色九分 XS', 50, 'JKL9938', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (831, 1251236772886, 398847598958, 0, 0, '', NULL, '深灰色 L', 15, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (832, 1251236772894, 398847598958, 0, 0, '', NULL, '浅蓝色 S', 17, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (833, 1251236772887, 398847598958, 0, 0, '', NULL, '深灰色 XL', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (834, 1251236772892, 398847598958, 0, 0, '', NULL, '黑色 XL', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (835, 1251236772897, 398847598958, 0, 0, '', NULL, '浅蓝色 XL', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (836, 1251236772898, 398847598958, 0, 0, '', NULL, '浅蓝色 2XL', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (837, 1251236772896, 398847598958, 0, 0, '', NULL, '浅蓝色 L', 14, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (838, 1251236772885, 398847598958, 0, 0, '', NULL, '深灰色 M', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (839, 1251236772891, 398847598958, 0, 0, '', NULL, '黑色 L', 17, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (840, 1251236772889, 398847598958, 0, 0, '', NULL, '黑色 S', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (841, 1251236772890, 398847598958, 0, 0, '', NULL, '黑色 M', 17, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (842, 1251236772893, 398847598958, 0, 0, '', NULL, '黑色 2XL', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (843, 1251236772884, 398847598958, 0, 0, '', NULL, '深灰色 S', 19, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (844, 1251236772895, 398847598958, 0, 0, '', NULL, '浅蓝色 M', 18, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (845, 1251236772888, 398847598958, 0, 0, '', NULL, '深灰色 2XL', 20, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (846, 1251749918980, 399063348248, 0, 0, '', NULL, '浅蓝色加长', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (847, 1251749918984, 399063348248, 0, 0, '', NULL, '黑色长裤', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (848, 1251749918978, 399063348248, 0, 0, '', NULL, '浅蓝色长裤', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (849, 1251749918981, 399063348248, 0, 0, '', NULL, '复古蓝加长', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (850, 1251749918976, 399063348248, 0, 0, '', NULL, '复古蓝长裤', 99, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (851, 1251749918983, 399063348248, 0, 0, '', NULL, '黑色加长', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (852, 1251749918979, 399063348248, 0, 0, '', NULL, '复古蓝九分', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (853, 1251749918982, 399063348248, 0, 0, '', NULL, '黑色九分', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (854, 1251749918977, 399063348248, 0, 0, '', NULL, '浅蓝色九分', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (855, 1276572950561, 399063851678, 0, 0, 'HN0678', NULL, '浅蓝色 XL', 20, 'HN0678', 't651428823385', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (856, 1276572950560, 399063851678, 0, 0, 'HN0678', NULL, '浅蓝色 L', 20, 'HN0678', 't651428823385', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (857, 1276572950559, 399063851678, 0, 0, 'HN0678', NULL, '浅蓝色 M', 20, 'HN0678', 't651428823385', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (858, 1276572950562, 399063851678, 0, 0, 'HN0678', NULL, '浅蓝色 2XL', 20, 'HN0678', 't651428823385', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (859, 1276572950558, 399063851678, 0, 0, 'HN0678', NULL, '浅蓝色 S', 20, 'HN0678', 't651428823385', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (860, 1269479069148, 407249067559, 0, 0, 'KH9695', NULL, '黑色 30', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (861, 1269479069152, 407249067559, 0, 0, 'KH9695', NULL, '黑色 34', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (862, 1269479069146, 407249067559, 0, 0, 'KH9695', NULL, '黑色 28', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (863, 1269479069140, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 30', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (864, 1269479069151, 407249067559, 0, 0, 'KH9695', NULL, '黑色 33', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (865, 1269477690312, 407249067559, 0, 0, 'KH9695', NULL, '黑色 26', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (866, 1269479069142, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 32', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (867, 1269479069143, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 33', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (868, 1269479069150, 407249067559, 0, 0, 'KH9695', NULL, '黑色 32', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (869, 1269479069145, 407249067559, 0, 0, 'KH9695', NULL, '黑色 27', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (870, 1269479069137, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 27', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (871, 1269479069149, 407249067559, 0, 0, 'KH9695', NULL, '黑色 31', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (872, 1269479069138, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 28', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (873, 1269477690311, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 26', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (874, 1269479069141, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 31', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (875, 1269479069139, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 29', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (876, 1269479069147, 407249067559, 0, 0, 'KH9695', NULL, '黑色 29', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (877, 1269479069144, 407249067559, 0, 0, 'KH9695', NULL, '蓝色 34', 20, 'KH9695', 't622135144835', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (878, 1269724202582, 407356168572, 0, 0, 'KH9709', NULL, '灰色 28', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (879, 1269724202590, 407356168572, 0, 0, 'KH9709', NULL, '黑色 29', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (880, 1269724202581, 407356168572, 0, 0, 'KH9709', NULL, '灰色 27', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (881, 1269724202585, 407356168572, 0, 0, 'KH9709', NULL, '灰色 31', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (882, 1269724202583, 407356168572, 0, 0, 'KH9709', NULL, '灰色 29', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (883, 1269724202591, 407356168572, 0, 0, 'KH9709', NULL, '黑色 30', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (884, 1269724202586, 407356168572, 0, 0, 'KH9709', NULL, '灰色 32', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (885, 1269724202588, 407356168572, 0, 0, 'KH9709', NULL, '黑色 27', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (886, 1269724202593, 407356168572, 0, 0, 'KH9709', NULL, '黑色 32', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (887, 1269724202587, 407356168572, 0, 0, 'KH9709', NULL, '黑色 26', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (888, 1269724202592, 407356168572, 0, 0, 'KH9709', NULL, '黑色 31', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (889, 1269724202584, 407356168572, 0, 0, 'KH9709', NULL, '灰色 30', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (890, 1269724202580, 407356168572, 0, 0, 'KH9709', NULL, '灰色 26', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (891, 1269724202589, 407356168572, 0, 0, 'KH9709', NULL, '黑色 28', 20, 'KH9709', 'T624078788603', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (892, 1271567855666, 408246660557, 0, 0, 'KH9685', NULL, '浅蓝色 30', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (893, 1271567855664, 408246660557, 0, 0, 'KH9685', NULL, '浅蓝色 28', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (894, 1271567855671, 408246660557, 0, 0, 'KH9685', NULL, '深蓝色 28', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (895, 1271567855661, 408246660557, 0, 0, 'KH9685', NULL, '灰色 32', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (896, 1271567855660, 408246660557, 0, 0, 'KH9685', NULL, '灰色 31', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (897, 1271567855669, 408246660557, 0, 0, 'KH9685', NULL, '深蓝色 26', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (898, 1271567855673, 408246660557, 0, 0, 'KH9685', NULL, '深蓝色 30', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (899, 1271567855672, 408246660557, 0, 0, 'KH9685', NULL, '深蓝色 29', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (900, 1271567855663, 408246660557, 0, 0, 'KH9685', NULL, '浅蓝色 27', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (901, 1271567855655, 408246660557, 0, 0, 'KH9685', NULL, '灰色 26', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (902, 1271567855667, 408246660557, 0, 0, 'KH9685', NULL, '浅蓝色 31', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (903, 1271567855656, 408246660557, 0, 0, 'KH9685', NULL, '灰色 27', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (904, 1271567855659, 408246660557, 0, 0, 'KH9685', NULL, '灰色 30', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (905, 1271567855658, 408246660557, 0, 0, 'KH9685', NULL, '灰色 29', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (906, 1271567855657, 408246660557, 0, 0, 'KH9685', NULL, '灰色 28', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (907, 1271567855674, 408246660557, 0, 0, 'KH9685', NULL, '深蓝色 31', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (908, 1271567855668, 408246660557, 0, 0, 'KH9685', NULL, '浅蓝色 32', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (909, 1271567855675, 408246660557, 0, 0, 'KH9685', NULL, '深蓝色 32', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (910, 1271567855662, 408246660557, 0, 0, 'KH9685', NULL, '浅蓝色 26', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (911, 1271567855670, 408246660557, 0, 0, 'KH9685', NULL, '深蓝色 27', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (912, 1271567855665, 408246660557, 0, 0, 'KH9685', NULL, '浅蓝色 29', 20, 'KH9685', 'T610270951823', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (913, 1271623290129, 408275614162, 0, 0, 'KH9688', NULL, '黑灰 32', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (914, 1271623290119, 408275614162, 0, 0, 'KH9688', NULL, '蓝灰 29', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (915, 1271623290118, 408275614162, 0, 0, 'KH9688', NULL, '蓝灰 28', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (916, 1271623290116, 408275614162, 0, 0, 'KH9688', NULL, '蓝灰 26', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (917, 1271623290126, 408275614162, 0, 0, 'KH9688', NULL, '黑灰 29', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (918, 1271623290121, 408275614162, 0, 0, 'KH9688', NULL, '蓝灰 31', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (919, 1271623290127, 408275614162, 0, 0, 'KH9688', NULL, '黑灰 30', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (920, 1271623290125, 408275614162, 0, 0, 'KH9688', NULL, '黑灰 28', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (921, 1271623290122, 408275614162, 0, 0, 'KH9688', NULL, '蓝灰 32', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (922, 1271623290120, 408275614162, 0, 0, 'KH9688', NULL, '蓝灰 30', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (923, 1271623290117, 408275614162, 0, 0, 'KH9688', NULL, '蓝灰 27', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (924, 1271623290124, 408275614162, 0, 0, 'KH9688', NULL, '黑灰 27', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (925, 1271623290123, 408275614162, 0, 0, 'KH9688', NULL, '黑灰 26', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (926, 1271623290128, 408275614162, 0, 0, 'KH9688', NULL, '黑灰 31', 20, 'KH9688', 'T610041890003', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (927, 1278013335025, 411405520617, 0, 0, 'KH22318', NULL, '宝蓝色 2XL', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (928, 1278013335019, 411405520617, 0, 0, 'KH22318', NULL, '浅蓝色 XL', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (929, 1278013335018, 411405520617, 0, 0, 'KH22318', NULL, '浅蓝色 L', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (930, 1278013335020, 411405520617, 0, 0, 'KH22318', NULL, '浅蓝色 2XL', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (931, 1278013335023, 411405520617, 0, 0, 'KH22318', NULL, '宝蓝色 L', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (932, 1278013335024, 411405520617, 0, 0, 'KH22318', NULL, '宝蓝色 XL', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (933, 1278013335017, 411405520617, 0, 0, 'KH22318', NULL, '浅蓝色 M', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (934, 1278013335016, 411405520617, 0, 0, 'KH22318', NULL, '浅蓝色 S', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (935, 1278013335021, 411405520617, 0, 0, 'KH22318', NULL, '宝蓝色 S', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (936, 1278013335022, 411405520617, 0, 0, 'KH22318', NULL, '宝蓝色 M', 20, 'KH22318', '675027903686', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (937, 1285730382209, 415140360909, 0, 0, 'HN014', NULL, '黑色 S', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (938, 1285730382215, 415140360909, 0, 0, 'HN014', NULL, '浅蓝色 M', 49, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (939, 1285730382219, 415140360909, 0, 0, 'HN014', NULL, '宝蓝色 S', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (940, 1285730382211, 415140360909, 0, 0, 'HN014', NULL, '黑色 L', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (941, 1285730382212, 415140360909, 0, 0, 'HN014', NULL, '黑色 XL', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (942, 1285730382223, 415140360909, 0, 0, 'HN014', NULL, '宝蓝色 2XL', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (943, 1285730382213, 415140360909, 0, 0, 'HN014', NULL, '黑色 2XL', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (944, 1285730382216, 415140360909, 0, 0, 'HN014', NULL, '浅蓝色 L', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (945, 1285730382214, 415140360909, 0, 0, 'HN014', NULL, '浅蓝色 S', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (946, 1285730382221, 415140360909, 0, 0, 'HN014', NULL, '宝蓝色 L', 49, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (947, 1285730382217, 415140360909, 0, 0, 'HN014', NULL, '浅蓝色 XL', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (948, 1285730382210, 415140360909, 0, 0, 'HN014', NULL, '黑色 M', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (949, 1285730382222, 415140360909, 0, 0, 'HN014', NULL, '宝蓝色 XL', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (950, 1285730382220, 415140360909, 0, 0, 'HN014', NULL, '宝蓝色 M', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (951, 1285730382218, 415140360909, 0, 0, 'HN014', NULL, '浅蓝色 2XL', 50, 'HN014', 'HN014', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (952, 1285863953219, 415209134293, 0, 0, '', NULL, '白色 均码', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (953, 1285863953220, 415209134293, 0, 0, '', NULL, '黑色 均码', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (954, 1285863953221, 415209134293, 0, 0, '', NULL, '粉红色 均码', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (955, 1285863953222, 415209134293, 0, 0, '', NULL, '杏色 均码', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (956, 1285863953223, 415209134293, 0, 0, '', NULL, '浅蓝色 均码', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (957, 1292679844924, 418749496896, 0, 0, 'JKL805', NULL, '深蓝色长款 2XL', 49, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (958, 1292679844920, 418749496896, 0, 0, 'JKL805', NULL, '深蓝色长款 S', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (959, 1292679844926, 418749496896, 729, 47, 'JKL805', NULL, '蓝色 S', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (960, 1292679844929, 418749496896, 0, 0, 'JKL805', NULL, '蓝色 XL', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (961, 1292679844927, 418749496896, 0, 0, 'JKL805', NULL, '蓝色 M', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (962, 1292679844919, 418749496896, 0, 0, 'JKL805', NULL, '深蓝色长款 XS', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (963, 1292679844921, 418749496896, 0, 0, 'JKL805', NULL, '深蓝色长款 M', 49, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (964, 1292679844922, 418749496896, 0, 0, 'JKL805', NULL, '深蓝色长款 L', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (965, 1292679844923, 418749496896, 0, 0, 'JKL805', NULL, '深蓝色长款 XL', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (966, 1292679844930, 418749496896, 0, 0, 'JKL805', NULL, '蓝色 2XL', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (967, 1292679844928, 418749496896, 0, 0, 'JKL805', NULL, '蓝色 L', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (968, 1292679844925, 418749496896, 729, 47, 'JKL805', NULL, '蓝色 XS', 50, 'JKL805', 'JKL805', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (969, 1296578397962, 421025454368, 0, 0, 'JKL8990', NULL, '蓝色 M', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (970, 1296578397963, 421025454368, 0, 0, 'JKL8990', NULL, '蓝色 L', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (971, 1296578397967, 421025454368, 0, 0, 'JKL8990', NULL, '黑色 S', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (972, 1296578397965, 421025454368, 0, 0, 'JKL8990', NULL, '蓝色 2XL', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (973, 1296578397964, 421025454368, 0, 0, 'JKL8990', NULL, '蓝色 XL', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (974, 1296578397968, 421025454368, 0, 0, 'JKL8990', NULL, '黑色 M', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (975, 1296578397960, 421025454368, 0, 0, 'JKL8990', NULL, '蓝色 XS', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (976, 1296578397961, 421025454368, 0, 0, 'JKL8990', NULL, '蓝色 S', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (977, 1296578397970, 421025454368, 0, 0, 'JKL8990', NULL, '黑色 XL', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (978, 1296578397969, 421025454368, 0, 0, 'JKL8990', NULL, '黑色 L', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (979, 1296578397966, 421025454368, 0, 0, 'JKL8990', NULL, '黑色 XS', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (980, 1296578397971, 421025454368, 0, 0, 'JKL8990', NULL, '黑色 2XL', 50, 'JKL8990', 'JKL8990', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (981, 1296587850812, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色加绒 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (982, 1296587850789, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (983, 1296587850799, 421031955741, 0, 0, 'HN0801', NULL, '杏色 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (984, 1296587850814, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色加绒 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (985, 1296587850813, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色加绒 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (986, 1296587850816, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝加绒 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (987, 1296587850800, 421031955741, 0, 0, 'HN0801', NULL, '杏色 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (988, 1296587850809, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色加绒 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (989, 1296587850771, 421031955741, 0, 0, 'HN0801', NULL, '黑色 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (990, 1296587850773, 421031955741, 0, 0, 'HN0801', NULL, '黑色 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (991, 1296587850804, 421031955741, 0, 0, 'HN0801', NULL, '黑色加绒 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (992, 1296587850803, 421031955741, 0, 0, 'HN0801', NULL, '黑色加绒 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (993, 1296587850784, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (994, 1296587850787, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (995, 1296587850815, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色加绒 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (996, 1296587850808, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色加绒 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (997, 1296587850791, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (998, 1296587850802, 421031955741, 0, 0, 'HN0801', NULL, '黑色加绒 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (999, 1296587850774, 421031955741, 0, 0, 'HN0801', NULL, '黑色 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1000, 1296587850817, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝加绒 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1001, 1296587850776, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1002, 1296587850823, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色加绒 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1003, 1296587850775, 421031955741, 0, 0, 'HN0801', NULL, '黑色 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1004, 1296587850782, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1005, 1296587850801, 421031955741, 0, 0, 'HN0801', NULL, '黑色加绒 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1006, 1296587850811, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色加绒 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1007, 1296587850795, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1008, 1296587850820, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝加绒 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1009, 1296587850792, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1010, 1296587850779, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1011, 1296587850783, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1012, 1296587850793, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1013, 1296587850794, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1014, 1296587850818, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝加绒 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1015, 1296587850781, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1016, 1296587850798, 421031955741, 0, 0, 'HN0801', NULL, '杏色 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1017, 1296587850785, 421031955741, 0, 0, 'HN0801', NULL, '蓝灰色 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1018, 1296587850772, 421031955741, 0, 0, 'HN0801', NULL, '黑色 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1019, 1296587850788, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1020, 1296587850790, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1021, 1296587850822, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色加绒 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1022, 1296587850825, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色加绒 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1023, 1296587850810, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色加绒 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1024, 1296587850780, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1025, 1296587850786, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1026, 1296587850777, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1027, 1296587850796, 421031955741, 0, 0, 'HN0801', NULL, '杏色 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1028, 1296587850797, 421031955741, 0, 0, 'HN0801', NULL, '杏色 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1029, 1296587850807, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色加绒 M', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1030, 1296587850778, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色 L', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1031, 1296587850824, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色加绒 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1032, 1296587850806, 421031955741, 0, 0, 'HN0801', NULL, '黑灰色加绒 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1033, 1296587850821, 421031955741, 0, 0, 'HN0801', NULL, '浅蓝色加绒 S', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1034, 1296587850819, 421031955741, 0, 0, 'HN0801', NULL, '复古蓝加绒 XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1035, 1296587850805, 421031955741, 0, 0, 'HN0801', NULL, '黑色加绒 2XL', 50, 'HN0801', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1036, 1297861756228, 410305683990, 0, 0, 'HN0660', NULL, '复古蓝 L', 19, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1037, 1297861756227, 410305683990, 0, 0, 'HN0660', NULL, '复古蓝 M', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1038, 1297861756229, 410305683990, 0, 0, 'HN0660', NULL, '复古蓝 XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1039, 1297861756226, 410305683990, 0, 0, 'HN0660', NULL, '复古蓝 S', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1040, 1297861756230, 410305683990, 0, 0, 'HN0660', NULL, '复古蓝 2XL', 20, 'HN0660', 'HN660', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1041, 1297847604596, 412120506598, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 M', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1042, 1297847604597, 412120506598, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 L', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1043, 1297847604601, 412120506598, 0, 0, 'HN0801J', NULL, '复古蓝加绒 M', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1044, 1297847604587, 412120506598, 0, 0, 'HN0801J', NULL, '黑色加绒 L', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1045, 1297848305476, 412120506598, 0, 0, 'HN0801X', NULL, '杏色 L', 1050, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1046, 1297847604603, 412120506598, 0, 0, 'HN0801J', NULL, '复古蓝加绒 XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1047, 1297847604586, 412120506598, 0, 0, 'HN0801J', NULL, '黑色加绒 M', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1048, 1297848305469, 412120506598, 0, 0, 'HN0801Q', NULL, '浅蓝色 S', 1050, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1049, 1297847604595, 412120506598, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 S', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1050, 1297848305474, 412120506598, 0, 0, 'HN0801X', NULL, '杏色 S', 1050, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1051, 1297847604591, 412120506598, 0, 0, 'HN0801J', NULL, '黑灰色加绒 M', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1052, 1297847604604, 412120506598, 0, 0, 'HN0801J', NULL, '复古蓝加绒 2XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1053, 1297847604608, 412120506598, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1054, 1297848305475, 412120506598, 0, 0, 'HN0801X', NULL, '杏色 M', 1050, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1055, 1297847604606, 412120506598, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 M', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1056, 1297848305478, 412120506598, 0, 0, 'HN0801X', NULL, '杏色 2XL', 1050, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1057, 1297847604609, 412120506598, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 2XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1058, 1297847604599, 412120506598, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 2XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1059, 1297847604607, 412120506598, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 L', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1060, 1297847604593, 412120506598, 0, 0, 'HN0801J', NULL, '黑灰色加绒 XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1061, 1297848305471, 412120506598, 0, 0, 'HN0801Q', NULL, '浅蓝色 L', 1050, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1062, 1297847604590, 412120506598, 0, 0, 'HN0801J', NULL, '黑灰色加绒 S', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1063, 1297847604600, 412120506598, 0, 0, 'HN0801J', NULL, '复古蓝加绒 S', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1064, 1297847604585, 412120506598, 0, 0, 'HN0801J', NULL, '黑色加绒 S', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1065, 1297847604592, 412120506598, 0, 0, 'HN0801J', NULL, '黑灰色加绒 L', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1066, 1297848305472, 412120506598, 0, 0, 'HN0801Q', NULL, '浅蓝色 XL', 1050, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1067, 1297847604605, 412120506598, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 S', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1068, 1297847604589, 412120506598, 0, 0, 'HN0801J', NULL, '黑色加绒 2XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1069, 1297847604602, 412120506598, 0, 0, 'HN0801J', NULL, '复古蓝加绒 L', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1070, 1297847604598, 412120506598, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1071, 1297848305470, 412120506598, 0, 0, 'HN0801Q', NULL, '浅蓝色 M', 1050, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1072, 1297847604588, 412120506598, 0, 0, 'HN0801J', NULL, '黑色加绒 XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1073, 1297847604594, 412120506598, 0, 0, 'HN0801J', NULL, '黑灰色加绒 2XL', 1050, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1074, 1297848305473, 412120506598, 0, 0, 'HN0801Q', NULL, '浅蓝色 2XL', 1050, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1075, 1297848305477, 412120506598, 0, 0, 'HN0801X', NULL, '杏色 XL', 1050, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1076, 1297849667188, 421771728900, 495, 33, 'HN08017501', NULL, '蓝灰色 S', 50, 'HN08017501', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1077, 1297849667191, 421771728900, 498, 33, 'HN08017504', NULL, '蓝灰色 XL', 50, 'HN08017504', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1078, 1297849667222, 421771728900, 0, 0, 'HN0801J', NULL, '复古蓝加绒 2XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1079, 1297849667178, 421771728900, 495, 33, 'HN08017501', NULL, '黑灰色 S', 50, 'HN08017501', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1080, 1297849667206, 421771728900, 0, 0, 'HN0801J', NULL, '黑色加绒 XL', 49, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1081, 1297849667189, 421771728900, 496, 33, 'HN08017502', NULL, '蓝灰色 M', 50, 'HN08017502', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1082, 1297849667180, 421771728900, 497, 33, 'HN08017503', NULL, '黑灰色 L', 50, 'HN08017503', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1083, 1297849667214, 421771728900, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 M', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1084, 1297849667216, 421771728900, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1085, 1297849667207, 421771728900, 0, 0, 'HN0801J', NULL, '黑色加绒 2XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1086, 1297849667187, 421771728900, 509, 33, 'HN08014005', NULL, '复古蓝 2XL', 50, 'HN08014005', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1087, 1297849667210, 421771728900, 0, 0, 'HN0801J', NULL, '黑灰色加绒 L', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1088, 1297849667209, 421771728900, 0, 0, 'HN0801J', NULL, '黑灰色加绒 M', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1089, 1297849667205, 421771728900, 0, 0, 'HN0801J', NULL, '黑色加绒 L', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1090, 1297849667215, 421771728900, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 L', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1091, 1297849667220, 421771728900, 0, 0, 'HN0801J', NULL, '复古蓝加绒 L', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1092, 1297849667225, 421771728900, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 L', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1093, 1297849667182, 421771728900, 499, 33, 'HN08017505', NULL, '黑灰色 2XL', 50, 'HN08017505', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1094, 1297849667196, 421771728900, 0, 0, 'HN0801Q', NULL, '浅蓝色 XL', 50, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1095, 1297849667193, 421771728900, 0, 0, 'HN0801Q', NULL, '浅蓝色 S', 50, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1096, 1297849667226, 421771728900, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1097, 1297849667190, 421771728900, 497, 33, 'HN08017503', NULL, '蓝灰色 L', 50, 'HN08017503', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1098, 1297849667203, 421771728900, 0, 0, 'HN0801J', NULL, '黑色加绒 S', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1099, 1297849667212, 421771728900, 0, 0, 'HN0801J', NULL, '黑灰色加绒 2XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1100, 1297849667221, 421771728900, 0, 0, 'HN0801J', NULL, '复古蓝加绒 XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1101, 1297849667174, 421771728900, 491, 33, 'HN08010102', NULL, '黑色 M', 50, 'HN08010102', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1102, 1297849667183, 421771728900, 505, 33, 'HN08014001', NULL, '复古蓝 S', 50, 'HN08014001', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1103, 1297849667204, 421771728900, 0, 0, 'HN0801J', NULL, '黑色加绒 M', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1104, 1297849667198, 421771728900, 0, 0, 'HN0801X', NULL, '杏色 S', 50, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1105, 1297849667227, 421771728900, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 2XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1106, 1297849667179, 421771728900, 496, 33, 'HN08017502', NULL, '黑灰色 M', 50, 'HN08017502', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1107, 1297849667181, 421771728900, 498, 33, 'HN08017504', NULL, '黑灰色 XL', 50, 'HN08017504', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1108, 1297849667217, 421771728900, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 2XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1109, 1297849667219, 421771728900, 0, 0, 'HN0801J', NULL, '复古蓝加绒 M', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1110, 1297849667224, 421771728900, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 M', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1111, 1297849667199, 421771728900, 0, 0, 'HN0801X', NULL, '杏色 M', 50, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1112, 1297849667176, 421771728900, 493, 33, 'HN08010104', NULL, '黑色 XL', 50, 'HN08010104', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1113, 1297849667200, 421771728900, 0, 0, 'HN0801X', NULL, '杏色 L', 50, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1114, 1297849667186, 421771728900, 508, 33, 'HN08014004', NULL, '复古蓝 XL', 50, 'HN08014004', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1115, 1297849667218, 421771728900, 0, 0, 'HN0801J', NULL, '复古蓝加绒 S', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1116, 1297849667208, 421771728900, 0, 0, 'HN0801J', NULL, '黑灰色加绒 S', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1117, 1297849667213, 421771728900, 0, 0, 'HN0801J', NULL, '蓝灰色加绒 S', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1118, 1297849667184, 421771728900, 506, 33, 'HN08014002', NULL, '复古蓝 M', 50, 'HN08014002', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1119, 1297849667194, 421771728900, 0, 0, 'HN0801Q', NULL, '浅蓝色 M', 50, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1120, 1297849667223, 421771728900, 0, 0, 'HN0801J', NULL, '浅蓝色加绒 S', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1121, 1297849667173, 421771728900, 490, 33, 'HN08010101', NULL, '黑色 S', 50, 'HN08010101', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1122, 1297849667175, 421771728900, 492, 33, 'HN08010103', NULL, '黑色 L', 50, 'HN08010103', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1123, 1297849667177, 421771728900, 494, 33, 'HN08010105', NULL, '黑色 2XL', 50, 'HN08010105', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1124, 1297849667201, 421771728900, 0, 0, 'HN0801X', NULL, '杏色 XL', 50, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1125, 1297849667195, 421771728900, 0, 0, 'HN0801Q', NULL, '浅蓝色 L', 50, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1126, 1297849667197, 421771728900, 0, 0, 'HN0801Q', NULL, '浅蓝色 2XL', 50, 'HN0801Q', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1127, 1297849667202, 421771728900, 0, 0, 'HN0801X', NULL, '杏色 2XL', 50, 'HN0801X', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1128, 1297849667185, 421771728900, 507, 33, 'HN08014003', NULL, '复古蓝 L', 50, 'HN08014003', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1129, 1297849667211, 421771728900, 0, 0, 'HN0801J', NULL, '黑灰色加绒 XL', 50, 'HN0801J', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1130, 1297849667192, 421771728900, 499, 33, 'HN08017505', NULL, '蓝灰色 2XL', 50, 'HN08017505', 'HN0801', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1131, 1300815075470, 394814708558, 0, 0, '', NULL, '蓝灰色 2XL', 100, '', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1132, 1300815075468, 394814708558, 0, 0, '', NULL, '蓝灰色 L', 100, '', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1133, 1300815075466, 394814708558, 0, 0, '', NULL, '蓝灰色 S', 100, '', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1134, 1300815075467, 394814708558, 0, 0, '', NULL, '蓝灰色 M', 100, '', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1135, 1300815075469, 394814708558, 0, 0, '', NULL, '蓝灰色 XL', 100, '', 'HN0681', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1136, 1300789840464, 395429166799, 0, 0, '', NULL, '黑色 M（27-28码95-105斤）', 100, '', 'HN661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1137, 1300789840465, 395429166799, 0, 0, '', NULL, '黑色 L（29码105-115斤）', 100, '', 'HN661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1138, 1300789840467, 395429166799, 0, 0, '', NULL, '黑色 2XL（31码125-135斤）', 100, '', 'HN661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1139, 1300789840466, 395429166799, 0, 0, '', NULL, '黑色 XL（30码115-125斤）', 100, '', 'HN661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1140, 1300789840463, 395429166799, 0, 0, '', NULL, '黑色 S（25-26码95斤以内）', 100, '', 'HN661', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1141, 1298984457787, 422383287651, 286, 22, 'HN202200200327', NULL, '浅蓝色 27', 500, 'HN202200200327', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1142, 1298984457817, 422383287651, 800, 22, 'HN2022002015025', NULL, '浅蓝色加绒 25', 500, 'HN2022002015025', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1143, 1298984457815, 422383287651, 798, 22, 'HN2022002012931', NULL, '蓝灰色加绒 31', 500, 'HN2022002012931', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1144, 1298984457822, 422383287651, 805, 22, 'HN2022002015030', NULL, '浅蓝色加绒 30', 500, 'HN2022002015030', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1145, 1298984457792, 422383287651, 291, 22, 'HN202200200332', NULL, '浅蓝色 32', 500, 'HN202200200332', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1146, 1298984457813, 422383287651, 796, 22, 'HN2022002012929', NULL, '蓝灰色加绒 29', 500, 'HN2022002012929', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1147, 1298984457764, 422383287651, 271, 22, 'HN202200200128', NULL, '黑色 28', 500, 'HN202200200128', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1148, 1298984457801, 422383287651, 784, 22, 'HN2022002017525', NULL, '黑灰色加绒 25', 500, 'HN2022002017525', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1149, 1298984457790, 422383287651, 289, 22, 'HN202200200330', NULL, '浅蓝色 30', 500, 'HN202200200330', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1150, 1298984457802, 422383287651, 785, 22, 'HN2022002017526', NULL, '黑灰色加绒 26', 500, 'HN2022002017526', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1151, 1298984457782, 422383287651, 297, 22, 'HN202200200430', NULL, '蓝灰色 30', 500, 'HN202200200430', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1152, 1298984457781, 422383287651, 296, 22, 'HN202200200429', NULL, '蓝灰色 29', 500, 'HN202200200429', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1153, 1298984457803, 422383287651, 786, 22, 'HN2022002017527', NULL, '黑灰色加绒 27', 500, 'HN2022002017527', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1154, 1298984457768, 422383287651, 275, 22, 'HN202200200132', NULL, '黑色 32', 500, 'HN202200200132', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1155, 1298984457779, 422383287651, 294, 22, 'HN202200200427', NULL, '蓝灰色 27', 500, 'HN202200200427', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1156, 1298984457769, 422383287651, 276, 22, 'HN202200200225', NULL, '黑灰色 25', 500, 'HN202200200225', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1157, 1298984457809, 422383287651, 792, 22, 'HN2022002012925', NULL, '蓝灰色加绒 25', 500, 'HN2022002012925', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1158, 1298984457772, 422383287651, 279, 22, 'HN202200200228', NULL, '黑灰色 28', 500, 'HN202200200228', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1159, 1298984457814, 422383287651, 797, 22, 'HN2022002012930', NULL, '蓝灰色加绒 30', 500, 'HN2022002012930', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1160, 1298984457771, 422383287651, 278, 22, 'HN202200200227', NULL, '黑灰色 27', 500, 'HN202200200227', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1161, 1298984457773, 422383287651, 280, 22, 'HN202200200229', NULL, '黑灰色 29', 500, 'HN202200200229', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1162, 1298984457793, 422383287651, 776, 22, 'HN2022002010125', NULL, '黑色加绒 25', 500, 'HN2022002010125', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1163, 1298984457798, 422383287651, 781, 22, 'HN2022002010130', NULL, '黑色加绒 30', 500, 'HN2022002010130', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1164, 1298984457794, 422383287651, 777, 22, 'HN2022002010126', NULL, '黑色加绒 26', 500, 'HN2022002010126', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1165, 1298984457811, 422383287651, 794, 22, 'HN2022002012927', NULL, '蓝灰色加绒 27', 500, 'HN2022002012927', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1166, 1298984457786, 422383287651, 285, 22, 'HN202200200326', NULL, '浅蓝色 26', 500, 'HN202200200326', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1167, 1298984457800, 422383287651, 783, 22, 'HN2022002010132', NULL, '黑色加绒 32', 500, 'HN2022002010132', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1168, 1298984457788, 422383287651, 287, 22, 'HN202200200328', NULL, '浅蓝色 28', 500, 'HN202200200328', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1169, 1298984457761, 422383287651, 268, 22, 'HN202200200125', NULL, '黑色 25', 500, 'HN202200200125', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1170, 1298984457805, 422383287651, 788, 22, 'HN2022002017529', NULL, '黑灰色加绒 29', 500, 'HN2022002017529', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1171, 1298984457780, 422383287651, 295, 22, 'HN202200200428', NULL, '蓝灰色 28', 500, 'HN202200200428', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1172, 1298984457778, 422383287651, 293, 22, 'HN202200200426', NULL, '蓝灰色 26', 500, 'HN202200200426', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1173, 1298984457765, 422383287651, 272, 22, 'HN202200200129', NULL, '黑色 29', 500, 'HN202200200129', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1174, 1298984457791, 422383287651, 290, 22, 'HN202200200331', NULL, '浅蓝色 31', 500, 'HN202200200331', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1175, 1298984457789, 422383287651, 288, 22, 'HN202200200329', NULL, '浅蓝色 29', 500, 'HN202200200329', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1176, 1298984457795, 422383287651, 778, 22, 'HN2022002010127', NULL, '黑色加绒 27', 500, 'HN2022002010127', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1177, 1298984457796, 422383287651, 779, 22, 'HN2022002010128', NULL, '黑色加绒 28', 500, 'HN2022002010128', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1178, 1298984457804, 422383287651, 787, 22, 'HN2022002017528', NULL, '黑灰色加绒 28', 500, 'HN2022002017528', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1179, 1298984457820, 422383287651, 803, 22, 'HN2022002015028', NULL, '浅蓝色加绒 28', 500, 'HN2022002015028', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1180, 1298984457816, 422383287651, 799, 22, 'HN2022002012932', NULL, '蓝灰色加绒 32', 500, 'HN2022002012932', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1181, 1298984457824, 422383287651, 807, 22, 'HN2022002015032', NULL, '浅蓝色加绒 32', 500, 'HN2022002015032', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1182, 1298984457808, 422383287651, 791, 22, 'HN2022002017532', NULL, '黑灰色加绒 32', 500, 'HN2022002017532', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1183, 1298984457766, 422383287651, 273, 22, 'HN202200200130', NULL, '黑色 30', 500, 'HN202200200130', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1184, 1298984457774, 422383287651, 281, 22, 'HN202200200230', NULL, '黑灰色 30', 500, 'HN202200200230', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1185, 1298984457783, 422383287651, 298, 22, 'HN202200200431', NULL, '蓝灰色 31', 500, 'HN202200200431', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1186, 1298984457819, 422383287651, 802, 22, 'HN2022002015027', NULL, '浅蓝色加绒 27', 500, 'HN2022002015027', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1187, 1298984457823, 422383287651, 806, 22, 'HN2022002015031', NULL, '浅蓝色加绒 31', 500, 'HN2022002015031', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1188, 1298984457806, 422383287651, 789, 22, 'HN2022002017530', NULL, '黑灰色加绒 30', 500, 'HN2022002017530', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1189, 1298984457775, 422383287651, 282, 22, 'HN202200200231', NULL, '黑灰色 31', 500, 'HN202200200231', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1190, 1298984457797, 422383287651, 780, 22, 'HN2022002010129', NULL, '黑色加绒 29', 499, 'HN2022002010129', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1191, 1298984457777, 422383287651, 292, 22, 'HN202200200425', NULL, '蓝灰色 25', 500, 'HN202200200425', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1192, 1298984457810, 422383287651, 793, 22, 'HN2022002012926', NULL, '蓝灰色加绒 26', 500, 'HN2022002012926', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1193, 1298984457767, 422383287651, 274, 22, 'HN202200200131', NULL, '黑色 31', 500, 'HN202200200131', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1194, 1298984457812, 422383287651, 795, 22, 'HN2022002012928', NULL, '蓝灰色加绒 28', 500, 'HN2022002012928', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1195, 1298984457763, 422383287651, 270, 22, 'HN202200200127', NULL, '黑色 27', 500, 'HN202200200127', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1196, 1298984457762, 422383287651, 269, 22, 'HN202200200126', NULL, '黑色 26', 500, 'HN202200200126', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1197, 1298984457776, 422383287651, 283, 22, 'HN202200200232', NULL, '黑灰色 32', 500, 'HN202200200232', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1198, 1298984457785, 422383287651, 284, 22, 'HN202200200325', NULL, '浅蓝色 25', 500, 'HN202200200325', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1199, 1298984457799, 422383287651, 782, 22, 'HN2022002010131', NULL, '黑色加绒 31', 500, 'HN2022002010131', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1200, 1298984457770, 422383287651, 277, 22, 'HN202200200226', NULL, '黑灰色 26', 500, 'HN202200200226', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1201, 1298984457807, 422383287651, 790, 22, 'HN2022002017531', NULL, '黑灰色加绒 31', 500, 'HN2022002017531', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1202, 1298984457821, 422383287651, 804, 22, 'HN2022002015029', NULL, '浅蓝色加绒 29', 500, 'HN2022002015029', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1203, 1298984457818, 422383287651, 801, 22, 'HN2022002015026', NULL, '浅蓝色加绒 26', 500, 'HN2022002015026', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1204, 1298984457784, 422383287651, 299, 22, 'HN202200200435', NULL, '蓝灰色 32', 500, 'HN202200200435', 'HN20220020', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1205, 1299097648611, 422437259657, 809, 48, 'HN1805002', NULL, '浅蓝色 M', 100, 'HN1805002', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1206, 1299097648610, 422437259657, 808, 48, 'HN1805001', NULL, '浅蓝色 S', 100, 'HN1805001', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1207, 1299097648614, 422437259657, 812, 48, 'HN1805005', NULL, '浅蓝色 2XL', 100, 'HN1805005', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1208, 1299097648613, 422437259657, 811, 48, 'HN1805004', NULL, '浅蓝色 XL', 100, 'HN1805004', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1209, 1299097648612, 422437259657, 810, 48, 'HN1805003', NULL, '浅蓝色 L', 100, 'HN1805003', 'HN180', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1210, 1299618145899, 422742565233, 0, 0, 'HN665', NULL, '黑色 M', 50, 'HN665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1211, 1299618145902, 422742565233, 0, 0, 'HN665', NULL, '黑色 S', 50, 'HN665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1212, 1299618145898, 422742565233, 0, 0, 'HN665', NULL, '黑色 2XL', 50, 'HN665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1213, 1299618145900, 422742565233, 0, 0, 'HN665', NULL, '黑色 XL', 50, 'HN665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1214, 1299618145901, 422742565233, 0, 0, 'HN665', NULL, '黑色 L', 50, 'HN665', 'HN665', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1215, 1299618998188, 422744325067, 0, 0, '', NULL, '黑色 M', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1216, 1299618998187, 422744325067, 0, 0, '', NULL, '黑色 S', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1217, 1299618998189, 422744325067, 0, 0, '', NULL, '黑色 L', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1218, 1299618998185, 422744325067, 0, 0, '', NULL, '蓝色 M', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1219, 1299618998186, 422744325067, 0, 0, '', NULL, '蓝色 L', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1220, 1299618998184, 422744325067, 0, 0, '', NULL, '蓝色 S', 100, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1221, 1300536155526, 423260246680, 0, 0, '', NULL, '烟灰色 27', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1222, 1300536155554, 423260246680, 0, 0, '', NULL, '烟灰色加绒 27', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1223, 1300536155519, 423260246680, 0, 0, '', NULL, '黑色 27', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1224, 1300536155537, 423260246680, 0, 0, '', NULL, '蓝灰色 31', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1225, 1300536155525, 423260246680, 0, 0, '', NULL, '烟灰色 26', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1226, 1300536155518, 423260246680, 0, 0, '', NULL, '黑色 26', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1227, 1300536155563, 423260246680, 0, 0, '', NULL, '蓝灰色加绒 29', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1228, 1300536155528, 423260246680, 0, 0, '', NULL, '烟灰色 29', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1229, 1300536155552, 423260246680, 0, 0, '', NULL, '黑色加绒 32', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1230, 1300536155549, 423260246680, 0, 0, '', NULL, '黑色加绒 29', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1231, 1300536155541, 423260246680, 0, 0, '', NULL, '浅蓝色 28', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1232, 1300536155543, 423260246680, 0, 0, '', NULL, '浅蓝色 30', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1233, 1300536155567, 423260246680, 0, 0, '', NULL, '浅蓝色加绒 26', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1234, 1300536155550, 423260246680, 0, 0, '', NULL, '黑色加绒 30', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1235, 1300536155559, 423260246680, 0, 0, '', NULL, '烟灰色加绒 32', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1236, 1300536155530, 423260246680, 0, 0, '', NULL, '烟灰色 31', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1237, 1300536155531, 423260246680, 0, 0, '', NULL, '烟灰色 32', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1238, 1300536155547, 423260246680, 0, 0, '', NULL, '黑色加绒 27', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1239, 1300536155522, 423260246680, 0, 0, '', NULL, '黑色 30', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1240, 1300536155556, 423260246680, 0, 0, '', NULL, '烟灰色加绒 29', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1241, 1300536155527, 423260246680, 0, 0, '', NULL, '烟灰色 28', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1242, 1300536155571, 423260246680, 0, 0, '', NULL, '浅蓝色加绒 30', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1243, 1300536155538, 423260246680, 0, 0, '', NULL, '蓝灰色 32', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1244, 1300536155566, 423260246680, 0, 0, '', NULL, '蓝灰色加绒 32', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1245, 1300536155570, 423260246680, 0, 0, '', NULL, '浅蓝色加绒 29', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1246, 1300536155521, 423260246680, 0, 0, '', NULL, '黑色 29', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1247, 1300536155564, 423260246680, 0, 0, '', NULL, '蓝灰色加绒 30', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1248, 1300536155539, 423260246680, 0, 0, '', NULL, '浅蓝色 26', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1249, 1300536155544, 423260246680, 0, 0, '', NULL, '浅蓝色 31', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1250, 1300536155562, 423260246680, 0, 0, '', NULL, '蓝灰色加绒 28', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1251, 1300536155524, 423260246680, 0, 0, '', NULL, '黑色 32', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1252, 1300536155557, 423260246680, 0, 0, '', NULL, '烟灰色加绒 30', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1253, 1300536155529, 423260246680, 0, 0, '', NULL, '烟灰色 30', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1254, 1300536155573, 423260246680, 0, 0, '', NULL, '浅蓝色加绒 32', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1255, 1300536155523, 423260246680, 0, 0, '', NULL, '黑色 31', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1256, 1300536155535, 423260246680, 0, 0, '', NULL, '蓝灰色 29', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1257, 1300536155520, 423260246680, 0, 0, '', NULL, '黑色 28', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1258, 1300536155555, 423260246680, 0, 0, '', NULL, '烟灰色加绒 28', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1259, 1300536155540, 423260246680, 0, 0, '', NULL, '浅蓝色 27', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1260, 1300536155551, 423260246680, 0, 0, '', NULL, '黑色加绒 31', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1261, 1300536155572, 423260246680, 0, 0, '', NULL, '浅蓝色加绒 31', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1262, 1300536155561, 423260246680, 0, 0, '', NULL, '蓝灰色加绒 27', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1263, 1300536155560, 423260246680, 0, 0, '', NULL, '蓝灰色加绒 26', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1264, 1300536155545, 423260246680, 0, 0, '', NULL, '浅蓝色 32', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1265, 1300536155569, 423260246680, 0, 0, '', NULL, '浅蓝色加绒 28', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1266, 1300536155533, 423260246680, 0, 0, '', NULL, '蓝灰色 27', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1267, 1300536155558, 423260246680, 0, 0, '', NULL, '烟灰色加绒 31', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1268, 1300536155534, 423260246680, 0, 0, '', NULL, '蓝灰色 28', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1269, 1300536155546, 423260246680, 0, 0, '', NULL, '黑色加绒 26', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1270, 1300536155565, 423260246680, 0, 0, '', NULL, '蓝灰色加绒 31', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1271, 1300536155568, 423260246680, 0, 0, '', NULL, '浅蓝色加绒 27', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1272, 1300536155542, 423260246680, 0, 0, '', NULL, '浅蓝色 29', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1273, 1300536155553, 423260246680, 0, 0, '', NULL, '烟灰色加绒 26', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1274, 1300536155532, 423260246680, 0, 0, '', NULL, '蓝灰色 26', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1275, 1300536155536, 423260246680, 0, 0, '', NULL, '蓝灰色 30', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1276, 1300536155548, 423260246680, 0, 0, '', NULL, '黑色加绒 28', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1277, 1300835762157, 423441709778, 0, 0, '', NULL, '米黄 XL', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1278, 1300835762149, 423441709778, 0, 0, '', NULL, '黑色 XL', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1279, 1300835762148, 423441709778, 0, 0, '', NULL, '黑色 L', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1280, 1300835762164, 423441709778, 0, 0, '', NULL, '青草色 L', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1281, 1300835762167, 423441709778, 0, 0, '', NULL, '天空蓝 M', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1282, 1300835762165, 423441709778, 0, 0, '', NULL, '青草色 XL', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1283, 1300835762154, 423441709778, 0, 0, '', NULL, '米黄 S', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1284, 1300835762151, 423441709778, 0, 0, '', NULL, '粉红色 M', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1285, 1300835762147, 423441709778, 0, 0, '', NULL, '黑色 M', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1286, 1300835762150, 423441709778, 0, 0, '', NULL, '粉红色 S', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1287, 1300835762152, 423441709778, 0, 0, '', NULL, '粉红色 L', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1288, 1300835762169, 423441709778, 0, 0, '', NULL, '天空蓝 XL', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1289, 1300835762162, 423441709778, 0, 0, '', NULL, '青草色 S', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1290, 1300835762158, 423441709778, 0, 0, '', NULL, '紫色 S', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1291, 1300835762160, 423441709778, 0, 0, '', NULL, '紫色 L', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1292, 1300835762146, 423441709778, 0, 0, '', NULL, '黑色 S', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1293, 1300835762166, 423441709778, 0, 0, '', NULL, '天空蓝 S', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1294, 1300835762163, 423441709778, 0, 0, '', NULL, '青草色 M', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1295, 1300835762155, 423441709778, 0, 0, '', NULL, '米黄 M', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1296, 1300835762159, 423441709778, 0, 0, '', NULL, '紫色 M', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1297, 1300835762156, 423441709778, 0, 0, '', NULL, '米黄 L', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1298, 1300835762161, 423441709778, 0, 0, '', NULL, '紫色 XL', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1299, 1300835762153, 423441709778, 0, 0, '', NULL, '粉红色 XL', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1300, 1300835762168, 423441709778, 0, 0, '', NULL, '天空蓝 L', 50, '', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1301, 1300918958614, 423486862283, 0, 0, 'HN0804', NULL, '蓝色 M', 50, 'HN0804', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1302, 1300918958616, 423486862283, 0, 0, 'HN0804', NULL, '蓝色 XL', 50, 'HN0804', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1303, 1300918958617, 423486862283, 0, 0, 'HN0804', NULL, '蓝色 2XL', 50, 'HN0804', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1304, 1300918958615, 423486862283, 0, 0, 'HN0804', NULL, '蓝色 L', 50, 'HN0804', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1305, 1300918958613, 423486862283, 0, 0, 'HN0804', NULL, '蓝色 S', 50, 'HN0804', '', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1306, 1300930893642, 423492956829, 0, 0, 'HN683', NULL, '复古蓝 XL', 50, 'HN683', 'HN683', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1307, 1300930893639, 423492956829, 0, 0, 'HN683', NULL, '复古蓝 S', 50, 'HN683', 'HN683', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1308, 1300930893640, 423492956829, 0, 0, 'HN683', NULL, '复古蓝 M', 50, 'HN683', 'HN683', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1309, 1300930893641, 423492956829, 0, 0, 'HN683', NULL, '复古蓝 L', 50, 'HN683', 'HN683', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1310, 1300930893643, 423492956829, 0, 0, 'HN683', NULL, '复古蓝 2XL', 50, 'HN683', 'HN683', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1311, 1300950070710, 423502402446, 0, 0, 'HN0802', NULL, '黑色 L', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1312, 1300950070713, 423502402446, 0, 0, 'HN0802', NULL, '黑灰色 S', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1313, 1300950070721, 423502402446, 0, 0, 'HN0802', NULL, '复古蓝 XL', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1314, 1300950070727, 423502402446, 0, 0, 'HN0802', NULL, '蓝灰色 2XL', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1315, 1300950070708, 423502402446, 0, 0, 'HN0802', NULL, '黑色 S', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1316, 1300950070723, 423502402446, 0, 0, 'HN0802', NULL, '蓝灰色 S', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1317, 1300950070709, 423502402446, 0, 0, 'HN0802', NULL, '黑色 M', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1318, 1300950070726, 423502402446, 0, 0, 'HN0802', NULL, '蓝灰色 XL', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1319, 1300950070724, 423502402446, 0, 0, 'HN0802', NULL, '蓝灰色 M', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1320, 1300950070712, 423502402446, 0, 0, 'HN0802', NULL, '黑色 2XL', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1321, 1300950070718, 423502402446, 0, 0, 'HN0802', NULL, '复古蓝 S', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1322, 1300950070719, 423502402446, 0, 0, 'HN0802', NULL, '复古蓝 M', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1323, 1300950070717, 423502402446, 0, 0, 'HN0802', NULL, '黑灰色 2XL', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1324, 1300950070725, 423502402446, 0, 0, 'HN0802', NULL, '蓝灰色 L', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1325, 1300950070711, 423502402446, 0, 0, 'HN0802', NULL, '黑色 XL', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1326, 1300950070720, 423502402446, 0, 0, 'HN0802', NULL, '复古蓝 L', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1327, 1300950070722, 423502402446, 0, 0, 'HN0802', NULL, '复古蓝 2XL', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1328, 1300950070714, 423502402446, 0, 0, 'HN0802', NULL, '黑灰色 M', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1329, 1300950070715, 423502402446, 0, 0, 'HN0802', NULL, '黑灰色 L', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1330, 1300950070716, 423502402446, 0, 0, 'HN0802', NULL, '黑灰色 XL', 100, 'HN0802', 'HN0802', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1331, 1301302432802, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1332, 1301302432705, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1333, 1301302432748, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1334, 1301302432781, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1335, 1301302432779, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1336, 1301302432699, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1337, 1301302432769, 423703312591, 0, 0, 'JKL333', NULL, '灰色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1338, 1301302432727, 423703312591, 0, 0, 'JKL333', NULL, '白色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1339, 1301302432741, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1340, 1301302432776, 423703312591, 0, 0, 'JKL333', NULL, '灰色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1341, 1301302432719, 423703312591, 0, 0, 'JKL333', NULL, '白色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1342, 1301302432744, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1343, 1301302432754, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1344, 1301302432760, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1345, 1301302432691, 423703312591, 0, 0, 'JKL333', NULL, '红色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1346, 1301302432756, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1347, 1301302432713, 423703312591, 0, 0, 'JKL333', NULL, '黑色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1348, 1301302432740, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1349, 1301302432764, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1350, 1301302432689, 423703312591, 0, 0, 'JKL333', NULL, '红色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1351, 1301302432692, 423703312591, 0, 0, 'JKL333', NULL, '红色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1352, 1301302432758, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1353, 1301302432762, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1354, 1301302432721, 423703312591, 0, 0, 'JKL333', NULL, '白色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1355, 1301302432724, 423703312591, 0, 0, 'JKL333', NULL, '白色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1356, 1301302432706, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1357, 1301302432767, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1358, 1301302432801, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1359, 1301302432785, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1360, 1301302432772, 423703312591, 0, 0, 'JKL333', NULL, '灰色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1361, 1301302432703, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1362, 1301302432759, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1363, 1301302432730, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1364, 1301302432787, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1365, 1301302432729, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1366, 1301302432737, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1367, 1301302432765, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1368, 1301302432788, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1369, 1301302432693, 423703312591, 0, 0, 'JKL333', NULL, '红色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1370, 1301302432804, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1371, 1301302432786, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1372, 1301302432797, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1373, 1301302432690, 423703312591, 0, 0, 'JKL333', NULL, '红色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1374, 1301302432770, 423703312591, 0, 0, 'JKL333', NULL, '灰色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1375, 1301302432778, 423703312591, 0, 0, 'JKL333', NULL, '灰色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1376, 1301302432757, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1377, 1301302432807, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1378, 1301302432704, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1379, 1301302432714, 423703312591, 0, 0, 'JKL333', NULL, '黑色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1380, 1301302432716, 423703312591, 0, 0, 'JKL333', NULL, '黑色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1381, 1301302432782, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1382, 1301302432723, 423703312591, 0, 0, 'JKL333', NULL, '白色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1383, 1301302432796, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1384, 1301302432789, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1385, 1301302432700, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1386, 1301302432694, 423703312591, 0, 0, 'JKL333', NULL, '红色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1387, 1301302432742, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1388, 1301302432777, 423703312591, 0, 0, 'JKL333', NULL, '灰色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1389, 1301302432738, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1390, 1301302432728, 423703312591, 0, 0, 'JKL333', NULL, '白色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1391, 1301302432753, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1392, 1301302432734, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1393, 1301302432749, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1394, 1301302432803, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1395, 1301302432743, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1396, 1301302432768, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1397, 1301302432726, 423703312591, 0, 0, 'JKL333', NULL, '白色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1398, 1301302432695, 423703312591, 0, 0, 'JKL333', NULL, '红色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1399, 1301302432775, 423703312591, 0, 0, 'JKL333', NULL, '灰色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1400, 1301302432793, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1401, 1301302432798, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1402, 1301302432794, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1403, 1301302432799, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1404, 1301302432751, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1405, 1301302432697, 423703312591, 0, 0, 'JKL333', NULL, '红色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1406, 1301302432739, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1407, 1301302432806, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1408, 1301302432792, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1409, 1301302432736, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1410, 1301302432784, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1411, 1301302432712, 423703312591, 0, 0, 'JKL333', NULL, '黑色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1412, 1301302432763, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1413, 1301302432701, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1414, 1301302432710, 423703312591, 0, 0, 'JKL333', NULL, '黑色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1415, 1301302432783, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1416, 1301302432718, 423703312591, 0, 0, 'JKL333', NULL, '黑色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1417, 1301302432707, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1418, 1301302432702, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1419, 1301302432722, 423703312591, 0, 0, 'JKL333', NULL, '白色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1420, 1301302432774, 423703312591, 0, 0, 'JKL333', NULL, '灰色 30', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1421, 1301302432790, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1422, 1301302432750, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1423, 1301302432720, 423703312591, 0, 0, 'JKL333', NULL, '白色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1424, 1301302432711, 423703312591, 0, 0, 'JKL333', NULL, '黑色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1425, 1301302432745, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1426, 1301302432735, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1427, 1301302432747, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1428, 1301302432795, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1429, 1301302432773, 423703312591, 0, 0, 'JKL333', NULL, '灰色 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1430, 1301302432708, 423703312591, 0, 0, 'JKL333', NULL, '酒红色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1431, 1301302432800, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1432, 1301302432791, 423703312591, 0, 0, 'JKL333', NULL, '海军兰 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1433, 1301302432725, 423703312591, 0, 0, 'JKL333', NULL, '白色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1434, 1301302432771, 423703312591, 0, 0, 'JKL333', NULL, '灰色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1435, 1301302432733, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 29', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1436, 1301302432715, 423703312591, 0, 0, 'JKL333', NULL, '黑色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1437, 1301302432698, 423703312591, 0, 0, 'JKL333', NULL, '红色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1438, 1301302432696, 423703312591, 0, 0, 'JKL333', NULL, '红色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1439, 1301302432731, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1440, 1301302432717, 423703312591, 0, 0, 'JKL333', NULL, '黑色 33', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1441, 1301302432761, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 27', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1442, 1301302432755, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1443, 1301302432808, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 34', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1444, 1301302432732, 423703312591, 0, 0, 'JKL333', NULL, '藏蓝 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1445, 1301302432780, 423703312591, 0, 0, 'JKL333', NULL, '宝蓝色 26', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1446, 1301302432766, 423703312591, 0, 0, 'JKL333', NULL, '墨绿色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1447, 1301302432709, 423703312591, 0, 0, 'JKL333', NULL, '黑色 25', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1448, 1301302432746, 423703312591, 0, 0, 'JKL333', NULL, '咖啡色 32', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1449, 1301302432805, 423703312591, 0, 0, 'JKL333', NULL, '卡其色 31', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1450, 1301302432752, 423703312591, 0, 0, 'JKL333', NULL, '深紫色 28', 100, 'JKL333', 'JKL333', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1451, 1301404846098, 423758757026, 0, 0, 'JKL906', NULL, '复古蓝 S', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1452, 1301404846101, 423758757026, 0, 0, 'JKL906', NULL, '复古蓝 XL', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1453, 1301404846099, 423758757026, 0, 0, 'JKL906', NULL, '复古蓝 M', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1454, 1301404846103, 423758757026, 0, 0, 'JKL906', NULL, '浅蓝色 XS', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1455, 1301404846097, 423758757026, 0, 0, 'JKL906', NULL, '复古蓝 XS', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1456, 1301404846104, 423758757026, 0, 0, 'JKL906', NULL, '浅蓝色 S', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1457, 1301404846107, 423758757026, 0, 0, 'JKL906', NULL, '浅蓝色 XL', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1458, 1301404846106, 423758757026, 0, 0, 'JKL906', NULL, '浅蓝色 L', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1459, 1301404846100, 423758757026, 0, 0, 'JKL906', NULL, '复古蓝 L', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1460, 1301404846105, 423758757026, 0, 0, 'JKL906', NULL, '浅蓝色 M', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1461, 1301404846102, 423758757026, 0, 0, 'JKL906', NULL, '复古蓝 2XL', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1462, 1301404846108, 423758757026, 0, 0, 'JKL906', NULL, '浅蓝色 2XL', 100, 'JKL906', 'JKL906', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1463, 1301814344129, 423990076571, 0, 0, 'JKL9098', NULL, '蓝灰色 29', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1464, 1301814344122, 423990076571, 0, 0, 'JKL9098', NULL, '复古蓝 29', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1465, 1301814344119, 423990076571, 813, 49, 'JKL9098', NULL, '复古蓝 26', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1466, 1301814344132, 423990076571, 0, 0, 'JKL9098', NULL, '蓝灰色 32', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1467, 1301814344126, 423990076571, 0, 0, 'JKL9098', NULL, '蓝灰色 26', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1468, 1301814344133, 423990076571, 0, 0, 'JKL9098', NULL, '黑色 26', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1469, 1301814344120, 423990076571, 0, 0, 'JKL9098', NULL, '复古蓝 27', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1470, 1301814344128, 423990076571, 0, 0, 'JKL9098', NULL, '蓝灰色 28', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1471, 1301814344127, 423990076571, 0, 0, 'JKL9098', NULL, '蓝灰色 27', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1472, 1301814344138, 423990076571, 0, 0, 'JKL9098', NULL, '黑色 31', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1473, 1301814344124, 423990076571, 0, 0, 'JKL9098', NULL, '复古蓝 31', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1474, 1301814344136, 423990076571, 0, 0, 'JKL9098', NULL, '黑色 29', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1475, 1301814344135, 423990076571, 0, 0, 'JKL9098', NULL, '黑色 28', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1476, 1301814344131, 423990076571, 0, 0, 'JKL9098', NULL, '蓝灰色 31', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1477, 1301814344137, 423990076571, 0, 0, 'JKL9098', NULL, '黑色 30', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1478, 1301814344139, 423990076571, 0, 0, 'JKL9098', NULL, '黑色 32', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1479, 1301814344130, 423990076571, 0, 0, 'JKL9098', NULL, '蓝灰色 30', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1480, 1301814344134, 423990076571, 0, 0, 'JKL9098', NULL, '黑色 27', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1481, 1301814344123, 423990076571, 0, 0, 'JKL9098', NULL, '复古蓝 30', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1482, 1301814344121, 423990076571, 0, 0, 'JKL9098', NULL, '复古蓝 28', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);
INSERT INTO `oms_tenant_shop_goods_sku` VALUES (1483, 1301814344125, 423990076571, 0, 0, 'JKL9098', NULL, '复古蓝 32', 100, 'JKL9098', 'JKL9098', NULL, NULL, NULL, NULL, 1, 0, 0, '2024-06-23 14:08:26', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oms_tenant_shop_pull_lasttime
-- ----------------------------
DROP TABLE IF EXISTS `oms_tenant_shop_pull_lasttime`;
CREATE TABLE `oms_tenant_shop_pull_lasttime`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `pull_type` enum('ORDER','REFUND') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型（ORDER:订单，REFUND:退款）',
  `lasttime` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '租户店铺更新最后时间记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_tenant_shop_pull_lasttime
-- ----------------------------
INSERT INTO `oms_tenant_shop_pull_lasttime` VALUES (1, 1, 'ORDER', '2024-04-09 16:23:00', '2024-03-23 15:56:13', '2024-04-09 16:23:00');
INSERT INTO `oms_tenant_shop_pull_lasttime` VALUES (2, 1, 'REFUND', '2024-04-09 17:43:00', '2024-03-24 13:03:54', '2024-04-09 17:43:00');
INSERT INTO `oms_tenant_shop_pull_lasttime` VALUES (3, 2, 'ORDER', '2024-04-09 19:44:00', '2024-03-10 13:00:07', '2024-04-09 19:44:00');
INSERT INTO `oms_tenant_shop_pull_lasttime` VALUES (4, 2, 'REFUND', '2024-04-10 23:35:56', '2024-03-24 13:50:24', '2024-04-11 11:35:58');

-- ----------------------------
-- Table structure for oms_wei_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_order`;
CREATE TABLE `oms_wei_order`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `openid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家身份标识',
  `create_time` int NULL DEFAULT NULL COMMENT '秒级时间戳',
  `update_time` int NULL DEFAULT NULL COMMENT '秒级时间戳',
  `unionid` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL COMMENT '状态10	待付款；20	待发货；21	部分发货；30	待收货；100	完成；200	全部商品售后之后，订单取消；250	未付款用户主动取消或超时未付款订单自动取消；',
  `aftersale_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '售后信息json',
  `pay_info` varchar(5500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付信息json',
  `product_price` int NULL DEFAULT NULL COMMENT '商品总价，单位为分',
  `order_price` int NULL DEFAULT NULL COMMENT '订单金额，单位为分，order_price=original_order_price-discounted_price-deduction_price-change_down_price',
  `freight` int NULL DEFAULT NULL COMMENT '运费，单位为分',
  `discounted_price` int NULL DEFAULT NULL COMMENT '优惠券优惠金额，单位为分',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货人姓名',
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `province_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份',
  `city_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市',
  `county_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `tel_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系方式\r\n',
  `house_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '门牌号码',
  `virtual_order_tel_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '虚拟发货订单联系方式(deliver_method=1时返回)',
  `tel_number_ext_info` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '额外的联系方式信息（虚拟号码相关）',
  `use_tel_number` int NULL DEFAULT NULL COMMENT '0：不使用虚拟号码，1：使用虚拟号码',
  `hash_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标识当前店铺下一个唯一的用户收货地址',
  `delivery_product_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发货物流信息JSON',
  `ship_done_time` int NULL DEFAULT NULL COMMENT '发货完成时间，秒级时间戳',
  `ewaybill_order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子面单代发时的订单密文\r\n',
  `settle_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算信息json',
  `audit_status` int NULL DEFAULT NULL COMMENT '订单审核状态（0待审核1已审核）',
  `audit_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_order
-- ----------------------------
INSERT INTO `oms_wei_order` VALUES (1787451057007726594, 2, '3719632105698365440', 'oTci56wpEC3rpLzBLpqgca9RxPVE', 1714880617, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx051143383371820d4bc111707233960000\",\"prepay_time\":1714880618,\"pay_time\":1714880636,\"transaction_id\":\"4339401087202405058204364146\"}', 9990, 9990, 0, NULL, '陈*', '401120', '重庆市', '重庆市', '渝北区', '****', '151****3175', '', '', 'null', 0, '76c5d95a69fa3e2f3df3fa130c544b1e', '[{\"waybill_id\":\"73611068324382\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofoTfAD_tpK6Oj6pD5EZn0X6VvDfkvcvnlmaRnrVRQQnd1z7vKd8wIYBV95WZKSMi0gJOH2iKHJw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057125167105, 2, '3719632099578611200', 'oTci56zcnCjfcfUfYwq73nCHsV8I', 1714880593, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05114314861727bb07cc30ececbdcf0001\",\"prepay_time\":1714880595,\"pay_time\":1714880603,\"transaction_id\":\"4327500968202405056312947579\"}', 9990, 9990, 0, NULL, '丁', '510145', '广东省', '广州市', '荔湾区', '****', '153****3552', '', '', 'null', 0, '27a59189b23a462344802f09f13cc250', '[{\"waybill_id\":\"73611068324461\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'of2RLT2XA-d89xt4GX9sSerSB6YeVylmdbAlfELihMWDfpqbrZrnyU6k8BPG7ONUWYwYHLM1U6tA', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057183887362, 2, '3719632099131658496', 'oTci56xFJpSZmNaWM1w_o2Z6nPUc', 1714880592, 1714881184, NULL, 200, '{\"aftersale_order_list\":[{\"aftersale_order_id\":\"2000000461410155\",\"status\":13}],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05114313221244597b4b5445a0690c0000\",\"prepay_time\":1714880593,\"pay_time\":1714880600,\"transaction_id\":\"4307600956202405052225014361\"}', 9990, 9990, 0, NULL, '陶**', '210018', '江苏省', '南京市', '玄武区', '****', '199****6061', '', '19951926061', 'null', 0, 'e389beb4326308c27465df67347443e5', '[]', 0, 'of-7gCCdnYPV5MNNCBnlEad93OJsbNYsg6L4eYE35G2DSF8P46vda8XX2XDGHSbuw3Ik819eujIQ', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057242607617, 2, '3719631864896819456', 'oTci56-6X4j_LA4RkNHDIwcf-Ftg', 1714879698, 1714881565, NULL, 200, '{\"aftersale_order_list\":[{\"aftersale_order_id\":\"2000000461361268\",\"status\":13}],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx051128196745141d0919125a1299920001\",\"prepay_time\":1714879699,\"pay_time\":1714879708,\"transaction_id\":\"4347801086202405057172952617\"}', 9990, 9990, 0, NULL, '张**', '430014', '湖北省', '武汉市', '江岸区', '****', '153****4753', '', '', 'null', 0, '251b08a9fac95dcc13a90bf26dc7a59d', '[]', 0, 'ofBGPtEuAZdRoApr0etNKO0tALhHaesftNWei-US-LqA5688odSWs85m50sI5iP6q9esTAdXO0pQ', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057313910785, 2, '3719631857821552640', 'oTci565jaCWcbHcn8IEkbwGcgIq0', 1714879671, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05112752894216323c638abb5e0c420000\",\"prepay_time\":1714879673,\"pay_time\":1714879681,\"transaction_id\":\"4321700963202405055592435124\"}', 9990, 9990, 0, NULL, '邓**', '200333', '上海市', '上海市', '普陀区', '****', '150****8494', '', '', 'null', 0, '0ef19b8c4676fb859dfc114d1dd70f2f', '[{\"waybill_id\":\"73611068324740\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofS4hfM5rE6TSWpWfWG_09kFABSuH3tET-s_-VxstfmzqgacA-gcg4T0RkZ3f1_QONfNqYRDTuSw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057393602562, 2, '3719630802894587136', 'oTci56yTyGHiR1MkQ3rdDthSDxs8', 1714875647, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx05102048444074f78da72845c942460001\",\"prepay_time\":1714875648,\"pay_time\":1714875655,\"transaction_id\":\"4301400970202405058762940615\"}', 9990, 9990, 0, NULL, '廖**', '528400', '广东省', '中山市', '石岐区街道', '****', '136****5688', '', '', 'null', 0, '9623b4b9306bd90c934a61657067921a', '[{\"waybill_id\":\"73611068324604\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofwJA3SzcMUKiC9X4g1QlJUH2iaWH6m-Fyye_df58Q1Cxz3oGV-QDiUzN83imYsydxVUY5lrEB9Q', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057527820289, 2, '3719630104256712960', 'oTci56xiDZigZxCYfTKSpSXT6Tvs', 1714872982, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx050936233660315bb0c63bd05634270000\",\"prepay_time\":1714872983,\"pay_time\":1714872991,\"transaction_id\":\"4315201103202405051609869638\"}', 9990, 9990, 0, NULL, '侯**', '311200', '浙江省', '杭州市', '萧山区', '****', '185****3029', '', '', 'null', 0, '6da48e88729025e89cb7cc0196230af5', '[{\"waybill_id\":\"73611068324525\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofHTmkRoMt5ffRGWY5GxQZORIgrdaJkzq8_m_q3WQ8DHh9e_8Oi6L3GMWb7D-cJQKdRsBYmW-VdA', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057628483586, 2, '3719609573252662528', 'oTci567Uey7oSR1QR-bfoyb-oogM', 1714794662, 1714795563, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx041151038576758a3094d77dd75af70001\",\"prepay_time\":1714794664}', 9990, 9990, 0, NULL, '吕**', '200333', '上海市', '上海市', '普陀区', '****', '152****2015', '', '', 'null', 0, 'f30ce3965c796262f2653c3c7868953d', '[]', 0, 'ofxy9FxYC-Qj7cWe1Hdy7d_T64qAemLp5T7RZgw2okf7PWnlxU7n1MPzctDX-xZtNYf7SpRPffLg', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057733341185, 2, '3719609207888941056', 'oTci561cdcRmgu9LC7fuhTC2KZDo', 1714793268, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04112749896102e6c7c82c097077fb0000\",\"prepay_time\":1714793270,\"pay_time\":1714793275,\"transaction_id\":\"4344501088202405048410251099\"}', 9990, 9990, 0, NULL, '朱**', '322000', '浙江省', '金华市', '义乌市', '****', '130****7068', '', '', 'null', 0, '23399086d10638828a7cc6758e1f57f6', '[{\"waybill_id\":\"73611068322959\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'ofAJAg33082uvirnNPy6UvESlcwDTRt9-nP7k0h51hK_uy5vYs63UbDgriNvUn7pJU5Z8ZFSY7Sg', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057792061442, 2, '3719608045550570496', 'oTci56_mnmDsnspHd_o1pdFxMyYs', 1714788834, 1714983118, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04101356264587a370a7b255ee58220000\",\"prepay_time\":1714788836,\"pay_time\":1714788846,\"transaction_id\":\"4333800973202405048639385067\"}', 9990, 9990, 0, NULL, '老*', '300400', '天津市', '天津市', '北辰区', '****', '136****5987', '', '', 'null', 0, 'fb3640edbd9496e1c29186ea6f59f1e2', '[{\"waybill_id\":\"73611068329514\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983117,\"deliver_type\":1}]', 1714983117, 'ofbMZeC-SsLYYEwkBYwldGkYj09Ugwuo5G0fEMPRcCvI9hDwglE34HJBHhV-T1TQHuAmIMOK-UsA', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057859170306, 2, '3719607305622392832', 'oTci56yzAUABB6pTqNALQJfN0abk', 1714786012, 1714983101, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx04092653618057576501ea2b67ddd50001\",\"prepay_time\":1714786013,\"pay_time\":1714786022,\"transaction_id\":\"4331000950202405041318661925\"}', 9990, 9990, 0, NULL, '许**', '200030', '上海市', '上海市', '徐汇区', '****', '186****9879', '', '', 'null', 0, 'b1d6bdbdf2981082076696cbf9e751fa', '[{\"waybill_id\":\"73611068323266\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000114346861\",\"sku_id\":\"2239632777\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714983100,\"deliver_type\":1}]', 1714983100, 'of0IpgPtXnOq0TZI30xp0t6Hnpfr3O97l2XieeHYSLGX1qUWZnmadmqX0QSyA2wlT4Xc6ennDYhg', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057926279169, 2, '3719541152804638976', 'oTci56xaqRXPCRPfRzDUtxuZJSZ8', 1714533659, 1714697637, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx01112100729847fea6fdafc1704c820000\",\"prepay_time\":1714533660,\"pay_time\":1714533680,\"transaction_id\":\"4333901104202405015394319422\"}', 9990, 9990, 0, NULL, '王**', '130031', '吉林省', '长春市', '二道区', '****', '130****4298', '', '13069004298', 'null', 0, '0f62238c3bd1bad24ceabe674cc5cdbf', '[{\"waybill_id\":\"73611002395494\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'ofIRNqZCqBqEOCAA6Rh5sKt58nxz1OcChK14fjF7aiCQv3wF3Yjyk8oiBpsk0heVFdUu8qAm6Ifg', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451057989193729, 2, '3719539678347396352', 'oTci56wYmCTDuJ4ue-moWXT92HPE', 1714528034, 1714745479, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx0109471569243797b50c10594f5e8f0001\",\"prepay_time\":1714528035,\"pay_time\":1714528054,\"transaction_id\":\"4349701099202405014937039682\"}', 9990, 9990, 0, NULL, '金**', '200135', '上海市', '上海市', '浦东新区', '****', '139****8081', '', '', 'null', 0, '77b3c31b2b4a868713b389017191e22e', '[{\"waybill_id\":\"73611002395318\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of_c0fGfAQkqOZqu293F5yc7PbME_r8hjE80GgC-kMyQTEFj3D7uLzI54vdbuJBVo_A3NE3T1Agw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058043719681, 2, '3719539645519627776', 'oTci56wYmCTDuJ4ue-moWXT92HPE', 1714527909, 1714528810, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx010945106537123355f2ead7cb142e0001\",\"prepay_time\":1714527910}', 9990, 9990, 0, NULL, '金**', '200135', '上海市', '上海市', '浦东新区', '****', '139****8081', '', '', 'null', 0, '77b3c31b2b4a868713b389017191e22e', '[]', 0, 'of1_iH2tIUsDV3KXhk1svg-cYzBFy480quEl_uTiPIHTEKbty0XsM3s8yS7zYPPhhrkKlYt2aSRg', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058127605762, 2, '3719539305125645313', 'oTci566M87SOPp9t4gt0FOAOkS9Y', 1714526611, 1714712410, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx01092332254413e24d734dda95c4050001\",\"prepay_time\":1714526612,\"pay_time\":1714526623,\"transaction_id\":\"4337701108202405010523448017\"}', 9990, 9990, 0, NULL, '张*', '710004', '陕西省', '西安市', '新城区', '****', '133****8076', '', '', 'null', 0, '6f45a66533b814649894b1f164d70294', '[{\"waybill_id\":\"73611002395387\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of6LTdryuGRHX5q6lLFMvrsQzgBgiuC4WL5siLy2FM-P0NaVGGmK18e_reU3-yVytK-lEUd3CoXg', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058186326018, 2, '3719539303409911296', 'oTci56yAxVf7oKTlnW7UbOMdPhuE', 1714526604, 1714737259, NULL, 100, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx010923254698878ffcdc29160c99740001\",\"prepay_time\":1714526605,\"pay_time\":1714526614,\"transaction_id\":\"4326200966202405017664125441\"}', 9990, 9990, 0, NULL, '侯*', '110031', '辽宁省', '沈阳市', '皇姑区', '****', '135****3408', '', '', 'null', 0, '081b534b88aeebfef16cfebed7e9b45e', '[{\"waybill_id\":\"73611002395438\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714539235,\"deliver_type\":1}]', 1714539235, 'of-GOTNJSemfmNl3doRG3ADLhd9rJumWqTVh0pVIaclreLy4kU-r_dLNuXgLMnZuXdm6RiA_jjCQ', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058228269058, 2, '3719520228905715200', 'oTci56zlEZt2Sw_gD78eJnTFpbdU', 1714453840, 1714454741, NULL, 250, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"prepay_id\":\"up_wx3013104207123594f733e51396d8d90000\",\"prepay_time\":1714453842}', 9990, 9990, 0, NULL, '安**', '264300', '山东省', '威海市', '荣成市', '****', '139****3719', '', '', 'null', 0, '59da071f50719e09f01a491b3c4315c6', '[]', 0, 'of76j3Y1qZfzJ7qnZcuXHBVsiEv_YGvumzBV0RRS9XGGtPy-mXi2XVWb9YP51amVHXxafUba-7Ig', '{\"predict_commission_fee\":0}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058282795010, 2, '3719520157597830144', 'oTci569yPmUpaaEDB0-gc_61_bQg', 1714453569, 1714705510, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx301306104568162ebb785c7203a7c70001\",\"prepay_time\":1714453570,\"pay_time\":1714453580,\"transaction_id\":\"4336700950202404301822641011\"}', 9990, 9990, 0, NULL, '勾**', '110200', '辽宁省', '沈阳市', '辽中区', '****', '130****0299', '', '', 'null', 0, 'c48111b669f63885475971cd00d81aa0', '[{\"waybill_id\":\"73610991878978\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714460708,\"deliver_type\":1}]', 1714460708, 'of5tnacXLYJ7k_JRfJUq85GlpAGlEu7KyFgjDirvw5lQ-hQ3hjeO1ZWItxFZpOdC-2HN7cXvBf2A', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058337320961, 2, '3719519937814465536', 'oTci561Dyp_40Q_i3l36a2OLirWU', 1714452730, 1714647910, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30125211642150cbd118620b179cd80001\",\"prepay_time\":1714452731,\"pay_time\":1714452747,\"transaction_id\":\"4350800963202404301894276925\"}', 9990, 9990, 0, NULL, '饶**', '430061', '湖北省', '武汉市', '武昌区', '****', '153****8831', '', '', 'null', 0, 'df443b7b536055c5fe650f92b6228df3', '[{\"waybill_id\":\"73610991879137\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714460708,\"deliver_type\":1}]', 1714460708, 'ofXIDtyH-kbHU90oiz0HZKqigOJviDHbfy6rmwuAvLLkIMgS82dLPX4RE_un9w48adpnZmzVDnuw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058370875393, 2, '3719519606137030144', 'oTci568uIDQFQ4e5Ga00NQXmQ9Uc', 1714451465, 1714697969, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123106363630bc2040a0467b90a20001\",\"prepay_time\":1714451466,\"pay_time\":1714451480,\"transaction_id\":\"4309201107202404302139171466\"}', 9990, 9990, 0, NULL, '陈**', '523000', '广东省', '东莞市', '中堂镇', '****', '130****1245', '', '', 'null', 0, '38dd665ed63e43daf07f8dbe090c0131', '[{\"waybill_id\":\"73610989601585\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'ofLRybOEXAL4PRcsgIDOf8_UnYB8oHnhM_yTY0A1tFs_Kgs_cBxcdgfCvHW2aA5OjE0lVvPB97Dw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058421207041, 2, '3719519603625955328', 'oTci564sE_0MrrIeKuN6zmoTePOA', 1714451455, 1714813169, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123056815634f8d686831832aaf40000\",\"prepay_time\":1714451456,\"pay_time\":1714451464,\"transaction_id\":\"4313001088202404307373318969\"}', 9990, 9990, 0, NULL, '王**', '266100', '山东省', '青岛市', '崂山区', '****', '136****3948', '', '', 'null', 0, '7d6287d18fbf6a59f7c1375a7d5fb476', '[{\"waybill_id\":\"73610989601736\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'of1JpdpO9xG2sxfhrvqIoZ7iVC9l_FauPBzV94Yoe8usahUFUyVl_fBHCk0OmuQk1h95No3QIDkQ', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058471538689, 2, '3719519600843559168', 'oTci5617Ek2kYfoh1ITAL6WOGgGU', 1714451445, 1714885171, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30123046157394a51a01b6bc7aab010001\",\"prepay_time\":1714451446,\"pay_time\":1714451455,\"transaction_id\":\"4335701114202404300011618746\"}', 9990, 9990, 0, NULL, '陈**', '514400', '广东省', '梅州市', '五华县', '****', '158****9887', '', '', 'null', 0, 'ebac3b596b79b553110c40135e6b2698', '[{\"waybill_id\":\"73610989601891\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453167,\"deliver_type\":1}]', 1714453167, 'of8FvFaFQ7KCggonIA7JxIlYq_cNp1zYRZXifUoYcug1_vBtghTtWm5QP2ePaHfK2k3tc9z2fHLw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058538647554, 2, '3719519482018137600', 'oTci568uIDQFQ4e5Ga00NQXmQ9Uc', 1714450992, 1714697969, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx3012231342018305f098afaa80b4710001\",\"prepay_time\":1714450993,\"pay_time\":1714451006,\"transaction_id\":\"4320101110202404301218860173\"}', 3990, 890, 0, 3100, '陈**', '523000', '广东省', '东莞市', '中堂镇', '****', '130****1245', '', '', 'null', 0, '38dd665ed63e43daf07f8dbe090c0131', '[{\"waybill_id\":\"73610989601585\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000111746307\",\"sku_id\":\"2198803586\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714453168,\"deliver_type\":1}]', 1714453168, 'ofNuRT7esXCFoI0V5mKKvPqZ7cQb85NfCDzG_U7g4vsz31Dr_BjXrihxSTZEcM9vnRZdOUA-Dt-w', '{\"predict_commission_fee\":8}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058584784898, 2, '3719518635971448832', 'oTci566RMss7nywmYedj2xhw1138', 1714447764, 1714622183, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30112925609856241bcbef965ef21a0001\",\"prepay_time\":1714447765,\"pay_time\":1714447801,\"transaction_id\":\"4328501115202404306928504907\"}', 9990, 9990, 0, NULL, '赵**', '710014', '陕西省', '西安市', '未央区', '****', '133****0691', '', '', 'null', 0, '8f32eb87a3e85178705ab54e350ba348', '[{\"waybill_id\":\"73610988706596\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'of4qbkRf3y3W9ilLM6NrYTRExiTYcRqcDLkFqdBTR_azBx8aalYn15ml3RbK7ou0Srrllek1fQ7w', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058635116546, 2, '3719518158959545344', 'oTci563sc2PSk0ZnDmh6rZlvryEE', 1714445944, 1714535782, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx301059059358676edac4b59314f3830001\",\"prepay_time\":1714445946,\"pay_time\":1714445960,\"transaction_id\":\"4314000957202404307168217552\"}', 9990, 9990, 0, NULL, '龚**', '475000', '河南省', '开封市', '龙亭区', '****', '158****2113', '', '', 'null', 0, '7d7e2964c99206f08f078bf51b5317da', '[{\"waybill_id\":\"73610988706506\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofR-obOLEyNvQwW-qEXr8WogeY8BhTAtd1HgiCS1PTSmNw9-nlgExJzN0kiGH9En7cBpGjee1Zvw', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058677059585, 2, '3719517933804327168', 'oTci565UymC1Yinw1X1v2VLcE03E', 1714445085, 1714607782, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30104447137134c2dd50d32b9e592d0001\",\"prepay_time\":1714445087,\"pay_time\":1714445094,\"transaction_id\":\"4310301091202404307004951062\"}', 9990, 9990, 0, NULL, '谭**', '510080', '广东省', '广州市', '白云区', '****', '199****3703', '', '', 'null', 0, 'e27ca827e7eb0ea8d1c69c62b479eafe', '[{\"waybill_id\":\"73610988706116\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofKTUD8p_EoEG8HIhKLu2-VAPQ2pN9f5s02haeV_Bja8hM6TwZy9AKdkgJujN-Nc731EYpKkYdFA', '{\"predict_commission_fee\":99}', NULL, NULL);
INSERT INTO `oms_wei_order` VALUES (1787451058756751361, 2, '3719517651511152896', 'oTci569gEFexljgK9lXxy-NMo_1c', 1714444009, 1715152963, NULL, 30, '{\"aftersale_order_list\":[],\"on_aftersale_order_cnt\":0}', '{\"payment_method\":1,\"prepay_id\":\"up_wx30102650200648ca736e2c92422beb0001\",\"prepay_time\":1714444010,\"pay_time\":1714444018,\"transaction_id\":\"4303801112202404305816754375\"}', 9990, 9990, 0, NULL, '胡**', '430080', '湖北省', '武汉市', '青山区', '****', '188****9606', '', '18871199606', 'null', 0, '03dc775d1a67f0366a8bc586f815ce90', '[{\"waybill_id\":\"73610988706391\",\"delivery_id\":\"ZTO\",\"product_infos\":[{\"product_id\":\"10000113792713\",\"sku_id\":\"2231619925\",\"product_cnt\":1}],\"delivery_name\":\"中通快递\",\"delivery_time\":1714449381,\"deliver_type\":1}]', 1714449381, 'ofs9B72VMq1tNhN0tTmE4sfKufM_tjMar_-u8_S_v8mGiyjnS6oLEZ0Z36BfhzEWHXid75BnBuOg', '{\"predict_commission_fee\":99}', 1, '2024-05-08 15:22:43');

-- ----------------------------
-- Table structure for oms_wei_order_item
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_order_item`;
CREATE TABLE `oms_wei_order_item`  (
  `id` bigint NOT NULL,
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单id（平台订单id）',
  `product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品skuid\r\n',
  `thumb_img` varchar(550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku小图',
  `sku_cnt` int NULL DEFAULT NULL COMMENT 'sku数量',
  `sale_price` int NULL DEFAULT NULL COMMENT '售卖单价（单位：分）',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `on_aftersale_sku_cnt` int NULL DEFAULT NULL COMMENT '正在售后/退款流程中的 sku 数量',
  `finish_aftersale_sku_cnt` int NULL DEFAULT NULL COMMENT '完成售后/退款的 sku 数量',
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `market_price` int NULL DEFAULT NULL COMMENT '市场单价（单位：分）',
  `sku_attrs` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku属性JSON',
  `real_price` int NULL DEFAULT NULL COMMENT 'sku实付总价，取estimate_price和change_price中较小值',
  `out_product_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品外部spuid',
  `out_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品外部skuid',
  `is_discounted` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否有优惠金额，非必填，默认为false',
  `estimate_price` int NULL DEFAULT NULL COMMENT '优惠后sku总价，非必填，is_discounted为true时有值',
  `is_change_price` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否修改过价格，非必填，默认为false',
  `change_price` int NULL DEFAULT NULL COMMENT '改价后sku总价，非必填，is_change_price为true时有值',
  `out_warehouse_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区域库存id',
  `sku_deliver_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品发货信息JSON',
  `extra_service` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品额外服务信息JSON',
  `use_deduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否使用了会员积分抵扣\r\n',
  `deduction_price` int NULL DEFAULT NULL COMMENT '会员积分抵扣金额，单位为分',
  `order_product_coupon_info_list` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品优惠券信息，逐步替换 order.order_detail.coupon_info',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_order_item
-- ----------------------------
INSERT INTO `oms_wei_order_item` VALUES (1787451057062252545, 2, '3719632105698365440', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057141944322, 2, '3719632099578611200', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057196470274, 2, '3719632099131658496', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 1, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057259384833, 2, '3719631864896819456', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 1, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057326493697, 2, '3719631857821552640', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057473294337, 2, '3719630802894587136', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057552986113, 2, '3719630104256712960', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057674620929, 2, '3719609573252662528', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057741729794, 2, '3719609207888941056', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057813032961, 2, '3719608045550570496', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057867558913, 2, '3719607305622392832', '10000114346861', '2239632777', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/66323b7e000804390e4dba6f7b360315000000a000004f50', 1, 9990, '大山金黄苦荞.专用麦香形冲饮谷物.黄苦荞250g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发4=到手4罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057943056386, 2, '3719541152804638976', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451057997582337, 2, '3719539678347396352', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058064691201, 2, '3719539645519627776', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058144382978, 2, '3719539305125645313', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058194714626, 2, '3719539303409911296', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058245046274, 2, '3719520228905715200', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058299572225, 2, '3719520157597830144', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058345709570, 2, '3719519937814465536', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058387652610, 2, '3719519606137030144', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058437984258, 2, '3719519603625955328', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058509287426, 2, '3719519600843559168', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058551230466, 2, '3719519482018137600', '10000111746307', '2198803586', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/65ec1433000821ae1f038c66db60b01e000000a000004f50', 1, 3990, '泷御堂冲饮谷物 赤小豆薏米芡实330g*罐', 0, 0, '', 3990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"1罐体验装【贵在运费】(5%人选择)\"}]', 890, NULL, NULL, 'true', 890, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":0,\"freight_insurance\":1}', 'null', NULL, '[{\"user_coupon_id\":\"5215692320178179\"}]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058597367810, 2, '3719518635971448832', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058643505153, 2, '3719518158959545344', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058693836801, 2, '3719517933804327168', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');
INSERT INTO `oms_wei_order_item` VALUES (1787451058773528578, 2, '3719517651511152896', '10000113792713', '2231619925', 'https://store.mp.video.tencent-cloud.com/161/20304/snscosdownload/SH/reserved/662de0600005f6c31d2d67512006bd1e000000a000004f50', 1, 9990, '大山金黄苦荞 专用麦香形冲饮谷物 黄苦荞500g/罐', 0, 0, '', 9990, '[{\"attr_key\":\"净含量\",\"attr_value\":\"拍1发3=到手3罐\"},{\"attr_key\":\"主播承诺\",\"attr_value\":\"7天试喝及运费险\"}]', 9990, NULL, NULL, 'false', 9990, 'null', NULL, '', '{\"stock_type\":0}', '{\"seven_day_return\":1,\"freight_insurance\":1}', 'null', NULL, '[]');

-- ----------------------------
-- Table structure for oms_wei_refund
-- ----------------------------
DROP TABLE IF EXISTS `oms_wei_refund`;
CREATE TABLE `oms_wei_refund`  (
  `id` bigint NOT NULL,
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `after_sale_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后单号',
  `status` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后单当前状态，参考：\r\nUSER_CANCELD	用户取消申请\r\nMERCHANT_PROCESSING	商家受理中\r\nMERCHANT_REJECT_REFUND	商家拒绝退款\r\nMERCHANT_REJECT_RETURN	商家拒绝退货退款\r\nUSER_WAIT_RETURN	待买家退货\r\nRETURN_CLOSED	退货退款关闭\r\nMERCHANT_WAIT_RECEIPT	待商家收货\r\nMERCHANT_OVERDUE_REFUND	商家逾期未退款\r\nMERCHANT_REFUND_SUCCESS	退款完成\r\nMERCHANT_RETURN_SUCCESS	退货退款完成\r\nPLATFORM_REFUNDING	平台退款中\r\nPLATFORM_REFUND_FAIL	平台退款失败\r\nUSER_WAIT_CONFIRM	待用户确认\r\nMERCHANT_REFUND_RETRY_FAIL	商家打款失败，客服关闭售后\r\nMERCHANT_FAIL	售后关闭\r\nUSER_WAIT_CONFIRM_UPDATE	待用户处理商家协商\r\nUSER_WAIT_HANDLE_MERCHANT_AFTER_SALE	待用户处理商家代发起的售后申请',
  `openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家身份标识',
  `unionid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家在开放平台的唯一标识符，若当前视频号小店已绑定到微信开放平台账号下会返回',
  `product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品skuid',
  `count` int NULL DEFAULT NULL COMMENT '售后数量',
  `fast_refund` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否极速退款RefundInfo',
  `refund_reason` int NULL DEFAULT NULL COMMENT '标明售后单退款直接原因, 枚举值参考 RefundReason',
  `refund_amount` int NULL DEFAULT NULL COMMENT '退款金额（分）',
  `return_waybill_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `return_delivery_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司id',
  `return_delivery_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司名称',
  `merchant_upload_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '售后相关商品信息JSON',
  `create_time` int NULL DEFAULT NULL COMMENT '售后单创建时间戳',
  `update_time` int NULL DEFAULT NULL COMMENT '售后单更新时间戳',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `reason_text` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因解释',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后类型。REFUND:退款；RETURN:退货退款。',
  `order_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号，该字段可用于获取订单',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'detail json',
  `complaint_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '纠纷id，该字段可用于获取纠纷信息',
  `refund_resp` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信支付退款的响应',
  `pull_status` int NULL DEFAULT NULL COMMENT '推送状态（0未推送；1推送成功；2推送失败）',
  `pull_time` datetime NULL DEFAULT NULL COMMENT '订单审核时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '视频号小店退款' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of oms_wei_refund
-- ----------------------------
INSERT INTO `oms_wei_refund` VALUES (1787746259370975234, 2, '2000000461361268', 'MERCHANT_REFUND_SUCCESS', 'oTci56-6X4j_LA4RkNHDIwcf-Ftg', NULL, '10000114346861', '2239632777', 1, 'true', 4, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1714881502, 1714881513, '10000000', '不想要了', 'REFUND', '3719631864896819456', '{\"desc\":\"\",\"receive_product\":false,\"prove_imgs\":[],\"tel_number\":\"15337124753\",\"media_id_list\":[]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', NULL, NULL);
INSERT INTO `oms_wei_refund` VALUES (1787746259496804354, 2, '2000000461410155', 'MERCHANT_REFUND_SUCCESS', 'oTci56xFJpSZmNaWM1w_o2Z6nPUc', NULL, '10000114346861', '2239632777', 1, 'true', 4, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1714881120, 1714881142, '10000059', '拍错/少用优惠', 'REFUND', '3719632099131658496', '{\"desc\":\"\",\"receive_product\":false,\"prove_imgs\":[],\"tel_number\":\"19951926061\",\"media_id_list\":[]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', NULL, NULL);
INSERT INTO `oms_wei_refund` VALUES (1788119147705950209, 2, '2000000476685963', 'MERCHANT_PROCESSING', 'oTci56-icFjAKlQ-2KXeCxM38M7M', NULL, '10000113792713', '2231619925', 1, 'false', NULL, 9990, '', '', '', '{\"reject_reason\":\"\",\"refund_certificates\":[]}', 1715080222, 1715080222, '10000021', '质量问题', 'RETURN', '3719496358260248576', '{\"desc\":\"收到了冲一遍就没有味儿了\",\"receive_product\":true,\"prove_imgs\":[],\"tel_number\":\"18341693403\",\"media_id_list\":[\"LGa74OroReJJ8cb6ouPvbv1da72vrvKNQMK48Ei7WXgaUMc2Y_qkjcavzCmZMD1lvSOM2oFk5uO6Xzw0-nswBw\"]}', '0', '{\"code\":\"\",\"ret\":0,\"message\":\"\"}', 1, '2024-05-08 16:10:01');

-- ----------------------------
-- Table structure for scm_after_sale
-- ----------------------------
DROP TABLE IF EXISTS `scm_after_sale`;
CREATE TABLE `scm_after_sale`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `refund_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '退货单号',
  `refund_type` int NULL DEFAULT NULL COMMENT '类型(10-退货 20-换货 30-维修 40-大家电安装 50-大家电移机 60-大家电增值服务 70-上门维修 90-优鲜赔 80-补发商品 100-试用收回 11-仅退款)',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `shop_type` int NULL DEFAULT NULL COMMENT '店铺类型',
  `refund_fee` float NOT NULL COMMENT '退款金额',
  `refund_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退款原因',
  `original_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '原始订单号（来自于第三方平台）',
  `original_order_item_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '原始子订单号（来自于第三方平台）',
  `original_sku_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始子订单skuId',
  `erp_goods_id` bigint NULL DEFAULT NULL COMMENT 'erp商品id',
  `erp_goods_sku_id` bigint NULL DEFAULT NULL COMMENT 'erp sku id',
  `spec_num` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `has_good_return` int NULL DEFAULT NULL COMMENT '买家是否需要退货。可选值:1(是),0(否)',
  `goods_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_sku` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品sku',
  `goods_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `quantity` bigint NULL DEFAULT NULL COMMENT '退货数量',
  `return_logistics_company` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退货物流公司',
  `return_logistics_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退货物流单号',
  `receive_time` datetime NULL DEFAULT NULL COMMENT '收货时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `contact_person` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发货人',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发货人手机号',
  `address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '发货地址',
  `status` int NOT NULL COMMENT '状态（10001待审核10002等待买家退货10005等待卖家收货14000拒绝退款10011退款关闭10010退款完成）',
  `create_time` datetime NOT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `tenant_id` bigint NOT NULL COMMENT '租户ID（distributor）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1788119148154740739 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售后表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_after_sale
-- ----------------------------
INSERT INTO `scm_after_sale` VALUES (1786735505566502913, '154486920027549058', 11, 6, 4, 20, '与商家协商一致退款', '2088964452215545890', '2088964452216545890', '', 0, 0, 'ZH-SF-04-DS-F9-QM20A-NT3', 0, '曲美家居轻奢简约现代床头柜储物双抽床边柜皮质卧室置物储藏柜', '4902529397704|颜色分类:奶油白;安装方式:组装', NULL, 2, NULL, NULL, NULL, '', '', '', '', 10010, '2024-05-04 20:31:55', 'REFUND_MESSAGE', NULL, NULL, 0);
INSERT INTO `scm_after_sale` VALUES (1788119148154740738, '2000000476685963', 10, 2, 2, 99.9, '质量问题', '3719496358260248576', '0', '2231619925', 0, 0, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, NULL, '', '', '', '', 10001, '2024-05-08 16:10:01', 'REFUND_MESSAGE', NULL, NULL, 0);

-- ----------------------------
-- Table structure for scm_after_sale_process
-- ----------------------------
DROP TABLE IF EXISTS `scm_after_sale_process`;
CREATE TABLE `scm_after_sale_process`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `type` int NULL DEFAULT NULL COMMENT '类型（10退货；20换货；80补发；99订单拦截；）',
  `shop_id` int NULL DEFAULT NULL COMMENT '店铺id',
  `shop_type` int NULL DEFAULT NULL COMMENT '店铺类型',
  `after_sale_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '售后单号',
  `order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `sub_order_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单号',
  `product_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品spuid',
  `sku_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品skuid',
  `count` int NULL DEFAULT NULL COMMENT '数量',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `img` varchar(555) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `sku_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku描述',
  `sku_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'sku编码',
  `erp_goods_id` int NULL DEFAULT NULL COMMENT 'ERP商品id',
  `erp_sku_id` int NULL DEFAULT NULL COMMENT 'ERP商品skuId',
  `return_info` varchar(2550) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退回人信息json',
  `return_waybill_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退回快递单号',
  `return_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '退回物流公司名称',
  `receiver_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人联系电话',
  `receiver_province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `receiver_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `receiver_town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `receiver_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人详细地址',
  `ship_waybill_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货快递单号（补发、换货发货、拦截订单发货）',
  `ship_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货快递公司',
  `status` int NULL DEFAULT NULL COMMENT '状态:1已发出；2已完成(已收货);3已入库',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tenant_id` bigint NOT NULL COMMENT '租户ID（distributor）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '售后处理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_after_sale_process
-- ----------------------------

-- ----------------------------
-- Table structure for scm_order
-- ----------------------------
DROP TABLE IF EXISTS `scm_order`;
CREATE TABLE `scm_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单id，自增',
  `order_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号（来源订单）',
  `shop_type` int NULL DEFAULT NULL COMMENT '店铺类型',
  `shop_id` bigint NOT NULL COMMENT '店铺ID',
  `tenant_id` bigint NOT NULL COMMENT '租户ID（distributor）',
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `buyer_memo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '买家留言信息',
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `refund_status` int NOT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 5：全部',
  `order_status` int NOT NULL COMMENT '订单状态1：待发货，2：已发货，3：已完成，11已取消；21待付款',
  `goods_amount` double NULL DEFAULT NULL COMMENT '商品金额',
  `discount_amount` double NOT NULL COMMENT '折扣金额',
  `postage` double NULL DEFAULT NULL COMMENT '运费',
  `amount` double NOT NULL COMMENT '支付金额，单位：元，支付金额=商品金额-折扣金额+邮费',
  `receiver_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人姓名',
  `receiver_phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人手机号',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人地址',
  `country` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家/地区',
  `province` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `town` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `order_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `confirm_time` datetime NULL DEFAULT NULL COMMENT '订单确认时间',
  `ship_type` int NULL DEFAULT NULL COMMENT '发货类型（0仓库发货；1供应商代发）',
  `ship_status` int NOT NULL COMMENT '发货状态（0待备货1备货中2已出库3已发货）',
  `shipping_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `shipping_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快递单号',
  `shipping_company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '物流公司',
  `shipping_man` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发货人',
  `shipping_cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '发货费用',
  `create_time` datetime NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `length` float NULL DEFAULT 0 COMMENT '长',
  `width` float NULL DEFAULT 0 COMMENT '宽',
  `height` float NULL DEFAULT 0 COMMENT '高',
  `weight` float NULL DEFAULT NULL COMMENT '重量',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_sn_index`(`order_num`) USING BTREE,
  INDEX `shopid_index`(`shop_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_order
-- ----------------------------
INSERT INTO `scm_order` VALUES (43, 'aAAD0090', 3, 23, 1, NULL, NULL, NULL, 1, 1, 0, 0, 0, 0, 'AA', '130089895666', 'AAAA', NULL, '山西省', '阳泉市', '郊区', '2024-06-23 18:56:02', NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, '2024-06-23 18:56:02', '15818590119', NULL, NULL, 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for scm_order_item
-- ----------------------------
DROP TABLE IF EXISTS `scm_order_item`;
CREATE TABLE `scm_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id，自增',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `shop_id` bigint NOT NULL COMMENT '店铺id',
  `platform_sku_id` bigint NULL DEFAULT NULL COMMENT '平台SKUID',
  `erp_goods_id` bigint NULL DEFAULT 0 COMMENT 'erp系统商品id',
  `erp_goods_spec_id` bigint NULL DEFAULT 0 COMMENT 'erp系统商品规格id',
  `goods_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `goods_num` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编码',
  `goods_spec` varchar(800) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品规格',
  `sku_code` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SKU编码',
  `goods_price` double NULL DEFAULT NULL COMMENT '商品单价',
  `item_amount` double NULL DEFAULT NULL COMMENT '子订单金额',
  `quantity` int NOT NULL COMMENT '商品数量',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_gift` tinyint NOT NULL DEFAULT 0 COMMENT '是否赠品0否1是',
  `refund_count` int NULL DEFAULT 0 COMMENT '已退货数量',
  `refund_status` int NULL DEFAULT NULL COMMENT '售后状态 1：无售后或售后关闭，2：售后处理中，3：退款中，4： 退款成功 ',
  `order_status` int NULL DEFAULT NULL COMMENT '订单状态',
  `tenant_id` bigint NOT NULL COMMENT '租户ID（distributor）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `goodId_index`(`erp_goods_id`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1785584827112509448 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_order_item
-- ----------------------------
INSERT INTO `scm_order_item` VALUES (1, 43, 23, 1262178610550, 9, 400, '高腰宽松直筒牛仔短裤女夏a字型显瘦甜欲风辣妹毛边2022新款黑色', 'https://img.pddpic.com/gaudit-image/2022-09-28/ed63f69d82e863972d1633cad97352a2.jpeg', '2720218026', '复古蓝 S（80-95斤）', 'HN80264001', NULL, NULL, 1, NULL, 0, 0, NULL, NULL, 1);

-- ----------------------------
-- Table structure for scm_vendor
-- ----------------------------
DROP TABLE IF EXISTS `scm_vendor`;
CREATE TABLE `scm_vendor`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商名称',
  `number` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供应商编码',
  `login_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登陆名',
  `login_pwd` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登陆密码',
  `login_slat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tax_rate` double NULL DEFAULT 0 COMMENT '税率',
  `amount` double NULL DEFAULT 0 COMMENT '期初应付款',
  `period_money` double NULL DEFAULT 0 COMMENT '期初预付款',
  `dif_money` double NULL DEFAULT 0 COMMENT '初期往来余额',
  `begin_date` date NULL DEFAULT NULL COMMENT '余额日期',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `place` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '职位',
  `link_man` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `contact` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系方式',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `county` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区县',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收货地址详情',
  `pin_yin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `disable` tinyint(1) NULL DEFAULT 0 COMMENT '0启用   1禁用',
  `is_delete` tinyint(1) NULL DEFAULT 0 COMMENT '0正常 1删除',
  `purchaser_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分管采购员',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `usci` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业社会信用代码',
  `bl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营业执照',
  `bl_period` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '营业执照有效期',
  `bl_faren` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '法人',
  `bank` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `bank_account_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户名称',
  `bank_account` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账户',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of scm_vendor
-- ----------------------------
INSERT INTO `scm_vendor` VALUES (1, '佛山三雄照明', 'FSSX', 'qihangvms', '$2a$10$FQ5WEd0ljf1Qzz7O9kTPwuTvg1G76vga6QTx6X4XBLfFhT3Z3/DVO', 'p8O9OWF3MzgKUIorSIga+Q==', 0, 0, 0, 0, NULL, '', '', '蓝生', '13750588915', NULL, NULL, NULL, '广东省佛山市', '', 0, 0, NULL, '2025-06-25 08:38:56', NULL, '2025-07-05 16:41:48', 'admin', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '启航技术', 0, '启航', '15888888888', '280645618@qq.com', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-14 18:28:55');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '研发部', 1, '启航', '15888888888', '280645618@qq.com', '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-14 18:31:54');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '至简', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2023-08-07 19:31:37', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-08-07 19:31:38', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 257 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 11:36:40');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 14:50:27');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2024-05-08 16:02:13');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2089 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 99, 'system', '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-12-27 15:00:27', 'admin', '2023-12-29 09:07:42.856856', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '商品库管理', 0, 1, 'goods', '', '', 1, 0, 'M', '0', '0', '', 'theme', 'admin', '2023-12-29 13:29:44', 'admin', '2025-07-19 22:16:50', '');
INSERT INTO `sys_menu` VALUES (6, '订单管理', 0, 3, 'order', '', '', 1, 0, 'M', '0', '0', '', 'excel', 'admin', '2024-01-01 14:08:04', 'admin', '2025-07-20 09:58:13', '');
INSERT INTO `sys_menu` VALUES (7, '售后管理', 0, 4, 'saleafter', NULL, NULL, 1, 0, 'M', '0', '0', '', 'clipboard', 'admin', '2024-01-03 14:23:55', 'admin', '2024-01-12 19:47:33', '');
INSERT INTO `sys_menu` VALUES (8, '商户管理', 0, 2, 'merchant', NULL, NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2024-04-12 16:46:19', 'admin', '2025-07-20 09:05:10', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-12-27 15:00:27', '', '', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-12-27 15:00:27', '', '', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-12-27 15:00:27', '', '', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-12-27 15:00:27', '', '', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-12-27 15:00:27', '', '', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-12-27 15:00:27', '', '', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-12-27 15:00:27', '', '', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-12-27 15:00:27', '', '', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-12-27 15:00:27', '', '', '');
INSERT INTO `sys_menu` VALUES (2007, '商品管理', 2, 1, 'goods_list', 'goods/index', '', 1, 0, 'C', '0', '0', 'goods:list', 'theme', 'admin', '2023-12-29 13:31:01', 'admin', '2023-12-29 15:02:40.869685', '');
INSERT INTO `sys_menu` VALUES (2008, '商品分类', 2, 88, 'goods_category', 'goods/category/index', '', 1, 0, 'C', '0', '0', 'goods:category', 'tree-table', 'admin', '2023-12-29 13:32:41', 'admin', '2023-12-29 15:02:22.220534', '');
INSERT INTO `sys_menu` VALUES (2015, '商户管理', 8, 10, 'merchant_list', 'merchant/index', '', 1, 0, 'C', '0', '0', 'merchant_list', 'example', 'admin', '2023-12-29 16:54:02', 'admin', '2025-07-20 09:43:40', '');
INSERT INTO `sys_menu` VALUES (2029, '换货管理', 7, 2, 'exchange_list', 'afterSale/exchange', '', 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2023-12-31 17:29:03', 'admin', '2024-06-22 19:26:06', '');
INSERT INTO `sys_menu` VALUES (2049, '订单打印', 6, 3, 'print_list', 'ship/print/index', NULL, 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2024-01-03 14:09:18', 'admin', '2024-06-22 19:22:55', '');
INSERT INTO `sys_menu` VALUES (2054, '退货管理', 7, 1, 'returned_list', 'afterSale/returned', NULL, 1, 0, 'C', '0', '0', '', 'size', 'admin', '2024-01-03 14:24:36', 'admin', '2024-06-22 19:24:54', '');
INSERT INTO `sys_menu` VALUES (2059, '待发货订单', 6, 1, 'wait_ship_order', 'ship/order/waitShip', '', 1, 0, 'C', '0', '0', '', 'component', 'admin', '2024-01-09 11:51:52', 'admin', '2024-06-22 19:21:48', '');
INSERT INTO `sys_menu` VALUES (2060, '已发货订单', 6, 5, 'order_list', 'ship/order/index', NULL, 1, 0, 'C', '0', '0', '', 'bug', 'admin', '2024-01-09 13:39:00', 'admin', '2024-06-22 19:20:22', '');
INSERT INTO `sys_menu` VALUES (2066, '添加商品', 2, 2, 'create', 'goods/create', NULL, 1, 0, 'C', '1', '0', '', 'component', 'admin', '2024-01-14 19:42:11', 'admin', '2024-04-14 18:50:36', '');
INSERT INTO `sys_menu` VALUES (2067, '商品SKU管理', 2, 3, 'spec_list', 'goods/spec', NULL, 1, 0, 'C', '0', '0', '', 'theme', 'admin', '2024-01-16 14:17:39', 'admin', '2024-04-14 18:51:13', '');
INSERT INTO `sys_menu` VALUES (2080, '补发管理', 7, 3, 'shipAgain_list', 'afterSale/shipAgain', NULL, 1, 0, 'C', '0', '0', '', 'time', 'admin', '2024-04-15 14:23:40', 'admin', '2024-06-22 19:28:45', '');
INSERT INTO `sys_menu` VALUES (2086, '分类规格属性', 2, 2, 'goods_category/attribute', 'goods/category/categoryAttribute', '', 1, 0, 'C', '1', '0', '', '', 'admin', '2024-06-22 17:27:01', 'admin', '2024-06-21 21:25:39', '');
INSERT INTO `sys_menu` VALUES (2087, '规格属性值', 2, 2, 'goods_category/attribute_value', 'goods/category/categoryAttributeValue', '', 1, 0, 'C', '1', '0', '', '', 'admin', '2024-06-22 17:27:56', '', '2024-06-21 21:25:33', '');
INSERT INTO `sys_menu` VALUES (2088, '订单拦截', 7, 9, 'intercept_list', 'afterSale/intercept', NULL, 1, 0, 'C', '0', '0', NULL, 'component', 'admin', '2024-06-22 19:26:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '供应商管理', 2, 99, 'vendor_list', 'vendor/index', NULL, 1, 0, 'C', '0', '0', NULL, 'people', 'admin', '2025-07-20 07:51:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '商户店铺管理', 8, 20, 'shop_list', 'merchant/shop/index', NULL, 1, 0, 'C', '0', '0', NULL, 'github', 'admin', '2025-07-20 09:06:09', '', NULL, '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 416 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (415, '店铺订单', 5, 'cn.qihangerp.api.controller.ErpOrderController.export()', 'POST', 1, 'admin', NULL, '/api/order/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-05-08 14:50:58', 2385);

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint NOT NULL AUTO_INCREMENT COMMENT '文件id',
  `file_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'URL地址',
  `object_name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '对象名',
  `bucket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '桶名',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文件表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-08-07 19:31:37', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-08-07 19:31:37', 'admin', '2024-04-15 10:29:55', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

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
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户10供应商20商户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '启航', '00', '280645618@qq.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-07-20 09:42:52', 'admin', '2023-08-07 19:31:37', '', '2025-07-20 09:42:52', '管理员');
INSERT INTO `sys_user` VALUES (2, 101, 'qihang', 'qihang', '00', 'qihang@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-07-19 22:10:36', 'admin', '2023-08-07 19:31:37', 'admin', '2025-07-19 22:10:35', '测试员');
INSERT INTO `sys_user` VALUES (100, NULL, 'admin11', 'aa', '00', '', '', '1', '', '$2a$10$VD49q2rn1ATpQDZJJrmJjuG52b4EkOTTZ0MPbRRmcqEYLmB5mAMsG', '0', '2', '', NULL, 'admin', '2024-04-24 11:06:27', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

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
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
