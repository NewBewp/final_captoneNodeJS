/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `binh_luan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_cong_viec` int DEFAULT NULL,
  `ma_nguoi_binh_luan` int DEFAULT NULL,
  `ngay_binh_luan` datetime DEFAULT NULL,
  `noi_dung` varchar(500) DEFAULT NULL,
  `sao_binh_luan` int DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_cong_viec` (`ma_cong_viec`),
  KEY `ma_nguoi_binh_luan` (`ma_nguoi_binh_luan`),
  CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`ma_cong_viec`) REFERENCES `cong_viec` (`id`),
  CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`ma_nguoi_binh_luan`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `chi_tiet_loai_cong_viec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_chi_tiet` varchar(255) DEFAULT NULL,
  `ma_nhom_chi_tiet` int DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_nhom_chi_tiet` (`ma_nhom_chi_tiet`),
  CONSTRAINT `chi_tiet_loai_cong_viec_ibfk_1` FOREIGN KEY (`ma_nhom_chi_tiet`) REFERENCES `nhom_chi_tiet_loai` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cong_viec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_cong_viec` varchar(255) DEFAULT NULL,
  `danh_gia` int DEFAULT NULL,
  `gia_tien` int DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  `mo_ta` varchar(255) DEFAULT NULL,
  `mo_ta_ngan` varchar(255) DEFAULT NULL,
  `sao_cong_viec` int DEFAULT NULL,
  `ma_chi_tiet_loai` int DEFAULT NULL,
  `nguoi_tao` int DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_chi_tiet_loai` (`ma_chi_tiet_loai`),
  KEY `nguoi_tao` (`nguoi_tao`),
  CONSTRAINT `cong_viec_ibfk_1` FOREIGN KEY (`ma_chi_tiet_loai`) REFERENCES `chi_tiet_loai_cong_viec` (`id`),
  CONSTRAINT `cong_viec_ibfk_2` FOREIGN KEY (`nguoi_tao`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `loai_cong_viec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_loai_cong_viec` varchar(255) DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nguoi_dung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `birth_day` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `skil` varchar(255) DEFAULT NULL,
  `certification` varchar(255) DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `nhom_chi_tiet_loai` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten_nhom` varchar(255) DEFAULT NULL,
  `ma_loai_cong_viec` int DEFAULT NULL,
  `hinh_anh` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_loai_cong_viec` (`ma_loai_cong_viec`),
  CONSTRAINT `nhom_chi_tiet_loai_ibfk_1` FOREIGN KEY (`ma_loai_cong_viec`) REFERENCES `loai_cong_viec` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `thue_cong_viec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ma_cong_viec` int DEFAULT NULL,
  `ma_nguoi_thue` int DEFAULT NULL,
  `ngay_thue` datetime DEFAULT NULL,
  `hoan_thanh` tinyint(1) DEFAULT NULL,
  `trang_thai` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ma_cong_viec` (`ma_cong_viec`),
  KEY `ma_nguoi_thue` (`ma_nguoi_thue`),
  CONSTRAINT `thue_cong_viec_ibfk_1` FOREIGN KEY (`ma_cong_viec`) REFERENCES `cong_viec` (`id`),
  CONSTRAINT `thue_cong_viec_ibfk_2` FOREIGN KEY (`ma_nguoi_thue`) REFERENCES `nguoi_dung` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `binh_luan` (`id`, `ma_cong_viec`, `ma_nguoi_binh_luan`, `ngay_binh_luan`, `noi_dung`, `sao_binh_luan`, `trang_thai`) VALUES
(9, 1, 1, '2023-01-01 08:00:00', 'Bình luận cho công việc 1', 4, 1);
INSERT INTO `binh_luan` (`id`, `ma_cong_viec`, `ma_nguoi_binh_luan`, `ngay_binh_luan`, `noi_dung`, `sao_binh_luan`, `trang_thai`) VALUES
(10, 2, 2, '2023-01-02 10:30:00', 'Bình luận cho công việc 2', 5, 1);


INSERT INTO `chi_tiet_loai_cong_viec` (`id`, `ten_chi_tiet`, `ma_nhom_chi_tiet`, `trang_thai`) VALUES
(1, 'Chi Tiết 1', 1, 1);
INSERT INTO `chi_tiet_loai_cong_viec` (`id`, `ten_chi_tiet`, `ma_nhom_chi_tiet`, `trang_thai`) VALUES
(2, 'Chi Tiết 2', 2, 1);
INSERT INTO `chi_tiet_loai_cong_viec` (`id`, `ten_chi_tiet`, `ma_nhom_chi_tiet`, `trang_thai`) VALUES
(3, 'Chi Tiết 3', 1, 1);
INSERT INTO `chi_tiet_loai_cong_viec` (`id`, `ten_chi_tiet`, `ma_nhom_chi_tiet`, `trang_thai`) VALUES
(4, 'Chi Tiết 4', 2, 1);

INSERT INTO `cong_viec` (`id`, `ten_cong_viec`, `danh_gia`, `gia_tien`, `hinh_anh`, `mo_ta`, `mo_ta_ngan`, `sao_cong_viec`, `ma_chi_tiet_loai`, `nguoi_tao`, `trang_thai`) VALUES
(1, 'Công Việc 1', 4, 100, 'hinh_anh_1.jpg', 'Mô tả công việc 1', 'Mô tả ngắn công việc 1', 4, 1, 1, 1);
INSERT INTO `cong_viec` (`id`, `ten_cong_viec`, `danh_gia`, `gia_tien`, `hinh_anh`, `mo_ta`, `mo_ta_ngan`, `sao_cong_viec`, `ma_chi_tiet_loai`, `nguoi_tao`, `trang_thai`) VALUES
(2, 'Công Việc 2', 5, 150, 'hinh_anh_2.jpg', 'Mô tả công việc 2', 'Mô tả ngắn công việc 2', 5, 2, 2, 1);


INSERT INTO `loai_cong_viec` (`id`, `ten_loai_cong_viec`, `trang_thai`) VALUES
(1, 'Loại Công Việc 1', 1);
INSERT INTO `loai_cong_viec` (`id`, `ten_loai_cong_viec`, `trang_thai`) VALUES
(2, 'Loại Công Việc 2', 1);
INSERT INTO `loai_cong_viec` (`id`, `ten_loai_cong_viec`, `trang_thai`) VALUES
(3, 'Loại Công Việc 3', 1);
INSERT INTO `loai_cong_viec` (`id`, `ten_loai_cong_viec`, `trang_thai`) VALUES
(4, 'Loại Công Việc 4', 1),
(5, 'không thiết kế nữa', 0);

INSERT INTO `nguoi_dung` (`id`, `name`, `email`, `pass_word`, `phone`, `birth_day`, `gender`, `role`, `skil`, `certification`, `trang_thai`, `avatar`) VALUES
(1, 'Người Dùng 1', 'nguoidung1@example.com', 'password1', '123456789', '1990-01-01', 'Male', 'ADMIN', 'Skill1', 'Cert1', 1, 'avatar1.jpg');
INSERT INTO `nguoi_dung` (`id`, `name`, `email`, `pass_word`, `phone`, `birth_day`, `gender`, `role`, `skil`, `certification`, `trang_thai`, `avatar`) VALUES
(2, 'Người Dùng 2', 'nguoidung2@example.com', 'password2', '987654321', '1995-05-05', 'Female', 'USER', 'Skill2', 'Cert2', 0, 'avatar2.jpg');
INSERT INTO `nguoi_dung` (`id`, `name`, `email`, `pass_word`, `phone`, `birth_day`, `gender`, `role`, `skil`, `certification`, `trang_thai`, `avatar`) VALUES
(3, 'Người Dùng 3', 'nguoidung3@example.com', 'password3', '555555555', '1985-10-10', 'Male', 'USER', 'Skill3', 'Cert3', 1, 'avatar3.jpg');
INSERT INTO `nguoi_dung` (`id`, `name`, `email`, `pass_word`, `phone`, `birth_day`, `gender`, `role`, `skil`, `certification`, `trang_thai`, `avatar`) VALUES
(4, 'Người Dùng 4', 'nguoidung4@example.com', 'password4', '111111111', '2000-12-12', 'Female', 'ADMIN', 'Skill4', 'Cert4', 0, 'avatar4.jpg'),
(5, 'kien', 'kien@gmail.com', '$2b$10$TH9Xhtw43OwTM/Cq6nmo0OCQmKGPPzEiSGXsH7cCKZeyPSIJeUtcC', '099999', '1999-12-12', 'Female', 'ADMIN', NULL, NULL, 1, 'https://www.gundammad.co.uk/images/D/justice1.jpg'),
(6, 'kien2', 'kien2@gmail.com', '$2b$10$Uz3Sm4VonLTa7vFRCVJyxuIMO0WCbECrJpVR5gCkn9XK/laIzNPBO', '0999', '1999-12-12', 'Male', 'USER', NULL, NULL, 1, NULL),
(7, 'ADMIN', 'admin@gmail.com', '$2b$10$BUTqauv98LdOcBRxN3bf4OxUKgs3vANj9sn/ohlsrDENZDtZZQ5y.', NULL, NULL, NULL, 'ADMIN', NULL, NULL, 1, NULL);

INSERT INTO `nhom_chi_tiet_loai` (`id`, `ten_nhom`, `ma_loai_cong_viec`, `hinh_anh`) VALUES
(1, 'Nhóm Chi Tiết 1', 1, 'hinh_anh_1.jpg');
INSERT INTO `nhom_chi_tiet_loai` (`id`, `ten_nhom`, `ma_loai_cong_viec`, `hinh_anh`) VALUES
(2, 'Nhóm Chi Tiết 2', 2, 'hinh_anh_2.jpg');
INSERT INTO `nhom_chi_tiet_loai` (`id`, `ten_nhom`, `ma_loai_cong_viec`, `hinh_anh`) VALUES
(3, 'Nhóm Chi Tiết 3', 1, 'hinh_anh_3.jpg');
INSERT INTO `nhom_chi_tiet_loai` (`id`, `ten_nhom`, `ma_loai_cong_viec`, `hinh_anh`) VALUES
(4, 'Nhóm Chi Tiết 4', 2, 'hinh_anh_4.jpg');

INSERT INTO `thue_cong_viec` (`id`, `ma_cong_viec`, `ma_nguoi_thue`, `ngay_thue`, `hoan_thanh`, `trang_thai`) VALUES
(1, 1, 2, '2023-01-01 08:00:00', 0, 1);
INSERT INTO `thue_cong_viec` (`id`, `ma_cong_viec`, `ma_nguoi_thue`, `ngay_thue`, `hoan_thanh`, `trang_thai`) VALUES
(2, 2, 3, '2023-01-02 10:30:00', 0, 1);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;