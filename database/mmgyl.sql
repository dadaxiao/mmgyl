-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2016-08-01 07:17:34
-- 服务器版本： 5.7.10-log
-- PHP Version: 5.6.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mmgyl`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE `admin` (
  `id` tinyint(5) NOT NULL COMMENT '主键',
  `adminNo` int(20) NOT NULL COMMENT '管理员账号',
  `adminName` varchar(20) NOT NULL COMMENT '管理员姓名',
  `password` char(50) NOT NULL COMMENT '密码',
  `phone` int(11) NOT NULL COMMENT '管理员手机号码',
  `email` varchar(50) NOT NULL COMMENT '管理员邮箱'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- --------------------------------------------------------

--
-- 表的结构 `cate`
--

CREATE TABLE `cate` (
  `cId` int(20) NOT NULL COMMENT '主键',
  `cateName` varchar(50) NOT NULL COMMENT '分类名',
  `pid` int(20) NOT NULL COMMENT '父级分类',
  `proId` int(50) NOT NULL COMMENT '商品id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表';

--
-- 转存表中的数据 `cate`
--

INSERT INTO `cate` (`cId`, `cateName`, `pid`, `proId`) VALUES
(1, '水果', 0, 0),
(2, '三华李', 1, 0),
(3, '鱼类', 0, 0),
(4, '化工', 0, 0),
(5, '茶类', 0, 0),
(6, '小吃', 0, 0),
(7, '茶类', 0, 0),
(8, '种植类', 0, 0),
(9, '工艺品', 0, 0),
(10, '其他', 0, 0),
(11, '饮食', 1, 0),
(12, '龙眼', 1, 0),
(13, '香蕉', 1, 0),
(14, '荔枝', 1, 0),
(15, '甜柿 ', 1, 0),
(16, '橙 ', 1, 0),
(17, '函仔鱼', 3, 0),
(18, '石斑鱼', 3, 0),
(19, '章鱼', 3, 0),
(20, '罗非鱼', 3, 0),
(21, '苯', 4, 0),
(22, '双苯基苯酚', 4, 0),
(23, '芘咔唑', 4, 0),
(24, '绿茶', 5, 0),
(25, '瑞龙茶', 5, 0),
(26, '榕树茶', 5, 0),
(27, '鸭蛋', 6, 0),
(28, '黄瓜干', 6, 0),
(29, '化州托罗饼', 6, 0),
(30, '北界豆饼', 6, 0),
(31, '豆饼角', 6, 0),
(32, '黄茶', 7, 0),
(33, '青茶', 7, 0),
(34, '黑茶', 7, 0),
(35, '红茶', 7, 0),
(36, '南艺工艺美术品', 8, 0),
(37, '工艺蜡烛', 8, 0),
(38, '面茄雕刻', 8, 0),
(39, '化州橘红', 10, 0),
(40, '桂圆', 10, 0),
(41, '鉴江红槽', 10, 0),
(42, '蜂蜜', 10, 0),
(43, '首乌', 10, 0);

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `id` int(20) NOT NULL COMMENT '主键',
  `oNo` varchar(150) NOT NULL COMMENT '订单编号',
  `pSn` varchar(50) NOT NULL COMMENT '商品编号',
  `num` int(20) NOT NULL COMMENT '订货量',
  `starTime` date NOT NULL COMMENT '订单生成时间',
  `endTime` date NOT NULL COMMENT '交易完成时间',
  `amount` decimal(11,2) NOT NULL COMMENT '订单总额',
  `payStatus` enum('已提交未付款','已付款') NOT NULL COMMENT '付款状态',
  `deliverStatus` enum('未发货','已发货') NOT NULL COMMENT '发货状态',
  `isSuccess` enum('贸易关闭','贸易完成') NOT NULL COMMENT '订单是否完成',
  `sellerNO` int(20) NOT NULL COMMENT '卖家账号',
  `buyerNO` int(20) NOT NULL COMMENT '买家账号',
  `address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- --------------------------------------------------------

--
-- 表的结构 `pro`
--

CREATE TABLE `pro` (
  `id` int(20) NOT NULL COMMENT '主键',
  `proId` int(50) NOT NULL COMMENT '商品id',
  `pName` varchar(50) NOT NULL COMMENT '商品名称',
  `pSn` varchar(50) NOT NULL COMMENT '商品编号',
  `pNum` int(10) NOT NULL COMMENT '商品数量',
  `price` decimal(11,2) NOT NULL COMMENT '价格',
  `pIntro` text COMMENT '商品简介',
  `pImg` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `isShow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架',
  `isExist` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有货',
  `cId` int(20) NOT NULL COMMENT '所属分类',
  `userName` varchar(50) NOT NULL COMMENT '所属卖家'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

--
-- 转存表中的数据 `pro`
--

INSERT INTO `pro` (`id`, `proId`, `pName`, `pSn`, `pNum`, `price`, `pIntro`, `pImg`, `isShow`, `isExist`, `cId`, `userName`) VALUES
(1, 1, '信宜钱排三华李新鲜现摘现发脆爽酸甜李子 银妃三华李孕妇水果5斤', '1', 1978, '99.00', '信宜钱排三华李', 'images/Product/1/01.jpg', 1, 1, 12, '王五'),
(2, 2, '广东茂名信宜特产 辣味山楂片 无核山楂干 山楂饼 山楂干批发', '20160723002', 60, '9.90', '美味山楂', 'images/Product/20160723002/01.jpg', 1, 1, 1, '李四'),
(3, 3, '哆啦A梦黑胶晴雨伞', '20160723003', 75, '80.00', '1.超强防晒零头光 2.经典童年记忆创意三 3.伞骨超强防风 4.清新 居家旅行必备', 'images/Product/20160723003/01.jpg', 1, 1, 1, '哆啦A梦'),
(4, 4, '韩版商务运动钢带男士手表', '20160723004', 139, '430.00', '时尚潮流,欧美风', 'images/Product/20160723004/01.jpg', 1, 1, 1, '刘生'),
(5, 5, '红枣夹核桃仁210克/袋', '', 577, '49.00', '生产许可证编号：QS4101 1702 0106 产品标准号：GB/T26150厂名：郑州航空港区优尼科红枣专业合作社厂址：郑州航空港区新港办事处辛庄村厂家联系方式：400-1685-900配料表：红枣2-2.5CM储藏方法：低温阴凉干燥处保质期：270 天食品添加剂：无任何添加剂净含量: 500g包装方式: 包装品牌: 楼兰丝路系列: 新疆枣零食种类: 新疆若羌枣枣类产品: 原粒枣特产品类: 若羌灰枣级别: 一级产地: 中国大陆省份: 新疆维吾尔族自治区', 'images/Product/20160723001/01.jpg', 1, 1, 2, '张三'),
(6, 6, '三华李', '', 2000, '9.90', '2', 'images/Product/6/01.jpg', 1, 1, 11, ''),
(7, 7, '柿子', '', 2000, '7.90', '0', 'images/Product/7/01.jpg', 1, 1, 11, ''),
(8, 8, '荔枝', '', 0, '5.90', NULL, 'images/Product/8/01.jpg', 1, 1, 11, ''),
(9, 9, '提子', '', 0, '10.90', NULL, 'images/Product/9/01.jpg', 1, 1, 11, ''),
(10, 10, '三华李', '', 0, '13.90', NULL, 'images/Product/10/01.jpg', 1, 1, 11, ''),
(11, 11, '香蕉6根 ', '', 0, '19.90', NULL, 'images/Product/11/01.jpg', 1, 1, 11, ''),
(12, 12, '芒果', '', 0, '6.90', NULL, 'images/Product/12/01.jpg', 1, 1, 11, ''),
(13, 13, '龙眼', '', 0, '11.30', NULL, 'images/Product/13/01.jpg', 1, 1, 11, ''),
(14, 14, '荔枝', '', 0, '10.90', NULL, 'images/Product/14/01.jpg', 1, 1, 11, ''),
(15, 15, '橘子', '', 0, '12.40', NULL, 'images/Product/15/01.jpg', 1, 1, 11, ''),
(16, 16, '干菜', '', 0, '3.70', NULL, 'images/Product/16/01.jpg', 1, 1, 11, ''),
(17, 17, '咸蛋', '', 0, '15.70', NULL, 'images/Product/17/01.jpg', 1, 1, 11, ''),
(18, 18, '香芋', '', 0, '8.20', NULL, 'images/Product/18/01.jpg', 1, 1, 11, ''),
(19, 19, '三华李', '', 0, '8.90', NULL, 'images/Product/19/01.jpg', 1, 1, 11, ''),
(20, 20, '鱼', '', 0, '7.90', NULL, 'images/Product/20/01.jpg', 1, 1, 11, ''),
(21, 21, '甘草', '', 0, '23.00', NULL, 'images/Product/21/01.jpg', 1, 1, 11, ''),
(22, 22, '章鱼', '', 0, '50.00', NULL, 'images/Product/22/01.jpg', 1, 1, 11, ''),
(23, 23, '荔枝', '', 0, '12.00', NULL, 'images/Product/23/01.jpg', 1, 1, 11, ''),
(24, 24, '橙子', '', 0, '12.00', NULL, 'images/Product/24/01.jpg', 1, 1, 11, ''),
(25, 25, '鱼', '', 0, '9.00', NULL, 'images/Product/25/01.jpg', 1, 1, 11, ''),
(26, 26, '即食海蜇丝 海蜇皮', '26', 260, '0.00', NULL, 'images/Product/26/01.jpg', 1, 1, 17, ''),
(27, 27, '船晒响螺片干货', '27', 220, '0.00', NULL, 'images/Product/27/01.jpg', 1, 1, 17, ''),
(28, 28, '自晒野生大响螺肉', '28', 260, '0.00', NULL, 'images/Product/28/01.jpg', 1, 1, 17, ''),
(29, 29, '自晒海鲜干货章鱼干', '29', 80, '0.00', NULL, 'images/Product/29/01.jpg', 1, 1, 17, ''),
(30, 30, '电白野生小银鱼', '30', 50, '0.00', NULL, 'images/Product/30/01.jpg', 1, 1, 17, ''),
(31, 31, '黑鲍螺干', '31', 48, '0.00', NULL, 'images/Product/31/01.jpg', 1, 1, 17, ''),
(32, 32, '金丝鱼干', '32', 43, '0.00', NULL, 'images/Product/32/01.jpg', 1, 1, 17, ''),
(33, 33, '博贺鳗鱼干', '33', 58, '0.00', NULL, 'images/Product/33/01.jpg', 1, 1, 17, ''),
(34, 34, '博贺海米虾仁虾干', '34', 100, '0.00', NULL, 'images/Product/34/01.jpg', 1, 1, 17, ''),
(35, 35, '海产干货熟虾皮', '35', 260, '0.00', NULL, 'images/Product/35/01.jpg', 1, 1, 17, ''),
(36, 36, '南极海茸海笋冰笋冰藻', '36', 260, '0.00', NULL, 'images/Product/36/01.jpg', 1, 1, 17, ''),
(37, 37, '特级 茂名澳内虾皮', '37', 50, '0.00', NULL, 'images/Product/37/01.jpg', 1, 1, 17, ''),
(38, 38, '小墨鱼干 ', '', 0, '51.00', NULL, 'images/Product/38/01.jpg', 1, 1, 17, ''),
(39, 39, '淡晒海鳗鱼干', '', 0, '46.00', NULL, 'images/Product/39/01.jpg', 1, 1, 17, ''),
(40, 40, '野生红鱼干', '', 0, '50.00', NULL, 'images/Product/40/01.jpg', 1, 1, 17, ''),
(41, 41, '多味鱼', '', 0, '48.00', NULL, 'images/Product/41/01.jpg', 1, 1, 17, ''),
(42, 42, '海虹 青口', '', 0, '55.00', NULL, 'images/Product/42/01.jpg', 1, 1, 17, ''),
(43, 43, '手撕鱿鱼丝', '', 0, '52.00', NULL, 'images/Product/43/01.jpg', 1, 1, 17, ''),
(44, 44, '虾米虾仁鲜虾皮虾皮', '', 0, '22.00', NULL, 'images/Product/44/01.jpg', 1, 1, 17, ''),
(45, 45, '长岛大野生鱿鱼干', '', 0, '29.80', NULL, 'images/Product/45/01.jpg', 1, 1, 17, ''),
(46, 46, '绿茶新茶叶正宗', '46', 260, '88.00', NULL, 'images/Product/47/01.jpg', 1, 1, 24, ''),
(47, 47, '大佛龙井胜西湖龙井春茶', '47', 220, '39.00', NULL, 'images/Product/47/01.jpg', 1, 1, 24, ''),
(48, 48, '高山云雾绿茶', '48', 260, '58.00', NULL, 'images/Product/48/01.jpg', 1, 1, 24, ''),
(49, 49, '雨前特级安徽高山绿茶', '49', 80, '40.00', NULL, 'images/Product/49/01.jpg', 1, 1, 24, ''),
(50, 50, '新垌绿茶', '50', 50, '80.00', NULL, 'images/Product/50/01.jpg', 1, 1, 24, ''),
(51, 51, '梅县清凉山绿茶', '51', 48, '80.00', NULL, 'images/Product/51/01.jpg', 1, 1, 24, ''),
(52, 52, '绿茶广东茶叶春茶500克', '52', 43, '100.00', NULL, 'images/Product/52/01.jpg', 1, 1, 24, ''),
(53, 53, '日照绿茶2016新茶', '53', 58, '40.00', NULL, 'images/Product/53/01.jpg', 1, 1, 24, ''),
(54, 54, '特级高山云雾绿茶', '54', 100, '240.00', NULL, 'images/Product/54/01.jpg', 1, 1, 24, ''),
(55, 55, '清香回甘白毛尖茶', '55', 260, '78.00', NULL, 'images/Product/55/01.jpg', 1, 1, 24, ''),
(56, 56, '汉中仙毫明前特级茶', '56', 260, '150.00', NULL, 'images/Product/56/01.jpg', 1, 1, 24, ''),
(57, 57, '特级 化州新华农场茶叶', '57', 50, '255.00', NULL, 'images/Product/57/01.jpg', 1, 1, 24, ''),
(58, 58, '高山茗茶宜昌茶 ', '', 0, '51.00', NULL, 'images/Product/58/01.jpg', 1, 1, 24, ''),
(59, 59, '冬火茶叶', '', 0, '46.00', NULL, 'images/Product/59/01.jpg', 1, 1, 24, ''),
(60, 60, '茂名高州名茶', '', 0, '50.00', NULL, 'images/Product/60/01.jpg', 1, 1, 24, ''),
(61, 61, '头采春茶明前茶炒青', '', 0, '482.00', NULL, 'images/Product/61/01.jpg', 1, 1, 24, ''),
(62, 62, '正宗崂山茶叶', '', 0, '55.00', NULL, 'images/Product/62/01.jpg', 1, 1, 24, ''),
(63, 63, '新茶信宜市', '', 0, '522.00', NULL, 'images/Product/63/01.jpg', 1, 1, 24, ''),
(64, 64, '自产自销罐装清香型', '', 0, '282.00', NULL, 'images/Product/64/01.jpg', 1, 1, 24, ''),
(65, 65, '信宜市大雾岭野生茶', '', 0, '219.80', NULL, 'images/Product/65/01.jpg', 1, 1, 24, ''),
(66, 66, '红心即食海鸭蛋家庭装）', '66', 280, '88.00', NULL, 'images/Product/66/01.jpg', 1, 1, 27, ''),
(67, 67, '高邮咸鸭蛋鸭蛋75g20枚', '67', 220, '39.00', NULL, 'images/Product/67/01.jpg', 1, 1, 27, ''),
(68, 68, '正宗红泥自制咸鸭蛋20颗包邮', '68', 280, '78.00', NULL, 'images/Product/68/01.jpg', 1, 1, 27, ''),
(69, 69, '豫乡渔户散养鸭蛋', '69', 80, '40.00', NULL, 'images/Product/69/01.jpg', 1, 1, 27, ''),
(70, 70, '农家散养土鸭蛋', '70', 70, '80.00', NULL, 'images/Product/70/01.jpg', 1, 1, 27, ''),
(71, 71, '海鸭蛋咸蛋农家新鲜20枚68g', '71', 68, '80.00', NULL, 'images/Product/71/01.jpg', 1, 1, 27, ''),
(72, 72, '正宗巢湖咸鸭蛋麻鸭蛋75g20枚', '72', 43, '100.00', NULL, 'images/Product/72/01.jpg', 1, 1, 27, ''),
(73, 73, '特产盐蛋流油', '73', 78, '40.00', NULL, 'images/Product/73/01.jpg', 1, 1, 27, ''),
(74, 74, '土特产非海鸭蛋', '74', 100, '27.00', NULL, 'images/Product/74/01.jpg', 1, 1, 27, ''),
(75, 75, '乳山特产烤海鸭蛋', '75', 280, '78.00', NULL, 'images/Product/75/01.jpg', 1, 1, 27, ''),
(76, 76, '湖海鸭蛋麻鸭蛋', '76', 280, '15.00', NULL, 'images/Product/76/01.jpg', 1, 1, 27, ''),
(77, 77, '特级 农家自制五香咸鸭蛋', '77', 70, '25.00', NULL, 'images/Product/77/01.jpg', 1, 1, 27, ''),
(78, 78, '食熟盐蛋 ', '', 0, '21.00', NULL, 'images/Product/78/01.jpg', 1, 1, 27, ''),
(79, 79, '骆马湖特产腌制臭鸭蛋', '', 0, '29.00', NULL, 'images/Product/79/01.jpg', 1, 1, 27, ''),
(80, 80, '高邮咸鸭蛋麻鸭蛋70克熟咸蛋', '', 0, '40.00', NULL, 'images/Product/80/01.jpg', 1, 1, 27, ''),
(81, 81, '北海钦州初生蛋咸鸭蛋', '', 0, '42.00', NULL, 'images/Product/81/01.jpg', 1, 1, 27, ''),
(82, 82, '广西北海烤海鸭蛋', '', 0, '5.00', NULL, 'images/Product/82/01.jpg', 1, 1, 27, ''),
(83, 83, '即食咸蛋黄多油', '', 0, '72.00', NULL, 'images/Product/83/01.jpg', 1, 1, 27, ''),
(84, 84, '大连咸鸭蛋流油熟麻鸭蛋', '', 0, '2.00', NULL, 'images/Product/84/01.jpg', 1, 1, 27, ''),
(85, 85, '咸鸭蛋黄酥月饼', '', 0, '29.80', NULL, 'images/Product/85/01.jpg', 1, 1, 27, ''),
(86, 86, '正山特级金骏眉红茶', '86', 2100, '18.00', NULL, 'images/Product/86/01.jpg', 1, 1, 32, ''),
(87, 87, '信阳毛尖2016新茶 茶叶绿茶', '87', 220, '39.00', NULL, 'images/Product/87/01.jpg', 1, 1, 32, ''),
(88, 88, '新茶安溪铁观音兰花香', '88', 2100, '98.00', NULL, 'images/Product/88/01.jpg', 1, 1, 32, ''),
(89, 89, '铁观音茶叶新茶浓香型', '89', 100, '40.00', NULL, 'images/Product/89/01.jpg', 1, 1, 32, ''),
(90, 90, '美容美白花茶', '90', 90, '100.00', NULL, 'images/Product/90/01.jpg', 1, 1, 32, ''),
(91, 91, '茂名正宗正源堂化州橘红茶防喉咙痛保健茶红茶叶', '91', 88, '100.00', NULL, 'images/Product/91/01.jpg', 1, 1, 32, ''),
(92, 92, '2016新茶 高山云雾春茶', '92', 43, '100.00', NULL, 'images/Product/92/01.jpg', 1, 1, 32, ''),
(93, 93, '菊花茶胎菊王桐乡杭白菊 正宗特级胎菊花茶', '93', 98, '40.00', NULL, 'images/Product/93/01.jpg', 1, 1, 32, ''),
(94, 94, '花草茶玫瑰组合花茶玫瑰花茉莉花', '94', 100, '32.00', NULL, 'images/Product/94/01.jpg', 1, 1, 32, ''),
(95, 95, '高山茗茶宜昌茶', '95', 2100, '98.00', NULL, 'images/Product/95/01.jpg', 1, 1, 32, ''),
(96, 96, '春茶', '96', 2100, '15.00', NULL, 'images/Product/96/01.jpg', 1, 1, 32, ''),
(97, 97, '茂名高州名茶', '97', 90, '25.00', NULL, 'images/Product/97/01.jpg', 1, 1, 32, ''),
(98, 98, '茶叶绿茶新茶2016头采春茶明前茶炒青 ', '', 0, '21.00', NULL, 'images/Product/98/01.jpg', 1, 1, 32, ''),
(99, 99, '2016新茶叶正宗崂山茶叶青岛特产绿茶', '', 0, '29.00', NULL, 'images/Product/99/01.jpg', 1, 1, 32, ''),
(100, 100, '2016新茶信宜市大雾岭野生茶绿茶广东茂名特产', '', 0, '40.00', NULL, 'images/Product/100/01.jpg', 1, 1, 32, ''),
(101, 101, '2016新茶梅家坞西湖龙井茶雨前绿茶叶', '', 0, '42.00', NULL, 'images/Product/101/01.jpg', 1, 1, 32, ''),
(102, 102, '茶叶绿茶一级龙井茶农散装直销', '', 0, '5.00', NULL, 'images/Product/102/01.jpg', 1, 1, 32, ''),
(103, 103, '新茶叶乌龙茶', '', 0, '92.00', NULL, 'images/Product/103/01.jpg', 1, 1, 32, ''),
(104, 104, '特级武夷山茶叶', '', 0, '2.00', NULL, 'images/Product/104/01.jpg', 1, 1, 32, ''),
(105, 105, '女生花草茶', '', 0, '29.10', NULL, 'images/Product/105/01.jpg', 1, 1, 32, '');

-- --------------------------------------------------------

--
-- 表的结构 `procomment`
--

CREATE TABLE `procomment` (
  `id` int(20) NOT NULL COMMENT '主键',
  `proId` int(50) NOT NULL COMMENT '商品id',
  `userName` varchar(50) NOT NULL COMMENT '评论者',
  `cContent` text NOT NULL COMMENT '评论内容',
  `cTime` date NOT NULL COMMENT '评论时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息评价表';

-- --------------------------------------------------------

--
-- 表的结构 `pro_picture`
--

CREATE TABLE `pro_picture` (
  `id` int(50) NOT NULL,
  `proId` int(20) NOT NULL COMMENT '商品id',
  `picUrl` varchar(150) NOT NULL COMMENT '商品图片地址',
  `pSn` varchar(100) NOT NULL COMMENT '商品编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品图片表';

--
-- 转存表中的数据 `pro_picture`
--

INSERT INTO `pro_picture` (`id`, `proId`, `picUrl`, `pSn`) VALUES
(1, 0, '', ''),
(2, 0, 'localhost/mmgyl/Public/Image/Product/20160723001/2.jpg', '20160723001'),
(3, 0, 'localhost/mmgyl/Public/Image/Product/20160723001/3.jpg', '20160723001'),
(4, 0, 'localhost/mmgyl/Public/Image/Product/20160723001/4.jpg', '20160723001'),
(5, 0, 'localhost/mmgyl/Public/Image/Product/20160723001/5.jpg', '20160723001'),
(6, 0, 'localhost/mmgyl/Public/Image/Product/20160723002/1.jpg', '20160723002'),
(7, 0, 'localhost/mmgyl/Public/Image/Product/20160723002/2.jpg', '20160723002'),
(8, 0, 'localhost/mmgyl/Public/Image/Product/20160723002/3.jpg', '20160723002'),
(9, 0, 'localhost/mmgyl/Public/Image/Product/20160723002/4.jpg', '20160723002'),
(10, 10, 'images/Product/10/1.jpg', '20160723002'),
(11, 11, 'images/Product/11/1.jpg', '20160723003'),
(12, 12, 'images/Product/12/1.jpg', '20160723003'),
(13, 13, 'images/Product/13/1.jpg', '20160723003'),
(14, 14, 'images/Product/14/1.jpg', '20160723003'),
(15, 0, 'localhost/mmgyl/Public/Image/Product/20160723003/5.jpg', '20160723003'),
(16, 0, 'localhost/mmgyl/Public/Image/Product/20160723004/1.jpg', '20160723004'),
(17, 0, 'localhost/mmgyl/Public/Image/Product/20160723004/2.jpg', '20160723004'),
(18, 0, 'localhost/mmgyl/Public/Image/Product/20160723004/3.jpg', '20160723004'),
(19, 0, 'localhost/mmgyl/Public/Image/Product/20160723004/4.jpg', '20160723004');

-- --------------------------------------------------------

--
-- 表的结构 `r_access`
--

CREATE TABLE `r_access` (
  `role_id` smallint(6) UNSIGNED NOT NULL COMMENT '角色ID',
  `node_id` smallint(6) UNSIGNED NOT NULL COMMENT '节点ID',
  `level` tinyint(1) NOT NULL COMMENT '级别',
  `module` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='各个操作和用户角色的对应关系表';

-- --------------------------------------------------------

--
-- 表的结构 `r_node`
--

CREATE TABLE `r_node` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `remark` varchar(255) DEFAULT NULL,
  `sort` smallint(6) UNSIGNED DEFAULT NULL,
  `pid` smallint(6) UNSIGNED NOT NULL,
  `level` tinyint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `r_role`
--

CREATE TABLE `r_role` (
  `id` smallint(6) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `pid` smallint(6) DEFAULT NULL,
  `status` tinyint(1) UNSIGNED DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `r_role_user`
--

CREATE TABLE `r_role_user` (
  `role_id` mediumint(9) UNSIGNED DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` smallint(10) NOT NULL COMMENT '主键',
  `userNo` int(20) NOT NULL COMMENT '用户账号',
  `userName` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(50) NOT NULL COMMENT '用户密码',
  `sex` enum('保密','女','男') NOT NULL COMMENT '用户性别',
  `phone` int(11) NOT NULL COMMENT '用户手机号码',
  `email` varchar(50) NOT NULL COMMENT '用户邮箱',
  `face` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `address` varchar(100) DEFAULT NULL COMMENT '用户地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `userNo`, `userName`, `password`, `sex`, `phone`, `email`, `face`, `address`) VALUES
(1, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', 'localhost/public/2b.jpg$address=2b', NULL),
(2, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', 'localhost/public/2b.jpg', NULL),
(3, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', 'localhost/public/2b.jpg', NULL),
(4, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', 'localhost/public/2b.jpg', '2b'),
(5, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', 'localhost/public/2b.jpg', '2b'),
(6, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', 'localhost/public/2b.jpg', '2b'),
(7, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', 'localhost/public/2b.jpg', NULL),
(8, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', 'localhost/public/2b.jpg', NULL),
(9, 0, '2b', '6dd9492e661a752a49bcb32a7857b360', '保密', 2147483647, '2b@2b.com', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cate`
--
ALTER TABLE `cate`
  ADD PRIMARY KEY (`cId`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro`
--
ALTER TABLE `pro`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `procomment`
--
ALTER TABLE `procomment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pro_picture`
--
ALTER TABLE `pro_picture`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `r_access`
--
ALTER TABLE `r_access`
  ADD KEY `groupId` (`role_id`),
  ADD KEY `nodeId` (`node_id`);

--
-- Indexes for table `r_node`
--
ALTER TABLE `r_node`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level` (`level`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `r_role`
--
ALTER TABLE `r_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pid` (`pid`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `r_role_user`
--
ALTER TABLE `r_role_user`
  ADD KEY `group_id` (`role_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `admin`
--
ALTER TABLE `admin`
  MODIFY `id` tinyint(5) NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- 使用表AUTO_INCREMENT `cate`
--
ALTER TABLE `cate`
  MODIFY `cId` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=44;
--
-- 使用表AUTO_INCREMENT `order`
--
ALTER TABLE `order`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- 使用表AUTO_INCREMENT `pro`
--
ALTER TABLE `pro`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=106;
--
-- 使用表AUTO_INCREMENT `procomment`
--
ALTER TABLE `procomment`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键';
--
-- 使用表AUTO_INCREMENT `pro_picture`
--
ALTER TABLE `pro_picture`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `r_node`
--
ALTER TABLE `r_node`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `r_role`
--
ALTER TABLE `r_role`
  MODIFY `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` smallint(10) NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
