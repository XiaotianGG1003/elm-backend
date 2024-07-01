/*
 Navicat Premium Data Transfer

 Source Server         : 1
 Source Server Type    : MySQL
 Source Server Version : 80036
 Source Host           : localhost:3307
 Source Schema         : elm

 Target Server Type    : MySQL
 Target Server Version : 80036
 File Encoding         : 65001

 Date: 01/07/2024 15:15:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `businessId` int NOT NULL AUTO_INCREMENT COMMENT '商家编号',
  `businessName` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商家名称',
  `businessAddress` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商家地址',
  `businessExplain` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '商家介绍',
  `businessImg` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商家图片',
  `orderTypeId` int NOT NULL COMMENT '点餐分类： 1：美食、2：早餐、3：跑腿代购、4：汉堡披萨、5：甜品饮品、6：速食简餐、7：地方小吃、8：米粉面馆、9：包子粥铺、10：炸鸡炸串',
  `startPrice` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '起送费',
  `deliveryPrice` decimal(5, 2) NULL DEFAULT 0.00 COMMENT '配送费',
  `remarks` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`businessId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of business
-- ----------------------------
INSERT INTO `business` VALUES (1001, '小掌柜煲仔饭', '山东省济南市长清区固云湖街道济南大学科技园商业公园步行街2-4-101-1号商铺\n', '煲仔饭', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/1.png', 1, 15.00, 2.00, '');
INSERT INTO `business` VALUES (1002, '喜小柳香酥鸡柳饼', '山东省济南市长清区尚云湖街道中建长清湖和园42-102-202\n', '鸡柳饼', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/2.jpg', 7, 15.00, 3.00, '');
INSERT INTO `business` VALUES (1003, '蜜雪冰城', '山东省济南市长清区尚云湖街道西城软件园广场二期第一层E116室\n', '饮品', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/3.jpg', 5, 15.00, 1.50, '');
INSERT INTO `business` VALUES (1004, '小馋猫烤肉拌饭', '山东省济南市长清区尚云湖街道长清湖小区润园25-107-2\n', '烤肉拌饭', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/4.png', 1, 15.00, 2.00, '');
INSERT INTO `business` VALUES (1005, '肯德基', '山东省济南市高新区海棠路8366号山东工业技术研究院一期一层132店铺\n', '汉堡', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/5.jpg', 4, 20.00, 1.00, '');
INSERT INTO `business` VALUES (1006, '包子客牛肉汤包\n', '山东省济南市高新区创新谷长清湖57-103\n', '各种包子', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/6.jpg', 9, 16.00, 2.50, NULL);
INSERT INTO `business` VALUES (1007, '正宗河间驴肉火烧\n', '山东省济南市长清区崮云湖街道中建长清湖知园39号楼101', '各种火烧', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/7.jpg', 7, 18.00, 2.00, NULL);
INSERT INTO `business` VALUES (1008, '妈妈的菜\n', '山东省济南市长清区崮\r\n云湖街道大学科技园3501号齐鲁工大学熙华路东\n', '菜馆', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/8.png', 1, 20.00, 1.50, NULL);
INSERT INTO `business` VALUES (1009, '阿呆猛火炒饭\n', '山东省济南市长清区崮云湖街道长清湖小区知园48-1', '炒饭', '\nhttps://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/9.png', 1, 15.00, 1.00, NULL);

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart`  (
  `cartId` int NOT NULL AUTO_INCREMENT COMMENT '无意义编号',
  `foodId` int NOT NULL COMMENT '食品编号',
  `businessId` int NOT NULL COMMENT '所属商家编号',
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属用户编号',
  `quantity` int NOT NULL COMMENT '同一类型食品的购买数量',
  PRIMARY KEY (`cartId`) USING BTREE,
  INDEX `fk_foodId`(`foodId` ASC) USING BTREE,
  INDEX `fk_businessId2`(`businessId` ASC) USING BTREE,
  INDEX `fk_userId`(`userId` ASC) USING BTREE,
  CONSTRAINT `fk_businessId2` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_foodId` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES (101, 1, 1001, 'e1', 2);
INSERT INTO `cart` VALUES (102, 2, 1001, 'e1', 2);
INSERT INTO `cart` VALUES (103, 3, 1001, 'e1', 1);
INSERT INTO `cart` VALUES (104, 7, 1003, 'e1', 3);
INSERT INTO `cart` VALUES (105, 6, 1003, 'e2', 2);
INSERT INTO `cart` VALUES (106, 9, 1003, 'e2', 3);
INSERT INTO `cart` VALUES (107, 11, 1009, 'e2', 1);
INSERT INTO `cart` VALUES (108, 12, 1009, 'e2', 1);
INSERT INTO `cart` VALUES (129, 1, 1001, 'e1', 2);
INSERT INTO `cart` VALUES (130, 2, 1001, 'e1', 1);
INSERT INTO `cart` VALUES (131, 1, 1001, 'e1', 2);

-- ----------------------------
-- Table structure for deliveryaddress
-- ----------------------------
DROP TABLE IF EXISTS `deliveryaddress`;
CREATE TABLE `deliveryaddress`  (
  `daId` int NOT NULL AUTO_INCREMENT COMMENT '送货地址编号',
  `contactName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人姓名',
  `contactSex` int NOT NULL COMMENT '联系人性别',
  `contactTel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系人电话',
  `address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '送货地址',
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属用户编号',
  PRIMARY KEY (`daId`) USING BTREE,
  INDEX `fk_userId1`(`userId` ASC) USING BTREE,
  CONSTRAINT `fk_userId1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2003 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of deliveryaddress
-- ----------------------------
INSERT INTO `deliveryaddress` VALUES (2001, '张三', 1, '12333', '山东省济南市高新区创新谷发展中心C座', 'e1');
INSERT INTO `deliveryaddress` VALUES (2002, '李四', 0, '12444', '山东省济南市长清区徕福新居25号楼3单元', 'e2');

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `foodId` int NOT NULL AUTO_INCREMENT COMMENT '食品编号',
  `foodName` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '食品名称',
  `foodExplain` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '食品介绍',
  `foodImg` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '食品图片',
  `foodPrice` decimal(5, 2) NOT NULL COMMENT '食品价格',
  `businessId` int NOT NULL COMMENT '所属商家编号',
  `remarks` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`foodId`) USING BTREE,
  INDEX `fk_businessId`(`businessId` ASC) USING BTREE,
  CONSTRAINT `fk_businessId` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, '腊味双拼煲仔饭', '广式腊肠和腊肉', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f1.jpg', 22.50, 1001, NULL);
INSERT INTO `food` VALUES (2, '豉香排骨煲仔饭', '猪排骨', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f2.jpg', 23.00, 1001, NULL);
INSERT INTO `food` VALUES (3, '酱香肉沫茄子煲仔饭', '猪肉沫和茄子', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f3.jpg', 13.80, 1001, NULL);
INSERT INTO `food` VALUES (4, '香菇滑鸡煲仔饭', '鸡肉和香菇', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f4.jpg', 18.80, 1001, NULL);
INSERT INTO `food` VALUES (5, '辣椒炒肉煲仔饭', '猪肉和辣椒', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f5.jpg', 18.60, 1001, NULL);
INSERT INTO `food` VALUES (6, '冰鲜柠檬水', '柠檬', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f6.jpg', 5.00, 1003, NULL);
INSERT INTO `food` VALUES (7, '芋圆葡萄', '芋圆加葡萄', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f7.jpg', 9.00, 1003, NULL);
INSERT INTO `food` VALUES (8, '桑葚莓莓', '桑葚加草莓', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f8.jpg', 10.00, 1003, NULL);
INSERT INTO `food` VALUES (9, '脆皮大圣代', '冰淇淋', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f9.jpg', 8.00, 1003, NULL);
INSERT INTO `food` VALUES (10, '阿呆经典蛋炒饭', '优质大米和鸡蛋', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f10.jpg', 15.10, 1009, NULL);
INSERT INTO `food` VALUES (11, '老干妈牛肉炒饭', '牛肉和鸡蛋', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f11.jpg', 17.40, 1009, NULL);
INSERT INTO `food` VALUES (12, '孜然鱿鱼炒饭', '鱿鱼和鸡蛋', 'https://codetao-cc.oss-cn-wuhan-lr.aliyuncs.com/picture/f12.jpg', 20.10, 1009, NULL);

-- ----------------------------
-- Table structure for oders
-- ----------------------------
DROP TABLE IF EXISTS `oders`;
CREATE TABLE `oders`  (
  `oderId` int NOT NULL AUTO_INCREMENT COMMENT '订单编号',
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所属用户编号',
  `businessId` int NOT NULL COMMENT '所属商家编号',
  `orderDate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '订购日期',
  `orderTotal` decimal(7, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总价',
  `daId` int NOT NULL COMMENT '所属送货地址编号',
  `oderState` int NOT NULL DEFAULT 0 COMMENT '订单状态（0：未支付；1：已支付）',
  PRIMARY KEY (`oderId`) USING BTREE,
  INDEX `fk_userId2`(`userId` ASC) USING BTREE,
  INDEX `fk_businessId1`(`businessId` ASC) USING BTREE,
  INDEX `fk_daId`(`daId` ASC) USING BTREE,
  CONSTRAINT `fk_businessId1` FOREIGN KEY (`businessId`) REFERENCES `business` (`businessId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_daId` FOREIGN KEY (`daId`) REFERENCES `deliveryaddress` (`daId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_userId2` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3005 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oders
-- ----------------------------
INSERT INTO `oders` VALUES (3001, 'e1', 1001, '2024-06-23', 82.30, 2001, 0);
INSERT INTO `oders` VALUES (3002, 'e1', 1003, '2024-06-24', 27.00, 2001, 1);
INSERT INTO `oders` VALUES (3003, 'e2', 1003, '2024-06-24', 34.00, 2002, 1);
INSERT INTO `oders` VALUES (3004, 'e2', 1009, '2024-06-25', 37.50, 2002, 1);

-- ----------------------------
-- Table structure for orderdetailet
-- ----------------------------
DROP TABLE IF EXISTS `orderdetailet`;
CREATE TABLE `orderdetailet`  (
  `odId` int NOT NULL AUTO_INCREMENT COMMENT '订单明细编号',
  `orderId` int NOT NULL COMMENT '所属订单编号',
  `foodId` int NOT NULL COMMENT '所属食品编号',
  `quantity` int NOT NULL COMMENT '数量',
  PRIMARY KEY (`odId`) USING BTREE,
  INDEX `fk_oderId`(`orderId` ASC) USING BTREE,
  INDEX `fk_foodId1`(`foodId` ASC) USING BTREE,
  CONSTRAINT `fk_foodId1` FOREIGN KEY (`foodId`) REFERENCES `food` (`foodId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_oderId` FOREIGN KEY (`orderId`) REFERENCES `oders` (`oderId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orderdetailet
-- ----------------------------
INSERT INTO `orderdetailet` VALUES (4001, 3001, 1, 1);
INSERT INTO `orderdetailet` VALUES (4002, 3001, 2, 2);
INSERT INTO `orderdetailet` VALUES (4003, 3001, 3, 1);
INSERT INTO `orderdetailet` VALUES (4004, 3002, 7, 3);
INSERT INTO `orderdetailet` VALUES (4005, 3003, 6, 2);
INSERT INTO `orderdetailet` VALUES (4006, 3003, 9, 3);
INSERT INTO `orderdetailet` VALUES (4007, 3004, 11, 1);
INSERT INTO `orderdetailet` VALUES (4008, 3004, 12, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户编号',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `userName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
  `userSex` int NOT NULL DEFAULT 1 COMMENT '用户性别（1：男；0：女）',
  `userImg` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '用户头像',
  `delTag` int NOT NULL DEFAULT 1 COMMENT '删除标记（1：正常；0：删除）',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('e1', '123', 'zs', 1, NULL, 1);
INSERT INTO `user` VALUES ('e2', '1234', 'ls', 0, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
