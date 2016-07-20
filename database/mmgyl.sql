-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2016-07-20 11:56:29
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mmgyl`
--

-- --------------------------------------------------------

--
-- 表的结构 `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` tinyint(5) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `adminNo` int(20) NOT NULL COMMENT '管理员账号',
  `adminName` varchar(20) NOT NULL COMMENT '管理员姓名',
  `password` char(50) NOT NULL COMMENT '密码',
  `phone` int(11) NOT NULL COMMENT '管理员手机号码',
  `email` varchar(50) NOT NULL COMMENT '管理员邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `cate`
--

CREATE TABLE IF NOT EXISTS `cate` (
  `cId` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cateName` varchar(50) NOT NULL COMMENT '分类名',
  `pid` int(20) NOT NULL COMMENT '父级分类',
  `pSn` varchar(50) NOT NULL COMMENT '商品编号',
  PRIMARY KEY (`cId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分类表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
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
  `address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `pro`
--

CREATE TABLE IF NOT EXISTS `pro` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pName` varchar(50) NOT NULL COMMENT '商品名称',
  `pSn` varchar(50) NOT NULL COMMENT '商品编号',
  `pNum` int(10) NOT NULL COMMENT '商品数量',
  `price` decimal(11,2) NOT NULL COMMENT '价格',
  `pIntro` text COMMENT '商品简介',
  `pImg` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `isShow` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否上架',
  `isExist` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有货',
  `cId` int(20) NOT NULL COMMENT '所属分类',
  `userName` varchar(50) NOT NULL COMMENT '所属卖家',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `procomment`
--

CREATE TABLE IF NOT EXISTS `procomment` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `pSn` varchar(50) NOT NULL COMMENT '商品编号',
  `userName` varchar(50) NOT NULL COMMENT '评论者',
  `cContent` text NOT NULL COMMENT '评论内容',
  `cTime` date NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品信息评价表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` smallint(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userNo` int(20) NOT NULL COMMENT '用户账号',
  `userName` varchar(20) NOT NULL COMMENT '用户名',
  `password` char(50) NOT NULL COMMENT '用户密码',
  `sex` enum('保密','女','男') NOT NULL COMMENT '用户性别',
  `phone` int(11) NOT NULL COMMENT '用户手机号码',
  `email` varchar(50) NOT NULL COMMENT '用户邮箱',
  `face` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `address` varchar(100) DEFAULT NULL COMMENT '用户地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
