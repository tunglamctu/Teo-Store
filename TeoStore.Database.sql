/*
 Navicat Premium Data Transfer

 Source Server         : XAMPP
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : vegetables

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 23/06/2022 14:17:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `id_user` int(10) NOT NULL,
  `id_veg` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  PRIMARY KEY (`id_user`, `id_veg`) USING BTREE,
  INDEX `fk_cart_veg`(`id_veg`) USING BTREE,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_cart_veg` FOREIGN KEY (`id_veg`) REFERENCES `vegetables` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of carts
-- ----------------------------

-- ----------------------------
-- Table structure for feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks`  (
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `vote` int(255) NOT NULL DEFAULT 5,
  `id_user` int(10) NOT NULL,
  `id_veg` int(10) NOT NULL,
  `time` timestamp(0) NULL DEFAULT current_timestamp(0),
  `id` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fbk_user`(`id_user`) USING BTREE,
  INDEX `fbk_veg`(`id_veg`) USING BTREE,
  CONSTRAINT `fbk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fbk_veg` FOREIGN KEY (`id_veg`) REFERENCES `vegetables` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedbacks
-- ----------------------------
INSERT INTO `feedbacks` VALUES ('B?? r???t ngon ???, n??n mua nha m???i ng?????i!', 4, 16, 7, '2022-05-04 19:56:11', 1);
INSERT INTO `feedbacks` VALUES ('S???n ph???m t???t, ngon, ????ng mua ???!', 3, 19, 7, '2022-05-04 22:09:24', 3);
INSERT INTO `feedbacks` VALUES ('B???p chu???i r???t m???m, ngon, s???ch!', 5, 19, 4, '2022-05-04 23:31:36', 4);
INSERT INTO `feedbacks` VALUES ('B???p c???i t????i ngon l???m ???!', 5, 19, 3, '2022-05-04 23:33:33', 5);
INSERT INTO `feedbacks` VALUES ('', 5, 19, 3, '2022-05-04 23:34:03', 6);
INSERT INTO `feedbacks` VALUES ('', 5, 19, 3, '2022-05-04 23:41:50', 7);
INSERT INTO `feedbacks` VALUES ('', 5, 19, 8, '2022-05-05 00:35:24', 8);
INSERT INTO `feedbacks` VALUES ('', 4, 19, 8, '2022-05-05 00:35:32', 9);
INSERT INTO `feedbacks` VALUES ('R???t ngon ???!', 5, 16, 88, '2022-05-05 09:00:49', 10);
INSERT INTO `feedbacks` VALUES ('N???m t????i ngon l???m ???!', 5, 16, 62, '2022-05-05 09:03:03', 11);
INSERT INTO `feedbacks` VALUES ('B?? r???t ngon ???, n??n mua nha m???i ng?????i!', 5, 16, 8, '2022-05-05 09:06:00', 12);
INSERT INTO `feedbacks` VALUES ('B???p c???i d???', 1, 16, 3, '2022-05-05 11:29:33', 13);
INSERT INTO `feedbacks` VALUES ('B??ng b?? r???t t????i ngon!', 5, 16, 10, '2022-05-05 14:54:18', 14);
INSERT INTO `feedbacks` VALUES ('C???i r???t non, t????i ngon l???m ???!', 5, 16, 24, '2022-05-05 15:05:46', 15);
INSERT INTO `feedbacks` VALUES ('', 5, 16, 5, '2022-05-05 19:13:36', 16);
INSERT INTO `feedbacks` VALUES ('B???p non ngon ng???t l???m ???!', 5, 16, 5, '2022-05-05 19:14:24', 17);
INSERT INTO `feedbacks` VALUES ('', 4, 16, 6, '2022-05-05 19:14:48', 18);
INSERT INTO `feedbacks` VALUES ('R???t t????i ngon ??? m???i ng?????i ??i!!!', 4, 16, 14, '2022-05-05 19:15:07', 19);
INSERT INTO `feedbacks` VALUES ('D??a leo r???t t????i ngon, em mua ?????p m???t r???t th??ch ???!', 5, 16, 41, '2022-05-05 19:16:06', 20);
INSERT INTO `feedbacks` VALUES ('', 5, 16, 7, '2022-05-09 16:25:51', 23);
INSERT INTO `feedbacks` VALUES ('B?? r???t ngon ???, n??n mua nha m???i ng?????i!', 5, 16, 7, '2022-05-09 16:30:40', 24);
INSERT INTO `feedbacks` VALUES ('B??ng h??? t????i ngon l???m ???!', 5, 16, 11, '2022-05-10 13:16:46', 25);
INSERT INTO `feedbacks` VALUES ('B???p chu???i t????i ngon l???m ???!', 5, 16, 4, '2022-05-11 16:20:11', 26);
INSERT INTO `feedbacks` VALUES ('B??ng t????i l???m', 5, 19, 13, '2022-05-17 08:32:21', 27);
INSERT INTO `feedbacks` VALUES ('Ngon l???m!!!', 4, 19, 16, '2022-05-17 09:03:31', 28);
INSERT INTO `feedbacks` VALUES ('B???p c???i r???t ngon ???, n??n mua nha m???i ng?????i!', 4, 19, 2, '2022-05-17 09:06:51', 29);

-- ----------------------------
-- Table structure for order_details
-- ----------------------------
DROP TABLE IF EXISTS `order_details`;
CREATE TABLE `order_details`  (
  `id_order` int(10) NOT NULL,
  `id_veg` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `price` decimal(10, 0) NOT NULL,
  PRIMARY KEY (`id_order`, `id_veg`) USING BTREE,
  INDEX `fk_veg_detail`(`id_veg`) USING BTREE,
  CONSTRAINT `fk_order_detail` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_veg_detail` FOREIGN KEY (`id_veg`) REFERENCES `vegetables` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_details
-- ----------------------------
INSERT INTO `order_details` VALUES (56, 7, 1, 3000);
INSERT INTO `order_details` VALUES (56, 25, 1, 10000);
INSERT INTO `order_details` VALUES (61, 7, 2, 3000);
INSERT INTO `order_details` VALUES (61, 10, 2, 5000);
INSERT INTO `order_details` VALUES (61, 16, 1, 8000);
INSERT INTO `order_details` VALUES (62, 13, 1, 20000);
INSERT INTO `order_details` VALUES (62, 18, 2, 10000);
INSERT INTO `order_details` VALUES (62, 25, 2, 10000);
INSERT INTO `order_details` VALUES (87, 2, 1, 5000);
INSERT INTO `order_details` VALUES (87, 3, 1, 10000);
INSERT INTO `order_details` VALUES (92, 7, 2, 3000);
INSERT INTO `order_details` VALUES (92, 9, 1, 15000);
INSERT INTO `order_details` VALUES (93, 6, 3, 5000);
INSERT INTO `order_details` VALUES (93, 7, 2, 3000);
INSERT INTO `order_details` VALUES (94, 2, 10, 5000);
INSERT INTO `order_details` VALUES (94, 16, 2, 8000);
INSERT INTO `order_details` VALUES (94, 45, 3, 15000);
INSERT INTO `order_details` VALUES (95, 40, 1, 6500);

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `id_user` int(10) NOT NULL,
  `order_time` timestamp(6) NULL DEFAULT current_timestamp(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `delivery_time` timestamp(6) NULL DEFAULT current_timestamp(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `id_status` int(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_oder_status`(`id_status`) USING BTREE,
  INDEX `fk_order_user`(`id_user`) USING BTREE,
  CONSTRAINT `fk_oder_status` FOREIGN KEY (`id_status`) REFERENCES `status` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (56, 16, '2021-12-14 12:30:16.640093', '2021-12-14 12:30:16.640093', 4);
INSERT INTO `orders` VALUES (61, 16, '2021-12-14 12:55:21.312294', '2021-12-14 12:55:21.312294', 4);
INSERT INTO `orders` VALUES (62, 16, '2021-12-14 14:31:16.713191', '2021-12-14 14:31:16.713191', 2);
INSERT INTO `orders` VALUES (87, 16, '2022-05-17 08:22:56.622451', '2022-05-17 08:22:56.622451', 1);
INSERT INTO `orders` VALUES (92, 19, '2022-05-17 08:30:19.516525', '2022-05-17 08:30:19.516525', 2);
INSERT INTO `orders` VALUES (93, 19, '2022-05-17 08:56:18.276478', '2022-05-17 08:56:18.276478', 3);
INSERT INTO `orders` VALUES (94, 16, '2022-05-17 09:59:39.024253', '2022-05-17 09:59:39.024253', 1);
INSERT INTO `orders` VALUES (95, 19, '2022-06-17 09:36:00.065099', '2022-06-17 09:36:00.065099', 2);

-- ----------------------------
-- Table structure for originals
-- ----------------------------
DROP TABLE IF EXISTS `originals`;
CREATE TABLE `originals`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `seed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `planting_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of originals
-- ----------------------------
INSERT INTO `originals` VALUES (1, 'C??ng ty c??? ph???n gi???ng c??y tr???ng trung ????ng (Vinaseed)', 'H???p t??c x?? Long Kh??, huy???n C???n ???????c, t???nh Long An');
INSERT INTO `originals` VALUES (2, 'T???ng c??ng ty rau qu??? n??ng s???n', 'C??nh ?????ng n??ng s???n s???ch, x?? H??a B??nh, huy???n Tr?? ??n, t???nh V??nh Long');
INSERT INTO `originals` VALUES (3, 'C??ng ty h???t gi???ng Sen V??ng', 'Khu nh?? k??nh n??ng s???n, x?? An B??nh, huy???n Long H???, t???nh V??nh Long ');
INSERT INTO `originals` VALUES (4, 'C??ng ty c??? ph???n gi???ng c??y tr???ng Mi???n Nam', 'M?? h??nh c??nh ?????ng m?? ?????c t???i x?? H??a An, huy???n Ph???ng Hi???p, t???nh H???u Giang');
INSERT INTO `originals` VALUES (5, 'C??ng ty h???t gi???ng B??nh Minh', 'V??ng tr???ng rau an to??n c???a x?? Th??n C???u Ngh??a, huy???n Ch??u Th??nh, t???nh Ti???n Giang');
INSERT INTO `originals` VALUES (6, 'C??ng ty c??? ph???n Gi???ng M???i', 'M?? h??nh c??nh ?????ng m?? ?????c t???i x?? Long Th???nh, huy???n Ch??u Th??nh A, t???nh H???u Giang');
INSERT INTO `originals` VALUES (7, 'C??ng ty TNHH th????ng m???i d???ch v??? V?????n Xinh', 'V??ng tr???ng rau an to??n c???a x?? B??nh Phan, huy???n ch??? G???o, t???nh Ti???n Giang');
INSERT INTO `originals` VALUES (8, 'C??ng ty CP H??? sinh th??i c??ng ngh??? Vi???t Nam', 'N??ng tr???i Rau s???ch, TP. ???? L???t, t???nh L??m ?????ng.');

-- ----------------------------
-- Table structure for status
-- ----------------------------
DROP TABLE IF EXISTS `status`;
CREATE TABLE `status`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of status
-- ----------------------------
INSERT INTO `status` VALUES (1, 'Ch??a x??? l??');
INSERT INTO `status` VALUES (2, '??ang chu???n b???');
INSERT INTO `status` VALUES (3, '??ang giao');
INSERT INTO `status` VALUES (4, '???? giao');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` int(10) NOT NULL DEFAULT 1,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Qu???n tr??? vi??n', '0', '0', '123', 'admin@gmail.com', 0, 'default.jpg');
INSERT INTO `users` VALUES (3, 'Nguy???n Ho??ng Th??ng', '0358309329', '12 ???????ng L?? T??? Tr???ng, ph?????ng An L???c, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'thong@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (4, 'H???u Di???m Xu??n', '0123763585', '45 ???????ng Tr???n H??ng ?????o, ph?????ng Xu??n Kh??nh, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'xuan@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (5, 'Ph???m Ch?? Trung', '0925385162', '82 ???????ng Tr???n V??n Ho??i, ph?????ng Xu??n Kh??nh, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'trung@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (6, '??o??n Duy Thanh', '0873174284', '97 ???????ng H??ng V????ng, ph?????ng An C??, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'thanh@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (7, 'Nguy???n Hu???nh Ho??ng Ph??c', '0836109481', '48 ???????ng Tr???n Ng???c Qu???, ph?????ng Xu??n Kh??nh, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'phuc@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (8, 'Tr???n V??n Thi???t', '0927385387', '55 ???????ng Tr???n Ng???c Qu???, ph?????ng Xu??n Kh??nh, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'thiet@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (9, '??inh Th??? Th??y L???u', '0391278359', '132 ???????ng M???u Th??n, ph?????ng Xu??n Kh??nh, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'luu@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (10, 'Tr???nh Kim Chi', '0331489511', '228 ???????ng Nguy???n Tr??i, ph?????ng C??i Kh???, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'chi@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (11, 'Tr???n Ph????ng Th???o', '0702137273', '312 ???????ng Nguy???n V??n Linh, ph?????ng H??ng L???i, qu???n Ninh Ki???u, TP.C???n Th??', '$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'thao@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (12, 'L?? Minh Kha', '0987654321', 'H???m 49, ???????ng Tr???n Ho??ng Na, ph?????ng H??ng L???i, qu???n Ninh Ki???u, TP. C???n Th??', '123', 'kha@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (15, 'Hu???nh Qu???c Nh???t', '0987654321', 'H???m 49, ???????ng Tr???n Ho??ng Na, ph?????ng H??ng L???i, qu???n Ninh Ki???u, TP. C???n Th??', '12345', 'nhat@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (16, 'Nguy???n T??ng L??m', '0123456789', 'H??ng L???i, Ninh Ki???u, C???n Th??', '$2y$10$N4Z94bbYBtCvHt21NnJQZuqDkY4DfMk3Q/QvxJ/y5ZPlBPbLaCIUy', 'tunglam@gmail.com', 1, 'MyAvatar.jpeg');
INSERT INTO `users` VALUES (17, 'Ki???u Th??? Khanh', '0338307449', '113 B??? V??n ????n, P. An Kh??nh, Q. Ninh Ki???u, C???n Th??', '$2y$10$QVO.1J6.ZqYEEL1fU/zbV.z5oCQt1bkSLgcNZTvYiXLA3giMti51.', 'khanh@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (18, 'Nguy???n H???u L???i', '0338307449', 'X?? Th???i H??a, huy???n Tr?? ??n, t???nh V??nh Long', '$2y$10$BHbzrhdowEJ6djtqVwOtA.vapbB57jAu5m46kSTbM5yuhu0jGWyO6', 'loi@gmail.com', 1, 'default.jpg');
INSERT INTO `users` VALUES (19, 'Nguy???n T??ng L??m', '0338307449', 'Nguy???n V??n Linh, P.H??ng L???i, Q.Ninh Ki???u, TP.C???n Th??', '$2y$10$gJ8HPt3/AwM5MugGJpUYI.66NcFrmQuifiBhdVFQhLgMfZIyOQN.m', 'lamnguyen@gmail.com', 1, 'default.jpg');

-- ----------------------------
-- Table structure for veg_types
-- ----------------------------
DROP TABLE IF EXISTS `veg_types`;
CREATE TABLE `veg_types`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of veg_types
-- ----------------------------
INSERT INTO `veg_types` VALUES (1, 'Rau', '1.jpg');
INSERT INTO `veg_types` VALUES (2, 'C???', '2.jpg');
INSERT INTO `veg_types` VALUES (3, 'Qu???', '3.jpg');
INSERT INTO `veg_types` VALUES (4, 'N???m', '4.jpg');
INSERT INTO `veg_types` VALUES (5, 'B??ng', '5.jpg');
INSERT INTO `veg_types` VALUES (6, 'H???t', '6.jpg');

-- ----------------------------
-- Table structure for vegetables
-- ----------------------------
DROP TABLE IF EXISTS `vegetables`;
CREATE TABLE `vegetables`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` int(10) NULL DEFAULT 500,
  `price` decimal(10, 0) NOT NULL,
  `id_orig` int(10) NULL DEFAULT NULL,
  `id_veg_type` int(10) NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `sale` int(10) NULL DEFAULT 0,
  `sale_price` decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_veg_type`(`id_veg_type`) USING BTREE,
  INDEX `fk_veg_orig`(`id_orig`) USING BTREE,
  CONSTRAINT `fk_veg_orig` FOREIGN KEY (`id_orig`) REFERENCES `originals` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_veg_type` FOREIGN KEY (`id_veg_type`) REFERENCES `veg_types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vegetables
-- ----------------------------
INSERT INTO `vegetables` VALUES (1, 'B???c h??', 500, 5000, 1, 1, '1652754059.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (2, 'B???p c???i t??m', 1000, 10000, 1, 1, '1652756426.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (3, 'B???p c???i tr???ng', 1000, 10000, 1, 1, '3.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (4, 'B???p chu???i b??o', 500, 15000, 1, 1, '4.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (5, 'B???p non', 500, 20000, 1, 3, '5.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (6, 'B???u', 500, 5000, 1, 3, '6.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (7, 'B?? ??ao', 500, 5000, 1, 3, '7.jpg', 1, 2000);
INSERT INTO `vegetables` VALUES (8, 'B?? ?????', 250, 5000, 1, 3, '8.jpg', 1, 4000);
INSERT INTO `vegetables` VALUES (9, 'B?? ng??i', 500, 15000, 1, 3, '9.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (10, 'B??ng b??', 250, 8000, 1, 5, '10.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (11, 'B??ng h???', 250, 10000, 1, 5, '11.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (12, 'B??ng so ????a', 250, 8000, 1, 5, '12.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (13, 'B??ng thi??n l??', 250, 20000, 2, 5, '13.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (14, 'C?? chua', 500, 6000, 2, 3, '14.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (15, 'C?? ph??o', 500, 20000, 2, 3, '15.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (16, 'C?? r???t', 500, 8000, 2, 2, '16.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (17, 'C?? t??m', 500, 7000, 2, 3, '17.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (18, 'C???i b??? d??a', 500, 10000, 2, 1, '18.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (19, 'C???i b??? d??n', 500, 10000, 3, 1, '19.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (20, 'C???i b??? xanh', 500, 10000, 3, 1, '20.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (21, 'C???i b?? x??i', 500, 15000, 3, 1, '21.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (22, 'C???i ng???t', 500, 10000, 3, 1, '22.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (23, 'C???i th???o', 500, 10000, 3, 1, '23.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (24, 'C???i x?? l??ch', 500, 10000, 4, 1, '24.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (25, 'X?? l??ch t??m', 500, 15000, 4, 1, '25.jpg', 1, 10000);
INSERT INTO `vegetables` VALUES (26, 'X?? l??ch xoong', 500, 15000, 4, 1, '26.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (27, 'X?? l??ch l???a', 500, 15000, 4, 1, '27.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (28, 'C???n d??y l??', 250, 5000, 5, 1, '28.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (29, 'C???n t??y', 500, 10000, 5, 1, '29.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (30, 'C???n ??', 500, 15000, 5, 1, '30.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (31, 'Chanh', 500, 20000, 5, 3, '31.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (32, 'C??? c???i tr???ng', 500, 5000, 6, 2, '32.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (33, 'C??? d???n', 500, 7000, 6, 2, '33.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (34, '?????u b???p', 500, 8000, 6, 3, '34.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (35, '?????u ????a', 500, 7000, 6, 1, '35.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (36, '?????u H?? Lan', 500, 8000, 6, 1, '36.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (37, '?????u que', 500, 8000, 7, 1, '37.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (38, '?????u r???ng', 500, 14000, 7, 1, '38.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (39, '?????u v??n', 500, 15000, 7, 1, '39.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (40, 'D??a gang', 500, 6500, 7, 3, '40.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (41, 'D??a leo', 500, 12500, 7, 3, '41.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (42, 'G???ng', 250, 6000, 7, 2, '42.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (43, 'H??nh l??', 500, 10000, 7, 1, '43.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (44, 'H??nh t??y', 500, 6000, 8, 2, '44.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (45, 'H??nh t??m', 500, 15000, 8, 2, '45.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (46, 'H???', 500, 15000, 8, 1, '46.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (47, 'Khoai cao', 500, 12000, 8, 2, '47.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (48, 'Khoai m??n', 500, 12000, 8, 2, '48.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (49, 'Khoai lang', 500, 10000, 8, 2, '49.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (50, 'Khoai lang t??m', 500, 7000, 1, 2, '50.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (51, 'Khoai m??', 500, 6500, 1, 2, '51.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (52, 'Khoai m???', 500, 12000, 1, 2, '52.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (53, 'Khoai t??y', 500, 7000, 1, 2, '53.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (54, 'Khoai t???', 500, 5000, 1, 2, '54.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (55, 'Kh??? qua', 500, 10000, 1, 3, '55.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (56, 'L?? l???t', 500, 5000, 1, 1, '56.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (57, 'M??ng t??y', 500, 20000, 2, 1, '57.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (58, 'M???ng t??i', 500, 5000, 2, 1, '58.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (59, 'M?????p', 500, 7000, 2, 3, '59.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (60, 'N???m b??o ng??', 500, 15000, 2, 4, '60.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (61, 'N???m ????ng c??', 500, 15000, 2, 4, '61.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (62, 'N???m kim ch??m', 500, 15000, 3, 4, '62.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (63, 'N???m r??m', 500, 40000, 3, 4, '63.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (64, 'Ngh???', 500, 6000, 3, 2, '64.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (65, 'Ng?? gai', 250, 4500, 5, 1, '65.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (66, 'Ng?? om', 250, 4500, 7, 1, '66.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (67, 'Ng?? r??', 250, 7000, 4, 1, '67.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (68, '???t chu??ng', 500, 30000, 8, 3, '68.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (69, '???t ?????', 500, 25000, 4, 3, '69.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (70, 'Rau d???n', 500, 10000, 7, 1, '70.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (71, 'Rau di???p c??', 500, 7500, 3, 1, '71.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (72, 'Rau h??ng nh??i', 500, 5000, 6, 1, '72.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (73, 'Rau h??ng qu???', 500, 5000, 2, 1, '73.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (74, 'Rau m??', 500, 12500, 7, 1, '74.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (75, 'Rau mu???ng', 500, 5000, 6, 1, '75.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (76, 'Rau nh??t', 500, 8000, 8, 1, '76.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (77, 'Rau r??m', 500, 13500, 8, 1, '77.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (78, 'Ri???ng', 500, 6500, 6, 2, '78.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (79, 'Su h??o', 500, 5000, 4, 3, '79.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (80, 'B??ng c???i tr???ng', 500, 10000, 6, 1, '80.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (81, 'B??ng c???i xanh', 500, 10000, 2, 1, '81.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (82, 'Th?? l??', 250, 5000, 3, 1, '82.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (83, 'T??a t??', 500, 15500, 5, 1, '83.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (84, 'T???i', 500, 12000, 1, 2, '84.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (85, 'S???', 500, 6000, 5, 1, '85.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (86, 'B??ng ??i??n ??i???n', 500, 40000, 3, 5, '86.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (87, 'B??ng s??ng', 500, 10000, 6, 5, '87.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (88, 'D??a l?????i', 1000, 35000, 8, 3, '88.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (89, 'Gi?? ?????u', 500, 5000, 1, 1, '89.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (90, 'N???m m??o', 500, 40000, 7, 4, '90.jpg', 0, NULL);
INSERT INTO `vegetables` VALUES (91, 'M??ng tre', 500, 30000, 5, 1, '91.jpg', 0, NULL);

-- ----------------------------
-- View structure for v_userlist
-- ----------------------------
DROP VIEW IF EXISTS `v_userlist`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_userlist` AS SELECT id as ID, name as NAME, phone as PHONE, address as ADDRESS, email as EMAIL  from users ;

-- ----------------------------
-- View structure for v_veglist
-- ----------------------------
DROP VIEW IF EXISTS `v_veglist`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_veglist` AS SELECT V.id as ID, V.name as NAME, V.weight as WEIGHT, V.price as PRICE, 
					T.name as TYPE, O.seed as SEED, O.planting_place as PLANTING
	FROM vegetables V JOIN veg_types T ON T.id=V.id_veg_type JOIN originals O ON V.id_orig=O.id ;

-- ----------------------------
-- Procedure structure for sp_book
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_book`;
delimiter ;;
CREATE PROCEDURE `sp_book`(userID int)
begin
	insert into orders(id_user) values (userID);
	select max(id) as orderId
	from orders
	where id_user = userID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_createUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_createUser`;
delimiter ;;
CREATE PROCEDURE `sp_createUser`(userName varchar(255), userPhone varchar(255), 
																userAddress varchar(255), userEmail varchar(255), userPassword varchar(255))
begin
	INSERT INTO users(name, phone, address, email, password) 
				 VALUES (userName, userPhone, userAddress, userEmail, userPassword);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_createVeg
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_createVeg`;
delimiter ;;
CREATE PROCEDURE `sp_createVeg`(nameVeg varchar(255), weightVeg int, priceVeg int, idType int, idOrig int)
begin
	INSERT INTO vegetables(name, weight, price, id_veg_type, id_orig)
	VALUES (nameVeg, weightVeg, priceVeg, idType, idOrig);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_deleteUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_deleteUser`;
delimiter ;;
CREATE PROCEDURE `sp_deleteUser`(userID int)
begin
	DELETE FROM users WHERE id=userID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_deleteVeg
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_deleteVeg`;
delimiter ;;
CREATE PROCEDURE `sp_deleteVeg`(vegID int)
begin
	DELETE FROM vegetables WHERE id=vegID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_getOrderDetails
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getOrderDetails`;
delimiter ;;
CREATE PROCEDURE `sp_getOrderDetails`(orderID int)
begin
	select O.id as id, V.name as item, OD.amount as amount, OD.price as price
	from orders O join order_details OD on O.id = OD.id_order
								join vegetables V on OD.id_veg = V.id
	where O.id = orderID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_getVegeDetail
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getVegeDetail`;
delimiter ;;
CREATE PROCEDURE `sp_getVegeDetail`(vegeID int)
begin
	select V.id, V.name, V.price, V.price, V.sale_price, V.image, V.weight, V.id_veg_type, O.planting_place, O.seed
	from vegetables V JOIN veg_types VT ON V.id_veg_type=VT.id
										JOIN originals O ON V.id_orig=O.id
	where V.id=vegeID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_getVegeInOrder
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_getVegeInOrder`;
delimiter ;;
CREATE PROCEDURE `sp_getVegeInOrder`(orderID int)
begin
	SELECT V.name, V.weight, V.price, V.image, OD.amount
  FROM order_details OD JOIN vegetables V ON OD.id_veg = V.id
  WHERE OD.id_order = orderID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_searchVegByKey
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_searchVegByKey`;
delimiter ;;
CREATE PROCEDURE `sp_searchVegByKey`(searchKey varchar(255))
begin
	SELECT V.id as ID, V.name as NAME, V.weight as WEIGHT, V.price as PRICE, 
					T.name as TYPE, O.seed as SEED, O.planting_place as PLANTING
	FROM vegetables V JOIN veg_types T ON T.id=V.id_veg_type JOIN originals O ON V.id_orig=O.id
	WHERE V.name like (SELECT CONCAT('%',searchKey,'%'));
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_selectFromCart
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_selectFromCart`;
delimiter ;;
CREATE PROCEDURE `sp_selectFromCart`(userID int)
begin
		SELECT * FROM carts WHERE id_user=userID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_selectOrderOfUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_selectOrderOfUser`;
delimiter ;;
CREATE PROCEDURE `sp_selectOrderOfUser`(userID int)
begin
	SELECT O.id as ID, O.order_time as ORDER_TIME, O.delivery_time as DELIVERY_TIME, S.name as STATUS
	FROM users U JOIN orders O ON U.id=O.id_user 
								JOIN status S ON O.id_status=S.id
	WHERE U.id = userID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_selectUserByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_selectUserByID`;
delimiter ;;
CREATE PROCEDURE `sp_selectUserByID`(userID int)
begin
		SELECT id as ID, name AS NAME, address AS ADDRESS, email as EMAIL, phone as PHONE
		FROM users
		WHERE id = userID;
 end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_selectVegByID
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_selectVegByID`;
delimiter ;;
CREATE PROCEDURE `sp_selectVegByID`(vegID int)
begin
		SELECT V.id as ID, V.name as NAME, V.weight as WEIGHT, V.price as PRICE, 
						T.name as TYPE, O.seed as SEED, O.planting_place as PLANTING
		FROM vegetables V JOIN veg_types T ON T.id=V.id_veg_type JOIN originals O ON V.id_orig=O.id
		WHERE V.id = vegID;
 end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_selectVegByType
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_selectVegByType`;
delimiter ;;
CREATE PROCEDURE `sp_selectVegByType`(vegtypeID int)
begin
		SELECT V.id as ID, V.name as NAME, V.weight as WEIGHT, V.price as PRICE, 
						T.name as TYPE, O.seed as SEED, O.planting_place as PLANTING
		FROM vegetables V JOIN veg_types T ON T.id=V.id_veg_type JOIN originals O ON V.id_orig=O.id
		WHERE T.id = vegtypeID;
 end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_selectVegInCartByUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_selectVegInCartByUser`;
delimiter ;;
CREATE PROCEDURE `sp_selectVegInCartByUser`(userID int)
begin
	select V.id, V.image, V.`name`, V.weight, V.price, V.sale_price, C.amount
	from users U join carts C on U.id = C.id_user
								join vegetables V on C.id_veg = V.id
	where U.id = userID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_updateOrderState
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_updateOrderState`;
delimiter ;;
CREATE PROCEDURE `sp_updateOrderState`(orderID int, stateID int)
begin
		UPDATE orders SET id_status=stateID WHERE id=orderID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_updateUser
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_updateUser`;
delimiter ;;
CREATE PROCEDURE `sp_updateUser`(userID int, userName varchar(255), userPhone varchar(255), 
																userAddress varchar(255), userEmail varchar(255), userPassword varchar(255))
begin
			UPDATE users
			SET name=userName, email=userEmail, phone=userPhone, address=userAddress, password=userPassword
			WHERE id = userID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_updateVeg
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_updateVeg`;
delimiter ;;
CREATE PROCEDURE `sp_updateVeg`(vegID int, vegName varchar(255), vegWeight int, vegPrice int, idVegType int, idOrig int)
begin
			UPDATE vegetables
			SET name=vegName, weight=vegWeight, price=vegPrice, id_veg_type=idVegType, id_orig=idOrig
			WHERE id = vegID;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
