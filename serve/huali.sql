-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2019-11-15 10:52:55
-- 服务器版本： 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `huali`
--

-- --------------------------------------------------------

--
-- 表的结构 `huali_category`
--



CREATE TABLE `huali_category` (
  `lid` int(3) NOT NULL,
  `title` varchar(8) NOT NULL,
  `pic` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `huali_category`
--

INSERT INTO `huali_category` (`lid`, `title`, `pic`) VALUES
(1, '生日鲜花', 'list/m_category_hot_Birthday.png'),
(1, '礼盒鲜花', 'list/m_category_hot_Boxedflowers.png'),
(1, '永生花', 'list/m_category_ppf_sort_Box.png'),
(2, '全部', 'list/m_category_flowers_use_All.png'),
(2, '送女友鲜花', 'list/m_category_flowers_use_1-2Girlfriend.png'),
(2, '送男性鲜花', 'list/m_category_flowers_use_Boyfriend.png'),
(2, '送长辈鲜花', 'list/m_category_flowers_use_Elder.png'),
(2, '送朋友鲜花', 'list/m_category_flowers_use_Friend.png'),
(3, '全部', 'list/m_category_flowers_use_All.png'),
(3, '送女友', 'list/m_category_ppf_use_Girlfriend.png'),
(3, '送男性', 'list/m_category_ppf_use_Boyfriend.png'),
(3, '送长辈', 'list/m_category_ppf_use_Elder.png'),
(3, '送朋友', 'list/m_category_ppf_use_Friend.png'),
(4, '', 'list/m_category_gift_brand_All.png'),
(4, '', 'list/m_category_cake_xfxb.png'),
(4, '', 'list/m_category_cake_ganso.png'),
(4, '', 'list/m_category_cake_mcake.png'),
(4, '', 'list/m_category_cake_lecake.png'),
(4, '', 'list/m_category_cake_cheesecake.png'),
(4, '', 'list/m_category_cake_cakeboss.png'),
(5, '全部', 'list/m_category_flowers_use_All.png'),
(5, '送女友', 'list/m_category_gift_use_Girlfriend.png'),
(5, '送男性', 'list/m_category_gift_use_Boyfriend.png'),
(5, '送长辈', 'list/m_category_gift_use_Elder.png'),
(6, '礼栏', 'list/m_category_Hamper.png'),
(7, '全部', 'list/m_category_flowers_use_All.png'),
(7, '绿色植物', 'list/m_category_Plants_Green.png'),
(7, '盆栽花卉', 'list/m_category_Plants_Potted.png'),
(7, '多肉盆栽', 'list/m_category_Plants_Succulent.png');

-- --------------------------------------------------------

--
-- 表的结构 `huali_home_product`
--

CREATE TABLE `huali_home_product` (
  `lid` int(4) NOT NULL,
  `title` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `huali_home_product`
--

INSERT INTO `huali_home_product` (`lid`, `title`) VALUES
(1, '送恋人/爱情鲜花'),
(2, '送长辈鲜花');

-- --------------------------------------------------------

--
-- 表的结构 `huali_home_product_list`
--

CREATE TABLE `huali_home_product_list` (
  `lid` int(4) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_desc` varchar(40) NOT NULL,
  `product_promo` varchar(15) NOT NULL,
  `product_price` int(4) NOT NULL,
  `product_original` int(4) NOT NULL,
  `product_sale` varchar(6) NOT NULL,
  `product_tags` varchar(6) NOT NULL,
  `product_id` varchar(4) NOT NULL,
  `product_pic` varchar(30) NOT NULL,
  `sort` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `huali_home_product_list`
--

INSERT INTO `huali_home_product_list` (`lid`, `product_name`, `product_desc`, `product_promo`, `product_price`, `product_original`, `product_sale`, `product_tags`, `product_id`, `product_pic`, `sort`) VALUES
(3, '一鹿(路)有你永生花小夜灯·永生花礼盒', '', '', 298, 398, '45', '创意新品', 'c1', 'home_product/c1.jpg', 'shu'),
(4, '我如此爱你-口红款999·专柜正品Dior#999口红＋进口永生玫瑰礼盒', '', '', 588, 788, '6306', '畅销', 'c2', 'home_product/c2.jpg', 'shu'),
(1, '一往情深', '精品玫瑰礼盒:19枝红玫瑰，勿忘我0.1扎', '经典爆款，年销售冠军！', 239, 315, '7.5万', '畅销', 'h1', 'home_product/h1.jpg', 'heng'),
(2, '甜美公主', '白玫瑰22枝，粉佳人粉玫瑰14枝，粉色桔梗5枝', '甜美设计 清新典雅', 368, 485, '2.2万', '', 'h2', 'home_product/h2.jpg', 'heng');

-- --------------------------------------------------------

--
-- 表的结构 `huali_user`
--

CREATE TABLE `huali_user` (
  `user_name` varchar(20) NOT NULL,
  `user_pwd` varchar(15) NOT NULL,
  `user_id` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `huali_user`
--

INSERT INTO `huali_user` (`user_name`, `user_pwd`, `user_id`) VALUES
('tom', '123456', 1),
('jerry', '123456', 2),
('hah', '123456', 3),
('baibai', '123456', 4),
('', '', 5),
('ba', '123456', 6),
('tt', '123456', 8),
('guowj', '123456', 9),
('haha', '123456', 15),
('54131', '', 17),
('54151', '123456', 19),
('to', '123456', 20);

-- --------------------------------------------------------

--
-- 表的结构 `product_list`
--

CREATE TABLE `product_list` (
  `id` int(4) NOT NULL,
  `pic` varchar(40) NOT NULL,
  `title` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `huali_home_product_list`
--
ALTER TABLE `huali_home_product_list`
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `huali_user`
--
ALTER TABLE `huali_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `huali_user`
--
ALTER TABLE `huali_user`
  MODIFY `user_id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
