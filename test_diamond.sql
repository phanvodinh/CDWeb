-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 24, 2023 lúc 11:49 AM
-- Phiên bản máy phục vụ: 10.4.17-MariaDB
-- Phiên bản PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `test_diamond`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `id` bigint(20) NOT NULL,
  `id_product` bigint(20) NOT NULL,
  `id_bill` bigint(20) NOT NULL,
  `quatity` int(11) NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) NOT NULL,
  `user` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `total` double NOT NULL,
  `quantity` int(11) NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `user`, `phone`, `display_name`, `address`, `total`, `quantity`, `note`) VALUES
(1, 'admin3@gmail.com', '595962985', 'Trần Nam', '56 Thống nhất', 400000, 2, 'giao hàng nhanh'),
(2, 'admin2@gmail.com', '123456789', 'Nguyá»n VÄn Nam', '123 NguyÃ¡Â»Ân TrÃÂ£i', 400000, 2, 'nguyen nam '),
(5, 'admin3@gmail.com', '1456565', 'Tráº§n Nam', '56 Thá»ng Nháº¥t', 400000, 2, 'fine fine'),
(7, 'admin3@gmail.com', '6259596', 'Tráº§n Nam', '56 Thá»ng Nháº¥t', 2000000, 10, 'sdfsdfsdf');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categorys`
--

CREATE TABLE `categorys` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `categorys`
--

INSERT INTO `categorys` (`id`, `name`, `description`) VALUES
(1, 'Đồng hồ', NULL),
(2, 'Vòng tay', NULL),
(3, 'Dây đeo tay', NULL),
(4, 'Dây chuyền', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `id_product` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT 'Vàng',
  `code` varchar(255) DEFAULT '#FFFF00',
  `img` varchar(255) DEFAULT 'f.png'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `id_product`, `name`, `code`, `img`) VALUES
(1, 1, 'Vàng', '#FFFF00', 'a.jpg'),
(2, 1, 'Xanh', '#FFFF00', 'b.jpg'),
(3, 2, 'Vàng', '#FFFF00', 'c.jpg'),
(4, 2, 'Xanh', '#FFFF00', 'd.jpg'),
(5, 5, 'Vàng', '#FFFF00', 'e.jpg'),
(6, 6, 'Vàng', '#FFFF00', 'g.jpg'),
(7, 7, 'Vàng', '#FFFF00', 'h.jpg'),
(8, 8, 'Vàng', '#FFFF00', 'i.jpg'),
(9, 9, 'Vàng', '#FFFF00', 'b.jpg'),
(10, 10, 'Vàng', '#FFFF00', 'b.jpg'),
(11, 11, 'Vàng', '#FFFF00', 'b.jpg'),
(12, 12, 'Vàng', '#FFFF00', 'b.jpg'),
(13, 13, 'Vàng', '#FFFF00', 'b.jpg'),
(14, 14, 'Vàng', '#FFFF00', 'b.jpg'),
(15, 15, 'Vàng', '#FFFF00', 'b.jpg'),
(16, 16, 'Vàng', '#FFFF00', 'b.jpg'),
(17, 17, 'Vàng', '#FFFF00', 'b.jpg'),
(18, 18, 'Vàng', '#FFFF00', 'b.jpg'),
(19, 19, 'Vàng', '#FFFF00', 'b.jpg'),
(20, 20, 'Vàng', '#FFFF00', 'b.jpg'),
(21, 21, 'Vàng', '#FFFF00', 'b.jpg'),
(22, 22, 'Vàng', '#FFFF00', 'b.jpg'),
(27, 33, 'vàng', '#FFFF00', 'f.jpg'),
(28, 32, 'vàng', '#FFFF00', 'f.jpg'),
(29, 31, 'vàng', '#FFFF00', 'f.jpg'),
(36, 54, 'Vàng', '#FFFF00', 'Logo_HCMUAF.png'),
(37, 55, 'Vàng', '#FFFF00', 'Logo_HCMUAF.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `menus`
--

INSERT INTO `menus` (`id`, `name`, `url`) VALUES
(1, 'Trang chủ', 'trang-chu'),
(2, 'Sản phẩm', 'san-pham/1'),
(3, 'So sánh', NULL),
(4, 'Giỏ hàng', NULL),
(5, 'Bài viết', NULL),
(6, 'Liên hệ', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `id_category` int(11) NOT NULL,
  `sizes` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `sale` int(3) DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `highlight` tinyint(1) DEFAULT 1,
  `new_product` tinyint(1) DEFAULT 0,
  `details` longtext DEFAULT NULL,
  `status` varchar(255) DEFAULT 'available',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `id_category`, `sizes`, `name`, `price`, `sale`, `title`, `highlight`, `new_product`, `details`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'L,M,S', 'Manicure & Pedicure', 20000, 0, 'Nowadays the lingerie industry is one of the most successful business spheres. Nowadays the lingerie industry is one of ...', 1, 0, '<div class=\"tab-pane fade active in\" id=\"home\">\r\n			  <h4>Product Information</h4>\r\n                <table class=\"table table-striped\">\r\n				<tbody>\r\n				<tr class=\"techSpecRow\"><td class=\"techSpecTD1\">Color:</td><td class=\"techSpecTD2\">Black</td></tr>\r\n				<tr class=\"techSpecRow\"><td class=\"techSpecTD1\">Style:</td><td class=\"techSpecTD2\">Apparel,Sports</td></tr>\r\n				<tr class=\"techSpecRow\"><td class=\"techSpecTD1\">Season:</td><td class=\"techSpecTD2\">spring/summer</td></tr>\r\n				<tr class=\"techSpecRow\"><td class=\"techSpecTD1\">Usage:</td><td class=\"techSpecTD2\">fitness</td></tr>\r\n				<tr class=\"techSpecRow\"><td class=\"techSpecTD1\">Sport:</td><td class=\"techSpecTD2\">122855031</td></tr>\r\n				<tr class=\"techSpecRow\"><td class=\"techSpecTD1\">Brand:</td><td class=\"techSpecTD2\">Shock Absorber</td></tr>\r\n				</tbody>\r\n				</table>\r\n				<p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n				<p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n				<p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n				<p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n				<p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n				<p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n				<p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n				<p>Raw denim you probably haven\'t heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor, williamsburg carles vegan helvetica. Reprehenderit butcher retro keffiyeh dreamcatcher synth. Cosby sweater eu banh mi, qui irure terry richardson ex squid. Aliquip placeat salvia cillum iphone. Seitan aliquip quis cardigan american apparel, butcher voluptate nisi qui.</p>\r\n\r\n			</div>', NULL, '2020-04-09 11:38:43', '2020-04-09 11:47:31'),
(2, 1, 'L,S,M', 'Vòng tay vải', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(3, 1, 'L,S,M', 'Vòng tay vàng', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(4, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(5, 1, 'L,S,M', 'Nhẫn vàng', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(6, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(7, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(8, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(9, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(10, 1, 'L,S,M', 'pro10', 200000, 0, 'tital', 1, 0, 'details', 'available', '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(11, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(12, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(13, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(14, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(15, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(16, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(17, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(18, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(19, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(20, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(21, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(22, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(26, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(27, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(28, 1, 'L,S,M', 'Name', 200000, 0, 'tital', 1, 0, 'details', NULL, '2020-04-09 11:38:43', '2020-04-09 11:38:43'),
(31, 4, 'L,M,S', 'Dây chuyền vàng', 70000000, 0, 'dây chuyền', 1, 0, 'dây chuyền', NULL, '2023-05-18 10:04:08', '2023-05-18 10:04:08'),
(32, 4, 'none', 'dây chuyền', 9899898989, 0, 'title', 1, 0, 'details', NULL, '2023-05-18 10:06:59', '2023-05-18 10:06:59'),
(33, 4, 'none', 'dây chuyền', 9899898989, 0, 'title', 1, 0, 'details', NULL, '2023-05-18 10:06:59', '2023-05-18 10:06:59'),
(53, 4, NULL, 'product 123', 1000000, 0, 'product 123', 1, 0, 'product 123', 'available', '2023-05-21 00:59:03', '2023-05-21 00:59:03'),
(54, 4, NULL, 'product 1234', 12345, 0, 'logo123', 1, 0, 'mota', 'available', '2023-05-21 01:20:48', '2023-05-21 01:20:48'),
(55, 4, NULL, 'test product', 1000000, 0, 'test product', 1, 0, 'test product', 'available', '2023-05-21 10:50:18', '2023-05-21 10:50:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slides`
--

CREATE TABLE `slides` (
  `id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `slides`
--

INSERT INTO `slides` (`id`, `img`, `caption`, `content`) VALUES
(1, 'TestImage.png', 'ImageTest', 'ImageTest'),
(2, 'test2', 'test2', 'test2');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` bigint(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `user`, `password`, `display_name`, `address`) VALUES
(5, 'admin@gmail.com', '$2a$12$1geVBnP.a8JIKvt8jvUG.OXAzKhkbO2OV4Am0zh3RPou3pUhnXjXu', 'nguyá»n vÄn nam', '123 Nguyá»n TrÃ£i'),
(6, 'admin2@gmail.com', '$2a$12$0rU7vA2p93ecs2mJHRipfeZ7EgQOJNKpvjn20SySvzhCVpSByUZVq', 'Nguyễn Văn Nam', '123 Nguyá»n TrÃ£i'),
(7, 'admin3@gmail.com', '$2a$12$IYGs.B7zJkrA3QNUKrGLau0rVl8JVK04RQ8oITHjZAU0ou1APe5g6', 'Trần Nam', '56 Thống Nhất'),
(9, 'ad123', 'ad123', 'admin', '1 nam kỳ khởi nghĩa');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_bill` (`id_bill`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categorys`
--
ALTER TABLE `categorys`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Chỉ mục cho bảng `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `categorys`
--
ALTER TABLE `categorys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2147483648;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `slides`
--
ALTER TABLE `slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `billdetail_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `colors`
--
ALTER TABLE `colors`
  ADD CONSTRAINT `colors_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categorys` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`id_category`) REFERENCES `categorys` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
