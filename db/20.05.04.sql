-- phpMyAdmin SQL Dump
-- version 4.2.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 20-05-04 02:52
-- 서버 버전: 5.6.20
-- PHP 버전: 5.6.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `account_delete_log` (
`ac_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `usr_name` char(13) NOT NULL,
  `delete_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=396 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `active_list` (
  `usr_name` varchar(16) NOT NULL,
  `usr_ip` varchar(16) NOT NULL,
  `connect_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `channelPort` int(11) NOT NULL,
  `room` int(11) NOT NULL DEFAULT '-1',
  `connect_type` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cardshop` (
`shop_id` int(11) NOT NULL,
  `shop_type` int(11) DEFAULT NULL,
  `shop_element` int(11) DEFAULT NULL,
  `card_room` int(11) DEFAULT NULL,
  `usr_name` char(16) NOT NULL DEFAULT '',
  `levels` int(11) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `card_price` bigint(11) DEFAULT NULL,
  `card_type` int(11) DEFAULT NULL,
  `card_gf` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `card_level` int(11) DEFAULT NULL,
  `card_skill` int(11) DEFAULT NULL,
  `itm_id` int(11) NOT NULL,
  `itm_uuid` int(11) DEFAULT NULL,
  `first_owner` char(15) NOT NULL,
  `channelPort` int(11) NOT NULL,
  `sale_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_item` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=4055 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `cardshopbank` (
`cb_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `usr_name` char(16) NOT NULL,
  `deposit` bigint(15) NOT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `cardshoptrans` (
`ct_id` int(11) NOT NULL,
  `itm_id` int(11) NOT NULL,
  `itm_slot` int(11) DEFAULT NULL,
  `itm_usr_id` int(11) DEFAULT NULL,
  `itm_type` int(11) DEFAULT NULL,
  `itm_gf` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `itm_level` int(11) DEFAULT NULL,
  `itm_skill` int(8) unsigned DEFAULT NULL,
  `itm_uuid` int(11) DEFAULT NULL,
  `first_owner` char(15) NOT NULL,
  `balance_cash` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `cardshop_log` (
`cl_id` int(11) NOT NULL,
  `itm_id` int(11) NOT NULL,
  `itm_slot` int(11) DEFAULT NULL,
  `itm_usr_id` int(11) DEFAULT NULL,
  `itm_type` int(11) DEFAULT NULL,
  `itm_gf` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `itm_level` int(11) DEFAULT NULL,
  `itm_skill` int(8) unsigned DEFAULT NULL,
  `itm_uuid` int(11) DEFAULT NULL,
  `first_owner` char(15) NOT NULL,
  `balance_cash` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) NOT NULL DEFAULT '0',
  `seller` char(13) DEFAULT '',
  `buyer` char(13) DEFAULT '',
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `channelrate` (
  `ChNum` int(11) NOT NULL,
  `Rate` int(11) NOT NULL,
  `EventStart` time NOT NULL,
  `EventEnd` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `channelrate` (`ChNum`, `Rate`, `EventStart`, `EventEnd`) VALUES
(1, 1, '21:57:00', '23:57:00'),
(2, 1, '21:57:00', '23:57:00'),
(3, 1, '21:57:00', '23:57:00');


CREATE TABLE IF NOT EXISTS `equipments` (
  `usr_id` int(11) NOT NULL,
  `eqp_mag` int(11) DEFAULT '-1',
  `eqp_wpn` int(11) DEFAULT '-1',
  `eqp_arm` int(11) DEFAULT '-1',
  `eqp_pet` int(11) DEFAULT '-1',
  `eqp_foot` int(11) DEFAULT '-1',
  `eqp_body` int(11) DEFAULT '-1',
  `eqp_hand1` int(11) DEFAULT '-1',
  `eqp_hand2` int(11) DEFAULT '-1',
  `eqp_face` int(11) DEFAULT '-1',
  `eqp_hair` int(11) DEFAULT '-1',
  `eqp_head` int(11) DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE IF NOT EXISTS `friends` (
`num` int(11) NOT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `frd_name` char(16) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8237 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `guild` (
`guild_id` int(11) NOT NULL,
  `guild_name` char(13) NOT NULL,
  `guild_leader` char(13) NOT NULL,
  `guild_slots` int(6) NOT NULL DEFAULT '10',
  `guild_banner` varchar(500) DEFAULT '',
  `guild_mark` tinyblob,
  `guild_ideology` smallint(3) NOT NULL,
  `ideology_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guild_condition` bigint(21) NOT NULL DEFAULT '0',
  `condition_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guild_greetings` varchar(50) DEFAULT '',
  `guild_introduce` varchar(2000) DEFAULT ''
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `guildapplication` (
`gapplication_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `usr_name` char(13) NOT NULL,
  `application_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `guildmember` (
`gmember_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `guild_name` char(16) NOT NULL,
  `guild_position` char(16) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `usr_name` char(13) NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `week_point` bigint(15) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=1149 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `guildoccupy` (
`go_id` int(11) NOT NULL,
  `channelPort` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `state` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

INSERT INTO `guildoccupy` (`go_id`, `channelPort`, `type`, `date`, `state`) VALUES
(6, 9600, 1, '2019-05-23 15:21:00', 1),
(8, 9600, 1, '2019-05-24 15:13:00', 1),
(9, 9600, 0, '2019-05-26 07:22:00', 1),
(10, 9600, 1, '2019-05-31 14:21:00', 1),
(11, 9600, 0, '2019-05-31 14:41:00', 1),
(12, 9600, 1, '2019-09-06 14:59:00', 1),
(13, 9600, 1, '2020-03-20 14:59:00', 1),
(14, 9600, 1, '2020-05-01 14:59:00', 1);

CREATE TABLE IF NOT EXISTS `guildpoint` (
`gpoint_id` int(11) NOT NULL,
  `channelport` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `guild_name` char(13) NOT NULL,
  `point` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=203 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `guildposition` (
`gposition_id` int(11) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `guild_name` char(13) NOT NULL,
  `position_name` char(13) NOT NULL,
  `position_authority` smallint(3) NOT NULL,
  `p_member_yn` char(1) NOT NULL DEFAULT 'N',
  `p_app_yn` char(1) NOT NULL DEFAULT 'N',
  `p_position_yn` char(1) NOT NULL DEFAULT 'N',
  `p_auth_yn` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB AUTO_INCREMENT=696 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `itembuylist` (
`ib_id` int(11) NOT NULL,
  `seller` char(16) NOT NULL,
  `buyer` char(16) NOT NULL,
  `gift_type` int(11) NOT NULL,
  `amount_slot` bigint(11) NOT NULL,
  `type_name` char(30) NOT NULL,
  `sent` int(11) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `itemreceive` (
`ir_id` int(11) NOT NULL,
  `seller` char(16) NOT NULL,
  `buyer` char(16) NOT NULL,
  `gift_type` int(11) NOT NULL,
  `amount_slot` bigint(11) NOT NULL,
  `type_name` char(30) NOT NULL,
  `sent` int(11) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=1666 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `items` (
`itm_id` int(11) NOT NULL,
  `itm_slot` int(11) DEFAULT NULL,
  `itm_usr_id` int(11) DEFAULT NULL,
  `itm_type` int(11) DEFAULT NULL,
  `itm_gf` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `itm_level` int(11) DEFAULT NULL,
  `itm_skill` int(8) unsigned DEFAULT NULL,
  `itm_uuid` char(40) DEFAULT NULL,
  `first_owner` varchar(15) NOT NULL,
  `before_owner` varchar(15) NOT NULL,
  `balance_cash` int(11) NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=67178 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `messages` (
`Num` int(11) NOT NULL,
  `sender` char(16) DEFAULT NULL,
  `username` char(16) DEFAULT NULL,
  `messageType` int(11) NOT NULL,
  `levelAndGender` int(11) NOT NULL,
  `unk1` int(11) NOT NULL,
  `msg` char(120) DEFAULT NULL,
  `sent` int(11) DEFAULT NULL,
  `send_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `message_del` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=45720 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mode_setting` (
`mode_id` int(11) NOT NULL,
  `mode_num` int(11) NOT NULL,
  `mode_name` char(16) NOT NULL,
  `mode_exp_min` double NOT NULL DEFAULT '1',
  `mode_exp_max` double NOT NULL DEFAULT '1',
  `mode_cash_min` int(11) NOT NULL DEFAULT '1',
  `mode_cash_max` int(11) NOT NULL DEFAULT '1',
  `mode_element_min` int(11) NOT NULL DEFAULT '1',
  `mode_element_max` int(11) NOT NULL DEFAULT '1',
  `mode_lucky_min` int(11) NOT NULL DEFAULT '1',
  `mode_lucky_max` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;


INSERT INTO `mode_setting` (`mode_id`, `mode_num`, `mode_name`, `mode_exp_min`, `mode_exp_max`, `mode_cash_min`, `mode_cash_max`, `mode_element_min`, `mode_element_max`, `mode_lucky_min`, `mode_lucky_max`) VALUES
(1, 1, '커뮤니티', 1, 5, 1, 1, 1, 1, 1, 1),
(2, 3, '팀플레이', 1, 1, 1, 1, 1, 1, 1, 1),
(3, 4, '서바이벌', 1, 1, 1, 1, 1, 1, 1, 1),
(4, 5, '듀얼', 1, 1, 1, 1, 1, 1, 1, 1),
(5, 6, '럭키3', 1, 1, 1, 1, 1, 1, 1, 1),
(6, 7, '어썰트', 1, 1, 1, 1, 1, 1, 1, 1),
(7, 8, '싸커', 1, 1, 1, 1, 1, 1, 1, 1),
(8, 9, '킹슬레이어', 1, 1, 1, 1, 1, 1, 1, 1),
(9, 10, '매직럭키3', 1, 1, 1, 1, 1, 1, 1, 1),
(10, 11, '던전퀘스트1', 1, 1, 1, 1, 1, 1, 1, 1),
(11, 12, '던전퀘스트2', 1, 1, 1, 1, 1, 1, 1, 1),
(12, 13, '던전퀘스트3', 1, 1, 1, 1, 1, 1, 1, 1),
(13, 14, '던전퀘스트4', 1, 1, 1, 1, 1, 1, 1, 1),
(14, 17, '던전퀘스트5', 1, 1, 1, 1, 1, 1, 1, 1),
(15, 15, '파이트클럽', 1, 1, 1, 1, 1, 1, 1, 1),
(16, 16, '토너먼트', 1, 1, 1, 1, 1, 1, 1, 1),
(17, 18, '숲퀘스트1', 1, 1, 1, 1, 1, 1, 1, 1),
(18, 19, '숲퀘스트2', 1, 1, 1, 1, 1, 1, 1, 1),
(19, 20, '숲퀘스트3', 1, 1, 1, 1, 1, 1, 1, 1),
(20, 21, '숲퀘스트4', 1, 1, 1, 1, 1, 1, 1, 1),
(21, 22, '숲퀘스트5', 1, 1, 1, 1, 1, 1, 1, 1),
(22, 23, '불퀘스트1', 1, 1, 1, 1, 1, 1, 1, 1),
(23, 24, '불퀘스트2', 1, 1, 1, 1, 1, 1, 1, 1),
(24, 25, '불퀘스트3', 1, 1, 1, 1, 1, 1, 1, 1),
(25, 26, '불퀘스트4', 1, 1, 1, 1, 1, 1, 1, 1),
(26, 27, '불퀘스트5', 1, 1, 1, 1, 1, 1, 1, 1),
(27, 28, '두더지', 500000, 600000, 1, 1, 1, 1, 1, 1),
(28, 29, '눈피하기', 1, 1, 1, 1, 1, 1, 1, 1),
(29, 30, '레이스', 500000, 600000, 1, 1, 1, 1, 1, 1),
(30, 31, '상징물', 5000, 5000, 1, 1, 1, 1, 1, 1),
(31, 32, '킹서바이벌', 1, 1, 1, 1, 1, 1, 1, 1),
(32, 33, '대난투서바이벌', 1, 1, 1, 1, 1, 1, 1, 1),
(33, 34, '대난투오토팀', 1, 1, 1, 1, 1, 1, 1, 1),
(34, 35, '대난투데스매치', 1, 1, 1, 1, 1, 1, 1, 1),
(35, 40, '수정탈환', 1, 1, 1, 1, 1, 1, 1, 1),
(36, 41, '하키', 1, 1, 1, 1, 1, 1, 1, 1),
(37, 48, '무한서바이벌', 1, 1, 1, 1, 1, 1, 1, 1),
(38, 49, '무한상징물', 1, 1, 1, 1, 1, 1, 1, 1),
(39, 50, '무한킹', 500000, 600000, 1, 1, 1, 1, 1, 1),
(40, 51, '히어로', 1, 1, 1, 1, 1, 4444444, 1, 1);


CREATE TABLE IF NOT EXISTS `npc_setting` (
`npc_id` int(11) NOT NULL,
  `npc_num` int(11) NOT NULL,
  `npc_name` char(16) NOT NULL,
  `npc_exp_min` int(11) NOT NULL,
  `npc_exp_max` int(11) NOT NULL,
  `npc_element_min` int(11) NOT NULL,
  `npc_element_max` int(11) NOT NULL,
  `npc_lucky_min` int(11) NOT NULL,
  `npc_lucky_max` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

INSERT INTO `npc_setting` (`npc_id`, `npc_num`, `npc_name`, `npc_exp_min`, `npc_exp_max`, `npc_element_min`, `npc_element_max`, `npc_lucky_min`, `npc_lucky_max`) VALUES
(1, 2, '해골1', 100, 200, 1, 3, 1, 2),
(2, 12, '고블린', 100, 200, 1, 3, 1, 2),
(3, 24, '헬하운드', 100, 200, 1, 3, 1, 2),
(4, 7, '슬라임', 1000, 2000, 1, 3, 50, 50),
(5, 3, '아쳐', 150, 250, 1, 4, 1, 3),
(6, 13, '고블린샤먼', 150, 250, 1, 4, 1, 3),
(7, 14, '부엉이', 350, 500, 1, 4, 1, 4),
(8, 15, '나무', 350, 500, 1, 4, 1, 4),
(9, 17, '오크검사', 350, 500, 1, 4, 1, 4),
(10, 5, '해골2', 600, 800, 1, 5, 1, 5),
(11, 28, '케르베로스', 600, 800, 1, 5, 1, 5),
(12, 1, '골렘', 1000, 1500, 1, 6, 2, 6),
(13, 10, '마스터솔져', 1000, 1500, 1, 6, 2, 6),
(14, 19, '오크메이지', 1000, 1500, 1, 6, 2, 6),
(15, 20, '오크광전사', 1000, 1500, 1, 6, 2, 6),
(16, 23, '마그마골렘', 1000, 1500, 1, 6, 2, 6),
(17, 25, '마그마붐버', 1000, 1500, 1, 6, 2, 6),
(18, 9, '보물상자', 3000, 5000, 10, 30, 5, 15),
(19, 30, '이프리트', 1350, 1600, 15, 20, 3, 7),
(20, 8, '가고일', 1350, 1600, 15, 20, 3, 7),
(21, 21, '사이클롭', 1350, 1600, 15, 20, 3, 7),
(22, 11, '발록', 5000, 7000, 100, 300, 5, 10),
(23, 22, '다크페어리', 5000, 7000, 100, 300, 5, 10),
(24, 31, '드래곤', 5000, 7000, 100, 300, 5, 10);


CREATE TABLE IF NOT EXISTS `randombox` (
`rb_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `usr_name` char(13) NOT NULL,
  `get_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `use_state` int(11) NOT NULL,
  `use_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=357 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `randombox_item` (
`ri_id` int(11) NOT NULL,
  `item_type` int(11) NOT NULL,
  `item_gf` int(11) NOT NULL,
  `item_level` int(11) NOT NULL,
  `item_skill` int(11) NOT NULL,
  `get_percentage` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `serverinfo` (
`num` int(11) NOT NULL,
  `channelIP` char(16) NOT NULL DEFAULT '127.0.0.1',
  `channelPort` int(11) NOT NULL,
  `channelType` smallint(1) NOT NULL DEFAULT '0',
  `channelNumber` smallint(1) NOT NULL DEFAULT '0',
  `channelName` char(14) NOT NULL,
  `channelTopGuild` char(13) NOT NULL DEFAULT '',
  `totalUser` int(11) NOT NULL DEFAULT '0',
  `serverRate` int(11) NOT NULL DEFAULT '1',
  `cashRate` int(11) NOT NULL DEFAULT '1',
  `eventStart` time NOT NULL,
  `eventEnd` time NOT NULL,
  `channelOn` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

INSERT INTO `serverinfo` (`num`, `channelIP`, `channelPort`, `channelType`, `channelNumber`, `channelName`, `channelTopGuild`, `totalUser`, `serverRate`, `cashRate`, `eventStart`, `eventEnd`, `channelOn`) VALUES
(1, '220.118.220.158', 9600, 1, 1, '아네모네', '타유타마', 1, 1, 1, '00:00:00', '00:00:00', 1),
(2, '220.118.220.158', 9601, 1, 2, '안쥬', '밤하늘', 1, 1, 1, '00:00:00', '00:00:00', 0),
(3, '220.118.220.158', 9700, 2, 1, '마그마1', '1', 0, 1, 1, '00:00:00', '00:00:00', 1),
(4, '220.118.220.158', 9701, 2, 2, '마그마2', '2', 0, 1, 1, '00:00:00', '00:00:00', 0),
(5, '220.118.220.158', 9800, 3, 1, '마그마3', 'ㅈㄷㄱ', 0, 1, 1, '00:00:00', '00:00:00', 1),
(6, '220.118.220.158', 9801, 3, 2, '마그마4', 'ㅄㅄ', 0, 1, 1, '00:00:00', '00:00:00', 0);


CREATE TABLE IF NOT EXISTS `shop` (
`id` int(11) NOT NULL,
  `itm_type` int(11) NOT NULL DEFAULT '0',
  `itm_code_cost` int(11) NOT NULL DEFAULT '0',
  `itm_cash_cost` int(11) NOT NULL DEFAULT '0',
  `itm_coins_cost` int(11) NOT NULL DEFAULT '0',
  `itm_gf` int(11) NOT NULL DEFAULT '0' COMMENT 'Currency for Purchases',
  `itm_quantity` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8;


INSERT INTO `shop` (`id`, `itm_type`, `itm_code_cost`, `itm_cash_cost`, `itm_coins_cost`, `itm_gf`, `itm_quantity`) VALUES
(1, 4301, 0, 2900, 0, 6000, 0),
(2, 4301, 0, 0, 2900, 6000, 0),
(3, 4302, 0, 2900, 0, 6000, 0),
(4, 4302, 0, 0, 2900, 6000, 0),
(5, 4303, 0, 2900, 0, 6000, 0),
(6, 4303, 0, 0, 2900, 6000, 0),
(7, 4401, 0, 2900, 0, 6000, 0),
(8, 4401, 0, 0, 2900, 6000, 0),
(9, 4402, 0, 2900, 0, 6000, 0),
(10, 4402, 0, 0, 2900, 6000, 0),
(11, 4403, 0, 2900, 0, 6000, 0),
(12, 4403, 0, 0, 2900, 6000, 0),
(13, 4701, 0, 2500, 0, 6000, 0),
(14, 4701, 0, 0, 2500, 6000, 0),
(15, 4702, 0, 2500, 0, 6000, 0),
(16, 4702, 0, 0, 2500, 6000, 0),
(17, 4703, 0, 2500, 0, 6000, 0),
(18, 4703, 0, 0, 2500, 6000, 0),
(19, 4704, 0, 2500, 0, 6000, 0),
(20, 4704, 0, 0, 2500, 6000, 0),
(21, 4705, 0, 2500, 0, 6000, 0),
(22, 4705, 0, 0, 2500, 6000, 0),
(23, 4101, 0, 2500, 0, 6000, 0),
(24, 4101, 0, 0, 2500, 6000, 0),
(25, 4102, 0, 2500, 0, 6000, 0),
(26, 4102, 0, 0, 2500, 6000, 0),
(27, 4103, 0, 2500, 0, 6000, 0),
(28, 4103, 0, 0, 2500, 6000, 0),
(29, 4201, 0, 2600, 0, 6000, 0),
(30, 4201, 0, 0, 2600, 6000, 0),
(31, 4202, 0, 2600, 0, 6000, 0),
(32, 4202, 0, 0, 2600, 6000, 0),
(33, 4203, 0, 2600, 0, 6000, 0),
(34, 4203, 0, 0, 2600, 6000, 0),
(35, 4601, 0, 1000, 0, 6000, 0),
(36, 4601, 0, 0, 1000, 6000, 0),
(37, 4602, 0, 1000, 0, 6000, 0),
(38, 4602, 0, 0, 1000, 6000, 0),
(39, 4603, 0, 1000, 0, 6000, 0),
(40, 4603, 0, 0, 1000, 6000, 0),
(41, 4501, 0, 1000, 0, 6000, 0),
(42, 4501, 0, 0, 1000, 6000, 0),
(43, 4502, 0, 1000, 0, 6000, 0),
(44, 4502, 0, 0, 1000, 6000, 0),
(45, 4503, 0, 1000, 0, 6000, 0),
(46, 4503, 0, 0, 1000, 6000, 0),
(47, 2500, 0, 29900, 0, 6000, 0),
(48, 2501, 0, 22500, 0, 6000, 0),
(49, 2502, 0, 29900, 0, 6000, 0),
(50, 2503, 0, 22500, 0, 6000, 0),
(51, 2504, 0, 9000, 0, 6000, 0),
(52, 2505, 0, 6750, 0, 6000, 0),
(53, 2506, 0, 0, 0, 6000, 0),
(54, 2507, 0, 0, 0, 6000, 0),
(55, 5007, -1, -1, -1, 0, 0),
(56, 5009, -1, -1, -1, 0, 0),
(57, 5010, -1, -1, -1, 0, 0),
(58, 5011, -1, -1, -1, 0, 0),
(59, 5012, -1, -1, -1, 0, 0),
(60, 5013, -1, -1, -1, 0, 0),
(61, 1311, 10000, 0, 0, 0, 0),
(62, 1311, 0, 2500, 0, 30, 0),
(63, 1321, 10000, 0, 0, 0, 0),
(64, 1321, 0, 2500, 0, 30, 0),
(65, 1331, 10000, 0, 0, 0, 0),
(66, 1331, 0, 2500, 0, 30, 0),
(67, 1341, 10000, 0, 0, 0, 0),
(68, 1341, 0, 2500, 0, 30, 0),
(69, 1312, -1, -1, -1, 0, 0),
(70, 1322, -1, -1, -1, 0, 0),
(71, 1332, -1, -1, -1, 0, 0),
(72, 1342, -1, -1, -1, 0, 0),
(73, 1114, 5000, 0, 0, 0, 0),
(74, 1114, 0, 1500, 0, 30, 0),
(75, 1124, 5000, 0, 0, 0, 0),
(76, 1124, 0, 1500, 0, 30, 0),
(77, 1134, 5000, 0, 0, 0, 0),
(78, 1134, 0, 1500, 0, 30, 0),
(79, 1144, 5000, 0, 0, 0, 0),
(80, 1144, 0, 1500, 0, 30, 0),
(81, 1113, 5500, 0, 0, 0, 0),
(82, 1113, 0, 1500, 0, 30, 0),
(83, 1123, 5500, 0, 0, 0, 0),
(84, 1123, 0, 1500, 0, 30, 0),
(85, 1133, 5500, 0, 0, 0, 0),
(86, 1133, 0, 1500, 0, 30, 0),
(87, 1143, 5500, 0, 0, 0, 0),
(88, 1143, 0, 1500, 0, 30, 0),
(89, 1111, 6000, 0, 0, 0, 0),
(90, 1111, 0, 1500, 0, 30, 0),
(91, 1121, 6000, 0, 0, 0, 0),
(92, 1121, 0, 1500, 0, 30, 0),
(93, 1131, 6000, 0, 0, 0, 0),
(94, 1131, 0, 1500, 0, 30, 0),
(95, 1141, 6000, 0, 0, 0, 0),
(96, 1141, 0, 1500, 0, 30, 0),
(97, 1112, 6000, 0, 0, 0, 0),
(98, 1112, 0, 1500, 0, 30, 0),
(99, 1122, 6000, 0, 0, 0, 0),
(100, 1122, 0, 1500, 0, 30, 0),
(101, 1132, 6000, 0, 0, 0, 0),
(102, 1132, 0, 1500, 0, 30, 0),
(103, 1142, 6000, 0, 0, 0, 0),
(104, 1142, 0, 1500, 0, 30, 0),
(105, 1211, 500, 0, 0, 0, 0),
(106, 1211, 0, 600, 0, 30, 0),
(107, 1221, 500, 0, 0, 0, 0),
(108, 1221, 0, 600, 0, 30, 0),
(109, 1231, 500, 0, 0, 0, 0),
(110, 1231, 0, 600, 0, 30, 0),
(111, 1241, 500, 0, 0, 0, 0),
(112, 1241, 0, 600, 0, 30, 0),
(113, 1212, 1000, 0, 0, 0, 0),
(114, 1212, 0, 600, 0, 30, 0),
(115, 1222, 1000, 0, 0, 0, 0),
(116, 1222, 0, 600, 0, 30, 0),
(117, 1232, 1000, 0, 0, 0, 0),
(118, 1232, 0, 600, 0, 30, 0),
(119, 1242, 1000, 0, 0, 0, 0),
(120, 1242, 0, 600, 0, 30, 0),
(121, 1213, 1500, 0, 0, 0, 0),
(122, 1213, 0, 600, 0, 30, 0),
(123, 1223, 1500, 0, 0, 0, 0),
(124, 1223, 0, 600, 0, 30, 0),
(125, 1233, 1500, 0, 0, 0, 0),
(126, 1233, 0, 600, 0, 30, 0),
(127, 1243, 1500, 0, 0, 0, 0),
(128, 1243, 0, 600, 0, 30, 0),
(129, 1214, 5000, 0, 0, 0, 0),
(130, 1214, 0, 1200, 0, 30, 0),
(131, 1224, 5000, 0, 0, 0, 0),
(132, 1224, 0, 1200, 0, 30, 0),
(133, 1234, 5000, 0, 0, 0, 0),
(134, 1234, 0, 1200, 0, 30, 0),
(135, 1244, 5000, 0, 0, 0, 0),
(136, 1244, 0, 1200, 0, 30, 0),
(137, 11311, -1, -1, -1, 0, 0),
(138, 11321, -1, -1, -1, 0, 0),
(139, 11331, -1, -1, -1, 0, 0),
(140, 11341, -1, -1, -1, 0, 0),
(141, 11114, -1, -1, -1, 0, 0),
(142, 11124, -1, -1, -1, 0, 0),
(143, 11134, -1, -1, -1, 0, 0),
(144, 11144, -1, -1, -1, 0, 0),
(145, 11113, -1, -1, -1, 0, 0),
(146, 11123, -1, -1, -1, 0, 0),
(147, 11133, -1, -1, -1, 0, 0),
(148, 11143, -1, -1, -1, 0, 0),
(149, 11111, -1, -1, -1, 0, 0),
(150, 11121, -1, -1, -1, 0, 0),
(151, 11131, -1, -1, -1, 0, 0),
(152, 11141, -1, -1, -1, 0, 0),
(153, 11112, -1, -1, -1, 0, 0),
(154, 11122, -1, -1, -1, 0, 0),
(155, 11132, -1, -1, -1, 0, 0),
(156, 11142, -1, -1, -1, 0, 0),
(157, 11211, -1, -1, -1, 0, 0),
(158, 11221, -1, -1, -1, 0, 0),
(159, 11231, -1, -1, -1, 0, 0),
(160, 11241, -1, -1, -1, 0, 0),
(161, 11212, -1, -1, -1, 0, 0),
(162, 11222, -1, -1, -1, 0, 0),
(163, 11232, -1, -1, -1, 0, 0),
(164, 11242, -1, -1, -1, 0, 0),
(165, 11213, -1, -1, -1, 0, 0),
(166, 11223, -1, -1, -1, 0, 0),
(167, 11233, -1, -1, -1, 0, 0),
(168, 11243, -1, -1, -1, 0, 0),
(169, 11214, -1, -1, -1, 0, 0),
(170, 11224, -1, -1, -1, 0, 0),
(171, 11234, -1, -1, -1, 0, 0),
(172, 11244, -1, -1, -1, 0, 0),
(173, 5000, 0, 1900, 0, 6000, 0),
(174, 5001, 0, 1900, 0, 6000, 0),
(175, 5002, 0, 1900, 0, 6000, 0),
(176, 5003, 0, 2300, 0, 6000, 0),
(177, 5004, 0, 2300, 0, 6000, 0),
(178, 5005, 0, 2500, 0, 6000, 0),
(179, 5006, 0, 2500, 0, 6000, 0),
(180, 5008, 0, 900, 0, 6000, 0),
(181, 5014, 0, 3600, 0, 6000, 0),
(182, 2000, 0, 150, 0, 1, 0),
(183, 2000, 0, 750, 0, 7, 0),
(184, 2000, 0, 1500, 0, 30, 0),
(185, 2000, 0, 4500, 0, 365, 0),
(186, 2001, 0, 150, 0, 1, 0),
(187, 2001, 0, 750, 0, 7, 0),
(188, 2001, 0, 1500, 0, 30, 0),
(189, 2001, 0, 4500, 0, 365, 0),
(190, 2002, 0, 150, 0, 1, 0),
(191, 2002, 0, 750, 0, 7, 0),
(192, 2002, 0, 1500, 0, 30, 0),
(193, 2002, 0, 4500, 0, 365, 0),
(194, 2003, 0, 150, 0, 1, 0),
(195, 2003, 0, 750, 0, 7, 0),
(196, 2003, 0, 1500, 0, 30, 0),
(197, 2003, 0, 4500, 0, 365, 0),
(198, 2004, 0, 5800, 0, 6000, 0),
(199, 2005, 0, 9800, 0, 6000, 0),
(200, 2006, 0, 250, 0, 1, 0),
(201, 2006, 0, 1250, 0, 7, 0),
(202, 2006, 0, 2500, 0, 30, 0),
(203, 2006, 0, 7500, 0, 365, 0),
(204, 2007, 0, 100, 0, 1, 0),
(205, 2007, 0, 500, 0, 7, 0),
(206, 2007, 0, 900, 0, 30, 0),
(207, 2007, 0, 2700, 0, 365, 0),
(208, 2008, 0, 100, 0, 1, 0),
(209, 2008, 0, 500, 0, 7, 0),
(210, 2008, 0, 900, 0, 30, 0),
(211, 2008, 0, 2700, 0, 365, 0),
(212, 2009, 0, 500, 0, 6000, 1),
(213, 2009, 0, 4500, 0, 6000, 10),
(214, 2010, 0, 250, 0, 1, 0),
(215, 2010, 0, 1250, 0, 7, 0),
(216, 2010, 0, 2500, 0, 30, 0),
(217, 2010, 0, 7500, 0, 365, 0),
(218, 2012, 0, 100, 0, 1, 0),
(219, 2012, 0, 500, 0, 7, 0),
(220, 2012, 0, 900, 0, 30, 0),
(221, 2012, 0, 2700, 0, 365, 0),
(222, 2901, 0, 1000, 0, 1, 0),
(223, 2901, 0, 5000, 0, 7, 0),
(224, 2901, 0, 9900, 0, 30, 0),
(225, 2901, 0, 29700, 0, 365, 0),
(226, 2902, 0, 1000, 0, 1, 0),
(227, 2902, 0, 5000, 0, 7, 0),
(228, 2902, 0, 9900, 0, 30, 0),
(229, 2902, 0, 29700, 0, 365, 0),
(230, 2903, 0, 1000, 0, 1, 0),
(231, 2903, 0, 5000, 0, 7, 0),
(232, 2903, 0, 9900, 0, 30, 0),
(233, 2903, 0, 29700, 0, 365, 0),
(234, 2904, 0, 1000, 0, 1, 0),
(235, 2904, 0, 5000, 0, 7, 0),
(236, 2904, 0, 9900, 0, 30, 0),
(237, 2904, 0, 29700, 0, 365, 0),
(238, 2900, 0, 350, 0, 1, 0),
(239, 2900, 0, 1750, 0, 7, 0),
(240, 2900, 0, 3500, 0, 30, 0),
(241, 2900, 0, 10500, 0, 365, 0),
(242, 2150, 0, 300, 0, 1, 0),
(243, 2150, 0, 1500, 0, 7, 0),
(244, 2150, 0, 3000, 0, 30, 0),
(245, 2150, 0, 9000, 0, 365, 0),
(246, 2015, 0, 2500, 0, 6000, 1),
(247, 2015, 0, 15000, 0, 6000, 10),
(248, 2016, 0, 2500, 0, 6000, 1),
(249, 2016, 0, 15000, 0, 6000, 10),
(250, 2017, 0, 600, 0, 1, 0),
(251, 2017, 0, 5900, 0, 40, 0),
(252, 2021, 0, 1000, 0, 1, 0),
(253, 2021, 0, 5000, 0, 7, 0),
(254, 2101, 0, 150, 0, 1, 0),
(255, 2101, 0, 750, 0, 7, 0),
(256, 2101, 0, 1500, 0, 30, 0),
(257, 2101, 0, 4500, 0, 365, 0),
(258, 2102, 0, 150, 0, 1, 0),
(259, 2102, 0, 750, 0, 7, 0),
(260, 2102, 0, 1500, 0, 30, 0),
(261, 2102, 0, 4500, 0, 365, 0),
(262, 2103, 0, 150, 0, 1, 0),
(263, 2103, 0, 750, 0, 7, 0),
(264, 2103, 0, 1500, 0, 30, 0),
(265, 2103, 0, 4500, 0, 365, 0),
(266, 2104, 0, 150, 0, 1, 0),
(267, 2104, 0, 750, 0, 7, 0),
(268, 2104, 0, 1500, 0, 30, 0),
(269, 2104, 0, 4500, 0, 365, 0),
(270, 2105, 0, 150, 0, 1, 0),
(271, 2105, 0, 750, 0, 7, 0),
(272, 2105, 0, 1500, 0, 30, 0),
(273, 2105, 0, 4500, 0, 365, 0),
(274, 2106, 0, 150, 0, 1, 0),
(275, 2106, 0, 750, 0, 7, 0),
(276, 2106, 0, 1500, 0, 30, 0),
(277, 2106, 0, 4500, 0, 365, 0),
(278, 2107, 0, 150, 0, 1, 0),
(279, 2107, 0, 750, 0, 7, 0),
(280, 2107, 0, 1500, 0, 30, 0),
(281, 2107, 0, 4500, 0, 365, 0),
(282, 2108, 0, 150, 0, 1, 0),
(283, 2108, 0, 750, 0, 7, 0),
(284, 2108, 0, 1500, 0, 30, 0),
(285, 2108, 0, 4500, 0, 365, 0),
(286, 2109, 0, 150, 0, 1, 0),
(287, 2109, 0, 750, 0, 7, 0),
(288, 2109, 0, 1500, 0, 30, 0),
(289, 2109, 0, 4500, 0, 365, 0),
(290, 2110, 0, 150, 0, 1, 0),
(291, 2110, 0, 750, 0, 7, 0),
(292, 2110, 0, 1500, 0, 30, 0),
(293, 2110, 0, 4500, 0, 365, 0),
(294, 2111, 0, 150, 0, 1, 0),
(295, 2111, 0, 750, 0, 7, 0),
(296, 2111, 0, 1500, 0, 30, 0),
(297, 2111, 0, 4500, 0, 365, 0),
(298, 2112, 0, 150, 0, 1, 0),
(299, 2112, 0, 750, 0, 7, 0),
(300, 2112, 0, 4500, 0, 365, 0),
(301, 3008, 0, 4100, 0, 0, 0),
(302, 3018, 0, 12100, 0, 0, 0),
(303, 3013, 0, 7600, 0, 0, 0),
(304, 3012, 0, 7600, 0, 0, 0),
(305, 3010, 0, 7600, 0, 0, 0),
(306, 3011, 0, 7600, 0, 0, 0),
(307, 3014, 0, 3100, 0, 0, 0),
(308, 3015, 0, 3100, 0, 0, 0),
(309, 3016, 0, 3100, 0, 0, 0),
(310, 2112, 0, 1500, 0, 30, 0),
(311, 1224, 0, 6000, 0, 365, 0),
(312, 1311, 0, 12000, 0, 365, 0),
(313, 1311, 0, 2000, 0, 7, 0),
(314, 1311, 0, 400, 0, 1, 0),
(315, 1114, 0, 7500, 0, 365, 0),
(316, 1114, 0, 1250, 0, 7, 0),
(317, 1114, 0, 250, 0, 1, 0),
(318, 1124, 0, 7500, 0, 365, 0),
(319, 1124, 0, 1250, 0, 7, 0),
(320, 1124, 0, 250, 0, 1, 0),
(321, 1134, 0, 7500, 0, 365, 0),
(322, 1134, 0, 1250, 0, 7, 0),
(323, 1134, 0, 250, 0, 1, 0),
(324, 1144, 0, 7500, 0, 365, 0),
(325, 1144, 0, 1250, 0, 7, 0),
(326, 1144, 0, 250, 0, 1, 0),
(327, 1321, 0, 12000, 0, 365, 0),
(328, 1321, 0, 2000, 0, 7, 0),
(329, 1321, 0, 400, 0, 1, 0),
(330, 1331, 0, 12000, 0, 365, 0),
(331, 1331, 0, 2000, 0, 7, 0),
(332, 1331, 0, 400, 0, 1, 0),
(333, 1341, 0, 12000, 0, 365, 0),
(334, 1341, 0, 2000, 0, 7, 0),
(335, 1341, 0, 400, 0, 1, 0),
(336, 1113, 0, 7500, 0, 365, 0),
(337, 1113, 0, 1250, 0, 7, 0),
(338, 1113, 0, 250, 0, 1, 0),
(339, 1123, 0, 7500, 0, 365, 0),
(340, 1123, 0, 1250, 0, 7, 0),
(341, 1123, 0, 250, 0, 1, 0),
(342, 1133, 0, 7500, 0, 365, 0),
(343, 1133, 0, 1250, 0, 7, 0),
(344, 1133, 0, 250, 0, 1, 0),
(345, 1143, 0, 7500, 0, 365, 0),
(346, 1143, 0, 1250, 0, 7, 0),
(347, 1143, 0, 250, 0, 1, 0),
(348, 1111, 0, 7500, 0, 365, 0),
(349, 1111, 0, 1250, 0, 7, 0),
(350, 1111, 0, 250, 0, 1, 0),
(351, 1121, 0, 7500, 0, 365, 0),
(352, 1121, 0, 1250, 0, 7, 0),
(353, 1121, 0, 250, 0, 1, 0),
(354, 1131, 0, 7500, 0, 365, 0),
(355, 1131, 0, 1250, 0, 7, 0),
(356, 1131, 0, 250, 0, 1, 0),
(357, 1141, 0, 7500, 0, 365, 0),
(358, 1141, 0, 1250, 0, 7, 0),
(359, 1141, 0, 250, 0, 1, 0),
(360, 1112, 0, 7500, 0, 365, 0),
(361, 1112, 0, 1250, 0, 7, 0),
(362, 1112, 0, 250, 0, 1, 0),
(363, 1122, 0, 7500, 0, 365, 0),
(364, 1122, 0, 1250, 0, 7, 0),
(365, 1122, 0, 250, 0, 1, 0),
(366, 1132, 0, 7500, 0, 365, 0),
(367, 1132, 0, 1250, 0, 7, 0),
(368, 1132, 0, 250, 0, 1, 0),
(369, 1142, 0, 7500, 0, 365, 0),
(370, 1142, 0, 1250, 0, 7, 0),
(371, 1142, 0, 250, 0, 1, 0),
(372, 1211, 0, 3000, 0, 365, 0),
(373, 1211, 0, 500, 0, 7, 0),
(374, 1211, 0, 100, 0, 1, 0),
(375, 1221, 0, 3000, 0, 365, 0),
(376, 1221, 0, 500, 0, 7, 0),
(377, 1221, 0, 100, 0, 1, 0),
(378, 1231, 0, 3000, 0, 365, 0),
(379, 1231, 0, 500, 0, 7, 0),
(380, 1231, 0, 100, 0, 1, 0),
(381, 1241, 0, 3000, 0, 365, 0),
(382, 1241, 0, 500, 0, 7, 0),
(383, 1241, 0, 100, 0, 1, 0),
(384, 1212, 0, 3000, 0, 365, 0),
(385, 1212, 0, 500, 0, 7, 0),
(386, 1212, 0, 100, 0, 1, 0),
(387, 1222, 0, 3000, 0, 365, 0),
(388, 1222, 0, 500, 0, 7, 0),
(389, 1222, 0, 100, 0, 1, 0),
(390, 1232, 0, 3000, 0, 365, 0),
(391, 1232, 0, 500, 0, 7, 0),
(392, 1232, 0, 100, 0, 1, 0),
(393, 1242, 0, 3000, 0, 365, 0),
(394, 1242, 0, 500, 0, 7, 0),
(395, 1242, 0, 100, 0, 1, 0),
(396, 1213, 0, 3000, 0, 365, 0),
(397, 1213, 0, 500, 0, 7, 0),
(398, 1213, 0, 100, 0, 1, 0),
(399, 1223, 0, 3000, 0, 365, 0),
(400, 1223, 0, 500, 0, 7, 0),
(401, 1223, 0, 100, 0, 1, 0),
(402, 1233, 0, 3000, 0, 365, 0),
(403, 1233, 0, 500, 0, 7, 0),
(404, 1233, 0, 100, 0, 1, 0),
(405, 1243, 0, 3000, 0, 365, 0),
(406, 1243, 0, 500, 0, 7, 0),
(407, 1243, 0, 100, 0, 1, 0),
(408, 1214, 0, 6000, 0, 365, 0),
(409, 1214, 0, 1000, 0, 7, 0),
(410, 1214, 0, 200, 0, 1, 0),
(411, 1224, 0, 6000, 0, 365, 0),
(412, 1224, 0, 1000, 0, 7, 0),
(413, 1224, 0, 200, 0, 1, 0),
(414, 1234, 0, 6000, 0, 365, 0),
(415, 1234, 0, 1000, 0, 7, 0),
(416, 1234, 0, 200, 0, 1, 0),
(417, 1244, 0, 6000, 0, 365, 0),
(418, 1244, 0, 1000, 0, 7, 0),
(419, 1244, 0, 200, 0, 1, 0),
(420, 1312, 0, 4000, 0, 30, 0),
(421, 1312, 0, 12000, 0, 365, 0),
(422, 1312, 0, 2000, 0, 7, 0),
(423, 1312, 0, 400, 0, 1, 0),
(424, 1322, 0, 4000, 0, 30, 0),
(425, 1322, 0, 12000, 0, 365, 0),
(426, 1322, 0, 2000, 0, 7, 0),
(427, 1322, 0, 400, 0, 1, 0),
(428, 1332, 0, 4000, 0, 30, 0),
(429, 1332, 0, 12000, 0, 365, 0),
(430, 1332, 0, 2000, 0, 7, 0),
(431, 1332, 0, 400, 0, 1, 0),
(432, 1342, 0, 4000, 0, 30, 0),
(433, 1342, 0, 12000, 0, 365, 0),
(434, 1342, 0, 2000, 0, 7, 0),
(435, 1342, 0, 400, 0, 1, 0),
(436, 3017, 0, 6100, 0, 0, 0),
(437, 3000, 0, 2600, 0, 0, 0),
(438, 3002, 0, 2600, 0, 0, 0),
(439, 3003, 0, 2600, 0, 0, 0),
(440, 3004, 0, 1100, 0, 0, 0),
(441, 3005, 0, 1100, 0, 0, 0),
(442, 3006, 0, 1100, 0, 0, 0),
(443, 3007, 0, 2100, 0, 0, 0),
(444, 3001, 0, 2600, 0, 0, 0),
(445, 2021, 0, 9900, 0, 30, 0),
(446, 2009, 0, 9000, 0, 6000, 25),
(447, 2011, 0, 9000, 0, 6000, 25),
(448, 2009, 0, 6750, 0, 6000, 15),
(449, 2011, 0, 6750, 0, 6000, 15);

CREATE TABLE IF NOT EXISTS `trade_log` (
`tr_id` int(11) NOT NULL,
  `sender` char(13) NOT NULL,
  `trade_item1` int(11) NOT NULL,
  `trade_item2` int(11) NOT NULL,
  `trade_item3` int(11) NOT NULL,
  `trade_item4` int(11) NOT NULL,
  `trade_code` bigint(15) NOT NULL,
  `receiver` char(13) NOT NULL,
  `trade_add_uuid` int(11) NOT NULL,
  `trade_result` char(13) NOT NULL,
  `trade_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=3948 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `trainingitems` (
`training_id` int(11) NOT NULL,
  `training_type` int(11) NOT NULL,
  `training_gf` int(11) NOT NULL DEFAULT '0',
  `training_level` int(11) NOT NULL DEFAULT '0',
  `training_skill` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

INSERT INTO `trainingitems` (`training_id`, `training_type`, `training_gf`, `training_level`, `training_skill`) VALUES
(1, 1301, 7, 8, 0),
(2, 1101, 7, 8, 0),
(3, 1102, 7, 8, 0),
(4, 1103, 7, 8, 0),
(16, 11211, 7, 1, 0);


CREATE TABLE IF NOT EXISTS `userban` (
`id` int(11) NOT NULL,
  `usr_name` char(16) NOT NULL,
  `ban_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `expiration_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `users` (
`usr_id` smallint(6) NOT NULL,
  `kakao_id` int(11) NOT NULL,
  `usr_name` varchar(16) NOT NULL,
  `usr_pw` varchar(16) NOT NULL,
  `usr_ip` varchar(16) DEFAULT '127.0.0.1',
  `usr_gender` tinyint(1) DEFAULT '1',
  `usr_char` int(3) DEFAULT '10',
  `usr_points` bigint(20) DEFAULT '0',
  `usr_level` int(11) DEFAULT '0',
  `usr_code` bigint(20) DEFAULT '0',
  `usr_coins` int(11) DEFAULT '0',
  `usr_cash` int(11) DEFAULT '0',
  `usr_water` int(6) DEFAULT '0',
  `usr_fire` int(6) DEFAULT '0',
  `usr_earth` int(6) DEFAULT '0',
  `usr_wind` int(6) DEFAULT '0',
  `usr_nslots` smallint(6) DEFAULT '18' COMMENT 'Maximum slots',
  `usr_wins` int(11) DEFAULT '0',
  `usr_losses` int(11) DEFAULT '0',
  `usr_ko` int(11) DEFAULT '0',
  `usr_down` int(11) DEFAULT '0',
  `usr_scroll1` smallint(6) DEFAULT '0',
  `usr_scroll2` smallint(6) DEFAULT '0',
  `usr_scroll3` smallint(6) DEFAULT '0',
  `usr_mission` smallint(3) DEFAULT '1',
  `usr_admin` tinyint(1) NOT NULL DEFAULT '0',
  `usr_type` int(11) NOT NULL,
  `usr_hwid` char(32) NOT NULL,
  `usr_bonus` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `usr_last_login` char(8) DEFAULT '00000000',
  `usr_guildname` varchar(16) NOT NULL,
  `usr_guildduty` varchar(16) NOT NULL,
  `usr_supporters` int(11) NOT NULL,
  `bandate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `banstate` int(11) DEFAULT '0',
  `chatBan` int(11) DEFAULT '0',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `delete_yn` tinyint(1) NOT NULL DEFAULT '0',
  `delete_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4554 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `weight_setting` (
`weight_id` int(11) NOT NULL,
  `weight_total_player` char(5) NOT NULL,
  `weight_min` double NOT NULL DEFAULT '1',
  `weight_max` double NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;


INSERT INTO `weight_setting` (`weight_id`, `weight_total_player`, `weight_min`, `weight_max`) VALUES
(1, '1인', 5.6, 1.7),
(2, '2인', 0.5, 0.5),
(3, '3인', 0.5, 0.5),
(4, '4인', 0.5, 0.5),
(5, '5인', 0.5, 0.5),
(6, '6인', 0.5, 0.5),
(7, '7인', 0.5, 0.5),
(8, '8인', 0.5, 0.5);

CREATE TABLE IF NOT EXISTS `z_article` (
`article_no` int(11) NOT NULL,
  `article_category` int(11) NOT NULL DEFAULT '0',
  `article_title` varchar(200) DEFAULT '',
  `article_content` varchar(2000) DEFAULT '',
  `article_writer` varchar(50) DEFAULT '',
  `article_regdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `article_viewcnt` int(11) DEFAULT '0',
  `article_uuid` varchar(32) NOT NULL,
  `article_del` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3298 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `z_article_view` (
`view_id` int(11) NOT NULL,
  `view_category` int(11) NOT NULL DEFAULT '0',
  `view_article_no` int(11) NOT NULL,
  `view_usr_name` varchar(13) NOT NULL,
  `view_usr_ip` varchar(16) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `z_guest_book` (
`gb_id` int(11) NOT NULL,
  `guest_category` int(11) NOT NULL DEFAULT '0',
  `type_id` int(11) NOT NULL,
  `guest_writer` varchar(13) NOT NULL,
  `tag_name` varchar(13) DEFAULT '',
  `guest_content` varchar(1000) NOT NULL,
  `guest_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guest_del` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=429 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `z_guild_like` (
`gl_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `usr_name` char(12) NOT NULL,
  `guild_id` int(11) NOT NULL,
  `guild_name` char(13) NOT NULL,
  `like_type` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `z_my_like` (
`gl_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `usr_name` char(12) NOT NULL,
  `like_usr_id` int(11) NOT NULL,
  `like_usr_name` char(13) NOT NULL,
  `like_type` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `z_reply` (
`reply_no` int(11) NOT NULL,
  `article_no` int(11) NOT NULL DEFAULT '0',
  `reply_category` int(11) NOT NULL DEFAULT '0',
  `reply_content` varchar(1000) NOT NULL,
  `reply_writer` varchar(50) NOT NULL,
  `reply_reg_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_update_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reply_uuid` varchar(32) DEFAULT '',
  `reply_del` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;


--
-- 테이블의 인덱스 `account_delete_log`
--
ALTER TABLE `account_delete_log`
 ADD PRIMARY KEY (`ac_id`);

--
-- 테이블의 인덱스 `active_list`
--
ALTER TABLE `active_list`
 ADD PRIMARY KEY (`usr_name`);

--
-- 테이블의 인덱스 `cardshop`
--
ALTER TABLE `cardshop`
 ADD PRIMARY KEY (`shop_id`);

--
-- 테이블의 인덱스 `cardshopbank`
--
ALTER TABLE `cardshopbank`
 ADD PRIMARY KEY (`cb_id`);

--
-- 테이블의 인덱스 `cardshoptrans`
--
ALTER TABLE `cardshoptrans`
 ADD PRIMARY KEY (`ct_id`);

--
-- 테이블의 인덱스 `cardshop_log`
--
ALTER TABLE `cardshop_log`
 ADD PRIMARY KEY (`cl_id`);

--
-- 테이블의 인덱스 `channelrate`
--
ALTER TABLE `channelrate`
 ADD PRIMARY KEY (`ChNum`);

--
-- 테이블의 인덱스 `equipments`
--
ALTER TABLE `equipments`
 ADD PRIMARY KEY (`usr_id`), ADD UNIQUE KEY `usr_id` (`usr_id`);

--
-- 테이블의 인덱스 `friends`
--
ALTER TABLE `friends`
 ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `guild`
--
ALTER TABLE `guild`
 ADD PRIMARY KEY (`guild_id`);

--
-- 테이블의 인덱스 `guildapplication`
--
ALTER TABLE `guildapplication`
 ADD PRIMARY KEY (`gapplication_id`), ADD KEY `guild_id` (`guild_id`,`usr_id`);

--
-- 테이블의 인덱스 `guildmember`
--
ALTER TABLE `guildmember`
 ADD PRIMARY KEY (`gmember_id`);

--
-- 테이블의 인덱스 `guildoccupy`
--
ALTER TABLE `guildoccupy`
 ADD PRIMARY KEY (`go_id`);

--
-- 테이블의 인덱스 `guildpoint`
--
ALTER TABLE `guildpoint`
 ADD PRIMARY KEY (`gpoint_id`), ADD KEY `guild_id` (`guild_id`), ADD KEY `guild_id_2` (`guild_id`), ADD KEY `point` (`point`), ADD KEY `guild_id_3` (`guild_id`);

--
-- 테이블의 인덱스 `guildposition`
--
ALTER TABLE `guildposition`
 ADD PRIMARY KEY (`gposition_id`);

--
-- 테이블의 인덱스 `itembuylist`
--
ALTER TABLE `itembuylist`
 ADD PRIMARY KEY (`ib_id`);

--
-- 테이블의 인덱스 `itemreceive`
--
ALTER TABLE `itemreceive`
 ADD PRIMARY KEY (`ir_id`);

--
-- 테이블의 인덱스 `items`
--
ALTER TABLE `items`
 ADD PRIMARY KEY (`itm_id`), ADD KEY `itm_usr_id` (`itm_usr_id`), ADD KEY `itm_type` (`itm_type`), ADD KEY `itm_slot` (`itm_slot`);

--
-- 테이블의 인덱스 `messages`
--
ALTER TABLE `messages`
 ADD PRIMARY KEY (`Num`);

--
-- 테이블의 인덱스 `mode_setting`
--
ALTER TABLE `mode_setting`
 ADD PRIMARY KEY (`mode_id`);

--
-- 테이블의 인덱스 `npc_setting`
--
ALTER TABLE `npc_setting`
 ADD PRIMARY KEY (`npc_id`);

--
-- 테이블의 인덱스 `randombox`
--
ALTER TABLE `randombox`
 ADD PRIMARY KEY (`rb_id`);

--
-- 테이블의 인덱스 `randombox_item`
--
ALTER TABLE `randombox_item`
 ADD PRIMARY KEY (`ri_id`);

--
-- 테이블의 인덱스 `serverinfo`
--
ALTER TABLE `serverinfo`
 ADD PRIMARY KEY (`num`);

--
-- 테이블의 인덱스 `shop`
--
ALTER TABLE `shop`
 ADD PRIMARY KEY (`id`);

--
-- 테이블의 인덱스 `trade_log`
--
ALTER TABLE `trade_log`
 ADD PRIMARY KEY (`tr_id`);

--
-- 테이블의 인덱스 `trainingitems`
--
ALTER TABLE `trainingitems`
 ADD PRIMARY KEY (`training_id`);

--
-- 테이블의 인덱스 `userban`
--
ALTER TABLE `userban`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`usr_name`);

--
-- 테이블의 인덱스 `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`usr_id`), ADD UNIQUE KEY `usr_id` (`usr_id`) USING BTREE, ADD KEY `usr_id_2` (`usr_id`);

--
-- 테이블의 인덱스 `weight_setting`
--
ALTER TABLE `weight_setting`
 ADD PRIMARY KEY (`weight_id`);

--
-- 테이블의 인덱스 `z_article`
--
ALTER TABLE `z_article`
 ADD PRIMARY KEY (`article_no`);

--
-- 테이블의 인덱스 `z_article_view`
--
ALTER TABLE `z_article_view`
 ADD PRIMARY KEY (`view_id`);

--
-- 테이블의 인덱스 `z_guest_book`
--
ALTER TABLE `z_guest_book`
 ADD PRIMARY KEY (`gb_id`);

--
-- 테이블의 인덱스 `z_guild_like`
--
ALTER TABLE `z_guild_like`
 ADD PRIMARY KEY (`gl_id`);

--
-- 테이블의 인덱스 `z_my_like`
--
ALTER TABLE `z_my_like`
 ADD PRIMARY KEY (`gl_id`);

--
-- 테이블의 인덱스 `z_reply`
--
ALTER TABLE `z_reply`
 ADD PRIMARY KEY (`reply_no`);

--
-- 덤프된 테이블의 AUTO_INCREMENT
--

--
-- 테이블의 AUTO_INCREMENT `account_delete_log`
--
ALTER TABLE `account_delete_log`
MODIFY `ac_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=396;
--
-- 테이블의 AUTO_INCREMENT `cardshop`
--
ALTER TABLE `cardshop`
MODIFY `shop_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4055;
--
-- 테이블의 AUTO_INCREMENT `cardshopbank`
--
ALTER TABLE `cardshopbank`
MODIFY `cb_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- 테이블의 AUTO_INCREMENT `cardshoptrans`
--
ALTER TABLE `cardshoptrans`
MODIFY `ct_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=115;
--
-- 테이블의 AUTO_INCREMENT `cardshop_log`
--
ALTER TABLE `cardshop_log`
MODIFY `cl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=216;
--
-- 테이블의 AUTO_INCREMENT `friends`
--
ALTER TABLE `friends`
MODIFY `num` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8237;
--
-- 테이블의 AUTO_INCREMENT `guild`
--
ALTER TABLE `guild`
MODIFY `guild_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=159;
--
-- 테이블의 AUTO_INCREMENT `guildapplication`
--
ALTER TABLE `guildapplication`
MODIFY `gapplication_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=253;
--
-- 테이블의 AUTO_INCREMENT `guildmember`
--
ALTER TABLE `guildmember`
MODIFY `gmember_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1149;
--
-- 테이블의 AUTO_INCREMENT `guildoccupy`
--
ALTER TABLE `guildoccupy`
MODIFY `go_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- 테이블의 AUTO_INCREMENT `guildpoint`
--
ALTER TABLE `guildpoint`
MODIFY `gpoint_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=203;
--
-- 테이블의 AUTO_INCREMENT `guildposition`
--
ALTER TABLE `guildposition`
MODIFY `gposition_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=696;
--
-- 테이블의 AUTO_INCREMENT `itembuylist`
--
ALTER TABLE `itembuylist`
MODIFY `ib_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=54;
--
-- 테이블의 AUTO_INCREMENT `itemreceive`
--
ALTER TABLE `itemreceive`
MODIFY `ir_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1666;
--
-- 테이블의 AUTO_INCREMENT `items`
--
ALTER TABLE `items`
MODIFY `itm_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=67178;
--
-- 테이블의 AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
MODIFY `Num` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45720;
--
-- 테이블의 AUTO_INCREMENT `mode_setting`
--
ALTER TABLE `mode_setting`
MODIFY `mode_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- 테이블의 AUTO_INCREMENT `npc_setting`
--
ALTER TABLE `npc_setting`
MODIFY `npc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- 테이블의 AUTO_INCREMENT `randombox`
--
ALTER TABLE `randombox`
MODIFY `rb_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=357;
--
-- 테이블의 AUTO_INCREMENT `randombox_item`
--
ALTER TABLE `randombox_item`
MODIFY `ri_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- 테이블의 AUTO_INCREMENT `serverinfo`
--
ALTER TABLE `serverinfo`
MODIFY `num` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- 테이블의 AUTO_INCREMENT `shop`
--
ALTER TABLE `shop`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=450;
--
-- 테이블의 AUTO_INCREMENT `trade_log`
--
ALTER TABLE `trade_log`
MODIFY `tr_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3948;
--
-- 테이블의 AUTO_INCREMENT `trainingitems`
--
ALTER TABLE `trainingitems`
MODIFY `training_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- 테이블의 AUTO_INCREMENT `userban`
--
ALTER TABLE `userban`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- 테이블의 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
MODIFY `usr_id` smallint(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4554;
--
-- 테이블의 AUTO_INCREMENT `weight_setting`
--
ALTER TABLE `weight_setting`
MODIFY `weight_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- 테이블의 AUTO_INCREMENT `z_article`
--
ALTER TABLE `z_article`
MODIFY `article_no` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3298;
--
-- 테이블의 AUTO_INCREMENT `z_article_view`
--
ALTER TABLE `z_article_view`
MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=207;
--
-- 테이블의 AUTO_INCREMENT `z_guest_book`
--
ALTER TABLE `z_guest_book`
MODIFY `gb_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=429;
--
-- 테이블의 AUTO_INCREMENT `z_guild_like`
--
ALTER TABLE `z_guild_like`
MODIFY `gl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=112;
--
-- 테이블의 AUTO_INCREMENT `z_my_like`
--
ALTER TABLE `z_my_like`
MODIFY `gl_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=47;
--
-- 테이블의 AUTO_INCREMENT `z_reply`
--
ALTER TABLE `z_reply`
MODIFY `reply_no` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=151;
DELIMITER $$
--
-- 이벤트
--
CREATE DEFINER=`season5`@`%` EVENT `BanStateUpdate` ON SCHEDULE EVERY 10 MINUTE STARTS '2018-06-13 00:00:00' ENDS '2019-12-28 00:00:00' ON COMPLETION NOT PRESERVE DISABLE DO update users set banstate = 0 where bandate <= CURRENT_TIMESTAMP AND banstate = 1$$

CREATE DEFINER=`season5`@`%` EVENT `ChatBanStateUpdate` ON SCHEDULE EVERY 5 MINUTE STARTS '2018-05-01 00:00:00' ENDS '2019-09-21 00:00:00' ON COMPLETION NOT PRESERVE DISABLE DO update users set chatBan = 0 where bandate <= CURRENT_TIMESTAMP AND chatBan = 1$$

DELIMITER ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
