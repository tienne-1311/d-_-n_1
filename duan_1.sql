-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 19, 2024 lúc 03:59 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `duan_1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `id_bill` int(11) NOT NULL,
  `madh` varchar(255) NOT NULL,
  `tongdonhang` double(10,0) DEFAULT 0,
  `pttt` tinyint(1) NOT NULL DEFAULT 1,
  `id_user` int(11) DEFAULT NULL,
  `hoten` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(225) NOT NULL,
  `tel` varchar(225) NOT NULL,
  `ghichu` varchar(225) NOT NULL,
  `status` int(11) NOT NULL COMMENT '0: Hủy\r\n1: Chờ xác nhận\r\n2: Đang xử lý\r\n3: Đang giao hàng\r\n4: Thành công',
  `ngay_dat` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `binh_luan`
--

CREATE TABLE `binh_luan` (
  `id_binhluan` int(11) NOT NULL,
  `noidung_binhluan` varchar(255) DEFAULT NULL,
  `id_sanpham` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet_bill`
--

CREATE TABLE `chitiet_bill` (
  `id_chitietbill` int(11) NOT NULL,
  `id_bill` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `id_sanpham` int(11) DEFAULT NULL,
  `id_giohang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `danh_muc`
--

CREATE TABLE `danh_muc` (
  `id_danhmuc` int(11) NOT NULL,
  `name_danhmuc` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `danh_muc`
--

INSERT INTO `danh_muc` (`id_danhmuc`, `name_danhmuc`) VALUES
(1, 'Trái cây nhập khẩu '),
(2, 'Trái cây nội địa '),
(3, 'Hạt dinh dưỡng'),
(4, 'Rau củ '),
(10, 'sắp ra mắt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `san_pham`
--

CREATE TABLE `san_pham` (
  `id_sanpham` int(11) NOT NULL,
  `price` float DEFAULT NULL,
  `id_danhmuc` int(11) DEFAULT NULL,
  `img_sanpham` varchar(255) DEFAULT NULL,
  `title_sanpham` varchar(255) DEFAULT NULL,
  `mota_sanpham` text DEFAULT NULL,
  `luot_xem` int(11) DEFAULT 0,
  `trang_thai` int(11) DEFAULT 1 COMMENT '1. Hiện\r\n0. Ẩn'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `san_pham`
--

INSERT INTO `san_pham` (`id_sanpham`, `price`, `id_danhmuc`, `img_sanpham`, `title_sanpham`, `mota_sanpham`, `luot_xem`, `trang_thai`) VALUES
(1, 18000, 1, 'hoa-qua-1.jpg', ' quả zi zi', 'Cung cấp số lượng lớn hoa quả nhập khẩu từ Úc, Mỹ tươi ngon giá rẻ tại Hà Nội. Cửa hàng hoa quả nhập khẩu 54 Lạc Long Quân Hà Nội cung cấp hoa quả nhập khẩu Úc Mỹ Nhật.\r\n\r\nHoa quả tươi như Táo, Nho của Mỹ, Úc… đều được bảo quản trong môi trường lạnh đặc biệt từ khi hái, không chất bảo quản và các chất gây hại cho sức khỏe.', 13, 1),
(2, 20000, 1, 'hoa-qua-3.jpg', 'Táo nhập khẩu', 'Autumn Glory là một giống táo vô cùng độc đáo, xuất xứ từ tiểu bang Washington – Mỹ. Autumn Glory mang trong mình đặc trưng của một mùa thu Washington với màu sắc ấm áp, hương vị hấp dẫn.', 21, 1),
(3, 25000, 1, 'hoa-qua-4.jpg', 'Vải nhập khẩu', '\"Toàn bộ được vận chuyển đường hàng không, bằng thùng giữ lạnh nên vẫn giữ được màu sắc và vị tươi ngon\", vị này cho biết, đồng thời lý giải đây cũng là quốc gia có yêu cầu nghiêm ngặt về chất lượng nông sản, từ khâu trồng trọt đến bảo quản nên mặt hàng có giá cao. ', 31, 1),
(4, 28000, 1, 'hoa-qua-5.jpg', 'Quả zeri', '\"Toàn bộ được vận chuyển đường hàng không, bằng thùng giữ lạnh nên vẫn giữ được màu sắc và vị tươi ngon\", vị này cho biết, đồng thời lý giải đây cũng là quốc gia có yêu cầu nghiêm ngặt về chất lượng nông sản, từ khâu trồng trọt đến bảo quản nên mặt hàng có giá cao. ', 41, 1),
(5, 23000, 2, 'hoa-qua-2.jpg', 'Cà chua đà lạt', 'Cà chua baby Đà Lạt hiện được trồng nhiều tại các nhà vườn của Đà Lạt, cà chua baby được chăm sóc theo thiên hướng hữu cơ, quy trình khép kín giúp cho sản phẩm đạt chất lượng và năng suất cao. Tên gọi cà chua Cherry cũng được nhiều người nhắc đến khi nói về cà chua baby của Đà Lạt. Có nhiều sự lựa chọn mang các hương vị đặc trưng:', 18, 1),
(6, 15000, 4, 'rau-cu-1.png', 'Rau cải xanhhh', 'cam kết rau sạch chật lượng cao được nuôi chồng chăm sóc trong nhà kính cẩn thận', 13, 1),
(8, 45000, 3, 'hat-dinh-duong-1.jpg', 'Hạt điều', 'Hạnh điều là một loại hạt phổ biến chứa nhiều vitamin E, chất chống oxy hóa, magiê và chất xơ. Các nghiên cứu cho thấy rằng hạnh nhân có thể giúp bạn giảm cân và cải thiện sức khỏe trao đổi chất.', 17, 1),
(9, 64000, 3, 'hat-dinh-duong-2.jpg', 'Quả óc chó', 'Quả óc chó có giá trị dinh dưỡng cao và chứa nhiều chất xơ cũng như các loại vitamin và khoáng chất khác nhau.\r\n\r\nMang lại những lợi ích tốt cho sức khỏe con người mà ít loại thực phẩm nào khác làm được.', 13, 1),
(18, 23000, 4, 'ot_chuong.jpg', 'Quả ớt chuông', 'Thành phần các chất dinh dưỡng có lợi cho sức khoẻ trong ớt chuông . Ớt chuông có thành phần chất dinh dưỡng khá giàu gồm: vitamin A, vitamin C và các chất dinh dưỡng khác. Hàm lượng vitamin A trong 149 gam chuông xanh cung cấp khoảng 551 IU vitamin A, tương đương với một chén nhỏ. Tuy nhiên, hàm lượng vitamin A trong ớt chuông đỏ nhiều hơn và tốt hơn cho sự phát triển của thị lực và mắt. Sử dụng một chén ớt xắt nhỏ với nhiều màu sắc có thể cung cấp hơn 100% giá trị hàng ngày.', 6, 1),
(20, 30000, 4, 'asus.jpg', 'Súp lơ trắng', '                    Các loại rau họ cải như súp lơ xanh đặc biệt bổ dưỡng vì chúng giàu vitamin và chất dinh dưỡng giúp cải thiện sức khỏe tim mạch, chống ung thư và cân bằng lại lượng đường trong máu. Chúng cũng chứa ít calo và nhiều chất xơ, vì vậy sẽ khiến bạn cảm thấy no.                    ', 7, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(255) NOT NULL,
  `gmail_user` varchar(255) DEFAULT NULL,
  `password_user` varchar(255) NOT NULL,
  `address` varchar(225) DEFAULT NULL,
  `tel` varchar(12) DEFAULT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 user\r\n1 admin',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '0 Block\r\n1 Open',
  `avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_user`, `name_user`, `gmail_user`, `password_user`, `address`, `tel`, `role`, `status`, `avatar`) VALUES
(45, 'trần tiến', 'tienndz1311@gmail.com', '111', 'xóm 1', '0634345111', 0, 1, '1.jpg'),
(46, 'trần tiến', 'tienndz1311@gmail.com', '2222', 'xóm 1', '0123456789', 0, 1, '2.jpg'),
(47, 'aaa', 'tienne1311@gmai.com', '12345', 'nam định nè', '0123456789', 0, 1, '4.jpg'),
(49, 'tien_ne', NULL, '12345', NULL, NULL, 1, 1, NULL);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`id_bill`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD PRIMARY KEY (`id_binhluan`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_sanpham` (`id_sanpham`);

--
-- Chỉ mục cho bảng `chitiet_bill`
--
ALTER TABLE `chitiet_bill`
  ADD PRIMARY KEY (`id_chitietbill`),
  ADD KEY `id_sanpham` (`id_sanpham`),
  ADD KEY `id_bill` (`id_bill`);

--
-- Chỉ mục cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  ADD PRIMARY KEY (`id_danhmuc`);

--
-- Chỉ mục cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD PRIMARY KEY (`id_sanpham`),
  ADD KEY `id_danhmuc` (`id_danhmuc`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bill`
--
ALTER TABLE `bill`
  MODIFY `id_bill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  MODIFY `id_binhluan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `chitiet_bill`
--
ALTER TABLE `chitiet_bill`
  MODIFY `id_chitietbill` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `danh_muc`
--
ALTER TABLE `danh_muc`
  MODIFY `id_danhmuc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  MODIFY `id_sanpham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `binh_luan`
--
ALTER TABLE `binh_luan`
  ADD CONSTRAINT `binh_luan_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `binh_luan_ibfk_2` FOREIGN KEY (`id_sanpham`) REFERENCES `san_pham` (`id_sanpham`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `chitiet_bill`
--
ALTER TABLE `chitiet_bill`
  ADD CONSTRAINT `chitiet_bill_ibfk_1` FOREIGN KEY (`id_sanpham`) REFERENCES `san_pham` (`id_sanpham`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `chitiet_bill_ibfk_2` FOREIGN KEY (`id_bill`) REFERENCES `bill` (`id_bill`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `san_pham`
--
ALTER TABLE `san_pham`
  ADD CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`id_danhmuc`) REFERENCES `danh_muc` (`id_danhmuc`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
