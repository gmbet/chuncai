/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : chuncai

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2017-03-22 04:26:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `magic_config`
-- ----------------------------
DROP TABLE IF EXISTS `magic_config`;
CREATE TABLE `magic_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `praisefeild` varchar(20) NOT NULL COMMENT '奖项标示字段',
  `praisename` varchar(20) NOT NULL COMMENT '奖项名字',
  `min` text NOT NULL COMMENT '最小角度',
  `max` text NOT NULL COMMENT '最大角度',
  `praisecontent` text NOT NULL COMMENT '奖项内容',
  `praisenumber` int(3) NOT NULL COMMENT '奖项库存次数',
  `chance` int(10) unsigned NOT NULL COMMENT '本奖项的概率',
  PRIMARY KEY (`id`),
  KEY `praisefeild` (`praisefeild`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='奖项配置';

-- ----------------------------
-- Records of magic_config
-- ----------------------------
INSERT INTO `magic_config` VALUES ('1', 'first', '一等奖', '1', '29', 'iphone5s土豪金一部', '-1', '1');
INSERT INTO `magic_config` VALUES ('2', 'second', '二等奖', '302', '328', 'ipadmini', '-1', '2');
INSERT INTO `magic_config` VALUES ('3', 'Third', '三等奖', '242', '268', '现金500', '-1', '5');
INSERT INTO `magic_config` VALUES ('4', 'Fourth', '四等奖', '182', '208', '现金300', '-1', '7');
INSERT INTO `magic_config` VALUES ('5', 'Fifth', '五等奖', '122', '148', '现金200', '-1', '10');
INSERT INTO `magic_config` VALUES ('6', 'Sixth', '六等奖', '62', '88', '现金100', '-1', '25');
INSERT INTO `magic_config` VALUES ('7', 'Seventh', '七等奖', '32,92,152,212,272,332', '58,118,178,238,298,358', '小熊宝宝一个', '-1', '50');

-- ----------------------------
-- Table structure for `magic_user`
-- ----------------------------
DROP TABLE IF EXISTS `magic_user`;
CREATE TABLE `magic_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of magic_user
-- ----------------------------
INSERT INTO `magic_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for `magic_useraddnumber`
-- ----------------------------
DROP TABLE IF EXISTS `magic_useraddnumber`;
CREATE TABLE `magic_useraddnumber` (
  `aid` int(10) unsigned NOT NULL COMMENT '对应用户id',
  `number` tinyint(3) unsigned NOT NULL COMMENT '该用户剩余抽奖次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户剩余抽奖次数';

-- ----------------------------
-- Records of magic_useraddnumber
-- ----------------------------
INSERT INTO `magic_useraddnumber` VALUES ('1', '1');

-- ----------------------------
-- Table structure for `ssc_actiondata`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_actiondata`;
CREATE TABLE `ssc_actiondata` (
  `bid` int(11) NOT NULL,
  `actionData` longtext COLLATE latin1_german1_ci NOT NULL,
  `actionTime` int(11) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;

-- ----------------------------
-- Records of ssc_actiondata
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_activity`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_activity`;
CREATE TABLE `ssc_activity` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET gbk NOT NULL COMMENT '活动名称',
  `des` varchar(10240) CHARACTER SET gbk NOT NULL DEFAULT '' COMMENT '活动说明',
  `start` int(11) NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `stop` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间，0为永久活动',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_activity
-- ----------------------------
INSERT INTO `ssc_activity` VALUES ('5', '恭喜发财', '恭喜发财', '0', '0', '1', '0');
INSERT INTO `ssc_activity` VALUES ('6', '恭喜发财', '恭喜发财', '0', '0', '1', '0');

-- ----------------------------
-- Table structure for `ssc_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_admin_log`;
CREATE TABLE `ssc_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '操作类型',
  `actionTime` int(11) NOT NULL,
  `actionIP` int(11) NOT NULL,
  `action` varchar(80) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作描述',
  `extfield0` int(11) DEFAULT '0',
  `extfield1` varchar(80) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actionTime` (`actionTime`),
  KEY `uid` (`uid`,`type`,`actionTime`,`actionIP`,`extfield0`,`extfield1`)
) ENGINE=MyISAM AUTO_INCREMENT=1386 DEFAULT CHARSET=latin1 COMMENT='管理员操作日志';

-- ----------------------------
-- Records of ssc_admin_log
-- ----------------------------
INSERT INTO `ssc_admin_log` VALUES ('1315', '1', 'admin', '6', '1434425328', '976947076', '删除用户[abc123]', '281', 'abc123');
INSERT INTO `ssc_admin_log` VALUES ('1316', '1', 'admin', '10', '1434425530', '976947076', '修改系统设置', '0', '');
INSERT INTO `ssc_admin_log` VALUES ('1317', '1', 'admin', '10', '1434425786', '1781005949', '修改系统设置', '0', '');
INSERT INTO `ssc_admin_log` VALUES ('1318', '1', 'admin', '4', '1434425804', '1781005949', '增加用户[test01]', '311', 'test01');
INSERT INTO `ssc_admin_log` VALUES ('1319', '1', 'admin', '4', '1434425811', '1781005949', '增加用户[test02]', '312', 'test02');
INSERT INTO `ssc_admin_log` VALUES ('1320', '1', 'admin', '4', '1434425822', '1781005949', '增加用户[test03]', '313', 'test03');
INSERT INTO `ssc_admin_log` VALUES ('1321', '1', 'admin', '4', '1434425828', '1781005949', '增加用户[test04]', '314', 'test04');
INSERT INTO `ssc_admin_log` VALUES ('1322', '1', 'admin', '4', '1434425835', '1781005949', '增加用户[test05]', '315', 'test05');
INSERT INTO `ssc_admin_log` VALUES ('1323', '1', 'admin', '3', '1434425846', '1781005949', '管理员充值[ID:391]', '311', 'test01');
INSERT INTO `ssc_admin_log` VALUES ('1324', '1', 'admin', '3', '1434425854', '1781005949', '管理员充值[ID:392]', '312', 'test02');
INSERT INTO `ssc_admin_log` VALUES ('1325', '1', 'admin', '3', '1434425862', '1781005949', '管理员充值[ID:393]', '313', 'test03');
INSERT INTO `ssc_admin_log` VALUES ('1326', '1', 'admin', '3', '1434425869', '1781005949', '管理员充值[ID:394]', '314', 'test04');
INSERT INTO `ssc_admin_log` VALUES ('1327', '1', 'admin', '3', '1434425876', '1781005949', '管理员充值[ID:395]', '315', 'test05');
INSERT INTO `ssc_admin_log` VALUES ('1328', '1', 'admin', '10', '1434427213', '2100179680', '修改系统设置', '0', '');
INSERT INTO `ssc_admin_log` VALUES ('1329', '1', 'admin', '2', '1434428590', '2100179680', '充值确认[充值编号:273753]', '312', 'test02');
INSERT INTO `ssc_admin_log` VALUES ('1330', '1', 'admin', '5', '1434428931', '2100179680', '修改用户[]', '311', null);
INSERT INTO `ssc_admin_log` VALUES ('1331', '1', 'admin', '5', '1434428938', '2100179680', '修改用户[]', '312', null);
INSERT INTO `ssc_admin_log` VALUES ('1332', '1', 'admin', '5', '1434428945', '2100179680', '修改用户[]', '313', null);
INSERT INTO `ssc_admin_log` VALUES ('1333', '1', 'admin', '5', '1434428950', '2100179680', '修改用户[]', '314', null);
INSERT INTO `ssc_admin_log` VALUES ('1334', '1', 'admin', '5', '1434428955', '2100179680', '修改用户[]', '315', null);
INSERT INTO `ssc_admin_log` VALUES ('1335', '1', 'admin', '12', '1434429111', '2100179680', '彩种设置[六合彩]', '30', '六合彩');
INSERT INTO `ssc_admin_log` VALUES ('1336', '1', 'admin', '12', '1434429163', '2100179680', '彩种设置[六合彩]', '30', '六合彩');
INSERT INTO `ssc_admin_log` VALUES ('1337', '1', 'admin', '16', '1434429673', '2100179680', '兑换商品操作[开关ID:11]', '11', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1338', '1', 'admin', '16', '1434429848', '2100179680', '兑换商品操作[删除ID:11]', '11', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1339', '1', 'admin', '16', '1434429852', '2100179680', '兑换商品操作[删除ID:10]', '10', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1340', '1', 'admin', '16', '1434429854', '2100179680', '兑换商品操作[删除ID:9]', '9', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1341', '1', 'admin', '16', '1434429934', '2100179680', '兑换商品操作[修改ID:7]', '7', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1342', '1', 'admin', '16', '1434430371', '2100179680', '兑换商品操作[修改ID:6]', '6', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1343', '1', 'admin', '16', '1434430530', '2100179680', '兑换商品操作[修改ID:7]', '7', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1344', '1', 'admin', '16', '1434430544', '2100179680', '兑换商品操作[修改ID:8]', '8', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1345', '1', 'admin', '16', '1434430666', '2100179680', '兑换商品操作[修改ID:]', null, '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1346', '1', 'admin', '16', '1434430687', '2100179680', '兑换商品操作[修改ID:42]', '42', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1347', '1', 'admin', '16', '1434430719', '2100179680', '兑换商品操作[修改ID:6]', '6', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1348', '1', 'admin', '16', '1434430727', '2100179680', '兑换商品操作[修改ID:7]', '7', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1349', '1', 'admin', '16', '1434430735', '2100179680', '兑换商品操作[修改ID:8]', '8', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1350', '1', 'admin', '16', '1434430742', '2100179680', '兑换商品操作[修改ID:42]', '42', '积分兑换');
INSERT INTO `ssc_admin_log` VALUES ('1351', '1', 'admin', '11', '1434431108', '2100179680', '修改订单[删除ID:1]', '1', '');
INSERT INTO `ssc_admin_log` VALUES ('1352', '1', 'admin', '11', '1434431656', '2100179680', '修改订单[开关操作ID:56]', '56', '');
INSERT INTO `ssc_admin_log` VALUES ('1353', '1', 'admin', '11', '1434431795', '2100179680', '修改订单[开关操作ID:3]', '3', '');
INSERT INTO `ssc_admin_log` VALUES ('1354', '1', 'admin', '11', '1434431836', '2100179680', '修改订单[开关操作ID:2]', '2', '');
INSERT INTO `ssc_admin_log` VALUES ('1355', '1', 'admin', '11', '1434431981', '2100179680', '银行设置[删除ID:287]', '0', '');
INSERT INTO `ssc_admin_log` VALUES ('1356', '1', 'admin', '11', '1434432157', '2100179680', '银行设置[删除ID:292]', '0', '');
INSERT INTO `ssc_admin_log` VALUES ('1357', '1', 'admin', '11', '1434432164', '2100179680', '修改订单[开关操作ID:5]', '5', '');
INSERT INTO `ssc_admin_log` VALUES ('1358', '1', 'admin', '13', '1434432463', '2100179680', '玩法设置[修改:]', '10267', '');
INSERT INTO `ssc_admin_log` VALUES ('1359', '1', 'admin', '13', '1434432689', '2100179680', '玩法设置[修改:]', '10267', '');
INSERT INTO `ssc_admin_log` VALUES ('1360', '1', 'admin', '10', '1434433018', '2100179680', '修改系统设置', '0', '');
INSERT INTO `ssc_admin_log` VALUES ('1361', '1', 'admin', '4', '1438434726', '2130706433', '增加用户[ceshi]', '316', 'ceshi');
INSERT INTO `ssc_admin_log` VALUES ('1362', '1', 'admin', '3', '1438434777', '2130706433', '管理员充值[ID:402]', '316', 'ceshi');
INSERT INTO `ssc_admin_log` VALUES ('1363', '1', 'admin', '5', '1445226623', '2130706437', '修改用户[]', '316', null);
INSERT INTO `ssc_admin_log` VALUES ('1364', '1', 'admin', '4', '1445226672', '2130706437', '增加用户[test2015]', '317', 'test2015');
INSERT INTO `ssc_admin_log` VALUES ('1365', '1', 'admin', '10', '1445227065', '2130706437', '修改系统设置', '0', '');
INSERT INTO `ssc_admin_log` VALUES ('1366', '1', 'admin', '10', '1445227138', '2130706437', '修改系统设置', '0', '');
INSERT INTO `ssc_admin_log` VALUES ('1367', '1', 'admin', '4', '1490121198', '2130706433', '增加用户[test2017]', '318', 'test2017');
INSERT INTO `ssc_admin_log` VALUES ('1368', '1', 'admin', '12', '1490121344', '2130706433', '彩种设置[分分彩]', '5', '分分彩');
INSERT INTO `ssc_admin_log` VALUES ('1369', '1', 'admin', '12', '1490121380', '2130706433', '彩种设置[分分彩]', '5', '分分彩');
INSERT INTO `ssc_admin_log` VALUES ('1370', '1', 'admin', '12', '1490121433', '2130706433', '彩种设置[江西彩]', '3', '江西彩');
INSERT INTO `ssc_admin_log` VALUES ('1371', '1', 'admin', '12', '1490121443', '2130706433', '彩种设置[新疆彩]', '12', '新疆彩');
INSERT INTO `ssc_admin_log` VALUES ('1372', '1', 'admin', '12', '1490121446', '2130706433', '彩种设置[广东11选5]', '6', '广东11选5');
INSERT INTO `ssc_admin_log` VALUES ('1373', '1', 'admin', '12', '1490121450', '2130706433', '彩种设置[江西11选5]', '16', '江西11选5');
INSERT INTO `ssc_admin_log` VALUES ('1374', '1', 'admin', '12', '1490121453', '2130706433', '彩种设置[山东11选5]', '7', '山东11选5');
INSERT INTO `ssc_admin_log` VALUES ('1375', '1', 'admin', '12', '1490121457', '2130706433', '彩种设置[江西11选5]', '16', '江西11选5');
INSERT INTO `ssc_admin_log` VALUES ('1376', '1', 'admin', '12', '1490121461', '2130706433', '彩种设置[福彩3D]', '9', '福彩3D');
INSERT INTO `ssc_admin_log` VALUES ('1377', '1', 'admin', '12', '1490121463', '2130706433', '彩种设置[排列三]', '10', '排列三');
INSERT INTO `ssc_admin_log` VALUES ('1378', '1', 'admin', '12', '1490121474', '2130706433', '彩种设置[排列三]', '10', '排列三');
INSERT INTO `ssc_admin_log` VALUES ('1379', '1', 'admin', '12', '1490121476', '2130706433', '彩种设置[北京PK拾]', '20', '北京PK拾');
INSERT INTO `ssc_admin_log` VALUES ('1380', '1', 'admin', '12', '1490121480', '2130706433', '彩种设置[重庆快乐十分]', '18', '重庆快乐十分');
INSERT INTO `ssc_admin_log` VALUES ('1381', '1', 'admin', '12', '1490121484', '2130706433', '彩种设置[江苏快3]', '25', '江苏快3');
INSERT INTO `ssc_admin_log` VALUES ('1382', '1', 'admin', '12', '1490121486', '2130706433', '彩种设置[五分彩]', '14', '五分彩');
INSERT INTO `ssc_admin_log` VALUES ('1383', '1', 'admin', '12', '1490121489', '2130706433', '彩种设置[两分彩]', '26', '两分彩');
INSERT INTO `ssc_admin_log` VALUES ('1384', '1', 'admin', '12', '1490121492', '2130706433', '彩种设置[分分彩]', '5', '分分彩');
INSERT INTO `ssc_admin_log` VALUES ('1385', '1', 'admin', '2', '1490121728', '2130706433', '充值确认[充值编号:670021]', '318', 'test2017');

-- ----------------------------
-- Table structure for `ssc_bank_list`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_bank_list`;
CREATE TABLE `ssc_bank_list` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 NOT NULL,
  `logo` varchar(255) NOT NULL,
  `home` varchar(255) NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `isDelete` tinyint(1) NOT NULL DEFAULT '1',
  `tk` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许绑定为提款银行',
  `sk` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许绑定为提款银行',
  `zs` tinyint(1) NOT NULL DEFAULT '0' COMMENT '绑定该行是否赠送',
  `gift` float(10,2) NOT NULL,
  `rechargeDemo` varchar(255) NOT NULL DEFAULT '' COMMENT '值充演示图片路径',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `name` (`name`,`logo`,`home`,`sort`,`isDelete`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COMMENT='银行信息';

-- ----------------------------
-- Records of ssc_bank_list
-- ----------------------------
INSERT INTO `ssc_bank_list` VALUES ('2', '支付宝', 'template/images/bank/bank-zfb.jpg', 'https://auth.alipay.com', '0', '0', '0', '1', '0', '0.00', 'sd');
INSERT INTO `ssc_bank_list` VALUES ('3', '财付通', 'template/images/bank/bank-cft.jpg', 'http://www.tenpay.com/', '0', '0', '0', '1', '0', '0.00', 'asd');
INSERT INTO `ssc_bank_list` VALUES ('4', '中国农业银行', 'template/images/bank/bank-nh.jpg', 'http://www.abchina.com', '0', '0', '0', '1', '0', '0.00', 'sad');
INSERT INTO `ssc_bank_list` VALUES ('5', '中国交通银行', 'template/images/bank/bank-jtyh.jpg', 'http://www.bankcomm.com', '0', '1', '0', '1', '0', '0.00', 'asd');
INSERT INTO `ssc_bank_list` VALUES ('6', '中国建设银行', 'template/images/bank/bank-jh.jpg', 'http://www.ccb.com', '0', '0', '0', '1', '0', '0.00', 'sd');
INSERT INTO `ssc_bank_list` VALUES ('7', '招商银行', 'template/images/bank/bank-zh.jpg', 'http://www.cmbchina.com/', '0', '0', '0', '1', '0', '0.00', 'asd');
INSERT INTO `ssc_bank_list` VALUES ('8', '中国银行', 'template/images/bank/bank-zgyh.jpg', 'http://www.boc.cn/', '0', '1', '0', '1', '0', '0.00', 's');
INSERT INTO `ssc_bank_list` VALUES ('9', '中信银行', 'template/images/bank/bank-zxyh.jpg', 'http://bank.ecitic.com/', '0', '1', '0', '1', '0', '0.00', 'asd');
INSERT INTO `ssc_bank_list` VALUES ('10', '浦发银行', 'template/images/bank/bank-pdfzyh.jpg', 'http://www.bankcomm.com', '0', '1', '0', '1', '0', '0.00', 'asdasd');
INSERT INTO `ssc_bank_list` VALUES ('11', '广东发展银行', 'template/images/bank/bank-gdfzyh.jpg', 'http://www.cgbchina.com.cn', '0', '1', '0', '1', '0', '0.00', 'sd');
INSERT INTO `ssc_bank_list` VALUES ('12', '在线支付', 'template/images/bank/logo_unionpay.gif', '1312', '0', '1', '0', '1', '1', '213.00', 'dsa');
INSERT INTO `ssc_bank_list` VALUES ('15', '民生银行', 'template/images/bank/bank-zgmsyh.jpg', 'http://www.cmbc.com.cn', '0', '1', '0', '1', '0', '0.00', 'sd');
INSERT INTO `ssc_bank_list` VALUES ('16', '易宝支付', 'template/images/bank/logo_unionpay.gif', 'http://www.yeepay.com', '0', '1', '0', '1', '1', '13.00', 'd');
INSERT INTO `ssc_bank_list` VALUES ('17', '环迅支付', 'template/images/bank/logo_unionpay.gif', 'http://www.ips.com.cn', '0', '1', '0', '1', '1', '13.00', 'a');
INSERT INTO `ssc_bank_list` VALUES ('13', '华夏银行', 'template/images/bank/bank-hxyh.jpg', 'http://www.hxb.com.cn/', '0', '1', '0', '1', '0', '0.00', 'asd');
INSERT INTO `ssc_bank_list` VALUES ('14', '平安银行', 'template/images/bank/bank-payh.jpg', 'http://www.bank.pingan.com', '0', '1', '0', '1', '0', '0.00', 'asd');
INSERT INTO `ssc_bank_list` VALUES ('18', '花旗支付', 'template/images/bank/logo_unionpay.gif', 'http://www.010sms.com/', '0', '1', '1', '0', '1', '13.00', 'sda');
INSERT INTO `ssc_bank_list` VALUES ('56', '中国工商银行', 'template/images/bank/bank-gh.jpg', 'http://www.icbc.com.cn/icbc/', '0', '0', '0', '1', '0', '0.00', '');

-- ----------------------------
-- Table structure for `ssc_bets`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_bets`;
CREATE TABLE `ssc_bets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wjorderId` char(11) NOT NULL COMMENT '随机订单号',
  `orderId` bigint(11) NOT NULL COMMENT '定单号，由前台生成',
  `serializeId` char(13) NOT NULL COMMENT '投注号，由后台生成',
  `uid` int(11) NOT NULL COMMENT '投注用户ID',
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '投注人帐号',
  `nickname` varchar(10) CHARACTER SET utf8 NOT NULL,
  `type` tinyint(4) NOT NULL COMMENT '投注种类，对应ssc_type.id',
  `playedGroup` smallint(6) NOT NULL COMMENT '玩法组ID',
  `playedId` int(11) NOT NULL COMMENT '玩法ID',
  `actionNo` varchar(16) NOT NULL COMMENT '投注期号',
  `actionTime` bigint(14) NOT NULL COMMENT '投注时间',
  `actionIP` int(11) NOT NULL COMMENT '投注IP',
  `actionNum` int(10) unsigned NOT NULL COMMENT '投注注数',
  `actionData` longtext CHARACTER SET utf8 NOT NULL COMMENT '投注号码',
  `weiShu` tinyint(4) NOT NULL DEFAULT '0' COMMENT '附加位数，一般用在任选位数上，个数用1,十位用2，百位用4...多位存储时可以用其和表示。,0一般是不保存位数用',
  `fanDian` float(6,4) NOT NULL COMMENT '返点',
  `fanDianAmount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '支付的所有返点',
  `mode` decimal(5,3) NOT NULL COMMENT '模式，可以是2，0.20，0.02，0.002分别代表元角分厘基数',
  `beiShu` int(11) NOT NULL COMMENT '倍数',
  `amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '金额',
  `bdwEnable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别不定位投注',
  `hmEnable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '合买',
  `fpEnable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '飞盘，用于快8',
  `zhuiHao` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '追号剩下期数，为0时结束追号',
  `zhuiHaoMode` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否中奖停止追号',
  `bonusProp` decimal(10,4) NOT NULL COMMENT '奖金比例，中奖以这个为据',
  `lotteryNo` varchar(32) NOT NULL DEFAULT '' COMMENT '开奖号码，没开奖的留空串',
  `kjTime` int(11) NOT NULL DEFAULT '0' COMMENT '官方开奖时间',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经取消购买，一般在开奖之前都可以取消购买',
  `zjCount` smallint(6) NOT NULL DEFAULT '0' COMMENT '中奖注数',
  `bonus` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '中奖金额',
  `betType` tinyint(1) NOT NULL DEFAULT '0',
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '识别盈亏',
  `profit` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '盈利（正数为盈利，负数为亏损）',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `actionTime` (`actionTime`),
  KEY `kjTime` (`kjTime`),
  KEY `wjorderId` (`wjorderId`),
  KEY `nickname` (`nickname`),
  KEY `lotteryNo` (`lotteryNo`)
) ENGINE=MyISAM AUTO_INCREMENT=64594 DEFAULT CHARSET=latin1 COMMENT='投注表';

-- ----------------------------
-- Records of ssc_bets
-- ----------------------------
INSERT INTO `ssc_bets` VALUES ('64577', '550371LR', '96544956363', '557f9f57aa131', '311', 'test01', 'test01', '5', '507', '5037', '20150616-0722', '1434427223', '2100179680', '8', '-,-,-,-,23456789', '0', '0.0000', '0.0000', '2.000', '1', '16.0000', '0', '0', '0', '0', '1', '19.6000', '9,6,4,5,1', '1434427260', '0', '0', '0.0000', '0', '1', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64576', '55037CFZ', '96544861498', '557f9ef8cc682', '311', 'test01', 'test01', '5', '507', '5037', '20150616-0720', '1434427128', '2100179680', '10', '-,-,-,-,0123456789', '0', '0.0000', '0.0000', '2.000', '1', '20.0000', '0', '0', '0', '0', '1', '19.6000', '', '1434427140', '0', '0', '0.0000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64578', '55037DRO', '96545012983', '557f9f90aa131', '311', 'test01', 'test01', '5', '507', '5037', '20150616-0723', '1434427280', '2100179680', '9', '-,-,-,-,123456789', '0', '0.0000', '0.0000', '2.000', '1', '18.0000', '0', '0', '0', '0', '1', '19.6000', '0,3,3,7,0', '1434427320', '0', '0', '0.0000', '0', '1', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64579', '55037ZG0', '96545081762', '557f9fd53f435', '311', 'test01', 'test01', '5', '507', '5037', '20150616-0724', '1434427349', '2100179680', '10', '-,-,-,-,0123456789', '0', '0.0000', '0.0000', '2.000', '1', '20.0000', '0', '0', '0', '0', '1', '19.6000', '5,6,8,7,6', '1434427380', '0', '1', '19.6000', '0', '1', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64580', '5503785G', '96545220589', '557fa05fbd25e', '311', 'test01', 'test01', '5', '507', '5037', '20150616-0726', '1434427487', '2100179680', '9', '-,-,-,-,012345679', '0', '0.0000', '0.0000', '2.000', '1', '18.0000', '0', '0', '0', '0', '1', '19.6000', '3,9,7,3,8', '1434427500', '0', '0', '0.0000', '0', '1', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64581', '55037K3Y', '96546335650', '557fa4bb023a5', '311', 'test01', 'test01', '5', '507', '5037', '20150616-0745', '1434428602', '2100179680', '9', '-,-,-,-,012345678', '0', '0.0000', '0.0000', '2.000', '1', '18.0000', '0', '0', '0', '0', '1', '19.6000', '4,5,1,2,9', '1434428640', '0', '0', '0.0000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64582', '2020093K', '96546346969', '557fa4c63f435', '311', 'test01', 'test01', '20', '20026', '20093', '495320', '1434428614', '2100179680', '10', '01 02 03 04 05 06 07 08 09 10', '0', '0.0000', '0.0000', '2.000', '1', '20.0000', '0', '0', '0', '0', '1', '19.6000', '03,05,04,09,08,01,10,02,07,06', '1434428820', '0', '1', '19.6000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64583', '11039LVG', '96546358219', '557fa4d11cee4', '311', 'test01', 'test01', '1', '108', '1039', '20150616-039', '1434428624', '2100179680', '10', '0123456789', '0', '0.0000', '0.0000', '2.000', '1', '20.0000', '0', '0', '0', '0', '1', '6.6000', '2,2,4,0,7', '1434429000', '0', '2', '13.2000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64584', '77053M5R', '96546367365', '557fa4dad4094', '311', 'test01', 'test01', '7', '7010', '7053', '20150616-021', '1434428634', '2100179680', '110', '01 02 03 04 05 06 07 08 09 10 11,01 02 03 04 05 06 07 08 09 10 11', '0', '0.0000', '0.0000', '2.000', '1', '220.0000', '0', '0', '0', '0', '1', '212.1000', '03,01,11,02,09', '1434428700', '0', '1', '212.1000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64585', '25250118', '96546379311', '557fa4e61cee4', '311', 'test01', 'test01', '25', '25039', '250118', '061624', '1434428646', '2100179680', '2', '3 4', '0', '0.0000', '0.0000', '2.000', '1', '4.0000', '0', '0', '0', '0', '1', '28.0000', '3,3,4', '1434429000', '0', '0', '0.0000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64586', '18180769', '96546392623', '557fa4f3e34b8', '311', 'test01', 'test01', '18', '18019', '18076', '20150616-029', '1434428659', '2100179680', '190', '01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20', '0', '0.0000', '0.0000', '2.000', '1', '380.0000', '0', '0', '0', '0', '1', '16.0000', '08,03,06,20,02,01,05,10', '1434429120', '0', '28', '448.0000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64587', '5502553O', '96547178998', '557fa8012c308', '312', 'test02', 'test02', '5', '5011', '50255', '20150616-0759', '1434429441', '-1265827105', '2', '2 3', '0', '0.0000', '0.0000', '2.000', '1', '4.0000', '0', '0', '0', '0', '1', '23.7100', '6,0,8,3,6', '1434429480', '0', '0', '0.0000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64588', '550255H8', '96547188822', '557fa809c8979', '312', 'test02', 'test02', '5', '5011', '50255', '20150616-0759', '1434429449', '-1265827105', '2', '0 1', '0', '0.0000', '0.0000', '2.000', '1', '4.0000', '0', '0', '0', '0', '1', '23.7100', '6,0,8,3,6', '1434429480', '0', '0', '0.0000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64589', '5502551A', '96547197598', '557fa8134e859', '312', 'test02', 'test02', '5', '5011', '50255', '20150616-0759', '1434429459', '-1265827105', '2', '8 9', '0', '0.0000', '0.0000', '2.000', '2', '8.0000', '0', '0', '0', '0', '1', '23.7100', '6,0,8,3,6', '1434429480', '0', '0', '0.0000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64590', '1102678Q', '96550402284', '557fb49e33d1a', '311', 'test01', 'test01', '1', '103', '10267', '20150616-046', '1434432670', '2100179680', '9', '0 1 2 3 4 5 6 7 8', '0', '0.0000', '0.0000', '2.000', '3', '54.0000', '0', '0', '0', '0', '1', '19.6000', '', '1434433200', '0', '0', '0.0000', '0', '0', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64591', '55037SHC', '96550476284', '557fb4ebeaeca', '311', 'test01', 'test01', '5', '507', '5037', '20150616-0814', '1434432747', '2100179680', '9', '-,-,-,-,012345678', '0', '0.0000', '0.0000', '2.000', '1', '18.0000', '0', '0', '0', '0', '1', '19.6000', '8,3,9,9,9', '1434432780', '0', '0', '0.0000', '0', '1', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64592', '550287A5', '96550541935', '557fb5292c308', '311', 'test01', 'test01', '5', '503', '50287', '20150616-0815', '1434432809', '2100179680', '900', '0123456789,0123456789,012345678', '0', '0.0000', '0.0000', '0.002', '1', '1.8000', '0', '0', '0', '0', '1', '1960.0000', '2,3,0,8,6', '1434432840', '0', '1', '1.9600', '0', '1', '0.0000');
INSERT INTO `ssc_bets` VALUES ('64593', '1103706X', '100552716817', '55bcc6de25545', '316', 'ceshi', 'ceshi', '1', '101', '1037', '20150801-092', '1438435034', '2130706433', '10', '-,-,-,-,0123456789', '0', '0.0000', '0.0000', '2.000', '1', '20.0000', '0', '0', '0', '0', '1', '19.5000', '', '1438435200', '0', '0', '0.0000', '0', '0', '0.0000');

-- ----------------------------
-- Table structure for `ssc_coin_log`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_coin_log`;
CREATE TABLE `ssc_coin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '彩种类，对应ssc_type.id，如果与彩票无关，这采用默认值(比如充值)',
  `playedId` int(11) NOT NULL DEFAULT '0',
  `coin` decimal(12,4) NOT NULL COMMENT '流动资金',
  `userCoin` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '余额',
  `fcoin` decimal(12,4) NOT NULL COMMENT '流动冻结资金，消费的用负值，充值的用正',
  `liqType` tinyint(3) unsigned NOT NULL COMMENT '1充值，2返点，3提现失败从冻结资金返回，4撤单资金，5中奖派奖... ，101提现，102投注，103提现资金冻结，104开奖扣除冻结资金...',
  `actionUID` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  `actionTime` int(11) NOT NULL DEFAULT '0',
  `actionIP` int(11) NOT NULL DEFAULT '0' COMMENT '由系统生成或管理员操作的采用默认值',
  `info` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注信息',
  `extfield0` int(11) NOT NULL DEFAULT '0',
  `extfield1` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '扩展字段1',
  `extfield2` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '扩展字段2',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `type` (`type`),
  KEY `playedId` (`playedId`) USING BTREE,
  KEY `coin` (`coin`) USING BTREE,
  KEY `fcoin` (`fcoin`) USING BTREE,
  KEY `info` (`info`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=25716812 DEFAULT CHARSET=latin1 COMMENT='用户资金流动日志表';

-- ----------------------------
-- Records of ssc_coin_log
-- ----------------------------
INSERT INTO `ssc_coin_log` VALUES ('25716779', '312', '0', '0', '1000000.0000', '1000000.0000', '0.0000', '1', '0', '1434425854', '0', '充值', '392', '808619', '');
INSERT INTO `ssc_coin_log` VALUES ('25716778', '311', '0', '0', '1000000.0000', '1000000.0000', '0.0000', '1', '0', '1434425846', '0', '充值', '391', '127854', '');
INSERT INTO `ssc_coin_log` VALUES ('25716780', '313', '0', '0', '1000000.0000', '1000000.0000', '0.0000', '1', '0', '1434425862', '0', '充值', '393', '267737', '');
INSERT INTO `ssc_coin_log` VALUES ('25716781', '314', '0', '0', '1000000.0000', '1000000.0000', '0.0000', '1', '0', '1434425869', '0', '充值', '394', '639105', '');
INSERT INTO `ssc_coin_log` VALUES ('25716782', '315', '0', '0', '1000000.0000', '1000000.0000', '0.0000', '1', '0', '1434425876', '0', '充值', '395', '633931', '');
INSERT INTO `ssc_coin_log` VALUES ('25716783', '311', '5', '0', '-20.0000', '999980.0000', '0.0000', '101', '0', '1434427128', '0', '投注', '64576', '557f9ef8cc682', '');
INSERT INTO `ssc_coin_log` VALUES ('25716784', '311', '5', '0', '-16.0000', '999964.0000', '0.0000', '101', '0', '1434427223', '0', '投注', '64577', '557f9f57aa131', '');
INSERT INTO `ssc_coin_log` VALUES ('25716785', '311', '5', '0', '-18.0000', '999946.0000', '0.0000', '101', '0', '1434427280', '0', '投注', '64578', '557f9f90aa131', '');
INSERT INTO `ssc_coin_log` VALUES ('25716786', '311', '5', '0', '-20.0000', '999926.0000', '0.0000', '101', '0', '1434427349', '0', '投注', '64579', '557f9fd53f435', '');
INSERT INTO `ssc_coin_log` VALUES ('25716787', '311', '5', '0', '19.6000', '999945.6250', '0.0000', '6', '0', '1434427376', '0', '中奖奖金', '64579', '', '');
INSERT INTO `ssc_coin_log` VALUES ('25716788', '311', '5', '0', '-18.0000', '999927.6250', '0.0000', '101', '0', '1434427487', '0', '投注', '64580', '557fa05fbd25e', '');
INSERT INTO `ssc_coin_log` VALUES ('25716789', '312', '0', '0', '888.0000', '1000888.0000', '0.0000', '1', '0', '1434428590', '0', '充值', '396', '273753', '');
INSERT INTO `ssc_coin_log` VALUES ('25716790', '311', '5', '0', '-18.0000', '999909.6250', '0.0000', '101', '0', '1434428603', '0', '投注', '64581', '557fa4bb023a5', '');
INSERT INTO `ssc_coin_log` VALUES ('25716791', '311', '20', '0', '-20.0000', '999889.6250', '0.0000', '101', '0', '1434428614', '0', '投注', '64582', '557fa4c63f435', '');
INSERT INTO `ssc_coin_log` VALUES ('25716792', '311', '1', '0', '-20.0000', '999869.6250', '0.0000', '101', '0', '1434428625', '0', '投注', '64583', '557fa4d11cee4', '');
INSERT INTO `ssc_coin_log` VALUES ('25716793', '311', '7', '0', '-220.0000', '999649.6250', '0.0000', '101', '0', '1434428634', '0', '投注', '64584', '557fa4dad4094', '');
INSERT INTO `ssc_coin_log` VALUES ('25716794', '311', '25', '0', '-4.0000', '999645.6250', '0.0000', '101', '0', '1434428646', '0', '投注', '64585', '557fa4e61cee4', '');
INSERT INTO `ssc_coin_log` VALUES ('25716795', '311', '18', '0', '-380.0000', '999265.6250', '0.0000', '101', '0', '1434428659', '0', '投注', '64586', '557fa4f3e34b8', '');
INSERT INTO `ssc_coin_log` VALUES ('25716796', '311', '7', '0', '212.1000', '999477.6875', '0.0000', '6', '0', '1434428776', '0', '中奖奖金', '64584', '', '');
INSERT INTO `ssc_coin_log` VALUES ('25716797', '311', '20', '0', '19.6000', '999497.3125', '0.0000', '6', '0', '1434428821', '0', '中奖奖金', '64582', '', '');
INSERT INTO `ssc_coin_log` VALUES ('25716798', '311', '1', '0', '13.2000', '999510.5000', '0.0000', '6', '0', '1434429011', '0', '中奖奖金', '64583', '', '');
INSERT INTO `ssc_coin_log` VALUES ('25716799', '311', '18', '0', '448.0000', '999958.5000', '0.0000', '6', '0', '1434429209', '0', '中奖奖金', '64586', '', '');
INSERT INTO `ssc_coin_log` VALUES ('25716800', '312', '5', '0', '-4.0000', '1000884.0000', '0.0000', '101', '0', '1434429441', '0', '投注', '64587', '557fa8012c308', '');
INSERT INTO `ssc_coin_log` VALUES ('25716801', '312', '5', '0', '-4.0000', '1000880.0000', '0.0000', '101', '0', '1434429449', '0', '投注', '64588', '557fa809c8979', '');
INSERT INTO `ssc_coin_log` VALUES ('25716802', '312', '5', '0', '-8.0000', '1000872.0000', '0.0000', '101', '0', '1434429459', '0', '投注', '64589', '557fa8134e859', '');
INSERT INTO `ssc_coin_log` VALUES ('25716803', '311', '0', '0', '13.0000', '999971.5000', '0.0000', '189', '0', '1434430793', '0', '绑定银行卡赠送', '367', '', '');
INSERT INTO `ssc_coin_log` VALUES ('25716804', '311', '1', '0', '-54.0000', '999917.5000', '0.0000', '101', '0', '1434432670', '0', '投注', '64590', '557fb49e33d1a', '');
INSERT INTO `ssc_coin_log` VALUES ('25716805', '311', '0', '0', '1.0000', '999918.5000', '0.0000', '50', '0', '1434432726', '0', '签到赠送', '0', '', '');
INSERT INTO `ssc_coin_log` VALUES ('25716806', '311', '5', '0', '-18.0000', '999900.5000', '0.0000', '101', '0', '1434432747', '0', '投注', '64591', '557fb4ebeaeca', '');
INSERT INTO `ssc_coin_log` VALUES ('25716807', '311', '5', '0', '-1.8000', '999898.6875', '0.0000', '101', '0', '1434432809', '0', '投注', '64592', '557fb5292c308', '');
INSERT INTO `ssc_coin_log` VALUES ('25716808', '311', '5', '0', '1.9600', '999900.6875', '0.0000', '6', '0', '1434432843', '0', '中奖奖金', '64592', '', '');
INSERT INTO `ssc_coin_log` VALUES ('25716809', '316', '0', '0', '1000000.0000', '1000000.0000', '0.0000', '1', '0', '1438434778', '0', '充值', '402', '458596', '');
INSERT INTO `ssc_coin_log` VALUES ('25716810', '316', '1', '0', '-20.0000', '999980.0000', '0.0000', '101', '0', '1438435038', '0', '投注', '64593', '55bcc6de25545', '');
INSERT INTO `ssc_coin_log` VALUES ('25716811', '318', '0', '0', '100.0000', '100.0000', '0.0000', '1', '0', '1490121728', '0', '充值', '403', '670021', '');

-- ----------------------------
-- Table structure for `ssc_content`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_content`;
CREATE TABLE `ssc_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nodeId` int(11) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `addTime` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `content` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `nodeId` (`nodeId`,`enable`),
  FULLTEXT KEY `title` (`title`,`content`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_content
-- ----------------------------
INSERT INTO `ssc_content` VALUES ('43', '1', '1', '1402934400', '常见问题', '常见问题');
INSERT INTO `ssc_content` VALUES ('32', '1', '1', '1405526400', '玩法介绍', '玩法介绍');
INSERT INTO `ssc_content` VALUES ('52', '1', '1', '1402156800', '充值需知', '财付通<备注>支付宝<付款说明>*必须添加用户编号,否则无法自动到帐！充值3分钟内到账，如未及时入账，请联系客服为您补单。');

-- ----------------------------
-- Table structure for `ssc_count`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_count`;
CREATE TABLE `ssc_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL COMMENT '彩种ID',
  `playedId` smallint(6) NOT NULL COMMENT '玩法ID',
  `date` date NOT NULL COMMENT '统计日期,一天一次',
  `betCount` int(11) NOT NULL COMMENT '投注数',
  `betAmount` float(10,2) NOT NULL COMMENT '投注金额',
  `zjAmount` float(10,2) NOT NULL COMMENT '中奖金额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`playedId`,`date`),
  KEY `betCount` (`betCount`) USING BTREE,
  KEY `betAmount` (`betAmount`) USING BTREE,
  KEY `zjAmount` (`zjAmount`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=587 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_count
-- ----------------------------
INSERT INTO `ssc_count` VALUES ('578', '1', '1037', '2015-08-01', '10', '20.00', '0.00');
INSERT INTO `ssc_count` VALUES ('579', '1', '1039', '2015-06-16', '10', '20.00', '13.20');
INSERT INTO `ssc_count` VALUES ('580', '1', '10267', '2015-06-16', '9', '54.00', '0.00');
INSERT INTO `ssc_count` VALUES ('581', '5', '5037', '2015-06-16', '64', '128.00', '19.60');
INSERT INTO `ssc_count` VALUES ('582', '5', '32767', '2015-06-16', '900', '1.80', '1.96');
INSERT INTO `ssc_count` VALUES ('583', '7', '7053', '2015-06-16', '110', '220.00', '212.10');
INSERT INTO `ssc_count` VALUES ('584', '18', '18076', '2015-06-16', '190', '380.00', '448.00');
INSERT INTO `ssc_count` VALUES ('585', '20', '20093', '2015-06-16', '10', '20.00', '19.60');
INSERT INTO `ssc_count` VALUES ('586', '25', '32767', '2015-06-16', '2', '4.00', '0.00');

-- ----------------------------
-- Table structure for `ssc_data`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_data`;
CREATE TABLE `ssc_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL COMMENT '时时彩种类，对应ssc_type.id',
  `time` int(11) NOT NULL COMMENT '开奖时间',
  `number` varchar(32) NOT NULL COMMENT '期号(场次)',
  `index` int(11) DEFAULT '0' COMMENT '当天的序号',
  `data` varchar(80) NOT NULL COMMENT '开奖号码，半角逗号分开',
  `billCount` int(5) NOT NULL DEFAULT '0' COMMENT '订单数',
  `pjed` int(5) NOT NULL DEFAULT '0' COMMENT '已派奖',
  `zjCount` int(5) NOT NULL DEFAULT '0' COMMENT '中奖注数',
  `userCount` int(5) NOT NULL DEFAULT '0' COMMENT '参与人数',
  `betAmount` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '投注金额',
  `zjAmount` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '中奖金额',
  `fanDianAmount` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '返点金额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type` (`type`,`number`),
  KEY `time` (`time`) USING BTREE,
  KEY `data` (`data`)
) ENGINE=MyISAM AUTO_INCREMENT=90448 DEFAULT CHARSET=latin1 COMMENT='开奖数据';

-- ----------------------------
-- Records of ssc_data
-- ----------------------------
INSERT INTO `ssc_data` VALUES ('90407', '9', '1438432200', '2015206', '0', '0,9,0', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90408', '10', '1438432200', '2015206', '0', '8,8,1', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90409', '18', '1438434170', '20150801-080', '0', '05,03,17,08,04,01,13,14', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90410', '12', '1438434600', '20150801-67', '0', '8,2,6,5,0', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90411', '25', '1438434786', '080176', '0', '2,2,4', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90412', '1', '1438434786', '20150801-091', '0', '9,9,9,8,7', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90413', '5', '1438434780', '20150801-1274', '0', '5,3,3,1,3', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90414', '14', '1438434600', '20150801-255', '0', '1,0,2,4,5', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90415', '16', '1438434786', '20150801-073', '0', '10,03,04,05,01', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90416', '3', '1438434786', '20150801-072', '0', '2,3,0,4,5', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90417', '26', '1438434720', '20150801-636', '0', '6,0,4,9,7', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90418', '15', '1426604400', '20150317-085', '0', '04,03,06,01,11', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90419', '7', '1438434788', '20150801-073', '0', '02,08,09,10,06', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90420', '6', '1438434788', '20150801-073', '0', '02,09,01,08,07', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90421', '20', '1438434720', '503659', '0', '04,02,03,05,06,01,07,09,10,08', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90422', '5', '1438434840', '20150801-1275', '0', '8,2,0,7,3', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90423', '18', '1438434770', '20150801-081', '0', '01,18,02,20,06,15,05,17', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90424', '26', '1438434840', '20150801-637', '0', '1,9,3,0,2', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90425', '14', '1438434900', '20150801-256', '0', '6,2,2,1,8', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90426', '5', '1438434900', '20150801-1276', '0', '2,8,0,6,1', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90427', '5', '1438434960', '20150801-1277', '0', '7,1,9,2,3', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90428', '26', '1438434960', '20150801-638', '0', '8,8,9,5,0', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90429', '18', '1487658170', '20170221-040', '0', '13,12,18,11,05,19,03,16', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90430', '10', '1487593800', '2017044', '0', '1,3,8', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90431', '9', '1487596500', '2017044', '0', '8,6,1', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90432', '25', '1487658470', '022135', '0', '1,3,4', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90433', '16', '1487658470', '20170221-032', '0', '01,05,10,07,11', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90434', '6', '1487658470', '20170221-032', '0', '09,01,07,10,06', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90435', '20', '1487658120', '603101', '0', '07,05,10,02,08,04,01,09,06,03', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90436', '1', '1487658470', '20170221-050', '0', '8,0,6,2,2', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90437', '7', '1487658473', '20170221-033', '0', '09,01,03,02,06', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90438', '20', '1487658420', '603102', '0', '09,04,01,08,10,07,05,02,03,06', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90439', '10', '1490099400', '2017073', '0', '0,3,1', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90440', '9', '1490102100', '2017073', '0', '0,7,5', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90441', '18', '1490119370', '20170322-013', '0', '14,03,06,11,20,15,05,09', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90442', '20', '1490111820', '608228', '0', '04,05,01,07,06,03,08,10,09,02', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90443', '25', '1490120954', '032182', '0', '3,4,6', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90444', '1', '1490120954', '20170322-023', '0', '1,3,3,9,3', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90445', '7', '1490120954', '20170321-078', '0', '07,09,04,08,06', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90446', '6', '1490120954', '20170321-084', '0', '07,09,01,08,02', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');
INSERT INTO `ssc_data` VALUES ('90447', '16', '1490124090', '20170321-084', '0', '02,11,01,05,04', '0', '0', '0', '0', '0.0000', '0.0000', '0.0000');

-- ----------------------------
-- Table structure for `ssc_data_time`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_data_time`;
CREATE TABLE `ssc_data_time` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) NOT NULL COMMENT '投注种类，对应ssc_type.id',
  `actionNo` int(8) NOT NULL COMMENT '开奖期号(当天)',
  `actionTime` time NOT NULL COMMENT '开奖时间',
  `stopTime` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=6940 DEFAULT CHARSET=latin1 COMMENT='开奖时间对照表';

-- ----------------------------
-- Records of ssc_data_time
-- ----------------------------
INSERT INTO `ssc_data_time` VALUES ('1', '1', '1', '00:05:00', '00:05:00');
INSERT INTO `ssc_data_time` VALUES ('2', '1', '2', '00:10:00', '00:10:00');
INSERT INTO `ssc_data_time` VALUES ('3', '1', '3', '00:15:00', '00:15:00');
INSERT INTO `ssc_data_time` VALUES ('4', '1', '4', '00:20:00', '00:20:00');
INSERT INTO `ssc_data_time` VALUES ('5', '1', '5', '00:25:00', '00:25:00');
INSERT INTO `ssc_data_time` VALUES ('6', '1', '6', '00:30:00', '00:30:00');
INSERT INTO `ssc_data_time` VALUES ('7', '1', '7', '00:35:00', '00:35:00');
INSERT INTO `ssc_data_time` VALUES ('8', '1', '8', '00:40:00', '00:40:00');
INSERT INTO `ssc_data_time` VALUES ('9', '1', '9', '00:45:00', '00:45:00');
INSERT INTO `ssc_data_time` VALUES ('10', '1', '10', '00:50:00', '00:50:00');
INSERT INTO `ssc_data_time` VALUES ('11', '1', '11', '00:55:00', '00:55:00');
INSERT INTO `ssc_data_time` VALUES ('12', '1', '12', '01:00:00', '01:00:00');
INSERT INTO `ssc_data_time` VALUES ('13', '1', '13', '01:05:00', '01:05:00');
INSERT INTO `ssc_data_time` VALUES ('14', '1', '14', '01:10:00', '01:10:00');
INSERT INTO `ssc_data_time` VALUES ('15', '1', '15', '01:15:00', '01:15:00');
INSERT INTO `ssc_data_time` VALUES ('16', '1', '16', '01:20:00', '01:20:00');
INSERT INTO `ssc_data_time` VALUES ('17', '1', '17', '01:25:00', '01:25:00');
INSERT INTO `ssc_data_time` VALUES ('18', '1', '18', '01:30:00', '01:30:00');
INSERT INTO `ssc_data_time` VALUES ('19', '1', '19', '01:35:00', '01:35:00');
INSERT INTO `ssc_data_time` VALUES ('20', '1', '20', '01:40:00', '01:40:00');
INSERT INTO `ssc_data_time` VALUES ('21', '1', '21', '01:45:00', '01:45:00');
INSERT INTO `ssc_data_time` VALUES ('22', '1', '22', '01:50:00', '01:50:00');
INSERT INTO `ssc_data_time` VALUES ('23', '1', '23', '01:55:00', '01:55:00');
INSERT INTO `ssc_data_time` VALUES ('24', '1', '24', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('25', '1', '25', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('26', '1', '26', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('27', '1', '27', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('28', '1', '28', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('29', '1', '29', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('30', '1', '30', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('31', '1', '31', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('32', '1', '32', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('33', '1', '33', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('34', '1', '34', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('35', '1', '35', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('36', '1', '36', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('37', '1', '37', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('38', '1', '38', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('39', '1', '39', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('40', '1', '40', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('41', '1', '41', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('42', '1', '42', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('43', '1', '43', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('44', '1', '44', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('45', '1', '45', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('46', '1', '46', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('47', '1', '47', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('48', '1', '48', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('49', '1', '49', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('50', '1', '50', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('51', '1', '51', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('52', '1', '52', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('53', '1', '53', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('54', '1', '54', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('55', '1', '55', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('56', '1', '56', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('57', '1', '57', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('58', '1', '58', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('59', '1', '59', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('60', '1', '60', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('61', '1', '61', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('62', '1', '62', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('63', '1', '63', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('64', '1', '64', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('65', '1', '65', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('66', '1', '66', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('67', '1', '67', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('68', '1', '68', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('69', '1', '69', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('70', '1', '70', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('71', '1', '71', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('72', '1', '72', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('73', '1', '73', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('74', '1', '74', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('75', '1', '75', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('76', '1', '76', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('77', '1', '77', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('78', '1', '78', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('79', '1', '79', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('80', '1', '80', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('81', '1', '81', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('82', '1', '82', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('83', '1', '83', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('84', '1', '84', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('85', '1', '85', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('86', '1', '86', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('87', '1', '87', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('88', '1', '88', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('89', '1', '89', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('90', '1', '90', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('91', '1', '91', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('92', '1', '92', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('93', '1', '93', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('94', '1', '94', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('95', '1', '95', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('96', '1', '96', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('97', '1', '97', '22:05:00', '22:05:00');
INSERT INTO `ssc_data_time` VALUES ('98', '1', '98', '22:10:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('99', '1', '99', '22:15:00', '22:15:00');
INSERT INTO `ssc_data_time` VALUES ('100', '1', '100', '22:20:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('101', '1', '101', '22:25:00', '22:25:00');
INSERT INTO `ssc_data_time` VALUES ('102', '1', '102', '22:30:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('103', '1', '103', '22:35:00', '22:35:00');
INSERT INTO `ssc_data_time` VALUES ('104', '1', '104', '22:40:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('105', '1', '105', '22:45:00', '22:45:00');
INSERT INTO `ssc_data_time` VALUES ('106', '1', '106', '22:50:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('107', '1', '107', '22:55:00', '22:55:00');
INSERT INTO `ssc_data_time` VALUES ('108', '1', '108', '23:00:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('109', '1', '109', '23:05:00', '23:05:00');
INSERT INTO `ssc_data_time` VALUES ('110', '1', '110', '23:10:00', '23:10:00');
INSERT INTO `ssc_data_time` VALUES ('111', '1', '111', '23:15:00', '23:15:00');
INSERT INTO `ssc_data_time` VALUES ('112', '1', '112', '23:20:00', '23:20:00');
INSERT INTO `ssc_data_time` VALUES ('113', '1', '113', '23:25:00', '23:25:00');
INSERT INTO `ssc_data_time` VALUES ('114', '1', '114', '23:30:00', '23:30:00');
INSERT INTO `ssc_data_time` VALUES ('115', '1', '115', '23:35:00', '23:35:00');
INSERT INTO `ssc_data_time` VALUES ('116', '1', '116', '23:40:00', '23:40:00');
INSERT INTO `ssc_data_time` VALUES ('117', '1', '117', '23:45:00', '23:45:00');
INSERT INTO `ssc_data_time` VALUES ('118', '1', '118', '23:50:00', '23:50:00');
INSERT INTO `ssc_data_time` VALUES ('119', '1', '119', '23:55:00', '23:55:00');
INSERT INTO `ssc_data_time` VALUES ('120', '1', '120', '00:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('830', '3', '84', '23:12:02', '23:12:02');
INSERT INTO `ssc_data_time` VALUES ('829', '3', '83', '23:01:52', '23:01:52');
INSERT INTO `ssc_data_time` VALUES ('828', '3', '82', '22:51:42', '22:51:42');
INSERT INTO `ssc_data_time` VALUES ('827', '3', '81', '22:41:33', '22:41:33');
INSERT INTO `ssc_data_time` VALUES ('826', '3', '80', '22:31:23', '22:31:23');
INSERT INTO `ssc_data_time` VALUES ('825', '3', '79', '22:20:58', '22:20:58');
INSERT INTO `ssc_data_time` VALUES ('824', '3', '78', '22:11:03', '22:11:03');
INSERT INTO `ssc_data_time` VALUES ('823', '3', '77', '22:00:53', '22:00:53');
INSERT INTO `ssc_data_time` VALUES ('822', '3', '76', '21:50:44', '21:50:44');
INSERT INTO `ssc_data_time` VALUES ('821', '3', '75', '21:40:35', '21:40:35');
INSERT INTO `ssc_data_time` VALUES ('820', '3', '74', '21:30:25', '21:30:25');
INSERT INTO `ssc_data_time` VALUES ('819', '3', '73', '21:20:15', '21:20:15');
INSERT INTO `ssc_data_time` VALUES ('818', '3', '72', '21:10:05', '21:10:05');
INSERT INTO `ssc_data_time` VALUES ('817', '3', '71', '20:59:56', '20:59:56');
INSERT INTO `ssc_data_time` VALUES ('816', '3', '70', '20:49:47', '20:49:47');
INSERT INTO `ssc_data_time` VALUES ('815', '3', '69', '20:39:38', '20:39:38');
INSERT INTO `ssc_data_time` VALUES ('814', '3', '68', '20:29:29', '20:29:29');
INSERT INTO `ssc_data_time` VALUES ('813', '3', '67', '20:19:20', '20:19:20');
INSERT INTO `ssc_data_time` VALUES ('812', '3', '66', '20:09:10', '20:09:10');
INSERT INTO `ssc_data_time` VALUES ('811', '3', '65', '19:59:01', '19:59:01');
INSERT INTO `ssc_data_time` VALUES ('810', '3', '64', '19:48:52', '19:48:52');
INSERT INTO `ssc_data_time` VALUES ('809', '3', '63', '19:38:43', '19:38:43');
INSERT INTO `ssc_data_time` VALUES ('808', '3', '62', '19:28:19', '19:28:19');
INSERT INTO `ssc_data_time` VALUES ('807', '3', '61', '19:18:24', '19:18:24');
INSERT INTO `ssc_data_time` VALUES ('806', '3', '60', '19:08:14', '19:08:14');
INSERT INTO `ssc_data_time` VALUES ('805', '3', '59', '18:58:05', '18:58:05');
INSERT INTO `ssc_data_time` VALUES ('804', '3', '58', '18:47:56', '18:47:56');
INSERT INTO `ssc_data_time` VALUES ('803', '3', '57', '18:37:35', '18:37:35');
INSERT INTO `ssc_data_time` VALUES ('802', '3', '56', '18:27:40', '18:27:40');
INSERT INTO `ssc_data_time` VALUES ('801', '3', '55', '18:17:32', '18:17:32');
INSERT INTO `ssc_data_time` VALUES ('800', '3', '54', '18:07:24', '18:07:24');
INSERT INTO `ssc_data_time` VALUES ('799', '3', '53', '17:57:16', '17:57:16');
INSERT INTO `ssc_data_time` VALUES ('798', '3', '52', '17:47:08', '17:47:08');
INSERT INTO `ssc_data_time` VALUES ('797', '3', '51', '17:36:47', '17:36:47');
INSERT INTO `ssc_data_time` VALUES ('796', '3', '50', '17:26:52', '17:26:52');
INSERT INTO `ssc_data_time` VALUES ('795', '3', '49', '17:16:43', '17:16:43');
INSERT INTO `ssc_data_time` VALUES ('794', '3', '48', '17:06:35', '17:06:35');
INSERT INTO `ssc_data_time` VALUES ('793', '3', '47', '16:56:13', '16:56:13');
INSERT INTO `ssc_data_time` VALUES ('792', '3', '46', '16:46:18', '16:46:18');
INSERT INTO `ssc_data_time` VALUES ('791', '3', '45', '16:35:57', '16:35:57');
INSERT INTO `ssc_data_time` VALUES ('790', '3', '44', '16:26:02', '16:26:02');
INSERT INTO `ssc_data_time` VALUES ('789', '3', '43', '16:15:53', '16:15:53');
INSERT INTO `ssc_data_time` VALUES ('788', '3', '42', '16:05:32', '16:05:32');
INSERT INTO `ssc_data_time` VALUES ('787', '3', '41', '15:55:37', '15:55:37');
INSERT INTO `ssc_data_time` VALUES ('786', '3', '40', '15:45:28', '15:45:28');
INSERT INTO `ssc_data_time` VALUES ('785', '3', '39', '15:35:20', '15:35:20');
INSERT INTO `ssc_data_time` VALUES ('784', '3', '38', '15:25:12', '15:25:12');
INSERT INTO `ssc_data_time` VALUES ('783', '3', '37', '15:15:03', '15:15:03');
INSERT INTO `ssc_data_time` VALUES ('782', '3', '36', '15:04:55', '15:04:55');
INSERT INTO `ssc_data_time` VALUES ('781', '3', '35', '14:54:47', '14:54:47');
INSERT INTO `ssc_data_time` VALUES ('780', '3', '34', '14:44:26', '14:44:26');
INSERT INTO `ssc_data_time` VALUES ('779', '3', '33', '14:34:31', '14:34:31');
INSERT INTO `ssc_data_time` VALUES ('778', '3', '32', '14:24:23', '14:24:23');
INSERT INTO `ssc_data_time` VALUES ('777', '3', '31', '14:14:01', '14:14:01');
INSERT INTO `ssc_data_time` VALUES ('776', '3', '30', '14:04:06', '14:04:06');
INSERT INTO `ssc_data_time` VALUES ('775', '3', '29', '13:53:57', '13:53:57');
INSERT INTO `ssc_data_time` VALUES ('774', '3', '28', '13:43:49', '13:43:49');
INSERT INTO `ssc_data_time` VALUES ('773', '3', '27', '13:33:41', '13:33:41');
INSERT INTO `ssc_data_time` VALUES ('772', '3', '26', '13:23:33', '13:23:33');
INSERT INTO `ssc_data_time` VALUES ('771', '3', '25', '13:13:25', '13:13:25');
INSERT INTO `ssc_data_time` VALUES ('770', '3', '24', '13:03:16', '13:03:16');
INSERT INTO `ssc_data_time` VALUES ('769', '3', '23', '12:53:07', '12:53:07');
INSERT INTO `ssc_data_time` VALUES ('768', '3', '22', '12:42:44', '12:42:44');
INSERT INTO `ssc_data_time` VALUES ('767', '3', '21', '12:32:49', '12:32:49');
INSERT INTO `ssc_data_time` VALUES ('766', '3', '20', '12:22:28', '12:22:28');
INSERT INTO `ssc_data_time` VALUES ('765', '3', '19', '12:12:33', '12:12:33');
INSERT INTO `ssc_data_time` VALUES ('764', '3', '18', '12:02:12', '12:02:12');
INSERT INTO `ssc_data_time` VALUES ('763', '3', '17', '11:52:17', '11:52:17');
INSERT INTO `ssc_data_time` VALUES ('762', '3', '16', '11:42:08', '11:42:08');
INSERT INTO `ssc_data_time` VALUES ('761', '3', '15', '11:31:59', '11:31:59');
INSERT INTO `ssc_data_time` VALUES ('760', '3', '14', '11:21:51', '11:21:51');
INSERT INTO `ssc_data_time` VALUES ('759', '3', '13', '11:11:43', '11:11:43');
INSERT INTO `ssc_data_time` VALUES ('758', '3', '12', '11:01:34', '11:01:34');
INSERT INTO `ssc_data_time` VALUES ('757', '3', '11', '10:51:26', '10:51:26');
INSERT INTO `ssc_data_time` VALUES ('756', '3', '10', '10:41:18', '10:41:18');
INSERT INTO `ssc_data_time` VALUES ('755', '3', '9', '10:31:10', '10:31:10');
INSERT INTO `ssc_data_time` VALUES ('754', '3', '8', '10:21:02', '10:21:02');
INSERT INTO `ssc_data_time` VALUES ('753', '3', '7', '10:10:54', '10:10:54');
INSERT INTO `ssc_data_time` VALUES ('752', '3', '6', '10:00:46', '10:00:46');
INSERT INTO `ssc_data_time` VALUES ('751', '3', '5', '09:50:38', '09:50:38');
INSERT INTO `ssc_data_time` VALUES ('750', '3', '4', '09:40:30', '09:40:30');
INSERT INTO `ssc_data_time` VALUES ('749', '3', '3', '09:30:22', '09:30:22');
INSERT INTO `ssc_data_time` VALUES ('748', '3', '2', '09:20:14', '09:20:14');
INSERT INTO `ssc_data_time` VALUES ('747', '3', '1', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('205', '12', '84', '23:57:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('206', '12', '83', '23:47:00', '23:50:00');
INSERT INTO `ssc_data_time` VALUES ('207', '12', '82', '23:37:00', '23:40:00');
INSERT INTO `ssc_data_time` VALUES ('208', '12', '81', '23:27:00', '23:30:00');
INSERT INTO `ssc_data_time` VALUES ('209', '12', '80', '23:17:00', '23:20:00');
INSERT INTO `ssc_data_time` VALUES ('210', '12', '79', '23:07:00', '23:10:00');
INSERT INTO `ssc_data_time` VALUES ('211', '12', '78', '22:57:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('212', '12', '77', '22:47:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('213', '12', '76', '22:37:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('214', '12', '75', '22:27:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('215', '12', '74', '22:17:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('216', '12', '73', '22:07:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('217', '12', '72', '21:57:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('218', '12', '71', '21:47:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('219', '12', '70', '21:37:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('220', '12', '69', '21:27:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('221', '12', '68', '21:17:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('222', '12', '67', '21:07:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('223', '12', '66', '20:57:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('224', '12', '65', '20:47:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('225', '12', '64', '20:37:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('226', '12', '63', '20:27:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('227', '12', '62', '20:17:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('228', '12', '61', '20:07:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('229', '12', '60', '19:57:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('230', '12', '59', '19:47:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('231', '12', '58', '19:37:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('232', '12', '57', '19:27:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('233', '12', '56', '19:17:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('234', '12', '55', '19:07:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('235', '12', '54', '18:57:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('236', '12', '53', '18:47:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('237', '12', '52', '18:37:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('238', '12', '51', '18:27:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('239', '12', '50', '18:17:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('240', '12', '49', '18:07:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('241', '12', '48', '17:57:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('242', '12', '47', '17:47:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('243', '12', '46', '17:37:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('244', '12', '45', '17:27:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('245', '12', '44', '17:17:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('246', '12', '43', '17:07:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('247', '12', '42', '16:47:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('248', '12', '41', '16:37:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('249', '12', '40', '16:37:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('250', '12', '39', '16:27:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('251', '12', '38', '16:17:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('252', '12', '37', '16:07:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('253', '12', '36', '15:57:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('254', '12', '35', '15:47:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('255', '12', '34', '15:37:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('256', '12', '33', '15:27:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('257', '12', '32', '15:17:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('258', '12', '31', '15:07:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('259', '12', '30', '14:57:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('260', '12', '29', '14:47:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('261', '12', '28', '14:37:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('262', '12', '27', '14:27:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('263', '12', '26', '14:17:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('264', '12', '25', '14:07:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('265', '12', '24', '13:57:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('266', '12', '23', '13:47:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('267', '12', '22', '13:37:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('268', '12', '21', '13:27:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('269', '12', '20', '13:17:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('270', '12', '19', '13:07:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('271', '12', '18', '13:57:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('272', '12', '17', '12:47:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('273', '12', '16', '12:37:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('274', '12', '15', '12:27:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('275', '12', '14', '12:17:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('276', '12', '13', '12:07:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('277', '12', '12', '11:57:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('278', '12', '11', '11:47:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('279', '12', '10', '11:37:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('280', '12', '9', '11:27:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('281', '12', '8', '11:17:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('282', '12', '7', '11:07:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('283', '12', '6', '11:57:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('284', '12', '5', '10:47:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('285', '12', '4', '10:37:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('286', '12', '3', '10:27:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('287', '12', '2', '10:17:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('288', '12', '1', '10:07:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('289', '4', '1', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('290', '4', '2', '09:20:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('291', '4', '3', '09:30:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('292', '4', '4', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('293', '4', '5', '09:50:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('294', '4', '6', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('295', '4', '7', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('296', '4', '8', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('297', '4', '9', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('298', '4', '10', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('299', '4', '11', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('300', '4', '12', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('301', '4', '13', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('302', '4', '14', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('303', '4', '15', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('304', '4', '16', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('305', '4', '17', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('306', '4', '18', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('307', '4', '19', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('308', '4', '20', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('309', '4', '21', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('310', '4', '22', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('311', '4', '23', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('312', '4', '24', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('313', '4', '25', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('314', '4', '26', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('315', '4', '27', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('316', '4', '28', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('317', '4', '29', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('318', '4', '30', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('319', '4', '31', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('320', '4', '32', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('321', '4', '33', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('322', '4', '34', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('323', '4', '35', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('324', '4', '36', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('325', '4', '37', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('326', '4', '38', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('327', '4', '39', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('328', '4', '40', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('329', '4', '41', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('330', '4', '42', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('331', '4', '43', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('332', '4', '44', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('333', '4', '45', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('334', '4', '46', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('335', '4', '47', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('336', '4', '48', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('337', '4', '49', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('338', '4', '50', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('339', '4', '51', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('340', '4', '52', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('341', '4', '53', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('342', '4', '54', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('343', '4', '55', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('344', '4', '56', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('345', '4', '57', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('346', '4', '58', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('347', '4', '59', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('348', '4', '60', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('349', '4', '61', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('350', '4', '62', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('351', '4', '63', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('352', '4', '64', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('353', '4', '65', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('354', '4', '66', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('355', '4', '67', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('356', '4', '68', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('357', '4', '69', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('358', '4', '70', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('359', '4', '71', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('360', '4', '72', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('361', '4', '73', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('362', '4', '74', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('363', '4', '75', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('364', '4', '76', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('365', '4', '77', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('366', '4', '78', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('367', '4', '79', '22:10:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('368', '4', '80', '22:20:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('369', '4', '81', '22:30:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('370', '4', '82', '22:40:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('371', '4', '83', '22:50:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('372', '4', '84', '23:00:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('373', '9', '1', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('374', '6', '1', '09:07:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('375', '6', '2', '09:17:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('376', '6', '3', '09:27:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('377', '6', '4', '09:37:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('378', '6', '5', '09:47:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('379', '6', '6', '09:57:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('380', '6', '7', '10:07:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('381', '6', '8', '10:17:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('382', '6', '9', '10:27:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('383', '6', '10', '10:37:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('384', '6', '11', '10:47:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('385', '6', '12', '10:57:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('386', '6', '13', '11:07:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('387', '6', '14', '11:17:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('388', '6', '15', '11:27:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('389', '6', '16', '11:37:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('390', '6', '17', '11:47:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('391', '6', '18', '11:57:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('392', '6', '19', '12:07:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('393', '6', '20', '12:17:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('394', '6', '21', '12:27:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('395', '6', '22', '12:37:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('396', '6', '23', '12:47:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('397', '6', '24', '12:57:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('398', '6', '25', '13:07:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('399', '6', '26', '13:17:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('400', '6', '27', '13:27:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('401', '6', '28', '13:37:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('402', '6', '29', '13:47:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('403', '6', '30', '13:57:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('404', '6', '31', '14:07:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('405', '6', '32', '14:17:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('406', '6', '33', '14:27:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('407', '6', '34', '14:37:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('408', '6', '35', '14:47:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('409', '6', '36', '14:57:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('410', '6', '37', '15:07:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('411', '6', '38', '15:17:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('412', '6', '39', '15:27:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('413', '6', '40', '15:37:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('414', '6', '41', '15:47:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('415', '6', '42', '15:57:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('416', '6', '43', '16:07:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('417', '6', '44', '16:17:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('418', '6', '45', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('419', '6', '46', '16:37:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('420', '6', '47', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('421', '6', '48', '16:57:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('422', '6', '49', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('423', '6', '50', '17:17:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('424', '6', '51', '17:27:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('425', '6', '52', '17:37:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('426', '6', '53', '17:47:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('427', '6', '54', '17:57:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('428', '6', '55', '18:07:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('429', '6', '56', '18:17:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('430', '6', '57', '18:27:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('431', '6', '58', '18:37:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('432', '6', '59', '18:47:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('433', '6', '60', '18:57:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('434', '6', '61', '19:07:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('435', '6', '62', '19:17:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('436', '6', '63', '19:27:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('437', '6', '64', '19:37:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('438', '6', '65', '19:47:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('439', '6', '66', '19:57:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('440', '6', '67', '20:07:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('441', '6', '68', '20:17:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('442', '6', '69', '20:27:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('443', '6', '70', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('444', '6', '71', '20:47:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('445', '6', '72', '20:57:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('446', '6', '73', '21:07:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('447', '6', '74', '21:17:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('448', '6', '75', '21:27:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('449', '6', '76', '21:37:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('450', '6', '77', '21:47:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('451', '6', '78', '21:57:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('452', '6', '79', '22:07:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('453', '6', '80', '22:17:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('454', '6', '81', '22:27:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('455', '6', '82', '22:37:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('456', '6', '83', '22:47:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('457', '6', '84', '22:57:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('458', '10', '1', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('4022', '26', '23', '00:46:00', '00:46:00');
INSERT INTO `ssc_data_time` VALUES ('4021', '26', '22', '00:44:00', '00:44:00');
INSERT INTO `ssc_data_time` VALUES ('4020', '26', '21', '00:42:00', '00:42:00');
INSERT INTO `ssc_data_time` VALUES ('4019', '26', '20', '00:40:00', '00:40:00');
INSERT INTO `ssc_data_time` VALUES ('4018', '26', '19', '00:38:00', '00:38:00');
INSERT INTO `ssc_data_time` VALUES ('4017', '26', '18', '00:36:00', '00:36:00');
INSERT INTO `ssc_data_time` VALUES ('4016', '26', '17', '00:34:00', '00:34:00');
INSERT INTO `ssc_data_time` VALUES ('4015', '26', '16', '00:32:00', '00:32:00');
INSERT INTO `ssc_data_time` VALUES ('4014', '26', '15', '00:30:00', '00:30:00');
INSERT INTO `ssc_data_time` VALUES ('4013', '26', '14', '00:28:00', '00:28:00');
INSERT INTO `ssc_data_time` VALUES ('4012', '26', '13', '00:26:00', '00:26:00');
INSERT INTO `ssc_data_time` VALUES ('4011', '26', '12', '00:24:00', '00:24:00');
INSERT INTO `ssc_data_time` VALUES ('4010', '26', '11', '00:22:00', '00:22:00');
INSERT INTO `ssc_data_time` VALUES ('4009', '26', '10', '00:20:00', '00:20:00');
INSERT INTO `ssc_data_time` VALUES ('4008', '26', '9', '00:18:00', '00:18:00');
INSERT INTO `ssc_data_time` VALUES ('4007', '26', '8', '00:16:00', '00:16:00');
INSERT INTO `ssc_data_time` VALUES ('4006', '26', '7', '00:14:00', '00:14:00');
INSERT INTO `ssc_data_time` VALUES ('4005', '26', '6', '00:12:00', '00:12:00');
INSERT INTO `ssc_data_time` VALUES ('4004', '26', '5', '00:10:00', '00:10:00');
INSERT INTO `ssc_data_time` VALUES ('4003', '26', '4', '00:08:00', '00:08:00');
INSERT INTO `ssc_data_time` VALUES ('4002', '26', '3', '00:06:00', '00:06:00');
INSERT INTO `ssc_data_time` VALUES ('4001', '26', '2', '00:04:00', '00:04:00');
INSERT INTO `ssc_data_time` VALUES ('4000', '26', '1', '00:02:00', '00:02:00');
INSERT INTO `ssc_data_time` VALUES ('4100', '26', '101', '03:22:00', '03:22:00');
INSERT INTO `ssc_data_time` VALUES ('4099', '26', '100', '03:20:00', '03:20:00');
INSERT INTO `ssc_data_time` VALUES ('4098', '26', '99', '03:18:00', '03:18:00');
INSERT INTO `ssc_data_time` VALUES ('4097', '26', '98', '03:16:00', '03:16:00');
INSERT INTO `ssc_data_time` VALUES ('4096', '26', '97', '03:14:00', '03:14:00');
INSERT INTO `ssc_data_time` VALUES ('4095', '26', '96', '03:12:00', '03:12:00');
INSERT INTO `ssc_data_time` VALUES ('4094', '26', '95', '03:10:00', '03:10:00');
INSERT INTO `ssc_data_time` VALUES ('4093', '26', '94', '03:08:00', '03:08:00');
INSERT INTO `ssc_data_time` VALUES ('4092', '26', '93', '03:06:00', '03:06:00');
INSERT INTO `ssc_data_time` VALUES ('4091', '26', '92', '03:04:00', '03:04:00');
INSERT INTO `ssc_data_time` VALUES ('4090', '26', '91', '03:02:00', '03:02:00');
INSERT INTO `ssc_data_time` VALUES ('4089', '26', '90', '03:00:00', '03:00:00');
INSERT INTO `ssc_data_time` VALUES ('4088', '26', '89', '02:58:00', '02:58:00');
INSERT INTO `ssc_data_time` VALUES ('4087', '26', '88', '02:56:00', '02:56:00');
INSERT INTO `ssc_data_time` VALUES ('4086', '26', '87', '02:54:00', '02:54:00');
INSERT INTO `ssc_data_time` VALUES ('4085', '26', '86', '02:52:00', '02:52:00');
INSERT INTO `ssc_data_time` VALUES ('4084', '26', '85', '02:50:00', '02:50:00');
INSERT INTO `ssc_data_time` VALUES ('4083', '26', '84', '02:48:00', '02:48:00');
INSERT INTO `ssc_data_time` VALUES ('4082', '26', '83', '02:46:00', '02:46:00');
INSERT INTO `ssc_data_time` VALUES ('4081', '26', '82', '02:44:00', '02:44:00');
INSERT INTO `ssc_data_time` VALUES ('4080', '26', '81', '02:42:00', '02:42:00');
INSERT INTO `ssc_data_time` VALUES ('4079', '26', '80', '02:40:00', '02:40:00');
INSERT INTO `ssc_data_time` VALUES ('4078', '26', '79', '02:38:00', '02:38:00');
INSERT INTO `ssc_data_time` VALUES ('4077', '26', '78', '02:36:00', '02:36:00');
INSERT INTO `ssc_data_time` VALUES ('4076', '26', '77', '02:34:00', '02:34:00');
INSERT INTO `ssc_data_time` VALUES ('4075', '26', '76', '02:32:00', '02:32:00');
INSERT INTO `ssc_data_time` VALUES ('4074', '26', '75', '02:30:00', '02:30:00');
INSERT INTO `ssc_data_time` VALUES ('4073', '26', '74', '02:28:00', '02:28:00');
INSERT INTO `ssc_data_time` VALUES ('4072', '26', '73', '02:26:00', '02:26:00');
INSERT INTO `ssc_data_time` VALUES ('4071', '26', '72', '02:24:00', '02:24:00');
INSERT INTO `ssc_data_time` VALUES ('4070', '26', '71', '02:22:00', '02:22:00');
INSERT INTO `ssc_data_time` VALUES ('4069', '26', '70', '02:20:00', '02:20:00');
INSERT INTO `ssc_data_time` VALUES ('4068', '26', '69', '02:18:00', '02:18:00');
INSERT INTO `ssc_data_time` VALUES ('4067', '26', '68', '02:16:00', '02:16:00');
INSERT INTO `ssc_data_time` VALUES ('4066', '26', '67', '02:14:00', '02:14:00');
INSERT INTO `ssc_data_time` VALUES ('4065', '26', '66', '02:12:00', '02:12:00');
INSERT INTO `ssc_data_time` VALUES ('4064', '26', '65', '02:10:00', '02:10:00');
INSERT INTO `ssc_data_time` VALUES ('4063', '26', '64', '02:08:00', '02:08:00');
INSERT INTO `ssc_data_time` VALUES ('4062', '26', '63', '02:06:00', '02:06:00');
INSERT INTO `ssc_data_time` VALUES ('4061', '26', '62', '02:04:00', '02:04:00');
INSERT INTO `ssc_data_time` VALUES ('4060', '26', '61', '02:02:00', '02:02:00');
INSERT INTO `ssc_data_time` VALUES ('4059', '26', '60', '02:00:00', '02:00:00');
INSERT INTO `ssc_data_time` VALUES ('4058', '26', '59', '01:58:00', '01:58:00');
INSERT INTO `ssc_data_time` VALUES ('4057', '26', '58', '01:56:00', '01:56:00');
INSERT INTO `ssc_data_time` VALUES ('4056', '26', '57', '01:54:00', '01:54:00');
INSERT INTO `ssc_data_time` VALUES ('4055', '26', '56', '01:52:00', '01:52:00');
INSERT INTO `ssc_data_time` VALUES ('4054', '26', '55', '01:50:00', '01:50:00');
INSERT INTO `ssc_data_time` VALUES ('4053', '26', '54', '01:48:00', '01:48:00');
INSERT INTO `ssc_data_time` VALUES ('4052', '26', '53', '01:46:00', '01:46:00');
INSERT INTO `ssc_data_time` VALUES ('4051', '26', '52', '01:44:00', '01:44:00');
INSERT INTO `ssc_data_time` VALUES ('4050', '26', '51', '01:42:00', '01:42:00');
INSERT INTO `ssc_data_time` VALUES ('4049', '26', '50', '01:40:00', '01:40:00');
INSERT INTO `ssc_data_time` VALUES ('4048', '26', '49', '01:38:00', '01:38:00');
INSERT INTO `ssc_data_time` VALUES ('4047', '26', '48', '01:36:00', '01:36:00');
INSERT INTO `ssc_data_time` VALUES ('4046', '26', '47', '01:34:00', '01:34:00');
INSERT INTO `ssc_data_time` VALUES ('4045', '26', '46', '01:32:00', '01:32:00');
INSERT INTO `ssc_data_time` VALUES ('4044', '26', '45', '01:30:00', '01:30:00');
INSERT INTO `ssc_data_time` VALUES ('4043', '26', '44', '01:28:00', '01:28:00');
INSERT INTO `ssc_data_time` VALUES ('4042', '26', '43', '01:26:00', '01:26:00');
INSERT INTO `ssc_data_time` VALUES ('4041', '26', '42', '01:24:00', '01:24:00');
INSERT INTO `ssc_data_time` VALUES ('4040', '26', '41', '01:22:00', '01:22:00');
INSERT INTO `ssc_data_time` VALUES ('4039', '26', '40', '01:20:00', '01:20:00');
INSERT INTO `ssc_data_time` VALUES ('4038', '26', '39', '01:18:00', '01:18:00');
INSERT INTO `ssc_data_time` VALUES ('4037', '26', '38', '01:16:00', '01:16:00');
INSERT INTO `ssc_data_time` VALUES ('4036', '26', '37', '01:14:00', '01:14:00');
INSERT INTO `ssc_data_time` VALUES ('4035', '26', '36', '01:12:00', '01:12:00');
INSERT INTO `ssc_data_time` VALUES ('4034', '26', '35', '01:10:00', '01:10:00');
INSERT INTO `ssc_data_time` VALUES ('4033', '26', '34', '01:08:00', '01:08:00');
INSERT INTO `ssc_data_time` VALUES ('4032', '26', '33', '01:06:00', '01:06:00');
INSERT INTO `ssc_data_time` VALUES ('4031', '26', '32', '01:04:00', '01:04:00');
INSERT INTO `ssc_data_time` VALUES ('4030', '26', '31', '01:02:00', '01:02:00');
INSERT INTO `ssc_data_time` VALUES ('4029', '26', '30', '01:00:00', '01:00:00');
INSERT INTO `ssc_data_time` VALUES ('4028', '26', '29', '00:58:00', '00:58:00');
INSERT INTO `ssc_data_time` VALUES ('4027', '26', '28', '00:56:00', '00:56:00');
INSERT INTO `ssc_data_time` VALUES ('4026', '26', '27', '00:54:00', '00:54:00');
INSERT INTO `ssc_data_time` VALUES ('4025', '26', '26', '00:52:00', '00:52:00');
INSERT INTO `ssc_data_time` VALUES ('4024', '26', '25', '00:50:00', '00:50:00');
INSERT INTO `ssc_data_time` VALUES ('4023', '26', '24', '00:48:00', '00:48:00');
INSERT INTO `ssc_data_time` VALUES ('561', '12', '85', '00:07:00', '00:10:00');
INSERT INTO `ssc_data_time` VALUES ('562', '12', '86', '00:17:00', '00:20:00');
INSERT INTO `ssc_data_time` VALUES ('563', '12', '87', '00:27:00', '00:30:00');
INSERT INTO `ssc_data_time` VALUES ('564', '12', '88', '00:37:00', '00:40:00');
INSERT INTO `ssc_data_time` VALUES ('565', '12', '89', '00:47:00', '00:50:00');
INSERT INTO `ssc_data_time` VALUES ('566', '12', '90', '00:57:00', '01:00:00');
INSERT INTO `ssc_data_time` VALUES ('567', '12', '91', '01:07:00', '01:10:00');
INSERT INTO `ssc_data_time` VALUES ('568', '12', '92', '01:17:00', '01:20:00');
INSERT INTO `ssc_data_time` VALUES ('569', '12', '93', '01:27:00', '01:30:00');
INSERT INTO `ssc_data_time` VALUES ('570', '12', '94', '01:37:00', '01:40:00');
INSERT INTO `ssc_data_time` VALUES ('571', '12', '95', '01:47:00', '01:50:00');
INSERT INTO `ssc_data_time` VALUES ('572', '12', '96', '01:57:00', '02:00:00');
INSERT INTO `ssc_data_time` VALUES ('584', '15', '1', '09:00:00', '09:00:00');
INSERT INTO `ssc_data_time` VALUES ('585', '15', '2', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('586', '15', '3', '09:20:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('587', '15', '4', '09:30:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('588', '15', '5', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('589', '15', '6', '09:50:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('590', '15', '7', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('591', '15', '8', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('592', '15', '9', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('593', '15', '10', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('594', '15', '11', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('595', '15', '12', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('596', '15', '13', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('597', '15', '14', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('598', '15', '15', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('599', '15', '16', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('600', '15', '17', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('601', '15', '18', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('602', '15', '19', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('603', '15', '20', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('604', '15', '21', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('605', '15', '22', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('606', '15', '23', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('607', '15', '24', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('608', '15', '25', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('609', '15', '26', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('610', '15', '27', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('611', '15', '28', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('612', '15', '29', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('613', '15', '30', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('614', '15', '31', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('615', '15', '32', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('616', '15', '33', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('617', '15', '34', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('618', '15', '35', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('619', '15', '36', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('620', '15', '37', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('621', '15', '38', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('622', '15', '39', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('623', '15', '40', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('624', '15', '41', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('625', '15', '42', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('626', '15', '43', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('627', '15', '44', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('628', '15', '45', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('629', '15', '46', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('630', '15', '47', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('631', '15', '48', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('632', '15', '49', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('633', '15', '50', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('634', '15', '51', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('635', '15', '52', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('636', '15', '53', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('637', '15', '54', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('638', '15', '55', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('639', '15', '56', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('640', '15', '57', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('641', '15', '58', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('642', '15', '59', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('643', '15', '60', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('644', '15', '61', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('645', '15', '62', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('646', '15', '63', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('647', '15', '64', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('648', '15', '65', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('649', '15', '66', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('650', '15', '67', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('651', '15', '68', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('652', '15', '69', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('653', '15', '70', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('654', '15', '71', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('655', '15', '72', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('656', '15', '73', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('657', '15', '74', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('658', '15', '75', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('659', '15', '76', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('660', '15', '77', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('661', '15', '78', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('662', '15', '79', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('663', '15', '80', '22:10:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('664', '15', '81', '22:20:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('665', '15', '82', '22:30:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('666', '15', '83', '22:40:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('667', '15', '84', '22:50:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('668', '15', '85', '23:00:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('1999', '16', '78', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('1998', '16', '77', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('1997', '16', '76', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('1996', '16', '75', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('1995', '16', '74', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('1994', '16', '73', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('1993', '16', '72', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('1992', '16', '71', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('1991', '16', '70', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('1990', '16', '69', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('1989', '16', '68', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('1988', '16', '67', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('1987', '16', '66', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('1986', '16', '65', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('1985', '16', '64', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('1984', '16', '63', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('1983', '16', '62', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('1982', '16', '61', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('1981', '16', '60', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('1980', '16', '59', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('1979', '16', '58', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('1978', '16', '57', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('1977', '16', '56', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('1976', '16', '55', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('1975', '16', '54', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('1974', '16', '53', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('1973', '16', '52', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('1972', '16', '51', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('1971', '16', '50', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('1970', '16', '49', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('1969', '16', '48', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('1968', '16', '47', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('1967', '16', '46', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('1966', '16', '45', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('1965', '16', '44', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('1964', '16', '43', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('1963', '16', '42', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('1962', '16', '41', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('1961', '16', '40', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('1960', '16', '39', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('1959', '16', '38', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('1958', '16', '37', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('1957', '16', '36', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('1956', '16', '35', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('1955', '16', '34', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('1954', '16', '33', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('1953', '16', '32', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('1952', '16', '31', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('1951', '16', '30', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('1950', '16', '29', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('1949', '16', '28', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('1948', '16', '27', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('1947', '16', '26', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('1946', '16', '25', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('1945', '16', '24', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('1944', '16', '23', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('1943', '16', '22', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('1942', '16', '21', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('1941', '16', '20', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('1940', '16', '19', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('1939', '16', '18', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('1938', '16', '17', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('1937', '16', '16', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('1936', '16', '15', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('1935', '16', '15', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('1934', '16', '13', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('1933', '16', '12', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('1932', '16', '11', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('1931', '16', '10', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('1930', '16', '9', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('1929', '16', '8', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('1928', '16', '7', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('1927', '16', '6', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('1926', '16', '5', '09:50:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('1925', '16', '4', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('1924', '16', '3', '09:30:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('1923', '16', '2', '09:20:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('1922', '16', '1', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('5100', '17', '1', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('5101', '17', '2', '09:20:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('5102', '17', '3', '09:30:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('5103', '17', '4', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('5104', '17', '5', '09:50:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('5105', '17', '6', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('5106', '17', '7', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('5107', '17', '8', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('5108', '17', '9', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('5109', '17', '10', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('5110', '17', '11', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('5111', '17', '12', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('5112', '17', '13', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('5113', '17', '14', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('5114', '17', '15', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('5115', '17', '16', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('5116', '17', '17', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('5117', '17', '18', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('5118', '17', '19', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('5119', '17', '20', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('5120', '17', '21', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('5121', '17', '22', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('5122', '17', '23', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('5123', '17', '24', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('5124', '17', '25', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('5125', '17', '26', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('5126', '17', '27', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('5127', '17', '28', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('5128', '17', '29', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('5129', '17', '30', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('5130', '17', '31', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('5131', '17', '32', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('5132', '17', '33', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('5133', '17', '34', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('5134', '17', '35', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('5135', '17', '36', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('5136', '17', '37', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('5137', '17', '38', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('5138', '17', '39', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('5139', '17', '40', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('5140', '17', '41', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('5141', '17', '42', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('5142', '17', '43', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('5143', '17', '44', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('5144', '17', '45', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('5145', '17', '46', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('5146', '17', '47', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('5147', '17', '48', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('5148', '17', '49', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('5149', '17', '50', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('5150', '17', '51', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('5151', '17', '52', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('5152', '17', '53', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('5153', '17', '54', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('5154', '17', '55', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('5155', '17', '56', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('5156', '17', '57', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('5157', '17', '58', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('5158', '17', '59', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('5159', '17', '60', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('5160', '17', '61', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('5161', '17', '62', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('5162', '17', '63', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('5163', '17', '64', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('5164', '17', '65', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('5165', '17', '66', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('5166', '17', '67', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('5167', '17', '68', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('5168', '17', '69', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('5169', '17', '70', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('5170', '17', '71', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('5171', '17', '72', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('5172', '17', '73', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('5173', '17', '74', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('5174', '17', '75', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('5175', '17', '76', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('5176', '17', '77', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('5177', '17', '78', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('5178', '17', '79', '22:10:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('5179', '17', '80', '22:20:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('5180', '17', '81', '22:30:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('5181', '17', '82', '22:40:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('5182', '17', '83', '22:50:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('5183', '17', '84', '23:00:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('4197', '26', '198', '06:36:00', '06:36:00');
INSERT INTO `ssc_data_time` VALUES ('4196', '26', '197', '06:34:00', '06:34:00');
INSERT INTO `ssc_data_time` VALUES ('4195', '26', '196', '06:32:00', '06:32:00');
INSERT INTO `ssc_data_time` VALUES ('4194', '26', '195', '06:30:00', '06:30:00');
INSERT INTO `ssc_data_time` VALUES ('4193', '26', '194', '06:28:00', '06:28:00');
INSERT INTO `ssc_data_time` VALUES ('4192', '26', '193', '06:26:00', '06:26:00');
INSERT INTO `ssc_data_time` VALUES ('4191', '26', '192', '06:24:00', '06:24:00');
INSERT INTO `ssc_data_time` VALUES ('4190', '26', '191', '06:22:00', '06:22:00');
INSERT INTO `ssc_data_time` VALUES ('4189', '26', '190', '06:20:00', '06:20:00');
INSERT INTO `ssc_data_time` VALUES ('4188', '26', '189', '06:18:00', '06:18:00');
INSERT INTO `ssc_data_time` VALUES ('4187', '26', '188', '06:16:00', '06:16:00');
INSERT INTO `ssc_data_time` VALUES ('4186', '26', '187', '06:14:00', '06:14:00');
INSERT INTO `ssc_data_time` VALUES ('4185', '26', '186', '06:12:00', '06:12:00');
INSERT INTO `ssc_data_time` VALUES ('4184', '26', '185', '06:10:00', '06:10:00');
INSERT INTO `ssc_data_time` VALUES ('4183', '26', '184', '06:08:00', '06:08:00');
INSERT INTO `ssc_data_time` VALUES ('4182', '26', '183', '06:06:00', '06:06:00');
INSERT INTO `ssc_data_time` VALUES ('4181', '26', '182', '06:04:00', '06:04:00');
INSERT INTO `ssc_data_time` VALUES ('4180', '26', '181', '06:02:00', '06:02:00');
INSERT INTO `ssc_data_time` VALUES ('4179', '26', '180', '06:00:00', '06:00:00');
INSERT INTO `ssc_data_time` VALUES ('4178', '26', '179', '05:58:00', '05:58:00');
INSERT INTO `ssc_data_time` VALUES ('4177', '26', '178', '05:56:00', '05:56:00');
INSERT INTO `ssc_data_time` VALUES ('4176', '26', '177', '05:54:00', '05:54:00');
INSERT INTO `ssc_data_time` VALUES ('4175', '26', '176', '05:52:00', '05:52:00');
INSERT INTO `ssc_data_time` VALUES ('4174', '26', '175', '05:50:00', '05:50:00');
INSERT INTO `ssc_data_time` VALUES ('4173', '26', '174', '05:48:00', '05:48:00');
INSERT INTO `ssc_data_time` VALUES ('4172', '26', '173', '05:46:00', '05:46:00');
INSERT INTO `ssc_data_time` VALUES ('4171', '26', '172', '05:44:00', '05:44:00');
INSERT INTO `ssc_data_time` VALUES ('4170', '26', '171', '05:42:00', '05:42:00');
INSERT INTO `ssc_data_time` VALUES ('4169', '26', '170', '05:40:00', '05:40:00');
INSERT INTO `ssc_data_time` VALUES ('4168', '26', '169', '05:38:00', '05:38:00');
INSERT INTO `ssc_data_time` VALUES ('4167', '26', '168', '05:36:00', '05:36:00');
INSERT INTO `ssc_data_time` VALUES ('4166', '26', '167', '05:34:00', '05:34:00');
INSERT INTO `ssc_data_time` VALUES ('4165', '26', '166', '05:32:00', '05:32:00');
INSERT INTO `ssc_data_time` VALUES ('4164', '26', '165', '05:30:00', '05:30:00');
INSERT INTO `ssc_data_time` VALUES ('4163', '26', '164', '05:28:00', '05:28:00');
INSERT INTO `ssc_data_time` VALUES ('4162', '26', '163', '05:26:00', '05:26:00');
INSERT INTO `ssc_data_time` VALUES ('4161', '26', '162', '05:24:00', '05:24:00');
INSERT INTO `ssc_data_time` VALUES ('4160', '26', '161', '05:22:00', '05:22:00');
INSERT INTO `ssc_data_time` VALUES ('4159', '26', '160', '05:20:00', '05:20:00');
INSERT INTO `ssc_data_time` VALUES ('4158', '26', '159', '05:18:00', '05:18:00');
INSERT INTO `ssc_data_time` VALUES ('4157', '26', '158', '05:16:00', '05:16:00');
INSERT INTO `ssc_data_time` VALUES ('4156', '26', '157', '05:14:00', '05:14:00');
INSERT INTO `ssc_data_time` VALUES ('4155', '26', '156', '05:12:00', '05:12:00');
INSERT INTO `ssc_data_time` VALUES ('4154', '26', '155', '05:10:00', '05:10:00');
INSERT INTO `ssc_data_time` VALUES ('4153', '26', '154', '05:08:00', '05:08:00');
INSERT INTO `ssc_data_time` VALUES ('4152', '26', '153', '05:06:00', '05:06:00');
INSERT INTO `ssc_data_time` VALUES ('4151', '26', '152', '05:04:00', '05:04:00');
INSERT INTO `ssc_data_time` VALUES ('4150', '26', '151', '05:02:00', '05:02:00');
INSERT INTO `ssc_data_time` VALUES ('4149', '26', '150', '05:00:00', '05:00:00');
INSERT INTO `ssc_data_time` VALUES ('4148', '26', '149', '04:58:00', '04:58:00');
INSERT INTO `ssc_data_time` VALUES ('4147', '26', '148', '04:56:00', '04:56:00');
INSERT INTO `ssc_data_time` VALUES ('4146', '26', '147', '04:54:00', '04:54:00');
INSERT INTO `ssc_data_time` VALUES ('4145', '26', '146', '04:52:00', '04:52:00');
INSERT INTO `ssc_data_time` VALUES ('4144', '26', '145', '04:50:00', '04:50:00');
INSERT INTO `ssc_data_time` VALUES ('4143', '26', '144', '04:48:00', '04:48:00');
INSERT INTO `ssc_data_time` VALUES ('4142', '26', '143', '04:46:00', '04:46:00');
INSERT INTO `ssc_data_time` VALUES ('4141', '26', '142', '04:44:00', '04:44:00');
INSERT INTO `ssc_data_time` VALUES ('4140', '26', '141', '04:42:00', '04:42:00');
INSERT INTO `ssc_data_time` VALUES ('4139', '26', '140', '04:40:00', '04:40:00');
INSERT INTO `ssc_data_time` VALUES ('4138', '26', '139', '04:38:00', '04:38:00');
INSERT INTO `ssc_data_time` VALUES ('4137', '26', '138', '04:36:00', '04:36:00');
INSERT INTO `ssc_data_time` VALUES ('4136', '26', '137', '04:34:00', '04:34:00');
INSERT INTO `ssc_data_time` VALUES ('4135', '26', '136', '04:32:00', '04:32:00');
INSERT INTO `ssc_data_time` VALUES ('4134', '26', '135', '04:30:00', '04:30:00');
INSERT INTO `ssc_data_time` VALUES ('4133', '26', '134', '04:28:00', '04:28:00');
INSERT INTO `ssc_data_time` VALUES ('4132', '26', '133', '04:26:00', '04:26:00');
INSERT INTO `ssc_data_time` VALUES ('4131', '26', '132', '04:24:00', '04:24:00');
INSERT INTO `ssc_data_time` VALUES ('4130', '26', '131', '04:22:00', '04:22:00');
INSERT INTO `ssc_data_time` VALUES ('4129', '26', '130', '04:20:00', '04:20:00');
INSERT INTO `ssc_data_time` VALUES ('4128', '26', '129', '04:18:00', '04:18:00');
INSERT INTO `ssc_data_time` VALUES ('4127', '26', '128', '04:16:00', '04:16:00');
INSERT INTO `ssc_data_time` VALUES ('4126', '26', '127', '04:14:00', '04:14:00');
INSERT INTO `ssc_data_time` VALUES ('4125', '26', '126', '04:12:00', '04:12:00');
INSERT INTO `ssc_data_time` VALUES ('4124', '26', '125', '04:10:00', '04:10:00');
INSERT INTO `ssc_data_time` VALUES ('4123', '26', '124', '04:08:00', '04:08:00');
INSERT INTO `ssc_data_time` VALUES ('4122', '26', '123', '04:06:00', '04:06:00');
INSERT INTO `ssc_data_time` VALUES ('4121', '26', '122', '04:04:00', '04:04:00');
INSERT INTO `ssc_data_time` VALUES ('4120', '26', '121', '04:02:00', '04:02:00');
INSERT INTO `ssc_data_time` VALUES ('4119', '26', '120', '04:00:00', '04:00:00');
INSERT INTO `ssc_data_time` VALUES ('4118', '26', '119', '03:58:00', '03:58:00');
INSERT INTO `ssc_data_time` VALUES ('4117', '26', '118', '03:56:00', '03:56:00');
INSERT INTO `ssc_data_time` VALUES ('4116', '26', '117', '03:54:00', '03:54:00');
INSERT INTO `ssc_data_time` VALUES ('4115', '26', '116', '03:52:00', '03:52:00');
INSERT INTO `ssc_data_time` VALUES ('4114', '26', '115', '03:50:00', '03:50:00');
INSERT INTO `ssc_data_time` VALUES ('4113', '26', '114', '03:48:00', '03:48:00');
INSERT INTO `ssc_data_time` VALUES ('4112', '26', '113', '03:46:00', '03:46:00');
INSERT INTO `ssc_data_time` VALUES ('4111', '26', '112', '03:44:00', '03:44:00');
INSERT INTO `ssc_data_time` VALUES ('4110', '26', '111', '03:42:00', '03:42:00');
INSERT INTO `ssc_data_time` VALUES ('4109', '26', '110', '03:40:00', '03:40:00');
INSERT INTO `ssc_data_time` VALUES ('4108', '26', '109', '03:38:00', '03:38:00');
INSERT INTO `ssc_data_time` VALUES ('4107', '26', '108', '03:36:00', '03:36:00');
INSERT INTO `ssc_data_time` VALUES ('4106', '26', '107', '03:34:00', '03:34:00');
INSERT INTO `ssc_data_time` VALUES ('4105', '26', '106', '03:32:00', '03:32:00');
INSERT INTO `ssc_data_time` VALUES ('4104', '26', '105', '03:30:00', '03:30:00');
INSERT INTO `ssc_data_time` VALUES ('4103', '26', '104', '03:28:00', '03:28:00');
INSERT INTO `ssc_data_time` VALUES ('4102', '26', '103', '03:26:00', '03:26:00');
INSERT INTO `ssc_data_time` VALUES ('4101', '26', '102', '03:24:00', '03:24:00');
INSERT INTO `ssc_data_time` VALUES ('1012', '19', '1', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('1013', '19', '2', '09:25:00', '09:25:00');
INSERT INTO `ssc_data_time` VALUES ('1014', '19', '3', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('1015', '19', '4', '09:55:00', '09:55:00');
INSERT INTO `ssc_data_time` VALUES ('1016', '19', '5', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('1017', '19', '6', '10:25:00', '10:25:00');
INSERT INTO `ssc_data_time` VALUES ('1018', '19', '7', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('1019', '19', '8', '10:55:00', '10:55:00');
INSERT INTO `ssc_data_time` VALUES ('1020', '19', '9', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('1021', '19', '10', '11:25:00', '11:25:00');
INSERT INTO `ssc_data_time` VALUES ('1022', '19', '11', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('1023', '19', '12', '11:55:00', '11:55:00');
INSERT INTO `ssc_data_time` VALUES ('1024', '19', '13', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('1025', '19', '14', '12:25:00', '12:25:00');
INSERT INTO `ssc_data_time` VALUES ('1026', '19', '15', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('1027', '19', '16', '12:55:00', '12:55:00');
INSERT INTO `ssc_data_time` VALUES ('1028', '19', '17', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('1029', '19', '18', '13:25:00', '13:25:00');
INSERT INTO `ssc_data_time` VALUES ('1030', '19', '19', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('1031', '19', '20', '13:55:00', '13:55:00');
INSERT INTO `ssc_data_time` VALUES ('1032', '19', '21', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('1033', '19', '22', '14:25:00', '14:25:00');
INSERT INTO `ssc_data_time` VALUES ('1034', '19', '23', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('1035', '19', '24', '14:55:00', '14:55:00');
INSERT INTO `ssc_data_time` VALUES ('1036', '19', '25', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('1037', '19', '26', '15:25:00', '15:25:00');
INSERT INTO `ssc_data_time` VALUES ('1038', '19', '27', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('1039', '19', '28', '15:55:00', '15:55:00');
INSERT INTO `ssc_data_time` VALUES ('1040', '19', '29', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('1041', '19', '30', '16:25:00', '16:25:00');
INSERT INTO `ssc_data_time` VALUES ('1042', '19', '31', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('1043', '19', '32', '16:55:00', '16:55:00');
INSERT INTO `ssc_data_time` VALUES ('1044', '19', '33', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('1045', '19', '34', '17:25:00', '17:25:00');
INSERT INTO `ssc_data_time` VALUES ('1046', '19', '35', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('1047', '19', '36', '17:55:00', '17:55:00');
INSERT INTO `ssc_data_time` VALUES ('1048', '19', '37', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('1049', '19', '38', '18:25:00', '18:25:00');
INSERT INTO `ssc_data_time` VALUES ('1050', '19', '39', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('1051', '19', '40', '18:55:00', '18:55:00');
INSERT INTO `ssc_data_time` VALUES ('1052', '19', '41', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('1053', '19', '42', '19:25:00', '19:25:00');
INSERT INTO `ssc_data_time` VALUES ('1054', '19', '43', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('1055', '19', '44', '19:55:00', '19:55:00');
INSERT INTO `ssc_data_time` VALUES ('1056', '19', '45', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('1057', '19', '46', '20:25:00', '20:25:00');
INSERT INTO `ssc_data_time` VALUES ('1058', '19', '47', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('1059', '19', '48', '20:55:00', '20:55:00');
INSERT INTO `ssc_data_time` VALUES ('1060', '19', '49', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('1061', '19', '50', '21:25:00', '21:25:00');
INSERT INTO `ssc_data_time` VALUES ('1062', '20', '1', '09:07:00', '09:07:00');
INSERT INTO `ssc_data_time` VALUES ('1063', '20', '2', '09:12:00', '09:12:00');
INSERT INTO `ssc_data_time` VALUES ('1064', '20', '3', '09:17:00', '09:17:00');
INSERT INTO `ssc_data_time` VALUES ('1065', '20', '4', '09:22:00', '09:22:00');
INSERT INTO `ssc_data_time` VALUES ('1066', '20', '5', '09:27:00', '09:27:00');
INSERT INTO `ssc_data_time` VALUES ('1067', '20', '6', '09:32:00', '09:32:00');
INSERT INTO `ssc_data_time` VALUES ('1068', '20', '7', '09:37:00', '09:37:00');
INSERT INTO `ssc_data_time` VALUES ('1069', '20', '8', '09:42:00', '09:42:00');
INSERT INTO `ssc_data_time` VALUES ('1070', '20', '9', '09:47:00', '09:47:00');
INSERT INTO `ssc_data_time` VALUES ('1071', '20', '10', '09:52:00', '09:52:00');
INSERT INTO `ssc_data_time` VALUES ('1072', '20', '11', '09:57:00', '09:57:00');
INSERT INTO `ssc_data_time` VALUES ('1073', '20', '12', '10:02:00', '10:02:00');
INSERT INTO `ssc_data_time` VALUES ('1074', '20', '13', '10:07:00', '10:07:00');
INSERT INTO `ssc_data_time` VALUES ('1075', '20', '14', '10:12:00', '10:12:00');
INSERT INTO `ssc_data_time` VALUES ('1076', '20', '15', '10:17:00', '10:17:00');
INSERT INTO `ssc_data_time` VALUES ('1077', '20', '16', '10:22:00', '10:22:00');
INSERT INTO `ssc_data_time` VALUES ('1078', '20', '17', '10:27:00', '10:27:00');
INSERT INTO `ssc_data_time` VALUES ('1079', '20', '18', '10:32:00', '10:32:00');
INSERT INTO `ssc_data_time` VALUES ('1080', '20', '19', '10:37:00', '10:37:00');
INSERT INTO `ssc_data_time` VALUES ('1081', '20', '20', '10:42:00', '10:42:00');
INSERT INTO `ssc_data_time` VALUES ('1082', '20', '21', '10:47:00', '10:47:00');
INSERT INTO `ssc_data_time` VALUES ('1083', '20', '22', '10:52:00', '10:52:00');
INSERT INTO `ssc_data_time` VALUES ('1084', '20', '23', '10:57:00', '10:57:00');
INSERT INTO `ssc_data_time` VALUES ('1085', '20', '24', '11:02:00', '11:02:00');
INSERT INTO `ssc_data_time` VALUES ('1086', '20', '25', '11:07:00', '11:07:00');
INSERT INTO `ssc_data_time` VALUES ('1087', '20', '26', '11:12:00', '11:12:00');
INSERT INTO `ssc_data_time` VALUES ('1088', '20', '27', '11:17:00', '11:17:00');
INSERT INTO `ssc_data_time` VALUES ('1089', '20', '28', '11:22:00', '11:22:00');
INSERT INTO `ssc_data_time` VALUES ('1090', '20', '29', '11:27:00', '11:27:00');
INSERT INTO `ssc_data_time` VALUES ('1091', '20', '30', '11:32:00', '11:32:00');
INSERT INTO `ssc_data_time` VALUES ('1092', '20', '31', '11:37:00', '11:37:00');
INSERT INTO `ssc_data_time` VALUES ('1093', '20', '32', '11:42:00', '11:42:00');
INSERT INTO `ssc_data_time` VALUES ('1094', '20', '33', '11:47:00', '11:47:00');
INSERT INTO `ssc_data_time` VALUES ('1095', '20', '34', '11:52:00', '11:52:00');
INSERT INTO `ssc_data_time` VALUES ('1096', '20', '35', '11:57:00', '11:57:00');
INSERT INTO `ssc_data_time` VALUES ('1097', '20', '36', '12:02:00', '12:02:00');
INSERT INTO `ssc_data_time` VALUES ('1098', '20', '37', '12:07:00', '12:07:00');
INSERT INTO `ssc_data_time` VALUES ('1099', '20', '38', '12:12:00', '12:12:00');
INSERT INTO `ssc_data_time` VALUES ('1100', '20', '39', '12:17:00', '12:17:00');
INSERT INTO `ssc_data_time` VALUES ('1101', '20', '40', '12:22:00', '12:22:00');
INSERT INTO `ssc_data_time` VALUES ('1102', '20', '41', '12:27:00', '12:27:00');
INSERT INTO `ssc_data_time` VALUES ('1103', '20', '42', '12:32:00', '12:32:00');
INSERT INTO `ssc_data_time` VALUES ('1104', '20', '43', '12:37:00', '12:37:00');
INSERT INTO `ssc_data_time` VALUES ('1105', '20', '44', '12:42:00', '12:42:00');
INSERT INTO `ssc_data_time` VALUES ('1106', '20', '45', '12:47:00', '12:47:00');
INSERT INTO `ssc_data_time` VALUES ('1107', '20', '46', '12:52:00', '12:52:00');
INSERT INTO `ssc_data_time` VALUES ('1108', '20', '47', '12:57:00', '12:57:00');
INSERT INTO `ssc_data_time` VALUES ('1109', '20', '48', '13:02:00', '13:02:00');
INSERT INTO `ssc_data_time` VALUES ('1110', '20', '49', '13:07:00', '13:07:00');
INSERT INTO `ssc_data_time` VALUES ('1111', '20', '50', '13:12:00', '13:12:00');
INSERT INTO `ssc_data_time` VALUES ('1112', '20', '51', '13:17:00', '13:17:00');
INSERT INTO `ssc_data_time` VALUES ('1113', '20', '52', '13:22:00', '13:22:00');
INSERT INTO `ssc_data_time` VALUES ('1114', '20', '53', '13:27:00', '13:27:00');
INSERT INTO `ssc_data_time` VALUES ('1115', '20', '54', '13:32:00', '13:32:00');
INSERT INTO `ssc_data_time` VALUES ('1116', '20', '55', '13:37:00', '13:37:00');
INSERT INTO `ssc_data_time` VALUES ('1117', '20', '56', '13:42:00', '13:42:00');
INSERT INTO `ssc_data_time` VALUES ('1118', '20', '57', '13:47:00', '13:47:00');
INSERT INTO `ssc_data_time` VALUES ('1119', '20', '58', '13:52:00', '13:52:00');
INSERT INTO `ssc_data_time` VALUES ('1120', '20', '59', '13:57:00', '13:57:00');
INSERT INTO `ssc_data_time` VALUES ('1121', '20', '60', '14:02:00', '14:02:00');
INSERT INTO `ssc_data_time` VALUES ('1122', '20', '61', '14:07:00', '14:07:00');
INSERT INTO `ssc_data_time` VALUES ('1123', '20', '62', '14:12:00', '14:12:00');
INSERT INTO `ssc_data_time` VALUES ('1124', '20', '63', '14:17:00', '14:17:00');
INSERT INTO `ssc_data_time` VALUES ('1125', '20', '64', '14:22:00', '14:22:00');
INSERT INTO `ssc_data_time` VALUES ('1126', '20', '65', '14:27:00', '14:27:00');
INSERT INTO `ssc_data_time` VALUES ('1127', '20', '66', '14:32:00', '14:32:00');
INSERT INTO `ssc_data_time` VALUES ('1128', '20', '67', '14:37:00', '14:37:00');
INSERT INTO `ssc_data_time` VALUES ('1129', '20', '68', '14:42:00', '14:42:00');
INSERT INTO `ssc_data_time` VALUES ('1130', '20', '69', '14:47:00', '14:47:00');
INSERT INTO `ssc_data_time` VALUES ('1131', '20', '70', '14:52:00', '14:52:00');
INSERT INTO `ssc_data_time` VALUES ('1132', '20', '71', '14:57:00', '14:57:00');
INSERT INTO `ssc_data_time` VALUES ('1133', '20', '72', '15:02:00', '15:02:00');
INSERT INTO `ssc_data_time` VALUES ('1134', '20', '73', '15:07:00', '15:07:00');
INSERT INTO `ssc_data_time` VALUES ('1135', '20', '74', '15:12:00', '15:12:00');
INSERT INTO `ssc_data_time` VALUES ('1136', '20', '75', '15:17:00', '15:17:00');
INSERT INTO `ssc_data_time` VALUES ('1137', '20', '76', '15:22:00', '15:22:00');
INSERT INTO `ssc_data_time` VALUES ('1138', '20', '77', '15:27:00', '15:27:00');
INSERT INTO `ssc_data_time` VALUES ('1139', '20', '78', '15:32:00', '15:32:00');
INSERT INTO `ssc_data_time` VALUES ('1140', '20', '79', '15:37:00', '15:37:00');
INSERT INTO `ssc_data_time` VALUES ('1141', '20', '80', '15:42:00', '15:42:00');
INSERT INTO `ssc_data_time` VALUES ('1142', '20', '81', '15:47:00', '15:47:00');
INSERT INTO `ssc_data_time` VALUES ('1143', '20', '82', '15:52:00', '15:52:00');
INSERT INTO `ssc_data_time` VALUES ('1144', '20', '83', '15:57:00', '15:57:00');
INSERT INTO `ssc_data_time` VALUES ('1145', '20', '84', '16:02:00', '16:02:00');
INSERT INTO `ssc_data_time` VALUES ('1146', '20', '85', '16:07:00', '16:07:00');
INSERT INTO `ssc_data_time` VALUES ('1147', '20', '86', '16:12:00', '16:12:00');
INSERT INTO `ssc_data_time` VALUES ('1148', '20', '87', '16:17:00', '16:17:00');
INSERT INTO `ssc_data_time` VALUES ('1149', '20', '88', '16:22:00', '16:22:00');
INSERT INTO `ssc_data_time` VALUES ('1150', '20', '89', '16:27:00', '16:27:00');
INSERT INTO `ssc_data_time` VALUES ('1151', '20', '90', '16:32:00', '16:32:00');
INSERT INTO `ssc_data_time` VALUES ('1152', '20', '91', '16:37:00', '16:37:00');
INSERT INTO `ssc_data_time` VALUES ('1153', '20', '92', '16:42:00', '16:42:00');
INSERT INTO `ssc_data_time` VALUES ('1154', '20', '93', '16:47:00', '16:47:00');
INSERT INTO `ssc_data_time` VALUES ('1155', '20', '94', '16:52:00', '16:52:00');
INSERT INTO `ssc_data_time` VALUES ('1156', '20', '95', '16:57:00', '16:57:00');
INSERT INTO `ssc_data_time` VALUES ('1157', '20', '96', '17:02:00', '17:02:00');
INSERT INTO `ssc_data_time` VALUES ('1158', '20', '97', '17:07:00', '17:07:00');
INSERT INTO `ssc_data_time` VALUES ('1159', '20', '98', '17:12:00', '17:12:00');
INSERT INTO `ssc_data_time` VALUES ('1160', '20', '99', '17:17:00', '17:17:00');
INSERT INTO `ssc_data_time` VALUES ('1161', '20', '100', '17:22:00', '17:22:00');
INSERT INTO `ssc_data_time` VALUES ('1162', '20', '101', '17:27:00', '17:27:00');
INSERT INTO `ssc_data_time` VALUES ('1163', '20', '102', '17:32:00', '17:32:00');
INSERT INTO `ssc_data_time` VALUES ('1164', '20', '103', '17:37:00', '17:37:00');
INSERT INTO `ssc_data_time` VALUES ('1165', '20', '104', '17:42:00', '17:42:00');
INSERT INTO `ssc_data_time` VALUES ('1166', '20', '105', '17:47:00', '17:47:00');
INSERT INTO `ssc_data_time` VALUES ('1167', '20', '106', '17:52:00', '17:52:00');
INSERT INTO `ssc_data_time` VALUES ('1168', '20', '107', '17:57:00', '17:57:00');
INSERT INTO `ssc_data_time` VALUES ('1169', '20', '108', '18:02:00', '18:02:00');
INSERT INTO `ssc_data_time` VALUES ('1170', '20', '109', '18:07:00', '18:07:00');
INSERT INTO `ssc_data_time` VALUES ('1171', '20', '110', '18:12:00', '18:12:00');
INSERT INTO `ssc_data_time` VALUES ('1172', '20', '111', '18:17:00', '18:17:00');
INSERT INTO `ssc_data_time` VALUES ('1173', '20', '112', '18:22:00', '18:22:00');
INSERT INTO `ssc_data_time` VALUES ('1174', '20', '113', '18:27:00', '18:27:00');
INSERT INTO `ssc_data_time` VALUES ('1175', '20', '114', '18:32:00', '18:32:00');
INSERT INTO `ssc_data_time` VALUES ('1176', '20', '115', '18:37:00', '18:37:00');
INSERT INTO `ssc_data_time` VALUES ('1177', '20', '116', '18:42:00', '18:42:00');
INSERT INTO `ssc_data_time` VALUES ('1178', '20', '117', '18:47:00', '18:47:00');
INSERT INTO `ssc_data_time` VALUES ('1179', '20', '118', '18:52:00', '18:52:00');
INSERT INTO `ssc_data_time` VALUES ('1180', '20', '119', '18:57:00', '18:57:00');
INSERT INTO `ssc_data_time` VALUES ('1181', '20', '120', '19:02:00', '19:02:00');
INSERT INTO `ssc_data_time` VALUES ('1182', '20', '121', '19:07:00', '19:07:00');
INSERT INTO `ssc_data_time` VALUES ('1183', '20', '122', '19:12:00', '19:12:00');
INSERT INTO `ssc_data_time` VALUES ('1184', '20', '123', '19:17:00', '19:17:00');
INSERT INTO `ssc_data_time` VALUES ('1185', '20', '124', '19:22:00', '19:22:00');
INSERT INTO `ssc_data_time` VALUES ('1186', '20', '125', '19:27:00', '19:27:00');
INSERT INTO `ssc_data_time` VALUES ('1187', '20', '126', '19:32:00', '19:32:00');
INSERT INTO `ssc_data_time` VALUES ('1188', '20', '127', '19:37:00', '19:37:00');
INSERT INTO `ssc_data_time` VALUES ('1189', '20', '128', '19:42:00', '19:42:00');
INSERT INTO `ssc_data_time` VALUES ('1190', '20', '129', '19:47:00', '19:47:00');
INSERT INTO `ssc_data_time` VALUES ('1191', '20', '130', '19:52:00', '19:52:00');
INSERT INTO `ssc_data_time` VALUES ('1192', '20', '131', '19:57:00', '19:57:00');
INSERT INTO `ssc_data_time` VALUES ('1193', '20', '132', '20:02:00', '20:02:00');
INSERT INTO `ssc_data_time` VALUES ('1194', '20', '133', '20:07:00', '20:07:00');
INSERT INTO `ssc_data_time` VALUES ('1195', '20', '134', '20:12:00', '20:12:00');
INSERT INTO `ssc_data_time` VALUES ('1196', '20', '135', '20:17:00', '20:17:00');
INSERT INTO `ssc_data_time` VALUES ('1197', '20', '136', '20:22:00', '20:22:00');
INSERT INTO `ssc_data_time` VALUES ('1198', '20', '137', '20:27:00', '20:27:00');
INSERT INTO `ssc_data_time` VALUES ('1199', '20', '138', '20:32:00', '20:32:00');
INSERT INTO `ssc_data_time` VALUES ('1200', '20', '139', '20:37:00', '20:37:00');
INSERT INTO `ssc_data_time` VALUES ('1201', '20', '140', '20:42:00', '20:42:00');
INSERT INTO `ssc_data_time` VALUES ('1202', '20', '141', '20:47:00', '20:47:00');
INSERT INTO `ssc_data_time` VALUES ('1203', '20', '142', '20:52:00', '20:52:00');
INSERT INTO `ssc_data_time` VALUES ('1204', '20', '143', '20:57:00', '20:57:00');
INSERT INTO `ssc_data_time` VALUES ('1205', '20', '144', '21:02:00', '21:02:00');
INSERT INTO `ssc_data_time` VALUES ('1206', '20', '145', '21:07:00', '21:07:00');
INSERT INTO `ssc_data_time` VALUES ('1207', '20', '146', '21:12:00', '21:12:00');
INSERT INTO `ssc_data_time` VALUES ('1208', '20', '147', '21:17:00', '21:17:00');
INSERT INTO `ssc_data_time` VALUES ('1209', '20', '148', '21:22:00', '21:22:00');
INSERT INTO `ssc_data_time` VALUES ('1210', '20', '149', '21:27:00', '21:27:00');
INSERT INTO `ssc_data_time` VALUES ('1211', '20', '150', '21:32:00', '21:32:00');
INSERT INTO `ssc_data_time` VALUES ('1212', '20', '151', '21:37:00', '21:37:00');
INSERT INTO `ssc_data_time` VALUES ('1213', '20', '152', '21:42:00', '21:42:00');
INSERT INTO `ssc_data_time` VALUES ('1214', '20', '153', '21:47:00', '21:47:00');
INSERT INTO `ssc_data_time` VALUES ('1215', '20', '154', '21:52:00', '21:52:00');
INSERT INTO `ssc_data_time` VALUES ('1216', '20', '155', '21:57:00', '21:57:00');
INSERT INTO `ssc_data_time` VALUES ('1217', '20', '156', '22:02:00', '22:02:00');
INSERT INTO `ssc_data_time` VALUES ('1218', '20', '157', '22:07:00', '22:07:00');
INSERT INTO `ssc_data_time` VALUES ('1219', '20', '158', '22:12:00', '22:12:00');
INSERT INTO `ssc_data_time` VALUES ('1220', '20', '159', '22:17:00', '22:17:00');
INSERT INTO `ssc_data_time` VALUES ('1221', '20', '160', '22:22:00', '22:22:00');
INSERT INTO `ssc_data_time` VALUES ('1222', '20', '161', '22:27:00', '22:27:00');
INSERT INTO `ssc_data_time` VALUES ('1223', '20', '162', '22:32:00', '22:32:00');
INSERT INTO `ssc_data_time` VALUES ('1224', '20', '163', '22:37:00', '22:37:00');
INSERT INTO `ssc_data_time` VALUES ('1225', '20', '164', '22:42:00', '22:42:00');
INSERT INTO `ssc_data_time` VALUES ('1226', '20', '165', '22:47:00', '22:47:00');
INSERT INTO `ssc_data_time` VALUES ('1227', '20', '166', '22:52:00', '22:52:00');
INSERT INTO `ssc_data_time` VALUES ('1228', '20', '167', '22:57:00', '22:57:00');
INSERT INTO `ssc_data_time` VALUES ('1229', '20', '168', '23:02:00', '23:02:00');
INSERT INTO `ssc_data_time` VALUES ('1230', '20', '169', '23:07:00', '23:07:00');
INSERT INTO `ssc_data_time` VALUES ('1231', '20', '170', '23:12:00', '23:12:00');
INSERT INTO `ssc_data_time` VALUES ('1232', '20', '171', '23:17:00', '23:17:00');
INSERT INTO `ssc_data_time` VALUES ('1233', '20', '172', '23:22:00', '23:22:00');
INSERT INTO `ssc_data_time` VALUES ('1234', '20', '173', '23:27:00', '23:27:00');
INSERT INTO `ssc_data_time` VALUES ('1235', '20', '174', '23:32:00', '23:32:00');
INSERT INTO `ssc_data_time` VALUES ('1236', '20', '175', '23:37:00', '23:37:00');
INSERT INTO `ssc_data_time` VALUES ('1237', '20', '176', '23:42:00', '23:42:00');
INSERT INTO `ssc_data_time` VALUES ('1238', '20', '177', '23:47:00', '23:47:00');
INSERT INTO `ssc_data_time` VALUES ('1239', '20', '178', '23:52:00', '23:52:00');
INSERT INTO `ssc_data_time` VALUES ('1240', '20', '179', '23:57:00', '23:57:00');
INSERT INTO `ssc_data_time` VALUES ('4281', '26', '282', '09:24:00', '09:24:00');
INSERT INTO `ssc_data_time` VALUES ('4280', '26', '281', '09:22:00', '09:22:00');
INSERT INTO `ssc_data_time` VALUES ('4279', '26', '280', '09:20:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('4278', '26', '279', '09:18:00', '09:18:00');
INSERT INTO `ssc_data_time` VALUES ('4277', '26', '278', '09:16:00', '09:16:00');
INSERT INTO `ssc_data_time` VALUES ('4276', '26', '277', '09:14:00', '09:14:00');
INSERT INTO `ssc_data_time` VALUES ('4275', '26', '276', '09:12:00', '09:12:00');
INSERT INTO `ssc_data_time` VALUES ('4274', '26', '275', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('4273', '26', '274', '09:08:00', '09:08:00');
INSERT INTO `ssc_data_time` VALUES ('4272', '26', '273', '09:06:00', '09:06:00');
INSERT INTO `ssc_data_time` VALUES ('4271', '26', '272', '09:04:00', '09:04:00');
INSERT INTO `ssc_data_time` VALUES ('4270', '26', '271', '09:02:00', '09:02:00');
INSERT INTO `ssc_data_time` VALUES ('4269', '26', '270', '09:00:00', '09:00:00');
INSERT INTO `ssc_data_time` VALUES ('4268', '26', '269', '08:58:00', '08:58:00');
INSERT INTO `ssc_data_time` VALUES ('4267', '26', '268', '08:56:00', '08:56:00');
INSERT INTO `ssc_data_time` VALUES ('4266', '26', '267', '08:54:00', '08:54:00');
INSERT INTO `ssc_data_time` VALUES ('4265', '26', '266', '08:52:00', '08:52:00');
INSERT INTO `ssc_data_time` VALUES ('4264', '26', '265', '08:50:00', '08:50:00');
INSERT INTO `ssc_data_time` VALUES ('4263', '26', '264', '08:48:00', '08:48:00');
INSERT INTO `ssc_data_time` VALUES ('4262', '26', '263', '08:46:00', '08:46:00');
INSERT INTO `ssc_data_time` VALUES ('4261', '26', '262', '08:44:00', '08:44:00');
INSERT INTO `ssc_data_time` VALUES ('4260', '26', '261', '08:42:00', '08:42:00');
INSERT INTO `ssc_data_time` VALUES ('4259', '26', '260', '08:40:00', '08:40:00');
INSERT INTO `ssc_data_time` VALUES ('4258', '26', '259', '08:38:00', '08:38:00');
INSERT INTO `ssc_data_time` VALUES ('4257', '26', '258', '08:36:00', '08:36:00');
INSERT INTO `ssc_data_time` VALUES ('4256', '26', '257', '08:34:00', '08:34:00');
INSERT INTO `ssc_data_time` VALUES ('4255', '26', '256', '08:32:00', '08:32:00');
INSERT INTO `ssc_data_time` VALUES ('4254', '26', '255', '08:30:00', '08:30:00');
INSERT INTO `ssc_data_time` VALUES ('4253', '26', '254', '08:28:00', '08:28:00');
INSERT INTO `ssc_data_time` VALUES ('4252', '26', '253', '08:26:00', '08:26:00');
INSERT INTO `ssc_data_time` VALUES ('4251', '26', '252', '08:24:00', '08:24:00');
INSERT INTO `ssc_data_time` VALUES ('4250', '26', '251', '08:22:00', '08:22:00');
INSERT INTO `ssc_data_time` VALUES ('4249', '26', '250', '08:20:00', '08:20:00');
INSERT INTO `ssc_data_time` VALUES ('4248', '26', '249', '08:18:00', '08:18:00');
INSERT INTO `ssc_data_time` VALUES ('4247', '26', '248', '08:16:00', '08:16:00');
INSERT INTO `ssc_data_time` VALUES ('4246', '26', '247', '08:14:00', '08:14:00');
INSERT INTO `ssc_data_time` VALUES ('4245', '26', '246', '08:12:00', '08:12:00');
INSERT INTO `ssc_data_time` VALUES ('4244', '26', '245', '08:10:00', '08:10:00');
INSERT INTO `ssc_data_time` VALUES ('4243', '26', '244', '08:08:00', '08:08:00');
INSERT INTO `ssc_data_time` VALUES ('4242', '26', '243', '08:06:00', '08:06:00');
INSERT INTO `ssc_data_time` VALUES ('4241', '26', '242', '08:04:00', '08:04:00');
INSERT INTO `ssc_data_time` VALUES ('4240', '26', '241', '08:02:00', '08:02:00');
INSERT INTO `ssc_data_time` VALUES ('4239', '26', '240', '08:00:00', '08:00:00');
INSERT INTO `ssc_data_time` VALUES ('4238', '26', '239', '07:58:00', '07:58:00');
INSERT INTO `ssc_data_time` VALUES ('4237', '26', '238', '07:56:00', '07:56:00');
INSERT INTO `ssc_data_time` VALUES ('4236', '26', '237', '07:54:00', '07:54:00');
INSERT INTO `ssc_data_time` VALUES ('4235', '26', '236', '07:52:00', '07:52:00');
INSERT INTO `ssc_data_time` VALUES ('4234', '26', '235', '07:50:00', '07:50:00');
INSERT INTO `ssc_data_time` VALUES ('4233', '26', '234', '07:48:00', '07:48:00');
INSERT INTO `ssc_data_time` VALUES ('4232', '26', '233', '07:46:00', '07:46:00');
INSERT INTO `ssc_data_time` VALUES ('4231', '26', '232', '07:44:00', '07:44:00');
INSERT INTO `ssc_data_time` VALUES ('4230', '26', '231', '07:42:00', '07:42:00');
INSERT INTO `ssc_data_time` VALUES ('4229', '26', '230', '07:40:00', '07:40:00');
INSERT INTO `ssc_data_time` VALUES ('4228', '26', '229', '07:38:00', '07:38:00');
INSERT INTO `ssc_data_time` VALUES ('4227', '26', '228', '07:36:00', '07:36:00');
INSERT INTO `ssc_data_time` VALUES ('4226', '26', '227', '07:34:00', '07:34:00');
INSERT INTO `ssc_data_time` VALUES ('4225', '26', '226', '07:32:00', '07:32:00');
INSERT INTO `ssc_data_time` VALUES ('4224', '26', '225', '07:30:00', '07:30:00');
INSERT INTO `ssc_data_time` VALUES ('4223', '26', '224', '07:28:00', '07:28:00');
INSERT INTO `ssc_data_time` VALUES ('4222', '26', '223', '07:26:00', '07:26:00');
INSERT INTO `ssc_data_time` VALUES ('4221', '26', '222', '07:24:00', '07:24:00');
INSERT INTO `ssc_data_time` VALUES ('4220', '26', '221', '07:22:00', '07:22:00');
INSERT INTO `ssc_data_time` VALUES ('4219', '26', '220', '07:20:00', '07:20:00');
INSERT INTO `ssc_data_time` VALUES ('4218', '26', '219', '07:18:00', '07:18:00');
INSERT INTO `ssc_data_time` VALUES ('4217', '26', '218', '07:16:00', '07:16:00');
INSERT INTO `ssc_data_time` VALUES ('4216', '26', '217', '07:14:00', '07:14:00');
INSERT INTO `ssc_data_time` VALUES ('4215', '26', '216', '07:12:00', '07:12:00');
INSERT INTO `ssc_data_time` VALUES ('4214', '26', '215', '07:10:00', '07:10:00');
INSERT INTO `ssc_data_time` VALUES ('4213', '26', '214', '07:08:00', '07:08:00');
INSERT INTO `ssc_data_time` VALUES ('4212', '26', '213', '07:06:00', '07:06:00');
INSERT INTO `ssc_data_time` VALUES ('4211', '26', '212', '07:04:00', '07:04:00');
INSERT INTO `ssc_data_time` VALUES ('4210', '26', '211', '07:02:00', '07:02:00');
INSERT INTO `ssc_data_time` VALUES ('4209', '26', '210', '07:00:00', '07:00:00');
INSERT INTO `ssc_data_time` VALUES ('4208', '26', '209', '06:58:00', '06:58:00');
INSERT INTO `ssc_data_time` VALUES ('4207', '26', '208', '06:56:00', '06:56:00');
INSERT INTO `ssc_data_time` VALUES ('4206', '26', '207', '06:54:00', '06:54:00');
INSERT INTO `ssc_data_time` VALUES ('4205', '26', '206', '06:52:00', '06:52:00');
INSERT INTO `ssc_data_time` VALUES ('4204', '26', '205', '06:50:00', '06:50:00');
INSERT INTO `ssc_data_time` VALUES ('4203', '26', '204', '06:48:00', '06:48:00');
INSERT INTO `ssc_data_time` VALUES ('4202', '26', '203', '06:46:00', '06:46:00');
INSERT INTO `ssc_data_time` VALUES ('4201', '26', '202', '06:44:00', '06:44:00');
INSERT INTO `ssc_data_time` VALUES ('4200', '26', '201', '06:42:00', '06:42:00');
INSERT INTO `ssc_data_time` VALUES ('4199', '26', '200', '06:40:00', '06:40:00');
INSERT INTO `ssc_data_time` VALUES ('4198', '26', '199', '06:38:00', '06:38:00');
INSERT INTO `ssc_data_time` VALUES ('4364', '26', '365', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('4363', '26', '364', '12:08:00', '12:08:00');
INSERT INTO `ssc_data_time` VALUES ('4362', '26', '363', '12:06:00', '12:06:00');
INSERT INTO `ssc_data_time` VALUES ('4361', '26', '362', '12:04:00', '12:04:00');
INSERT INTO `ssc_data_time` VALUES ('4360', '26', '361', '12:02:00', '12:02:00');
INSERT INTO `ssc_data_time` VALUES ('4359', '26', '360', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('4358', '26', '359', '11:58:00', '11:58:00');
INSERT INTO `ssc_data_time` VALUES ('4357', '26', '358', '11:56:00', '11:56:00');
INSERT INTO `ssc_data_time` VALUES ('4356', '26', '357', '11:54:00', '11:54:00');
INSERT INTO `ssc_data_time` VALUES ('4355', '26', '356', '11:52:00', '11:52:00');
INSERT INTO `ssc_data_time` VALUES ('4354', '26', '355', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('4353', '26', '354', '11:48:00', '11:48:00');
INSERT INTO `ssc_data_time` VALUES ('4352', '26', '353', '11:46:00', '11:46:00');
INSERT INTO `ssc_data_time` VALUES ('4351', '26', '352', '11:44:00', '11:44:00');
INSERT INTO `ssc_data_time` VALUES ('4350', '26', '351', '11:42:00', '11:42:00');
INSERT INTO `ssc_data_time` VALUES ('4349', '26', '350', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('4348', '26', '349', '11:38:00', '11:38:00');
INSERT INTO `ssc_data_time` VALUES ('4347', '26', '348', '11:36:00', '11:36:00');
INSERT INTO `ssc_data_time` VALUES ('4346', '26', '347', '11:34:00', '11:34:00');
INSERT INTO `ssc_data_time` VALUES ('4345', '26', '346', '11:32:00', '11:32:00');
INSERT INTO `ssc_data_time` VALUES ('4344', '26', '345', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('4343', '26', '344', '11:28:00', '11:28:00');
INSERT INTO `ssc_data_time` VALUES ('4342', '26', '343', '11:26:00', '11:26:00');
INSERT INTO `ssc_data_time` VALUES ('4341', '26', '342', '11:24:00', '11:24:00');
INSERT INTO `ssc_data_time` VALUES ('4340', '26', '341', '11:22:00', '11:22:00');
INSERT INTO `ssc_data_time` VALUES ('4339', '26', '340', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('4338', '26', '339', '11:18:00', '11:18:00');
INSERT INTO `ssc_data_time` VALUES ('4337', '26', '338', '11:16:00', '11:16:00');
INSERT INTO `ssc_data_time` VALUES ('4336', '26', '337', '11:14:00', '11:14:00');
INSERT INTO `ssc_data_time` VALUES ('4335', '26', '336', '11:12:00', '11:12:00');
INSERT INTO `ssc_data_time` VALUES ('4334', '26', '335', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('4333', '26', '334', '11:08:00', '11:08:00');
INSERT INTO `ssc_data_time` VALUES ('4332', '26', '333', '11:06:00', '11:06:00');
INSERT INTO `ssc_data_time` VALUES ('4331', '26', '332', '11:04:00', '11:04:00');
INSERT INTO `ssc_data_time` VALUES ('4330', '26', '331', '11:02:00', '11:02:00');
INSERT INTO `ssc_data_time` VALUES ('4329', '26', '330', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('4328', '26', '329', '10:58:00', '10:58:00');
INSERT INTO `ssc_data_time` VALUES ('4327', '26', '328', '10:56:00', '10:56:00');
INSERT INTO `ssc_data_time` VALUES ('4326', '26', '327', '10:54:00', '10:54:00');
INSERT INTO `ssc_data_time` VALUES ('4325', '26', '326', '10:52:00', '10:52:00');
INSERT INTO `ssc_data_time` VALUES ('4324', '26', '325', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('4323', '26', '324', '10:48:00', '10:48:00');
INSERT INTO `ssc_data_time` VALUES ('4322', '26', '323', '10:46:00', '10:46:00');
INSERT INTO `ssc_data_time` VALUES ('4321', '26', '322', '10:44:00', '10:44:00');
INSERT INTO `ssc_data_time` VALUES ('4320', '26', '321', '10:42:00', '10:42:00');
INSERT INTO `ssc_data_time` VALUES ('4319', '26', '320', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('4318', '26', '319', '10:38:00', '10:38:00');
INSERT INTO `ssc_data_time` VALUES ('4317', '26', '318', '10:36:00', '10:36:00');
INSERT INTO `ssc_data_time` VALUES ('4316', '26', '317', '10:34:00', '10:34:00');
INSERT INTO `ssc_data_time` VALUES ('4315', '26', '316', '10:32:00', '10:32:00');
INSERT INTO `ssc_data_time` VALUES ('4314', '26', '315', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('4313', '26', '314', '10:28:00', '10:28:00');
INSERT INTO `ssc_data_time` VALUES ('4312', '26', '313', '10:26:00', '10:26:00');
INSERT INTO `ssc_data_time` VALUES ('4311', '26', '312', '10:24:00', '10:24:00');
INSERT INTO `ssc_data_time` VALUES ('4310', '26', '311', '10:22:00', '10:22:00');
INSERT INTO `ssc_data_time` VALUES ('4309', '26', '310', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('4308', '26', '309', '10:18:00', '10:18:00');
INSERT INTO `ssc_data_time` VALUES ('4307', '26', '308', '10:16:00', '10:16:00');
INSERT INTO `ssc_data_time` VALUES ('4306', '26', '307', '10:14:00', '10:14:00');
INSERT INTO `ssc_data_time` VALUES ('4305', '26', '306', '10:12:00', '10:12:00');
INSERT INTO `ssc_data_time` VALUES ('4304', '26', '305', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('4303', '26', '304', '10:08:00', '10:08:00');
INSERT INTO `ssc_data_time` VALUES ('4302', '26', '303', '10:06:00', '10:06:00');
INSERT INTO `ssc_data_time` VALUES ('4301', '26', '302', '10:04:00', '10:04:00');
INSERT INTO `ssc_data_time` VALUES ('4300', '26', '301', '10:02:00', '10:02:00');
INSERT INTO `ssc_data_time` VALUES ('4299', '26', '300', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('4298', '26', '299', '09:58:00', '09:58:00');
INSERT INTO `ssc_data_time` VALUES ('4297', '26', '298', '09:56:00', '09:56:00');
INSERT INTO `ssc_data_time` VALUES ('4296', '26', '297', '09:54:00', '09:54:00');
INSERT INTO `ssc_data_time` VALUES ('4295', '26', '296', '09:52:00', '09:52:00');
INSERT INTO `ssc_data_time` VALUES ('4294', '26', '295', '09:50:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('4293', '26', '294', '09:48:00', '09:48:00');
INSERT INTO `ssc_data_time` VALUES ('4292', '26', '293', '09:46:00', '09:46:00');
INSERT INTO `ssc_data_time` VALUES ('4291', '26', '292', '09:44:00', '09:44:00');
INSERT INTO `ssc_data_time` VALUES ('4290', '26', '291', '09:42:00', '09:42:00');
INSERT INTO `ssc_data_time` VALUES ('4289', '26', '290', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('4288', '26', '289', '09:38:00', '09:38:00');
INSERT INTO `ssc_data_time` VALUES ('4287', '26', '288', '09:36:00', '09:36:00');
INSERT INTO `ssc_data_time` VALUES ('4286', '26', '287', '09:34:00', '09:34:00');
INSERT INTO `ssc_data_time` VALUES ('4285', '26', '286', '09:32:00', '09:32:00');
INSERT INTO `ssc_data_time` VALUES ('4284', '26', '285', '09:30:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('4283', '26', '284', '09:28:00', '09:28:00');
INSERT INTO `ssc_data_time` VALUES ('4282', '26', '283', '09:26:00', '09:26:00');
INSERT INTO `ssc_data_time` VALUES ('4454', '26', '455', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('4453', '26', '454', '15:08:00', '15:08:00');
INSERT INTO `ssc_data_time` VALUES ('4452', '26', '453', '15:06:00', '15:06:00');
INSERT INTO `ssc_data_time` VALUES ('4451', '26', '452', '15:04:00', '15:04:00');
INSERT INTO `ssc_data_time` VALUES ('4450', '26', '451', '15:02:00', '15:02:00');
INSERT INTO `ssc_data_time` VALUES ('4449', '26', '450', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('4448', '26', '449', '14:58:00', '14:58:00');
INSERT INTO `ssc_data_time` VALUES ('4447', '26', '448', '14:56:00', '14:56:00');
INSERT INTO `ssc_data_time` VALUES ('4446', '26', '447', '14:54:00', '14:54:00');
INSERT INTO `ssc_data_time` VALUES ('4445', '26', '446', '14:52:00', '14:52:00');
INSERT INTO `ssc_data_time` VALUES ('4444', '26', '445', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('4443', '26', '444', '14:48:00', '14:48:00');
INSERT INTO `ssc_data_time` VALUES ('4442', '26', '443', '14:46:00', '14:46:00');
INSERT INTO `ssc_data_time` VALUES ('4441', '26', '442', '14:44:00', '14:44:00');
INSERT INTO `ssc_data_time` VALUES ('4440', '26', '441', '14:42:00', '14:42:00');
INSERT INTO `ssc_data_time` VALUES ('4439', '26', '440', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('4438', '26', '439', '14:38:00', '14:38:00');
INSERT INTO `ssc_data_time` VALUES ('4437', '26', '438', '14:36:00', '14:36:00');
INSERT INTO `ssc_data_time` VALUES ('4436', '26', '437', '14:34:00', '14:34:00');
INSERT INTO `ssc_data_time` VALUES ('4435', '26', '436', '14:32:00', '14:32:00');
INSERT INTO `ssc_data_time` VALUES ('4434', '26', '435', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('4433', '26', '434', '14:28:00', '14:28:00');
INSERT INTO `ssc_data_time` VALUES ('4432', '26', '433', '14:26:00', '14:26:00');
INSERT INTO `ssc_data_time` VALUES ('4431', '26', '432', '14:24:00', '14:24:00');
INSERT INTO `ssc_data_time` VALUES ('4430', '26', '431', '14:22:00', '14:22:00');
INSERT INTO `ssc_data_time` VALUES ('4429', '26', '430', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('4428', '26', '429', '14:18:00', '14:18:00');
INSERT INTO `ssc_data_time` VALUES ('4427', '26', '428', '14:16:00', '14:16:00');
INSERT INTO `ssc_data_time` VALUES ('4426', '26', '427', '14:14:00', '14:14:00');
INSERT INTO `ssc_data_time` VALUES ('4425', '26', '426', '14:12:00', '14:12:00');
INSERT INTO `ssc_data_time` VALUES ('4424', '26', '425', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('4423', '26', '424', '14:08:00', '14:08:00');
INSERT INTO `ssc_data_time` VALUES ('4422', '26', '423', '14:06:00', '14:06:00');
INSERT INTO `ssc_data_time` VALUES ('4421', '26', '422', '14:04:00', '14:04:00');
INSERT INTO `ssc_data_time` VALUES ('4420', '26', '421', '14:02:00', '14:02:00');
INSERT INTO `ssc_data_time` VALUES ('4419', '26', '420', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('4418', '26', '419', '13:58:00', '13:58:00');
INSERT INTO `ssc_data_time` VALUES ('4417', '26', '418', '13:56:00', '13:56:00');
INSERT INTO `ssc_data_time` VALUES ('4416', '26', '417', '13:54:00', '13:54:00');
INSERT INTO `ssc_data_time` VALUES ('4415', '26', '416', '13:52:00', '13:52:00');
INSERT INTO `ssc_data_time` VALUES ('4414', '26', '415', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('4413', '26', '414', '13:48:00', '13:48:00');
INSERT INTO `ssc_data_time` VALUES ('4412', '26', '413', '13:46:00', '13:46:00');
INSERT INTO `ssc_data_time` VALUES ('4411', '26', '412', '13:44:00', '13:44:00');
INSERT INTO `ssc_data_time` VALUES ('4410', '26', '411', '13:42:00', '13:42:00');
INSERT INTO `ssc_data_time` VALUES ('4409', '26', '410', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('4408', '26', '409', '13:38:00', '13:38:00');
INSERT INTO `ssc_data_time` VALUES ('4407', '26', '408', '13:36:00', '13:36:00');
INSERT INTO `ssc_data_time` VALUES ('4406', '26', '407', '13:34:00', '13:34:00');
INSERT INTO `ssc_data_time` VALUES ('4405', '26', '406', '13:32:00', '13:32:00');
INSERT INTO `ssc_data_time` VALUES ('4404', '26', '405', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('4403', '26', '404', '13:28:00', '13:28:00');
INSERT INTO `ssc_data_time` VALUES ('4402', '26', '403', '13:26:00', '13:26:00');
INSERT INTO `ssc_data_time` VALUES ('4401', '26', '402', '13:24:00', '13:24:00');
INSERT INTO `ssc_data_time` VALUES ('4400', '26', '401', '13:22:00', '13:22:00');
INSERT INTO `ssc_data_time` VALUES ('4399', '26', '400', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('4398', '26', '399', '13:18:00', '13:18:00');
INSERT INTO `ssc_data_time` VALUES ('4397', '26', '398', '13:16:00', '13:16:00');
INSERT INTO `ssc_data_time` VALUES ('4396', '26', '397', '13:14:00', '13:14:00');
INSERT INTO `ssc_data_time` VALUES ('4395', '26', '396', '13:12:00', '13:12:00');
INSERT INTO `ssc_data_time` VALUES ('4394', '26', '395', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('4393', '26', '394', '13:08:00', '13:08:00');
INSERT INTO `ssc_data_time` VALUES ('4392', '26', '393', '13:06:00', '13:06:00');
INSERT INTO `ssc_data_time` VALUES ('4391', '26', '392', '13:04:00', '13:04:00');
INSERT INTO `ssc_data_time` VALUES ('4390', '26', '391', '13:02:00', '13:02:00');
INSERT INTO `ssc_data_time` VALUES ('4389', '26', '390', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('4388', '26', '389', '12:58:00', '12:58:00');
INSERT INTO `ssc_data_time` VALUES ('4387', '26', '388', '12:56:00', '12:56:00');
INSERT INTO `ssc_data_time` VALUES ('4386', '26', '387', '12:54:00', '12:54:00');
INSERT INTO `ssc_data_time` VALUES ('4385', '26', '386', '12:52:00', '12:52:00');
INSERT INTO `ssc_data_time` VALUES ('4384', '26', '385', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('4383', '26', '384', '12:48:00', '12:48:00');
INSERT INTO `ssc_data_time` VALUES ('4382', '26', '383', '12:46:00', '12:46:00');
INSERT INTO `ssc_data_time` VALUES ('4381', '26', '382', '12:44:00', '12:44:00');
INSERT INTO `ssc_data_time` VALUES ('4380', '26', '381', '12:42:00', '12:42:00');
INSERT INTO `ssc_data_time` VALUES ('4379', '26', '380', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('4378', '26', '379', '12:38:00', '12:38:00');
INSERT INTO `ssc_data_time` VALUES ('4377', '26', '378', '12:36:00', '12:36:00');
INSERT INTO `ssc_data_time` VALUES ('4376', '26', '377', '12:34:00', '12:34:00');
INSERT INTO `ssc_data_time` VALUES ('4375', '26', '376', '12:32:00', '12:32:00');
INSERT INTO `ssc_data_time` VALUES ('4374', '26', '375', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('4373', '26', '374', '12:28:00', '12:28:00');
INSERT INTO `ssc_data_time` VALUES ('4372', '26', '373', '12:26:00', '12:26:00');
INSERT INTO `ssc_data_time` VALUES ('4371', '26', '372', '12:24:00', '12:24:00');
INSERT INTO `ssc_data_time` VALUES ('4370', '26', '371', '12:22:00', '12:22:00');
INSERT INTO `ssc_data_time` VALUES ('4369', '26', '370', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('4368', '26', '369', '12:18:00', '12:18:00');
INSERT INTO `ssc_data_time` VALUES ('4367', '26', '368', '12:16:00', '12:16:00');
INSERT INTO `ssc_data_time` VALUES ('4366', '26', '367', '12:14:00', '12:14:00');
INSERT INTO `ssc_data_time` VALUES ('4365', '26', '366', '12:12:00', '12:12:00');
INSERT INTO `ssc_data_time` VALUES ('1498', '24', '1', '09:05:00', '09:05:00');
INSERT INTO `ssc_data_time` VALUES ('1499', '24', '2', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('1500', '24', '3', '09:15:00', '09:15:00');
INSERT INTO `ssc_data_time` VALUES ('1501', '24', '4', '09:20:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('1502', '24', '5', '09:25:00', '09:25:00');
INSERT INTO `ssc_data_time` VALUES ('1503', '24', '6', '09:30:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('1504', '24', '7', '09:35:00', '09:35:00');
INSERT INTO `ssc_data_time` VALUES ('1505', '24', '8', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('1506', '24', '9', '09:45:00', '09:45:00');
INSERT INTO `ssc_data_time` VALUES ('1507', '24', '10', '09:50:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('1508', '24', '11', '09:55:00', '09:55:00');
INSERT INTO `ssc_data_time` VALUES ('1509', '24', '12', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('1510', '24', '13', '10:05:00', '10:05:00');
INSERT INTO `ssc_data_time` VALUES ('1511', '24', '14', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('1512', '24', '15', '10:15:00', '10:15:00');
INSERT INTO `ssc_data_time` VALUES ('1513', '24', '16', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('1514', '24', '17', '10:25:00', '10:25:00');
INSERT INTO `ssc_data_time` VALUES ('1515', '24', '18', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('1516', '24', '19', '10:35:00', '10:35:00');
INSERT INTO `ssc_data_time` VALUES ('1517', '24', '20', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('1518', '24', '21', '10:45:00', '10:45:00');
INSERT INTO `ssc_data_time` VALUES ('1519', '24', '22', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('1520', '24', '23', '10:55:00', '10:55:00');
INSERT INTO `ssc_data_time` VALUES ('1521', '24', '24', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('1522', '24', '25', '11:05:00', '11:05:00');
INSERT INTO `ssc_data_time` VALUES ('1523', '24', '26', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('1524', '24', '27', '11:15:00', '11:15:00');
INSERT INTO `ssc_data_time` VALUES ('1525', '24', '28', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('1526', '24', '29', '11:25:00', '11:25:00');
INSERT INTO `ssc_data_time` VALUES ('1527', '24', '30', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('1528', '24', '31', '11:35:00', '11:35:00');
INSERT INTO `ssc_data_time` VALUES ('1529', '24', '32', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('1530', '24', '33', '11:45:00', '11:45:00');
INSERT INTO `ssc_data_time` VALUES ('1531', '24', '34', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('1532', '24', '35', '11:55:00', '11:55:00');
INSERT INTO `ssc_data_time` VALUES ('1533', '24', '36', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('1534', '24', '37', '12:05:00', '12:05:00');
INSERT INTO `ssc_data_time` VALUES ('1535', '24', '38', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('1536', '24', '39', '12:15:00', '12:15:00');
INSERT INTO `ssc_data_time` VALUES ('1537', '24', '40', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('1538', '24', '41', '12:25:00', '12:25:00');
INSERT INTO `ssc_data_time` VALUES ('1539', '24', '42', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('1540', '24', '43', '12:35:00', '12:35:00');
INSERT INTO `ssc_data_time` VALUES ('1541', '24', '44', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('1542', '24', '45', '12:45:00', '12:45:00');
INSERT INTO `ssc_data_time` VALUES ('1543', '24', '46', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('1544', '24', '47', '12:55:00', '12:55:00');
INSERT INTO `ssc_data_time` VALUES ('1545', '24', '48', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('1546', '24', '49', '13:05:00', '13:05:00');
INSERT INTO `ssc_data_time` VALUES ('1547', '24', '50', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('1548', '24', '51', '13:15:00', '13:15:00');
INSERT INTO `ssc_data_time` VALUES ('1549', '24', '52', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('1550', '24', '53', '13:25:00', '13:25:00');
INSERT INTO `ssc_data_time` VALUES ('1551', '24', '54', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('1552', '24', '55', '13:35:00', '13:35:00');
INSERT INTO `ssc_data_time` VALUES ('1553', '24', '56', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('1554', '24', '57', '13:45:00', '13:45:00');
INSERT INTO `ssc_data_time` VALUES ('1555', '24', '58', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('1556', '24', '59', '13:55:00', '13:55:00');
INSERT INTO `ssc_data_time` VALUES ('1557', '24', '60', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('1558', '24', '61', '14:05:00', '14:05:00');
INSERT INTO `ssc_data_time` VALUES ('1559', '24', '62', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('1560', '24', '63', '14:15:00', '14:15:00');
INSERT INTO `ssc_data_time` VALUES ('1561', '24', '64', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('1562', '24', '65', '14:25:00', '14:25:00');
INSERT INTO `ssc_data_time` VALUES ('1563', '24', '66', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('1564', '24', '67', '14:35:00', '14:35:00');
INSERT INTO `ssc_data_time` VALUES ('1565', '24', '68', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('1566', '24', '69', '14:45:00', '14:45:00');
INSERT INTO `ssc_data_time` VALUES ('1567', '24', '70', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('1568', '24', '71', '14:55:00', '14:55:00');
INSERT INTO `ssc_data_time` VALUES ('1569', '24', '72', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('1570', '24', '73', '15:05:00', '15:05:00');
INSERT INTO `ssc_data_time` VALUES ('1571', '24', '74', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('1572', '24', '75', '15:15:00', '15:15:00');
INSERT INTO `ssc_data_time` VALUES ('1573', '24', '76', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('1574', '24', '77', '15:25:00', '15:25:00');
INSERT INTO `ssc_data_time` VALUES ('1575', '24', '78', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('1576', '24', '79', '15:35:00', '15:35:00');
INSERT INTO `ssc_data_time` VALUES ('1577', '24', '80', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('1578', '24', '81', '15:45:00', '15:45:00');
INSERT INTO `ssc_data_time` VALUES ('1579', '24', '82', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('1580', '24', '83', '15:55:00', '15:55:00');
INSERT INTO `ssc_data_time` VALUES ('1581', '24', '84', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('1582', '24', '85', '16:05:00', '16:05:00');
INSERT INTO `ssc_data_time` VALUES ('1583', '24', '86', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('1584', '24', '87', '16:15:00', '16:15:00');
INSERT INTO `ssc_data_time` VALUES ('1585', '24', '88', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('1586', '24', '89', '16:25:00', '16:25:00');
INSERT INTO `ssc_data_time` VALUES ('1587', '24', '90', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('1588', '24', '91', '16:35:00', '16:35:00');
INSERT INTO `ssc_data_time` VALUES ('1589', '24', '92', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('1590', '24', '93', '16:45:00', '16:45:00');
INSERT INTO `ssc_data_time` VALUES ('1591', '24', '94', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('1592', '24', '95', '16:55:00', '16:55:00');
INSERT INTO `ssc_data_time` VALUES ('1593', '24', '96', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('1594', '24', '97', '17:05:00', '17:05:00');
INSERT INTO `ssc_data_time` VALUES ('1595', '24', '98', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('1596', '24', '99', '17:15:00', '17:15:00');
INSERT INTO `ssc_data_time` VALUES ('1597', '24', '100', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('1598', '24', '101', '17:25:00', '17:25:00');
INSERT INTO `ssc_data_time` VALUES ('1599', '24', '102', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('1600', '24', '103', '17:35:00', '17:35:00');
INSERT INTO `ssc_data_time` VALUES ('1601', '24', '104', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('1602', '24', '105', '17:45:00', '17:45:00');
INSERT INTO `ssc_data_time` VALUES ('1603', '24', '106', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('1604', '24', '107', '17:55:00', '17:55:00');
INSERT INTO `ssc_data_time` VALUES ('1605', '24', '108', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('1606', '24', '109', '18:05:00', '18:05:00');
INSERT INTO `ssc_data_time` VALUES ('1607', '24', '110', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('1608', '24', '111', '18:15:00', '18:15:00');
INSERT INTO `ssc_data_time` VALUES ('1609', '24', '112', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('1610', '24', '113', '18:25:00', '18:25:00');
INSERT INTO `ssc_data_time` VALUES ('1611', '24', '114', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('1612', '24', '115', '18:35:00', '18:35:00');
INSERT INTO `ssc_data_time` VALUES ('1613', '24', '116', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('1614', '24', '117', '18:45:00', '18:45:00');
INSERT INTO `ssc_data_time` VALUES ('1615', '24', '118', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('1616', '24', '119', '18:55:00', '18:55:00');
INSERT INTO `ssc_data_time` VALUES ('1617', '24', '120', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('1618', '24', '121', '19:05:00', '19:05:00');
INSERT INTO `ssc_data_time` VALUES ('1619', '24', '122', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('1620', '24', '123', '19:15:00', '19:15:00');
INSERT INTO `ssc_data_time` VALUES ('1621', '24', '124', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('1622', '24', '125', '19:25:00', '19:25:00');
INSERT INTO `ssc_data_time` VALUES ('1623', '24', '126', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('1624', '24', '127', '19:35:00', '19:35:00');
INSERT INTO `ssc_data_time` VALUES ('1625', '24', '128', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('1626', '24', '129', '19:45:00', '19:45:00');
INSERT INTO `ssc_data_time` VALUES ('1627', '24', '130', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('1628', '24', '131', '19:55:00', '19:55:00');
INSERT INTO `ssc_data_time` VALUES ('1629', '24', '132', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('1630', '24', '133', '20:05:00', '20:05:00');
INSERT INTO `ssc_data_time` VALUES ('1631', '24', '134', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('1632', '24', '135', '20:15:00', '20:15:00');
INSERT INTO `ssc_data_time` VALUES ('1633', '24', '136', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('1634', '24', '137', '20:25:00', '20:25:00');
INSERT INTO `ssc_data_time` VALUES ('1635', '24', '138', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('1636', '24', '139', '20:35:00', '20:35:00');
INSERT INTO `ssc_data_time` VALUES ('1637', '24', '140', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('1638', '24', '141', '20:45:00', '20:45:00');
INSERT INTO `ssc_data_time` VALUES ('1639', '24', '142', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('1640', '24', '143', '20:55:00', '20:55:00');
INSERT INTO `ssc_data_time` VALUES ('1641', '24', '144', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('1642', '24', '145', '21:05:00', '21:05:00');
INSERT INTO `ssc_data_time` VALUES ('1643', '24', '146', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('1644', '24', '147', '21:15:00', '21:15:00');
INSERT INTO `ssc_data_time` VALUES ('1645', '24', '148', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('1646', '24', '149', '21:25:00', '21:25:00');
INSERT INTO `ssc_data_time` VALUES ('1647', '24', '150', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('1648', '24', '151', '21:35:00', '21:35:00');
INSERT INTO `ssc_data_time` VALUES ('1649', '24', '152', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('1650', '24', '153', '21:45:00', '21:45:00');
INSERT INTO `ssc_data_time` VALUES ('1651', '24', '154', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('1652', '24', '155', '21:55:00', '21:55:00');
INSERT INTO `ssc_data_time` VALUES ('1653', '24', '156', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('1654', '24', '157', '22:05:00', '22:05:00');
INSERT INTO `ssc_data_time` VALUES ('1655', '24', '158', '22:10:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('1656', '24', '159', '22:15:00', '22:15:00');
INSERT INTO `ssc_data_time` VALUES ('1657', '24', '160', '22:20:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('1658', '24', '161', '22:25:00', '22:25:00');
INSERT INTO `ssc_data_time` VALUES ('1659', '24', '162', '22:30:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('1660', '24', '163', '22:35:00', '22:35:00');
INSERT INTO `ssc_data_time` VALUES ('1661', '24', '164', '22:40:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('1662', '24', '165', '22:45:00', '22:45:00');
INSERT INTO `ssc_data_time` VALUES ('1663', '24', '166', '22:50:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('1664', '24', '167', '22:55:00', '22:55:00');
INSERT INTO `ssc_data_time` VALUES ('1665', '24', '168', '23:00:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('1666', '24', '169', '23:05:00', '23:05:00');
INSERT INTO `ssc_data_time` VALUES ('1667', '24', '170', '23:10:00', '23:10:00');
INSERT INTO `ssc_data_time` VALUES ('1668', '24', '171', '23:15:00', '23:15:00');
INSERT INTO `ssc_data_time` VALUES ('1669', '24', '172', '23:20:00', '23:20:00');
INSERT INTO `ssc_data_time` VALUES ('1670', '24', '173', '23:25:00', '23:25:00');
INSERT INTO `ssc_data_time` VALUES ('1671', '24', '174', '23:30:00', '23:30:00');
INSERT INTO `ssc_data_time` VALUES ('1672', '24', '175', '23:35:00', '23:35:00');
INSERT INTO `ssc_data_time` VALUES ('1673', '24', '176', '23:40:00', '23:40:00');
INSERT INTO `ssc_data_time` VALUES ('1674', '24', '177', '23:45:00', '23:45:00');
INSERT INTO `ssc_data_time` VALUES ('1675', '24', '178', '23:50:00', '23:50:00');
INSERT INTO `ssc_data_time` VALUES ('1676', '24', '179', '23:55:00', '23:55:00');
INSERT INTO `ssc_data_time` VALUES ('4617', '26', '618', '20:36:00', '20:36:00');
INSERT INTO `ssc_data_time` VALUES ('4616', '26', '617', '20:34:00', '20:34:00');
INSERT INTO `ssc_data_time` VALUES ('4615', '26', '616', '20:32:00', '20:32:00');
INSERT INTO `ssc_data_time` VALUES ('4614', '26', '615', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('4613', '26', '614', '20:28:00', '20:28:00');
INSERT INTO `ssc_data_time` VALUES ('4612', '26', '613', '20:26:00', '20:26:00');
INSERT INTO `ssc_data_time` VALUES ('4611', '26', '612', '20:24:00', '20:24:00');
INSERT INTO `ssc_data_time` VALUES ('4610', '26', '611', '20:22:00', '20:22:00');
INSERT INTO `ssc_data_time` VALUES ('4609', '26', '610', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('4608', '26', '609', '20:18:00', '20:18:00');
INSERT INTO `ssc_data_time` VALUES ('4607', '26', '608', '20:16:00', '20:16:00');
INSERT INTO `ssc_data_time` VALUES ('4606', '26', '607', '20:14:00', '20:14:00');
INSERT INTO `ssc_data_time` VALUES ('4605', '26', '606', '20:12:00', '20:12:00');
INSERT INTO `ssc_data_time` VALUES ('4604', '26', '605', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('4603', '26', '604', '20:08:00', '20:08:00');
INSERT INTO `ssc_data_time` VALUES ('4602', '26', '603', '20:06:00', '20:06:00');
INSERT INTO `ssc_data_time` VALUES ('4601', '26', '602', '20:04:00', '20:04:00');
INSERT INTO `ssc_data_time` VALUES ('4600', '26', '601', '20:02:00', '20:02:00');
INSERT INTO `ssc_data_time` VALUES ('4599', '26', '600', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('4598', '26', '599', '19:58:00', '19:58:00');
INSERT INTO `ssc_data_time` VALUES ('4597', '26', '598', '19:56:00', '19:56:00');
INSERT INTO `ssc_data_time` VALUES ('4596', '26', '597', '19:54:00', '19:54:00');
INSERT INTO `ssc_data_time` VALUES ('4595', '26', '596', '19:52:00', '19:52:00');
INSERT INTO `ssc_data_time` VALUES ('4594', '26', '595', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('4593', '26', '594', '19:48:00', '19:48:00');
INSERT INTO `ssc_data_time` VALUES ('4592', '26', '593', '19:46:00', '19:46:00');
INSERT INTO `ssc_data_time` VALUES ('4591', '26', '592', '19:44:00', '19:44:00');
INSERT INTO `ssc_data_time` VALUES ('4590', '26', '591', '19:42:00', '19:42:00');
INSERT INTO `ssc_data_time` VALUES ('4589', '26', '590', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('4588', '26', '589', '19:38:00', '19:38:00');
INSERT INTO `ssc_data_time` VALUES ('4587', '26', '588', '19:36:00', '19:36:00');
INSERT INTO `ssc_data_time` VALUES ('4586', '26', '587', '19:34:00', '19:34:00');
INSERT INTO `ssc_data_time` VALUES ('4585', '26', '586', '19:32:00', '19:32:00');
INSERT INTO `ssc_data_time` VALUES ('4584', '26', '585', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('4583', '26', '584', '19:28:00', '19:28:00');
INSERT INTO `ssc_data_time` VALUES ('4582', '26', '583', '19:26:00', '19:26:00');
INSERT INTO `ssc_data_time` VALUES ('4581', '26', '582', '19:24:00', '19:24:00');
INSERT INTO `ssc_data_time` VALUES ('4580', '26', '581', '19:22:00', '19:22:00');
INSERT INTO `ssc_data_time` VALUES ('4579', '26', '580', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('4578', '26', '579', '19:18:00', '19:18:00');
INSERT INTO `ssc_data_time` VALUES ('4577', '26', '578', '19:16:00', '19:16:00');
INSERT INTO `ssc_data_time` VALUES ('4576', '26', '577', '19:14:00', '19:14:00');
INSERT INTO `ssc_data_time` VALUES ('4575', '26', '576', '19:12:00', '19:12:00');
INSERT INTO `ssc_data_time` VALUES ('4574', '26', '575', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('4573', '26', '574', '19:08:00', '19:08:00');
INSERT INTO `ssc_data_time` VALUES ('4572', '26', '573', '19:06:00', '19:06:00');
INSERT INTO `ssc_data_time` VALUES ('4571', '26', '572', '19:04:00', '19:04:00');
INSERT INTO `ssc_data_time` VALUES ('4570', '26', '571', '19:02:00', '19:02:00');
INSERT INTO `ssc_data_time` VALUES ('4569', '26', '570', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('4568', '26', '569', '18:58:00', '18:58:00');
INSERT INTO `ssc_data_time` VALUES ('4567', '26', '568', '18:56:00', '18:56:00');
INSERT INTO `ssc_data_time` VALUES ('4566', '26', '567', '18:54:00', '18:54:00');
INSERT INTO `ssc_data_time` VALUES ('4565', '26', '566', '18:52:00', '18:52:00');
INSERT INTO `ssc_data_time` VALUES ('4564', '26', '565', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('4563', '26', '564', '18:48:00', '18:48:00');
INSERT INTO `ssc_data_time` VALUES ('4562', '26', '563', '18:46:00', '18:46:00');
INSERT INTO `ssc_data_time` VALUES ('4561', '26', '562', '18:44:00', '18:44:00');
INSERT INTO `ssc_data_time` VALUES ('4560', '26', '561', '18:42:00', '18:42:00');
INSERT INTO `ssc_data_time` VALUES ('4559', '26', '560', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('4558', '26', '559', '18:38:00', '18:38:00');
INSERT INTO `ssc_data_time` VALUES ('4557', '26', '558', '18:36:00', '18:36:00');
INSERT INTO `ssc_data_time` VALUES ('4556', '26', '557', '18:34:00', '18:34:00');
INSERT INTO `ssc_data_time` VALUES ('4555', '26', '556', '18:32:00', '18:32:00');
INSERT INTO `ssc_data_time` VALUES ('4554', '26', '555', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('4553', '26', '554', '18:28:00', '18:28:00');
INSERT INTO `ssc_data_time` VALUES ('4552', '26', '553', '18:26:00', '18:26:00');
INSERT INTO `ssc_data_time` VALUES ('4551', '26', '552', '18:24:00', '18:24:00');
INSERT INTO `ssc_data_time` VALUES ('4550', '26', '551', '18:22:00', '18:22:00');
INSERT INTO `ssc_data_time` VALUES ('4549', '26', '550', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('4548', '26', '549', '18:18:00', '18:18:00');
INSERT INTO `ssc_data_time` VALUES ('4547', '26', '548', '18:16:00', '18:16:00');
INSERT INTO `ssc_data_time` VALUES ('4546', '26', '547', '18:14:00', '18:14:00');
INSERT INTO `ssc_data_time` VALUES ('4545', '26', '546', '18:12:00', '18:12:00');
INSERT INTO `ssc_data_time` VALUES ('4544', '26', '545', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('4543', '26', '544', '18:08:00', '18:08:00');
INSERT INTO `ssc_data_time` VALUES ('4542', '26', '543', '18:06:00', '18:06:00');
INSERT INTO `ssc_data_time` VALUES ('4541', '26', '542', '18:04:00', '18:04:00');
INSERT INTO `ssc_data_time` VALUES ('4540', '26', '541', '18:02:00', '18:02:00');
INSERT INTO `ssc_data_time` VALUES ('4539', '26', '540', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('4538', '26', '539', '17:58:00', '17:58:00');
INSERT INTO `ssc_data_time` VALUES ('4537', '26', '538', '17:56:00', '17:56:00');
INSERT INTO `ssc_data_time` VALUES ('4536', '26', '537', '17:54:00', '17:54:00');
INSERT INTO `ssc_data_time` VALUES ('4535', '26', '536', '17:52:00', '17:52:00');
INSERT INTO `ssc_data_time` VALUES ('4534', '26', '535', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('5054', '7', '55', '18:05:00', '18:05:00');
INSERT INTO `ssc_data_time` VALUES ('5053', '7', '54', '17:55:00', '17:55:00');
INSERT INTO `ssc_data_time` VALUES ('5052', '7', '53', '17:45:00', '17:45:00');
INSERT INTO `ssc_data_time` VALUES ('5051', '7', '52', '17:35:00', '17:35:00');
INSERT INTO `ssc_data_time` VALUES ('5050', '7', '51', '17:25:00', '17:25:00');
INSERT INTO `ssc_data_time` VALUES ('5049', '7', '50', '17:15:00', '17:15:00');
INSERT INTO `ssc_data_time` VALUES ('5048', '7', '49', '17:05:00', '17:05:00');
INSERT INTO `ssc_data_time` VALUES ('5047', '7', '48', '16:55:00', '16:55:00');
INSERT INTO `ssc_data_time` VALUES ('5046', '7', '47', '16:45:00', '16:45:00');
INSERT INTO `ssc_data_time` VALUES ('5045', '7', '46', '16:35:00', '16:35:00');
INSERT INTO `ssc_data_time` VALUES ('5044', '7', '45', '16:25:00', '16:25:00');
INSERT INTO `ssc_data_time` VALUES ('5043', '7', '44', '16:15:00', '16:15:00');
INSERT INTO `ssc_data_time` VALUES ('5042', '7', '43', '16:05:00', '16:05:00');
INSERT INTO `ssc_data_time` VALUES ('5041', '7', '42', '15:55:00', '15:55:00');
INSERT INTO `ssc_data_time` VALUES ('5040', '7', '41', '15:45:00', '15:45:00');
INSERT INTO `ssc_data_time` VALUES ('5039', '7', '40', '15:35:00', '15:35:00');
INSERT INTO `ssc_data_time` VALUES ('5038', '7', '39', '15:25:00', '15:25:00');
INSERT INTO `ssc_data_time` VALUES ('5037', '7', '38', '15:15:00', '15:15:00');
INSERT INTO `ssc_data_time` VALUES ('5036', '7', '37', '15:05:00', '15:05:00');
INSERT INTO `ssc_data_time` VALUES ('5035', '7', '36', '14:55:00', '14:55:00');
INSERT INTO `ssc_data_time` VALUES ('5034', '7', '35', '14:45:00', '14:45:00');
INSERT INTO `ssc_data_time` VALUES ('5033', '7', '34', '14:35:00', '14:35:00');
INSERT INTO `ssc_data_time` VALUES ('5032', '7', '33', '14:25:00', '14:25:00');
INSERT INTO `ssc_data_time` VALUES ('5031', '7', '32', '14:15:00', '14:15:00');
INSERT INTO `ssc_data_time` VALUES ('5030', '7', '31', '14:05:00', '14:05:00');
INSERT INTO `ssc_data_time` VALUES ('5029', '7', '30', '13:55:00', '13:55:00');
INSERT INTO `ssc_data_time` VALUES ('5028', '7', '29', '13:45:00', '13:45:00');
INSERT INTO `ssc_data_time` VALUES ('5027', '7', '28', '13:35:00', '13:35:00');
INSERT INTO `ssc_data_time` VALUES ('5026', '7', '27', '13:25:00', '13:25:00');
INSERT INTO `ssc_data_time` VALUES ('5025', '7', '26', '13:15:00', '13:15:00');
INSERT INTO `ssc_data_time` VALUES ('5024', '7', '25', '13:05:00', '13:05:00');
INSERT INTO `ssc_data_time` VALUES ('5023', '7', '24', '12:55:00', '12:55:00');
INSERT INTO `ssc_data_time` VALUES ('5022', '7', '23', '12:45:00', '12:45:00');
INSERT INTO `ssc_data_time` VALUES ('5021', '7', '22', '12:35:00', '12:35:00');
INSERT INTO `ssc_data_time` VALUES ('5020', '7', '21', '12:25:00', '12:25:00');
INSERT INTO `ssc_data_time` VALUES ('5019', '7', '20', '12:15:00', '12:15:00');
INSERT INTO `ssc_data_time` VALUES ('5018', '7', '19', '12:05:00', '12:05:00');
INSERT INTO `ssc_data_time` VALUES ('5017', '7', '18', '11:55:00', '11:55:00');
INSERT INTO `ssc_data_time` VALUES ('5016', '7', '17', '11:45:00', '11:45:00');
INSERT INTO `ssc_data_time` VALUES ('5015', '7', '16', '11:35:00', '11:35:00');
INSERT INTO `ssc_data_time` VALUES ('5014', '7', '15', '11:25:00', '11:25:00');
INSERT INTO `ssc_data_time` VALUES ('5013', '7', '14', '11:15:00', '11:15:00');
INSERT INTO `ssc_data_time` VALUES ('5012', '7', '13', '11:05:00', '11:05:00');
INSERT INTO `ssc_data_time` VALUES ('5011', '7', '12', '10:55:00', '10:55:00');
INSERT INTO `ssc_data_time` VALUES ('5010', '7', '11', '10:45:00', '10:45:00');
INSERT INTO `ssc_data_time` VALUES ('5009', '7', '10', '10:35:00', '10:35:00');
INSERT INTO `ssc_data_time` VALUES ('5008', '7', '9', '10:25:00', '10:25:00');
INSERT INTO `ssc_data_time` VALUES ('5007', '7', '8', '10:15:00', '10:15:00');
INSERT INTO `ssc_data_time` VALUES ('5006', '7', '7', '10:05:00', '10:05:00');
INSERT INTO `ssc_data_time` VALUES ('5005', '7', '6', '09:55:00', '09:55:00');
INSERT INTO `ssc_data_time` VALUES ('5004', '7', '5', '09:45:00', '09:45:00');
INSERT INTO `ssc_data_time` VALUES ('5003', '7', '4', '09:35:00', '09:35:00');
INSERT INTO `ssc_data_time` VALUES ('5002', '7', '3', '09:25:00', '09:25:00');
INSERT INTO `ssc_data_time` VALUES ('5001', '7', '2', '09:15:00', '09:15:00');
INSERT INTO `ssc_data_time` VALUES ('5000', '7', '1', '09:05:00', '09:05:00');
INSERT INTO `ssc_data_time` VALUES ('4719', '26', '720', '23:59:59', '23:59:59');
INSERT INTO `ssc_data_time` VALUES ('4718', '26', '719', '23:58:00', '23:58:00');
INSERT INTO `ssc_data_time` VALUES ('4717', '26', '718', '23:56:00', '23:56:00');
INSERT INTO `ssc_data_time` VALUES ('4716', '26', '717', '23:54:00', '23:54:00');
INSERT INTO `ssc_data_time` VALUES ('4715', '26', '716', '23:52:00', '23:52:00');
INSERT INTO `ssc_data_time` VALUES ('4714', '26', '715', '23:50:00', '23:50:00');
INSERT INTO `ssc_data_time` VALUES ('4713', '26', '714', '23:48:00', '23:48:00');
INSERT INTO `ssc_data_time` VALUES ('4712', '26', '713', '23:46:00', '23:46:00');
INSERT INTO `ssc_data_time` VALUES ('4711', '26', '712', '23:44:00', '23:44:00');
INSERT INTO `ssc_data_time` VALUES ('4710', '26', '711', '23:42:00', '23:42:00');
INSERT INTO `ssc_data_time` VALUES ('4709', '26', '710', '23:40:00', '23:40:00');
INSERT INTO `ssc_data_time` VALUES ('4708', '26', '709', '23:38:00', '23:38:00');
INSERT INTO `ssc_data_time` VALUES ('4707', '26', '708', '23:36:00', '23:36:00');
INSERT INTO `ssc_data_time` VALUES ('4706', '26', '707', '23:34:00', '23:34:00');
INSERT INTO `ssc_data_time` VALUES ('4705', '26', '706', '23:32:00', '23:32:00');
INSERT INTO `ssc_data_time` VALUES ('4704', '26', '705', '23:30:00', '23:30:00');
INSERT INTO `ssc_data_time` VALUES ('4703', '26', '704', '23:28:00', '23:28:00');
INSERT INTO `ssc_data_time` VALUES ('4702', '26', '703', '23:26:00', '23:26:00');
INSERT INTO `ssc_data_time` VALUES ('4701', '26', '702', '23:24:00', '23:24:00');
INSERT INTO `ssc_data_time` VALUES ('4700', '26', '701', '23:22:00', '23:22:00');
INSERT INTO `ssc_data_time` VALUES ('4699', '26', '700', '23:20:00', '23:20:00');
INSERT INTO `ssc_data_time` VALUES ('4698', '26', '699', '23:18:00', '23:18:00');
INSERT INTO `ssc_data_time` VALUES ('4697', '26', '698', '23:16:00', '23:16:00');
INSERT INTO `ssc_data_time` VALUES ('4696', '26', '697', '23:14:00', '23:14:00');
INSERT INTO `ssc_data_time` VALUES ('1840', '25', '1', '08:40:00', '08:40:00');
INSERT INTO `ssc_data_time` VALUES ('1841', '25', '2', '08:50:00', '08:50:00');
INSERT INTO `ssc_data_time` VALUES ('1842', '25', '3', '09:00:00', '09:00:00');
INSERT INTO `ssc_data_time` VALUES ('1843', '25', '4', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('1844', '25', '5', '09:20:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('1845', '25', '6', '09:30:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('1846', '25', '7', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('1847', '25', '8', '09:50:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('1848', '25', '9', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('1849', '25', '10', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('1850', '25', '11', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('1851', '25', '12', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('1852', '25', '13', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('1853', '25', '14', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('1854', '25', '15', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('1855', '25', '16', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('1856', '25', '17', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('1857', '25', '18', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('1858', '25', '19', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('1859', '25', '20', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('1860', '25', '21', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('1861', '25', '22', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('1862', '25', '23', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('1863', '25', '24', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('1864', '25', '25', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('1865', '25', '26', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('1866', '25', '27', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('1867', '25', '28', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('1868', '25', '29', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('1869', '25', '30', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('1870', '25', '31', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('1871', '25', '32', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('1872', '25', '33', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('1873', '25', '34', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('1874', '25', '35', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('1875', '25', '36', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('1876', '25', '37', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('1877', '25', '38', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('1878', '25', '39', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('1879', '25', '40', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('1880', '25', '41', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('1881', '25', '42', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('1882', '25', '43', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('1883', '25', '44', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('1884', '25', '45', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('1885', '25', '46', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('1886', '25', '47', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('1887', '25', '48', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('1888', '25', '49', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('1889', '25', '50', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('1890', '25', '51', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('1891', '25', '52', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('1892', '25', '53', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('1893', '25', '54', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('1894', '25', '55', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('1895', '25', '56', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('1896', '25', '57', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('1897', '25', '58', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('1898', '25', '59', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('1899', '25', '60', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('1900', '25', '61', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('1901', '25', '62', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('1902', '25', '63', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('1903', '25', '64', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('1904', '25', '65', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('1905', '25', '66', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('1906', '25', '67', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('1907', '25', '68', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('1908', '25', '69', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('1909', '25', '70', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('1910', '25', '71', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('1911', '25', '72', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('1912', '25', '73', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('1913', '25', '74', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('1914', '25', '75', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('1915', '25', '76', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('1916', '25', '77', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('1917', '25', '78', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('1918', '25', '79', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('1919', '25', '80', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('1920', '25', '81', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('1921', '25', '82', '22:10:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('4695', '26', '696', '23:12:00', '23:12:00');
INSERT INTO `ssc_data_time` VALUES ('4694', '26', '695', '23:10:00', '23:10:00');
INSERT INTO `ssc_data_time` VALUES ('4693', '26', '694', '23:08:00', '23:08:00');
INSERT INTO `ssc_data_time` VALUES ('4692', '26', '693', '23:06:00', '23:06:00');
INSERT INTO `ssc_data_time` VALUES ('4691', '26', '692', '23:04:00', '23:04:00');
INSERT INTO `ssc_data_time` VALUES ('4690', '26', '691', '23:02:00', '23:02:00');
INSERT INTO `ssc_data_time` VALUES ('4689', '26', '690', '23:00:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('4688', '26', '689', '22:58:00', '22:58:00');
INSERT INTO `ssc_data_time` VALUES ('4687', '26', '688', '22:56:00', '22:56:00');
INSERT INTO `ssc_data_time` VALUES ('4686', '26', '687', '22:54:00', '22:54:00');
INSERT INTO `ssc_data_time` VALUES ('4685', '26', '686', '22:52:00', '22:52:00');
INSERT INTO `ssc_data_time` VALUES ('4684', '26', '685', '22:50:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('4683', '26', '684', '22:48:00', '22:48:00');
INSERT INTO `ssc_data_time` VALUES ('4682', '26', '683', '22:46:00', '22:46:00');
INSERT INTO `ssc_data_time` VALUES ('4681', '26', '682', '22:44:00', '22:44:00');
INSERT INTO `ssc_data_time` VALUES ('4680', '26', '681', '22:42:00', '22:42:00');
INSERT INTO `ssc_data_time` VALUES ('4679', '26', '680', '22:40:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('4678', '26', '679', '22:38:00', '22:38:00');
INSERT INTO `ssc_data_time` VALUES ('4677', '26', '678', '22:36:00', '22:36:00');
INSERT INTO `ssc_data_time` VALUES ('4676', '26', '677', '22:34:00', '22:34:00');
INSERT INTO `ssc_data_time` VALUES ('4675', '26', '676', '22:32:00', '22:32:00');
INSERT INTO `ssc_data_time` VALUES ('4674', '26', '675', '22:30:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('4673', '26', '674', '22:28:00', '22:28:00');
INSERT INTO `ssc_data_time` VALUES ('4672', '26', '673', '22:26:00', '22:26:00');
INSERT INTO `ssc_data_time` VALUES ('4671', '26', '672', '22:24:00', '22:24:00');
INSERT INTO `ssc_data_time` VALUES ('4670', '26', '671', '22:22:00', '22:22:00');
INSERT INTO `ssc_data_time` VALUES ('4669', '26', '670', '22:20:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('4668', '26', '669', '22:18:00', '22:18:00');
INSERT INTO `ssc_data_time` VALUES ('4667', '26', '668', '22:16:00', '22:16:00');
INSERT INTO `ssc_data_time` VALUES ('4666', '26', '667', '22:14:00', '22:14:00');
INSERT INTO `ssc_data_time` VALUES ('4665', '26', '666', '22:12:00', '22:12:00');
INSERT INTO `ssc_data_time` VALUES ('4664', '26', '665', '22:10:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('4663', '26', '664', '22:08:00', '22:08:00');
INSERT INTO `ssc_data_time` VALUES ('4662', '26', '663', '22:06:00', '22:06:00');
INSERT INTO `ssc_data_time` VALUES ('4661', '26', '662', '22:04:00', '22:04:00');
INSERT INTO `ssc_data_time` VALUES ('4660', '26', '661', '22:02:00', '22:02:00');
INSERT INTO `ssc_data_time` VALUES ('4659', '26', '660', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('4658', '26', '659', '21:58:00', '21:58:00');
INSERT INTO `ssc_data_time` VALUES ('4657', '26', '658', '21:56:00', '21:56:00');
INSERT INTO `ssc_data_time` VALUES ('4656', '26', '657', '21:54:00', '21:54:00');
INSERT INTO `ssc_data_time` VALUES ('4655', '26', '656', '21:52:00', '21:52:00');
INSERT INTO `ssc_data_time` VALUES ('4654', '26', '655', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('4653', '26', '654', '21:48:00', '21:48:00');
INSERT INTO `ssc_data_time` VALUES ('4652', '26', '653', '21:46:00', '21:46:00');
INSERT INTO `ssc_data_time` VALUES ('4651', '26', '652', '21:44:00', '21:44:00');
INSERT INTO `ssc_data_time` VALUES ('4650', '26', '651', '21:42:00', '21:42:00');
INSERT INTO `ssc_data_time` VALUES ('4649', '26', '650', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('4648', '26', '649', '21:38:00', '21:38:00');
INSERT INTO `ssc_data_time` VALUES ('4647', '26', '648', '21:36:00', '21:36:00');
INSERT INTO `ssc_data_time` VALUES ('4646', '26', '647', '21:34:00', '21:34:00');
INSERT INTO `ssc_data_time` VALUES ('4645', '26', '646', '21:32:00', '21:32:00');
INSERT INTO `ssc_data_time` VALUES ('4644', '26', '645', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('4533', '26', '534', '17:48:00', '17:48:00');
INSERT INTO `ssc_data_time` VALUES ('4532', '26', '533', '17:46:00', '17:46:00');
INSERT INTO `ssc_data_time` VALUES ('4531', '26', '532', '17:44:00', '17:44:00');
INSERT INTO `ssc_data_time` VALUES ('4530', '26', '531', '17:42:00', '17:42:00');
INSERT INTO `ssc_data_time` VALUES ('4529', '26', '530', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('4528', '26', '529', '17:38:00', '17:38:00');
INSERT INTO `ssc_data_time` VALUES ('4527', '26', '528', '17:36:00', '17:36:00');
INSERT INTO `ssc_data_time` VALUES ('4526', '26', '527', '17:34:00', '17:34:00');
INSERT INTO `ssc_data_time` VALUES ('4525', '26', '526', '17:32:00', '17:32:00');
INSERT INTO `ssc_data_time` VALUES ('4524', '26', '525', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('4523', '26', '524', '17:28:00', '17:28:00');
INSERT INTO `ssc_data_time` VALUES ('4522', '26', '523', '17:26:00', '17:26:00');
INSERT INTO `ssc_data_time` VALUES ('4521', '26', '522', '17:24:00', '17:24:00');
INSERT INTO `ssc_data_time` VALUES ('4520', '26', '521', '17:22:00', '17:22:00');
INSERT INTO `ssc_data_time` VALUES ('4519', '26', '520', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('4518', '26', '519', '17:18:00', '17:18:00');
INSERT INTO `ssc_data_time` VALUES ('4517', '26', '518', '17:16:00', '17:16:00');
INSERT INTO `ssc_data_time` VALUES ('4516', '26', '517', '17:14:00', '17:14:00');
INSERT INTO `ssc_data_time` VALUES ('4515', '26', '516', '17:12:00', '17:12:00');
INSERT INTO `ssc_data_time` VALUES ('4514', '26', '515', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('4513', '26', '514', '17:08:00', '17:08:00');
INSERT INTO `ssc_data_time` VALUES ('4512', '26', '513', '17:06:00', '17:06:00');
INSERT INTO `ssc_data_time` VALUES ('4511', '26', '512', '17:04:00', '17:04:00');
INSERT INTO `ssc_data_time` VALUES ('4510', '26', '511', '17:02:00', '17:02:00');
INSERT INTO `ssc_data_time` VALUES ('4509', '26', '510', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('4508', '26', '509', '16:58:00', '16:58:00');
INSERT INTO `ssc_data_time` VALUES ('4507', '26', '508', '16:56:00', '16:56:00');
INSERT INTO `ssc_data_time` VALUES ('4506', '26', '507', '16:54:00', '16:54:00');
INSERT INTO `ssc_data_time` VALUES ('4505', '26', '506', '16:52:00', '16:52:00');
INSERT INTO `ssc_data_time` VALUES ('4504', '26', '505', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('4503', '26', '504', '16:48:00', '16:48:00');
INSERT INTO `ssc_data_time` VALUES ('4502', '26', '503', '16:46:00', '16:46:00');
INSERT INTO `ssc_data_time` VALUES ('4501', '26', '502', '16:44:00', '16:44:00');
INSERT INTO `ssc_data_time` VALUES ('4500', '26', '501', '16:42:00', '16:42:00');
INSERT INTO `ssc_data_time` VALUES ('4499', '26', '500', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('4498', '26', '499', '16:38:00', '16:38:00');
INSERT INTO `ssc_data_time` VALUES ('4497', '26', '498', '16:36:00', '16:36:00');
INSERT INTO `ssc_data_time` VALUES ('4496', '26', '497', '16:34:00', '16:34:00');
INSERT INTO `ssc_data_time` VALUES ('4495', '26', '496', '16:32:00', '16:32:00');
INSERT INTO `ssc_data_time` VALUES ('4494', '26', '495', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('4493', '26', '494', '16:28:00', '16:28:00');
INSERT INTO `ssc_data_time` VALUES ('4492', '26', '493', '16:26:00', '16:26:00');
INSERT INTO `ssc_data_time` VALUES ('4491', '26', '492', '16:24:00', '16:24:00');
INSERT INTO `ssc_data_time` VALUES ('4490', '26', '491', '16:22:00', '16:22:00');
INSERT INTO `ssc_data_time` VALUES ('4489', '26', '490', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('4488', '26', '489', '16:18:00', '16:18:00');
INSERT INTO `ssc_data_time` VALUES ('4487', '26', '488', '16:16:00', '16:16:00');
INSERT INTO `ssc_data_time` VALUES ('4486', '26', '487', '16:14:00', '16:14:00');
INSERT INTO `ssc_data_time` VALUES ('4485', '26', '486', '16:12:00', '16:12:00');
INSERT INTO `ssc_data_time` VALUES ('4484', '26', '485', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('4483', '26', '484', '16:08:00', '16:08:00');
INSERT INTO `ssc_data_time` VALUES ('4482', '26', '483', '16:06:00', '16:06:00');
INSERT INTO `ssc_data_time` VALUES ('4481', '26', '482', '16:04:00', '16:04:00');
INSERT INTO `ssc_data_time` VALUES ('4480', '26', '481', '16:02:00', '16:02:00');
INSERT INTO `ssc_data_time` VALUES ('4479', '26', '480', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('4478', '26', '479', '15:58:00', '15:58:00');
INSERT INTO `ssc_data_time` VALUES ('4477', '26', '478', '15:56:00', '15:56:00');
INSERT INTO `ssc_data_time` VALUES ('4476', '26', '477', '15:54:00', '15:54:00');
INSERT INTO `ssc_data_time` VALUES ('4475', '26', '476', '15:52:00', '15:52:00');
INSERT INTO `ssc_data_time` VALUES ('4474', '26', '475', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('4473', '26', '474', '15:48:00', '15:48:00');
INSERT INTO `ssc_data_time` VALUES ('4472', '26', '473', '15:46:00', '15:46:00');
INSERT INTO `ssc_data_time` VALUES ('4471', '26', '472', '15:44:00', '15:44:00');
INSERT INTO `ssc_data_time` VALUES ('4470', '26', '471', '15:42:00', '15:42:00');
INSERT INTO `ssc_data_time` VALUES ('4469', '26', '470', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('4468', '26', '469', '15:38:00', '15:38:00');
INSERT INTO `ssc_data_time` VALUES ('4467', '26', '468', '15:36:00', '15:36:00');
INSERT INTO `ssc_data_time` VALUES ('4466', '26', '467', '15:34:00', '15:34:00');
INSERT INTO `ssc_data_time` VALUES ('4465', '26', '466', '15:32:00', '15:32:00');
INSERT INTO `ssc_data_time` VALUES ('4464', '26', '465', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('4463', '26', '464', '15:28:00', '15:28:00');
INSERT INTO `ssc_data_time` VALUES ('4462', '26', '463', '15:26:00', '15:26:00');
INSERT INTO `ssc_data_time` VALUES ('4461', '26', '462', '15:24:00', '15:24:00');
INSERT INTO `ssc_data_time` VALUES ('4460', '26', '461', '15:22:00', '15:22:00');
INSERT INTO `ssc_data_time` VALUES ('4459', '26', '460', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('4458', '26', '459', '15:18:00', '15:18:00');
INSERT INTO `ssc_data_time` VALUES ('4457', '26', '458', '15:16:00', '15:16:00');
INSERT INTO `ssc_data_time` VALUES ('4456', '26', '457', '15:14:00', '15:14:00');
INSERT INTO `ssc_data_time` VALUES ('4455', '26', '456', '15:12:00', '15:12:00');
INSERT INTO `ssc_data_time` VALUES ('3025', '14', '288', '23:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3024', '14', '287', '23:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3023', '14', '286', '23:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3022', '14', '285', '23:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3021', '14', '284', '23:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3020', '14', '283', '23:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3019', '14', '282', '23:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3018', '14', '281', '23:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3017', '14', '280', '23:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3016', '14', '279', '23:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3015', '14', '278', '23:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3014', '14', '277', '23:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3013', '14', '276', '22:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3012', '14', '275', '22:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3011', '14', '274', '22:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3010', '14', '273', '22:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3009', '14', '272', '22:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3008', '14', '271', '22:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3007', '14', '270', '22:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3006', '14', '269', '22:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3005', '14', '268', '22:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3004', '14', '267', '22:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3003', '14', '266', '22:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3002', '14', '265', '22:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3001', '14', '264', '21:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('3000', '14', '263', '21:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2999', '14', '262', '21:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2998', '14', '261', '21:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2997', '14', '260', '21:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2996', '14', '259', '21:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2995', '14', '258', '21:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2994', '14', '257', '21:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2993', '14', '256', '21:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2992', '14', '255', '21:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2991', '14', '254', '21:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2990', '14', '253', '21:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2989', '14', '252', '20:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2988', '14', '251', '20:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2987', '14', '250', '20:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2986', '14', '249', '20:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2985', '14', '248', '20:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2984', '14', '247', '20:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2983', '14', '246', '20:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2982', '14', '245', '20:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2981', '14', '244', '20:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2980', '14', '243', '20:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2979', '14', '242', '20:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2978', '14', '241', '20:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2977', '14', '240', '19:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2976', '14', '239', '19:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2975', '14', '238', '19:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2974', '14', '237', '19:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2973', '14', '236', '19:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2972', '14', '235', '19:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2971', '14', '234', '19:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2970', '14', '233', '19:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2969', '14', '232', '19:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2968', '14', '231', '19:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2967', '14', '230', '19:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2966', '14', '229', '19:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2965', '14', '228', '18:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2964', '14', '227', '18:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2963', '14', '226', '18:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2962', '14', '225', '18:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2961', '14', '224', '18:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2960', '14', '223', '18:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2959', '14', '222', '18:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2958', '14', '221', '18:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2957', '14', '220', '18:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2956', '14', '219', '18:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2955', '14', '218', '18:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2954', '14', '217', '18:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2953', '14', '216', '17:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2952', '14', '215', '17:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2951', '14', '214', '17:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2950', '14', '213', '17:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2949', '14', '212', '17:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2948', '14', '211', '17:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2947', '14', '210', '17:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2946', '14', '209', '17:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2945', '14', '208', '17:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2944', '14', '207', '17:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2943', '14', '206', '17:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2942', '14', '205', '17:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2941', '14', '204', '16:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2940', '14', '203', '16:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2939', '14', '202', '16:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2938', '14', '201', '16:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2937', '14', '200', '16:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2936', '14', '199', '16:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2935', '14', '198', '16:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2934', '14', '197', '16:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2933', '14', '196', '16:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2932', '14', '195', '16:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2931', '14', '194', '16:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2930', '14', '193', '16:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2929', '14', '192', '15:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2928', '14', '191', '15:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2927', '14', '190', '15:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2926', '14', '189', '15:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2925', '14', '188', '15:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2924', '14', '187', '15:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2923', '14', '186', '15:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2922', '14', '185', '15:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2921', '14', '184', '15:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2920', '14', '183', '15:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2919', '14', '182', '15:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2918', '14', '181', '15:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2917', '14', '180', '14:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2916', '14', '179', '14:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2915', '14', '178', '14:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2914', '14', '177', '14:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2913', '14', '176', '14:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2912', '14', '175', '14:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2911', '14', '174', '14:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2910', '14', '173', '14:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2909', '14', '172', '14:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2908', '14', '171', '14:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2907', '14', '170', '14:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2906', '14', '169', '14:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2905', '14', '168', '13:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2904', '14', '167', '13:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2903', '14', '166', '13:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2902', '14', '165', '13:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2901', '14', '164', '13:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2900', '14', '163', '13:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2899', '14', '162', '13:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2898', '14', '161', '13:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2897', '14', '160', '13:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2896', '14', '159', '13:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2895', '14', '158', '13:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2894', '14', '157', '13:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2893', '14', '156', '12:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2892', '14', '155', '12:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2891', '14', '154', '12:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2890', '14', '153', '12:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2889', '14', '152', '12:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2888', '14', '151', '12:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2887', '14', '150', '12:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2886', '14', '149', '12:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2885', '14', '148', '12:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2884', '14', '147', '12:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2883', '14', '146', '12:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2882', '14', '145', '12:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2881', '14', '144', '11:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2880', '14', '143', '11:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2879', '14', '142', '11:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2878', '14', '141', '11:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2877', '14', '140', '11:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2876', '14', '139', '11:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2875', '14', '138', '11:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2874', '14', '137', '11:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2873', '14', '136', '11:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2872', '14', '135', '11:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2871', '14', '134', '11:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2870', '14', '133', '11:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2869', '14', '132', '10:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2868', '14', '131', '10:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2867', '14', '130', '10:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2866', '14', '129', '10:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2865', '14', '128', '10:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2864', '14', '127', '10:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2863', '14', '126', '10:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2862', '14', '125', '10:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2861', '14', '124', '10:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2860', '14', '123', '10:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2859', '14', '122', '10:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2858', '14', '121', '10:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2857', '14', '120', '09:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2856', '14', '119', '09:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2855', '14', '118', '09:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2854', '14', '117', '09:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2853', '14', '116', '09:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2852', '14', '115', '09:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2851', '14', '114', '09:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2850', '14', '113', '09:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2849', '14', '112', '09:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2848', '14', '111', '09:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2847', '14', '110', '09:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2846', '14', '109', '09:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2845', '14', '108', '08:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2844', '14', '107', '08:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2843', '14', '106', '08:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2842', '14', '105', '08:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2841', '14', '104', '08:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2840', '14', '103', '08:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2839', '14', '102', '08:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2838', '14', '101', '08:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2837', '14', '100', '08:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2836', '14', '99', '08:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2835', '14', '98', '08:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2834', '14', '97', '08:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2833', '14', '96', '07:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2832', '14', '95', '07:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2831', '14', '94', '07:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2830', '14', '93', '07:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2829', '14', '92', '07:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2828', '14', '91', '07:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2827', '14', '90', '07:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2826', '14', '89', '07:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2825', '14', '88', '07:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2824', '14', '87', '07:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2823', '14', '86', '07:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2822', '14', '85', '07:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2821', '14', '84', '06:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2820', '14', '83', '06:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2819', '14', '82', '06:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2818', '14', '81', '06:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2817', '14', '80', '06:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2816', '14', '79', '06:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2815', '14', '78', '06:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2814', '14', '77', '06:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2813', '14', '76', '06:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2812', '14', '75', '06:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2811', '14', '74', '06:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2810', '14', '73', '06:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2809', '14', '72', '05:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2808', '14', '71', '05:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2807', '14', '70', '05:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2806', '14', '69', '05:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2805', '14', '68', '05:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2804', '14', '67', '05:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2803', '14', '66', '05:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2802', '14', '65', '05:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2801', '14', '64', '05:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2800', '14', '63', '05:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2799', '14', '62', '05:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2798', '14', '61', '05:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2797', '14', '60', '04:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2796', '14', '59', '04:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2795', '14', '58', '04:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2794', '14', '57', '04:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2793', '14', '56', '04:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2792', '14', '55', '04:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2791', '14', '54', '04:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2790', '14', '53', '04:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2789', '14', '52', '04:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2788', '14', '51', '04:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2787', '14', '50', '04:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2786', '14', '49', '04:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2785', '14', '48', '03:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2784', '14', '47', '03:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2783', '14', '46', '03:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2782', '14', '45', '03:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2781', '14', '44', '03:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2780', '14', '43', '03:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2779', '14', '42', '03:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2778', '14', '41', '03:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2777', '14', '40', '03:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2776', '14', '39', '03:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2775', '14', '38', '03:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2774', '14', '37', '03:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2773', '14', '36', '02:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2772', '14', '35', '02:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2771', '14', '34', '02:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2770', '14', '33', '02:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2769', '14', '32', '02:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2768', '14', '31', '02:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2767', '14', '30', '02:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2766', '14', '29', '02:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2765', '14', '28', '02:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2764', '14', '27', '02:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2763', '14', '26', '02:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2762', '14', '25', '02:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2761', '14', '24', '01:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2760', '14', '23', '01:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2759', '14', '22', '01:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2758', '14', '21', '01:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2757', '14', '20', '01:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2756', '14', '19', '01:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2755', '14', '18', '01:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2754', '14', '17', '01:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2753', '14', '16', '01:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2752', '14', '15', '01:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2751', '14', '14', '01:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2750', '14', '13', '01:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2749', '14', '12', '00:55:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2748', '14', '11', '00:50:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2747', '14', '10', '00:45:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2746', '14', '9', '00:40:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2745', '14', '8', '00:35:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2744', '14', '7', '00:30:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2743', '14', '6', '00:25:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2742', '14', '5', '00:20:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2741', '14', '4', '00:15:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2740', '14', '3', '00:10:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2739', '14', '2', '00:05:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('2738', '14', '1', '00:00:00', '00:00:00');
INSERT INTO `ssc_data_time` VALUES ('5255', '18', '56', '17:02:00', '17:02:00');
INSERT INTO `ssc_data_time` VALUES ('5256', '18', '57', '17:12:00', '17:12:00');
INSERT INTO `ssc_data_time` VALUES ('5257', '18', '58', '17:22:00', '17:22:00');
INSERT INTO `ssc_data_time` VALUES ('5258', '18', '59', '17:32:00', '17:32:00');
INSERT INTO `ssc_data_time` VALUES ('5259', '18', '60', '17:42:00', '17:42:00');
INSERT INTO `ssc_data_time` VALUES ('5260', '18', '61', '17:52:00', '17:52:00');
INSERT INTO `ssc_data_time` VALUES ('5261', '18', '62', '18:02:00', '18:02:00');
INSERT INTO `ssc_data_time` VALUES ('5262', '18', '63', '18:12:00', '18:12:00');
INSERT INTO `ssc_data_time` VALUES ('5263', '18', '64', '18:22:00', '18:22:00');
INSERT INTO `ssc_data_time` VALUES ('5264', '18', '65', '18:32:00', '18:32:00');
INSERT INTO `ssc_data_time` VALUES ('5265', '18', '66', '18:42:00', '18:42:00');
INSERT INTO `ssc_data_time` VALUES ('5266', '18', '67', '18:52:00', '18:52:00');
INSERT INTO `ssc_data_time` VALUES ('5267', '18', '68', '19:02:00', '19:02:00');
INSERT INTO `ssc_data_time` VALUES ('5268', '18', '69', '19:12:00', '19:12:00');
INSERT INTO `ssc_data_time` VALUES ('5269', '18', '70', '19:22:00', '19:22:00');
INSERT INTO `ssc_data_time` VALUES ('5270', '18', '71', '19:32:00', '19:32:00');
INSERT INTO `ssc_data_time` VALUES ('5271', '18', '72', '19:42:00', '19:42:00');
INSERT INTO `ssc_data_time` VALUES ('5272', '18', '73', '19:52:00', '19:52:00');
INSERT INTO `ssc_data_time` VALUES ('5273', '18', '74', '20:02:00', '20:02:00');
INSERT INTO `ssc_data_time` VALUES ('5274', '18', '75', '20:12:00', '20:12:00');
INSERT INTO `ssc_data_time` VALUES ('5275', '18', '76', '20:22:00', '20:22:00');
INSERT INTO `ssc_data_time` VALUES ('5276', '18', '77', '20:32:00', '20:32:00');
INSERT INTO `ssc_data_time` VALUES ('5277', '18', '78', '20:42:00', '20:42:00');
INSERT INTO `ssc_data_time` VALUES ('5278', '18', '79', '20:52:00', '20:52:00');
INSERT INTO `ssc_data_time` VALUES ('5279', '18', '80', '21:02:00', '21:02:00');
INSERT INTO `ssc_data_time` VALUES ('5280', '18', '81', '21:12:00', '21:12:00');
INSERT INTO `ssc_data_time` VALUES ('5281', '18', '82', '21:22:00', '21:22:00');
INSERT INTO `ssc_data_time` VALUES ('5282', '18', '83', '21:32:00', '21:32:00');
INSERT INTO `ssc_data_time` VALUES ('5283', '18', '84', '21:42:00', '21:42:00');
INSERT INTO `ssc_data_time` VALUES ('5284', '18', '85', '21:52:00', '21:52:00');
INSERT INTO `ssc_data_time` VALUES ('5285', '18', '86', '22:02:00', '22:02:00');
INSERT INTO `ssc_data_time` VALUES ('5286', '18', '87', '22:12:00', '22:12:00');
INSERT INTO `ssc_data_time` VALUES ('5287', '18', '88', '22:22:00', '22:22:00');
INSERT INTO `ssc_data_time` VALUES ('5288', '18', '89', '22:32:00', '22:32:00');
INSERT INTO `ssc_data_time` VALUES ('5289', '18', '90', '22:42:00', '22:42:00');
INSERT INTO `ssc_data_time` VALUES ('5290', '18', '91', '22:52:00', '22:52:00');
INSERT INTO `ssc_data_time` VALUES ('5291', '18', '92', '23:02:00', '23:02:00');
INSERT INTO `ssc_data_time` VALUES ('5292', '18', '93', '23:12:00', '23:12:00');
INSERT INTO `ssc_data_time` VALUES ('5293', '18', '94', '23:22:00', '23:22:00');
INSERT INTO `ssc_data_time` VALUES ('5294', '18', '95', '23:32:00', '23:32:00');
INSERT INTO `ssc_data_time` VALUES ('5295', '18', '96', '23:42:00', '23:42:00');
INSERT INTO `ssc_data_time` VALUES ('5296', '18', '97', '23:52:00', '23:52:00');
INSERT INTO `ssc_data_time` VALUES ('4643', '26', '644', '21:28:00', '21:28:00');
INSERT INTO `ssc_data_time` VALUES ('4642', '26', '643', '21:26:00', '21:26:00');
INSERT INTO `ssc_data_time` VALUES ('4641', '26', '642', '21:24:00', '21:24:00');
INSERT INTO `ssc_data_time` VALUES ('4640', '26', '641', '21:22:00', '21:22:00');
INSERT INTO `ssc_data_time` VALUES ('4639', '26', '640', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('4638', '26', '639', '21:18:00', '21:18:00');
INSERT INTO `ssc_data_time` VALUES ('4637', '26', '638', '21:16:00', '21:16:00');
INSERT INTO `ssc_data_time` VALUES ('4636', '26', '637', '21:14:00', '21:14:00');
INSERT INTO `ssc_data_time` VALUES ('4635', '26', '636', '21:12:00', '21:12:00');
INSERT INTO `ssc_data_time` VALUES ('4634', '26', '635', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('4633', '26', '634', '21:08:00', '21:08:00');
INSERT INTO `ssc_data_time` VALUES ('4632', '26', '633', '21:06:00', '21:06:00');
INSERT INTO `ssc_data_time` VALUES ('4631', '26', '632', '21:04:00', '21:04:00');
INSERT INTO `ssc_data_time` VALUES ('4630', '26', '631', '21:02:00', '21:02:00');
INSERT INTO `ssc_data_time` VALUES ('4629', '26', '630', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('4628', '26', '629', '20:58:00', '20:58:00');
INSERT INTO `ssc_data_time` VALUES ('4627', '26', '628', '20:56:00', '20:56:00');
INSERT INTO `ssc_data_time` VALUES ('4626', '26', '627', '20:54:00', '20:54:00');
INSERT INTO `ssc_data_time` VALUES ('4625', '26', '626', '20:52:00', '20:52:00');
INSERT INTO `ssc_data_time` VALUES ('4624', '26', '625', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('4623', '26', '624', '20:48:00', '20:48:00');
INSERT INTO `ssc_data_time` VALUES ('4622', '26', '623', '20:46:00', '20:46:00');
INSERT INTO `ssc_data_time` VALUES ('4621', '26', '622', '20:44:00', '20:44:00');
INSERT INTO `ssc_data_time` VALUES ('4620', '26', '621', '20:42:00', '20:42:00');
INSERT INTO `ssc_data_time` VALUES ('4619', '26', '620', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('4618', '26', '619', '20:38:00', '20:38:00');
INSERT INTO `ssc_data_time` VALUES ('5200', '18', '1', '00:02:00', '00:02:00');
INSERT INTO `ssc_data_time` VALUES ('5201', '18', '2', '00:12:00', '00:12:00');
INSERT INTO `ssc_data_time` VALUES ('5202', '18', '3', '00:22:00', '00:22:00');
INSERT INTO `ssc_data_time` VALUES ('5203', '18', '4', '00:32:00', '00:32:00');
INSERT INTO `ssc_data_time` VALUES ('5204', '18', '5', '00:42:00', '00:42:00');
INSERT INTO `ssc_data_time` VALUES ('5205', '18', '6', '00:52:00', '00:52:00');
INSERT INTO `ssc_data_time` VALUES ('5206', '18', '7', '01:02:00', '01:02:00');
INSERT INTO `ssc_data_time` VALUES ('5207', '18', '8', '01:12:00', '01:12:00');
INSERT INTO `ssc_data_time` VALUES ('5208', '18', '9', '01:22:00', '01:22:00');
INSERT INTO `ssc_data_time` VALUES ('5209', '18', '10', '01:32:00', '01:32:00');
INSERT INTO `ssc_data_time` VALUES ('5210', '18', '11', '01:42:00', '01:42:00');
INSERT INTO `ssc_data_time` VALUES ('5211', '18', '12', '01:52:00', '01:52:00');
INSERT INTO `ssc_data_time` VALUES ('5212', '18', '13', '02:02:00', '02:02:00');
INSERT INTO `ssc_data_time` VALUES ('5213', '18', '14', '10:02:00', '10:02:00');
INSERT INTO `ssc_data_time` VALUES ('5214', '18', '15', '10:12:00', '10:12:00');
INSERT INTO `ssc_data_time` VALUES ('5215', '18', '16', '10:22:00', '10:22:00');
INSERT INTO `ssc_data_time` VALUES ('5216', '18', '17', '10:32:00', '10:32:00');
INSERT INTO `ssc_data_time` VALUES ('5217', '18', '18', '10:42:00', '10:42:00');
INSERT INTO `ssc_data_time` VALUES ('5218', '18', '19', '10:52:00', '10:52:00');
INSERT INTO `ssc_data_time` VALUES ('5219', '18', '20', '11:02:00', '11:02:00');
INSERT INTO `ssc_data_time` VALUES ('5220', '18', '21', '11:12:00', '11:12:00');
INSERT INTO `ssc_data_time` VALUES ('5221', '18', '22', '11:22:00', '11:22:00');
INSERT INTO `ssc_data_time` VALUES ('5222', '18', '23', '11:32:00', '11:32:00');
INSERT INTO `ssc_data_time` VALUES ('5223', '18', '24', '11:42:00', '11:42:00');
INSERT INTO `ssc_data_time` VALUES ('5224', '18', '25', '11:52:00', '11:52:00');
INSERT INTO `ssc_data_time` VALUES ('5225', '18', '26', '12:02:00', '12:02:00');
INSERT INTO `ssc_data_time` VALUES ('5226', '18', '27', '12:12:00', '12:12:00');
INSERT INTO `ssc_data_time` VALUES ('5227', '18', '28', '12:22:00', '12:22:00');
INSERT INTO `ssc_data_time` VALUES ('5228', '18', '29', '12:32:00', '12:32:00');
INSERT INTO `ssc_data_time` VALUES ('5229', '18', '30', '12:42:00', '12:42:00');
INSERT INTO `ssc_data_time` VALUES ('5230', '18', '31', '12:52:00', '12:52:00');
INSERT INTO `ssc_data_time` VALUES ('5231', '18', '32', '13:02:00', '13:02:00');
INSERT INTO `ssc_data_time` VALUES ('5232', '18', '33', '13:12:00', '13:12:00');
INSERT INTO `ssc_data_time` VALUES ('5233', '18', '34', '13:22:00', '13:22:00');
INSERT INTO `ssc_data_time` VALUES ('5234', '18', '35', '13:32:00', '13:32:00');
INSERT INTO `ssc_data_time` VALUES ('5235', '18', '36', '13:42:00', '13:42:00');
INSERT INTO `ssc_data_time` VALUES ('5236', '18', '37', '13:52:00', '13:52:00');
INSERT INTO `ssc_data_time` VALUES ('5237', '18', '38', '14:02:00', '14:02:00');
INSERT INTO `ssc_data_time` VALUES ('5238', '18', '39', '14:12:00', '14:12:00');
INSERT INTO `ssc_data_time` VALUES ('5239', '18', '40', '14:22:00', '14:22:00');
INSERT INTO `ssc_data_time` VALUES ('5240', '18', '41', '14:32:00', '14:32:00');
INSERT INTO `ssc_data_time` VALUES ('5241', '18', '42', '14:42:00', '14:42:00');
INSERT INTO `ssc_data_time` VALUES ('5242', '18', '43', '14:52:00', '14:52:00');
INSERT INTO `ssc_data_time` VALUES ('5243', '18', '44', '15:02:00', '15:02:00');
INSERT INTO `ssc_data_time` VALUES ('5244', '18', '45', '15:12:00', '15:12:00');
INSERT INTO `ssc_data_time` VALUES ('5245', '18', '46', '15:22:00', '15:22:00');
INSERT INTO `ssc_data_time` VALUES ('5246', '18', '47', '15:32:00', '15:32:00');
INSERT INTO `ssc_data_time` VALUES ('5247', '18', '48', '15:42:00', '15:42:00');
INSERT INTO `ssc_data_time` VALUES ('5248', '18', '49', '15:52:00', '15:52:00');
INSERT INTO `ssc_data_time` VALUES ('5249', '18', '50', '16:02:00', '16:02:00');
INSERT INTO `ssc_data_time` VALUES ('5250', '18', '51', '16:12:00', '16:12:00');
INSERT INTO `ssc_data_time` VALUES ('5251', '18', '52', '16:22:00', '16:22:00');
INSERT INTO `ssc_data_time` VALUES ('5252', '18', '53', '16:32:00', '16:32:00');
INSERT INTO `ssc_data_time` VALUES ('5253', '18', '54', '16:42:00', '16:42:00');
INSERT INTO `ssc_data_time` VALUES ('5254', '18', '55', '16:52:00', '16:52:00');
INSERT INTO `ssc_data_time` VALUES ('5077', '7', '78', '21:55:00', '21:55:00');
INSERT INTO `ssc_data_time` VALUES ('5076', '7', '77', '21:45:00', '21:45:00');
INSERT INTO `ssc_data_time` VALUES ('5075', '7', '76', '21:35:00', '21:35:00');
INSERT INTO `ssc_data_time` VALUES ('5074', '7', '75', '21:25:00', '21:25:00');
INSERT INTO `ssc_data_time` VALUES ('5073', '7', '74', '21:15:00', '21:15:00');
INSERT INTO `ssc_data_time` VALUES ('5072', '7', '73', '21:05:00', '21:05:00');
INSERT INTO `ssc_data_time` VALUES ('5071', '7', '72', '20:55:00', '20:55:00');
INSERT INTO `ssc_data_time` VALUES ('5070', '7', '71', '20:45:00', '20:45:00');
INSERT INTO `ssc_data_time` VALUES ('5069', '7', '70', '20:35:00', '20:35:00');
INSERT INTO `ssc_data_time` VALUES ('5068', '7', '69', '20:25:00', '20:25:00');
INSERT INTO `ssc_data_time` VALUES ('5067', '7', '68', '20:15:00', '20:15:00');
INSERT INTO `ssc_data_time` VALUES ('5066', '7', '67', '20:05:00', '20:05:00');
INSERT INTO `ssc_data_time` VALUES ('5065', '7', '66', '19:55:00', '19:55:00');
INSERT INTO `ssc_data_time` VALUES ('5064', '7', '65', '19:45:00', '19:45:00');
INSERT INTO `ssc_data_time` VALUES ('5063', '7', '64', '19:35:00', '19:35:00');
INSERT INTO `ssc_data_time` VALUES ('5062', '7', '63', '19:25:00', '19:25:00');
INSERT INTO `ssc_data_time` VALUES ('5061', '7', '62', '19:15:00', '19:15:00');
INSERT INTO `ssc_data_time` VALUES ('5060', '7', '61', '19:05:00', '19:05:00');
INSERT INTO `ssc_data_time` VALUES ('5059', '7', '60', '18:55:00', '18:55:00');
INSERT INTO `ssc_data_time` VALUES ('5058', '7', '59', '18:45:00', '18:45:00');
INSERT INTO `ssc_data_time` VALUES ('5057', '7', '58', '18:35:00', '18:35:00');
INSERT INTO `ssc_data_time` VALUES ('5056', '7', '57', '18:25:00', '18:25:00');
INSERT INTO `ssc_data_time` VALUES ('5055', '7', '56', '18:15:00', '18:15:00');
INSERT INTO `ssc_data_time` VALUES ('6939', '5', '1440', '23:59:00', '23:59:00');
INSERT INTO `ssc_data_time` VALUES ('6938', '5', '1439', '23:58:00', '23:58:00');
INSERT INTO `ssc_data_time` VALUES ('6937', '5', '1438', '23:57:00', '23:57:00');
INSERT INTO `ssc_data_time` VALUES ('6936', '5', '1437', '23:56:00', '23:56:00');
INSERT INTO `ssc_data_time` VALUES ('6935', '5', '1436', '23:55:00', '23:55:00');
INSERT INTO `ssc_data_time` VALUES ('6934', '5', '1435', '23:54:00', '23:54:00');
INSERT INTO `ssc_data_time` VALUES ('6933', '5', '1434', '23:53:00', '23:53:00');
INSERT INTO `ssc_data_time` VALUES ('6932', '5', '1433', '23:52:00', '23:52:00');
INSERT INTO `ssc_data_time` VALUES ('6931', '5', '1432', '23:51:00', '23:51:00');
INSERT INTO `ssc_data_time` VALUES ('6930', '5', '1431', '23:50:00', '23:50:00');
INSERT INTO `ssc_data_time` VALUES ('6929', '5', '1430', '23:49:00', '23:49:00');
INSERT INTO `ssc_data_time` VALUES ('6928', '5', '1429', '23:48:00', '23:48:00');
INSERT INTO `ssc_data_time` VALUES ('6927', '5', '1428', '23:47:00', '23:47:00');
INSERT INTO `ssc_data_time` VALUES ('6926', '5', '1427', '23:46:00', '23:46:00');
INSERT INTO `ssc_data_time` VALUES ('6925', '5', '1426', '23:45:00', '23:45:00');
INSERT INTO `ssc_data_time` VALUES ('6924', '5', '1425', '23:44:00', '23:44:00');
INSERT INTO `ssc_data_time` VALUES ('6923', '5', '1424', '23:43:00', '23:43:00');
INSERT INTO `ssc_data_time` VALUES ('6922', '5', '1423', '23:42:00', '23:42:00');
INSERT INTO `ssc_data_time` VALUES ('6921', '5', '1422', '23:41:00', '23:41:00');
INSERT INTO `ssc_data_time` VALUES ('6920', '5', '1421', '23:40:00', '23:40:00');
INSERT INTO `ssc_data_time` VALUES ('6919', '5', '1420', '23:39:00', '23:39:00');
INSERT INTO `ssc_data_time` VALUES ('6918', '5', '1419', '23:38:00', '23:38:00');
INSERT INTO `ssc_data_time` VALUES ('6917', '5', '1418', '23:37:00', '23:37:00');
INSERT INTO `ssc_data_time` VALUES ('6916', '5', '1417', '23:36:00', '23:36:00');
INSERT INTO `ssc_data_time` VALUES ('6915', '5', '1416', '23:35:00', '23:35:00');
INSERT INTO `ssc_data_time` VALUES ('6914', '5', '1415', '23:34:00', '23:34:00');
INSERT INTO `ssc_data_time` VALUES ('6913', '5', '1414', '23:33:00', '23:33:00');
INSERT INTO `ssc_data_time` VALUES ('6912', '5', '1413', '23:32:00', '23:32:00');
INSERT INTO `ssc_data_time` VALUES ('6911', '5', '1412', '23:31:00', '23:31:00');
INSERT INTO `ssc_data_time` VALUES ('6910', '5', '1411', '23:30:00', '23:30:00');
INSERT INTO `ssc_data_time` VALUES ('6909', '5', '1410', '23:29:00', '23:29:00');
INSERT INTO `ssc_data_time` VALUES ('6908', '5', '1409', '23:28:00', '23:28:00');
INSERT INTO `ssc_data_time` VALUES ('6907', '5', '1408', '23:27:00', '23:27:00');
INSERT INTO `ssc_data_time` VALUES ('6906', '5', '1407', '23:26:00', '23:26:00');
INSERT INTO `ssc_data_time` VALUES ('6905', '5', '1406', '23:25:00', '23:25:00');
INSERT INTO `ssc_data_time` VALUES ('6904', '5', '1405', '23:24:00', '23:24:00');
INSERT INTO `ssc_data_time` VALUES ('6903', '5', '1404', '23:23:00', '23:23:00');
INSERT INTO `ssc_data_time` VALUES ('6902', '5', '1403', '23:22:00', '23:22:00');
INSERT INTO `ssc_data_time` VALUES ('6901', '5', '1402', '23:21:00', '23:21:00');
INSERT INTO `ssc_data_time` VALUES ('6900', '5', '1401', '23:20:00', '23:20:00');
INSERT INTO `ssc_data_time` VALUES ('6899', '5', '1400', '23:19:00', '23:19:00');
INSERT INTO `ssc_data_time` VALUES ('6898', '5', '1399', '23:18:00', '23:18:00');
INSERT INTO `ssc_data_time` VALUES ('6897', '5', '1398', '23:17:00', '23:17:00');
INSERT INTO `ssc_data_time` VALUES ('6896', '5', '1397', '23:16:00', '23:16:00');
INSERT INTO `ssc_data_time` VALUES ('6895', '5', '1396', '23:15:00', '23:15:00');
INSERT INTO `ssc_data_time` VALUES ('6894', '5', '1395', '23:14:00', '23:14:00');
INSERT INTO `ssc_data_time` VALUES ('6893', '5', '1394', '23:13:00', '23:13:00');
INSERT INTO `ssc_data_time` VALUES ('6892', '5', '1393', '23:12:00', '23:12:00');
INSERT INTO `ssc_data_time` VALUES ('6891', '5', '1392', '23:11:00', '23:11:00');
INSERT INTO `ssc_data_time` VALUES ('6890', '5', '1391', '23:10:00', '23:10:00');
INSERT INTO `ssc_data_time` VALUES ('6889', '5', '1390', '23:09:00', '23:09:00');
INSERT INTO `ssc_data_time` VALUES ('6888', '5', '1389', '23:08:00', '23:08:00');
INSERT INTO `ssc_data_time` VALUES ('6887', '5', '1388', '23:07:00', '23:07:00');
INSERT INTO `ssc_data_time` VALUES ('6886', '5', '1387', '23:06:00', '23:06:00');
INSERT INTO `ssc_data_time` VALUES ('6885', '5', '1386', '23:05:00', '23:05:00');
INSERT INTO `ssc_data_time` VALUES ('6884', '5', '1385', '23:04:00', '23:04:00');
INSERT INTO `ssc_data_time` VALUES ('6883', '5', '1384', '23:03:00', '23:03:00');
INSERT INTO `ssc_data_time` VALUES ('6882', '5', '1383', '23:02:00', '23:02:00');
INSERT INTO `ssc_data_time` VALUES ('6881', '5', '1382', '23:01:00', '23:01:00');
INSERT INTO `ssc_data_time` VALUES ('6880', '5', '1381', '23:00:00', '23:00:00');
INSERT INTO `ssc_data_time` VALUES ('6879', '5', '1380', '22:59:00', '22:59:00');
INSERT INTO `ssc_data_time` VALUES ('6878', '5', '1379', '22:58:00', '22:58:00');
INSERT INTO `ssc_data_time` VALUES ('6877', '5', '1378', '22:57:00', '22:57:00');
INSERT INTO `ssc_data_time` VALUES ('6876', '5', '1377', '22:56:00', '22:56:00');
INSERT INTO `ssc_data_time` VALUES ('6875', '5', '1376', '22:55:00', '22:55:00');
INSERT INTO `ssc_data_time` VALUES ('6874', '5', '1375', '22:54:00', '22:54:00');
INSERT INTO `ssc_data_time` VALUES ('6873', '5', '1374', '22:53:00', '22:53:00');
INSERT INTO `ssc_data_time` VALUES ('6872', '5', '1373', '22:52:00', '22:52:00');
INSERT INTO `ssc_data_time` VALUES ('6871', '5', '1372', '22:51:00', '22:51:00');
INSERT INTO `ssc_data_time` VALUES ('6870', '5', '1371', '22:50:00', '22:50:00');
INSERT INTO `ssc_data_time` VALUES ('6869', '5', '1370', '22:49:00', '22:49:00');
INSERT INTO `ssc_data_time` VALUES ('6868', '5', '1369', '22:48:00', '22:48:00');
INSERT INTO `ssc_data_time` VALUES ('6867', '5', '1368', '22:47:00', '22:47:00');
INSERT INTO `ssc_data_time` VALUES ('6866', '5', '1367', '22:46:00', '22:46:00');
INSERT INTO `ssc_data_time` VALUES ('6865', '5', '1366', '22:45:00', '22:45:00');
INSERT INTO `ssc_data_time` VALUES ('6864', '5', '1365', '22:44:00', '22:44:00');
INSERT INTO `ssc_data_time` VALUES ('6863', '5', '1364', '22:43:00', '22:43:00');
INSERT INTO `ssc_data_time` VALUES ('6862', '5', '1363', '22:42:00', '22:42:00');
INSERT INTO `ssc_data_time` VALUES ('6861', '5', '1362', '22:41:00', '22:41:00');
INSERT INTO `ssc_data_time` VALUES ('6860', '5', '1361', '22:40:00', '22:40:00');
INSERT INTO `ssc_data_time` VALUES ('6859', '5', '1360', '22:39:00', '22:39:00');
INSERT INTO `ssc_data_time` VALUES ('6858', '5', '1359', '22:38:00', '22:38:00');
INSERT INTO `ssc_data_time` VALUES ('6857', '5', '1358', '22:37:00', '22:37:00');
INSERT INTO `ssc_data_time` VALUES ('6856', '5', '1357', '22:36:00', '22:36:00');
INSERT INTO `ssc_data_time` VALUES ('6855', '5', '1356', '22:35:00', '22:35:00');
INSERT INTO `ssc_data_time` VALUES ('6854', '5', '1355', '22:34:00', '22:34:00');
INSERT INTO `ssc_data_time` VALUES ('6853', '5', '1354', '22:33:00', '22:33:00');
INSERT INTO `ssc_data_time` VALUES ('6852', '5', '1353', '22:32:00', '22:32:00');
INSERT INTO `ssc_data_time` VALUES ('6851', '5', '1352', '22:31:00', '22:31:00');
INSERT INTO `ssc_data_time` VALUES ('6850', '5', '1351', '22:30:00', '22:30:00');
INSERT INTO `ssc_data_time` VALUES ('6849', '5', '1350', '22:29:00', '22:29:00');
INSERT INTO `ssc_data_time` VALUES ('6848', '5', '1349', '22:28:00', '22:28:00');
INSERT INTO `ssc_data_time` VALUES ('6847', '5', '1348', '22:27:00', '22:27:00');
INSERT INTO `ssc_data_time` VALUES ('6846', '5', '1347', '22:26:00', '22:26:00');
INSERT INTO `ssc_data_time` VALUES ('6845', '5', '1346', '22:25:00', '22:25:00');
INSERT INTO `ssc_data_time` VALUES ('6844', '5', '1345', '22:24:00', '22:24:00');
INSERT INTO `ssc_data_time` VALUES ('6843', '5', '1344', '22:23:00', '22:23:00');
INSERT INTO `ssc_data_time` VALUES ('6842', '5', '1343', '22:22:00', '22:22:00');
INSERT INTO `ssc_data_time` VALUES ('6841', '5', '1342', '22:21:00', '22:21:00');
INSERT INTO `ssc_data_time` VALUES ('6840', '5', '1341', '22:20:00', '22:20:00');
INSERT INTO `ssc_data_time` VALUES ('6839', '5', '1340', '22:19:00', '22:19:00');
INSERT INTO `ssc_data_time` VALUES ('6838', '5', '1339', '22:18:00', '22:18:00');
INSERT INTO `ssc_data_time` VALUES ('6837', '5', '1338', '22:17:00', '22:17:00');
INSERT INTO `ssc_data_time` VALUES ('6836', '5', '1337', '22:16:00', '22:16:00');
INSERT INTO `ssc_data_time` VALUES ('6835', '5', '1336', '22:15:00', '22:15:00');
INSERT INTO `ssc_data_time` VALUES ('6834', '5', '1335', '22:14:00', '22:14:00');
INSERT INTO `ssc_data_time` VALUES ('6833', '5', '1334', '22:13:00', '22:13:00');
INSERT INTO `ssc_data_time` VALUES ('6832', '5', '1333', '22:12:00', '22:12:00');
INSERT INTO `ssc_data_time` VALUES ('6831', '5', '1332', '22:11:00', '22:11:00');
INSERT INTO `ssc_data_time` VALUES ('6830', '5', '1331', '22:10:00', '22:10:00');
INSERT INTO `ssc_data_time` VALUES ('6829', '5', '1330', '22:09:00', '22:09:00');
INSERT INTO `ssc_data_time` VALUES ('6828', '5', '1329', '22:08:00', '22:08:00');
INSERT INTO `ssc_data_time` VALUES ('6827', '5', '1328', '22:07:00', '22:07:00');
INSERT INTO `ssc_data_time` VALUES ('6826', '5', '1327', '22:06:00', '22:06:00');
INSERT INTO `ssc_data_time` VALUES ('6825', '5', '1326', '22:05:00', '22:05:00');
INSERT INTO `ssc_data_time` VALUES ('6824', '5', '1325', '22:04:00', '22:04:00');
INSERT INTO `ssc_data_time` VALUES ('6823', '5', '1324', '22:03:00', '22:03:00');
INSERT INTO `ssc_data_time` VALUES ('6822', '5', '1323', '22:02:00', '22:02:00');
INSERT INTO `ssc_data_time` VALUES ('6821', '5', '1322', '22:01:00', '22:01:00');
INSERT INTO `ssc_data_time` VALUES ('6820', '5', '1321', '22:00:00', '22:00:00');
INSERT INTO `ssc_data_time` VALUES ('6819', '5', '1320', '21:59:00', '21:59:00');
INSERT INTO `ssc_data_time` VALUES ('6818', '5', '1319', '21:58:00', '21:58:00');
INSERT INTO `ssc_data_time` VALUES ('6817', '5', '1318', '21:57:00', '21:57:00');
INSERT INTO `ssc_data_time` VALUES ('6816', '5', '1317', '21:56:00', '21:56:00');
INSERT INTO `ssc_data_time` VALUES ('6815', '5', '1316', '21:55:00', '21:55:00');
INSERT INTO `ssc_data_time` VALUES ('6814', '5', '1315', '21:54:00', '21:54:00');
INSERT INTO `ssc_data_time` VALUES ('6813', '5', '1314', '21:53:00', '21:53:00');
INSERT INTO `ssc_data_time` VALUES ('6812', '5', '1313', '21:52:00', '21:52:00');
INSERT INTO `ssc_data_time` VALUES ('6811', '5', '1312', '21:51:00', '21:51:00');
INSERT INTO `ssc_data_time` VALUES ('6810', '5', '1311', '21:50:00', '21:50:00');
INSERT INTO `ssc_data_time` VALUES ('6809', '5', '1310', '21:49:00', '21:49:00');
INSERT INTO `ssc_data_time` VALUES ('6808', '5', '1309', '21:48:00', '21:48:00');
INSERT INTO `ssc_data_time` VALUES ('6807', '5', '1308', '21:47:00', '21:47:00');
INSERT INTO `ssc_data_time` VALUES ('6806', '5', '1307', '21:46:00', '21:46:00');
INSERT INTO `ssc_data_time` VALUES ('6805', '5', '1306', '21:45:00', '21:45:00');
INSERT INTO `ssc_data_time` VALUES ('6804', '5', '1305', '21:44:00', '21:44:00');
INSERT INTO `ssc_data_time` VALUES ('6803', '5', '1304', '21:43:00', '21:43:00');
INSERT INTO `ssc_data_time` VALUES ('6802', '5', '1303', '21:42:00', '21:42:00');
INSERT INTO `ssc_data_time` VALUES ('6801', '5', '1302', '21:41:00', '21:41:00');
INSERT INTO `ssc_data_time` VALUES ('6800', '5', '1301', '21:40:00', '21:40:00');
INSERT INTO `ssc_data_time` VALUES ('6799', '5', '1300', '21:39:00', '21:39:00');
INSERT INTO `ssc_data_time` VALUES ('6798', '5', '1299', '21:38:00', '21:38:00');
INSERT INTO `ssc_data_time` VALUES ('6797', '5', '1298', '21:37:00', '21:37:00');
INSERT INTO `ssc_data_time` VALUES ('6796', '5', '1297', '21:36:00', '21:36:00');
INSERT INTO `ssc_data_time` VALUES ('6795', '5', '1296', '21:35:00', '21:35:00');
INSERT INTO `ssc_data_time` VALUES ('6794', '5', '1295', '21:34:00', '21:34:00');
INSERT INTO `ssc_data_time` VALUES ('6793', '5', '1294', '21:33:00', '21:33:00');
INSERT INTO `ssc_data_time` VALUES ('6792', '5', '1293', '21:32:00', '21:32:00');
INSERT INTO `ssc_data_time` VALUES ('6791', '5', '1292', '21:31:00', '21:31:00');
INSERT INTO `ssc_data_time` VALUES ('6790', '5', '1291', '21:30:00', '21:30:00');
INSERT INTO `ssc_data_time` VALUES ('6789', '5', '1290', '21:29:00', '21:29:00');
INSERT INTO `ssc_data_time` VALUES ('6788', '5', '1289', '21:28:00', '21:28:00');
INSERT INTO `ssc_data_time` VALUES ('6787', '5', '1288', '21:27:00', '21:27:00');
INSERT INTO `ssc_data_time` VALUES ('6786', '5', '1287', '21:26:00', '21:26:00');
INSERT INTO `ssc_data_time` VALUES ('6785', '5', '1286', '21:25:00', '21:25:00');
INSERT INTO `ssc_data_time` VALUES ('6784', '5', '1285', '21:24:00', '21:24:00');
INSERT INTO `ssc_data_time` VALUES ('6783', '5', '1284', '21:23:00', '21:23:00');
INSERT INTO `ssc_data_time` VALUES ('6782', '5', '1283', '21:22:00', '21:22:00');
INSERT INTO `ssc_data_time` VALUES ('6781', '5', '1282', '21:21:00', '21:21:00');
INSERT INTO `ssc_data_time` VALUES ('6780', '5', '1281', '21:20:00', '21:20:00');
INSERT INTO `ssc_data_time` VALUES ('6779', '5', '1280', '21:19:00', '21:19:00');
INSERT INTO `ssc_data_time` VALUES ('6778', '5', '1279', '21:18:00', '21:18:00');
INSERT INTO `ssc_data_time` VALUES ('6777', '5', '1278', '21:17:00', '21:17:00');
INSERT INTO `ssc_data_time` VALUES ('6776', '5', '1277', '21:16:00', '21:16:00');
INSERT INTO `ssc_data_time` VALUES ('6775', '5', '1276', '21:15:00', '21:15:00');
INSERT INTO `ssc_data_time` VALUES ('6774', '5', '1275', '21:14:00', '21:14:00');
INSERT INTO `ssc_data_time` VALUES ('6773', '5', '1274', '21:13:00', '21:13:00');
INSERT INTO `ssc_data_time` VALUES ('6772', '5', '1273', '21:12:00', '21:12:00');
INSERT INTO `ssc_data_time` VALUES ('6771', '5', '1272', '21:11:00', '21:11:00');
INSERT INTO `ssc_data_time` VALUES ('6770', '5', '1271', '21:10:00', '21:10:00');
INSERT INTO `ssc_data_time` VALUES ('6769', '5', '1270', '21:09:00', '21:09:00');
INSERT INTO `ssc_data_time` VALUES ('6768', '5', '1269', '21:08:00', '21:08:00');
INSERT INTO `ssc_data_time` VALUES ('6767', '5', '1268', '21:07:00', '21:07:00');
INSERT INTO `ssc_data_time` VALUES ('6766', '5', '1267', '21:06:00', '21:06:00');
INSERT INTO `ssc_data_time` VALUES ('6765', '5', '1266', '21:05:00', '21:05:00');
INSERT INTO `ssc_data_time` VALUES ('6764', '5', '1265', '21:04:00', '21:04:00');
INSERT INTO `ssc_data_time` VALUES ('6763', '5', '1264', '21:03:00', '21:03:00');
INSERT INTO `ssc_data_time` VALUES ('6762', '5', '1263', '21:02:00', '21:02:00');
INSERT INTO `ssc_data_time` VALUES ('6761', '5', '1262', '21:01:00', '21:01:00');
INSERT INTO `ssc_data_time` VALUES ('6760', '5', '1261', '21:00:00', '21:00:00');
INSERT INTO `ssc_data_time` VALUES ('6759', '5', '1260', '20:59:00', '20:59:00');
INSERT INTO `ssc_data_time` VALUES ('6758', '5', '1259', '20:58:00', '20:58:00');
INSERT INTO `ssc_data_time` VALUES ('6757', '5', '1258', '20:57:00', '20:57:00');
INSERT INTO `ssc_data_time` VALUES ('6756', '5', '1257', '20:56:00', '20:56:00');
INSERT INTO `ssc_data_time` VALUES ('6755', '5', '1256', '20:55:00', '20:55:00');
INSERT INTO `ssc_data_time` VALUES ('6754', '5', '1255', '20:54:00', '20:54:00');
INSERT INTO `ssc_data_time` VALUES ('6753', '5', '1254', '20:53:00', '20:53:00');
INSERT INTO `ssc_data_time` VALUES ('6752', '5', '1253', '20:52:00', '20:52:00');
INSERT INTO `ssc_data_time` VALUES ('6751', '5', '1252', '20:51:00', '20:51:00');
INSERT INTO `ssc_data_time` VALUES ('6750', '5', '1251', '20:50:00', '20:50:00');
INSERT INTO `ssc_data_time` VALUES ('6749', '5', '1250', '20:49:00', '20:49:00');
INSERT INTO `ssc_data_time` VALUES ('6748', '5', '1249', '20:48:00', '20:48:00');
INSERT INTO `ssc_data_time` VALUES ('6747', '5', '1248', '20:47:00', '20:47:00');
INSERT INTO `ssc_data_time` VALUES ('6746', '5', '1247', '20:46:00', '20:46:00');
INSERT INTO `ssc_data_time` VALUES ('6745', '5', '1246', '20:45:00', '20:45:00');
INSERT INTO `ssc_data_time` VALUES ('6744', '5', '1245', '20:44:00', '20:44:00');
INSERT INTO `ssc_data_time` VALUES ('6743', '5', '1244', '20:43:00', '20:43:00');
INSERT INTO `ssc_data_time` VALUES ('6742', '5', '1243', '20:42:00', '20:42:00');
INSERT INTO `ssc_data_time` VALUES ('6741', '5', '1242', '20:41:00', '20:41:00');
INSERT INTO `ssc_data_time` VALUES ('6740', '5', '1241', '20:40:00', '20:40:00');
INSERT INTO `ssc_data_time` VALUES ('6739', '5', '1240', '20:39:00', '20:39:00');
INSERT INTO `ssc_data_time` VALUES ('6738', '5', '1239', '20:38:00', '20:38:00');
INSERT INTO `ssc_data_time` VALUES ('6737', '5', '1238', '20:37:00', '20:37:00');
INSERT INTO `ssc_data_time` VALUES ('6736', '5', '1237', '20:36:00', '20:36:00');
INSERT INTO `ssc_data_time` VALUES ('6735', '5', '1236', '20:35:00', '20:35:00');
INSERT INTO `ssc_data_time` VALUES ('6734', '5', '1235', '20:34:00', '20:34:00');
INSERT INTO `ssc_data_time` VALUES ('6733', '5', '1234', '20:33:00', '20:33:00');
INSERT INTO `ssc_data_time` VALUES ('6732', '5', '1233', '20:32:00', '20:32:00');
INSERT INTO `ssc_data_time` VALUES ('6731', '5', '1232', '20:31:00', '20:31:00');
INSERT INTO `ssc_data_time` VALUES ('6730', '5', '1231', '20:30:00', '20:30:00');
INSERT INTO `ssc_data_time` VALUES ('6729', '5', '1230', '20:29:00', '20:29:00');
INSERT INTO `ssc_data_time` VALUES ('6728', '5', '1229', '20:28:00', '20:28:00');
INSERT INTO `ssc_data_time` VALUES ('6727', '5', '1228', '20:27:00', '20:27:00');
INSERT INTO `ssc_data_time` VALUES ('6726', '5', '1227', '20:26:00', '20:26:00');
INSERT INTO `ssc_data_time` VALUES ('6725', '5', '1226', '20:25:00', '20:25:00');
INSERT INTO `ssc_data_time` VALUES ('6724', '5', '1225', '20:24:00', '20:24:00');
INSERT INTO `ssc_data_time` VALUES ('6723', '5', '1224', '20:23:00', '20:23:00');
INSERT INTO `ssc_data_time` VALUES ('6722', '5', '1223', '20:22:00', '20:22:00');
INSERT INTO `ssc_data_time` VALUES ('6721', '5', '1222', '20:21:00', '20:21:00');
INSERT INTO `ssc_data_time` VALUES ('6720', '5', '1221', '20:20:00', '20:20:00');
INSERT INTO `ssc_data_time` VALUES ('6719', '5', '1220', '20:19:00', '20:19:00');
INSERT INTO `ssc_data_time` VALUES ('6718', '5', '1219', '20:18:00', '20:18:00');
INSERT INTO `ssc_data_time` VALUES ('6717', '5', '1218', '20:17:00', '20:17:00');
INSERT INTO `ssc_data_time` VALUES ('6716', '5', '1217', '20:16:00', '20:16:00');
INSERT INTO `ssc_data_time` VALUES ('6715', '5', '1216', '20:15:00', '20:15:00');
INSERT INTO `ssc_data_time` VALUES ('6714', '5', '1215', '20:14:00', '20:14:00');
INSERT INTO `ssc_data_time` VALUES ('6713', '5', '1214', '20:13:00', '20:13:00');
INSERT INTO `ssc_data_time` VALUES ('6712', '5', '1213', '20:12:00', '20:12:00');
INSERT INTO `ssc_data_time` VALUES ('6711', '5', '1212', '20:11:00', '20:11:00');
INSERT INTO `ssc_data_time` VALUES ('6710', '5', '1211', '20:10:00', '20:10:00');
INSERT INTO `ssc_data_time` VALUES ('6709', '5', '1210', '20:09:00', '20:09:00');
INSERT INTO `ssc_data_time` VALUES ('6708', '5', '1209', '20:08:00', '20:08:00');
INSERT INTO `ssc_data_time` VALUES ('6707', '5', '1208', '20:07:00', '20:07:00');
INSERT INTO `ssc_data_time` VALUES ('6706', '5', '1207', '20:06:00', '20:06:00');
INSERT INTO `ssc_data_time` VALUES ('6705', '5', '1206', '20:05:00', '20:05:00');
INSERT INTO `ssc_data_time` VALUES ('6704', '5', '1205', '20:04:00', '20:04:00');
INSERT INTO `ssc_data_time` VALUES ('6703', '5', '1204', '20:03:00', '20:03:00');
INSERT INTO `ssc_data_time` VALUES ('6702', '5', '1203', '20:02:00', '20:02:00');
INSERT INTO `ssc_data_time` VALUES ('6701', '5', '1202', '20:01:00', '20:01:00');
INSERT INTO `ssc_data_time` VALUES ('6700', '5', '1201', '20:00:00', '20:00:00');
INSERT INTO `ssc_data_time` VALUES ('6699', '5', '1200', '19:59:00', '19:59:00');
INSERT INTO `ssc_data_time` VALUES ('6698', '5', '1199', '19:58:00', '19:58:00');
INSERT INTO `ssc_data_time` VALUES ('6697', '5', '1198', '19:57:00', '19:57:00');
INSERT INTO `ssc_data_time` VALUES ('6696', '5', '1197', '19:56:00', '19:56:00');
INSERT INTO `ssc_data_time` VALUES ('6695', '5', '1196', '19:55:00', '19:55:00');
INSERT INTO `ssc_data_time` VALUES ('6694', '5', '1195', '19:54:00', '19:54:00');
INSERT INTO `ssc_data_time` VALUES ('6693', '5', '1194', '19:53:00', '19:53:00');
INSERT INTO `ssc_data_time` VALUES ('6692', '5', '1193', '19:52:00', '19:52:00');
INSERT INTO `ssc_data_time` VALUES ('6691', '5', '1192', '19:51:00', '19:51:00');
INSERT INTO `ssc_data_time` VALUES ('6690', '5', '1191', '19:50:00', '19:50:00');
INSERT INTO `ssc_data_time` VALUES ('6689', '5', '1190', '19:49:00', '19:49:00');
INSERT INTO `ssc_data_time` VALUES ('6688', '5', '1189', '19:48:00', '19:48:00');
INSERT INTO `ssc_data_time` VALUES ('6687', '5', '1188', '19:47:00', '19:47:00');
INSERT INTO `ssc_data_time` VALUES ('6686', '5', '1187', '19:46:00', '19:46:00');
INSERT INTO `ssc_data_time` VALUES ('6685', '5', '1186', '19:45:00', '19:45:00');
INSERT INTO `ssc_data_time` VALUES ('6684', '5', '1185', '19:44:00', '19:44:00');
INSERT INTO `ssc_data_time` VALUES ('6683', '5', '1184', '19:43:00', '19:43:00');
INSERT INTO `ssc_data_time` VALUES ('6682', '5', '1183', '19:42:00', '19:42:00');
INSERT INTO `ssc_data_time` VALUES ('6681', '5', '1182', '19:41:00', '19:41:00');
INSERT INTO `ssc_data_time` VALUES ('6680', '5', '1181', '19:40:00', '19:40:00');
INSERT INTO `ssc_data_time` VALUES ('6679', '5', '1180', '19:39:00', '19:39:00');
INSERT INTO `ssc_data_time` VALUES ('6678', '5', '1179', '19:38:00', '19:38:00');
INSERT INTO `ssc_data_time` VALUES ('6677', '5', '1178', '19:37:00', '19:37:00');
INSERT INTO `ssc_data_time` VALUES ('6676', '5', '1177', '19:36:00', '19:36:00');
INSERT INTO `ssc_data_time` VALUES ('6675', '5', '1176', '19:35:00', '19:35:00');
INSERT INTO `ssc_data_time` VALUES ('6674', '5', '1175', '19:34:00', '19:34:00');
INSERT INTO `ssc_data_time` VALUES ('6673', '5', '1174', '19:33:00', '19:33:00');
INSERT INTO `ssc_data_time` VALUES ('6672', '5', '1173', '19:32:00', '19:32:00');
INSERT INTO `ssc_data_time` VALUES ('6671', '5', '1172', '19:31:00', '19:31:00');
INSERT INTO `ssc_data_time` VALUES ('6670', '5', '1171', '19:30:00', '19:30:00');
INSERT INTO `ssc_data_time` VALUES ('6669', '5', '1170', '19:29:00', '19:29:00');
INSERT INTO `ssc_data_time` VALUES ('6668', '5', '1169', '19:28:00', '19:28:00');
INSERT INTO `ssc_data_time` VALUES ('6667', '5', '1168', '19:27:00', '19:27:00');
INSERT INTO `ssc_data_time` VALUES ('6666', '5', '1167', '19:26:00', '19:26:00');
INSERT INTO `ssc_data_time` VALUES ('6665', '5', '1166', '19:25:00', '19:25:00');
INSERT INTO `ssc_data_time` VALUES ('6664', '5', '1165', '19:24:00', '19:24:00');
INSERT INTO `ssc_data_time` VALUES ('6663', '5', '1164', '19:23:00', '19:23:00');
INSERT INTO `ssc_data_time` VALUES ('6662', '5', '1163', '19:22:00', '19:22:00');
INSERT INTO `ssc_data_time` VALUES ('6661', '5', '1162', '19:21:00', '19:21:00');
INSERT INTO `ssc_data_time` VALUES ('6660', '5', '1161', '19:20:00', '19:20:00');
INSERT INTO `ssc_data_time` VALUES ('6659', '5', '1160', '19:19:00', '19:19:00');
INSERT INTO `ssc_data_time` VALUES ('6658', '5', '1159', '19:18:00', '19:18:00');
INSERT INTO `ssc_data_time` VALUES ('6657', '5', '1158', '19:17:00', '19:17:00');
INSERT INTO `ssc_data_time` VALUES ('6656', '5', '1157', '19:16:00', '19:16:00');
INSERT INTO `ssc_data_time` VALUES ('6655', '5', '1156', '19:15:00', '19:15:00');
INSERT INTO `ssc_data_time` VALUES ('6654', '5', '1155', '19:14:00', '19:14:00');
INSERT INTO `ssc_data_time` VALUES ('6653', '5', '1154', '19:13:00', '19:13:00');
INSERT INTO `ssc_data_time` VALUES ('6652', '5', '1153', '19:12:00', '19:12:00');
INSERT INTO `ssc_data_time` VALUES ('6651', '5', '1152', '19:11:00', '19:11:00');
INSERT INTO `ssc_data_time` VALUES ('6650', '5', '1151', '19:10:00', '19:10:00');
INSERT INTO `ssc_data_time` VALUES ('6649', '5', '1150', '19:09:00', '19:09:00');
INSERT INTO `ssc_data_time` VALUES ('6648', '5', '1149', '19:08:00', '19:08:00');
INSERT INTO `ssc_data_time` VALUES ('6647', '5', '1148', '19:07:00', '19:07:00');
INSERT INTO `ssc_data_time` VALUES ('6646', '5', '1147', '19:06:00', '19:06:00');
INSERT INTO `ssc_data_time` VALUES ('6645', '5', '1146', '19:05:00', '19:05:00');
INSERT INTO `ssc_data_time` VALUES ('6644', '5', '1145', '19:04:00', '19:04:00');
INSERT INTO `ssc_data_time` VALUES ('6643', '5', '1144', '19:03:00', '19:03:00');
INSERT INTO `ssc_data_time` VALUES ('6642', '5', '1143', '19:02:00', '19:02:00');
INSERT INTO `ssc_data_time` VALUES ('6641', '5', '1142', '19:01:00', '19:01:00');
INSERT INTO `ssc_data_time` VALUES ('6640', '5', '1141', '19:00:00', '19:00:00');
INSERT INTO `ssc_data_time` VALUES ('6639', '5', '1140', '18:59:00', '18:59:00');
INSERT INTO `ssc_data_time` VALUES ('6638', '5', '1139', '18:58:00', '18:58:00');
INSERT INTO `ssc_data_time` VALUES ('6637', '5', '1138', '18:57:00', '18:57:00');
INSERT INTO `ssc_data_time` VALUES ('6636', '5', '1137', '18:56:00', '18:56:00');
INSERT INTO `ssc_data_time` VALUES ('6635', '5', '1136', '18:55:00', '18:55:00');
INSERT INTO `ssc_data_time` VALUES ('6634', '5', '1135', '18:54:00', '18:54:00');
INSERT INTO `ssc_data_time` VALUES ('6633', '5', '1134', '18:53:00', '18:53:00');
INSERT INTO `ssc_data_time` VALUES ('6632', '5', '1133', '18:52:00', '18:52:00');
INSERT INTO `ssc_data_time` VALUES ('6631', '5', '1132', '18:51:00', '18:51:00');
INSERT INTO `ssc_data_time` VALUES ('6630', '5', '1131', '18:50:00', '18:50:00');
INSERT INTO `ssc_data_time` VALUES ('6629', '5', '1130', '18:49:00', '18:49:00');
INSERT INTO `ssc_data_time` VALUES ('6628', '5', '1129', '18:48:00', '18:48:00');
INSERT INTO `ssc_data_time` VALUES ('6627', '5', '1128', '18:47:00', '18:47:00');
INSERT INTO `ssc_data_time` VALUES ('6626', '5', '1127', '18:46:00', '18:46:00');
INSERT INTO `ssc_data_time` VALUES ('6625', '5', '1126', '18:45:00', '18:45:00');
INSERT INTO `ssc_data_time` VALUES ('6624', '5', '1125', '18:44:00', '18:44:00');
INSERT INTO `ssc_data_time` VALUES ('6623', '5', '1124', '18:43:00', '18:43:00');
INSERT INTO `ssc_data_time` VALUES ('6622', '5', '1123', '18:42:00', '18:42:00');
INSERT INTO `ssc_data_time` VALUES ('6621', '5', '1122', '18:41:00', '18:41:00');
INSERT INTO `ssc_data_time` VALUES ('6620', '5', '1121', '18:40:00', '18:40:00');
INSERT INTO `ssc_data_time` VALUES ('6619', '5', '1120', '18:39:00', '18:39:00');
INSERT INTO `ssc_data_time` VALUES ('6618', '5', '1119', '18:38:00', '18:38:00');
INSERT INTO `ssc_data_time` VALUES ('6617', '5', '1118', '18:37:00', '18:37:00');
INSERT INTO `ssc_data_time` VALUES ('6616', '5', '1117', '18:36:00', '18:36:00');
INSERT INTO `ssc_data_time` VALUES ('6615', '5', '1116', '18:35:00', '18:35:00');
INSERT INTO `ssc_data_time` VALUES ('6614', '5', '1115', '18:34:00', '18:34:00');
INSERT INTO `ssc_data_time` VALUES ('6613', '5', '1114', '18:33:00', '18:33:00');
INSERT INTO `ssc_data_time` VALUES ('6612', '5', '1113', '18:32:00', '18:32:00');
INSERT INTO `ssc_data_time` VALUES ('6611', '5', '1112', '18:31:00', '18:31:00');
INSERT INTO `ssc_data_time` VALUES ('6610', '5', '1111', '18:30:00', '18:30:00');
INSERT INTO `ssc_data_time` VALUES ('6609', '5', '1110', '18:29:00', '18:29:00');
INSERT INTO `ssc_data_time` VALUES ('6608', '5', '1109', '18:28:00', '18:28:00');
INSERT INTO `ssc_data_time` VALUES ('6607', '5', '1108', '18:27:00', '18:27:00');
INSERT INTO `ssc_data_time` VALUES ('6606', '5', '1107', '18:26:00', '18:26:00');
INSERT INTO `ssc_data_time` VALUES ('6605', '5', '1106', '18:25:00', '18:25:00');
INSERT INTO `ssc_data_time` VALUES ('6604', '5', '1105', '18:24:00', '18:24:00');
INSERT INTO `ssc_data_time` VALUES ('6603', '5', '1104', '18:23:00', '18:23:00');
INSERT INTO `ssc_data_time` VALUES ('6602', '5', '1103', '18:22:00', '18:22:00');
INSERT INTO `ssc_data_time` VALUES ('6601', '5', '1102', '18:21:00', '18:21:00');
INSERT INTO `ssc_data_time` VALUES ('6600', '5', '1101', '18:20:00', '18:20:00');
INSERT INTO `ssc_data_time` VALUES ('6599', '5', '1100', '18:19:00', '18:19:00');
INSERT INTO `ssc_data_time` VALUES ('6598', '5', '1099', '18:18:00', '18:18:00');
INSERT INTO `ssc_data_time` VALUES ('6597', '5', '1098', '18:17:00', '18:17:00');
INSERT INTO `ssc_data_time` VALUES ('6596', '5', '1097', '18:16:00', '18:16:00');
INSERT INTO `ssc_data_time` VALUES ('6595', '5', '1096', '18:15:00', '18:15:00');
INSERT INTO `ssc_data_time` VALUES ('6594', '5', '1095', '18:14:00', '18:14:00');
INSERT INTO `ssc_data_time` VALUES ('6593', '5', '1094', '18:13:00', '18:13:00');
INSERT INTO `ssc_data_time` VALUES ('6592', '5', '1093', '18:12:00', '18:12:00');
INSERT INTO `ssc_data_time` VALUES ('6591', '5', '1092', '18:11:00', '18:11:00');
INSERT INTO `ssc_data_time` VALUES ('6590', '5', '1091', '18:10:00', '18:10:00');
INSERT INTO `ssc_data_time` VALUES ('6589', '5', '1090', '18:09:00', '18:09:00');
INSERT INTO `ssc_data_time` VALUES ('6588', '5', '1089', '18:08:00', '18:08:00');
INSERT INTO `ssc_data_time` VALUES ('6587', '5', '1088', '18:07:00', '18:07:00');
INSERT INTO `ssc_data_time` VALUES ('6586', '5', '1087', '18:06:00', '18:06:00');
INSERT INTO `ssc_data_time` VALUES ('6585', '5', '1086', '18:05:00', '18:05:00');
INSERT INTO `ssc_data_time` VALUES ('6584', '5', '1085', '18:04:00', '18:04:00');
INSERT INTO `ssc_data_time` VALUES ('6583', '5', '1084', '18:03:00', '18:03:00');
INSERT INTO `ssc_data_time` VALUES ('6582', '5', '1083', '18:02:00', '18:02:00');
INSERT INTO `ssc_data_time` VALUES ('6581', '5', '1082', '18:01:00', '18:01:00');
INSERT INTO `ssc_data_time` VALUES ('6580', '5', '1081', '18:00:00', '18:00:00');
INSERT INTO `ssc_data_time` VALUES ('6579', '5', '1080', '17:59:00', '17:59:00');
INSERT INTO `ssc_data_time` VALUES ('6578', '5', '1079', '17:58:00', '17:58:00');
INSERT INTO `ssc_data_time` VALUES ('6577', '5', '1078', '17:57:00', '17:57:00');
INSERT INTO `ssc_data_time` VALUES ('6576', '5', '1077', '17:56:00', '17:56:00');
INSERT INTO `ssc_data_time` VALUES ('6575', '5', '1076', '17:55:00', '17:55:00');
INSERT INTO `ssc_data_time` VALUES ('6574', '5', '1075', '17:54:00', '17:54:00');
INSERT INTO `ssc_data_time` VALUES ('6573', '5', '1074', '17:53:00', '17:53:00');
INSERT INTO `ssc_data_time` VALUES ('6572', '5', '1073', '17:52:00', '17:52:00');
INSERT INTO `ssc_data_time` VALUES ('6571', '5', '1072', '17:51:00', '17:51:00');
INSERT INTO `ssc_data_time` VALUES ('6570', '5', '1071', '17:50:00', '17:50:00');
INSERT INTO `ssc_data_time` VALUES ('6569', '5', '1070', '17:49:00', '17:49:00');
INSERT INTO `ssc_data_time` VALUES ('6568', '5', '1069', '17:48:00', '17:48:00');
INSERT INTO `ssc_data_time` VALUES ('6567', '5', '1068', '17:47:00', '17:47:00');
INSERT INTO `ssc_data_time` VALUES ('6566', '5', '1067', '17:46:00', '17:46:00');
INSERT INTO `ssc_data_time` VALUES ('6565', '5', '1066', '17:45:00', '17:45:00');
INSERT INTO `ssc_data_time` VALUES ('6564', '5', '1065', '17:44:00', '17:44:00');
INSERT INTO `ssc_data_time` VALUES ('6563', '5', '1064', '17:43:00', '17:43:00');
INSERT INTO `ssc_data_time` VALUES ('6562', '5', '1063', '17:42:00', '17:42:00');
INSERT INTO `ssc_data_time` VALUES ('6561', '5', '1062', '17:41:00', '17:41:00');
INSERT INTO `ssc_data_time` VALUES ('6560', '5', '1061', '17:40:00', '17:40:00');
INSERT INTO `ssc_data_time` VALUES ('6559', '5', '1060', '17:39:00', '17:39:00');
INSERT INTO `ssc_data_time` VALUES ('6558', '5', '1059', '17:38:00', '17:38:00');
INSERT INTO `ssc_data_time` VALUES ('6557', '5', '1058', '17:37:00', '17:37:00');
INSERT INTO `ssc_data_time` VALUES ('6556', '5', '1057', '17:36:00', '17:36:00');
INSERT INTO `ssc_data_time` VALUES ('6555', '5', '1056', '17:35:00', '17:35:00');
INSERT INTO `ssc_data_time` VALUES ('6554', '5', '1055', '17:34:00', '17:34:00');
INSERT INTO `ssc_data_time` VALUES ('6553', '5', '1054', '17:33:00', '17:33:00');
INSERT INTO `ssc_data_time` VALUES ('6552', '5', '1053', '17:32:00', '17:32:00');
INSERT INTO `ssc_data_time` VALUES ('6551', '5', '1052', '17:31:00', '17:31:00');
INSERT INTO `ssc_data_time` VALUES ('6550', '5', '1051', '17:30:00', '17:30:00');
INSERT INTO `ssc_data_time` VALUES ('6549', '5', '1050', '17:29:00', '17:29:00');
INSERT INTO `ssc_data_time` VALUES ('6548', '5', '1049', '17:28:00', '17:28:00');
INSERT INTO `ssc_data_time` VALUES ('6547', '5', '1048', '17:27:00', '17:27:00');
INSERT INTO `ssc_data_time` VALUES ('6546', '5', '1047', '17:26:00', '17:26:00');
INSERT INTO `ssc_data_time` VALUES ('6545', '5', '1046', '17:25:00', '17:25:00');
INSERT INTO `ssc_data_time` VALUES ('6544', '5', '1045', '17:24:00', '17:24:00');
INSERT INTO `ssc_data_time` VALUES ('6543', '5', '1044', '17:23:00', '17:23:00');
INSERT INTO `ssc_data_time` VALUES ('6542', '5', '1043', '17:22:00', '17:22:00');
INSERT INTO `ssc_data_time` VALUES ('6541', '5', '1042', '17:21:00', '17:21:00');
INSERT INTO `ssc_data_time` VALUES ('6540', '5', '1041', '17:20:00', '17:20:00');
INSERT INTO `ssc_data_time` VALUES ('6539', '5', '1040', '17:19:00', '17:19:00');
INSERT INTO `ssc_data_time` VALUES ('6538', '5', '1039', '17:18:00', '17:18:00');
INSERT INTO `ssc_data_time` VALUES ('6537', '5', '1038', '17:17:00', '17:17:00');
INSERT INTO `ssc_data_time` VALUES ('6536', '5', '1037', '17:16:00', '17:16:00');
INSERT INTO `ssc_data_time` VALUES ('6535', '5', '1036', '17:15:00', '17:15:00');
INSERT INTO `ssc_data_time` VALUES ('6534', '5', '1035', '17:14:00', '17:14:00');
INSERT INTO `ssc_data_time` VALUES ('6533', '5', '1034', '17:13:00', '17:13:00');
INSERT INTO `ssc_data_time` VALUES ('6532', '5', '1033', '17:12:00', '17:12:00');
INSERT INTO `ssc_data_time` VALUES ('6531', '5', '1032', '17:11:00', '17:11:00');
INSERT INTO `ssc_data_time` VALUES ('6530', '5', '1031', '17:10:00', '17:10:00');
INSERT INTO `ssc_data_time` VALUES ('6529', '5', '1030', '17:09:00', '17:09:00');
INSERT INTO `ssc_data_time` VALUES ('6528', '5', '1029', '17:08:00', '17:08:00');
INSERT INTO `ssc_data_time` VALUES ('6527', '5', '1028', '17:07:00', '17:07:00');
INSERT INTO `ssc_data_time` VALUES ('6526', '5', '1027', '17:06:00', '17:06:00');
INSERT INTO `ssc_data_time` VALUES ('6525', '5', '1026', '17:05:00', '17:05:00');
INSERT INTO `ssc_data_time` VALUES ('6524', '5', '1025', '17:04:00', '17:04:00');
INSERT INTO `ssc_data_time` VALUES ('6523', '5', '1024', '17:03:00', '17:03:00');
INSERT INTO `ssc_data_time` VALUES ('6522', '5', '1023', '17:02:00', '17:02:00');
INSERT INTO `ssc_data_time` VALUES ('6521', '5', '1022', '17:01:00', '17:01:00');
INSERT INTO `ssc_data_time` VALUES ('6520', '5', '1021', '17:00:00', '17:00:00');
INSERT INTO `ssc_data_time` VALUES ('6519', '5', '1020', '16:59:00', '16:59:00');
INSERT INTO `ssc_data_time` VALUES ('6518', '5', '1019', '16:58:00', '16:58:00');
INSERT INTO `ssc_data_time` VALUES ('6517', '5', '1018', '16:57:00', '16:57:00');
INSERT INTO `ssc_data_time` VALUES ('6516', '5', '1017', '16:56:00', '16:56:00');
INSERT INTO `ssc_data_time` VALUES ('6515', '5', '1016', '16:55:00', '16:55:00');
INSERT INTO `ssc_data_time` VALUES ('6514', '5', '1015', '16:54:00', '16:54:00');
INSERT INTO `ssc_data_time` VALUES ('6513', '5', '1014', '16:53:00', '16:53:00');
INSERT INTO `ssc_data_time` VALUES ('6512', '5', '1013', '16:52:00', '16:52:00');
INSERT INTO `ssc_data_time` VALUES ('6511', '5', '1012', '16:51:00', '16:51:00');
INSERT INTO `ssc_data_time` VALUES ('6510', '5', '1011', '16:50:00', '16:50:00');
INSERT INTO `ssc_data_time` VALUES ('6509', '5', '1010', '16:49:00', '16:49:00');
INSERT INTO `ssc_data_time` VALUES ('6508', '5', '1009', '16:48:00', '16:48:00');
INSERT INTO `ssc_data_time` VALUES ('6507', '5', '1008', '16:47:00', '16:47:00');
INSERT INTO `ssc_data_time` VALUES ('6506', '5', '1007', '16:46:00', '16:46:00');
INSERT INTO `ssc_data_time` VALUES ('6505', '5', '1006', '16:45:00', '16:45:00');
INSERT INTO `ssc_data_time` VALUES ('6504', '5', '1005', '16:44:00', '16:44:00');
INSERT INTO `ssc_data_time` VALUES ('6503', '5', '1004', '16:43:00', '16:43:00');
INSERT INTO `ssc_data_time` VALUES ('6502', '5', '1003', '16:42:00', '16:42:00');
INSERT INTO `ssc_data_time` VALUES ('6501', '5', '1002', '16:41:00', '16:41:00');
INSERT INTO `ssc_data_time` VALUES ('6500', '5', '1001', '16:40:00', '16:40:00');
INSERT INTO `ssc_data_time` VALUES ('6499', '5', '1000', '16:39:00', '16:39:00');
INSERT INTO `ssc_data_time` VALUES ('6498', '5', '999', '16:38:00', '16:38:00');
INSERT INTO `ssc_data_time` VALUES ('6497', '5', '998', '16:37:00', '16:37:00');
INSERT INTO `ssc_data_time` VALUES ('6496', '5', '997', '16:36:00', '16:36:00');
INSERT INTO `ssc_data_time` VALUES ('6495', '5', '996', '16:35:00', '16:35:00');
INSERT INTO `ssc_data_time` VALUES ('6494', '5', '995', '16:34:00', '16:34:00');
INSERT INTO `ssc_data_time` VALUES ('6493', '5', '994', '16:33:00', '16:33:00');
INSERT INTO `ssc_data_time` VALUES ('6492', '5', '993', '16:32:00', '16:32:00');
INSERT INTO `ssc_data_time` VALUES ('6491', '5', '992', '16:31:00', '16:31:00');
INSERT INTO `ssc_data_time` VALUES ('6490', '5', '991', '16:30:00', '16:30:00');
INSERT INTO `ssc_data_time` VALUES ('6489', '5', '990', '16:29:00', '16:29:00');
INSERT INTO `ssc_data_time` VALUES ('6488', '5', '989', '16:28:00', '16:28:00');
INSERT INTO `ssc_data_time` VALUES ('6487', '5', '988', '16:27:00', '16:27:00');
INSERT INTO `ssc_data_time` VALUES ('6486', '5', '987', '16:26:00', '16:26:00');
INSERT INTO `ssc_data_time` VALUES ('6485', '5', '986', '16:25:00', '16:25:00');
INSERT INTO `ssc_data_time` VALUES ('6484', '5', '985', '16:24:00', '16:24:00');
INSERT INTO `ssc_data_time` VALUES ('6483', '5', '984', '16:23:00', '16:23:00');
INSERT INTO `ssc_data_time` VALUES ('6482', '5', '983', '16:22:00', '16:22:00');
INSERT INTO `ssc_data_time` VALUES ('6481', '5', '982', '16:21:00', '16:21:00');
INSERT INTO `ssc_data_time` VALUES ('6480', '5', '981', '16:20:00', '16:20:00');
INSERT INTO `ssc_data_time` VALUES ('6479', '5', '980', '16:19:00', '16:19:00');
INSERT INTO `ssc_data_time` VALUES ('6478', '5', '979', '16:18:00', '16:18:00');
INSERT INTO `ssc_data_time` VALUES ('6477', '5', '978', '16:17:00', '16:17:00');
INSERT INTO `ssc_data_time` VALUES ('6476', '5', '977', '16:16:00', '16:16:00');
INSERT INTO `ssc_data_time` VALUES ('6475', '5', '976', '16:15:00', '16:15:00');
INSERT INTO `ssc_data_time` VALUES ('6474', '5', '975', '16:14:00', '16:14:00');
INSERT INTO `ssc_data_time` VALUES ('6473', '5', '974', '16:13:00', '16:13:00');
INSERT INTO `ssc_data_time` VALUES ('6472', '5', '973', '16:12:00', '16:12:00');
INSERT INTO `ssc_data_time` VALUES ('6471', '5', '972', '16:11:00', '16:11:00');
INSERT INTO `ssc_data_time` VALUES ('6470', '5', '971', '16:10:00', '16:10:00');
INSERT INTO `ssc_data_time` VALUES ('6469', '5', '970', '16:09:00', '16:09:00');
INSERT INTO `ssc_data_time` VALUES ('6468', '5', '969', '16:08:00', '16:08:00');
INSERT INTO `ssc_data_time` VALUES ('6467', '5', '968', '16:07:00', '16:07:00');
INSERT INTO `ssc_data_time` VALUES ('6466', '5', '967', '16:06:00', '16:06:00');
INSERT INTO `ssc_data_time` VALUES ('6465', '5', '966', '16:05:00', '16:05:00');
INSERT INTO `ssc_data_time` VALUES ('6464', '5', '965', '16:04:00', '16:04:00');
INSERT INTO `ssc_data_time` VALUES ('6463', '5', '964', '16:03:00', '16:03:00');
INSERT INTO `ssc_data_time` VALUES ('6462', '5', '963', '16:02:00', '16:02:00');
INSERT INTO `ssc_data_time` VALUES ('6461', '5', '962', '16:01:00', '16:01:00');
INSERT INTO `ssc_data_time` VALUES ('6460', '5', '961', '16:00:00', '16:00:00');
INSERT INTO `ssc_data_time` VALUES ('6459', '5', '960', '15:59:00', '15:59:00');
INSERT INTO `ssc_data_time` VALUES ('6458', '5', '959', '15:58:00', '15:58:00');
INSERT INTO `ssc_data_time` VALUES ('6457', '5', '958', '15:57:00', '15:57:00');
INSERT INTO `ssc_data_time` VALUES ('6456', '5', '957', '15:56:00', '15:56:00');
INSERT INTO `ssc_data_time` VALUES ('6455', '5', '956', '15:55:00', '15:55:00');
INSERT INTO `ssc_data_time` VALUES ('6454', '5', '955', '15:54:00', '15:54:00');
INSERT INTO `ssc_data_time` VALUES ('6453', '5', '954', '15:53:00', '15:53:00');
INSERT INTO `ssc_data_time` VALUES ('6452', '5', '953', '15:52:00', '15:52:00');
INSERT INTO `ssc_data_time` VALUES ('6451', '5', '952', '15:51:00', '15:51:00');
INSERT INTO `ssc_data_time` VALUES ('6450', '5', '951', '15:50:00', '15:50:00');
INSERT INTO `ssc_data_time` VALUES ('6449', '5', '950', '15:49:00', '15:49:00');
INSERT INTO `ssc_data_time` VALUES ('6448', '5', '949', '15:48:00', '15:48:00');
INSERT INTO `ssc_data_time` VALUES ('6447', '5', '948', '15:47:00', '15:47:00');
INSERT INTO `ssc_data_time` VALUES ('6446', '5', '947', '15:46:00', '15:46:00');
INSERT INTO `ssc_data_time` VALUES ('6445', '5', '946', '15:45:00', '15:45:00');
INSERT INTO `ssc_data_time` VALUES ('6444', '5', '945', '15:44:00', '15:44:00');
INSERT INTO `ssc_data_time` VALUES ('6443', '5', '944', '15:43:00', '15:43:00');
INSERT INTO `ssc_data_time` VALUES ('6442', '5', '943', '15:42:00', '15:42:00');
INSERT INTO `ssc_data_time` VALUES ('6441', '5', '942', '15:41:00', '15:41:00');
INSERT INTO `ssc_data_time` VALUES ('6440', '5', '941', '15:40:00', '15:40:00');
INSERT INTO `ssc_data_time` VALUES ('6439', '5', '940', '15:39:00', '15:39:00');
INSERT INTO `ssc_data_time` VALUES ('6438', '5', '939', '15:38:00', '15:38:00');
INSERT INTO `ssc_data_time` VALUES ('6437', '5', '938', '15:37:00', '15:37:00');
INSERT INTO `ssc_data_time` VALUES ('6436', '5', '937', '15:36:00', '15:36:00');
INSERT INTO `ssc_data_time` VALUES ('6435', '5', '936', '15:35:00', '15:35:00');
INSERT INTO `ssc_data_time` VALUES ('6434', '5', '935', '15:34:00', '15:34:00');
INSERT INTO `ssc_data_time` VALUES ('6433', '5', '934', '15:33:00', '15:33:00');
INSERT INTO `ssc_data_time` VALUES ('6432', '5', '933', '15:32:00', '15:32:00');
INSERT INTO `ssc_data_time` VALUES ('6431', '5', '932', '15:31:00', '15:31:00');
INSERT INTO `ssc_data_time` VALUES ('6430', '5', '931', '15:30:00', '15:30:00');
INSERT INTO `ssc_data_time` VALUES ('6429', '5', '930', '15:29:00', '15:29:00');
INSERT INTO `ssc_data_time` VALUES ('6428', '5', '929', '15:28:00', '15:28:00');
INSERT INTO `ssc_data_time` VALUES ('6427', '5', '928', '15:27:00', '15:27:00');
INSERT INTO `ssc_data_time` VALUES ('6426', '5', '927', '15:26:00', '15:26:00');
INSERT INTO `ssc_data_time` VALUES ('6425', '5', '926', '15:25:00', '15:25:00');
INSERT INTO `ssc_data_time` VALUES ('6424', '5', '925', '15:24:00', '15:24:00');
INSERT INTO `ssc_data_time` VALUES ('6423', '5', '924', '15:23:00', '15:23:00');
INSERT INTO `ssc_data_time` VALUES ('6422', '5', '923', '15:22:00', '15:22:00');
INSERT INTO `ssc_data_time` VALUES ('6421', '5', '922', '15:21:00', '15:21:00');
INSERT INTO `ssc_data_time` VALUES ('6420', '5', '921', '15:20:00', '15:20:00');
INSERT INTO `ssc_data_time` VALUES ('6419', '5', '920', '15:19:00', '15:19:00');
INSERT INTO `ssc_data_time` VALUES ('6418', '5', '919', '15:18:00', '15:18:00');
INSERT INTO `ssc_data_time` VALUES ('6417', '5', '918', '15:17:00', '15:17:00');
INSERT INTO `ssc_data_time` VALUES ('6416', '5', '917', '15:16:00', '15:16:00');
INSERT INTO `ssc_data_time` VALUES ('6415', '5', '916', '15:15:00', '15:15:00');
INSERT INTO `ssc_data_time` VALUES ('6414', '5', '915', '15:14:00', '15:14:00');
INSERT INTO `ssc_data_time` VALUES ('6413', '5', '914', '15:13:00', '15:13:00');
INSERT INTO `ssc_data_time` VALUES ('6412', '5', '913', '15:12:00', '15:12:00');
INSERT INTO `ssc_data_time` VALUES ('6411', '5', '912', '15:11:00', '15:11:00');
INSERT INTO `ssc_data_time` VALUES ('6410', '5', '911', '15:10:00', '15:10:00');
INSERT INTO `ssc_data_time` VALUES ('6409', '5', '910', '15:09:00', '15:09:00');
INSERT INTO `ssc_data_time` VALUES ('6408', '5', '909', '15:08:00', '15:08:00');
INSERT INTO `ssc_data_time` VALUES ('6407', '5', '908', '15:07:00', '15:07:00');
INSERT INTO `ssc_data_time` VALUES ('6406', '5', '907', '15:06:00', '15:06:00');
INSERT INTO `ssc_data_time` VALUES ('6405', '5', '906', '15:05:00', '15:05:00');
INSERT INTO `ssc_data_time` VALUES ('6404', '5', '905', '15:04:00', '15:04:00');
INSERT INTO `ssc_data_time` VALUES ('6403', '5', '904', '15:03:00', '15:03:00');
INSERT INTO `ssc_data_time` VALUES ('6402', '5', '903', '15:02:00', '15:02:00');
INSERT INTO `ssc_data_time` VALUES ('6401', '5', '902', '15:01:00', '15:01:00');
INSERT INTO `ssc_data_time` VALUES ('6400', '5', '901', '15:00:00', '15:00:00');
INSERT INTO `ssc_data_time` VALUES ('6399', '5', '900', '14:59:00', '14:59:00');
INSERT INTO `ssc_data_time` VALUES ('6398', '5', '899', '14:58:00', '14:58:00');
INSERT INTO `ssc_data_time` VALUES ('6397', '5', '898', '14:57:00', '14:57:00');
INSERT INTO `ssc_data_time` VALUES ('6396', '5', '897', '14:56:00', '14:56:00');
INSERT INTO `ssc_data_time` VALUES ('6395', '5', '896', '14:55:00', '14:55:00');
INSERT INTO `ssc_data_time` VALUES ('6394', '5', '895', '14:54:00', '14:54:00');
INSERT INTO `ssc_data_time` VALUES ('6393', '5', '894', '14:53:00', '14:53:00');
INSERT INTO `ssc_data_time` VALUES ('6392', '5', '893', '14:52:00', '14:52:00');
INSERT INTO `ssc_data_time` VALUES ('6391', '5', '892', '14:51:00', '14:51:00');
INSERT INTO `ssc_data_time` VALUES ('6390', '5', '891', '14:50:00', '14:50:00');
INSERT INTO `ssc_data_time` VALUES ('6389', '5', '890', '14:49:00', '14:49:00');
INSERT INTO `ssc_data_time` VALUES ('6388', '5', '889', '14:48:00', '14:48:00');
INSERT INTO `ssc_data_time` VALUES ('6387', '5', '888', '14:47:00', '14:47:00');
INSERT INTO `ssc_data_time` VALUES ('6386', '5', '887', '14:46:00', '14:46:00');
INSERT INTO `ssc_data_time` VALUES ('6385', '5', '886', '14:45:00', '14:45:00');
INSERT INTO `ssc_data_time` VALUES ('6384', '5', '885', '14:44:00', '14:44:00');
INSERT INTO `ssc_data_time` VALUES ('6383', '5', '884', '14:43:00', '14:43:00');
INSERT INTO `ssc_data_time` VALUES ('6382', '5', '883', '14:42:00', '14:42:00');
INSERT INTO `ssc_data_time` VALUES ('6381', '5', '882', '14:41:00', '14:41:00');
INSERT INTO `ssc_data_time` VALUES ('6380', '5', '881', '14:40:00', '14:40:00');
INSERT INTO `ssc_data_time` VALUES ('6379', '5', '880', '14:39:00', '14:39:00');
INSERT INTO `ssc_data_time` VALUES ('6378', '5', '879', '14:38:00', '14:38:00');
INSERT INTO `ssc_data_time` VALUES ('6377', '5', '878', '14:37:00', '14:37:00');
INSERT INTO `ssc_data_time` VALUES ('6376', '5', '877', '14:36:00', '14:36:00');
INSERT INTO `ssc_data_time` VALUES ('6375', '5', '876', '14:35:00', '14:35:00');
INSERT INTO `ssc_data_time` VALUES ('6374', '5', '875', '14:34:00', '14:34:00');
INSERT INTO `ssc_data_time` VALUES ('6373', '5', '874', '14:33:00', '14:33:00');
INSERT INTO `ssc_data_time` VALUES ('6372', '5', '873', '14:32:00', '14:32:00');
INSERT INTO `ssc_data_time` VALUES ('6371', '5', '872', '14:31:00', '14:31:00');
INSERT INTO `ssc_data_time` VALUES ('6370', '5', '871', '14:30:00', '14:30:00');
INSERT INTO `ssc_data_time` VALUES ('6369', '5', '870', '14:29:00', '14:29:00');
INSERT INTO `ssc_data_time` VALUES ('6368', '5', '869', '14:28:00', '14:28:00');
INSERT INTO `ssc_data_time` VALUES ('6367', '5', '868', '14:27:00', '14:27:00');
INSERT INTO `ssc_data_time` VALUES ('6366', '5', '867', '14:26:00', '14:26:00');
INSERT INTO `ssc_data_time` VALUES ('6365', '5', '866', '14:25:00', '14:25:00');
INSERT INTO `ssc_data_time` VALUES ('6364', '5', '865', '14:24:00', '14:24:00');
INSERT INTO `ssc_data_time` VALUES ('6363', '5', '864', '14:23:00', '14:23:00');
INSERT INTO `ssc_data_time` VALUES ('6362', '5', '863', '14:22:00', '14:22:00');
INSERT INTO `ssc_data_time` VALUES ('6361', '5', '862', '14:21:00', '14:21:00');
INSERT INTO `ssc_data_time` VALUES ('6360', '5', '861', '14:20:00', '14:20:00');
INSERT INTO `ssc_data_time` VALUES ('6359', '5', '860', '14:19:00', '14:19:00');
INSERT INTO `ssc_data_time` VALUES ('6358', '5', '859', '14:18:00', '14:18:00');
INSERT INTO `ssc_data_time` VALUES ('6357', '5', '858', '14:17:00', '14:17:00');
INSERT INTO `ssc_data_time` VALUES ('6356', '5', '857', '14:16:00', '14:16:00');
INSERT INTO `ssc_data_time` VALUES ('6355', '5', '856', '14:15:00', '14:15:00');
INSERT INTO `ssc_data_time` VALUES ('6354', '5', '855', '14:14:00', '14:14:00');
INSERT INTO `ssc_data_time` VALUES ('6353', '5', '854', '14:13:00', '14:13:00');
INSERT INTO `ssc_data_time` VALUES ('6352', '5', '853', '14:12:00', '14:12:00');
INSERT INTO `ssc_data_time` VALUES ('6351', '5', '852', '14:11:00', '14:11:00');
INSERT INTO `ssc_data_time` VALUES ('6350', '5', '851', '14:10:00', '14:10:00');
INSERT INTO `ssc_data_time` VALUES ('6349', '5', '850', '14:09:00', '14:09:00');
INSERT INTO `ssc_data_time` VALUES ('6348', '5', '849', '14:08:00', '14:08:00');
INSERT INTO `ssc_data_time` VALUES ('6347', '5', '848', '14:07:00', '14:07:00');
INSERT INTO `ssc_data_time` VALUES ('6346', '5', '847', '14:06:00', '14:06:00');
INSERT INTO `ssc_data_time` VALUES ('6345', '5', '846', '14:05:00', '14:05:00');
INSERT INTO `ssc_data_time` VALUES ('6344', '5', '845', '14:04:00', '14:04:00');
INSERT INTO `ssc_data_time` VALUES ('6343', '5', '844', '14:03:00', '14:03:00');
INSERT INTO `ssc_data_time` VALUES ('6342', '5', '843', '14:02:00', '14:02:00');
INSERT INTO `ssc_data_time` VALUES ('6341', '5', '842', '14:01:00', '14:01:00');
INSERT INTO `ssc_data_time` VALUES ('6340', '5', '841', '14:00:00', '14:00:00');
INSERT INTO `ssc_data_time` VALUES ('6339', '5', '840', '13:59:00', '13:59:00');
INSERT INTO `ssc_data_time` VALUES ('6338', '5', '839', '13:58:00', '13:58:00');
INSERT INTO `ssc_data_time` VALUES ('6337', '5', '838', '13:57:00', '13:57:00');
INSERT INTO `ssc_data_time` VALUES ('6336', '5', '837', '13:56:00', '13:56:00');
INSERT INTO `ssc_data_time` VALUES ('6335', '5', '836', '13:55:00', '13:55:00');
INSERT INTO `ssc_data_time` VALUES ('6334', '5', '835', '13:54:00', '13:54:00');
INSERT INTO `ssc_data_time` VALUES ('6333', '5', '834', '13:53:00', '13:53:00');
INSERT INTO `ssc_data_time` VALUES ('6332', '5', '833', '13:52:00', '13:52:00');
INSERT INTO `ssc_data_time` VALUES ('6331', '5', '832', '13:51:00', '13:51:00');
INSERT INTO `ssc_data_time` VALUES ('6330', '5', '831', '13:50:00', '13:50:00');
INSERT INTO `ssc_data_time` VALUES ('6329', '5', '830', '13:49:00', '13:49:00');
INSERT INTO `ssc_data_time` VALUES ('6328', '5', '829', '13:48:00', '13:48:00');
INSERT INTO `ssc_data_time` VALUES ('6327', '5', '828', '13:47:00', '13:47:00');
INSERT INTO `ssc_data_time` VALUES ('6326', '5', '827', '13:46:00', '13:46:00');
INSERT INTO `ssc_data_time` VALUES ('6325', '5', '826', '13:45:00', '13:45:00');
INSERT INTO `ssc_data_time` VALUES ('6324', '5', '825', '13:44:00', '13:44:00');
INSERT INTO `ssc_data_time` VALUES ('6323', '5', '824', '13:43:00', '13:43:00');
INSERT INTO `ssc_data_time` VALUES ('6322', '5', '823', '13:42:00', '13:42:00');
INSERT INTO `ssc_data_time` VALUES ('6321', '5', '822', '13:41:00', '13:41:00');
INSERT INTO `ssc_data_time` VALUES ('6320', '5', '821', '13:40:00', '13:40:00');
INSERT INTO `ssc_data_time` VALUES ('6319', '5', '820', '13:39:00', '13:39:00');
INSERT INTO `ssc_data_time` VALUES ('6318', '5', '819', '13:38:00', '13:38:00');
INSERT INTO `ssc_data_time` VALUES ('6317', '5', '818', '13:37:00', '13:37:00');
INSERT INTO `ssc_data_time` VALUES ('6316', '5', '817', '13:36:00', '13:36:00');
INSERT INTO `ssc_data_time` VALUES ('6315', '5', '816', '13:35:00', '13:35:00');
INSERT INTO `ssc_data_time` VALUES ('6314', '5', '815', '13:34:00', '13:34:00');
INSERT INTO `ssc_data_time` VALUES ('6313', '5', '814', '13:33:00', '13:33:00');
INSERT INTO `ssc_data_time` VALUES ('6312', '5', '813', '13:32:00', '13:32:00');
INSERT INTO `ssc_data_time` VALUES ('6311', '5', '812', '13:31:00', '13:31:00');
INSERT INTO `ssc_data_time` VALUES ('6310', '5', '811', '13:30:00', '13:30:00');
INSERT INTO `ssc_data_time` VALUES ('6309', '5', '810', '13:29:00', '13:29:00');
INSERT INTO `ssc_data_time` VALUES ('6308', '5', '809', '13:28:00', '13:28:00');
INSERT INTO `ssc_data_time` VALUES ('6307', '5', '808', '13:27:00', '13:27:00');
INSERT INTO `ssc_data_time` VALUES ('6306', '5', '807', '13:26:00', '13:26:00');
INSERT INTO `ssc_data_time` VALUES ('6305', '5', '806', '13:25:00', '13:25:00');
INSERT INTO `ssc_data_time` VALUES ('6304', '5', '805', '13:24:00', '13:24:00');
INSERT INTO `ssc_data_time` VALUES ('6303', '5', '804', '13:23:00', '13:23:00');
INSERT INTO `ssc_data_time` VALUES ('6302', '5', '803', '13:22:00', '13:22:00');
INSERT INTO `ssc_data_time` VALUES ('6301', '5', '802', '13:21:00', '13:21:00');
INSERT INTO `ssc_data_time` VALUES ('6300', '5', '801', '13:20:00', '13:20:00');
INSERT INTO `ssc_data_time` VALUES ('6299', '5', '800', '13:19:00', '13:19:00');
INSERT INTO `ssc_data_time` VALUES ('6298', '5', '799', '13:18:00', '13:18:00');
INSERT INTO `ssc_data_time` VALUES ('6297', '5', '798', '13:17:00', '13:17:00');
INSERT INTO `ssc_data_time` VALUES ('6296', '5', '797', '13:16:00', '13:16:00');
INSERT INTO `ssc_data_time` VALUES ('6295', '5', '796', '13:15:00', '13:15:00');
INSERT INTO `ssc_data_time` VALUES ('6294', '5', '795', '13:14:00', '13:14:00');
INSERT INTO `ssc_data_time` VALUES ('6293', '5', '794', '13:13:00', '13:13:00');
INSERT INTO `ssc_data_time` VALUES ('6292', '5', '793', '13:12:00', '13:12:00');
INSERT INTO `ssc_data_time` VALUES ('6291', '5', '792', '13:11:00', '13:11:00');
INSERT INTO `ssc_data_time` VALUES ('6290', '5', '791', '13:10:00', '13:10:00');
INSERT INTO `ssc_data_time` VALUES ('6289', '5', '790', '13:09:00', '13:09:00');
INSERT INTO `ssc_data_time` VALUES ('6288', '5', '789', '13:08:00', '13:08:00');
INSERT INTO `ssc_data_time` VALUES ('6287', '5', '788', '13:07:00', '13:07:00');
INSERT INTO `ssc_data_time` VALUES ('6286', '5', '787', '13:06:00', '13:06:00');
INSERT INTO `ssc_data_time` VALUES ('6285', '5', '786', '13:05:00', '13:05:00');
INSERT INTO `ssc_data_time` VALUES ('6284', '5', '785', '13:04:00', '13:04:00');
INSERT INTO `ssc_data_time` VALUES ('6283', '5', '784', '13:03:00', '13:03:00');
INSERT INTO `ssc_data_time` VALUES ('6282', '5', '783', '13:02:00', '13:02:00');
INSERT INTO `ssc_data_time` VALUES ('6281', '5', '782', '13:01:00', '13:01:00');
INSERT INTO `ssc_data_time` VALUES ('6280', '5', '781', '13:00:00', '13:00:00');
INSERT INTO `ssc_data_time` VALUES ('6279', '5', '780', '12:59:00', '12:59:00');
INSERT INTO `ssc_data_time` VALUES ('6278', '5', '779', '12:58:00', '12:58:00');
INSERT INTO `ssc_data_time` VALUES ('6277', '5', '778', '12:57:00', '12:57:00');
INSERT INTO `ssc_data_time` VALUES ('6276', '5', '777', '12:56:00', '12:56:00');
INSERT INTO `ssc_data_time` VALUES ('6275', '5', '776', '12:55:00', '12:55:00');
INSERT INTO `ssc_data_time` VALUES ('6274', '5', '775', '12:54:00', '12:54:00');
INSERT INTO `ssc_data_time` VALUES ('6273', '5', '774', '12:53:00', '12:53:00');
INSERT INTO `ssc_data_time` VALUES ('6272', '5', '773', '12:52:00', '12:52:00');
INSERT INTO `ssc_data_time` VALUES ('6271', '5', '772', '12:51:00', '12:51:00');
INSERT INTO `ssc_data_time` VALUES ('6270', '5', '771', '12:50:00', '12:50:00');
INSERT INTO `ssc_data_time` VALUES ('6269', '5', '770', '12:49:00', '12:49:00');
INSERT INTO `ssc_data_time` VALUES ('6268', '5', '769', '12:48:00', '12:48:00');
INSERT INTO `ssc_data_time` VALUES ('6267', '5', '768', '12:47:00', '12:47:00');
INSERT INTO `ssc_data_time` VALUES ('6266', '5', '767', '12:46:00', '12:46:00');
INSERT INTO `ssc_data_time` VALUES ('6265', '5', '766', '12:45:00', '12:45:00');
INSERT INTO `ssc_data_time` VALUES ('6264', '5', '765', '12:44:00', '12:44:00');
INSERT INTO `ssc_data_time` VALUES ('6263', '5', '764', '12:43:00', '12:43:00');
INSERT INTO `ssc_data_time` VALUES ('6262', '5', '763', '12:42:00', '12:42:00');
INSERT INTO `ssc_data_time` VALUES ('6261', '5', '762', '12:41:00', '12:41:00');
INSERT INTO `ssc_data_time` VALUES ('6260', '5', '761', '12:40:00', '12:40:00');
INSERT INTO `ssc_data_time` VALUES ('6259', '5', '760', '12:39:00', '12:39:00');
INSERT INTO `ssc_data_time` VALUES ('6258', '5', '759', '12:38:00', '12:38:00');
INSERT INTO `ssc_data_time` VALUES ('6257', '5', '758', '12:37:00', '12:37:00');
INSERT INTO `ssc_data_time` VALUES ('6256', '5', '757', '12:36:00', '12:36:00');
INSERT INTO `ssc_data_time` VALUES ('6255', '5', '756', '12:35:00', '12:35:00');
INSERT INTO `ssc_data_time` VALUES ('6254', '5', '755', '12:34:00', '12:34:00');
INSERT INTO `ssc_data_time` VALUES ('6253', '5', '754', '12:33:00', '12:33:00');
INSERT INTO `ssc_data_time` VALUES ('6252', '5', '753', '12:32:00', '12:32:00');
INSERT INTO `ssc_data_time` VALUES ('6251', '5', '752', '12:31:00', '12:31:00');
INSERT INTO `ssc_data_time` VALUES ('6250', '5', '751', '12:30:00', '12:30:00');
INSERT INTO `ssc_data_time` VALUES ('6249', '5', '750', '12:29:00', '12:29:00');
INSERT INTO `ssc_data_time` VALUES ('6248', '5', '749', '12:28:00', '12:28:00');
INSERT INTO `ssc_data_time` VALUES ('6247', '5', '748', '12:27:00', '12:27:00');
INSERT INTO `ssc_data_time` VALUES ('6246', '5', '747', '12:26:00', '12:26:00');
INSERT INTO `ssc_data_time` VALUES ('6245', '5', '746', '12:25:00', '12:25:00');
INSERT INTO `ssc_data_time` VALUES ('6244', '5', '745', '12:24:00', '12:24:00');
INSERT INTO `ssc_data_time` VALUES ('6243', '5', '744', '12:23:00', '12:23:00');
INSERT INTO `ssc_data_time` VALUES ('6242', '5', '743', '12:22:00', '12:22:00');
INSERT INTO `ssc_data_time` VALUES ('6241', '5', '742', '12:21:00', '12:21:00');
INSERT INTO `ssc_data_time` VALUES ('6240', '5', '741', '12:20:00', '12:20:00');
INSERT INTO `ssc_data_time` VALUES ('6239', '5', '740', '12:19:00', '12:19:00');
INSERT INTO `ssc_data_time` VALUES ('6238', '5', '739', '12:18:00', '12:18:00');
INSERT INTO `ssc_data_time` VALUES ('6237', '5', '738', '12:17:00', '12:17:00');
INSERT INTO `ssc_data_time` VALUES ('6236', '5', '737', '12:16:00', '12:16:00');
INSERT INTO `ssc_data_time` VALUES ('6235', '5', '736', '12:15:00', '12:15:00');
INSERT INTO `ssc_data_time` VALUES ('6234', '5', '735', '12:14:00', '12:14:00');
INSERT INTO `ssc_data_time` VALUES ('6233', '5', '734', '12:13:00', '12:13:00');
INSERT INTO `ssc_data_time` VALUES ('6232', '5', '733', '12:12:00', '12:12:00');
INSERT INTO `ssc_data_time` VALUES ('6231', '5', '732', '12:11:00', '12:11:00');
INSERT INTO `ssc_data_time` VALUES ('6230', '5', '731', '12:10:00', '12:10:00');
INSERT INTO `ssc_data_time` VALUES ('6229', '5', '730', '12:09:00', '12:09:00');
INSERT INTO `ssc_data_time` VALUES ('6228', '5', '729', '12:08:00', '12:08:00');
INSERT INTO `ssc_data_time` VALUES ('6227', '5', '728', '12:07:00', '12:07:00');
INSERT INTO `ssc_data_time` VALUES ('6226', '5', '727', '12:06:00', '12:06:00');
INSERT INTO `ssc_data_time` VALUES ('6225', '5', '726', '12:05:00', '12:05:00');
INSERT INTO `ssc_data_time` VALUES ('6224', '5', '725', '12:04:00', '12:04:00');
INSERT INTO `ssc_data_time` VALUES ('6223', '5', '724', '12:03:00', '12:03:00');
INSERT INTO `ssc_data_time` VALUES ('6222', '5', '723', '12:02:00', '12:02:00');
INSERT INTO `ssc_data_time` VALUES ('6221', '5', '722', '12:01:00', '12:01:00');
INSERT INTO `ssc_data_time` VALUES ('6220', '5', '721', '12:00:00', '12:00:00');
INSERT INTO `ssc_data_time` VALUES ('6219', '5', '720', '11:59:00', '11:59:00');
INSERT INTO `ssc_data_time` VALUES ('6218', '5', '719', '11:58:00', '11:58:00');
INSERT INTO `ssc_data_time` VALUES ('6217', '5', '718', '11:57:00', '11:57:00');
INSERT INTO `ssc_data_time` VALUES ('6216', '5', '717', '11:56:00', '11:56:00');
INSERT INTO `ssc_data_time` VALUES ('6215', '5', '716', '11:55:00', '11:55:00');
INSERT INTO `ssc_data_time` VALUES ('6214', '5', '715', '11:54:00', '11:54:00');
INSERT INTO `ssc_data_time` VALUES ('6213', '5', '714', '11:53:00', '11:53:00');
INSERT INTO `ssc_data_time` VALUES ('6212', '5', '713', '11:52:00', '11:52:00');
INSERT INTO `ssc_data_time` VALUES ('6211', '5', '712', '11:51:00', '11:51:00');
INSERT INTO `ssc_data_time` VALUES ('6210', '5', '711', '11:50:00', '11:50:00');
INSERT INTO `ssc_data_time` VALUES ('6209', '5', '710', '11:49:00', '11:49:00');
INSERT INTO `ssc_data_time` VALUES ('6208', '5', '709', '11:48:00', '11:48:00');
INSERT INTO `ssc_data_time` VALUES ('6207', '5', '708', '11:47:00', '11:47:00');
INSERT INTO `ssc_data_time` VALUES ('6206', '5', '707', '11:46:00', '11:46:00');
INSERT INTO `ssc_data_time` VALUES ('6205', '5', '706', '11:45:00', '11:45:00');
INSERT INTO `ssc_data_time` VALUES ('6204', '5', '705', '11:44:00', '11:44:00');
INSERT INTO `ssc_data_time` VALUES ('6203', '5', '704', '11:43:00', '11:43:00');
INSERT INTO `ssc_data_time` VALUES ('6202', '5', '703', '11:42:00', '11:42:00');
INSERT INTO `ssc_data_time` VALUES ('6201', '5', '702', '11:41:00', '11:41:00');
INSERT INTO `ssc_data_time` VALUES ('6200', '5', '701', '11:40:00', '11:40:00');
INSERT INTO `ssc_data_time` VALUES ('6199', '5', '700', '11:39:00', '11:39:00');
INSERT INTO `ssc_data_time` VALUES ('6198', '5', '699', '11:38:00', '11:38:00');
INSERT INTO `ssc_data_time` VALUES ('6197', '5', '698', '11:37:00', '11:37:00');
INSERT INTO `ssc_data_time` VALUES ('6196', '5', '697', '11:36:00', '11:36:00');
INSERT INTO `ssc_data_time` VALUES ('6195', '5', '696', '11:35:00', '11:35:00');
INSERT INTO `ssc_data_time` VALUES ('6194', '5', '695', '11:34:00', '11:34:00');
INSERT INTO `ssc_data_time` VALUES ('6193', '5', '694', '11:33:00', '11:33:00');
INSERT INTO `ssc_data_time` VALUES ('6192', '5', '693', '11:32:00', '11:32:00');
INSERT INTO `ssc_data_time` VALUES ('6191', '5', '692', '11:31:00', '11:31:00');
INSERT INTO `ssc_data_time` VALUES ('6190', '5', '691', '11:30:00', '11:30:00');
INSERT INTO `ssc_data_time` VALUES ('6189', '5', '690', '11:29:00', '11:29:00');
INSERT INTO `ssc_data_time` VALUES ('6188', '5', '689', '11:28:00', '11:28:00');
INSERT INTO `ssc_data_time` VALUES ('6187', '5', '688', '11:27:00', '11:27:00');
INSERT INTO `ssc_data_time` VALUES ('6186', '5', '687', '11:26:00', '11:26:00');
INSERT INTO `ssc_data_time` VALUES ('6185', '5', '686', '11:25:00', '11:25:00');
INSERT INTO `ssc_data_time` VALUES ('6184', '5', '685', '11:24:00', '11:24:00');
INSERT INTO `ssc_data_time` VALUES ('6183', '5', '684', '11:23:00', '11:23:00');
INSERT INTO `ssc_data_time` VALUES ('6182', '5', '683', '11:22:00', '11:22:00');
INSERT INTO `ssc_data_time` VALUES ('6181', '5', '682', '11:21:00', '11:21:00');
INSERT INTO `ssc_data_time` VALUES ('6180', '5', '681', '11:20:00', '11:20:00');
INSERT INTO `ssc_data_time` VALUES ('6179', '5', '680', '11:19:00', '11:19:00');
INSERT INTO `ssc_data_time` VALUES ('6178', '5', '679', '11:18:00', '11:18:00');
INSERT INTO `ssc_data_time` VALUES ('6177', '5', '678', '11:17:00', '11:17:00');
INSERT INTO `ssc_data_time` VALUES ('6176', '5', '677', '11:16:00', '11:16:00');
INSERT INTO `ssc_data_time` VALUES ('6175', '5', '676', '11:15:00', '11:15:00');
INSERT INTO `ssc_data_time` VALUES ('6174', '5', '675', '11:14:00', '11:14:00');
INSERT INTO `ssc_data_time` VALUES ('6173', '5', '674', '11:13:00', '11:13:00');
INSERT INTO `ssc_data_time` VALUES ('6172', '5', '673', '11:12:00', '11:12:00');
INSERT INTO `ssc_data_time` VALUES ('6171', '5', '672', '11:11:00', '11:11:00');
INSERT INTO `ssc_data_time` VALUES ('6170', '5', '671', '11:10:00', '11:10:00');
INSERT INTO `ssc_data_time` VALUES ('6169', '5', '670', '11:09:00', '11:09:00');
INSERT INTO `ssc_data_time` VALUES ('6168', '5', '669', '11:08:00', '11:08:00');
INSERT INTO `ssc_data_time` VALUES ('6167', '5', '668', '11:07:00', '11:07:00');
INSERT INTO `ssc_data_time` VALUES ('6166', '5', '667', '11:06:00', '11:06:00');
INSERT INTO `ssc_data_time` VALUES ('6165', '5', '666', '11:05:00', '11:05:00');
INSERT INTO `ssc_data_time` VALUES ('6164', '5', '665', '11:04:00', '11:04:00');
INSERT INTO `ssc_data_time` VALUES ('6163', '5', '664', '11:03:00', '11:03:00');
INSERT INTO `ssc_data_time` VALUES ('6162', '5', '663', '11:02:00', '11:02:00');
INSERT INTO `ssc_data_time` VALUES ('6161', '5', '662', '11:01:00', '11:01:00');
INSERT INTO `ssc_data_time` VALUES ('6160', '5', '661', '11:00:00', '11:00:00');
INSERT INTO `ssc_data_time` VALUES ('6159', '5', '660', '10:59:00', '10:59:00');
INSERT INTO `ssc_data_time` VALUES ('6158', '5', '659', '10:58:00', '10:58:00');
INSERT INTO `ssc_data_time` VALUES ('6157', '5', '658', '10:57:00', '10:57:00');
INSERT INTO `ssc_data_time` VALUES ('6156', '5', '657', '10:56:00', '10:56:00');
INSERT INTO `ssc_data_time` VALUES ('6155', '5', '656', '10:55:00', '10:55:00');
INSERT INTO `ssc_data_time` VALUES ('6154', '5', '655', '10:54:00', '10:54:00');
INSERT INTO `ssc_data_time` VALUES ('6153', '5', '654', '10:53:00', '10:53:00');
INSERT INTO `ssc_data_time` VALUES ('6152', '5', '653', '10:52:00', '10:52:00');
INSERT INTO `ssc_data_time` VALUES ('6151', '5', '652', '10:51:00', '10:51:00');
INSERT INTO `ssc_data_time` VALUES ('6150', '5', '651', '10:50:00', '10:50:00');
INSERT INTO `ssc_data_time` VALUES ('6149', '5', '650', '10:49:00', '10:49:00');
INSERT INTO `ssc_data_time` VALUES ('6148', '5', '649', '10:48:00', '10:48:00');
INSERT INTO `ssc_data_time` VALUES ('6147', '5', '648', '10:47:00', '10:47:00');
INSERT INTO `ssc_data_time` VALUES ('6146', '5', '647', '10:46:00', '10:46:00');
INSERT INTO `ssc_data_time` VALUES ('6145', '5', '646', '10:45:00', '10:45:00');
INSERT INTO `ssc_data_time` VALUES ('6144', '5', '645', '10:44:00', '10:44:00');
INSERT INTO `ssc_data_time` VALUES ('6143', '5', '644', '10:43:00', '10:43:00');
INSERT INTO `ssc_data_time` VALUES ('6142', '5', '643', '10:42:00', '10:42:00');
INSERT INTO `ssc_data_time` VALUES ('6141', '5', '642', '10:41:00', '10:41:00');
INSERT INTO `ssc_data_time` VALUES ('6140', '5', '641', '10:40:00', '10:40:00');
INSERT INTO `ssc_data_time` VALUES ('6139', '5', '640', '10:39:00', '10:39:00');
INSERT INTO `ssc_data_time` VALUES ('6138', '5', '639', '10:38:00', '10:38:00');
INSERT INTO `ssc_data_time` VALUES ('6137', '5', '638', '10:37:00', '10:37:00');
INSERT INTO `ssc_data_time` VALUES ('6136', '5', '637', '10:36:00', '10:36:00');
INSERT INTO `ssc_data_time` VALUES ('6135', '5', '636', '10:35:00', '10:35:00');
INSERT INTO `ssc_data_time` VALUES ('6134', '5', '635', '10:34:00', '10:34:00');
INSERT INTO `ssc_data_time` VALUES ('6133', '5', '634', '10:33:00', '10:33:00');
INSERT INTO `ssc_data_time` VALUES ('6132', '5', '633', '10:32:00', '10:32:00');
INSERT INTO `ssc_data_time` VALUES ('6131', '5', '632', '10:31:00', '10:31:00');
INSERT INTO `ssc_data_time` VALUES ('6130', '5', '631', '10:30:00', '10:30:00');
INSERT INTO `ssc_data_time` VALUES ('6129', '5', '630', '10:29:00', '10:29:00');
INSERT INTO `ssc_data_time` VALUES ('6128', '5', '629', '10:28:00', '10:28:00');
INSERT INTO `ssc_data_time` VALUES ('6127', '5', '628', '10:27:00', '10:27:00');
INSERT INTO `ssc_data_time` VALUES ('6126', '5', '627', '10:26:00', '10:26:00');
INSERT INTO `ssc_data_time` VALUES ('6125', '5', '626', '10:25:00', '10:25:00');
INSERT INTO `ssc_data_time` VALUES ('6124', '5', '625', '10:24:00', '10:24:00');
INSERT INTO `ssc_data_time` VALUES ('6123', '5', '624', '10:23:00', '10:23:00');
INSERT INTO `ssc_data_time` VALUES ('6122', '5', '623', '10:22:00', '10:22:00');
INSERT INTO `ssc_data_time` VALUES ('6121', '5', '622', '10:21:00', '10:21:00');
INSERT INTO `ssc_data_time` VALUES ('6120', '5', '621', '10:20:00', '10:20:00');
INSERT INTO `ssc_data_time` VALUES ('6119', '5', '620', '10:19:00', '10:19:00');
INSERT INTO `ssc_data_time` VALUES ('6118', '5', '619', '10:18:00', '10:18:00');
INSERT INTO `ssc_data_time` VALUES ('6117', '5', '618', '10:17:00', '10:17:00');
INSERT INTO `ssc_data_time` VALUES ('6116', '5', '617', '10:16:00', '10:16:00');
INSERT INTO `ssc_data_time` VALUES ('6115', '5', '616', '10:15:00', '10:15:00');
INSERT INTO `ssc_data_time` VALUES ('6114', '5', '615', '10:14:00', '10:14:00');
INSERT INTO `ssc_data_time` VALUES ('6113', '5', '614', '10:13:00', '10:13:00');
INSERT INTO `ssc_data_time` VALUES ('6112', '5', '613', '10:12:00', '10:12:00');
INSERT INTO `ssc_data_time` VALUES ('6111', '5', '612', '10:11:00', '10:11:00');
INSERT INTO `ssc_data_time` VALUES ('6110', '5', '611', '10:10:00', '10:10:00');
INSERT INTO `ssc_data_time` VALUES ('6109', '5', '610', '10:09:00', '10:09:00');
INSERT INTO `ssc_data_time` VALUES ('6108', '5', '609', '10:08:00', '10:08:00');
INSERT INTO `ssc_data_time` VALUES ('6107', '5', '608', '10:07:00', '10:07:00');
INSERT INTO `ssc_data_time` VALUES ('6106', '5', '607', '10:06:00', '10:06:00');
INSERT INTO `ssc_data_time` VALUES ('6105', '5', '606', '10:05:00', '10:05:00');
INSERT INTO `ssc_data_time` VALUES ('6104', '5', '605', '10:04:00', '10:04:00');
INSERT INTO `ssc_data_time` VALUES ('6103', '5', '604', '10:03:00', '10:03:00');
INSERT INTO `ssc_data_time` VALUES ('6102', '5', '603', '10:02:00', '10:02:00');
INSERT INTO `ssc_data_time` VALUES ('6101', '5', '602', '10:01:00', '10:01:00');
INSERT INTO `ssc_data_time` VALUES ('6100', '5', '601', '10:00:00', '10:00:00');
INSERT INTO `ssc_data_time` VALUES ('6099', '5', '600', '09:59:00', '09:59:00');
INSERT INTO `ssc_data_time` VALUES ('6098', '5', '599', '09:58:00', '09:58:00');
INSERT INTO `ssc_data_time` VALUES ('6097', '5', '598', '09:57:00', '09:57:00');
INSERT INTO `ssc_data_time` VALUES ('6096', '5', '597', '09:56:00', '09:56:00');
INSERT INTO `ssc_data_time` VALUES ('6095', '5', '596', '09:55:00', '09:55:00');
INSERT INTO `ssc_data_time` VALUES ('6094', '5', '595', '09:54:00', '09:54:00');
INSERT INTO `ssc_data_time` VALUES ('6093', '5', '594', '09:53:00', '09:53:00');
INSERT INTO `ssc_data_time` VALUES ('6092', '5', '593', '09:52:00', '09:52:00');
INSERT INTO `ssc_data_time` VALUES ('6091', '5', '592', '09:51:00', '09:51:00');
INSERT INTO `ssc_data_time` VALUES ('6090', '5', '591', '09:50:00', '09:50:00');
INSERT INTO `ssc_data_time` VALUES ('6089', '5', '590', '09:49:00', '09:49:00');
INSERT INTO `ssc_data_time` VALUES ('6088', '5', '589', '09:48:00', '09:48:00');
INSERT INTO `ssc_data_time` VALUES ('6087', '5', '588', '09:47:00', '09:47:00');
INSERT INTO `ssc_data_time` VALUES ('6086', '5', '587', '09:46:00', '09:46:00');
INSERT INTO `ssc_data_time` VALUES ('6085', '5', '586', '09:45:00', '09:45:00');
INSERT INTO `ssc_data_time` VALUES ('6084', '5', '585', '09:44:00', '09:44:00');
INSERT INTO `ssc_data_time` VALUES ('6083', '5', '584', '09:43:00', '09:43:00');
INSERT INTO `ssc_data_time` VALUES ('6082', '5', '583', '09:42:00', '09:42:00');
INSERT INTO `ssc_data_time` VALUES ('6081', '5', '582', '09:41:00', '09:41:00');
INSERT INTO `ssc_data_time` VALUES ('6080', '5', '581', '09:40:00', '09:40:00');
INSERT INTO `ssc_data_time` VALUES ('6079', '5', '580', '09:39:00', '09:39:00');
INSERT INTO `ssc_data_time` VALUES ('6078', '5', '579', '09:38:00', '09:38:00');
INSERT INTO `ssc_data_time` VALUES ('6077', '5', '578', '09:37:00', '09:37:00');
INSERT INTO `ssc_data_time` VALUES ('6076', '5', '577', '09:36:00', '09:36:00');
INSERT INTO `ssc_data_time` VALUES ('6075', '5', '576', '09:35:00', '09:35:00');
INSERT INTO `ssc_data_time` VALUES ('6074', '5', '575', '09:34:00', '09:34:00');
INSERT INTO `ssc_data_time` VALUES ('6073', '5', '574', '09:33:00', '09:33:00');
INSERT INTO `ssc_data_time` VALUES ('6072', '5', '573', '09:32:00', '09:32:00');
INSERT INTO `ssc_data_time` VALUES ('6071', '5', '572', '09:31:00', '09:31:00');
INSERT INTO `ssc_data_time` VALUES ('6070', '5', '571', '09:30:00', '09:30:00');
INSERT INTO `ssc_data_time` VALUES ('6069', '5', '570', '09:29:00', '09:29:00');
INSERT INTO `ssc_data_time` VALUES ('6068', '5', '569', '09:28:00', '09:28:00');
INSERT INTO `ssc_data_time` VALUES ('6067', '5', '568', '09:27:00', '09:27:00');
INSERT INTO `ssc_data_time` VALUES ('6066', '5', '567', '09:26:00', '09:26:00');
INSERT INTO `ssc_data_time` VALUES ('6065', '5', '566', '09:25:00', '09:25:00');
INSERT INTO `ssc_data_time` VALUES ('6064', '5', '565', '09:24:00', '09:24:00');
INSERT INTO `ssc_data_time` VALUES ('6063', '5', '564', '09:23:00', '09:23:00');
INSERT INTO `ssc_data_time` VALUES ('6062', '5', '563', '09:22:00', '09:22:00');
INSERT INTO `ssc_data_time` VALUES ('6061', '5', '562', '09:21:00', '09:21:00');
INSERT INTO `ssc_data_time` VALUES ('6060', '5', '561', '09:20:00', '09:20:00');
INSERT INTO `ssc_data_time` VALUES ('6059', '5', '560', '09:19:00', '09:19:00');
INSERT INTO `ssc_data_time` VALUES ('6058', '5', '559', '09:18:00', '09:18:00');
INSERT INTO `ssc_data_time` VALUES ('6057', '5', '558', '09:17:00', '09:17:00');
INSERT INTO `ssc_data_time` VALUES ('6056', '5', '557', '09:16:00', '09:16:00');
INSERT INTO `ssc_data_time` VALUES ('6055', '5', '556', '09:15:00', '09:15:00');
INSERT INTO `ssc_data_time` VALUES ('6054', '5', '555', '09:14:00', '09:14:00');
INSERT INTO `ssc_data_time` VALUES ('6053', '5', '554', '09:13:00', '09:13:00');
INSERT INTO `ssc_data_time` VALUES ('6052', '5', '553', '09:12:00', '09:12:00');
INSERT INTO `ssc_data_time` VALUES ('6051', '5', '552', '09:11:00', '09:11:00');
INSERT INTO `ssc_data_time` VALUES ('6050', '5', '551', '09:10:00', '09:10:00');
INSERT INTO `ssc_data_time` VALUES ('6049', '5', '550', '09:09:00', '09:09:00');
INSERT INTO `ssc_data_time` VALUES ('6048', '5', '549', '09:08:00', '09:08:00');
INSERT INTO `ssc_data_time` VALUES ('6047', '5', '548', '09:07:00', '09:07:00');
INSERT INTO `ssc_data_time` VALUES ('6046', '5', '547', '09:06:00', '09:06:00');
INSERT INTO `ssc_data_time` VALUES ('6045', '5', '546', '09:05:00', '09:05:00');
INSERT INTO `ssc_data_time` VALUES ('6044', '5', '545', '09:04:00', '09:04:00');
INSERT INTO `ssc_data_time` VALUES ('6043', '5', '544', '09:03:00', '09:03:00');
INSERT INTO `ssc_data_time` VALUES ('6042', '5', '543', '09:02:00', '09:02:00');
INSERT INTO `ssc_data_time` VALUES ('6041', '5', '542', '09:01:00', '09:01:00');
INSERT INTO `ssc_data_time` VALUES ('6040', '5', '541', '09:00:00', '09:00:00');
INSERT INTO `ssc_data_time` VALUES ('6039', '5', '540', '08:59:00', '08:59:00');
INSERT INTO `ssc_data_time` VALUES ('6038', '5', '539', '08:58:00', '08:58:00');
INSERT INTO `ssc_data_time` VALUES ('6037', '5', '538', '08:57:00', '08:57:00');
INSERT INTO `ssc_data_time` VALUES ('6036', '5', '537', '08:56:00', '08:56:00');
INSERT INTO `ssc_data_time` VALUES ('6035', '5', '536', '08:55:00', '08:55:00');
INSERT INTO `ssc_data_time` VALUES ('6034', '5', '535', '08:54:00', '08:54:00');
INSERT INTO `ssc_data_time` VALUES ('6033', '5', '534', '08:53:00', '08:53:00');
INSERT INTO `ssc_data_time` VALUES ('6032', '5', '533', '08:52:00', '08:52:00');
INSERT INTO `ssc_data_time` VALUES ('6031', '5', '532', '08:51:00', '08:51:00');
INSERT INTO `ssc_data_time` VALUES ('6030', '5', '531', '08:50:00', '08:50:00');
INSERT INTO `ssc_data_time` VALUES ('6029', '5', '530', '08:49:00', '08:49:00');
INSERT INTO `ssc_data_time` VALUES ('6028', '5', '529', '08:48:00', '08:48:00');
INSERT INTO `ssc_data_time` VALUES ('6027', '5', '528', '08:47:00', '08:47:00');
INSERT INTO `ssc_data_time` VALUES ('6026', '5', '527', '08:46:00', '08:46:00');
INSERT INTO `ssc_data_time` VALUES ('6025', '5', '526', '08:45:00', '08:45:00');
INSERT INTO `ssc_data_time` VALUES ('6024', '5', '525', '08:44:00', '08:44:00');
INSERT INTO `ssc_data_time` VALUES ('6023', '5', '524', '08:43:00', '08:43:00');
INSERT INTO `ssc_data_time` VALUES ('6022', '5', '523', '08:42:00', '08:42:00');
INSERT INTO `ssc_data_time` VALUES ('6021', '5', '522', '08:41:00', '08:41:00');
INSERT INTO `ssc_data_time` VALUES ('6020', '5', '521', '08:40:00', '08:40:00');
INSERT INTO `ssc_data_time` VALUES ('6019', '5', '520', '08:39:00', '08:39:00');
INSERT INTO `ssc_data_time` VALUES ('6018', '5', '519', '08:38:00', '08:38:00');
INSERT INTO `ssc_data_time` VALUES ('6017', '5', '518', '08:37:00', '08:37:00');
INSERT INTO `ssc_data_time` VALUES ('6016', '5', '517', '08:36:00', '08:36:00');
INSERT INTO `ssc_data_time` VALUES ('6015', '5', '516', '08:35:00', '08:35:00');
INSERT INTO `ssc_data_time` VALUES ('6014', '5', '515', '08:34:00', '08:34:00');
INSERT INTO `ssc_data_time` VALUES ('6013', '5', '514', '08:33:00', '08:33:00');
INSERT INTO `ssc_data_time` VALUES ('6012', '5', '513', '08:32:00', '08:32:00');
INSERT INTO `ssc_data_time` VALUES ('6011', '5', '512', '08:31:00', '08:31:00');
INSERT INTO `ssc_data_time` VALUES ('6010', '5', '511', '08:30:00', '08:30:00');
INSERT INTO `ssc_data_time` VALUES ('6009', '5', '510', '08:29:00', '08:29:00');
INSERT INTO `ssc_data_time` VALUES ('6008', '5', '509', '08:28:00', '08:28:00');
INSERT INTO `ssc_data_time` VALUES ('6007', '5', '508', '08:27:00', '08:27:00');
INSERT INTO `ssc_data_time` VALUES ('6006', '5', '507', '08:26:00', '08:26:00');
INSERT INTO `ssc_data_time` VALUES ('6005', '5', '506', '08:25:00', '08:25:00');
INSERT INTO `ssc_data_time` VALUES ('6004', '5', '505', '08:24:00', '08:24:00');
INSERT INTO `ssc_data_time` VALUES ('6003', '5', '504', '08:23:00', '08:23:00');
INSERT INTO `ssc_data_time` VALUES ('6002', '5', '503', '08:22:00', '08:22:00');
INSERT INTO `ssc_data_time` VALUES ('6001', '5', '502', '08:21:00', '08:21:00');
INSERT INTO `ssc_data_time` VALUES ('6000', '5', '501', '08:20:00', '08:20:00');
INSERT INTO `ssc_data_time` VALUES ('5999', '5', '500', '08:19:00', '08:19:00');
INSERT INTO `ssc_data_time` VALUES ('5998', '5', '499', '08:18:00', '08:18:00');
INSERT INTO `ssc_data_time` VALUES ('5997', '5', '498', '08:17:00', '08:17:00');
INSERT INTO `ssc_data_time` VALUES ('5996', '5', '497', '08:16:00', '08:16:00');
INSERT INTO `ssc_data_time` VALUES ('5995', '5', '496', '08:15:00', '08:15:00');
INSERT INTO `ssc_data_time` VALUES ('5994', '5', '495', '08:14:00', '08:14:00');
INSERT INTO `ssc_data_time` VALUES ('5993', '5', '494', '08:13:00', '08:13:00');
INSERT INTO `ssc_data_time` VALUES ('5992', '5', '493', '08:12:00', '08:12:00');
INSERT INTO `ssc_data_time` VALUES ('5991', '5', '492', '08:11:00', '08:11:00');
INSERT INTO `ssc_data_time` VALUES ('5990', '5', '491', '08:10:00', '08:10:00');
INSERT INTO `ssc_data_time` VALUES ('5989', '5', '490', '08:09:00', '08:09:00');
INSERT INTO `ssc_data_time` VALUES ('5988', '5', '489', '08:08:00', '08:08:00');
INSERT INTO `ssc_data_time` VALUES ('5987', '5', '488', '08:07:00', '08:07:00');
INSERT INTO `ssc_data_time` VALUES ('5986', '5', '487', '08:06:00', '08:06:00');
INSERT INTO `ssc_data_time` VALUES ('5985', '5', '486', '08:05:00', '08:05:00');
INSERT INTO `ssc_data_time` VALUES ('5984', '5', '485', '08:04:00', '08:04:00');
INSERT INTO `ssc_data_time` VALUES ('5983', '5', '484', '08:03:00', '08:03:00');
INSERT INTO `ssc_data_time` VALUES ('5982', '5', '483', '08:02:00', '08:02:00');
INSERT INTO `ssc_data_time` VALUES ('5981', '5', '482', '08:01:00', '08:01:00');
INSERT INTO `ssc_data_time` VALUES ('5980', '5', '481', '08:00:00', '08:00:00');
INSERT INTO `ssc_data_time` VALUES ('5979', '5', '480', '07:59:00', '07:59:00');
INSERT INTO `ssc_data_time` VALUES ('5978', '5', '479', '07:58:00', '07:58:00');
INSERT INTO `ssc_data_time` VALUES ('5977', '5', '478', '07:57:00', '07:57:00');
INSERT INTO `ssc_data_time` VALUES ('5976', '5', '477', '07:56:00', '07:56:00');
INSERT INTO `ssc_data_time` VALUES ('5975', '5', '476', '07:55:00', '07:55:00');
INSERT INTO `ssc_data_time` VALUES ('5974', '5', '475', '07:54:00', '07:54:00');
INSERT INTO `ssc_data_time` VALUES ('5973', '5', '474', '07:53:00', '07:53:00');
INSERT INTO `ssc_data_time` VALUES ('5972', '5', '473', '07:52:00', '07:52:00');
INSERT INTO `ssc_data_time` VALUES ('5971', '5', '472', '07:51:00', '07:51:00');
INSERT INTO `ssc_data_time` VALUES ('5970', '5', '471', '07:50:00', '07:50:00');
INSERT INTO `ssc_data_time` VALUES ('5969', '5', '470', '07:49:00', '07:49:00');
INSERT INTO `ssc_data_time` VALUES ('5968', '5', '469', '07:48:00', '07:48:00');
INSERT INTO `ssc_data_time` VALUES ('5967', '5', '468', '07:47:00', '07:47:00');
INSERT INTO `ssc_data_time` VALUES ('5966', '5', '467', '07:46:00', '07:46:00');
INSERT INTO `ssc_data_time` VALUES ('5965', '5', '466', '07:45:00', '07:45:00');
INSERT INTO `ssc_data_time` VALUES ('5964', '5', '465', '07:44:00', '07:44:00');
INSERT INTO `ssc_data_time` VALUES ('5963', '5', '464', '07:43:00', '07:43:00');
INSERT INTO `ssc_data_time` VALUES ('5962', '5', '463', '07:42:00', '07:42:00');
INSERT INTO `ssc_data_time` VALUES ('5961', '5', '462', '07:41:00', '07:41:00');
INSERT INTO `ssc_data_time` VALUES ('5960', '5', '461', '07:40:00', '07:40:00');
INSERT INTO `ssc_data_time` VALUES ('5959', '5', '460', '07:39:00', '07:39:00');
INSERT INTO `ssc_data_time` VALUES ('5958', '5', '459', '07:38:00', '07:38:00');
INSERT INTO `ssc_data_time` VALUES ('5957', '5', '458', '07:37:00', '07:37:00');
INSERT INTO `ssc_data_time` VALUES ('5956', '5', '457', '07:36:00', '07:36:00');
INSERT INTO `ssc_data_time` VALUES ('5955', '5', '456', '07:35:00', '07:35:00');
INSERT INTO `ssc_data_time` VALUES ('5954', '5', '455', '07:34:00', '07:34:00');
INSERT INTO `ssc_data_time` VALUES ('5953', '5', '454', '07:33:00', '07:33:00');
INSERT INTO `ssc_data_time` VALUES ('5952', '5', '453', '07:32:00', '07:32:00');
INSERT INTO `ssc_data_time` VALUES ('5951', '5', '452', '07:31:00', '07:31:00');
INSERT INTO `ssc_data_time` VALUES ('5950', '5', '451', '07:30:00', '07:30:00');
INSERT INTO `ssc_data_time` VALUES ('5949', '5', '450', '07:29:00', '07:29:00');
INSERT INTO `ssc_data_time` VALUES ('5948', '5', '449', '07:28:00', '07:28:00');
INSERT INTO `ssc_data_time` VALUES ('5947', '5', '448', '07:27:00', '07:27:00');
INSERT INTO `ssc_data_time` VALUES ('5946', '5', '447', '07:26:00', '07:26:00');
INSERT INTO `ssc_data_time` VALUES ('5945', '5', '446', '07:25:00', '07:25:00');
INSERT INTO `ssc_data_time` VALUES ('5944', '5', '445', '07:24:00', '07:24:00');
INSERT INTO `ssc_data_time` VALUES ('5943', '5', '444', '07:23:00', '07:23:00');
INSERT INTO `ssc_data_time` VALUES ('5942', '5', '443', '07:22:00', '07:22:00');
INSERT INTO `ssc_data_time` VALUES ('5941', '5', '442', '07:21:00', '07:21:00');
INSERT INTO `ssc_data_time` VALUES ('5940', '5', '441', '07:20:00', '07:20:00');
INSERT INTO `ssc_data_time` VALUES ('5939', '5', '440', '07:19:00', '07:19:00');
INSERT INTO `ssc_data_time` VALUES ('5938', '5', '439', '07:18:00', '07:18:00');
INSERT INTO `ssc_data_time` VALUES ('5937', '5', '438', '07:17:00', '07:17:00');
INSERT INTO `ssc_data_time` VALUES ('5936', '5', '437', '07:16:00', '07:16:00');
INSERT INTO `ssc_data_time` VALUES ('5935', '5', '436', '07:15:00', '07:15:00');
INSERT INTO `ssc_data_time` VALUES ('5934', '5', '435', '07:14:00', '07:14:00');
INSERT INTO `ssc_data_time` VALUES ('5933', '5', '434', '07:13:00', '07:13:00');
INSERT INTO `ssc_data_time` VALUES ('5932', '5', '433', '07:12:00', '07:12:00');
INSERT INTO `ssc_data_time` VALUES ('5931', '5', '432', '07:11:00', '07:11:00');
INSERT INTO `ssc_data_time` VALUES ('5930', '5', '431', '07:10:00', '07:10:00');
INSERT INTO `ssc_data_time` VALUES ('5929', '5', '430', '07:09:00', '07:09:00');
INSERT INTO `ssc_data_time` VALUES ('5928', '5', '429', '07:08:00', '07:08:00');
INSERT INTO `ssc_data_time` VALUES ('5927', '5', '428', '07:07:00', '07:07:00');
INSERT INTO `ssc_data_time` VALUES ('5926', '5', '427', '07:06:00', '07:06:00');
INSERT INTO `ssc_data_time` VALUES ('5925', '5', '426', '07:05:00', '07:05:00');
INSERT INTO `ssc_data_time` VALUES ('5924', '5', '425', '07:04:00', '07:04:00');
INSERT INTO `ssc_data_time` VALUES ('5923', '5', '424', '07:03:00', '07:03:00');
INSERT INTO `ssc_data_time` VALUES ('5922', '5', '423', '07:02:00', '07:02:00');
INSERT INTO `ssc_data_time` VALUES ('5921', '5', '422', '07:01:00', '07:01:00');
INSERT INTO `ssc_data_time` VALUES ('5920', '5', '421', '07:00:00', '07:00:00');
INSERT INTO `ssc_data_time` VALUES ('5919', '5', '420', '06:59:00', '06:59:00');
INSERT INTO `ssc_data_time` VALUES ('5918', '5', '419', '06:58:00', '06:58:00');
INSERT INTO `ssc_data_time` VALUES ('5917', '5', '418', '06:57:00', '06:57:00');
INSERT INTO `ssc_data_time` VALUES ('5916', '5', '417', '06:56:00', '06:56:00');
INSERT INTO `ssc_data_time` VALUES ('5915', '5', '416', '06:55:00', '06:55:00');
INSERT INTO `ssc_data_time` VALUES ('5914', '5', '415', '06:54:00', '06:54:00');
INSERT INTO `ssc_data_time` VALUES ('5913', '5', '414', '06:53:00', '06:53:00');
INSERT INTO `ssc_data_time` VALUES ('5912', '5', '413', '06:52:00', '06:52:00');
INSERT INTO `ssc_data_time` VALUES ('5911', '5', '412', '06:51:00', '06:51:00');
INSERT INTO `ssc_data_time` VALUES ('5910', '5', '411', '06:50:00', '06:50:00');
INSERT INTO `ssc_data_time` VALUES ('5909', '5', '410', '06:49:00', '06:49:00');
INSERT INTO `ssc_data_time` VALUES ('5908', '5', '409', '06:48:00', '06:48:00');
INSERT INTO `ssc_data_time` VALUES ('5907', '5', '408', '06:47:00', '06:47:00');
INSERT INTO `ssc_data_time` VALUES ('5906', '5', '407', '06:46:00', '06:46:00');
INSERT INTO `ssc_data_time` VALUES ('5905', '5', '406', '06:45:00', '06:45:00');
INSERT INTO `ssc_data_time` VALUES ('5904', '5', '405', '06:44:00', '06:44:00');
INSERT INTO `ssc_data_time` VALUES ('5903', '5', '404', '06:43:00', '06:43:00');
INSERT INTO `ssc_data_time` VALUES ('5902', '5', '403', '06:42:00', '06:42:00');
INSERT INTO `ssc_data_time` VALUES ('5901', '5', '402', '06:41:00', '06:41:00');
INSERT INTO `ssc_data_time` VALUES ('5900', '5', '401', '06:40:00', '06:40:00');
INSERT INTO `ssc_data_time` VALUES ('5899', '5', '400', '06:39:00', '06:39:00');
INSERT INTO `ssc_data_time` VALUES ('5898', '5', '399', '06:38:00', '06:38:00');
INSERT INTO `ssc_data_time` VALUES ('5897', '5', '398', '06:37:00', '06:37:00');
INSERT INTO `ssc_data_time` VALUES ('5896', '5', '397', '06:36:00', '06:36:00');
INSERT INTO `ssc_data_time` VALUES ('5895', '5', '396', '06:35:00', '06:35:00');
INSERT INTO `ssc_data_time` VALUES ('5894', '5', '395', '06:34:00', '06:34:00');
INSERT INTO `ssc_data_time` VALUES ('5893', '5', '394', '06:33:00', '06:33:00');
INSERT INTO `ssc_data_time` VALUES ('5892', '5', '393', '06:32:00', '06:32:00');
INSERT INTO `ssc_data_time` VALUES ('5891', '5', '392', '06:31:00', '06:31:00');
INSERT INTO `ssc_data_time` VALUES ('5890', '5', '391', '06:30:00', '06:30:00');
INSERT INTO `ssc_data_time` VALUES ('5889', '5', '390', '06:29:00', '06:29:00');
INSERT INTO `ssc_data_time` VALUES ('5888', '5', '389', '06:28:00', '06:28:00');
INSERT INTO `ssc_data_time` VALUES ('5887', '5', '388', '06:27:00', '06:27:00');
INSERT INTO `ssc_data_time` VALUES ('5886', '5', '387', '06:26:00', '06:26:00');
INSERT INTO `ssc_data_time` VALUES ('5885', '5', '386', '06:25:00', '06:25:00');
INSERT INTO `ssc_data_time` VALUES ('5884', '5', '385', '06:24:00', '06:24:00');
INSERT INTO `ssc_data_time` VALUES ('5883', '5', '384', '06:23:00', '06:23:00');
INSERT INTO `ssc_data_time` VALUES ('5882', '5', '383', '06:22:00', '06:22:00');
INSERT INTO `ssc_data_time` VALUES ('5881', '5', '382', '06:21:00', '06:21:00');
INSERT INTO `ssc_data_time` VALUES ('5880', '5', '381', '06:20:00', '06:20:00');
INSERT INTO `ssc_data_time` VALUES ('5879', '5', '380', '06:19:00', '06:19:00');
INSERT INTO `ssc_data_time` VALUES ('5878', '5', '379', '06:18:00', '06:18:00');
INSERT INTO `ssc_data_time` VALUES ('5877', '5', '378', '06:17:00', '06:17:00');
INSERT INTO `ssc_data_time` VALUES ('5876', '5', '377', '06:16:00', '06:16:00');
INSERT INTO `ssc_data_time` VALUES ('5875', '5', '376', '06:15:00', '06:15:00');
INSERT INTO `ssc_data_time` VALUES ('5874', '5', '375', '06:14:00', '06:14:00');
INSERT INTO `ssc_data_time` VALUES ('5873', '5', '374', '06:13:00', '06:13:00');
INSERT INTO `ssc_data_time` VALUES ('5872', '5', '373', '06:12:00', '06:12:00');
INSERT INTO `ssc_data_time` VALUES ('5871', '5', '372', '06:11:00', '06:11:00');
INSERT INTO `ssc_data_time` VALUES ('5870', '5', '371', '06:10:00', '06:10:00');
INSERT INTO `ssc_data_time` VALUES ('5869', '5', '370', '06:09:00', '06:09:00');
INSERT INTO `ssc_data_time` VALUES ('5868', '5', '369', '06:08:00', '06:08:00');
INSERT INTO `ssc_data_time` VALUES ('5867', '5', '368', '06:07:00', '06:07:00');
INSERT INTO `ssc_data_time` VALUES ('5866', '5', '367', '06:06:00', '06:06:00');
INSERT INTO `ssc_data_time` VALUES ('5865', '5', '366', '06:05:00', '06:05:00');
INSERT INTO `ssc_data_time` VALUES ('5864', '5', '365', '06:04:00', '06:04:00');
INSERT INTO `ssc_data_time` VALUES ('5863', '5', '364', '06:03:00', '06:03:00');
INSERT INTO `ssc_data_time` VALUES ('5862', '5', '363', '06:02:00', '06:02:00');
INSERT INTO `ssc_data_time` VALUES ('5861', '5', '362', '06:01:00', '06:01:00');
INSERT INTO `ssc_data_time` VALUES ('5860', '5', '361', '06:00:00', '06:00:00');
INSERT INTO `ssc_data_time` VALUES ('5859', '5', '360', '05:59:00', '05:59:00');
INSERT INTO `ssc_data_time` VALUES ('5858', '5', '359', '05:58:00', '05:58:00');
INSERT INTO `ssc_data_time` VALUES ('5857', '5', '358', '05:57:00', '05:57:00');
INSERT INTO `ssc_data_time` VALUES ('5856', '5', '357', '05:56:00', '05:56:00');
INSERT INTO `ssc_data_time` VALUES ('5855', '5', '356', '05:55:00', '05:55:00');
INSERT INTO `ssc_data_time` VALUES ('5854', '5', '355', '05:54:00', '05:54:00');
INSERT INTO `ssc_data_time` VALUES ('5853', '5', '354', '05:53:00', '05:53:00');
INSERT INTO `ssc_data_time` VALUES ('5852', '5', '353', '05:52:00', '05:52:00');
INSERT INTO `ssc_data_time` VALUES ('5851', '5', '352', '05:51:00', '05:51:00');
INSERT INTO `ssc_data_time` VALUES ('5850', '5', '351', '05:50:00', '05:50:00');
INSERT INTO `ssc_data_time` VALUES ('5849', '5', '350', '05:49:00', '05:49:00');
INSERT INTO `ssc_data_time` VALUES ('5848', '5', '349', '05:48:00', '05:48:00');
INSERT INTO `ssc_data_time` VALUES ('5847', '5', '348', '05:47:00', '05:47:00');
INSERT INTO `ssc_data_time` VALUES ('5846', '5', '347', '05:46:00', '05:46:00');
INSERT INTO `ssc_data_time` VALUES ('5845', '5', '346', '05:45:00', '05:45:00');
INSERT INTO `ssc_data_time` VALUES ('5844', '5', '345', '05:44:00', '05:44:00');
INSERT INTO `ssc_data_time` VALUES ('5843', '5', '344', '05:43:00', '05:43:00');
INSERT INTO `ssc_data_time` VALUES ('5842', '5', '343', '05:42:00', '05:42:00');
INSERT INTO `ssc_data_time` VALUES ('5841', '5', '342', '05:41:00', '05:41:00');
INSERT INTO `ssc_data_time` VALUES ('5840', '5', '341', '05:40:00', '05:40:00');
INSERT INTO `ssc_data_time` VALUES ('5839', '5', '340', '05:39:00', '05:39:00');
INSERT INTO `ssc_data_time` VALUES ('5838', '5', '339', '05:38:00', '05:38:00');
INSERT INTO `ssc_data_time` VALUES ('5837', '5', '338', '05:37:00', '05:37:00');
INSERT INTO `ssc_data_time` VALUES ('5836', '5', '337', '05:36:00', '05:36:00');
INSERT INTO `ssc_data_time` VALUES ('5835', '5', '336', '05:35:00', '05:35:00');
INSERT INTO `ssc_data_time` VALUES ('5834', '5', '335', '05:34:00', '05:34:00');
INSERT INTO `ssc_data_time` VALUES ('5833', '5', '334', '05:33:00', '05:33:00');
INSERT INTO `ssc_data_time` VALUES ('5832', '5', '333', '05:32:00', '05:32:00');
INSERT INTO `ssc_data_time` VALUES ('5831', '5', '332', '05:31:00', '05:31:00');
INSERT INTO `ssc_data_time` VALUES ('5830', '5', '331', '05:30:00', '05:30:00');
INSERT INTO `ssc_data_time` VALUES ('5829', '5', '330', '05:29:00', '05:29:00');
INSERT INTO `ssc_data_time` VALUES ('5828', '5', '329', '05:28:00', '05:28:00');
INSERT INTO `ssc_data_time` VALUES ('5827', '5', '328', '05:27:00', '05:27:00');
INSERT INTO `ssc_data_time` VALUES ('5826', '5', '327', '05:26:00', '05:26:00');
INSERT INTO `ssc_data_time` VALUES ('5825', '5', '326', '05:25:00', '05:25:00');
INSERT INTO `ssc_data_time` VALUES ('5824', '5', '325', '05:24:00', '05:24:00');
INSERT INTO `ssc_data_time` VALUES ('5823', '5', '324', '05:23:00', '05:23:00');
INSERT INTO `ssc_data_time` VALUES ('5822', '5', '323', '05:22:00', '05:22:00');
INSERT INTO `ssc_data_time` VALUES ('5821', '5', '322', '05:21:00', '05:21:00');
INSERT INTO `ssc_data_time` VALUES ('5820', '5', '321', '05:20:00', '05:20:00');
INSERT INTO `ssc_data_time` VALUES ('5819', '5', '320', '05:19:00', '05:19:00');
INSERT INTO `ssc_data_time` VALUES ('5818', '5', '319', '05:18:00', '05:18:00');
INSERT INTO `ssc_data_time` VALUES ('5817', '5', '318', '05:17:00', '05:17:00');
INSERT INTO `ssc_data_time` VALUES ('5816', '5', '317', '05:16:00', '05:16:00');
INSERT INTO `ssc_data_time` VALUES ('5815', '5', '316', '05:15:00', '05:15:00');
INSERT INTO `ssc_data_time` VALUES ('5814', '5', '315', '05:14:00', '05:14:00');
INSERT INTO `ssc_data_time` VALUES ('5813', '5', '314', '05:13:00', '05:13:00');
INSERT INTO `ssc_data_time` VALUES ('5812', '5', '313', '05:12:00', '05:12:00');
INSERT INTO `ssc_data_time` VALUES ('5811', '5', '312', '05:11:00', '05:11:00');
INSERT INTO `ssc_data_time` VALUES ('5810', '5', '311', '05:10:00', '05:10:00');
INSERT INTO `ssc_data_time` VALUES ('5809', '5', '310', '05:09:00', '05:09:00');
INSERT INTO `ssc_data_time` VALUES ('5808', '5', '309', '05:08:00', '05:08:00');
INSERT INTO `ssc_data_time` VALUES ('5807', '5', '308', '05:07:00', '05:07:00');
INSERT INTO `ssc_data_time` VALUES ('5806', '5', '307', '05:06:00', '05:06:00');
INSERT INTO `ssc_data_time` VALUES ('5805', '5', '306', '05:05:00', '05:05:00');
INSERT INTO `ssc_data_time` VALUES ('5804', '5', '305', '05:04:00', '05:04:00');
INSERT INTO `ssc_data_time` VALUES ('5803', '5', '304', '05:03:00', '05:03:00');
INSERT INTO `ssc_data_time` VALUES ('5802', '5', '303', '05:02:00', '05:02:00');
INSERT INTO `ssc_data_time` VALUES ('5801', '5', '302', '05:01:00', '05:01:00');
INSERT INTO `ssc_data_time` VALUES ('5800', '5', '301', '05:00:00', '05:00:00');
INSERT INTO `ssc_data_time` VALUES ('5799', '5', '300', '04:59:00', '04:59:00');
INSERT INTO `ssc_data_time` VALUES ('5798', '5', '299', '04:58:00', '04:58:00');
INSERT INTO `ssc_data_time` VALUES ('5797', '5', '298', '04:57:00', '04:57:00');
INSERT INTO `ssc_data_time` VALUES ('5796', '5', '297', '04:56:00', '04:56:00');
INSERT INTO `ssc_data_time` VALUES ('5795', '5', '296', '04:55:00', '04:55:00');
INSERT INTO `ssc_data_time` VALUES ('5794', '5', '295', '04:54:00', '04:54:00');
INSERT INTO `ssc_data_time` VALUES ('5793', '5', '294', '04:53:00', '04:53:00');
INSERT INTO `ssc_data_time` VALUES ('5792', '5', '293', '04:52:00', '04:52:00');
INSERT INTO `ssc_data_time` VALUES ('5791', '5', '292', '04:51:00', '04:51:00');
INSERT INTO `ssc_data_time` VALUES ('5790', '5', '291', '04:50:00', '04:50:00');
INSERT INTO `ssc_data_time` VALUES ('5789', '5', '290', '04:49:00', '04:49:00');
INSERT INTO `ssc_data_time` VALUES ('5788', '5', '289', '04:48:00', '04:48:00');
INSERT INTO `ssc_data_time` VALUES ('5787', '5', '288', '04:47:00', '04:47:00');
INSERT INTO `ssc_data_time` VALUES ('5786', '5', '287', '04:46:00', '04:46:00');
INSERT INTO `ssc_data_time` VALUES ('5785', '5', '286', '04:45:00', '04:45:00');
INSERT INTO `ssc_data_time` VALUES ('5784', '5', '285', '04:44:00', '04:44:00');
INSERT INTO `ssc_data_time` VALUES ('5783', '5', '284', '04:43:00', '04:43:00');
INSERT INTO `ssc_data_time` VALUES ('5782', '5', '283', '04:42:00', '04:42:00');
INSERT INTO `ssc_data_time` VALUES ('5781', '5', '282', '04:41:00', '04:41:00');
INSERT INTO `ssc_data_time` VALUES ('5780', '5', '281', '04:40:00', '04:40:00');
INSERT INTO `ssc_data_time` VALUES ('5779', '5', '280', '04:39:00', '04:39:00');
INSERT INTO `ssc_data_time` VALUES ('5778', '5', '279', '04:38:00', '04:38:00');
INSERT INTO `ssc_data_time` VALUES ('5777', '5', '278', '04:37:00', '04:37:00');
INSERT INTO `ssc_data_time` VALUES ('5776', '5', '277', '04:36:00', '04:36:00');
INSERT INTO `ssc_data_time` VALUES ('5775', '5', '276', '04:35:00', '04:35:00');
INSERT INTO `ssc_data_time` VALUES ('5774', '5', '275', '04:34:00', '04:34:00');
INSERT INTO `ssc_data_time` VALUES ('5773', '5', '274', '04:33:00', '04:33:00');
INSERT INTO `ssc_data_time` VALUES ('5772', '5', '273', '04:32:00', '04:32:00');
INSERT INTO `ssc_data_time` VALUES ('5771', '5', '272', '04:31:00', '04:31:00');
INSERT INTO `ssc_data_time` VALUES ('5770', '5', '271', '04:30:00', '04:30:00');
INSERT INTO `ssc_data_time` VALUES ('5769', '5', '270', '04:29:00', '04:29:00');
INSERT INTO `ssc_data_time` VALUES ('5768', '5', '269', '04:28:00', '04:28:00');
INSERT INTO `ssc_data_time` VALUES ('5767', '5', '268', '04:27:00', '04:27:00');
INSERT INTO `ssc_data_time` VALUES ('5766', '5', '267', '04:26:00', '04:26:00');
INSERT INTO `ssc_data_time` VALUES ('5765', '5', '266', '04:25:00', '04:25:00');
INSERT INTO `ssc_data_time` VALUES ('5764', '5', '265', '04:24:00', '04:24:00');
INSERT INTO `ssc_data_time` VALUES ('5763', '5', '264', '04:23:00', '04:23:00');
INSERT INTO `ssc_data_time` VALUES ('5762', '5', '263', '04:22:00', '04:22:00');
INSERT INTO `ssc_data_time` VALUES ('5761', '5', '262', '04:21:00', '04:21:00');
INSERT INTO `ssc_data_time` VALUES ('5760', '5', '261', '04:20:00', '04:20:00');
INSERT INTO `ssc_data_time` VALUES ('5759', '5', '260', '04:19:00', '04:19:00');
INSERT INTO `ssc_data_time` VALUES ('5758', '5', '259', '04:18:00', '04:18:00');
INSERT INTO `ssc_data_time` VALUES ('5757', '5', '258', '04:17:00', '04:17:00');
INSERT INTO `ssc_data_time` VALUES ('5756', '5', '257', '04:16:00', '04:16:00');
INSERT INTO `ssc_data_time` VALUES ('5755', '5', '256', '04:15:00', '04:15:00');
INSERT INTO `ssc_data_time` VALUES ('5754', '5', '255', '04:14:00', '04:14:00');
INSERT INTO `ssc_data_time` VALUES ('5753', '5', '254', '04:13:00', '04:13:00');
INSERT INTO `ssc_data_time` VALUES ('5752', '5', '253', '04:12:00', '04:12:00');
INSERT INTO `ssc_data_time` VALUES ('5751', '5', '252', '04:11:00', '04:11:00');
INSERT INTO `ssc_data_time` VALUES ('5750', '5', '251', '04:10:00', '04:10:00');
INSERT INTO `ssc_data_time` VALUES ('5749', '5', '250', '04:09:00', '04:09:00');
INSERT INTO `ssc_data_time` VALUES ('5748', '5', '249', '04:08:00', '04:08:00');
INSERT INTO `ssc_data_time` VALUES ('5747', '5', '248', '04:07:00', '04:07:00');
INSERT INTO `ssc_data_time` VALUES ('5746', '5', '247', '04:06:00', '04:06:00');
INSERT INTO `ssc_data_time` VALUES ('5745', '5', '246', '04:05:00', '04:05:00');
INSERT INTO `ssc_data_time` VALUES ('5744', '5', '245', '04:04:00', '04:04:00');
INSERT INTO `ssc_data_time` VALUES ('5743', '5', '244', '04:03:00', '04:03:00');
INSERT INTO `ssc_data_time` VALUES ('5742', '5', '243', '04:02:00', '04:02:00');
INSERT INTO `ssc_data_time` VALUES ('5741', '5', '242', '04:01:00', '04:01:00');
INSERT INTO `ssc_data_time` VALUES ('5740', '5', '241', '04:00:00', '04:00:00');
INSERT INTO `ssc_data_time` VALUES ('5739', '5', '240', '03:59:00', '03:59:00');
INSERT INTO `ssc_data_time` VALUES ('5738', '5', '239', '03:58:00', '03:58:00');
INSERT INTO `ssc_data_time` VALUES ('5737', '5', '238', '03:57:00', '03:57:00');
INSERT INTO `ssc_data_time` VALUES ('5736', '5', '237', '03:56:00', '03:56:00');
INSERT INTO `ssc_data_time` VALUES ('5735', '5', '236', '03:55:00', '03:55:00');
INSERT INTO `ssc_data_time` VALUES ('5734', '5', '235', '03:54:00', '03:54:00');
INSERT INTO `ssc_data_time` VALUES ('5733', '5', '234', '03:53:00', '03:53:00');
INSERT INTO `ssc_data_time` VALUES ('5732', '5', '233', '03:52:00', '03:52:00');
INSERT INTO `ssc_data_time` VALUES ('5731', '5', '232', '03:51:00', '03:51:00');
INSERT INTO `ssc_data_time` VALUES ('5730', '5', '231', '03:50:00', '03:50:00');
INSERT INTO `ssc_data_time` VALUES ('5729', '5', '230', '03:49:00', '03:49:00');
INSERT INTO `ssc_data_time` VALUES ('5728', '5', '229', '03:48:00', '03:48:00');
INSERT INTO `ssc_data_time` VALUES ('5727', '5', '228', '03:47:00', '03:47:00');
INSERT INTO `ssc_data_time` VALUES ('5726', '5', '227', '03:46:00', '03:46:00');
INSERT INTO `ssc_data_time` VALUES ('5725', '5', '226', '03:45:00', '03:45:00');
INSERT INTO `ssc_data_time` VALUES ('5724', '5', '225', '03:44:00', '03:44:00');
INSERT INTO `ssc_data_time` VALUES ('5723', '5', '224', '03:43:00', '03:43:00');
INSERT INTO `ssc_data_time` VALUES ('5722', '5', '223', '03:42:00', '03:42:00');
INSERT INTO `ssc_data_time` VALUES ('5721', '5', '222', '03:41:00', '03:41:00');
INSERT INTO `ssc_data_time` VALUES ('5720', '5', '221', '03:40:00', '03:40:00');
INSERT INTO `ssc_data_time` VALUES ('5719', '5', '220', '03:39:00', '03:39:00');
INSERT INTO `ssc_data_time` VALUES ('5718', '5', '219', '03:38:00', '03:38:00');
INSERT INTO `ssc_data_time` VALUES ('5717', '5', '218', '03:37:00', '03:37:00');
INSERT INTO `ssc_data_time` VALUES ('5716', '5', '217', '03:36:00', '03:36:00');
INSERT INTO `ssc_data_time` VALUES ('5715', '5', '216', '03:35:00', '03:35:00');
INSERT INTO `ssc_data_time` VALUES ('5714', '5', '215', '03:34:00', '03:34:00');
INSERT INTO `ssc_data_time` VALUES ('5713', '5', '214', '03:33:00', '03:33:00');
INSERT INTO `ssc_data_time` VALUES ('5712', '5', '213', '03:32:00', '03:32:00');
INSERT INTO `ssc_data_time` VALUES ('5711', '5', '212', '03:31:00', '03:31:00');
INSERT INTO `ssc_data_time` VALUES ('5710', '5', '211', '03:30:00', '03:30:00');
INSERT INTO `ssc_data_time` VALUES ('5709', '5', '210', '03:29:00', '03:29:00');
INSERT INTO `ssc_data_time` VALUES ('5708', '5', '209', '03:28:00', '03:28:00');
INSERT INTO `ssc_data_time` VALUES ('5707', '5', '208', '03:27:00', '03:27:00');
INSERT INTO `ssc_data_time` VALUES ('5706', '5', '207', '03:26:00', '03:26:00');
INSERT INTO `ssc_data_time` VALUES ('5705', '5', '206', '03:25:00', '03:25:00');
INSERT INTO `ssc_data_time` VALUES ('5704', '5', '205', '03:24:00', '03:24:00');
INSERT INTO `ssc_data_time` VALUES ('5703', '5', '204', '03:23:00', '03:23:00');
INSERT INTO `ssc_data_time` VALUES ('5702', '5', '203', '03:22:00', '03:22:00');
INSERT INTO `ssc_data_time` VALUES ('5701', '5', '202', '03:21:00', '03:21:00');
INSERT INTO `ssc_data_time` VALUES ('5700', '5', '201', '03:20:00', '03:20:00');
INSERT INTO `ssc_data_time` VALUES ('5699', '5', '200', '03:19:00', '03:19:00');
INSERT INTO `ssc_data_time` VALUES ('5698', '5', '199', '03:18:00', '03:18:00');
INSERT INTO `ssc_data_time` VALUES ('5697', '5', '198', '03:17:00', '03:17:00');
INSERT INTO `ssc_data_time` VALUES ('5696', '5', '197', '03:16:00', '03:16:00');
INSERT INTO `ssc_data_time` VALUES ('5695', '5', '196', '03:15:00', '03:15:00');
INSERT INTO `ssc_data_time` VALUES ('5694', '5', '195', '03:14:00', '03:14:00');
INSERT INTO `ssc_data_time` VALUES ('5693', '5', '194', '03:13:00', '03:13:00');
INSERT INTO `ssc_data_time` VALUES ('5692', '5', '193', '03:12:00', '03:12:00');
INSERT INTO `ssc_data_time` VALUES ('5691', '5', '192', '03:11:00', '03:11:00');
INSERT INTO `ssc_data_time` VALUES ('5690', '5', '191', '03:10:00', '03:10:00');
INSERT INTO `ssc_data_time` VALUES ('5689', '5', '190', '03:09:00', '03:09:00');
INSERT INTO `ssc_data_time` VALUES ('5688', '5', '189', '03:08:00', '03:08:00');
INSERT INTO `ssc_data_time` VALUES ('5687', '5', '188', '03:07:00', '03:07:00');
INSERT INTO `ssc_data_time` VALUES ('5686', '5', '187', '03:06:00', '03:06:00');
INSERT INTO `ssc_data_time` VALUES ('5685', '5', '186', '03:05:00', '03:05:00');
INSERT INTO `ssc_data_time` VALUES ('5684', '5', '185', '03:04:00', '03:04:00');
INSERT INTO `ssc_data_time` VALUES ('5683', '5', '184', '03:03:00', '03:03:00');
INSERT INTO `ssc_data_time` VALUES ('5682', '5', '183', '03:02:00', '03:02:00');
INSERT INTO `ssc_data_time` VALUES ('5681', '5', '182', '03:01:00', '03:01:00');
INSERT INTO `ssc_data_time` VALUES ('5680', '5', '181', '03:00:00', '03:00:00');
INSERT INTO `ssc_data_time` VALUES ('5679', '5', '180', '02:59:00', '02:59:00');
INSERT INTO `ssc_data_time` VALUES ('5678', '5', '179', '02:58:00', '02:58:00');
INSERT INTO `ssc_data_time` VALUES ('5677', '5', '178', '02:57:00', '02:57:00');
INSERT INTO `ssc_data_time` VALUES ('5676', '5', '177', '02:56:00', '02:56:00');
INSERT INTO `ssc_data_time` VALUES ('5675', '5', '176', '02:55:00', '02:55:00');
INSERT INTO `ssc_data_time` VALUES ('5674', '5', '175', '02:54:00', '02:54:00');
INSERT INTO `ssc_data_time` VALUES ('5673', '5', '174', '02:53:00', '02:53:00');
INSERT INTO `ssc_data_time` VALUES ('5672', '5', '173', '02:52:00', '02:52:00');
INSERT INTO `ssc_data_time` VALUES ('5671', '5', '172', '02:51:00', '02:51:00');
INSERT INTO `ssc_data_time` VALUES ('5670', '5', '171', '02:50:00', '02:50:00');
INSERT INTO `ssc_data_time` VALUES ('5669', '5', '170', '02:49:00', '02:49:00');
INSERT INTO `ssc_data_time` VALUES ('5668', '5', '169', '02:48:00', '02:48:00');
INSERT INTO `ssc_data_time` VALUES ('5667', '5', '168', '02:47:00', '02:47:00');
INSERT INTO `ssc_data_time` VALUES ('5666', '5', '167', '02:46:00', '02:46:00');
INSERT INTO `ssc_data_time` VALUES ('5665', '5', '166', '02:45:00', '02:45:00');
INSERT INTO `ssc_data_time` VALUES ('5664', '5', '165', '02:44:00', '02:44:00');
INSERT INTO `ssc_data_time` VALUES ('5663', '5', '164', '02:43:00', '02:43:00');
INSERT INTO `ssc_data_time` VALUES ('5662', '5', '163', '02:42:00', '02:42:00');
INSERT INTO `ssc_data_time` VALUES ('5661', '5', '162', '02:41:00', '02:41:00');
INSERT INTO `ssc_data_time` VALUES ('5660', '5', '161', '02:40:00', '02:40:00');
INSERT INTO `ssc_data_time` VALUES ('5659', '5', '160', '02:39:00', '02:39:00');
INSERT INTO `ssc_data_time` VALUES ('5658', '5', '159', '02:38:00', '02:38:00');
INSERT INTO `ssc_data_time` VALUES ('5657', '5', '158', '02:37:00', '02:37:00');
INSERT INTO `ssc_data_time` VALUES ('5656', '5', '157', '02:36:00', '02:36:00');
INSERT INTO `ssc_data_time` VALUES ('5655', '5', '156', '02:35:00', '02:35:00');
INSERT INTO `ssc_data_time` VALUES ('5654', '5', '155', '02:34:00', '02:34:00');
INSERT INTO `ssc_data_time` VALUES ('5653', '5', '154', '02:33:00', '02:33:00');
INSERT INTO `ssc_data_time` VALUES ('5652', '5', '153', '02:32:00', '02:32:00');
INSERT INTO `ssc_data_time` VALUES ('5651', '5', '152', '02:31:00', '02:31:00');
INSERT INTO `ssc_data_time` VALUES ('5650', '5', '151', '02:30:00', '02:30:00');
INSERT INTO `ssc_data_time` VALUES ('5649', '5', '150', '02:29:00', '02:29:00');
INSERT INTO `ssc_data_time` VALUES ('5648', '5', '149', '02:28:00', '02:28:00');
INSERT INTO `ssc_data_time` VALUES ('5647', '5', '148', '02:27:00', '02:27:00');
INSERT INTO `ssc_data_time` VALUES ('5646', '5', '147', '02:26:00', '02:26:00');
INSERT INTO `ssc_data_time` VALUES ('5645', '5', '146', '02:25:00', '02:25:00');
INSERT INTO `ssc_data_time` VALUES ('5644', '5', '145', '02:24:00', '02:24:00');
INSERT INTO `ssc_data_time` VALUES ('5643', '5', '144', '02:23:00', '02:23:00');
INSERT INTO `ssc_data_time` VALUES ('5642', '5', '143', '02:22:00', '02:22:00');
INSERT INTO `ssc_data_time` VALUES ('5641', '5', '142', '02:21:00', '02:21:00');
INSERT INTO `ssc_data_time` VALUES ('5640', '5', '141', '02:20:00', '02:20:00');
INSERT INTO `ssc_data_time` VALUES ('5639', '5', '140', '02:19:00', '02:19:00');
INSERT INTO `ssc_data_time` VALUES ('5638', '5', '139', '02:18:00', '02:18:00');
INSERT INTO `ssc_data_time` VALUES ('5637', '5', '138', '02:17:00', '02:17:00');
INSERT INTO `ssc_data_time` VALUES ('5636', '5', '137', '02:16:00', '02:16:00');
INSERT INTO `ssc_data_time` VALUES ('5635', '5', '136', '02:15:00', '02:15:00');
INSERT INTO `ssc_data_time` VALUES ('5634', '5', '135', '02:14:00', '02:14:00');
INSERT INTO `ssc_data_time` VALUES ('5633', '5', '134', '02:13:00', '02:13:00');
INSERT INTO `ssc_data_time` VALUES ('5632', '5', '133', '02:12:00', '02:12:00');
INSERT INTO `ssc_data_time` VALUES ('5631', '5', '132', '02:11:00', '02:11:00');
INSERT INTO `ssc_data_time` VALUES ('5630', '5', '131', '02:10:00', '02:10:00');
INSERT INTO `ssc_data_time` VALUES ('5629', '5', '130', '02:09:00', '02:09:00');
INSERT INTO `ssc_data_time` VALUES ('5628', '5', '129', '02:08:00', '02:08:00');
INSERT INTO `ssc_data_time` VALUES ('5627', '5', '128', '02:07:00', '02:07:00');
INSERT INTO `ssc_data_time` VALUES ('5626', '5', '127', '02:06:00', '02:06:00');
INSERT INTO `ssc_data_time` VALUES ('5625', '5', '126', '02:05:00', '02:05:00');
INSERT INTO `ssc_data_time` VALUES ('5624', '5', '125', '02:04:00', '02:04:00');
INSERT INTO `ssc_data_time` VALUES ('5623', '5', '124', '02:03:00', '02:03:00');
INSERT INTO `ssc_data_time` VALUES ('5622', '5', '123', '02:02:00', '02:02:00');
INSERT INTO `ssc_data_time` VALUES ('5621', '5', '122', '02:01:00', '02:01:00');
INSERT INTO `ssc_data_time` VALUES ('5620', '5', '121', '02:00:00', '02:00:00');
INSERT INTO `ssc_data_time` VALUES ('5619', '5', '120', '01:59:00', '01:59:00');
INSERT INTO `ssc_data_time` VALUES ('5618', '5', '119', '01:58:00', '01:58:00');
INSERT INTO `ssc_data_time` VALUES ('5617', '5', '118', '01:57:00', '01:57:00');
INSERT INTO `ssc_data_time` VALUES ('5616', '5', '117', '01:56:00', '01:56:00');
INSERT INTO `ssc_data_time` VALUES ('5615', '5', '116', '01:55:00', '01:55:00');
INSERT INTO `ssc_data_time` VALUES ('5614', '5', '115', '01:54:00', '01:54:00');
INSERT INTO `ssc_data_time` VALUES ('5613', '5', '114', '01:53:00', '01:53:00');
INSERT INTO `ssc_data_time` VALUES ('5612', '5', '113', '01:52:00', '01:52:00');
INSERT INTO `ssc_data_time` VALUES ('5611', '5', '112', '01:51:00', '01:51:00');
INSERT INTO `ssc_data_time` VALUES ('5610', '5', '111', '01:50:00', '01:50:00');
INSERT INTO `ssc_data_time` VALUES ('5609', '5', '110', '01:49:00', '01:49:00');
INSERT INTO `ssc_data_time` VALUES ('5608', '5', '109', '01:48:00', '01:48:00');
INSERT INTO `ssc_data_time` VALUES ('5607', '5', '108', '01:47:00', '01:47:00');
INSERT INTO `ssc_data_time` VALUES ('5606', '5', '107', '01:46:00', '01:46:00');
INSERT INTO `ssc_data_time` VALUES ('5605', '5', '106', '01:45:00', '01:45:00');
INSERT INTO `ssc_data_time` VALUES ('5604', '5', '105', '01:44:00', '01:44:00');
INSERT INTO `ssc_data_time` VALUES ('5603', '5', '104', '01:43:00', '01:43:00');
INSERT INTO `ssc_data_time` VALUES ('5602', '5', '103', '01:42:00', '01:42:00');
INSERT INTO `ssc_data_time` VALUES ('5601', '5', '102', '01:41:00', '01:41:00');
INSERT INTO `ssc_data_time` VALUES ('5600', '5', '101', '01:40:00', '01:40:00');
INSERT INTO `ssc_data_time` VALUES ('5599', '5', '100', '01:39:00', '01:39:00');
INSERT INTO `ssc_data_time` VALUES ('5598', '5', '99', '01:38:00', '01:38:00');
INSERT INTO `ssc_data_time` VALUES ('5597', '5', '98', '01:37:00', '01:37:00');
INSERT INTO `ssc_data_time` VALUES ('5596', '5', '97', '01:36:00', '01:36:00');
INSERT INTO `ssc_data_time` VALUES ('5595', '5', '96', '01:35:00', '01:35:00');
INSERT INTO `ssc_data_time` VALUES ('5594', '5', '95', '01:34:00', '01:34:00');
INSERT INTO `ssc_data_time` VALUES ('5593', '5', '94', '01:33:00', '01:33:00');
INSERT INTO `ssc_data_time` VALUES ('5592', '5', '93', '01:32:00', '01:32:00');
INSERT INTO `ssc_data_time` VALUES ('5591', '5', '92', '01:31:00', '01:31:00');
INSERT INTO `ssc_data_time` VALUES ('5590', '5', '91', '01:30:00', '01:30:00');
INSERT INTO `ssc_data_time` VALUES ('5589', '5', '90', '01:29:00', '01:29:00');
INSERT INTO `ssc_data_time` VALUES ('5588', '5', '89', '01:28:00', '01:28:00');
INSERT INTO `ssc_data_time` VALUES ('5587', '5', '88', '01:27:00', '01:27:00');
INSERT INTO `ssc_data_time` VALUES ('5586', '5', '87', '01:26:00', '01:26:00');
INSERT INTO `ssc_data_time` VALUES ('5585', '5', '86', '01:25:00', '01:25:00');
INSERT INTO `ssc_data_time` VALUES ('5584', '5', '85', '01:24:00', '01:24:00');
INSERT INTO `ssc_data_time` VALUES ('5583', '5', '84', '01:23:00', '01:23:00');
INSERT INTO `ssc_data_time` VALUES ('5582', '5', '83', '01:22:00', '01:22:00');
INSERT INTO `ssc_data_time` VALUES ('5581', '5', '82', '01:21:00', '01:21:00');
INSERT INTO `ssc_data_time` VALUES ('5580', '5', '81', '01:20:00', '01:20:00');
INSERT INTO `ssc_data_time` VALUES ('5579', '5', '80', '01:19:00', '01:19:00');
INSERT INTO `ssc_data_time` VALUES ('5578', '5', '79', '01:18:00', '01:18:00');
INSERT INTO `ssc_data_time` VALUES ('5577', '5', '78', '01:17:00', '01:17:00');
INSERT INTO `ssc_data_time` VALUES ('5576', '5', '77', '01:16:00', '01:16:00');
INSERT INTO `ssc_data_time` VALUES ('5575', '5', '76', '01:15:00', '01:15:00');
INSERT INTO `ssc_data_time` VALUES ('5574', '5', '75', '01:14:00', '01:14:00');
INSERT INTO `ssc_data_time` VALUES ('5573', '5', '74', '01:13:00', '01:13:00');
INSERT INTO `ssc_data_time` VALUES ('5572', '5', '73', '01:12:00', '01:12:00');
INSERT INTO `ssc_data_time` VALUES ('5571', '5', '72', '01:11:00', '01:11:00');
INSERT INTO `ssc_data_time` VALUES ('5570', '5', '71', '01:10:00', '01:10:00');
INSERT INTO `ssc_data_time` VALUES ('5569', '5', '70', '01:09:00', '01:09:00');
INSERT INTO `ssc_data_time` VALUES ('5568', '5', '69', '01:08:00', '01:08:00');
INSERT INTO `ssc_data_time` VALUES ('5567', '5', '68', '01:07:00', '01:07:00');
INSERT INTO `ssc_data_time` VALUES ('5566', '5', '67', '01:06:00', '01:06:00');
INSERT INTO `ssc_data_time` VALUES ('5565', '5', '66', '01:05:00', '01:05:00');
INSERT INTO `ssc_data_time` VALUES ('5564', '5', '65', '01:04:00', '01:04:00');
INSERT INTO `ssc_data_time` VALUES ('5563', '5', '64', '01:03:00', '01:03:00');
INSERT INTO `ssc_data_time` VALUES ('5562', '5', '63', '01:02:00', '01:02:00');
INSERT INTO `ssc_data_time` VALUES ('5561', '5', '62', '01:01:00', '01:01:00');
INSERT INTO `ssc_data_time` VALUES ('5560', '5', '61', '01:00:00', '01:00:00');
INSERT INTO `ssc_data_time` VALUES ('5559', '5', '60', '00:59:00', '00:59:00');
INSERT INTO `ssc_data_time` VALUES ('5558', '5', '59', '00:58:00', '00:58:00');
INSERT INTO `ssc_data_time` VALUES ('5557', '5', '58', '00:57:00', '00:57:00');
INSERT INTO `ssc_data_time` VALUES ('5556', '5', '57', '00:56:00', '00:56:00');
INSERT INTO `ssc_data_time` VALUES ('5555', '5', '56', '00:55:00', '00:55:00');
INSERT INTO `ssc_data_time` VALUES ('5554', '5', '55', '00:54:00', '00:54:00');
INSERT INTO `ssc_data_time` VALUES ('5553', '5', '54', '00:53:00', '00:53:00');
INSERT INTO `ssc_data_time` VALUES ('5552', '5', '53', '00:52:00', '00:52:00');
INSERT INTO `ssc_data_time` VALUES ('5551', '5', '52', '00:51:00', '00:51:00');
INSERT INTO `ssc_data_time` VALUES ('5550', '5', '51', '00:50:00', '00:50:00');
INSERT INTO `ssc_data_time` VALUES ('5549', '5', '50', '00:49:00', '00:49:00');
INSERT INTO `ssc_data_time` VALUES ('5548', '5', '49', '00:48:00', '00:48:00');
INSERT INTO `ssc_data_time` VALUES ('5547', '5', '48', '00:47:00', '00:47:00');
INSERT INTO `ssc_data_time` VALUES ('5546', '5', '47', '00:46:00', '00:46:00');
INSERT INTO `ssc_data_time` VALUES ('5545', '5', '46', '00:45:00', '00:45:00');
INSERT INTO `ssc_data_time` VALUES ('5544', '5', '45', '00:44:00', '00:44:00');
INSERT INTO `ssc_data_time` VALUES ('5543', '5', '44', '00:43:00', '00:43:00');
INSERT INTO `ssc_data_time` VALUES ('5542', '5', '43', '00:42:00', '00:42:00');
INSERT INTO `ssc_data_time` VALUES ('5541', '5', '42', '00:41:00', '00:41:00');
INSERT INTO `ssc_data_time` VALUES ('5540', '5', '41', '00:40:00', '00:40:00');
INSERT INTO `ssc_data_time` VALUES ('5539', '5', '40', '00:39:00', '00:39:00');
INSERT INTO `ssc_data_time` VALUES ('5538', '5', '39', '00:38:00', '00:38:00');
INSERT INTO `ssc_data_time` VALUES ('5537', '5', '38', '00:37:00', '00:37:00');
INSERT INTO `ssc_data_time` VALUES ('5536', '5', '37', '00:36:00', '00:36:00');
INSERT INTO `ssc_data_time` VALUES ('5535', '5', '36', '00:35:00', '00:35:00');
INSERT INTO `ssc_data_time` VALUES ('5534', '5', '35', '00:34:00', '00:34:00');
INSERT INTO `ssc_data_time` VALUES ('5533', '5', '34', '00:33:00', '00:33:00');
INSERT INTO `ssc_data_time` VALUES ('5532', '5', '33', '00:32:00', '00:32:00');
INSERT INTO `ssc_data_time` VALUES ('5531', '5', '32', '00:31:00', '00:31:00');
INSERT INTO `ssc_data_time` VALUES ('5530', '5', '31', '00:30:00', '00:30:00');
INSERT INTO `ssc_data_time` VALUES ('5529', '5', '30', '00:29:00', '00:29:00');
INSERT INTO `ssc_data_time` VALUES ('5528', '5', '29', '00:28:00', '00:28:00');
INSERT INTO `ssc_data_time` VALUES ('5527', '5', '28', '00:27:00', '00:27:00');
INSERT INTO `ssc_data_time` VALUES ('5526', '5', '27', '00:26:00', '00:26:00');
INSERT INTO `ssc_data_time` VALUES ('5525', '5', '26', '00:25:00', '00:25:00');
INSERT INTO `ssc_data_time` VALUES ('5524', '5', '25', '00:24:00', '00:24:00');
INSERT INTO `ssc_data_time` VALUES ('5523', '5', '24', '00:23:00', '00:23:00');
INSERT INTO `ssc_data_time` VALUES ('5522', '5', '23', '00:22:00', '00:22:00');
INSERT INTO `ssc_data_time` VALUES ('5521', '5', '22', '00:21:00', '00:21:00');
INSERT INTO `ssc_data_time` VALUES ('5520', '5', '21', '00:20:00', '00:20:00');
INSERT INTO `ssc_data_time` VALUES ('5519', '5', '20', '00:19:00', '00:19:00');
INSERT INTO `ssc_data_time` VALUES ('5518', '5', '19', '00:18:00', '00:18:00');
INSERT INTO `ssc_data_time` VALUES ('5517', '5', '18', '00:17:00', '00:17:00');
INSERT INTO `ssc_data_time` VALUES ('5516', '5', '17', '00:16:00', '00:16:00');
INSERT INTO `ssc_data_time` VALUES ('5515', '5', '16', '00:15:00', '00:15:00');
INSERT INTO `ssc_data_time` VALUES ('5514', '5', '15', '00:14:00', '00:14:00');
INSERT INTO `ssc_data_time` VALUES ('5513', '5', '14', '00:13:00', '00:13:00');
INSERT INTO `ssc_data_time` VALUES ('5512', '5', '13', '00:12:00', '00:12:00');
INSERT INTO `ssc_data_time` VALUES ('5511', '5', '12', '00:11:00', '00:11:00');
INSERT INTO `ssc_data_time` VALUES ('5510', '5', '11', '00:10:00', '00:10:00');
INSERT INTO `ssc_data_time` VALUES ('5509', '5', '10', '00:09:00', '00:09:00');
INSERT INTO `ssc_data_time` VALUES ('5508', '5', '9', '00:08:00', '00:08:00');
INSERT INTO `ssc_data_time` VALUES ('5507', '5', '8', '00:07:00', '00:07:00');
INSERT INTO `ssc_data_time` VALUES ('5506', '5', '7', '00:06:00', '00:06:00');
INSERT INTO `ssc_data_time` VALUES ('5505', '5', '6', '00:05:00', '00:05:00');
INSERT INTO `ssc_data_time` VALUES ('5504', '5', '5', '00:04:00', '00:04:00');
INSERT INTO `ssc_data_time` VALUES ('5503', '5', '4', '00:03:00', '00:03:00');
INSERT INTO `ssc_data_time` VALUES ('5502', '5', '3', '00:02:00', '00:02:00');
INSERT INTO `ssc_data_time` VALUES ('5501', '5', '2', '00:01:00', '00:01:00');
INSERT INTO `ssc_data_time` VALUES ('5500', '5', '1', '00:00:00', '00:00:00');

-- ----------------------------
-- Table structure for `ssc_deposit_log`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_deposit_log`;
CREATE TABLE `ssc_deposit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `actionTime` int(11) NOT NULL,
  `depositCoin` float(10,2) NOT NULL,
  `info` varchar(150) DEFAULT NULL,
  `CoinTime` float(8,2) DEFAULT NULL,
  `lltype` varchar(10) DEFAULT NULL,
  `userDepositCoin` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_deposit_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_forgetpassword`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_forgetpassword`;
CREATE TABLE `ssc_forgetpassword` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `qq` varchar(50) NOT NULL,
  `content` varchar(3000) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mId` tinyint(3) DEFAULT NULL,
  `mTime` int(11) DEFAULT NULL,
  `flag` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已处理',
  `actionTime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_forgetpassword
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_letter`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_letter`;
CREATE TABLE `ssc_letter` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `sId` int(10) NOT NULL COMMENT 'Send发送人UID',
  `aId` int(10) NOT NULL COMMENT 'Accept 接收人ID',
  `title` varchar(500) DEFAULT NULL,
  `content` text NOT NULL COMMENT '内容',
  `actionTime` int(11) NOT NULL,
  `IsRead` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否已读0未读1已读',
  `flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_letter
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_links`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_links`;
CREATE TABLE `ssc_links` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(6) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `uid` int(11) NOT NULL DEFAULT '-1' COMMENT '上级UID  -1为没有上级',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '上级用户',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否代理：0会员，1代理',
  `count` smallint(5) NOT NULL DEFAULT '0' COMMENT '注册人数',
  `regIP` int(11) NOT NULL,
  `regTime` int(11) NOT NULL,
  `updateTime` int(11) NOT NULL DEFAULT '0',
  `fanDian` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '用户设置的返点数',
  `fanDianBdw` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '不定位返点',
  `coin` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '账号余额',
  `iv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否虚拟号',
  `kf` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许找客服',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lid`),
  UNIQUE KEY `codec` (`code`) USING HASH,
  KEY `parentId` (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_links
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_manager`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_manager`;
CREATE TABLE `ssc_manager` (
  `uid` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL,
  `password` char(32) NOT NULL,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `regTime` int(11) NOT NULL COMMENT '加入时间',
  `regIP` int(11) NOT NULL COMMENT '加入IP',
  `lastLoginTime` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `lastLoginIP` int(11) DEFAULT NULL COMMENT '最后登录IP',
  `parentId` int(4) DEFAULT NULL COMMENT '上级UID',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_manager
-- ----------------------------
INSERT INTO `ssc_manager` VALUES ('1', 'admin', 'eeafb716f93fa090d7716749a6eefa72', '1', '0', '1', '1', '1490123167', '-636877562', null);

-- ----------------------------
-- Table structure for `ssc_members`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_members`;
CREATE TABLE `ssc_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `parentId` int(11) DEFAULT NULL COMMENT '会员从属关系',
  `parents` varchar(64) NOT NULL COMMENT '上级系列',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(16) NOT NULL,
  `password` char(50) NOT NULL,
  `coinPassword` char(50) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否代理：0会员，1代理',
  `nickname` varchar(16) CHARACTER SET utf8 NOT NULL,
  `name` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '用户真实姓名',
  `regIP` int(11) NOT NULL,
  `regTime` int(11) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `grade` tinyint(4) NOT NULL DEFAULT '1' COMMENT '等级',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `scoreTotal` int(11) NOT NULL DEFAULT '0' COMMENT '累计积分',
  `coin` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '个人财产',
  `fcoin` float(12,4) NOT NULL DEFAULT '0.0000' COMMENT '冻结资产',
  `fanDian` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '用户设置的返点数',
  `fanDianBdw` float(3,1) NOT NULL DEFAULT '0.0' COMMENT '不定位返点',
  `sb` tinyint(1) NOT NULL,
  `care` varchar(16) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '问候语',
  `qq` varchar(16) CHARACTER SET utf8 NOT NULL,
  `iv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否虚拟号,默认否',
  `kf` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否允许找客服(默认允许)',
  `src` varchar(64) CHARACTER SET gbk NOT NULL DEFAULT '' COMMENT '账号来源',
  `allRecharge` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计总充值',
  `allCash` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计提款',
  `allBet` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '总累计消费额',
  `allZj` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '总累计中奖',
  `allFanDian` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '总累计返点',
  `allComm` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '总累计佣金',
  `allRed` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '总累计分红',
  `allGift` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计总赠送',
  `curBet` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '消费赠送中，当前消费额',
  `red` smallint(2) NOT NULL DEFAULT '0' COMMENT '分红比例0-99,0为无分红',
  `lastRedeed` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次分红时间',
  `depositStatus` tinyint(3) NOT NULL DEFAULT '0',
  `deposit` float(12,2) NOT NULL DEFAULT '0.00',
  `conCommStatus` tinyint(1) NOT NULL DEFAULT '0',
  `lossCommStatus` tinyint(1) NOT NULL DEFAULT '0',
  `mLetterStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '站内信开关',
  `errorpwdTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后密码错误记录时间',
  `errorpwdnum` tinyint(1) NOT NULL DEFAULT '0' COMMENT '密码错误次数',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE,
  KEY `parentId` (`parentId`) USING BTREE,
  KEY `parents` (`parents`) USING BTREE,
  KEY `nickname` (`nickname`) USING BTREE,
  KEY `coin` (`coin`) USING BTREE,
  KEY `fanDian` (`fanDian`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=319 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_members
-- ----------------------------
INSERT INTO `ssc_members` VALUES ('311', '0', '1', null, '311', '0', 'test01', 'e10adc3949ba59abbe56e057f20f883e', '2051454faef6a64f966b57648894cfd5', '1', 'test01', 'test01', '1781005949', '1434425804', '2015-10-19 11:49:13', '1', '754', '754', '999900.6600', '0.0000', '13.0', '6.0', '0', '', '123456', '0', '1', '后台添加', '0.00', '0.00', '753.8000', '0.0000', '0.0000', '0.00', '0.00', '0.00', '753.8000', '10', '0', '0', '0.00', '0', '0', '1', '1445226553', '2');
INSERT INTO `ssc_members` VALUES ('312', '0', '1', null, '312', '0', 'test02', 'd48eacadfaf5a33025c63cee4e331843', '', '1', 'test02', 'test02', '1781005949', '1434425811', '2015-06-16 12:37:58', '1', '16', '16', '1000872.0000', '0.0000', '13.0', '6.0', '0', '', '123456', '0', '1', '后台添加', '0.00', '0.00', '16.0000', '0.0000', '0.0000', '0.00', '0.00', '0.00', '16.0000', '10', '0', '0', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `ssc_members` VALUES ('313', '0', '1', null, '313', '0', 'test03', 'b5ac4735bde2165d6fc8a3f2ed7b39f0', '', '1', 'test03', 'test03', '1781005949', '1434425822', '2015-06-16 12:29:05', '1', '0', '0', '1000000.0000', '0.0000', '13.0', '6.0', '0', '', '123456', '0', '1', '后台添加', '0.00', '0.00', '0.0000', '0.0000', '0.0000', '0.00', '0.00', '0.00', '0.0000', '10', '0', '0', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `ssc_members` VALUES ('314', '0', '1', null, '314', '0', 'test04', '8561ea019960f85214eaeb2b66d75384', '', '1', 'test04', 'test04', '1781005949', '1434425828', '2015-06-16 12:29:10', '1', '0', '0', '1000000.0000', '0.0000', '13.0', '6.0', '0', '', '123456', '0', '1', '后台添加', '0.00', '0.00', '0.0000', '0.0000', '0.0000', '0.00', '0.00', '0.00', '0.0000', '10', '0', '0', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `ssc_members` VALUES ('315', '0', '1', null, '315', '0', 'test05', '746a1d157aa4f97702f01a3e264e24cb', '', '1', 'test05', 'test05', '1781005949', '1434425835', '2015-06-16 12:29:15', '1', '0', '0', '1000000.0000', '0.0000', '13.0', '6.0', '0', '', '123456', '0', '1', '后台添加', '0.00', '0.00', '0.0000', '0.0000', '0.0000', '0.00', '0.00', '0.00', '0.0000', '10', '0', '0', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `ssc_members` VALUES ('316', '0', '1', null, '316', '0', 'ceshi', '7bac321d93039df38c50ccf7771142ff', '4fa6193882bccfa843cb11de6c62bb7a', '1', 'ceshi', 'ceshi', '2130706433', '1438434726', '2015-10-19 11:50:23', '1', '0', '0', '999980.0000', '0.0000', '12.5', '5.0', '0', '', '34656', '0', '1', '后台添加', '0.00', '0.00', '0.0000', '0.0000', '0.0000', '0.00', '0.00', '0.00', '0.0000', '0', '0', '0', '0.00', '0', '0', '1', '1445225808', '3');
INSERT INTO `ssc_members` VALUES ('317', '0', '1', null, '317', '0', 'test2015', '840fed071b98ccd1f391b746fb986a34', '', '1', 'test2015', 'test2015', '2130706437', '1445226672', '2015-10-19 11:51:13', '1', '0', '0', '0.0000', '0.0000', '12.0', '5.0', '0', '', '123456789', '0', '1', '后台添加', '0.00', '0.00', '0.0000', '0.0000', '0.0000', '0.00', '0.00', '0.00', '0.0000', '0', '0', '0', '0.00', '0', '0', '1', '0', '0');
INSERT INTO `ssc_members` VALUES ('318', '0', '1', null, '318', '0', 'test2017', '2ecbf4f530d01893a6f2b1d36041ec6e', '', '0', 'test2017', 'test2017', '2130706433', '1490121198', '2017-03-22 02:42:08', '1', '0', '0', '100.0000', '0.0000', '7.0', '1.0', '0', '', '123456', '0', '1', '后台添加', '0.00', '0.00', '0.0000', '0.0000', '0.0000', '0.00', '0.00', '0.00', '0.0000', '0', '0', '0', '0.00', '0', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for `ssc_member_bank`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_bank`;
CREATE TABLE `ssc_member_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '非普通用户信息',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `bankId` int(11) NOT NULL,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL,
  `account` varchar(32) NOT NULL,
  `editEnable` tinyint(1) NOT NULL DEFAULT '0',
  `countname` varchar(64) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE,
  KEY `bankId` (`bankId`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `editEnable` (`editEnable`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=368 DEFAULT CHARSET=latin1 COMMENT='用户银行帐户信息';

-- ----------------------------
-- Records of ssc_member_bank
-- ----------------------------
INSERT INTO `ssc_member_bank` VALUES ('367', '311', '0', '1', '3', '测试', '123456', '0', '');
INSERT INTO `ssc_member_bank` VALUES ('365', '285', '0', '1', '3', '打点滴', '12313123', '0', '');

-- ----------------------------
-- Table structure for `ssc_member_bet`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_bet`;
CREATE TABLE `ssc_member_bet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `username` varchar(16) NOT NULL,
  `date` int(8) NOT NULL,
  `bet` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '今日消费额',
  `commisioned` tinyint(1) NOT NULL DEFAULT '0' COMMENT '佣金派发',
  `rechargeCommisioned` tinyint(1) NOT NULL DEFAULT '0' COMMENT '充值佣金是否派发',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_member_bet
-- ----------------------------
INSERT INTO `ssc_member_bet` VALUES ('1', '311', 'test01', '20150616', '753.8000', '0', '0');
INSERT INTO `ssc_member_bet` VALUES ('2', '312', 'test02', '20150616', '16.0000', '0', '0');

-- ----------------------------
-- Table structure for `ssc_member_cash`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_cash`;
CREATE TABLE `ssc_member_cash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `actionTime` int(11) NOT NULL COMMENT '申请时间',
  `amount` float(10,2) NOT NULL COMMENT '提现金额',
  `bankId` int(11) NOT NULL COMMENT '银行ID',
  `account` varchar(32) NOT NULL COMMENT '银行帐号',
  `username` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '银行开户名',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '提现状态：1用户申请，2已取消，3已支付，4提现失败，0确认到帐, 5后台删除',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `info` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注字段',
  `flag` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `actionTime` (`actionTime`) USING BTREE,
  KEY `amount` (`amount`) USING BTREE,
  KEY `bankId` (`bankId`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `username` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=latin1 COMMENT='用户提现表';

-- ----------------------------
-- Records of ssc_member_cash
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_member_daily_count`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_daily_count`;
CREATE TABLE `ssc_member_daily_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `date` int(8) NOT NULL DEFAULT '0' COMMENT '8位数字日期',
  `recharge` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '今日充值总额',
  `rechargeSuccessed` int(5) NOT NULL DEFAULT '0' COMMENT '今日成功充值笔数',
  `cash` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '今日提现总额',
  `cashSuccessed` int(5) NOT NULL DEFAULT '0' COMMENT '今日成功提现笔数',
  `bet` double(18,4) NOT NULL DEFAULT '0.0000' COMMENT '今日有效投注额',
  `betCount` int(5) NOT NULL DEFAULT '0' COMMENT '今日有效订单数',
  `zj` double(18,4) NOT NULL DEFAULT '0.0000' COMMENT '今日有效中奖额',
  `zjCount` int(5) NOT NULL DEFAULT '0' COMMENT '今日有效中奖订单数',
  `gift` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '今日赠送总额',
  `giftCount` int(5) NOT NULL DEFAULT '0' COMMENT '今日赠送总次数',
  `commission` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '今日佣金总额',
  `commissionCount` int(5) NOT NULL,
  `fanDian` double(18,4) NOT NULL DEFAULT '0.0000' COMMENT '今日总返点',
  `frofit` double(18,4) NOT NULL DEFAULT '0.0000' COMMENT '今日总盈利',
  `teamBet` double(18,4) NOT NULL DEFAULT '0.0000' COMMENT '今日团队消费',
  `teamZj` double(18,4) NOT NULL DEFAULT '0.0000' COMMENT '今日团队中奖',
  `teamProfit` double(18,4) NOT NULL DEFAULT '0.0000' COMMENT '今日团队盈亏',
  `teamGift` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '今日团队赠送金额',
  `teamGiftCount` int(8) NOT NULL DEFAULT '0' COMMENT '今日团队总赠送笔数',
  `teamGiftUser` int(5) NOT NULL DEFAULT '0' COMMENT '今日团队总赠送人数',
  `teamCommission` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '团队获得的佣金总额',
  `teamCommissionCount` int(5) NOT NULL DEFAULT '0' COMMENT '团队获得佣金总笔数',
  `teamCommissionUser` int(5) NOT NULL DEFAULT '0' COMMENT '团队获得佣金总人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_member_daily_count
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_member_level`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_level`;
CREATE TABLE `ssc_member_level` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `level` tinyint(3) unsigned NOT NULL,
  `levelName` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `minScore` int(10) unsigned NOT NULL,
  `maxToCashCount` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1 COMMENT='用户等级设置';

-- ----------------------------
-- Records of ssc_member_level
-- ----------------------------
INSERT INTO `ssc_member_level` VALUES ('1', '1', 'level 1', '0', '3');
INSERT INTO `ssc_member_level` VALUES ('2', '2', 'level 2', '3000', '3');
INSERT INTO `ssc_member_level` VALUES ('3', '3', 'level 3', '10000', '3');
INSERT INTO `ssc_member_level` VALUES ('4', '4', 'level 4', '50000', '3');
INSERT INTO `ssc_member_level` VALUES ('5', '5', 'level 5', '150000', '3');
INSERT INTO `ssc_member_level` VALUES ('6', '6', 'level 6', '350000', '3');
INSERT INTO `ssc_member_level` VALUES ('7', '7', 'level 7', '1000000', '3');
INSERT INTO `ssc_member_level` VALUES ('8', '8', 'level 8', '2000000', '6');
INSERT INTO `ssc_member_level` VALUES ('9', '9', 'level 9', '5000000', '10');
INSERT INTO `ssc_member_level` VALUES ('10', '10', 'level 10', '10000000', '10');
INSERT INTO `ssc_member_level` VALUES ('11', '11', 'level 11', '15000000', '15');
INSERT INTO `ssc_member_level` VALUES ('12', '12', 'level 12', '20000000', '15');
INSERT INTO `ssc_member_level` VALUES ('13', '13', 'level 13', '25000000', '15');
INSERT INTO `ssc_member_level` VALUES ('14', '14', 'level 14', '30000000', '20');
INSERT INTO `ssc_member_level` VALUES ('15', '15', 'level 15', '35000000', '20');
INSERT INTO `ssc_member_level` VALUES ('16', '16', 'level 16', '40000000', '20');
INSERT INTO `ssc_member_level` VALUES ('17', '17', 'level 17', '45000000', '30');
INSERT INTO `ssc_member_level` VALUES ('18', '18', 'level 18', '50000000', '30');
INSERT INTO `ssc_member_level` VALUES ('19', '19', 'level 19', '55000000', '30');
INSERT INTO `ssc_member_level` VALUES ('20', '20', 'level 20', '60000000', '40');

-- ----------------------------
-- Table structure for `ssc_member_log`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_log`;
CREATE TABLE `ssc_member_log` (
  `id` tinyint(9) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `logtype` int(4) NOT NULL,
  `logname` varchar(300) NOT NULL,
  `actionTime` int(11) DEFAULT NULL,
  `actionIP` int(11) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_member_log
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_member_recharge`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_recharge`;
CREATE TABLE `ssc_member_recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `rechargeId` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `amount` float(10,2) NOT NULL COMMENT '充值资金',
  `rechargeAmount` float(10,2) NOT NULL DEFAULT '0.00',
  `coin` float(10,2) NOT NULL COMMENT '充值前用户资金',
  `fcoin` float(10,2) NOT NULL COMMENT '充值前用户冻结资金',
  `actionUid` int(11) NOT NULL COMMENT '操作用户ID',
  `mBankId` smallint(4) NOT NULL,
  `actionIP` int(11) NOT NULL,
  `actionTime` int(11) NOT NULL,
  `rechargeTime` int(11) NOT NULL DEFAULT '0' COMMENT '到帐时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '充值订单状态：0申请，1成功到账',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `info` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `flag` int(2) NOT NULL DEFAULT '0',
  `type` int(1) NOT NULL COMMENT '类型 1转账 2在线 3后台',
  `gift` float(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rechargeId` (`rechargeId`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `amount` (`amount`) USING BTREE,
  KEY `rechargeAmount` (`rechargeAmount`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=404 DEFAULT CHARSET=latin1 COMMENT='充值表';

-- ----------------------------
-- Records of ssc_member_recharge
-- ----------------------------
INSERT INTO `ssc_member_recharge` VALUES ('391', '311', '127854', 'test01', '1000000.00', '0.00', '0.00', '0.00', '1', '0', '1781005949', '1434425846', '1434425846', '9', '0', '管理员\"admin\"充值', '1', '3', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('392', '312', '808619', 'test02', '1000000.00', '0.00', '0.00', '0.00', '1', '0', '1781005949', '1434425854', '1434425854', '9', '0', '管理员\"admin\"充值', '1', '3', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('393', '313', '267737', 'test03', '1000000.00', '0.00', '0.00', '0.00', '1', '0', '1781005949', '1434425862', '1434425862', '9', '0', '管理员\"admin\"充值', '0', '3', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('394', '314', '639105', 'test04', '1000000.00', '0.00', '0.00', '0.00', '1', '0', '1781005949', '1434425869', '1434425869', '9', '0', '管理员\"admin\"充值', '0', '3', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('395', '315', '633931', 'test05', '1000000.00', '0.00', '0.00', '0.00', '1', '0', '1781005949', '1434425876', '1434425876', '9', '0', '管理员\"admin\"充值', '0', '3', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('396', '312', '273753', 'test02', '888.00', '888.00', '1000000.00', '0.00', '1', '285', '2100179680', '1434428340', '1434428590', '1', '0', '手动确认', '1', '1', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('397', '312', '955558', 'test02', '150.00', '0.00', '1000888.00', '0.00', '312', '287', '-1265827105', '1434428789', '0', '0', '1', '用户充值', '0', '1', '498.00');
INSERT INTO `ssc_member_recharge` VALUES ('398', '311', '207231', 'test01', '150.00', '0.00', '999971.50', '0.00', '311', '287', '2100179680', '1434431874', '0', '0', '1', '用户充值', '0', '1', '498.00');
INSERT INTO `ssc_member_recharge` VALUES ('399', '311', '764057', 'test01', '100.00', '0.00', '999971.50', '0.00', '311', '289', '2100179680', '1434432233', '0', '0', '1', '用户充值', '0', '1', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('400', '311', '848104', 'test01', '100.00', '0.00', '999971.50', '0.00', '311', '288', '2100179680', '1434432260', '0', '0', '1', '用户充值', '0', '1', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('401', '311', '601523', 'test01', '100.00', '0.00', '999971.50', '0.00', '311', '290', '2100179680', '1434432284', '0', '0', '1', '用户充值', '0', '1', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('402', '316', '458596', 'ceshi', '1000000.00', '0.00', '0.00', '0.00', '1', '0', '2130706433', '1438434777', '1438434777', '9', '0', '管理员\"admin\"充值', '1', '3', '0.00');
INSERT INTO `ssc_member_recharge` VALUES ('403', '318', '670021', 'test2017', '100.00', '100.00', '0.00', '0.00', '1', '288', '2130706433', '1490121663', '1490121728', '1', '0', '手动确认', '0', '1', '0.00');

-- ----------------------------
-- Table structure for `ssc_member_red`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_red`;
CREATE TABLE `ssc_member_red` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `startTime` int(11) NOT NULL COMMENT '分红统计开始时间',
  `stopTime` int(11) NOT NULL COMMENT '分红统计截止时间',
  `username` varchar(16) NOT NULL COMMENT '用户名',
  `redAmount` float(10,2) NOT NULL COMMENT '分红金额',
  `red` smallint(2) NOT NULL DEFAULT '0' COMMENT '分红执行比例',
  `from` tinyint(1) NOT NULL DEFAULT '0' COMMENT '来自前台还厚后台，0是前台，1是后台',
  `kuisun` float(10,4) NOT NULL DEFAULT '0.0000' COMMENT '本期亏损金额',
  `puid` int(10) NOT NULL DEFAULT '-1' COMMENT '派发人UID',
  `pusername` varchar(16) NOT NULL COMMENT '派发人用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_member_red
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_member_session`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_member_session`;
CREATE TABLE `ssc_member_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `session_key` varchar(40) DEFAULT NULL,
  `loginTime` int(11) NOT NULL,
  `accessTime` int(11) NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `isOnLine` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否在线，判断是否在线除判断这个值外，还应该判断最后访问时间',
  `loginIP` int(11) NOT NULL,
  `browser` varchar(32) NOT NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(32) NOT NULL DEFAULT '' COMMENT '操作系统类型',
  `isMobileDevices` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否移动设备',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `session_key` (`session_key`) USING BTREE,
  KEY `loginTime` (`loginTime`) USING BTREE,
  KEY `accessTime` (`accessTime`) USING BTREE,
  KEY `isOnLine` (`isOnLine`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1487 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_member_session
-- ----------------------------
INSERT INTO `ssc_member_session` VALUES ('1451', '1', 'admin', 'd794efa213b36577511fd531a980ec55', '1431807149', '1431808004', '1', '0', 'Firefox/40.0', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1467', '311', 'test01', '5dndp3tqtrhirk0pcdqriqqt32', '1434433039', '1434433291', '0', '2100179680', 'Chrome/38.0.2125.122', 'Windows NT 6.3', '0');
INSERT INTO `ssc_member_session` VALUES ('1466', '313', 'test03', '5dl5oi7ha9mu785qig9up6shq4', '1434432596', '1434432609', '1', '2100179680', 'MSIE 7.0', 'Windows NT 6.2', '0');
INSERT INTO `ssc_member_session` VALUES ('1465', '312', 'test02', 'q26phlh8l68v8f1n2dpio9vlj5', '1434428280', '1434429730', '0', '-1265827105', 'Chrome/35.0.1916.153', 'Windows NT 5.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1464', '312', 'test02', '8217q0gfq7ive1u3htqs5lts92', '1434428087', '1434428150', '0', '-1265827105', 'unkown', '', '0');
INSERT INTO `ssc_member_session` VALUES ('1463', '311', 'test01', '5dndp3tqtrhirk0pcdqriqqt32', '1434425897', '1434432987', '0', '1781005949', 'Chrome/38.0.2125.122', 'Windows NT 6.3', '0');
INSERT INTO `ssc_member_session` VALUES ('1462', '1', 'admin', 'd794efa213b36577511fd531a980ec55', '1434424499', '1434433282', '1', '976947076', 'Chrome/38.0.2125.122', 'Windows NT 6.3', '0');
INSERT INTO `ssc_member_session` VALUES ('1468', '311', 'test01', 'vkklmslknrac35ellied7ufe90', '1437122337', '1437122444', '0', '2130706433', 'Chrome/35.0.1916.153', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1469', '312', 'test02', 'e0av19jgsal4574o8spv7qgvr4', '1437122391', '1437122441', '1', '2130706433', 'Chrome/39.0.2171.99', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1470', '311', 'test01', 'v59jfuk1r31ju5emkbac8f8gj2', '1437204491', '1437205077', '0', '2130706433', 'Chrome/35.0.1916.153', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1471', '1', 'admin', 'd794efa213b36577511fd531a980ec55', '1437204693', '1437205076', '1', '2130706433', 'Chrome/35.0.1916.153', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1472', '311', 'test01', 'dimt57kk2r04sql7jgj1smq8t2', '1437213674', '1437213962', '1', '2130706433', 'Chrome/35.0.1916.153', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1473', '1', 'admin', 'd794efa213b36577511fd531a980ec55', '1438434478', '1438434789', '1', '2130706433', 'MSIE 8.0', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1474', '316', 'ceshi', 'ni3piq8o7rs6in04fp19c9rtm7', '1438434739', '1438434753', '0', '2130706433', 'MSIE 8.0', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1475', '316', 'ceshi', 'ni3piq8o7rs6in04fp19c9rtm7', '1438434753', '1438435045', '1', '2130706433', 'Chrome/35.0.1916.153', 'Windows NT 6.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1476', '1', 'admin', 'e4cd9f4f213930a03660f27d7024a318', '1445226605', '1445226626', '1', '2130706437', 'MSIE 8.0', 'Windows NT 5.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1477', '1', 'admin', 'e4cd9f4f213930a03660f27d7024a318', '1445226653', '1445226674', '1', '2130706437', 'MSIE 8.0', 'Windows NT 5.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1478', '317', 'test2015', '2d4e7f415fc361139940625308244814', '1445226687', '1445226815', '0', '2130706436', 'Chrome/31.0.1650.63', 'Windows NT 5.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1479', '317', 'test2015', '9b0bde70c573184bc6ad976699585df7', '1445226998', '1445227006', '0', '2130706436', 'Chrome/31.0.1650.63', 'Windows NT 5.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1480', '1', 'admin', 'd794efa213b36577511fd531a980ec55', '1445227023', '1445227138', '1', '2130706437', 'MSIE 8.0', 'Windows NT 5.1', '0');
INSERT INTO `ssc_member_session` VALUES ('1481', '317', 'test2015', '4c0554ae571cd02862154b3319603b0c', '1487646901', '1487661490', '0', '2130706433', 'Chrome/52.0.2743.116', 'Windows NT 10.0', '0');
INSERT INTO `ssc_member_session` VALUES ('1482', '317', 'test2015', '85428ed73ecdd0cbb188e30a3167b7af', '1490120686', '1490121214', '0', '2130706433', 'Chrome/56.0.2924.87', 'Windows NT 10.0', '0');
INSERT INTO `ssc_member_session` VALUES ('1483', '1', 'admin', 'd794efa213b36577511fd531a980ec55', '1490120869', '1490122630', '1', '2130706433', 'Chrome/56.0.2924.87', 'Windows NT 10.0', '0');
INSERT INTO `ssc_member_session` VALUES ('1484', '318', 'test2017', '85428ed73ecdd0cbb188e30a3167b7af', '1490121228', '1490127976', '1', '2130706433', 'Chrome/56.0.2924.87', 'Windows NT 10.0', '0');
INSERT INTO `ssc_member_session` VALUES ('1485', '1', 'admin', 'd794efa213b36577511fd531a980ec55', '1490122650', '1490123140', '1', '2130706433', 'Chrome/56.0.2924.87', 'Windows NT 10.0', '0');
INSERT INTO `ssc_member_session` VALUES ('1486', '1', 'admin', 'd794efa213b36577511fd531a980ec55', '1490123167', '1490127968', '1', '2130706433', 'Chrome/56.0.2924.87', 'Windows NT 10.0', '0');

-- ----------------------------
-- Table structure for `ssc_order`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_order`;
CREATE TABLE `ssc_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_number` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `recharge_amount` double(10,2) NOT NULL,
  `state` int(2) NOT NULL,
  `time` varchar(16) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `state` (`state`),
  KEY `order_number` (`order_number`),
  KEY `username` (`username`),
  KEY `recharge_amount` (`recharge_amount`),
  KEY `time` (`time`)
) ENGINE=MyISAM AUTO_INCREMENT=738 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_order
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_params`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_params`;
CREATE TABLE `ssc_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `title` varchar(80) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `value` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `title` (`title`) USING BTREE,
  KEY `value` (`value`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=latin1 COMMENT='系统配置表';

-- ----------------------------
-- Records of ssc_params
-- ----------------------------
INSERT INTO `ssc_params` VALUES ('1', 'basePl', '基本赔率', '6');
INSERT INTO `ssc_params` VALUES ('2', 'webName', '平台名称', '春彩');
INSERT INTO `ssc_params` VALUES ('3', 'switchWeb', '网站开关', '1');
INSERT INTO `ssc_params` VALUES ('4', 'switchMaster', '抢庄开关', '1');
INSERT INTO `ssc_params` VALUES ('5', 'rechargeMin', '充值最小金额', '50');
INSERT INTO `ssc_params` VALUES ('6', 'rechargeMax', '充值最大金额', '100000');
INSERT INTO `ssc_params` VALUES ('7', 'cashMin', '提现最小金额', '100');
INSERT INTO `ssc_params` VALUES ('8', 'cashMax', '提现最大金额', '100000');
INSERT INTO `ssc_params` VALUES ('9', 'cashFromTime', '提现开始时间', '10:00');
INSERT INTO `ssc_params` VALUES ('10', 'cashToTime', '提现结束时间', '23:59');
INSERT INTO `ssc_params` VALUES ('11', 'clearMemberCoin', '清号最小金额', '1');
INSERT INTO `ssc_params` VALUES ('12', 'clearMemberDate', '清号登录时长', '15');
INSERT INTO `ssc_params` VALUES ('13', 'fanDianMax', '最大返点', '13');
INSERT INTO `ssc_params` VALUES ('14', 'fanDianDiff', '上下级最小返点差', '0.1');
INSERT INTO `ssc_params` VALUES ('15', 'scoreProp', '积分比例', '1');
INSERT INTO `ssc_params` VALUES ('16', 'scoreRule', '积分规则提示', '1元=1个积分');
INSERT INTO `ssc_params` VALUES ('45', 'switchBuy', '', '1');
INSERT INTO `ssc_params` VALUES ('46', 'kefuStatus', '', '1');
INSERT INTO `ssc_params` VALUES ('47', 'webGG', '公告提示', '全新新蜂网站升级，更好用户体验，安全升级，界面升级，极致追求！');
INSERT INTO `ssc_params` VALUES ('63', 'recharge', '', '1');
INSERT INTO `ssc_params` VALUES ('62', 'kefuGG', '客服链接', 'tencent://Message/?Menu=YES&Uin=381615201&websiteName=im.qq.com');
INSERT INTO `ssc_params` VALUES ('17', 'fanDianBdwMax', '不定位最大返点', '6');
INSERT INTO `ssc_params` VALUES ('18', 'huoDongRegister', '注册活动金额', '8');
INSERT INTO `ssc_params` VALUES ('19', 'huoDongSign', '签到活动金币', '1');
INSERT INTO `ssc_params` VALUES ('20', 'rechargeCommission', '', '15');
INSERT INTO `ssc_params` VALUES ('21', 'rechargeCommission2', '', '10');
INSERT INTO `ssc_params` VALUES ('22', 'fanDianUserCount', '', '1,2,3,4,5,6,7,8,9,10,');
INSERT INTO `ssc_params` VALUES ('23', 'LetterStatus', '站内信总开关', '1');
INSERT INTO `ssc_params` VALUES ('26', 'minFanDianUserCount', '', '');
INSERT INTO `ssc_params` VALUES ('27', 'conCommissionBase', '消费佣金目标', '800');
INSERT INTO `ssc_params` VALUES ('28', 'conCommissionParentAmount', '上级佣金', '5');
INSERT INTO `ssc_params` VALUES ('29', 'conCommissionParentAmount2', '上上级佣金', '5');
INSERT INTO `ssc_params` VALUES ('30', 'webCloseServiceResult', '网站关闭公告', '接到机房升级硬件防火墙通知，网站暂时关闭。\r\n预计早上十点至十点半能恢复。给您带来不便，请谅解。');
INSERT INTO `ssc_params` VALUES ('31', 'betModeMaxFanDian0', '', '13');
INSERT INTO `ssc_params` VALUES ('32', 'betModeMaxFanDian2', '', '13');
INSERT INTO `ssc_params` VALUES ('33', 'betModeMaxFanDian1', '', '13');
INSERT INTO `ssc_params` VALUES ('34', 'rechargeMin1', '', '50');
INSERT INTO `ssc_params` VALUES ('35', 'rechargeMax1', '', '100000');
INSERT INTO `ssc_params` VALUES ('36', 'cashMin1', '', '100');
INSERT INTO `ssc_params` VALUES ('37', 'cashMax1', '', '100000');
INSERT INTO `ssc_params` VALUES ('40', 'picGG', '', '');
INSERT INTO `ssc_params` VALUES ('38', 'conCommissionBase2', '', '500');
INSERT INTO `ssc_params` VALUES ('39', 'rechargeCommissionAmount', '', '1000');
INSERT INTO `ssc_params` VALUES ('41', 'betMaxCount', '', '100000');
INSERT INTO `ssc_params` VALUES ('42', 'betMaxZjAmount', '', '500000');
INSERT INTO `ssc_params` VALUES ('43', 'picGGTitle', '', '内部广告');
INSERT INTO `ssc_params` VALUES ('44', 'switchAndroid', '手机端开关', '1');
INSERT INTO `ssc_params` VALUES ('48', 'hmPerPrice', '', '1.00');
INSERT INTO `ssc_params` VALUES ('49', 'switchJoinBuy', '', '1');
INSERT INTO `ssc_params` VALUES ('50', 'hmMinBuyCount', '', '10');
INSERT INTO `ssc_params` VALUES ('51', 'hmMinBuy', '', '10');
INSERT INTO `ssc_params` VALUES ('52', 'switchMasterNotice', '', '0');
INSERT INTO `ssc_params` VALUES ('53', 'rechargeCommissionBackAmount', '', '99');
INSERT INTO `ssc_params` VALUES ('54', 'rechargeCommissionBack', '', '3');
INSERT INTO `ssc_params` VALUES ('55', 'wanjinWebSiteStyle', '', '');
INSERT INTO `ssc_params` VALUES ('56', 'autoRegFanDian', '', '10');
INSERT INTO `ssc_params` VALUES ('57', 'autoRegFanDianBdw', '', '0');
INSERT INTO `ssc_params` VALUES ('58', 'wanjingamneLV', '', '10');
INSERT INTO `ssc_params` VALUES ('59', 'cashMinAmount', '', '30');
INSERT INTO `ssc_params` VALUES ('60', 'switchDLBuy', '', '1');
INSERT INTO `ssc_params` VALUES ('64', 'paihang', '', '1');
INSERT INTO `ssc_params` VALUES ('65', 'tzjl', '', '1');
INSERT INTO `ssc_params` VALUES ('66', 'paihangsj', '', '1');
INSERT INTO `ssc_params` VALUES ('135', 'huoDongSignStatus', '签到赠送类型（0金币-1金额）', '1');
INSERT INTO `ssc_params` VALUES ('68', 'czzs', '', '0');
INSERT INTO `ssc_params` VALUES ('69', 'paihangsjnr', '', '麒麟|小乐|Q7|1689|乐乐|皇上皇|喜欢|我爱你|奥特曼打小怪兽|听妈妈话|欧巴|罗汉果|未来|无悔88|全家乐|小紫|发财888|星哥|大炮哥|鹏哥|雪儿|xh88888|hxyeun|wan888|ceocafai|xiaofeiyu|蛋总|妞妞|同花姐');
INSERT INTO `ssc_params` VALUES ('70', 'paihangsjje', '', '38562.12|25632.22|12542.18|9986.23|7564.56|4436.21|4136.85|3689.22|385.12|256.22|4985.17|35421.12|8424.25|4154.19|72414.14|32456.22|76424.44||48562.72|20032.12|12542.18|19986.03|8504.58|4936.21|7936.8');
INSERT INTO `ssc_params` VALUES ('71', 'sbje', '', '0');
INSERT INTO `ssc_params` VALUES ('72', 'LiRunLv', '', '1');
INSERT INTO `ssc_params` VALUES ('75', 'safeMSGOn', '后台登陆启用短信验证', '1');
INSERT INTO `ssc_params` VALUES ('90', 'noRedToRed', '开启所有代理分红', '0');
INSERT INTO `ssc_params` VALUES ('76', 'rechargeLargess', '充值赠送', '1');
INSERT INTO `ssc_params` VALUES ('77', 'largess', '赠送比例（百分之）', '2');
INSERT INTO `ssc_params` VALUES ('78', 'target', '倍数', '0.3');
INSERT INTO `ssc_params` VALUES ('79', 'addr', '平台地址', '#');
INSERT INTO `ssc_params` VALUES ('80', 'closeVoice', '关闭声音', '0');
INSERT INTO `ssc_params` VALUES ('81', 'consumeGift', '消费赠送开关', '1');
INSERT INTO `ssc_params` VALUES ('82', 'consumeTarget', '消费目标', '1000');
INSERT INTO `ssc_params` VALUES ('83', 'consumeLargess', '赠送金额', '18');
INSERT INTO `ssc_params` VALUES ('84', 'modeY', '元模式', '1');
INSERT INTO `ssc_params` VALUES ('85', 'modeJ', '角模式', '1');
INSERT INTO `ssc_params` VALUES ('86', 'modeF', '分模式', '1');
INSERT INTO `ssc_params` VALUES ('87', 'modeL', '厘模式', '1');
INSERT INTO `ssc_params` VALUES ('88', 'mode2', '2元模式', '1');
INSERT INTO `ssc_params` VALUES ('89', 'mode1', '1元模式', '0');
INSERT INTO `ssc_params` VALUES ('91', 'templateurl', '样式包链接地址', '');
INSERT INTO `ssc_params` VALUES ('92', 'webFT', '页脚提示', '充值卡号会频繁更换，请一定要复制最新卡号信息,不可直接用上次充值的卡号信息,否则充到错误的卡号而产生的损失平台一律不负责！');
INSERT INTO `ssc_params` VALUES ('93', 'depositll1', '余额宝利率1', '0.1');
INSERT INTO `ssc_params` VALUES ('94', 'deposittime1', '余额宝利率时间1(分钟)', '60');
INSERT INTO `ssc_params` VALUES ('131', 'depositll2', '余额宝利率2', '0.2');
INSERT INTO `ssc_params` VALUES ('132', 'deposittime2', '余额宝利率时间2分钟)', '1440');
INSERT INTO `ssc_params` VALUES ('133', 'depositll3', '余额宝利率3', '0.3');
INSERT INTO `ssc_params` VALUES ('134', 'deposittime3', '余额宝利率时间3分钟)', '4320');
INSERT INTO `ssc_params` VALUES ('136', 'loginErrorTime', '登录错误时间（分钟）', '30');
INSERT INTO `ssc_params` VALUES ('137', 'loginErrorNum', '登录错误次数', '3');

-- ----------------------------
-- Table structure for `ssc_params_fandianset`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_params_fandianset`;
CREATE TABLE `ssc_params_fandianset` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userCount` smallint(6) NOT NULL DEFAULT '0',
  `fanDian` float(5,1) NOT NULL,
  `bFanDian` float(5,1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_params_fandianset
-- ----------------------------
INSERT INTO `ssc_params_fandianset` VALUES ('2', '3000', '11.0', '2.5');
INSERT INTO `ssc_params_fandianset` VALUES ('3', '5000', '10.5', '2.0');
INSERT INTO `ssc_params_fandianset` VALUES ('4', '500', '11.5', '3.0');
INSERT INTO `ssc_params_fandianset` VALUES ('5', '50', '12.0', '3.5');
INSERT INTO `ssc_params_fandianset` VALUES ('6', '32767', '8.0', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('7', '20000', '9.5', '1.0');
INSERT INTO `ssc_params_fandianset` VALUES ('8', '32767', '9.0', '0.5');
INSERT INTO `ssc_params_fandianset` VALUES ('9', '32767', '1.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('10', '32767', '2.0', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('11', '32767', '8.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('12', '32767', '2.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('13', '32767', '5.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('14', '32767', '3.0', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('15', '32767', '3.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('16', '32767', '4.0', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('17', '32767', '4.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('18', '10000', '10.0', '1.5');
INSERT INTO `ssc_params_fandianset` VALUES ('19', '32767', '7.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('20', '32767', '7.0', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('21', '32767', '6.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('22', '32767', '6.0', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('23', '32767', '5.0', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('24', '32767', '0.5', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('35', '900', '12.8', '3.0');
INSERT INTO `ssc_params_fandianset` VALUES ('40', '10000', '12.5', '4.0');
INSERT INTO `ssc_params_fandianset` VALUES ('41', '1000', '12.6', '4.1');
INSERT INTO `ssc_params_fandianset` VALUES ('42', '1000', '12.7', '4.2');
INSERT INTO `ssc_params_fandianset` VALUES ('43', '220', '12.8', '4.3');
INSERT INTO `ssc_params_fandianset` VALUES ('44', '32767', '1.0', '0.0');
INSERT INTO `ssc_params_fandianset` VALUES ('50', '220', '12.8', '3.5');

-- ----------------------------
-- Table structure for `ssc_platform_daily_count`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_platform_daily_count`;
CREATE TABLE `ssc_platform_daily_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(8) NOT NULL DEFAULT '0' COMMENT '8位数字日期',
  `recharge` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值总额',
  `rechargeCount` int(5) NOT NULL DEFAULT '0' COMMENT '充值笔数',
  `rechargeUser` int(5) NOT NULL DEFAULT '0' COMMENT '充值人数',
  `cash` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '提现总额',
  `cashCount` int(5) NOT NULL DEFAULT '0' COMMENT '提现笔数',
  `cashUser` int(5) NOT NULL DEFAULT '0' COMMENT '提现人数',
  `bet` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '投注总额',
  `betCount` int(5) NOT NULL DEFAULT '0' COMMENT '投注单数',
  `betUser` int(5) NOT NULL DEFAULT '0' COMMENT '投注人数',
  `zj` double(12,4) NOT NULL DEFAULT '0.0000' COMMENT '中奖总额',
  `zjCount` int(5) NOT NULL DEFAULT '0' COMMENT '中奖方案数',
  `fanDian` double(10,4) NOT NULL DEFAULT '0.0000' COMMENT '返点总数',
  `gift` double(10,4) NOT NULL DEFAULT '0.0000' COMMENT '赠送总数',
  `giftCount` int(5) NOT NULL DEFAULT '0' COMMENT '赠送总笔数',
  `giftUser` int(5) NOT NULL DEFAULT '0' COMMENT '赠送总人数',
  `comm` double(10,4) NOT NULL DEFAULT '0.0000' COMMENT '发放佣金总额',
  `commCount` int(5) NOT NULL DEFAULT '0' COMMENT '发放佣金总笔数',
  `commUser` int(5) NOT NULL DEFAULT '0' COMMENT '领取佣金总人数',
  `otherIn` double(10,4) NOT NULL DEFAULT '0.0000' COMMENT '其他收入',
  `otherOut` double(10,4) NOT NULL DEFAULT '0.0000' COMMENT '其他支出',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni` (`date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_platform_daily_count
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_played`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_played`;
CREATE TABLE `ssc_played` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) CHARACTER SET utf8 NOT NULL COMMENT '玩法名称',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `type` tinyint(4) NOT NULL COMMENT '彩票种类，参见ssc_type.type',
  `bonusProp` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '赔率',
  `bonusPropBase` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低赔率',
  `selectNum` tinyint(4) NOT NULL COMMENT '每注选几个号码',
  `groupId` smallint(6) NOT NULL COMMENT '玩法组',
  `simpleInfo` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '玩法简单说明',
  `info` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '玩法说明',
  `example` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '中奖举例',
  `ruleFun` varchar(32) NOT NULL DEFAULT '' COMMENT '中奖规则函数',
  `betCountFun` varchar(20) NOT NULL DEFAULT '',
  `zjMax` varchar(64) NOT NULL DEFAULT '' COMMENT '最大中奖号码计算函数',
  `playedTpl` varchar(64) NOT NULL DEFAULT '' COMMENT '玩法页面模板',
  `android` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(4) NOT NULL DEFAULT '0',
  `maxCount` int(11) NOT NULL DEFAULT '0' COMMENT '总注数',
  `maxBet` int(11) NOT NULL DEFAULT '0' COMMENT '最大投注数（0为无限制）',
  `minAmount` float(10,4) NOT NULL DEFAULT '0.0010' COMMENT '最小投注金额',
  PRIMARY KEY (`id`),
  KEY `bonusProp` (`name`,`enable`,`type`,`bonusProp`,`bonusPropBase`,`groupId`) USING BTREE,
  KEY `playedTpl` (`betCountFun`,`zjMax`,`playedTpl`,`maxCount`) USING BTREE,
  KEY `example` (`example`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=260291 DEFAULT CHARSET=latin1 COMMENT='玩法表';

-- ----------------------------
-- Records of ssc_played
-- ----------------------------
INSERT INTO `ssc_played` VALUES ('102', '五星复式', '1', '1', '196000.00', '170000.00', '5', '101', '从万位、千位、百位、十位、个位各选一个号码组成一注。', '从万位、千位、百位、十位、个位中选择一个5位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。', '投注方案：12345，开奖号码：12345，即中五星直选', 'dxwf5f', 'fs', 'fs', 'ssc', '1', '1', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('103', '五星单式', '1', '1', '196000.00', '170000.00', '5', '101', '手动输入号码，至少输入1个五位数号码组成一注。', '手动输入一个5位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位、个位相同，且顺序一致，即为中奖。', '如：输入1234567890，则你投两注分别为12345和67890，如果开奖号为12345，则你中奖一注。', 'dxwf5d', 'ds', 'ds', 'ssc_dx_5d', '0', '2', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('104', '前四复式', '1', '1', '19600.00', '17000.00', '4', '102', '从万位、千位、百位、十位各选一个号码组成一注。', '从万位、千位、百位、十位中选择一个4位数号码组成一注，所选号码与开奖号码前4位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4f', 'fs', 'fs', 'ssc_dx_q4f', '1', '4', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('105', '前四单式', '1', '1', '19600.00', '17000.00', '4', '102', '手动输入号码，至少输入1个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('106', '后四复式', '1', '1', '19600.00', '17000.00', '4', '102', '从千位、百位、十位、个位各选一个号码组成一注。', '从千位、百位、十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选', 'dxwfH4f', 'fs', 'fs', 'ssc_dx_h4f', '1', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('107', '后四单式', '1', '1', '19600.00', '17000.00', '4', '102', '手动输入号码，至少输入一个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的千位、百位、十位、个位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选。', 'dxwfH4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '7', '10000', '1000', '0.0000');
INSERT INTO `ssc_played` VALUES ('108', '任选四复式', '1', '1', '19600.00', '17000.00', '4', '1010', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。', 'dxwfR4f', 'fs', 'fs', 'ssc_dx_r4f', '1', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('109', '任选四单式', '1', '1', '19600.00', '17000.00', '4', '1010', '从万位、千位、百位、十位、个位中选择四个位置，至少手动输入一个四位数的号码组成一注。', ' 从万位、千位、百位、十位、个位中选择四个位置。至少手动输入一个四位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。1*345，则为中奖，如果是13*45或134*5等都不中奖。', 'dxwfR4d', 'rx4ds', 'ds', 'ssc_dx_r4d', '0', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1010', '前三复式', '1', '1', '1960.00', '1700.00', '3', '103', '从万位、千位、百位各选一个号码组成一注。', '从万位、千位、百位中选择一个三位数号码组成一注，所选号码与开奖号码前三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3f', 'fs', 'fs', 'ssc_3x_q3f', '1', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1011', '前三单式', '1', '1', '1960.00', '1700.00', '3', '103', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的前三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1012', '后三复式', '1', '1', '1960.00', '1700.00', '3', '103', '从百位、十位、个位各选一个号码组成一注。', '从百位、十位、个位中选择一个三位数号码组成一注，所选号码与开奖号码后三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3f', 'fs', 'fs', 'ssc_3x_h3f', '1', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1013', '后三单式', '1', '1', '1960.00', '1700.00', '3', '103', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的后三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1014', '任选三复式', '1', '1', '1960.00', '1700.00', '3', '1010', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，个位选3。开奖号码：12223，即中任三直选。', 'sxwfR3f', 'fs', 'fs', 'ssc_3x_r3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1015', '任选三单式', '1', '1', '1960.00', '1700.00', '3', '1010', '从万位、千位、百位、十位、个位中选择三个位置，至少手动输入一个三位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置。至少手动输入一个三位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、百位、个位，输入号码123。开奖号码：12223，即中任三直选。', 'sxwfR3d', 'rx3ds', 'ds', 'ssc_3x_r3d', '0', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1016', '前三组三', '1', '1', '666.66', '566.66', '2', '104', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：前三位221(顺序不限)，即中前三组选三', 'sxzxQ3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1017', '前三组六', '1', '1', '333.33', '283.33', '3', '104', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：前三位513(顺序不限)，即中前三组选六。', 'sxzxQ3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1018', '前三混合组选', '0', '1', '60.00', '0.00', '3', '104', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的前三位符合手动输入号码，即中前三组选三或前三组选六。', '投注方案：122、135。  开奖号码：前三位221(顺序不限)即中前三组选三，或前三位513(顺序不限)即中前三组选六。', 'sxzxQ3h', '', 'ds', 'ssc_3x_z3q', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1019', '后三组三', '1', '1', '666.66', '566.66', '2', '104', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成2注或2注以上，所选号码与开奖号码后三位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后三位221(顺序不限)，即中后三组选三。', 'sxzxH3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1020', '后三组六', '1', '1', '333.33', '283.33', '3', '104', '从0-9中任意选择3个或3个以上号码。', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的百位、十位、个位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：后三位513(顺序不限)，即中后三组选六。', 'sxzxH3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1021', '后三混合组选', '0', '1', '60.00', '0.00', '3', '104', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的后三位符合手动输入号码，即中后三组选三或后三组选六。', '投注方案：122、135。  开奖号码：后三位221(顺序不限)即中后三组选三，或后三位513(顺序不限)即中后三组选六', 'sxzxH3h', '', 'ds', 'ssc_3x_z3d', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1022', '任选三组三', '1', '1', '666.66', '566.66', '3', '1010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码01，开奖号码：90501，即中任三组三。', 'sxzxR3z3', 'z3', 'fs', 'ssc_z3_r3', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1023', '任选三组六', '1', '1', '333.33', '283.33', '3', '1010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三组六', 'sxzxR3z6', 'z6', 'fs', 'ssc_z3_r6', '1', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1024', '任选三混合组选', '0', '1', '60.00', '0.00', '3', '1010', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码构成一注(不含豹子)。', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码组成一注，三选号码与开奖号码的指定位置号码相同，且顺序不限，即为中奖', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三混合组选', 'sxzxR3h', '', 'ds', 'ssc_3x_rz3', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1025', '前二复式', '1', '1', '196.00', '170.00', '2', '105', '从万位、千位中至少各选1个号码组成一注。', '从万位、千位中选择一个2位数号码组成一注，所选号码与开奖号码的前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2f', 'fs', 'fs', 'ssc_2x_q2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1026', '前二单式', '1', '1', '196.00', '170.00', '2', '105', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2d', 'ds', 'ds', 'ssc_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1027', '后二复式', '1', '1', '196.00', '170.00', '2', '105', '从十位、个位中至少各选1个号码组成一注。', '从十位、个位中选择一个2位数号码组成一注，所选号码与开奖号码的后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2f', 'fs', 'fs', 'ssc_2x_h2f', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1028', '后二单式', '1', '1', '196.00', '170.00', '2', '105', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2d', 'ds', 'ds', 'ssc_2x_2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1029', '任选二复式', '1', '1', '196.00', '170.00', '2', '105', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注，所选号码与开奖号码指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：百位1，十位2  开奖号码：12123，即中任二直选', 'rxwfR2f', 'fs', 'fs', 'ssc_2x_r2f', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1030', '任选二单式', '1', '1', '196.00', '170.00', '2', '105', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置。至少手动输入一个两位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、个位，输入号码13。开奖号码：12223，即中任二直选。', 'rxwfR2d', 'rx2ds', 'ds', 'ssc_2x_r2d', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1031', '前二组选复式', '1', '1', '100.00', '85.00', '2', '106', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所择号码与开奖号码的万位、千位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1032', '前二组选单式', '1', '1', '100.00', '85.00', '2', '106', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的前二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2d', 'ds', 'ds', 'ssc_z2_d2', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1033', '后二组选复式', '1', '1', '100.00', '85.00', '2', '106', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个号码组成一注，所选号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2f', 'z2', 'fs', 'ssc_z2_f2', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1034', '后二组选单式', '1', '1', '100.00', '85.00', '2', '106', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2d', 'ds', 'ds', 'ssc_z2_d2', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1035', '任选二组选复式', '1', '1', '100.00', '85.00', '2', '106', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码构成一注。', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，选择号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2f', 'z2', 'fs', 'ssc_z2_r2', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1036', '任选二组选单式', '1', '1', '100.00', '85.00', '2', '106', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数号码组成一注，输入号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，输入号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2d', 'ds', 'ds', 'ssc_z2_rd', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1037', '五星定位胆', '1', '1', '19.60', '17.00', '1', '101', '在万位、千位、百位、十位、个位任意位置上任意选择1个或1个以上号码。', '从万位、千位、百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '投注方案：个位 1    开奖号码：个位 1，即中定位胆个位。', 'dwd5x', 'dwd', 'dd5x', 'ssc_5x_dw', '1', '0', '50', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1038', '后三一码', '1', '1', '6.60', '6.60', '0', '108', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码百位、十位、个位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：后三位至少出现1个1，即中后三一码不定位。', 'bddH3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '2', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1039', '前三一码', '1', '1', '6.60', '6.60', '0', '108', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码万位、千位、百位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：前三位至少出现1个1，即中前三一码不定位。', 'bddQ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '0', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1040', '中三一码', '1', '1', '6.60', '6.60', '0', '108', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码千位、百位、十位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：千位、百位、十位至少出现1个1，即中中三一码不定位。', 'bddZ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '1', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1041', '任三一码', '1', '1', '6.60', '6.60', '0', '108', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。开奖号码的指定位置包含所选号码，即为中奖。', '投注方案：选择位置：万位、十位、个位，选择号码 1   开奖号码：万位、十位、个位至少出现1个1，即中任三一码不定位。', 'bddR3', 'dwd', 'bdd', 'ssc_5x_r3', '1', '3', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1042', '前二大小单双', '1', '1', '7.76', '6.80', '0', '109', '从万位、千位中的“大、小、单、双”中至少各选一个组成一注。', '对万位和千位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：万位与千位为小双，即中前二大小单双。', 'dsQ2', 'dxds', 'dxds', 'ssc_dxds_q2', '1', '1', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1043', '后二大小单双', '1', '1', '7.76', '6.80', '0', '109', '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。', '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：十位与个位为小双，即中后二大小单双。', 'dsH2', 'dxds', 'dxds', 'ssc_dxds_h2', '1', '2', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1044', '任选大小单双', '1', '1', '7.76', '6.80', '0', '109', '从万位、千位、百位、十位、个位中选定两个位置，且大、小、单、双至少各选一个组成一注。', '从万位、千位、百位、十位、个位中选定两个位置，对选定位置进行大、小、单、双形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：选择位置万位、十位，对应小双  开奖号码：万位与十位为小双，即中任选大小单双。', 'dsR2', 'dxds', 'dxds', 'ssc_dxds_r2', '1', '3', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10142', '前三二码', '0', '1', '33.00', '33.00', '2', '108', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个不同的号码组成，只要开奖号码的万位、千位、百位中包含所选号码，即为中奖。', '如：选择二码不定位12，前三位，至少出现1和2各一个即为中奖。', 'bdwQ32', 'r2', '', 'ssc_2x_bdw', '1', '5', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10143', '后三二码', '0', '1', '33.00', '33.00', '2', '108', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择12，前三位，至少出现1和2各一个即为中奖。', 'bdwH32', 'r2', '', 'ssc_2x_bdw', '1', '6', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10254', '一帆风顺', '1', '1', '4.64', '4.06', '1', '1011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中包含所选号码，即为中奖。', '投注方案：8，开奖号码:至少出现一个8，即中一帆风顺', 'qwwfyffs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10255', '好事成双', '1', '1', '23.71', '20.77', '1', '1011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现2次，即为中奖。', '投注方案：8，开奖号码:至少出现两个8，即中好事成双', 'qwwfhscs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '1', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10256', '三星报喜', '1', '1', '226.35', '198.33', '1', '1011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现3次，即为中奖。', '投注方案：8，开奖号码:至少出现三个8，即中三星报喜', 'qwwfsxbx', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '2', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10257', '四季发财', '1', '1', '4204.34', '3683.66', '1', '1011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现4次，即为中奖。', '投注方案：8，开奖号码:至少出现四个8，即中四季发财', 'qwwfsjfc', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '3', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10258', '组选120', '1', '1', '1666.66', '1416.66', '5', '101', '任意选择一个5位数号码组成一注，所选号码与开奖号码全部相同，顺序可不一致，即为中奖。', '如：12435，如果开奖号为54321，则你中奖一注。', '投注方案：1,2,3,4,5，开奖号码:出现1,2,3,4,5，即中组选120', 'dxwf5z120', 'zx120', '', 'ssc_5x_z5_120', '0', '3', '252', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10261', '五星三码', '0', '1', '45.00', '45.00', '3', '108', '从0-9中任意选择3个以上号码', '从0-9中选择3个号码，每注由3个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的3个号码，即为中奖。', '投注号码：1 2 3<br>\n开奖号码：至少出现1、2、3各一个，即中五星三码不定位。', 'bdw5x3m', 'r3', '', 'ssc_5x_3m_bdw', '0', '10', '120', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10262', '五星二码', '0', '1', '13.00', '13.00', '2', '108', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：至少出现1和2各一个，即中五星二码不定位。', 'bdw5x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '11', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10263', '四星二码', '0', '1', '20.00', '20.00', '2', '108', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：后四位，至少出现1和2各一个，即中四星二码不定位。', 'bdw4x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '12', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10264', '四星一码', '0', '1', '4.20', '4.20', '1', '108', '从0-9中任意选择1个以上号码', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码的千、百、十、个位中包含所选号码，即为中奖。', '投注方案：1<br>\n开奖号码：后四位，至少出现1个1，即中四星一码不定位。', 'bdw4x1m', 'r1sscqw', '', 'ssc_4x_1m_bdw', '0', '13', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10265', '前三大小单双', '1', '1', '15.52', '13.60', '0', '109', '对万位、千位和百位的“大小单双”形态进行购买。', '对万位、千位和百位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：万位选择大，千位选择单，百位选择双，开出632**即为中奖。', 'dsQ3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '4', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10266', '后三大小单双', '1', '1', '15.52', '13.60', '0', '109', '对百位、十位和个位的“大小单双”形态进行购买。', '对百位、十位和个位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：百位选择大，十位选择单，个位选择双，开出**632即为中奖。', 'dsH3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '5', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10267', '后三和值尾数', '1', '1', '1960.00', '1700.00', '1', '103', '从0-9中选择1个号码。', '所选数值等于开奖号码的百位、十位、个位三数字相加之和的尾数，即为中奖', '投注方案：和值尾数8，开奖号码：后三位和值尾数为8，即中得和值尾数', 'sxh3hzws', 'r1', 'r1', 'ssc_hz_h3', '0', '7', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10268', '组选60', '1', '1', '3333.33', '2833.32', '3', '101', '从“二重号”选择一个号码，“单号”中选择三个号码组成一注。', '选择1个二重号码和3个单号号码组成一注，所选的单号号码与开奖号码相同，且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z60', '', '', 'ssc_5x_z5_60', '0', '4', '840', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10269', '组选30', '1', '1', '6666.66', '5666.66', '3', '101', '从“二重号”选择两个号码，“单号”中选择一个号码组成一注。', '选择2个二重号和1个单号号码组成一注，所选的单号号码与开奖号码相同，且所选的2个二重号码分别在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z30', '', '', 'ssc_5x_z5_30', '0', '5', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10270', '组选20', '1', '1', '10000.00', '8500.00', '3', '101', '从“三重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个三重号码和2个单号号码组成一注，所选的单号号码与开奖号码相同，且所选三重号码在开奖号码中出现了3次，即为中奖。', '', 'dxwf5z20', '', '', 'ssc_5x_z5_20', '0', '6', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10271', '组选10', '1', '1', '20000.00', '17000.00', '2', '101', '从“三重号”选择一个号码，“二重号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z10', '', '', 'ssc_5x_z5_10', '0', '7', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10272', '组选5', '1', '1', '40000.00', '34000.00', '2', '101', '从“四重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z5', '', '', 'ssc_5x_z5_5', '0', '8', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10273', '组选24', '1', '1', '833.33', '708.33', '4', '102', '从0-9中选择4个号码组成一注。 ', '从0-9中任意选择4个号码组成一注，所选号码与开奖号码的后四位相同，且顺序不限，即为中奖。', '投注方案：1,2,3,4，开奖号码：5,4,3,2,1，即中组选24', 'dxwf4z24', '', '', 'ssc_4x_z4_24', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10275', '组选12', '1', '1', '1666.66', '1416.66', '3', '102', '从“二重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个二重号码和2个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选二重号码出现了2次，即为中奖。', '投注号码：1,25 开奖号码：5,1,1,2,5 即中组选12', 'dxwf4z12', '', '', 'ssc_4x_z4_12', '0', '8', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10276', '组选6', '1', '1', '3333.33', '2833.32', '3', '102', '从“二重号”选择两个号码组成一注。', '选择2个二重号码组成一注，在开奖号码后四位中，所选的2个二重号码分别出现了2次，即为中奖。', '投注方案：2,3   开奖号码：1,2,2,3,3   即中组选6', 'dxwf4z6', '', '', 'ssc_4x_z4_6', '0', '9', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10277', '组选4', '1', '1', '5000.00', '4250.00', '2', '102', '从“三重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选三重号码出现了3次，即为中奖。', '投注方案：3,1  开奖号码：5,3,3,3,1  即中组选4', 'dxwf4z4', '', '', 'ssc_4x_z4_4', '0', '10', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10278', '后三组选和值', '1', '1', '300.00', '255.00', '1', '104', '从1-26中选择1个号码。', '所选数值等于开奖号码百位、十位、个位三个数字相加之和(不含豹子号)，即为中奖。', '', 'sxzxH3hz', '', 'ds', 'ssc_z3h_hz', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10280', '后三直选跨度', '1', '1', '1960.00', '1700.00', '1', '103', '从0-9中选择1个号码。', '所选数值等于开奖号码的后3位最大与最小数字相减之差，即为中奖。', '投注方案：2 开奖号码：1,2,3,4,5 即中后三直选跨度', 'sxzxH3kd', '', '', 'ssc_h3_kd', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10279', '后三特殊号码', '0', '1', '6.00', '6.00', '1', '104', '选择一个号码形态。', '所选的号码特殊属性和开奖号码后3位的属性一致，即为中奖。其中：1.顺子号的个、十、百位不分顺序；2.对子号指的是开奖号码的后三位当中，任意2位数字相同的三位数号码。', '', 'sxzxH3ts', '', '', 'ssc_ts_h3', '0', '5', '3', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10283', '前三趣味二星', '0', '1', '90.00', '90.00', '3', '1011', '选择一个万位的大小号属性，并从千位、百位中至少各选1个号码。', '在千位、百位上至少各选1个号码，并从万位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfq3qw2x', '', '', 'qwwf_q3qw2x', '0', '4', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10284', '后三趣味二星', '0', '1', '90.00', '90.00', '3', '1011', '选择一个百位的大小号属性，并从十位、个位中至少各选1个号码。', '在个位、十位上至少各选1个号码，并从百位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfh3qw2x', '', '', 'qwwf_h3qw2x', '0', '5', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10285', '四码趣味三星', '0', '1', '950.00', '950.00', '4', '1011', '选择一个千位的大小号属性，并从百位、十位、个位中至少各选1个号码。', '在个位、十位、百位上至少各选1个号码，并从千位大小号中任选一种号码属性进行投注。其中，0-4为小号；5-9为大号', '', 'qwwf4mqw3x', '', '', 'qwwf_4mqw3x', '0', '6', '2000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10286', '五码趣味三星', '0', '1', '620.00', '620.00', '5', '1011', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中各任选一种进行投注。', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中分别任选一种号码属性进行投注。其中，0-4为“小号”；5-9为“大号”。', '', 'qwwf5mqw3x', '', '', 'qwwf_5mqw3x', '0', '7', '4000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10287', '中三复式', '1', '1', '1960.00', '1700.00', '3', '103', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '投注方案：1,2,3   开奖号码：0,1,2,3,4  即中 中三复试', 'sxwfz3fs', 'fs', 'fs', 'ssc_3x_z3fs', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10288', '中三单式', '1', '1', '1960.00', '1700.00', '3', '103', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '', 'sxwfz3ds', 'ds', 'ds', 'ssc_3x_z3ds', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10289', '中三组三', '1', '1', '666.66', '566.66', '2', '104', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：中三位221(顺序不限)，即中 中三组选三', 'sxzxz3z3', 'z3', 'fs', 'ssc_z3_z3', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10290', '中三组六', '1', '1', '333.33', '283.33', '3', '104', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：中三位513(顺序不限)，即中 中三组选六。', 'sxzxz3z6', 'z6', 'fs', 'ssc_z3_z6', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('302', '五星复式', '1', '3', '200000.00', '170000.00', '5', '301', '从万位、千位、百位、十位、个位各选一个号码组成一注。', '从万位、千位、百位、十位、个位中选择一个5位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。', '投注方案：12345，开奖号码：12345，即中五星直选', 'dxwf5f', 'fs', 'fs', 'ssc', '1', '1', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('303', '五星单式', '1', '3', '200000.00', '170000.00', '5', '301', '手动输入号码，至少输入1个五位数号码组成一注。', '手动输入一个5位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位、个位相同，且顺序一致，即为中奖。', '如：输入1234567890，则你投两注分别为12345和67890，如果开奖号为12345，则你中奖一注。', 'dxwf5d', 'ds', 'ds', 'ssc_dx_5d', '0', '2', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('304', '前四复式', '1', '3', '20000.00', '17000.00', '4', '302', '从万位、千位、百位、十位各选一个号码组成一注。', '从万位、千位、百位、十位中选择一个4位数号码组成一注，所选号码与开奖号码前4位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4f', 'fs', 'fs', 'ssc_dx_q4f', '1', '4', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('305', '前四单式', '1', '3', '20000.00', '17000.00', '4', '302', '手动输入号码，至少输入1个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('306', '后四复式', '1', '3', '20000.00', '17000.00', '4', '302', '从千位、百位、十位、个位各选一个号码组成一注。', '从千位、百位、十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选', 'dxwfH4f', 'fs', 'fs', 'ssc_dx_h4f', '1', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('307', '后四单式', '1', '3', '20000.00', '17000.00', '4', '302', '手动输入号码，至少输入一个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的千位、百位、十位、个位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选。', 'dxwfH4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '7', '10000', '1000', '0.0000');
INSERT INTO `ssc_played` VALUES ('308', '任选四复式', '1', '3', '20000.00', '17000.00', '4', '3010', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。', 'dxwfR4f', 'fs', 'fs', 'ssc_dx_r4f', '1', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('309', '任选四单式', '1', '3', '20000.00', '17000.00', '4', '3010', '从万位、千位、百位、十位、个位中选择四个位置，至少手动输入一个四位数的号码组成一注。', ' 从万位、千位、百位、十位、个位中选择四个位置。至少手动输入一个四位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。1*345，则为中奖，如果是13*45或134*5等都不中奖。', 'dxwfR4d', 'rx4ds', 'ds', 'ssc_dx_r4d', '0', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3010', '前三复式', '1', '3', '2000.00', '1700.00', '3', '303', '从万位、千位、百位各选一个号码组成一注。', '从万位、千位、百位中选择一个三位数号码组成一注，所选号码与开奖号码前三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3f', 'fs', 'fs', 'ssc_3x_q3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3011', '前三单式', '1', '3', '2000.00', '1700.00', '3', '303', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的前三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3012', '后三复式', '1', '3', '2000.00', '1700.00', '3', '303', '从百位、十位、个位各选一个号码组成一注。', '从百位、十位、个位中选择一个三位数号码组成一注，所选号码与开奖号码后三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3f', 'fs', 'fs', 'ssc_3x_h3f', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3013', '后三单式', '1', '3', '2000.00', '1700.00', '3', '303', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的后三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3014', '任选三复式', '1', '3', '2000.00', '1700.00', '3', '3010', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，个位选3。开奖号码：12223，即中任三直选。', 'sxwfR3f', 'fs', 'fs', 'ssc_3x_r3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3015', '任选三单式', '1', '3', '2000.00', '1700.00', '3', '3010', '从万位、千位、百位、十位、个位中选择三个位置，至少手动输入一个三位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置。至少手动输入一个三位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、百位、个位，输入号码123。开奖号码：12223，即中任三直选。', 'sxwfR3d', 'rx3ds', 'ds', 'ssc_3x_r3d', '0', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3016', '前三组三', '1', '3', '666.66', '566.66', '2', '304', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：前三位221(顺序不限)，即中前三组选三', 'sxzxQ3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3017', '前三组六', '1', '3', '333.33', '283.33', '3', '304', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：前三位513(顺序不限)，即中前三组选六。', 'sxzxQ3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3018', '前三混合组选', '0', '3', '60.00', '0.00', '3', '304', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的前三位符合手动输入号码，即中前三组选三或前三组选六。', '投注方案：122、135。  开奖号码：前三位221(顺序不限)即中前三组选三，或前三位513(顺序不限)即中前三组选六。', 'sxzxQ3h', '', 'ds', 'ssc_3x_z3q', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3019', '后三组三', '1', '3', '666.66', '566.66', '2', '304', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成2注或2注以上，所选号码与开奖号码后三位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后三位221(顺序不限)，即中后三组选三。', 'sxzxH3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3020', '后三组六', '1', '3', '333.33', '283.33', '3', '304', '从0-9中任意选择3个或3个以上号码。', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的百位、十位、个位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：后三位513(顺序不限)，即中后三组选六。', 'sxzxH3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3021', '后三混合组选', '0', '3', '60.00', '0.00', '3', '304', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的后三位符合手动输入号码，即中后三组选三或后三组选六。', '投注方案：122、135。  开奖号码：后三位221(顺序不限)即中后三组选三，或后三位513(顺序不限)即中后三组选六', 'sxzxH3h', '', 'ds', 'ssc_3x_z3d', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3022', '任选三组三', '1', '3', '666.66', '566.66', '3', '3010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码01，开奖号码：90501，即中任三组三。', 'sxzxR3z3', 'z3', 'fs', 'ssc_z3_r3', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3023', '任选三组六', '1', '3', '333.33', '283.33', '3', '3010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三组六', 'sxzxR3z6', 'z6', 'fs', 'ssc_z3_r6', '1', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3024', '任选三混合组选', '0', '3', '60.00', '0.00', '3', '3010', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码构成一注(不含豹子)。', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码组成一注，三选号码与开奖号码的指定位置号码相同，且顺序不限，即为中奖', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三混合组选', 'sxzxR3h', '', 'ds', 'ssc_3x_rz3', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3025', '前二复式', '1', '3', '200.00', '170.00', '2', '305', '从万位、千位中至少各选1个号码组成一注。', '从万位、千位中选择一个2位数号码组成一注，所选号码与开奖号码的前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2f', 'fs', 'fs', 'ssc_2x_q2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3026', '前二单式', '1', '3', '200.00', '170.00', '2', '305', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2d', 'ds', 'ds', 'ssc_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3027', '后二复式', '1', '3', '200.00', '170.00', '2', '305', '从十位、个位中至少各选1个号码组成一注。', '从十位、个位中选择一个2位数号码组成一注，所选号码与开奖号码的后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2f', 'fs', 'fs', 'ssc_2x_h2f', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3028', '后二单式', '1', '3', '200.00', '170.00', '2', '305', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2d', 'ds', 'ds', 'ssc_2x_2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3029', '任选二复式', '1', '3', '200.00', '170.00', '2', '305', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注，所选号码与开奖号码指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：百位1，十位2  开奖号码：12123，即中任二直选', 'rxwfR2f', 'fs', 'fs', 'ssc_2x_r2f', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3030', '任选二单式', '1', '3', '200.00', '170.00', '2', '305', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置。至少手动输入一个两位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、个位，输入号码13。开奖号码：12223，即中任二直选。', 'rxwfR2d', 'rx2ds', 'ds', 'ssc_2x_r2d', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3031', '前二组选复式', '1', '3', '100.00', '85.00', '2', '306', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所择号码与开奖号码的万位、千位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3032', '前二组选单式', '1', '3', '100.00', '85.00', '2', '306', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的前二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2d', 'ds', 'ds', 'ssc_z2_d2', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3033', '后二组选复式', '1', '3', '100.00', '85.00', '2', '306', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个号码组成一注，所选号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2f', 'z2', 'fs', 'ssc_z2_f2', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3034', '后二组选单式', '1', '3', '100.00', '85.00', '2', '306', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2d', 'ds', 'ds', 'ssc_z2_d2', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3035', '任选二组选复式', '1', '3', '100.00', '85.00', '2', '306', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码构成一注。', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，选择号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2f', 'z2', 'fs', 'ssc_z2_r2', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3036', '任选二组选单式', '1', '3', '100.00', '85.00', '2', '306', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数号码组成一注，输入号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，输入号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2d', 'ds', 'ds', 'ssc_z2_rd', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3037', '五星定位胆', '1', '3', '20.00', '17.00', '1', '307', '在万位、千位、百位、十位、个位任意位置上任意选择1个或1个以上号码。', '从万位、千位、百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '投注方案：个位 1    开奖号码：个位 1，即中定位胆个位。', 'dwd5x', 'dwd', 'dd5x', 'ssc_5x_dw', '1', '0', '50', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3038', '后三一码', '1', '3', '6.99', '5.66', '0', '308', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码百位、十位、个位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：后三位至少出现1个1，即中后三一码不定位。', 'bddH3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '6', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3039', '前三一码', '1', '3', '6.99', '5.66', '0', '308', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码万位、千位、百位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：前三位至少出现1个1，即中前三一码不定位。', 'bddQ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '3', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3040', '中三一码', '1', '3', '6.99', '5.66', '0', '308', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码千位、百位、十位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：千位、百位、十位至少出现1个1，即中中三一码不定位。', 'bddZ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '5', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3041', '任三一码', '1', '3', '6.99', '5.66', '0', '308', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。开奖号码的指定位置包含所选号码，即为中奖。', '投注方案：选择位置：万位、十位、个位，选择号码 1   开奖号码：万位、十位、个位至少出现1个1，即中任三一码不定位。', 'bddR3', 'dwd', 'bdd', 'ssc_5x_r3', '1', '9', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3042', '前二大小单双', '1', '3', '7.76', '6.80', '0', '309', '从万位、千位中的“大、小、单、双”中至少各选一个组成一注。', '对万位和千位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：万位与千位为小双，即中前二大小单双。', 'dsQ2', 'dxds', 'dxds', 'ssc_dxds_q2', '1', '1', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3043', '后二大小单双', '1', '3', '7.76', '6.80', '0', '309', '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。', '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：十位与个位为小双，即中后二大小单双。', 'dsH2', 'dxds', 'dxds', 'ssc_dxds_h2', '1', '2', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('3044', '任选大小单双', '1', '3', '7.76', '6.80', '0', '309', '从万位、千位、百位、十位、个位中选定两个位置，且大、小、单、双至少各选一个组成一注。', '从万位、千位、百位、十位、个位中选定两个位置，对选定位置进行大、小、单、双形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：选择位置万位、十位，对应小双  开奖号码：万位与十位为小双，即中任选大小单双。', 'dsR2', 'dxds', 'dxds', 'ssc_dxds_r2', '1', '6', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30142', '前三二码', '0', '3', '31.16', '31.16', '2', '308', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个不同的号码组成，只要开奖号码的万位、千位、百位中包含所选号码，即为中奖。', '如：选择二码不定位12，前三位，至少出现1和2各一个即为中奖。', 'bdwQ32', 'r2', '', 'ssc_2x_bdw', '1', '3', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30143', '后三二码', '0', '3', '31.16', '31.16', '2', '308', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择12，前三位，至少出现1和2各一个即为中奖。', 'bdwH32', 'r2', '', 'ssc_2x_bdw', '1', '6', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30254', '一帆风顺', '1', '3', '4.64', '4.06', '1', '3011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中包含所选号码，即为中奖。', '投注方案：8，开奖号码:至少出现一个8，即中一帆风顺', 'qwwfyffs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30255', '好事成双', '1', '3', '23.71', '20.77', '1', '3011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现2次，即为中奖。', '投注方案：8，开奖号码:至少出现两个8，即中好事成双', 'qwwfhscs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '1', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30256', '三星报喜', '1', '3', '226.35', '198.33', '1', '3011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现3次，即为中奖。', '投注方案：8，开奖号码:至少出现三个8，即中三星报喜', 'qwwfsxbx', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '2', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30257', '四季发财', '1', '3', '4204.34', '3683.66', '1', '3011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现4次，即为中奖。', '投注方案：8，开奖号码:至少出现四个8，即中四季发财', 'qwwfsjfc', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '3', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30258', '组选120', '1', '3', '1666.66', '1416.66', '5', '301', '任意选择一个5位数号码组成一注，所选号码与开奖号码全部相同，顺序可不一致，即为中奖。', '如：12435，如果开奖号为54321，则你中奖一注。', '投注方案：1,2,3,4,5，开奖号码:出现1,2,3,4,5，即中组选120', 'dxwf5z120', 'zx120', '', 'ssc_5x_z5_120', '0', '3', '252', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30261', '五星三码', '0', '3', '38.72', '38.72', '3', '308', '从0-9中任意选择3个以上号码', '从0-9中选择3个号码，每注由3个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的3个号码，即为中奖。', '投注号码：1 2 3<br>\n开奖号码：至少出现1、2、3各一个，即中五星三码不定位。', 'bdw5x3m', 'r3', '', 'ssc_5x_3m_bdw', '0', '0', '120', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30262', '五星二码', '0', '3', '11.33', '11.33', '2', '308', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：至少出现1和2各一个，即中五星二码不定位。', 'bdw5x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '1', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30263', '四星二码', '0', '3', '17.37', '17.37', '2', '308', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：后四位，至少出现1和2各一个，即中四星二码不定位。', 'bdw4x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '2', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30264', '四星一码', '0', '3', '4.20', '4.20', '1', '308', '从0-9中任意选择1个以上号码', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码的千、百、十、个位中包含所选号码，即为中奖。', '投注方案：1<br>\n开奖号码：后四位，至少出现1个1，即中四星一码不定位。', 'bdw4x1m', 'r1sscqw', '', 'ssc_4x_1m_bdw', '0', '2', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30265', '前三大小单双', '1', '3', '15.52', '6.80', '0', '309', '对万位、千位和百位的“大小单双”形态进行购买。', '对万位、千位和百位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：万位选择大，千位选择单，百位选择双，开出632**即为中奖。', 'dsQ3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '4', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30266', '后三大小单双', '1', '3', '15.52', '6.80', '0', '309', '对百位、十位和个位的“大小单双”形态进行购买。', '对百位、十位和个位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：百位选择大，十位选择单，个位选择双，开出**632即为中奖。', 'dsH3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '5', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30267', '后三和值尾数', '1', '3', '20.00', '17.00', '1', '303', '从0-9中选择1个号码。', '所选数值等于开奖号码的百位、十位、个位三数字相加之和的尾数，即为中奖', '投注方案：和值尾数8，开奖号码：后三位和值尾数为8，即中得和值尾数', 'sxh3hzws', 'r1', 'r1', 'ssc_hz_h3', '0', '4', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30268', '组选60', '1', '3', '3333.33', '2833.33', '3', '301', '从“二重号”选择一个号码，“单号”中选择三个号码组成一注。', '选择1个二重号码和3个单号号码组成一注，所选的单号号码与开奖号码相同，且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z60', '', '', 'ssc_5x_z5_60', '0', '4', '840', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30269', '组选30', '1', '3', '6666.66', '5666.66', '3', '301', '从“二重号”选择两个号码，“单号”中选择一个号码组成一注。', '选择2个二重号和1个单号号码组成一注，所选的单号号码与开奖号码相同，且所选的2个二重号码分别在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z30', '', '', 'ssc_5x_z5_30', '0', '5', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30270', '组选20', '1', '3', '10000.00', '8500.00', '3', '301', '从“三重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个三重号码和2个单号号码组成一注，所选的单号号码与开奖号码相同，且所选三重号码在开奖号码中出现了3次，即为中奖。', '', 'dxwf5z20', '', '', 'ssc_5x_z5_20', '0', '6', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30271', '组选10', '1', '3', '20000.00', '17000.00', '2', '301', '从“三重号”选择一个号码，“二重号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z10', '', '', 'ssc_5x_z5_10', '0', '7', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30272', '组选5', '1', '3', '40000.00', '34000.00', '2', '301', '从“四重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z5', '', '', 'ssc_5x_z5_5', '0', '8', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30273', '组选24', '1', '3', '833.33', '708.33', '4', '302', '从0-9中选择4个号码组成一注。 ', '从0-9中任意选择4个号码组成一注，所选号码与开奖号码的后四位相同，且顺序不限，即为中奖。', '投注方案：1,2,3,4，开奖号码：5,4,3,2,1，即中组选24', 'dxwf4z24', '', '', 'ssc_4x_z4_24', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30275', '组选12', '1', '3', '1666.66', '1416.66', '3', '302', '从“二重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个二重号码和2个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选二重号码出现了2次，即为中奖。', '投注号码：1,25 开奖号码：5,1,1,2,5 即中组选12', 'dxwf4z12', '', '', 'ssc_4x_z4_12', '0', '8', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30276', '组选6', '1', '3', '3333.33', '2833.33', '3', '302', '从“二重号”选择两个号码组成一注。', '选择2个二重号码组成一注，在开奖号码后四位中，所选的2个二重号码分别出现了2次，即为中奖。', '投注方案：2,3   开奖号码：1,2,2,3,3   即中组选6', 'dxwf4z6', '', '', 'ssc_4x_z4_6', '0', '9', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30277', '组选4', '1', '3', '5000.00', '4250.00', '2', '302', '从“三重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选三重号码出现了3次，即为中奖。', '投注方案：3,1  开奖号码：5,3,3,3,1  即中组选4', 'dxwf4z4', '', '', 'ssc_4x_z4_4', '0', '10', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30278', '后三组选和值', '1', '3', '280.00', '280.00', '1', '304', '从1-26中选择1个号码。', '所选数值等于开奖号码百位、十位、个位三个数字相加之和(不含豹子号)，即为中奖。', '', 'sxzxH3hz', '', 'ds', 'ssc_z3h_hz', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30280', '后三直选跨度', '1', '3', '2000.00', '1700.00', '1', '303', '从0-9中选择1个号码。', '所选数值等于开奖号码的后3位最大与最小数字相减之差，即为中奖。', '投注方案：2 开奖号码：1,2,3,4,5 即中后三直选跨度', 'sxzxH3kd', '', '', 'ssc_h3_kd', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30279', '后三特殊号码', '0', '3', '6.00', '6.00', '1', '303', '选择一个号码形态。', '所选的号码特殊属性和开奖号码后3位的属性一致，即为中奖。其中：1.顺子号的个、十、百位不分顺序；2.对子号指的是开奖号码的后三位当中，任意2位数字相同的三位数号码。', '', 'sxzxH3ts', '', '', 'ssc_ts_h3', '0', '5', '3', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30283', '前三趣味二星', '0', '3', '90.00', '90.00', '3', '3011', '选择一个万位的大小号属性，并从千位、百位中至少各选1个号码。', '在千位、百位上至少各选1个号码，并从万位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfq3qw2x', '', '', 'qwwf_q3qw2x', '0', '4', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30284', '后三趣味二星', '0', '3', '90.00', '90.00', '3', '3011', '选择一个百位的大小号属性，并从十位、个位中至少各选1个号码。', '在个位、十位上至少各选1个号码，并从百位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfh3qw2x', '', '', 'qwwf_h3qw2x', '0', '5', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30285', '四码趣味三星', '0', '3', '950.00', '950.00', '4', '3011', '选择一个千位的大小号属性，并从百位、十位、个位中至少各选1个号码。', '在个位、十位、百位上至少各选1个号码，并从千位大小号中任选一种号码属性进行投注。其中，0-4为小号；5-9为大号', '', 'qwwf4mqw3x', '', '', 'qwwf_4mqw3x', '0', '6', '2000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30286', '五码趣味三星', '0', '3', '620.00', '620.00', '5', '3011', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中各任选一种进行投注。', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中分别任选一种号码属性进行投注。其中，0-4为“小号”；5-9为“大号”。', '', 'qwwf5mqw3x', '', '', 'qwwf_5mqw3x', '0', '7', '4000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30287', '中三复式', '1', '3', '2000.00', '1700.00', '3', '303', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '投注方案：1,2,3   开奖号码：0,1,2,3,4  即中 中三复试', 'sxwfz3fs', 'fs', 'fs', 'ssc_3x_z3fs', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30288', '中三单式', '1', '3', '2000.00', '1700.00', '3', '303', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '', 'sxwfz3ds', 'ds', 'ds', 'ssc_3x_z3ds', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30289', '中三组三', '1', '3', '666.66', '566.66', '2', '304', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：中三位221(顺序不限)，即中 中三组选三', 'sxzxz3z3', 'z3', 'fs', 'ssc_z3_z3', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('30290', '中三组六', '1', '3', '333.33', '283.33', '3', '304', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：中三位513(顺序不限)，即中 中三组选六。', 'sxzxz3z6', 'z6', 'fs', 'ssc_z3_z6', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('502', '五星复式', '1', '5', '196000.00', '170000.00', '5', '501', '从万位、千位、百位、十位、个位各选一个号码组成一注。', '从万位、千位、百位、十位、个位中选择一个5位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。', '投注方案：12345，开奖号码：12345，即中五星直选', 'dxwf5f', 'fs', 'fs', 'ssc', '1', '1', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('503', '五星单式', '1', '5', '196000.00', '170000.00', '5', '501', '手动输入号码，至少输入1个五位数号码组成一注。', '手动输入一个5位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位、个位相同，且顺序一致，即为中奖。', '如：输入1234567890，则你投两注分别为12345和67890，如果开奖号为12345，则你中奖一注。', 'dxwf5d', 'ds', 'ds', 'ssc_dx_5d', '0', '2', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('504', '前四复式', '1', '5', '19600.00', '17000.00', '4', '502', '从万位、千位、百位、十位各选一个号码组成一注。', '从万位、千位、百位、十位中选择一个4位数号码组成一注，所选号码与开奖号码前4位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4f', 'fs', 'fs', 'ssc_dx_q4f', '1', '4', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('505', '前四单式', '1', '5', '19600.00', '17000.00', '4', '502', '手动输入号码，至少输入1个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('506', '后四复式', '1', '5', '19600.00', '17000.00', '4', '502', '从千位、百位、十位、个位各选一个号码组成一注。', '从千位、百位、十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选', 'dxwfH4f', 'fs', 'fs', 'ssc_dx_h4f', '1', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('507', '后四单式', '1', '5', '20000.00', '17000.00', '4', '502', '手动输入号码，至少输入一个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的千位、百位、十位、个位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选。', 'dxwfH4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '7', '10000', '1000', '0.0000');
INSERT INTO `ssc_played` VALUES ('508', '任选四复式', '1', '5', '1960.00', '17000.00', '4', '5010', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。', 'dxwfR4f', 'fs', 'fs', 'ssc_dx_r4f', '1', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('509', '任选四单式', '1', '5', '1960.00', '17000.00', '4', '5010', '从万位、千位、百位、十位、个位中选择四个位置，至少手动输入一个四位数的号码组成一注。', ' 从万位、千位、百位、十位、个位中选择四个位置。至少手动输入一个四位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。1*345，则为中奖，如果是13*45或134*5等都不中奖。', 'dxwfR4d', 'rx4ds', 'ds', 'ssc_dx_r4d', '0', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5010', '前三复式', '1', '5', '1960.00', '1700.00', '3', '503', '从万位、千位、百位各选一个号码组成一注。', '从万位、千位、百位中选择一个三位数号码组成一注，所选号码与开奖号码前三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3f', 'fs', 'fs', 'ssc_3x_q3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5011', '前三单式', '1', '5', '1960.00', '1700.00', '3', '503', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的前三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5012', '后三复式', '1', '5', '1960.00', '1700.00', '3', '503', '从百位、十位、个位各选一个号码组成一注。', '从百位、十位、个位中选择一个三位数号码组成一注，所选号码与开奖号码后三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3f', 'fs', 'fs', 'ssc_3x_h3f', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5013', '后三单式', '1', '5', '1960.00', '1700.00', '3', '503', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的后三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5014', '任选三复式', '1', '5', '1960.00', '1700.00', '3', '5010', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，个位选3。开奖号码：12223，即中任三直选。', 'sxwfR3f', 'fs', 'fs', 'ssc_3x_r3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5015', '任选三单式', '1', '5', '1960.00', '1700.00', '3', '5010', '从万位、千位、百位、十位、个位中选择三个位置，至少手动输入一个三位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置。至少手动输入一个三位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、百位、个位，输入号码123。开奖号码：12223，即中任三直选。', 'sxwfR3d', 'rx3ds', 'ds', 'ssc_3x_r3d', '0', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5016', '前三组三', '1', '5', '666.66', '566.66', '2', '504', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：前三位221(顺序不限)，即中前三组选三', 'sxzxQ3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5017', '前三组六', '1', '5', '333.33', '283.33', '3', '504', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：前三位513(顺序不限)，即中前三组选六。', 'sxzxQ3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5018', '前三混合组选', '0', '5', '60.00', '0.00', '3', '504', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的前三位符合手动输入号码，即中前三组选三或前三组选六。', '投注方案：122、135。  开奖号码：前三位221(顺序不限)即中前三组选三，或前三位513(顺序不限)即中前三组选六。', 'sxzxQ3h', '', 'ds', 'ssc_3x_z3q', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5019', '后三组三', '1', '5', '666.66', '566.66', '2', '504', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成2注或2注以上，所选号码与开奖号码后三位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后三位221(顺序不限)，即中后三组选三。', 'sxzxH3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5020', '后三组六', '1', '5', '333.33', '283.33', '3', '504', '从0-9中任意选择3个或3个以上号码。', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的百位、十位、个位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：后三位513(顺序不限)，即中后三组选六。', 'sxzxH3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5021', '后三混合组选', '0', '5', '60.00', '0.00', '3', '504', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的后三位符合手动输入号码，即中后三组选三或后三组选六。', '投注方案：122、135。  开奖号码：后三位221(顺序不限)即中后三组选三，或后三位513(顺序不限)即中后三组选六', 'sxzxH3h', '', 'ds', 'ssc_3x_z3d', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5022', '任选三组三', '1', '5', '666.66', '566.66', '3', '5010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码01，开奖号码：90501，即中任三组三。', 'sxzxR3z3', 'z3', 'fs', 'ssc_z3_r3', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5023', '任选三组六', '1', '5', '333.33', '283.33', '3', '5010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三组六', 'sxzxR3z6', 'z6', 'fs', 'ssc_z3_r6', '1', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5024', '任选三混合组选', '0', '5', '60.00', '0.00', '3', '5010', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码构成一注(不含豹子)。', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码组成一注，三选号码与开奖号码的指定位置号码相同，且顺序不限，即为中奖', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三混合组选', 'sxzxR3h', '', 'ds', 'ssc_3x_rz3', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5025', '前二复式', '1', '5', '196.00', '170.00', '2', '505', '从万位、千位中至少各选1个号码组成一注。', '从万位、千位中选择一个2位数号码组成一注，所选号码与开奖号码的前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2f', 'fs', 'fs', 'ssc_2x_q2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5026', '前二单式', '1', '5', '196.00', '170.00', '2', '505', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2d', 'ds', 'ds', 'ssc_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5027', '后二复式', '1', '5', '196.00', '170.00', '2', '505', '从十位、个位中至少各选1个号码组成一注。', '从十位、个位中选择一个2位数号码组成一注，所选号码与开奖号码的后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2f', 'fs', 'fs', 'ssc_2x_h2f', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5028', '后二单式', '1', '5', '196.00', '170.00', '2', '505', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2d', 'ds', 'ds', 'ssc_2x_2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5029', '任选二复式', '1', '5', '196.00', '170.00', '2', '505', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注，所选号码与开奖号码指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：百位1，十位2  开奖号码：12123，即中任二直选', 'rxwfR2f', 'fs', 'fs', 'ssc_2x_r2f', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5030', '任选二单式', '1', '5', '196.00', '170.00', '2', '505', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置。至少手动输入一个两位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、个位，输入号码13。开奖号码：12223，即中任二直选。', 'rxwfR2d', 'rx2ds', 'ds', 'ssc_2x_r2d', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5031', '前二组选复式', '1', '5', '100.00', '85.00', '2', '506', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所择号码与开奖号码的万位、千位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5032', '前二组选单式', '1', '5', '100.00', '85.00', '2', '506', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的前二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2d', 'ds', 'ds', 'ssc_z2_d2', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5033', '后二组选复式', '1', '5', '100.00', '85.00', '2', '506', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个号码组成一注，所选号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2f', 'z2', 'fs', 'ssc_z2_f2', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5034', '后二组选单式', '1', '5', '100.00', '85.00', '2', '506', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2d', 'ds', 'ds', 'ssc_z2_d2', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5035', '任选二组选复式', '1', '5', '100.00', '85.00', '2', '506', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码构成一注。', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，选择号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2f', 'z2', 'fs', 'ssc_z2_r2', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5036', '任选二组选单式', '1', '5', '100.00', '85.00', '2', '506', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数号码组成一注，输入号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，输入号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2d', 'ds', 'ds', 'ssc_z2_rd', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5037', '五星定位胆', '1', '5', '19.60', '17.00', '1', '507', '在万位、千位、百位、十位、个位任意位置上任意选择1个或1个以上号码。', '从万位、千位、百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '投注方案：个位 1    开奖号码：个位 1，即中定位胆个位。', 'dwd5x', 'dwd', 'dd5x', 'ssc_5x_dw', '1', '0', '50', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5038', '后三一码', '1', '5', '6.99', '5.66', '0', '508', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码百位、十位、个位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：后三位至少出现1个1，即中后三一码不定位。', 'bddH3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '2', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5039', '前三一码', '1', '5', '6.99', '5.66', '0', '508', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码万位、千位、百位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：前三位至少出现1个1，即中前三一码不定位。', 'bddQ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '0', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5040', '中三一码', '1', '5', '6.99', '5.66', '0', '508', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码千位、百位、十位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：千位、百位、十位至少出现1个1，即中中三一码不定位。', 'bddZ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '1', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5041', '任三一码', '1', '5', '6.99', '5.66', '0', '508', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。开奖号码的指定位置包含所选号码，即为中奖。', '投注方案：选择位置：万位、十位、个位，选择号码 1   开奖号码：万位、十位、个位至少出现1个1，即中任三一码不定位。', 'bddR3', 'dwd', 'bdd', 'ssc_5x_r3', '1', '3', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5042', '前二大小单双', '1', '5', '7.76', '6.80', '0', '509', '从万位、千位中的“大、小、单、双”中至少各选一个组成一注。', '对万位和千位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：万位与千位为小双，即中前二大小单双。', 'dsQ2', 'dxds', 'dxds', 'ssc_dxds_q2', '1', '1', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5043', '后二大小单双', '1', '5', '7.76', '6.80', '0', '509', '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。', '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：十位与个位为小双，即中后二大小单双。', 'dsH2', 'dxds', 'dxds', 'ssc_dxds_h2', '1', '2', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('5044', '任选大小单双', '1', '5', '7.76', '6.80', '0', '509', '从万位、千位、百位、十位、个位中选定两个位置，且大、小、单、双至少各选一个组成一注。', '从万位、千位、百位、十位、个位中选定两个位置，对选定位置进行大、小、单、双形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：选择位置万位、十位，对应小双  开奖号码：万位与十位为小双，即中任选大小单双。', 'dsR2', 'dxds', 'dxds', 'ssc_dxds_r2', '1', '3', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50142', '前三二码', '0', '5', '31.16', '31.16', '2', '508', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个不同的号码组成，只要开奖号码的万位、千位、百位中包含所选号码，即为中奖。', '如：选择二码不定位12，前三位，至少出现1和2各一个即为中奖。', 'bdwQ32', 'r2', '', 'ssc_2x_bdw', '1', '5', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50143', '后三二码', '0', '5', '31.16', '31.16', '2', '508', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择12，前三位，至少出现1和2各一个即为中奖。', 'bdwH32', 'r2', '', 'ssc_2x_bdw', '1', '6', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50254', '一帆风顺', '1', '5', '4.64', '4.06', '1', '5011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中包含所选号码，即为中奖。', '投注方案：8，开奖号码:至少出现一个8，即中一帆风顺', 'qwwfyffs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50255', '好事成双', '1', '5', '23.71', '20.77', '1', '5011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现2次，即为中奖。', '投注方案：8，开奖号码:至少出现两个8，即中好事成双', 'qwwfhscs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '1', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50256', '三星报喜', '1', '5', '226.35', '198.33', '1', '5011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现3次，即为中奖。', '投注方案：8，开奖号码:至少出现三个8，即中三星报喜', 'qwwfsxbx', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '2', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50257', '四季发财', '1', '5', '4204.34', '3683.66', '1', '5011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现4次，即为中奖。', '投注方案：8，开奖号码:至少出现四个8，即中四季发财', 'qwwfsjfc', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '3', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50258', '组选120', '1', '5', '1666.66', '1416.66', '5', '501', '任意选择一个5位数号码组成一注，所选号码与开奖号码全部相同，顺序可不一致，即为中奖。', '如：12435，如果开奖号为54321，则你中奖一注。', '投注方案：1,2,3,4,5，开奖号码:出现1,2,3,4,5，即中组选120', 'dxwf5z120', 'zx120', '', 'ssc_5x_z5_120', '0', '3', '252', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50261', '五星三码', '0', '5', '38.72', '38.72', '3', '508', '从0-9中任意选择3个以上号码', '从0-9中选择3个号码，每注由3个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的3个号码，即为中奖。', '投注号码：1 2 3<br>\n开奖号码：至少出现1、2、3各一个，即中五星三码不定位。', 'bdw5x3m', 'r3', '', 'ssc_5x_3m_bdw', '0', '10', '120', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50262', '五星二码', '0', '5', '11.33', '11.33', '2', '508', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：至少出现1和2各一个，即中五星二码不定位。', 'bdw5x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '11', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50263', '四星二码', '0', '5', '17.37', '17.37', '2', '508', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：后四位，至少出现1和2各一个，即中四星二码不定位。', 'bdw4x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '12', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50264', '四星一码', '0', '5', '4.20', '4.20', '1', '508', '从0-9中任意选择1个以上号码', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码的千、百、十、个位中包含所选号码，即为中奖。', '投注方案：1<br>\n开奖号码：后四位，至少出现1个1，即中四星一码不定位。', 'bdw4x1m', 'r1sscqw', '', 'ssc_4x_1m_bdw', '0', '13', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50265', '前三大小单双', '1', '5', '15.52', '6.80', '0', '509', '对万位、千位和百位的“大小单双”形态进行购买。', '对万位、千位和百位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：万位选择大，千位选择单，百位选择双，开出632**即为中奖。', 'dsQ3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '4', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50266', '后三大小单双', '1', '5', '15.52', '6.80', '0', '509', '对百位、十位和个位的“大小单双”形态进行购买。', '对百位、十位和个位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：百位选择大，十位选择单，个位选择双，开出**632即为中奖。', 'dsH3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '5', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50267', '后三和值尾数', '1', '5', '19.60', '17.00', '1', '503', '从0-9中选择1个号码。', '所选数值等于开奖号码的百位、十位、个位三数字相加之和的尾数，即为中奖', '投注方案：和值尾数8，开奖号码：后三位和值尾数为8，即中得和值尾数', 'sxh3hzws', 'r1', 'r1', 'ssc_hz_h3', '0', '4', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50268', '组选60', '1', '5', '3333.33', '2833.33', '3', '501', '从“二重号”选择一个号码，“单号”中选择三个号码组成一注。', '选择1个二重号码和3个单号号码组成一注，所选的单号号码与开奖号码相同，且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z60', '', '', 'ssc_5x_z5_60', '0', '4', '840', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50269', '组选30', '1', '5', '6666.66', '5666.66', '3', '501', '从“二重号”选择两个号码，“单号”中选择一个号码组成一注。', '选择2个二重号和1个单号号码组成一注，所选的单号号码与开奖号码相同，且所选的2个二重号码分别在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z30', '', '', 'ssc_5x_z5_30', '0', '5', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50270', '组选20', '1', '5', '10000.00', '8500.00', '3', '501', '从“三重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个三重号码和2个单号号码组成一注，所选的单号号码与开奖号码相同，且所选三重号码在开奖号码中出现了3次，即为中奖。', '', 'dxwf5z20', '', '', 'ssc_5x_z5_20', '0', '6', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50271', '组选10', '1', '5', '19600.00', '17000.00', '2', '501', '从“三重号”选择一个号码，“二重号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z10', '', '', 'ssc_5x_z5_10', '0', '7', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50272', '组选5', '1', '5', '40000.00', '34000.00', '2', '501', '从“四重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z5', '', '', 'ssc_5x_z5_5', '0', '8', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50273', '组选24', '1', '5', '833.33', '708.33', '4', '502', '从0-9中选择4个号码组成一注。 ', '从0-9中任意选择4个号码组成一注，所选号码与开奖号码的后四位相同，且顺序不限，即为中奖。', '投注方案：1,2,3,4，开奖号码：5,4,3,2,1，即中组选24', 'dxwf4z24', '', '', 'ssc_4x_z4_24', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50275', '组选12', '1', '5', '1666.66', '1416.66', '3', '502', '从“二重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个二重号码和2个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选二重号码出现了2次，即为中奖。', '投注号码：1,25 开奖号码：5,1,1,2,5 即中组选12', 'dxwf4z12', '', '', 'ssc_4x_z4_12', '0', '8', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50276', '组选6', '1', '5', '3333.33', '2833.33', '3', '502', '从“二重号”选择两个号码组成一注。', '选择2个二重号码组成一注，在开奖号码后四位中，所选的2个二重号码分别出现了2次，即为中奖。', '投注方案：2,3   开奖号码：1,2,2,3,3   即中组选6', 'dxwf4z6', '', '', 'ssc_4x_z4_6', '0', '9', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50277', '组选4', '1', '5', '5000.00', '4250.00', '2', '502', '从“三重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选三重号码出现了3次，即为中奖。', '投注方案：3,1  开奖号码：5,3,3,3,1  即中组选4', 'dxwf4z4', '', '', 'ssc_4x_z4_4', '0', '10', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50278', '后三组选和值', '1', '5', '280.00', '256.00', '1', '504', '从1-26中选择1个号码。', '所选数值等于开奖号码百位、十位、个位三个数字相加之和(不含豹子号)，即为中奖。', '', 'sxzxH3hz', '', 'ds', 'ssc_z3h_hz', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50280', '后三直选跨度', '1', '5', '1960.00', '1700.00', '1', '503', '从0-9中选择1个号码。', '所选数值等于开奖号码的后3位最大与最小数字相减之差，即为中奖。', '投注方案：2 开奖号码：1,2,3,4,5 即中后三直选跨度', 'sxzxH3kd', '', '', 'ssc_h3_kd', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50279', '后三特殊号码', '0', '5', '6.00', '6.00', '1', '503', '选择一个号码形态。', '所选的号码特殊属性和开奖号码后3位的属性一致，即为中奖。其中：1.顺子号的个、十、百位不分顺序；2.对子号指的是开奖号码的后三位当中，任意2位数字相同的三位数号码。', '', 'sxzxH3ts', '', '', 'ssc_ts_h3', '0', '5', '3', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50283', '前三趣味二星', '0', '5', '90.00', '90.00', '3', '5011', '选择一个万位的大小号属性，并从千位、百位中至少各选1个号码。', '在千位、百位上至少各选1个号码，并从万位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfq3qw2x', '', '', 'qwwf_q3qw2x', '0', '4', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50284', '后三趣味二星', '0', '5', '90.00', '90.00', '3', '5011', '选择一个百位的大小号属性，并从十位、个位中至少各选1个号码。', '在个位、十位上至少各选1个号码，并从百位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfh3qw2x', '', '', 'qwwf_h3qw2x', '0', '5', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50285', '四码趣味三星', '0', '5', '950.00', '950.00', '4', '5011', '选择一个千位的大小号属性，并从百位、十位、个位中至少各选1个号码。', '在个位、十位、百位上至少各选1个号码，并从千位大小号中任选一种号码属性进行投注。其中，0-4为小号；5-9为大号', '', 'qwwf4mqw3x', '', '', 'qwwf_4mqw3x', '0', '6', '2000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50286', '五码趣味三星', '0', '5', '620.00', '620.00', '5', '5011', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中各任选一种进行投注。', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中分别任选一种号码属性进行投注。其中，0-4为“小号”；5-9为“大号”。', '', 'qwwf5mqw3x', '', '', 'qwwf_5mqw3x', '0', '7', '4000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50287', '中三复式', '1', '5', '1960.00', '1700.00', '3', '503', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '投注方案：1,2,3   开奖号码：0,1,2,3,4  即中 中三复试', 'sxwfz3fs', 'fs', 'fs', 'ssc_3x_z3fs', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50288', '中三单式', '1', '5', '1960.00', '1700.00', '3', '503', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '', 'sxwfz3ds', 'ds', 'ds', 'ssc_3x_z3ds', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50289', '中三组三', '1', '5', '666.66', '566.66', '2', '504', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：中三位221(顺序不限)，即中 中三组选三', 'sxzxz3z3', 'z3', 'fs', 'ssc_z3_z3', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('50290', '中三组六', '1', '5', '333.33', '283.33', '3', '504', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：中三位513(顺序不限)，即中 中三组选六。', 'sxzxz3z6', 'z6', 'fs', 'ssc_z3_z6', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1202', '五星复式', '1', '12', '200000.00', '170000.00', '5', '1201', '从万位、千位、百位、十位、个位各选一个号码组成一注。', '从万位、千位、百位、十位、个位中选择一个5位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。', '投注方案：12345，开奖号码：12345，即中五星直选', 'dxwf5f', 'fs', 'fs', 'ssc', '1', '1', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('1203', '五星单式', '1', '12', '200000.00', '170000.00', '5', '1201', '手动输入号码，至少输入1个五位数号码组成一注。', '手动输入一个5位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位、个位相同，且顺序一致，即为中奖。', '如：输入1234567890，则你投两注分别为12345和67890，如果开奖号为12345，则你中奖一注。', 'dxwf5d', 'ds', 'ds', 'ssc_dx_5d', '0', '2', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('1204', '前四复式', '1', '12', '20000.00', '17000.00', '4', '1202', '从万位、千位、百位、十位各选一个号码组成一注。', '从万位、千位、百位、十位中选择一个4位数号码组成一注，所选号码与开奖号码前4位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4f', 'fs', 'fs', 'ssc_dx_q4f', '1', '4', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1205', '前四单式', '1', '12', '20000.00', '17000.00', '4', '1202', '手动输入号码，至少输入1个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1206', '后四复式', '1', '12', '20000.00', '17000.00', '4', '1202', '从千位、百位、十位、个位各选一个号码组成一注。', '从千位、百位、十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选', 'dxwfH4f', 'fs', 'fs', 'ssc_dx_h4f', '1', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1207', '后四单式', '1', '12', '20000.00', '17000.00', '4', '1202', '手动输入号码，至少输入一个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的千位、百位、十位、个位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选。', 'dxwfH4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '7', '10000', '1000', '0.0000');
INSERT INTO `ssc_played` VALUES ('1208', '任选四复式', '1', '12', '20000.00', '17000.00', '4', '12010', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。', 'dxwfR4f', 'fs', 'fs', 'ssc_dx_r4f', '1', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1209', '任选四单式', '1', '12', '20000.00', '17000.00', '4', '12010', '从万位、千位、百位、十位、个位中选择四个位置，至少手动输入一个四位数的号码组成一注。', ' 从万位、千位、百位、十位、个位中选择四个位置。至少手动输入一个四位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。1*345，则为中奖，如果是13*45或134*5等都不中奖。', 'dxwfR4d', 'rx4ds', 'ds', 'ssc_dx_r4d', '0', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12010', '前三复式', '1', '12', '2000.00', '1700.00', '3', '1203', '从万位、千位、百位各选一个号码组成一注。', '从万位、千位、百位中选择一个三位数号码组成一注，所选号码与开奖号码前三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3f', 'fs', 'fs', 'ssc_3x_q3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12011', '前三单式', '1', '12', '2000.00', '1700.00', '3', '1203', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的前三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12012', '后三复式', '1', '12', '2000.00', '1700.00', '3', '1203', '从百位、十位、个位各选一个号码组成一注。', '从百位、十位、个位中选择一个三位数号码组成一注，所选号码与开奖号码后三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3f', 'fs', 'fs', 'ssc_3x_h3f', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12013', '后三单式', '1', '12', '2000.00', '1700.00', '3', '1203', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的后三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12014', '任选三复式', '1', '12', '2000.00', '1700.00', '3', '12010', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，个位选3。开奖号码：12223，即中任三直选。', 'sxwfR3f', 'fs', 'fs', 'ssc_3x_r3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12015', '任选三单式', '1', '12', '2000.00', '1700.00', '3', '12010', '从万位、千位、百位、十位、个位中选择三个位置，至少手动输入一个三位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置。至少手动输入一个三位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、百位、个位，输入号码123。开奖号码：12223，即中任三直选。', 'sxwfR3d', 'rx3ds', 'ds', 'ssc_3x_r3d', '0', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12016', '前三组三', '1', '12', '666.66', '566.66', '2', '1204', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：前三位221(顺序不限)，即中前三组选三', 'sxzxQ3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12017', '前三组六', '1', '12', '333.33', '283.33', '3', '1204', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：前三位513(顺序不限)，即中前三组选六。', 'sxzxQ3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12018', '前三混合组选', '0', '12', '60.00', '0.00', '3', '1204', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的前三位符合手动输入号码，即中前三组选三或前三组选六。', '投注方案：122、135。  开奖号码：前三位221(顺序不限)即中前三组选三，或前三位513(顺序不限)即中前三组选六。', 'sxzxQ3h', '', 'ds', 'ssc_3x_z3q', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12019', '后三组三', '1', '12', '666.66', '566.66', '2', '1204', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成2注或2注以上，所选号码与开奖号码后三位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后三位221(顺序不限)，即中后三组选三。', 'sxzxH3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12020', '后三组六', '1', '12', '333.33', '283.33', '3', '1204', '从0-9中任意选择3个或3个以上号码。', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的百位、十位、个位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：后三位513(顺序不限)，即中后三组选六。', 'sxzxH3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12021', '后三混合组选', '0', '12', '60.00', '0.00', '3', '1204', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的后三位符合手动输入号码，即中后三组选三或后三组选六。', '投注方案：122、135。  开奖号码：后三位221(顺序不限)即中后三组选三，或后三位513(顺序不限)即中后三组选六', 'sxzxH3h', '', 'ds', 'ssc_3x_z3d', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12022', '任选三组三', '1', '12', '666.66', '566.66', '3', '12010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码01，开奖号码：90501，即中任三组三。', 'sxzxR3z3', 'z3', 'fs', 'ssc_z3_r3', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12023', '任选三组六', '1', '12', '333.33', '283.33', '3', '12010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三组六', 'sxzxR3z6', 'z6', 'fs', 'ssc_z3_r6', '1', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12024', '任选三混合组选', '0', '12', '60.00', '0.00', '3', '12010', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码构成一注(不含豹子)。', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码组成一注，三选号码与开奖号码的指定位置号码相同，且顺序不限，即为中奖', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三混合组选', 'sxzxR3h', '', 'ds', 'ssc_3x_rz3', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12025', '前二复式', '1', '12', '200.00', '170.00', '2', '1205', '从万位、千位中至少各选1个号码组成一注。', '从万位、千位中选择一个2位数号码组成一注，所选号码与开奖号码的前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2f', 'fs', 'fs', 'ssc_2x_q2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12026', '前二单式', '1', '12', '200.00', '170.00', '2', '1205', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2d', 'ds', 'ds', 'ssc_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12027', '后二复式', '1', '12', '200.00', '170.00', '2', '1205', '从十位、个位中至少各选1个号码组成一注。', '从十位、个位中选择一个2位数号码组成一注，所选号码与开奖号码的后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2f', 'fs', 'fs', 'ssc_2x_h2f', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12028', '后二单式', '1', '12', '200.00', '170.00', '2', '1205', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2d', 'ds', 'ds', 'ssc_2x_2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12029', '任选二复式', '1', '12', '200.00', '170.00', '2', '1205', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注，所选号码与开奖号码指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：百位1，十位2  开奖号码：12123，即中任二直选', 'rxwfR2f', 'fs', 'fs', 'ssc_2x_r2f', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12030', '任选二单式', '1', '12', '200.00', '170.00', '2', '1205', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置。至少手动输入一个两位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、个位，输入号码13。开奖号码：12223，即中任二直选。', 'rxwfR2d', 'rx2ds', 'ds', 'ssc_2x_r2d', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12031', '前二组选复式', '1', '12', '100.00', '85.00', '2', '1206', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所择号码与开奖号码的万位、千位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12032', '前二组选单式', '1', '12', '100.00', '85.00', '2', '1206', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的前二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2d', 'ds', 'ds', 'ssc_z2_d2', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12033', '后二组选复式', '1', '12', '100.00', '85.00', '2', '1206', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个号码组成一注，所选号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2f', 'z2', 'fs', 'ssc_z2_f2', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12034', '后二组选单式', '1', '12', '100.00', '85.00', '2', '1206', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2d', 'ds', 'ds', 'ssc_z2_d2', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12035', '任选二组选复式', '1', '12', '100.00', '85.00', '2', '1206', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码构成一注。', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，选择号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2f', 'z2', 'fs', 'ssc_z2_r2', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12036', '任选二组选单式', '1', '12', '100.00', '85.00', '2', '1206', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数号码组成一注，输入号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，输入号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2d', 'ds', 'ds', 'ssc_z2_rd', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12037', '五星定位胆', '1', '12', '20.00', '17.00', '1', '1207', '在万位、千位、百位、十位、个位任意位置上任意选择1个或1个以上号码。', '从万位、千位、百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '投注方案：个位 1    开奖号码：个位 1，即中定位胆个位。', 'dwd5x', 'dwd', 'dd5x', 'ssc_5x_dw', '1', '0', '50', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12038', '后三一码', '1', '12', '6.99', '5.66', '0', '1208', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码百位、十位、个位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：后三位至少出现1个1，即中后三一码不定位。', 'bddH3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '2', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12039', '前三一码', '1', '12', '6.99', '5.66', '0', '1208', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码万位、千位、百位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：前三位至少出现1个1，即中前三一码不定位。', 'bddQ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '0', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12040', '中三一码', '1', '12', '6.99', '5.66', '0', '1208', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码千位、百位、十位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：千位、百位、十位至少出现1个1，即中中三一码不定位。', 'bddZ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '1', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12041', '任三一码', '1', '12', '6.99', '5.66', '0', '1208', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。开奖号码的指定位置包含所选号码，即为中奖。', '投注方案：选择位置：万位、十位、个位，选择号码 1   开奖号码：万位、十位、个位至少出现1个1，即中任三一码不定位。', 'bddR3', 'dwd', 'bdd', 'ssc_5x_r3', '1', '3', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12042', '前二大小单双', '1', '12', '7.76', '6.80', '0', '1209', '从万位、千位中的“大、小、单、双”中至少各选一个组成一注。', '对万位和千位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：万位与千位为小双，即中前二大小单双。', 'dsQ2', 'dxds', 'dxds', 'ssc_dxds_q2', '1', '1', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12043', '后二大小单双', '1', '12', '7.76', '6.80', '0', '1209', '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。', '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：十位与个位为小双，即中后二大小单双。', 'dsH2', 'dxds', 'dxds', 'ssc_dxds_h2', '1', '2', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('12044', '任选大小单双', '1', '12', '7.76', '6.80', '0', '1209', '从万位、千位、百位、十位、个位中选定两个位置，且大、小、单、双至少各选一个组成一注。', '从万位、千位、百位、十位、个位中选定两个位置，对选定位置进行大、小、单、双形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：选择位置万位、十位，对应小双  开奖号码：万位与十位为小双，即中任选大小单双。', 'dsR2', 'dxds', 'dxds', 'ssc_dxds_r2', '1', '3', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120142', '前三二码', '0', '12', '31.16', '31.16', '2', '1208', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个不同的号码组成，只要开奖号码的万位、千位、百位中包含所选号码，即为中奖。', '如：选择二码不定位12，前三位，至少出现1和2各一个即为中奖。', 'bdwQ32', 'r2', '', 'ssc_2x_bdw', '1', '5', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120143', '后三二码', '0', '12', '31.16', '31.16', '2', '1208', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择12，前三位，至少出现1和2各一个即为中奖。', 'bdwH32', 'r2', '', 'ssc_2x_bdw', '1', '6', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120254', '一帆风顺', '1', '12', '4.64', '4.06', '1', '12011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中包含所选号码，即为中奖。', '投注方案：8，开奖号码:至少出现一个8，即中一帆风顺', 'qwwfyffs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120255', '好事成双', '1', '12', '23.71', '20.77', '1', '12011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现2次，即为中奖。', '投注方案：8，开奖号码:至少出现两个8，即中好事成双', 'qwwfhscs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '1', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120256', '三星报喜', '1', '12', '226.35', '198.33', '1', '12011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现3次，即为中奖。', '投注方案：8，开奖号码:至少出现三个8，即中三星报喜', 'qwwfsxbx', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '2', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120257', '四季发财', '1', '12', '4204.34', '3683.66', '1', '12011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现4次，即为中奖。', '投注方案：8，开奖号码:至少出现四个8，即中四季发财', 'qwwfsjfc', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '3', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120258', '组选120', '1', '12', '1666.66', '1416.66', '5', '1201', '任意选择一个5位数号码组成一注，所选号码与开奖号码全部相同，顺序可不一致，即为中奖。', '如：12435，如果开奖号为54321，则你中奖一注。', '投注方案：1,2,3,4,5，开奖号码:出现1,2,3,4,5，即中组选120', 'dxwf5z120', 'zx120', '', 'ssc_5x_z5_120', '0', '3', '252', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120261', '五星三码', '0', '12', '38.72', '38.72', '3', '1208', '从0-9中任意选择3个以上号码', '从0-9中选择3个号码，每注由3个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的3个号码，即为中奖。', '投注号码：1 2 3<br>\n开奖号码：至少出现1、2、3各一个，即中五星三码不定位。', 'bdw5x3m', 'r3', '', 'ssc_5x_3m_bdw', '0', '10', '120', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120262', '五星二码', '0', '12', '11.33', '11.33', '2', '1208', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：至少出现1和2各一个，即中五星二码不定位。', 'bdw5x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '11', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120263', '四星二码', '0', '12', '17.37', '17.37', '2', '1208', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：后四位，至少出现1和2各一个，即中四星二码不定位。', 'bdw4x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '12', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120264', '四星一码', '0', '12', '4.20', '4.20', '1', '1208', '从0-9中任意选择1个以上号码', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码的千、百、十、个位中包含所选号码，即为中奖。', '投注方案：1<br>\n开奖号码：后四位，至少出现1个1，即中四星一码不定位。', 'bdw4x1m', 'r1sscqw', '', 'ssc_4x_1m_bdw', '0', '13', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120265', '前三大小单双', '1', '12', '15.52', '6.80', '0', '1209', '对万位、千位和百位的“大小单双”形态进行购买。', '对万位、千位和百位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：万位选择大，千位选择单，百位选择双，开出632**即为中奖。', 'dsQ3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '4', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120266', '后三大小单双', '1', '12', '15.52', '6.80', '0', '1209', '对百位、十位和个位的“大小单双”形态进行购买。', '对百位、十位和个位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：百位选择大，十位选择单，个位选择双，开出**632即为中奖。', 'dsH3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '5', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120267', '后三和值尾数', '1', '12', '20.00', '17.00', '1', '1203', '从0-9中选择1个号码。', '所选数值等于开奖号码的百位、十位、个位三数字相加之和的尾数，即为中奖', '投注方案：和值尾数8，开奖号码：后三位和值尾数为8，即中得和值尾数', 'sxh3hzws', 'r1', 'r1', 'ssc_hz_h3', '0', '4', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120268', '组选60', '1', '12', '3333.33', '2833.33', '3', '1201', '从“二重号”选择一个号码，“单号”中选择三个号码组成一注。', '选择1个二重号码和3个单号号码组成一注，所选的单号号码与开奖号码相同，且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z60', '', '', 'ssc_5x_z5_60', '0', '4', '840', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120269', '组选30', '1', '12', '6666.66', '5666.66', '3', '1201', '从“二重号”选择两个号码，“单号”中选择一个号码组成一注。', '选择2个二重号和1个单号号码组成一注，所选的单号号码与开奖号码相同，且所选的2个二重号码分别在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z30', '', '', 'ssc_5x_z5_30', '0', '5', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120270', '组选20', '1', '12', '10000.00', '8500.00', '3', '1201', '从“三重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个三重号码和2个单号号码组成一注，所选的单号号码与开奖号码相同，且所选三重号码在开奖号码中出现了3次，即为中奖。', '', 'dxwf5z20', '', '', 'ssc_5x_z5_20', '0', '6', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120271', '组选10', '1', '12', '20000.00', '17000.00', '2', '1201', '从“三重号”选择一个号码，“二重号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z10', '', '', 'ssc_5x_z5_10', '0', '7', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120272', '组选5', '1', '12', '40000.00', '34000.00', '2', '1201', '从“四重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z5', '', '', 'ssc_5x_z5_5', '0', '8', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120273', '组选24', '1', '12', '833.33', '708.33', '4', '1202', '从0-9中选择4个号码组成一注。 ', '从0-9中任意选择4个号码组成一注，所选号码与开奖号码的后四位相同，且顺序不限，即为中奖。', '投注方案：1,2,3,4，开奖号码：5,4,3,2,1，即中组选24', 'dxwf4z24', '', '', 'ssc_4x_z4_24', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120275', '组选12', '1', '12', '1666.66', '1416.66', '3', '1202', '从“二重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个二重号码和2个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选二重号码出现了2次，即为中奖。', '投注号码：1,25 开奖号码：5,1,1,2,5 即中组选12', 'dxwf4z12', '', '', 'ssc_4x_z4_12', '0', '8', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120276', '组选6', '1', '12', '3333.33', '2833.33', '3', '1202', '从“二重号”选择两个号码组成一注。', '选择2个二重号码组成一注，在开奖号码后四位中，所选的2个二重号码分别出现了2次，即为中奖。', '投注方案：2,3   开奖号码：1,2,2,3,3   即中组选6', 'dxwf4z6', '', '', 'ssc_4x_z4_6', '0', '9', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120277', '组选4', '1', '12', '5000.00', '4250.00', '2', '1202', '从“三重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选三重号码出现了3次，即为中奖。', '投注方案：3,1  开奖号码：5,3,3,3,1  即中组选4', 'dxwf4z4', '', '', 'ssc_4x_z4_4', '0', '10', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120278', '后三组选和值', '1', '12', '280.00', '280.00', '1', '1204', '从1-26中选择1个号码。', '所选数值等于开奖号码百位、十位、个位三个数字相加之和(不含豹子号)，即为中奖。', '', 'sxzxH3hz', '', 'ds', 'ssc_z3h_hz', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120280', '后三直选跨度', '1', '12', '2000.00', '1700.00', '1', '1203', '从0-9中选择1个号码。', '所选数值等于开奖号码的后3位最大与最小数字相减之差，即为中奖。', '投注方案：2 开奖号码：1,2,3,4,5 即中后三直选跨度', 'sxzxH3kd', '', '', 'ssc_h3_kd', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120279', '后三特殊号码', '0', '12', '6.00', '6.00', '1', '1204', '选择一个号码形态。', '所选的号码特殊属性和开奖号码后3位的属性一致，即为中奖。其中：1.顺子号的个、十、百位不分顺序；2.对子号指的是开奖号码的后三位当中，任意2位数字相同的三位数号码。', '', 'sxzxH3ts', '', '', 'ssc_ts_h3', '0', '5', '3', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120283', '前三趣味二星', '0', '12', '90.00', '90.00', '3', '12011', '选择一个万位的大小号属性，并从千位、百位中至少各选1个号码。', '在千位、百位上至少各选1个号码，并从万位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfq3qw2x', '', '', 'qwwf_q3qw2x', '0', '4', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120284', '后三趣味二星', '0', '12', '90.00', '90.00', '3', '12011', '选择一个百位的大小号属性，并从十位、个位中至少各选1个号码。', '在个位、十位上至少各选1个号码，并从百位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfh3qw2x', '', '', 'qwwf_h3qw2x', '0', '5', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120285', '四码趣味三星', '0', '12', '950.00', '950.00', '4', '12011', '选择一个千位的大小号属性，并从百位、十位、个位中至少各选1个号码。', '在个位、十位、百位上至少各选1个号码，并从千位大小号中任选一种号码属性进行投注。其中，0-4为小号；5-9为大号', '', 'qwwf4mqw3x', '', '', 'qwwf_4mqw3x', '0', '6', '2000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120286', '五码趣味三星', '0', '12', '620.00', '620.00', '5', '12011', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中各任选一种进行投注。', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中分别任选一种号码属性进行投注。其中，0-4为“小号”；5-9为“大号”。', '', 'qwwf5mqw3x', '', '', 'qwwf_5mqw3x', '0', '7', '4000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120287', '中三复式', '1', '12', '2000.00', '1700.00', '3', '1203', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '投注方案：1,2,3   开奖号码：0,1,2,3,4  即中 中三复试', 'sxwfz3fs', 'fs', 'fs', 'ssc_3x_z3fs', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120288', '中三单式', '1', '12', '2000.00', '1700.00', '3', '1203', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '', 'sxwfz3ds', 'ds', 'ds', 'ssc_3x_z3ds', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120289', '中三组三', '1', '12', '666.66', '566.66', '2', '1204', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：中三位221(顺序不限)，即中 中三组选三', 'sxzxz3z3', 'z3', 'fs', 'ssc_z3_z3', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('120290', '中三组六', '1', '12', '333.33', '283.33', '3', '1204', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：中三位513(顺序不限)，即中 中三组选六。', 'sxzxz3z6', 'z6', 'fs', 'ssc_z3_z6', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1402', '五星复式', '1', '14', '196000.00', '170000.00', '5', '1401', '从万位、千位、百位、十位、个位各选一个号码组成一注。', '从万位、千位、百位、十位、个位中选择一个5位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。', '投注方案：12345，开奖号码：12345，即中五星直选', 'dxwf5f', 'fs', 'fs', 'ssc', '1', '1', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('1403', '五星单式', '1', '14', '196000.00', '170000.00', '5', '1401', '手动输入号码，至少输入1个五位数号码组成一注。', '手动输入一个5位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位、个位相同，且顺序一致，即为中奖。', '如：输入1234567890，则你投两注分别为12345和67890，如果开奖号为12345，则你中奖一注。', 'dxwf5d', 'ds', 'ds', 'ssc_dx_5d', '0', '2', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('1404', '前四复式', '1', '14', '19600.00', '17000.00', '4', '1402', '从万位、千位、百位、十位各选一个号码组成一注。', '从万位、千位、百位、十位中选择一个4位数号码组成一注，所选号码与开奖号码前4位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4f', 'fs', 'fs', 'ssc_dx_q4f', '1', '1', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1405', '前四单式', '1', '14', '19600.00', '17000.00', '4', '1402', '手动输入号码，至少输入1个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '2', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1406', '后四复式', '1', '14', '19600.00', '17000.00', '4', '1402', '从千位、百位、十位、个位各选一个号码组成一注。', '从千位、百位、十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选', 'dxwfH4f', 'fs', 'fs', 'ssc_dx_h4f', '1', '3', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1407', '后四单式', '1', '14', '19600.00', '17000.00', '4', '1402', '手动输入号码，至少输入一个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的千位、百位、十位、个位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选。', 'dxwfH4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '4', '10000', '1000', '0.0000');
INSERT INTO `ssc_played` VALUES ('1408', '任选四复式', '1', '14', '19600.00', '17000.00', '4', '14010', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。', 'dxwfR4f', 'fs', 'fs', 'ssc_dx_r4f', '1', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1409', '任选四单式', '1', '14', '19600.00', '17000.00', '4', '14010', '从万位、千位、百位、十位、个位中选择四个位置，至少手动输入一个四位数的号码组成一注。', ' 从万位、千位、百位、十位、个位中选择四个位置。至少手动输入一个四位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。1*345，则为中奖，如果是13*45或134*5等都不中奖。', 'dxwfR4d', 'rx4ds', 'ds', 'ssc_dx_r4d', '0', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14010', '前三复式', '1', '14', '1960.00', '1700.00', '3', '1403', '从万位、千位、百位各选一个号码组成一注。', '从万位、千位、百位中选择一个三位数号码组成一注，所选号码与开奖号码前三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3f', 'fs', 'fs', 'ssc_3x_q3f', '1', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14011', '前三单式', '1', '14', '1960.00', '1700.00', '3', '1403', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的前三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14012', '后三复式', '1', '14', '1960.00', '1700.00', '3', '1403', '从百位、十位、个位各选一个号码组成一注。', '从百位、十位、个位中选择一个三位数号码组成一注，所选号码与开奖号码后三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3f', 'fs', 'fs', 'ssc_3x_h3f', '1', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14013', '后三单式', '1', '14', '1960.00', '1700.00', '3', '1403', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的后三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14014', '任选三复式', '1', '14', '1960.00', '1700.00', '3', '14010', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，个位选3。开奖号码：12223，即中任三直选。', 'sxwfR3f', 'fs', 'fs', 'ssc_3x_r3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14015', '任选三单式', '1', '14', '1960.00', '1700.00', '3', '14010', '从万位、千位、百位、十位、个位中选择三个位置，至少手动输入一个三位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置。至少手动输入一个三位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、百位、个位，输入号码123。开奖号码：12223，即中任三直选。', 'sxwfR3d', 'rx3ds', 'ds', 'ssc_3x_r3d', '0', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14016', '前三组三', '1', '14', '666.66', '566.66', '2', '1404', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：前三位221(顺序不限)，即中前三组选三', 'sxzxQ3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14017', '前三组六', '1', '14', '333.33', '283.33', '3', '1404', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：前三位513(顺序不限)，即中前三组选六。', 'sxzxQ3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14018', '前三混合组选', '0', '14', '60.00', '0.00', '3', '1404', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的前三位符合手动输入号码，即中前三组选三或前三组选六。', '投注方案：122、135。  开奖号码：前三位221(顺序不限)即中前三组选三，或前三位513(顺序不限)即中前三组选六。', 'sxzxQ3h', '', 'ds', 'ssc_3x_z3q', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14019', '后三组三', '1', '14', '666.66', '566.66', '2', '1404', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成2注或2注以上，所选号码与开奖号码后三位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后三位221(顺序不限)，即中后三组选三。', 'sxzxH3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14020', '后三组六', '1', '14', '333.33', '283.33', '3', '1404', '从0-9中任意选择3个或3个以上号码。', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的百位、十位、个位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：后三位513(顺序不限)，即中后三组选六。', 'sxzxH3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14021', '后三混合组选', '0', '14', '60.00', '0.00', '3', '1404', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的后三位符合手动输入号码，即中后三组选三或后三组选六。', '投注方案：122、135。  开奖号码：后三位221(顺序不限)即中后三组选三，或后三位513(顺序不限)即中后三组选六', 'sxzxH3h', '', 'ds', 'ssc_3x_z3d', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14022', '任选三组三', '1', '14', '666.66', '566.66', '3', '14010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码01，开奖号码：90501，即中任三组三。', 'sxzxR3z3', 'z3', 'fs', 'ssc_z3_r3', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14023', '任选三组六', '1', '14', '333.33', '283.33', '3', '14010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三组六', 'sxzxR3z6', 'z6', 'fs', 'ssc_z3_r6', '1', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14024', '任选三混合组选', '0', '14', '60.00', '0.00', '3', '14010', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码构成一注(不含豹子)。', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码组成一注，三选号码与开奖号码的指定位置号码相同，且顺序不限，即为中奖', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三混合组选', 'sxzxR3h', '', 'ds', 'ssc_3x_rz3', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14025', '前二复式', '1', '14', '196.00', '170.00', '2', '1405', '从万位、千位中至少各选1个号码组成一注。', '从万位、千位中选择一个2位数号码组成一注，所选号码与开奖号码的前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2f', 'fs', 'fs', 'ssc_2x_q2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14026', '前二单式', '1', '14', '196.00', '170.00', '2', '1405', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2d', 'ds', 'ds', 'ssc_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14027', '后二复式', '1', '14', '196.00', '170.00', '2', '1405', '从十位、个位中至少各选1个号码组成一注。', '从十位、个位中选择一个2位数号码组成一注，所选号码与开奖号码的后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2f', 'fs', 'fs', 'ssc_2x_h2f', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14028', '后二单式', '1', '14', '196.00', '170.00', '2', '1405', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2d', 'ds', 'ds', 'ssc_2x_2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14029', '任选二复式', '1', '14', '196.00', '170.00', '2', '1405', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注，所选号码与开奖号码指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：百位1，十位2  开奖号码：12123，即中任二直选', 'rxwfR2f', 'fs', 'fs', 'ssc_2x_r2f', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14030', '任选二单式', '1', '14', '196.00', '170.00', '2', '1405', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置。至少手动输入一个两位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、个位，输入号码13。开奖号码：12223，即中任二直选。', 'rxwfR2d', 'rx2ds', 'ds', 'ssc_2x_r2d', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14031', '前二组选复式', '1', '14', '100.00', '85.00', '2', '1406', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所择号码与开奖号码的万位、千位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14032', '前二组选单式', '1', '14', '100.00', '85.00', '2', '1406', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的前二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2d', 'ds', 'ds', 'ssc_z2_d2', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14033', '后二组选复式', '1', '14', '100.00', '85.00', '2', '1406', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个号码组成一注，所选号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2f', 'z2', 'fs', 'ssc_z2_f2', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14034', '后二组选单式', '1', '14', '100.00', '85.00', '2', '1406', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2d', 'ds', 'ds', 'ssc_z2_d2', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14035', '任选二组选复式', '1', '14', '100.00', '85.00', '2', '1406', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码构成一注。', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，选择号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2f', 'z2', 'fs', 'ssc_z2_r2', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14036', '任选二组选单式', '1', '14', '100.00', '85.00', '2', '1406', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数号码组成一注，输入号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，输入号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2d', 'ds', 'ds', 'ssc_z2_rd', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14037', '五星定位胆', '1', '14', '19.60', '17.00', '1', '1407', '在万位、千位、百位、十位、个位任意位置上任意选择1个或1个以上号码。', '从万位、千位、百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '投注方案：个位 1    开奖号码：个位 1，即中定位胆个位。', 'dwd5x', 'dwd', 'dd5x', 'ssc_5x_dw', '1', '0', '50', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14038', '后三一码', '1', '14', '6.99', '5.66', '0', '1408', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码百位、十位、个位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：后三位至少出现1个1，即中后三一码不定位。', 'bddH3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '8', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14039', '前三一码', '1', '14', '6.99', '5.66', '0', '1408', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码万位、千位、百位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：前三位至少出现1个1，即中前三一码不定位。', 'bddQ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '4', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14040', '中三一码', '1', '14', '6.99', '5.66', '0', '1408', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码千位、百位、十位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：千位、百位、十位至少出现1个1，即中中三一码不定位。', 'bddZ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '7', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14041', '任三一码', '1', '14', '6.99', '5.66', '0', '1408', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。开奖号码的指定位置包含所选号码，即为中奖。', '投注方案：选择位置：万位、十位、个位，选择号码 1   开奖号码：万位、十位、个位至少出现1个1，即中任三一码不定位。', 'bddR3', 'dwd', 'bdd', 'ssc_5x_r3', '1', '9', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14042', '前二大小单双', '1', '14', '7.76', '6.80', '0', '1409', '从万位、千位中的“大、小、单、双”中至少各选一个组成一注。', '对万位和千位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：万位与千位为小双，即中前二大小单双。', 'dsQ2', 'dxds', 'dxds', 'ssc_dxds_q2', '1', '1', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14043', '后二大小单双', '1', '14', '7.76', '6.80', '0', '1409', '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。', '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：十位与个位为小双，即中后二大小单双。', 'dsH2', 'dxds', 'dxds', 'ssc_dxds_h2', '1', '2', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('14044', '任选大小单双', '1', '14', '7.76', '6.80', '0', '1409', '从万位、千位、百位、十位、个位中选定两个位置，且大、小、单、双至少各选一个组成一注。', '从万位、千位、百位、十位、个位中选定两个位置，对选定位置进行大、小、单、双形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：选择位置万位、十位，对应小双  开奖号码：万位与十位为小双，即中任选大小单双。', 'dsR2', 'dxds', 'dxds', 'ssc_dxds_r2', '1', '3', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140142', '前三二码', '0', '14', '31.16', '31.16', '2', '1408', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个不同的号码组成，只要开奖号码的万位、千位、百位中包含所选号码，即为中奖。', '如：选择二码不定位12，前三位，至少出现1和2各一个即为中奖。', 'bdwQ32', 'r2', '', 'ssc_2x_bdw', '1', '5', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140143', '后三二码', '0', '14', '31.16', '31.16', '2', '1408', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择12，前三位，至少出现1和2各一个即为中奖。', 'bdwH32', 'r2', '', 'ssc_2x_bdw', '1', '8', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140254', '一帆风顺', '1', '14', '4.64', '4.06', '1', '14011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中包含所选号码，即为中奖。', '投注方案：8，开奖号码:至少出现一个8，即中一帆风顺', 'qwwfyffs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140255', '好事成双', '1', '14', '23.71', '20.77', '1', '14011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现2次，即为中奖。', '投注方案：8，开奖号码:至少出现两个8，即中好事成双', 'qwwfhscs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '1', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140256', '三星报喜', '1', '14', '226.35', '198.33', '1', '14011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现3次，即为中奖。', '投注方案：8，开奖号码:至少出现三个8，即中三星报喜', 'qwwfsxbx', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '2', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140257', '四季发财', '1', '14', '4204.34', '3683.66', '1', '14011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现4次，即为中奖。', '投注方案：8，开奖号码:至少出现四个8，即中四季发财', 'qwwfsjfc', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '3', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140258', '组选120', '1', '14', '1666.66', '1416.66', '5', '1401', '任意选择一个5位数号码组成一注，所选号码与开奖号码全部相同，顺序可不一致，即为中奖。', '如：12435，如果开奖号为54321，则你中奖一注。', '投注方案：1,2,3,4,5，开奖号码:出现1,2,3,4,5，即中组选120', 'dxwf5z120', 'zx120', '', 'ssc_5x_z5_120', '0', '3', '252', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140261', '五星三码', '0', '14', '38.72', '38.72', '3', '1408', '从0-9中任意选择3个以上号码', '从0-9中选择3个号码，每注由3个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的3个号码，即为中奖。', '投注号码：1 2 3<br>\n开奖号码：至少出现1、2、3各一个，即中五星三码不定位。', 'bdw5x3m', 'r3', '', 'ssc_5x_3m_bdw', '0', '0', '120', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140262', '五星二码', '0', '14', '11.33', '11.33', '2', '1408', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：至少出现1和2各一个，即中五星二码不定位。', 'bdw5x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '1', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140263', '四星二码', '0', '14', '17.37', '17.37', '2', '1408', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：后四位，至少出现1和2各一个，即中四星二码不定位。', 'bdw4x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '2', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140264', '四星一码', '0', '14', '4.20', '4.20', '1', '1408', '从0-9中任意选择1个以上号码', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码的千、百、十、个位中包含所选号码，即为中奖。', '投注方案：1<br>\n开奖号码：后四位，至少出现1个1，即中四星一码不定位。', 'bdw4x1m', 'r1sscqw', '', 'ssc_4x_1m_bdw', '0', '3', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140265', '前三大小单双', '1', '14', '15.52', '6.80', '0', '1409', '对万位、千位和百位的“大小单双”形态进行购买。', '对万位、千位和百位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：万位选择大，千位选择单，百位选择双，开出632**即为中奖。', 'dsQ3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '4', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140266', '后三大小单双', '1', '14', '15.52', '6.80', '0', '1409', '对百位、十位和个位的“大小单双”形态进行购买。', '对百位、十位和个位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：百位选择大，十位选择单，个位选择双，开出**632即为中奖。', 'dsH3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '5', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140267', '后三和值尾数', '1', '14', '19.60', '17.00', '1', '1403', '从0-9中选择1个号码。', '所选数值等于开奖号码的百位、十位、个位三数字相加之和的尾数，即为中奖', '投注方案：和值尾数8，开奖号码：后三位和值尾数为8，即中得和值尾数', 'sxh3hzws', 'r1', 'r1', 'ssc_hz_h3', '0', '4', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140268', '组选60', '1', '14', '3333.33', '2833.33', '3', '1401', '从“二重号”选择一个号码，“单号”中选择三个号码组成一注。', '选择1个二重号码和3个单号号码组成一注，所选的单号号码与开奖号码相同，且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z60', '', '', 'ssc_5x_z5_60', '0', '4', '840', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140269', '组选30', '1', '14', '6666.66', '5666.66', '3', '1401', '从“二重号”选择两个号码，“单号”中选择一个号码组成一注。', '选择2个二重号和1个单号号码组成一注，所选的单号号码与开奖号码相同，且所选的2个二重号码分别在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z30', '', '', 'ssc_5x_z5_30', '0', '5', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140270', '组选20', '1', '14', '10000.00', '8500.00', '3', '1401', '从“三重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个三重号码和2个单号号码组成一注，所选的单号号码与开奖号码相同，且所选三重号码在开奖号码中出现了3次，即为中奖。', '', 'dxwf5z20', '', '', 'ssc_5x_z5_20', '0', '6', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140271', '组选10', '1', '14', '20000.00', '17000.00', '2', '1401', '从“三重号”选择一个号码，“二重号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z10', '', '', 'ssc_5x_z5_10', '0', '7', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140272', '组选5', '1', '14', '40000.00', '34000.00', '2', '1401', '从“四重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z5', '', '', 'ssc_5x_z5_5', '0', '8', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140273', '组选24', '1', '14', '833.33', '708.33', '4', '1402', '从0-9中选择4个号码组成一注。 ', '从0-9中任意选择4个号码组成一注，所选号码与开奖号码的后四位相同，且顺序不限，即为中奖。', '投注方案：1,2,3,4，开奖号码：5,4,3,2,1，即中组选24', 'dxwf4z24', '', '', 'ssc_4x_z4_24', '0', '5', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140275', '组选12', '1', '14', '1666.66', '1416.66', '3', '1402', '从“二重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个二重号码和2个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选二重号码出现了2次，即为中奖。', '投注号码：1,25 开奖号码：5,1,1,2,5 即中组选12', 'dxwf4z12', '', '', 'ssc_4x_z4_12', '0', '8', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140276', '组选6', '1', '14', '3333.33', '2833.33', '3', '1402', '从“二重号”选择两个号码组成一注。', '选择2个二重号码组成一注，在开奖号码后四位中，所选的2个二重号码分别出现了2次，即为中奖。', '投注方案：2,3   开奖号码：1,2,2,3,3   即中组选6', 'dxwf4z6', '', '', 'ssc_4x_z4_6', '0', '9', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140277', '组选4', '1', '14', '5000.00', '4250.00', '2', '1402', '从“三重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选三重号码出现了3次，即为中奖。', '投注方案：3,1  开奖号码：5,3,3,3,1  即中组选4', 'dxwf4z4', '', '', 'ssc_4x_z4_4', '0', '10', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140278', '后三组选和值', '1', '14', '280.00', '280.00', '1', '1404', '从1-26中选择1个号码。', '所选数值等于开奖号码百位、十位、个位三个数字相加之和(不含豹子号)，即为中奖。', '', 'sxzxH3hz', '', 'ds', 'ssc_z3h_hz', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140280', '后三直选跨度', '1', '14', '1960.00', '1700.00', '1', '1403', '从0-9中选择1个号码。', '所选数值等于开奖号码的后3位最大与最小数字相减之差，即为中奖。', '投注方案：2 开奖号码：1,2,3,4,5 即中后三直选跨度', 'sxzxH3kd', '', '', 'ssc_h3_kd', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140279', '后三特殊号码', '0', '14', '6.00', '6.00', '1', '1403', '选择一个号码形态。', '所选的号码特殊属性和开奖号码后3位的属性一致，即为中奖。其中：1.顺子号的个、十、百位不分顺序；2.对子号指的是开奖号码的后三位当中，任意2位数字相同的三位数号码。', '', 'sxzxH3ts', '', '', 'ssc_ts_h3', '0', '5', '3', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140283', '前三趣味二星', '0', '14', '90.00', '90.00', '3', '14011', '选择一个万位的大小号属性，并从千位、百位中至少各选1个号码。', '在千位、百位上至少各选1个号码，并从万位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfq3qw2x', '', '', 'qwwf_q3qw2x', '0', '4', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140284', '后三趣味二星', '0', '14', '90.00', '90.00', '3', '14011', '选择一个百位的大小号属性，并从十位、个位中至少各选1个号码。', '在个位、十位上至少各选1个号码，并从百位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfh3qw2x', '', '', 'qwwf_h3qw2x', '0', '5', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140285', '四码趣味三星', '0', '14', '950.00', '950.00', '4', '14011', '选择一个千位的大小号属性，并从百位、十位、个位中至少各选1个号码。', '在个位、十位、百位上至少各选1个号码，并从千位大小号中任选一种号码属性进行投注。其中，0-4为小号；5-9为大号', '', 'qwwf4mqw3x', '', '', 'qwwf_4mqw3x', '0', '6', '2000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140286', '五码趣味三星', '0', '14', '620.00', '620.00', '5', '14011', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中各任选一种进行投注。', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中分别任选一种号码属性进行投注。其中，0-4为“小号”；5-9为“大号”。', '', 'qwwf5mqw3x', '', '', 'qwwf_5mqw3x', '0', '7', '4000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140287', '中三复式', '1', '14', '1960.00', '1700.00', '3', '1403', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '投注方案：1,2,3   开奖号码：0,1,2,3,4  即中 中三复试', 'sxwfz3fs', 'fs', 'fs', 'ssc_3x_z3fs', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140288', '中三单式', '1', '14', '1960.00', '1700.00', '3', '1403', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '', 'sxwfz3ds', 'ds', 'ds', 'ssc_3x_z3ds', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140289', '中三组三', '1', '14', '666.66', '566.66', '2', '1404', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：中三位221(顺序不限)，即中 中三组选三', 'sxzxz3z3', 'z3', 'fs', 'ssc_z3_z3', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('140290', '中三组六', '1', '14', '333.33', '283.33', '3', '1404', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：中三位513(顺序不限)，即中 中三组选六。', 'sxzxz3z6', 'z6', 'fs', 'ssc_z3_z6', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('2602', '五星复式', '1', '26', '196000.00', '170000.00', '5', '2601', '从万位、千位、百位、十位、个位各选一个号码组成一注。', '从万位、千位、百位、十位、个位中选择一个5位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。', '投注方案：12345，开奖号码：12345，即中五星直选', 'dxwf5f', 'fs', 'fs', 'ssc', '1', '1', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('2603', '五星单式', '1', '26', '196000.00', '170000.00', '5', '2601', '手动输入号码，至少输入1个五位数号码组成一注。', '手动输入一个5位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位、个位相同，且顺序一致，即为中奖。', '如：输入1234567890，则你投两注分别为12345和67890，如果开奖号为12345，则你中奖一注。', 'dxwf5d', 'ds', 'ds', 'ssc_dx_5d', '0', '2', '100000', '75000', '0.0000');
INSERT INTO `ssc_played` VALUES ('2604', '前四复式', '1', '26', '19600.00', '17000.00', '4', '2602', '从万位、千位、百位、十位各选一个号码组成一注。', '从万位、千位、百位、十位中选择一个4位数号码组成一注，所选号码与开奖号码前4位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4f', 'fs', 'fs', 'ssc_dx_q4f', '1', '4', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('2605', '前四单式', '1', '26', '19600.00', '17000.00', '4', '2602', '手动输入号码，至少输入1个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的万位、千位、百位、十位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中前四直选', 'dxwfQ4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('2606', '后四复式', '1', '26', '19600.00', '17000.00', '4', '2602', '从千位、百位、十位、个位各选一个号码组成一注。', '从千位、百位、十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选', 'dxwfH4f', 'fs', 'fs', 'ssc_dx_h4f', '1', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('2607', '后四单式', '1', '26', '19600.00', '17000.00', '4', '2602', '手动输入号码，至少输入一个四位数号码组成一注。', '手动输入一个4位数号码组成一注，所选号码与开奖号码的千位、百位、十位、个位相同，且顺序一致，即为中奖。', '投注方案：1234，开奖号码：1234，即中四星直选。', 'dxwfH4d', 'ds', 'ds', 'ssc_dx_q4d', '0', '7', '10000', '1000', '0.0000');
INSERT INTO `ssc_played` VALUES ('2608', '任选四复式', '1', '26', '19600.00', '17000.00', '4', '26010', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择四位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。', 'dxwfR4f', 'fs', 'fs', 'ssc_dx_r4f', '1', '5', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('2609', '任选四单式', '1', '26', '19600.00', '17000.00', '4', '26010', '从万位、千位、百位、十位、个位中选择四个位置，至少手动输入一个四位数的号码组成一注。', ' 从万位、千位、百位、十位、个位中选择四个位置。至少手动输入一个四位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，十位选3，个位选4。开奖号码：12234，即中任四直选。1*345，则为中奖，如果是13*45或134*5等都不中奖。', 'dxwfR4d', 'rx4ds', 'ds', 'ssc_dx_r4d', '0', '6', '10000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26010', '前三复式', '1', '26', '1960.00', '1700.00', '3', '2603', '从万位、千位、百位各选一个号码组成一注。', '从万位、千位、百位中选择一个三位数号码组成一注，所选号码与开奖号码前三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3f', 'fs', 'fs', 'ssc_3x_q3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26011', '前三单式', '1', '26', '1960.00', '1700.00', '3', '2603', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的前三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：前三位123，即中前三直选。', 'sxwfQ3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26012', '后三复式', '1', '26', '1960.00', '1700.00', '3', '2603', '从百位、十位、个位各选一个号码组成一注。', '从百位、十位、个位中选择一个三位数号码组成一注，所选号码与开奖号码后三位相同，且顺序一致，即为中奖。', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3f', 'fs', 'fs', 'ssc_3x_h3f', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26013', '后三单式', '1', '26', '1960.00', '1700.00', '3', '2603', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的后三位相同，且顺序一致，即为中奖！', '投注方案：123，开奖号码：后三位123，即中后三直选。', 'sxwfH3d', 'ds', 'ds', 'ssc_3x_q3d', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26014', '任选三复式', '1', '26', '1960.00', '1700.00', '3', '26010', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三位各选1个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：万位选1，百位选2，个位选3。开奖号码：12223，即中任三直选。', 'sxwfR3f', 'fs', 'fs', 'ssc_3x_r3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26015', '任选三单式', '1', '26', '1960.00', '1700.00', '3', '26010', '从万位、千位、百位、十位、个位中选择三个位置，至少手动输入一个三位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置。至少手动输入一个三位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、百位、个位，输入号码123。开奖号码：12223，即中任三直选。', 'sxwfR3d', 'rx3ds', 'ds', 'ssc_3x_r3d', '0', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26016', '前三组三', '1', '26', '666.66', '566.66', '2', '2604', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：前三位221(顺序不限)，即中前三组选三', 'sxzxQ3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26017', '前三组六', '1', '26', '333.33', '283.33', '3', '2604', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码前三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：前三位513(顺序不限)，即中前三组选六。', 'sxzxQ3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '1', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26018', '前三混合组选', '0', '26', '60.00', '0.00', '3', '2604', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的前三位符合手动输入号码，即中前三组选三或前三组选六。', '投注方案：122、135。  开奖号码：前三位221(顺序不限)即中前三组选三，或前三位513(顺序不限)即中前三组选六。', 'sxzxQ3h', '', 'ds', 'ssc_3x_z3q', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26019', '后三组三', '1', '26', '666.66', '566.66', '2', '2604', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成2注或2注以上，所选号码与开奖号码后三位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后三位221(顺序不限)，即中后三组选三。', 'sxzxH3z3', 'z3', 'fs', 'ssc_z3_q3', '1', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26020', '后三组六', '1', '26', '333.33', '283.33', '3', '2604', '从0-9中任意选择3个或3个以上号码。', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的百位、十位、个位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：后三位513(顺序不限)，即中后三组选六。', 'sxzxH3z6', 'z6', 'fs', 'ssc_z3_q6', '1', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26021', '后三混合组选', '0', '26', '60.00', '0.00', '3', '2604', '手动输入号码，至少输入1个三位数号码。', '手动输入一个3位数号码组成一注（不含豹子号），开奖号码的后三位符合手动输入号码，即中后三组选三或后三组选六。', '投注方案：122、135。  开奖号码：后三位221(顺序不限)即中后三组选三，或后三位513(顺序不限)即中后三组选六', 'sxzxH3h', '', 'ds', 'ssc_3x_z3d', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26022', '任选三组三', '1', '26', '666.66', '566.66', '3', '26010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择两个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码01，开奖号码：90501，即中任三组三。', 'sxzxR3z3', 'z3', 'fs', 'ssc_z3_r3', '1', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26023', '任选三组六', '1', '26', '333.33', '283.33', '3', '26010', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。', '万位、千位、百位、十位、个位中选择三个位置，且从0-9中任意选择三个号码组成一注。所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三组六', 'sxzxR3z6', 'z6', 'fs', 'ssc_z3_r6', '1', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26024', '任选三混合组选', '0', '26', '60.00', '0.00', '3', '26010', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码构成一注(不含豹子)。', '从万位、千位、百位、十位、个位中选择三个位置，手动输入三个号码组成一注，三选号码与开奖号码的指定位置号码相同，且顺序不限，即为中奖', '投注方案：选择位置千位、十位、个位，选择号码135，开奖号码：95813，即中任三混合组选', 'sxzxR3h', '', 'ds', 'ssc_3x_rz3', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26025', '前二复式', '1', '26', '196.00', '170.00', '2', '2605', '从万位、千位中至少各选1个号码组成一注。', '从万位、千位中选择一个2位数号码组成一注，所选号码与开奖号码的前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2f', 'fs', 'fs', 'ssc_2x_q2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26026', '前二单式', '1', '26', '196.00', '170.00', '2', '2605', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码前二位相同，且顺序一致，即为中奖。', '投注方案：12  开奖号码：12345，即中前二直选', 'rxwfQ2d', 'ds', 'ds', 'ssc_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26027', '后二复式', '1', '26', '196.00', '170.00', '2', '2605', '从十位、个位中至少各选1个号码组成一注。', '从十位、个位中选择一个2位数号码组成一注，所选号码与开奖号码的后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2f', 'fs', 'fs', 'ssc_2x_h2f', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26028', '后二单式', '1', '26', '196.00', '170.00', '2', '2605', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码后二位相同，且顺序一致，即为中奖。', '投注方案：45  开奖号码：12345，即中后二直选', 'rxwfH2d', 'ds', 'ds', 'ssc_2x_2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26029', '任选二复式', '1', '26', '196.00', '170.00', '2', '2605', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注。', '从万位、千位、百位、十位、个位中选择两位各选1个号码组成一注，所选号码与开奖号码指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：百位1，十位2  开奖号码：12123，即中任二直选', 'rxwfR2f', 'fs', 'fs', 'ssc_2x_r2f', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26030', '任选二单式', '1', '26', '196.00', '170.00', '2', '2605', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置。至少手动输入一个两位数的号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序一致，即为中奖。', '投注方案：选择万位、个位，输入号码13。开奖号码：12223，即中任二直选。', 'rxwfR2d', 'rx2ds', 'ds', 'ssc_2x_r2d', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26031', '前二组选复式', '1', '26', '100.00', '85.00', '2', '2606', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所择号码与开奖号码的万位、千位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26032', '前二组选单式', '1', '26', '100.00', '85.00', '2', '2606', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的前二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：前二位12或21(顺序不限，不含对子号)，即中前二组选。', 'rxzxQ2d', 'ds', 'ds', 'ssc_z2_d2', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26033', '后二组选复式', '1', '26', '100.00', '85.00', '2', '2606', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个号码组成一注，所选号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2f', 'z2', 'fs', 'ssc_z2_f2', '1', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26034', '后二组选单式', '1', '26', '100.00', '85.00', '2', '2606', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，输入号码与开奖号码的后二位相同，顺序不限，即为中奖。', '投注方案：12   开奖号码：后二位12或21(顺序不限，不含对子号)，即中后二组选。', 'rxzxH2d', 'ds', 'ds', 'ssc_z2_d2', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26035', '任选二组选复式', '1', '26', '100.00', '85.00', '2', '2606', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码构成一注。', '从万位、千位、百位、十位、个位中选择两个位置，号码区至少选择两个号码组成一注，所选号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，选择号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2f', 'z2', 'fs', 'ssc_z2_r2', '1', '4', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26036', '任选二组选单式', '1', '26', '100.00', '85.00', '2', '2606', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数的号码组成一注。', '从万位、千位、百位、十位、个位中选择两个位置，至少手动输入一个两位数号码组成一注，输入号码与开奖号码的指定位置上的号码相同，且顺序不限，即为中奖。', '投注方案：选择位置千位、十位，输入号码12，开奖号码：01528或02518，即中任二组选', 'rxzxR2d', 'ds', 'ds', 'ssc_z2_rd', '0', '5', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26037', '五星定位胆', '1', '26', '19.60', '17.00', '1', '2607', '在万位、千位、百位、十位、个位任意位置上任意选择1个或1个以上号码。', '从万位、千位、百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '投注方案：个位 1    开奖号码：个位 1，即中定位胆个位。', 'dwd5x', 'dwd', 'dd5x', 'ssc_5x_dw', '1', '0', '50', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26038', '后三一码', '1', '26', '6.99', '5.66', '0', '2608', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码百位、十位、个位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：后三位至少出现1个1，即中后三一码不定位。', 'bddH3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '2', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26039', '前三一码', '1', '26', '6.99', '5.66', '0', '2608', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码万位、千位、百位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：前三位至少出现1个1，即中前三一码不定位。', 'bddQ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '0', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26040', '中三一码', '1', '26', '6.99', '5.66', '0', '2608', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码千位、百位、十位中包含所选号码，即为中奖。', '投注方案：1   开奖号码：千位、百位、十位至少出现1个1，即中中三一码不定位。', 'bddZ3', 'dwd', 'bdd', 'ssc_5x_q3', '1', '1', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26041', '任三一码', '1', '26', '6.99', '5.66', '0', '2608', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。', '从万位、千位、百位、十位、个位中选择三个位置，从0-9中任意选择1个号码组成一注。开奖号码的指定位置包含所选号码，即为中奖。', '投注方案：选择位置：万位、十位、个位，选择号码 1   开奖号码：万位、十位、个位至少出现1个1，即中任三一码不定位。', 'bddR3', 'dwd', 'bdd', 'ssc_5x_r3', '1', '3', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26042', '前二大小单双', '1', '26', '3.88', '3.40', '0', '2609', '从万位、千位中的“大、小、单、双”中至少各选一个组成一注。', '对万位和千位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：万位与千位为小双，即中前二大小单双。', 'dsQ2', 'dxds', 'dxds', 'ssc_dxds_q2', '1', '1', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26043', '后二大小单双', '1', '26', '7.76', '6.80', '0', '2609', '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。', '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：小双  开奖号码：十位与个位为小双，即中后二大小单双。', 'dsH2', 'dxds', 'dxds', 'ssc_dxds_h2', '1', '2', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('26044', '任选大小单双', '1', '26', '7.76', '6.80', '0', '2609', '从万位、千位、百位、十位、个位中选定两个位置，且大、小、单、双至少各选一个组成一注。', '从万位、千位、百位、十位、个位中选定两个位置，对选定位置进行大、小、单、双形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '投注方案：选择位置万位、十位，对应小双  开奖号码：万位与十位为小双，即中任选大小单双。', 'dsR2', 'dxds', 'dxds', 'ssc_dxds_r2', '1', '3', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260142', '前三二码', '0', '26', '31.16', '31.16', '2', '2608', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个不同的号码组成，只要开奖号码的万位、千位、百位中包含所选号码，即为中奖。', '如：选择二码不定位12，前三位，至少出现1和2各一个即为中奖。', 'bdwQ32', 'r2', '', 'ssc_2x_bdw', '1', '0', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260143', '后三二码', '0', '26', '31.16', '31.16', '2', '2608', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择12，前三位，至少出现1和2各一个即为中奖。', 'bdwH32', 'r2', '', 'ssc_2x_bdw', '1', '6', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260254', '一帆风顺', '1', '26', '4.64', '4.06', '1', '26011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中包含所选号码，即为中奖。', '投注方案：8，开奖号码:至少出现一个8，即中一帆风顺', 'qwwfyffs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260255', '好事成双', '1', '26', '23.71', '20.77', '1', '26011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现2次，即为中奖。', '投注方案：8，开奖号码:至少出现两个8，即中好事成双', 'qwwfhscs', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '1', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260256', '三星报喜', '1', '26', '226.35', '198.33', '1', '26011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现3次，即为中奖。', '投注方案：8，开奖号码:至少出现三个8，即中三星报喜', 'qwwfsxbx', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '2', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260257', '四季发财', '1', '26', '4204.34', '3683.66', '1', '26011', '至少选择一个号码。', '从0-9中任意选择1个号码组成一注，只要开奖号码的万位、千位、百位、十位、个位中出现4次，即为中奖。', '投注方案：8，开奖号码:至少出现四个8，即中四季发财', 'qwwfsjfc', 'r1sscqw', 'r1', 'qwwf_yffs', '0', '3', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260258', '组选120', '1', '26', '1666.66', '1416.66', '5', '2601', '任意选择一个5位数号码组成一注，所选号码与开奖号码全部相同，顺序可不一致，即为中奖。', '如：12435，如果开奖号为54321，则你中奖一注。', '投注方案：1,2,3,4,5，开奖号码:出现1,2,3,4,5，即中组选120', 'dxwf5z120', 'zx120', '', 'ssc_5x_z5_120', '0', '3', '252', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260261', '五星三码', '0', '26', '38.72', '38.72', '3', '2608', '从0-9中任意选择3个以上号码', '从0-9中选择3个号码，每注由3个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的3个号码，即为中奖。', '投注号码：1 2 3<br>\n开奖号码：至少出现1、2、3各一个，即中五星三码不定位。', 'bdw5x3m', 'r3', '', 'ssc_5x_3m_bdw', '0', '10', '120', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260262', '五星二码', '0', '26', '11.33', '11.33', '2', '2608', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的万、千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：至少出现1和2各一个，即中五星二码不定位。', 'bdw5x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '11', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260263', '四星二码', '0', '26', '17.37', '17.37', '2', '2608', '从0-9中任意选择2个以上号码', '从0-9中选择2个号码，每注由2个不同的号码组成，开奖号码的千、百、十、个位中同时包含所选的2个号码，即为中奖。', '投注号码：1 2<br>\n开奖号码：后四位，至少出现1和2各一个，即中四星二码不定位。', 'bdw4x2m', 'r2', '', 'ssc_5x_2m_bdw', '0', '12', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260264', '四星一码', '0', '26', '4.20', '4.20', '1', '2608', '从0-9中任意选择1个以上号码', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码的千、百、十、个位中包含所选号码，即为中奖。', '投注方案：1<br>\n开奖号码：后四位，至少出现1个1，即中四星一码不定位。', 'bdw4x1m', 'r1sscqw', '', 'ssc_4x_1m_bdw', '0', '13', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260265', '前三大小单双', '1', '26', '15.52', '6.80', '0', '2609', '对万位、千位和百位的“大小单双”形态进行购买。', '对万位、千位和百位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：万位选择大，千位选择单，百位选择双，开出632**即为中奖。', 'dsQ3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '4', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260266', '后三大小单双', '1', '26', '15.52', '6.80', '0', '2609', '对百位、十位和个位的“大小单双”形态进行购买。', '对百位、十位和个位的“大（56789）小（01234）大（56789）、单（13579）双（02468）单（13579）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：百位选择大，十位选择单，个位选择双，开出**632即为中奖。', 'dsH3', 'dxds', 'dxds', 'ssc_dxds_q3', '0', '5', '64', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260267', '后三和值尾数', '1', '26', '19.60', '17.00', '1', '2603', '从0-9中选择1个号码。', '所选数值等于开奖号码的百位、十位、个位三数字相加之和的尾数，即为中奖', '投注方案：和值尾数8，开奖号码：后三位和值尾数为8，即中得和值尾数', 'sxh3hzws', 'r1', 'r1', 'ssc_hz_h3', '0', '4', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260268', '组选60', '1', '26', '3333.33', '2833.33', '3', '2601', '从“二重号”选择一个号码，“单号”中选择三个号码组成一注。', '选择1个二重号码和3个单号号码组成一注，所选的单号号码与开奖号码相同，且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z60', '', '', 'ssc_5x_z5_60', '0', '4', '840', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260269', '组选30', '1', '26', '6666.66', '5666.66', '3', '2601', '从“二重号”选择两个号码，“单号”中选择一个号码组成一注。', '选择2个二重号和1个单号号码组成一注，所选的单号号码与开奖号码相同，且所选的2个二重号码分别在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z30', '', '', 'ssc_5x_z5_30', '0', '5', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260270', '组选20', '1', '26', '10000.00', '8500.00', '3', '2601', '从“三重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个三重号码和2个单号号码组成一注，所选的单号号码与开奖号码相同，且所选三重号码在开奖号码中出现了3次，即为中奖。', '', 'dxwf5z20', '', '', 'ssc_5x_z5_20', '0', '6', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260271', '组选10', '1', '26', '20000.00', '17000.00', '2', '2601', '从“三重号”选择一个号码，“二重号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z10', '', '', 'ssc_5x_z5_10', '0', '7', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260272', '组选5', '1', '26', '40000.00', '34000.00', '2', '2601', '从“四重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个二重号码，所选三重号码在开奖号码中出现3次，并且所选二重号码在开奖号码中出现了2次，即为中奖。', '', 'dxwf5z5', '', '', 'ssc_5x_z5_5', '0', '8', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260273', '组选24', '1', '26', '833.33', '708.33', '4', '2602', '从0-9中选择4个号码组成一注。 ', '从0-9中任意选择4个号码组成一注，所选号码与开奖号码的后四位相同，且顺序不限，即为中奖。', '投注方案：1,2,3,4，开奖号码：5,4,3,2,1，即中组选24', 'dxwf4z24', '', '', 'ssc_4x_z4_24', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260275', '组选12', '1', '26', '1666.66', '1416.66', '3', '2602', '从“二重号”选择一个号码，“单号”中选择两个号码组成一注。', '选择1个二重号码和2个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选二重号码出现了2次，即为中奖。', '投注号码：1,25 开奖号码：5,1,1,2,5 即中组选12', 'dxwf4z12', '', '', 'ssc_4x_z4_12', '0', '8', '360', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260276', '组选6', '1', '26', '3333.33', '2833.33', '3', '2602', '从“二重号”选择两个号码组成一注。', '选择2个二重号码组成一注，在开奖号码后四位中，所选的2个二重号码分别出现了2次，即为中奖。', '投注方案：2,3   开奖号码：1,2,2,3,3   即中组选6', 'dxwf4z6', '', '', 'ssc_4x_z4_6', '0', '9', '45', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260277', '组选4', '1', '26', '5000.00', '4250.00', '2', '2602', '从“三重号”选择一个号码，“单号”中选择一个号码组成一注。', '选择1个三重号码和1个单号号码组成一注，在开奖号码后四位中，所选单号号码与开奖号码相同，且所选三重号码出现了3次，即为中奖。', '投注方案：3,1  开奖号码：5,3,3,3,1  即中组选4', 'dxwf4z4', '', '', 'ssc_4x_z4_4', '0', '10', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260278', '后三组选和值', '1', '26', '280.00', '280.00', '1', '2604', '从1-26中选择1个号码。', '所选数值等于开奖号码百位、十位、个位三个数字相加之和(不含豹子号)，即为中奖。', '', 'sxzxH3hz', '', 'ds', 'ssc_z3h_hz', '0', '7', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260280', '后三直选跨度', '1', '26', '1960.00', '1700.00', '1', '2603', '从0-9中选择1个号码。', '所选数值等于开奖号码的后3位最大与最小数字相减之差，即为中奖。', '投注方案：2 开奖号码：1,2,3,4,5 即中后三直选跨度', 'sxzxH3kd', '', '', 'ssc_h3_kd', '0', '6', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260279', '后三特殊号码', '0', '26', '6.00', '6.00', '1', '2603', '选择一个号码形态。', '所选的号码特殊属性和开奖号码后3位的属性一致，即为中奖。其中：1.顺子号的个、十、百位不分顺序；2.对子号指的是开奖号码的后三位当中，任意2位数字相同的三位数号码。', '', 'sxzxH3ts', '', '', 'ssc_ts_h3', '0', '5', '3', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260283', '前三趣味二星', '0', '26', '90.00', '90.00', '3', '26011', '选择一个万位的大小号属性，并从千位、百位中至少各选1个号码。', '在千位、百位上至少各选1个号码，并从万位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfq3qw2x', '', '', 'qwwf_q3qw2x', '0', '4', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260284', '后三趣味二星', '0', '26', '90.00', '90.00', '3', '26011', '选择一个百位的大小号属性，并从十位、个位中至少各选1个号码。', '在个位、十位上至少各选1个号码，并从百位 “大小号”中任选一种号码属性进行投注。0-4为“小号” 5-9为“大号”。', '', 'qwwfh3qw2x', '', '', 'qwwf_h3qw2x', '0', '5', '200', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260285', '四码趣味三星', '0', '26', '950.00', '950.00', '4', '26011', '选择一个千位的大小号属性，并从百位、十位、个位中至少各选1个号码。', '在个位、十位、百位上至少各选1个号码，并从千位大小号中任选一种号码属性进行投注。其中，0-4为小号；5-9为大号', '', 'qwwf4mqw3x', '', '', 'qwwf_4mqw3x', '0', '6', '2000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260286', '五码趣味三星', '0', '26', '620.00', '620.00', '5', '26011', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中各任选一种进行投注。', '在个位、十位、百位上至少各选1个号码，并从千位与万位的“大小号”中分别任选一种号码属性进行投注。其中，0-4为“小号”；5-9为“大号”。', '', 'qwwf5mqw3x', '', '', 'qwwf_5mqw3x', '0', '7', '4000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260287', '中三复式', '1', '26', '1960.00', '1700.00', '3', '2603', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '投注方案：1,2,3   开奖号码：0,1,2,3,4  即中 中三复试', 'sxwfz3fs', 'fs', 'fs', 'ssc_3x_z3fs', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260288', '中三单式', '1', '26', '1960.00', '1700.00', '3', '2603', '从千位、百位、十位各选一个号码组成一注。', '从千位、百位、十位中选择一个三位数号码组成一注，所选号码与开奖号码中三位相同，且顺序一致，即为中奖。', '', 'sxwfz3ds', 'ds', 'ds', 'ssc_3x_z3ds', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260289', '中三组三', '1', '26', '666.66', '566.66', '2', '2604', '从0-9中任意选择2个或2个以上号码。', '从0-9中选择2个或者2个以上数字组成两注或两注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：122  开奖号码：中三位221(顺序不限)，即中 中三组选三', 'sxzxz3z3', 'z3', 'fs', 'ssc_z3_z3', '0', '2', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('260290', '中三组六', '1', '26', '333.33', '283.33', '3', '2604', '从0-9中任意选择3个或3个以上号码。', '从0-9中选择3个或者3个以上数字组成1注或1注以上，所选号码与开奖号码中三位相同，顺序不限，即为中奖。', '投注方案：135   开奖号码：中三位513(顺序不限)，即中 中三组选六。', 'sxzxz3z6', 'z6', 'fs', 'ssc_z3_z6', '0', '3', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6045', '任选一中一', '1', '6', '4.14', '3.61', '1', '609', '从01～11中任选1个号码为一注。', '从01～11中任选1个号码为进行购买，只要当期摇出的5个号码中包含所选号码，即为中奖。', '如：05   开奖号码：01,02,03,04,05   即为中奖', 'gd11x5R1', 'r111x5', '', '115_rx1', '0', '0', '11', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6046', '任选二中二', '1', '6', '10.50', '9.18', '2', '609', '从01～11中任选2个号码为一注。', '从01～11中任选2个号码为一注，选择2个以上号码为复式投注，投注号码与开奖号码中任意2个号码相同即为中奖，单注奖金6元。投注时可选择1个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02，01 03', 'gd11x5R2', 'r211x5', '', '115_rx2', '0', '0', '55', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6047', '任选三中三', '1', '6', '31.51', '21.55', '3', '609', '从01～11中任选3个号码为一注。', '从01～11中任选3个号码为一注，选择3个以上号码为复式投注，投注号码与开奖号码中任意3个号码相同即为中奖，单注奖金19元。投注时可选择1～2个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03，01 02 04', 'gd11x5R3', 'r311x5', '', '115_rx3', '0', '0', '165', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6048', '任选四中四', '1', '6', '125.26', '109.48', '4', '609', '从01～11中任选4个号码为一注。', '从01～11中任选4个号码为一注，选择4个以上号码为复式投注，投注号码与开奖号码中任意4个号码相同即为中奖，单注奖金78元。投注时可选择1～3个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04，01 02 03 05', 'gd11x5R4', 'r411x5', '', '115_rx4', '0', '0', '330', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6049', '任选五中五', '1', '6', '881.47', '770.98', '5', '609', '从01～11中任选5个号码为一注。', '从01～11中任选5个号码为一注，选择5个以上号码为复式投注，投注号码与开奖号码全部相同即为中奖，单注奖金540元。投注时可选择1～4个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05', 'gd11x5R5', 'r511x5', '', '115_rx5', '0', '0', '462', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6050', '任选六中五', '1', '6', '146.47', '128.03', '6', '609', '从01～11中任选6个号码为一注。', '从01～11中任选6个号码为一注，选择6个以上号码为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金90元。投注时可选择1～5个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05 X', 'gd11x5R6', 'r611x5', '', '115_rx6', '0', '0', '462', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6051', '任选七中五', '1', '6', '42.02', '36.74', '7', '609', '从01～11中任选7个号码为一注。', '从01～11中任选7个号码为一注，选择7个以上号码即为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金26元。投注时可选择1～6个号码作为每注都有的胆码，再补充其它号码作为拖码进行投注。', '如：01 02 03 04 05 X X', 'gd11x5R7', 'r711x5', '', '115_rx7', '0', '0', '330', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6052', '任选八中五', '1', '6', '15.70', '13.72', '8', '609', '从01～11中任选8个号码为一注。', '从01～11中任选8个号码为一注，选择8个以上号码为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金9元。投注时可选择1～7个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05 X X X', 'gd11x5R8', 'r811x5', '', '115_rx8', '0', '0', '165', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6053', '前二直选', '1', '6', '212.10', '183.70', '2', '6010', '对第1位和第2位各选1个号码为一注。', '对第1位和第2位各选1个号码为一注，某一位或两位选择2个以号码为复式投注，投注号码与开奖号码前2位按位一致即为中奖。', '如：01 02', 'gd11x5Q2', 'descar', 'fs', '115_q2_zhi', '0', '0', '111', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6054', '前二组选', '1', '6', '106.05', '91.85', '2', '6010', '对第1位和第2位各选1个号码为一注。', '对第1位和第2位各选1个号码为一注，某一位或两位选择2个以号码为复式投注，投注号码与开奖号码前2位按位一致即为中奖。', '如：01 02', 'gd11x5Q2z', 'r2', 'fs', '115_q2_zu', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6055', '前三直选', '1', '6', '1800.00', '1400.00', '3', '6011', '对第1位、第2位和第3位各选1个号码为一注。', '对第1位、第2位和第3位各选1个号码为一注，某一位或几位选择2个以号码为复式投注，投注号码与开奖号码前3位按位一致即为中奖。', '如：01 02 03', 'gd11x5Q3', 'descar', 'fs', '115_q3_zhi', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('6056', '前三组选', '1', '6', '300.00', '275.55', '3', '6011', '从01～11中任选3个号码为一注。', '从01～11中任选3个号码为一注，选择3个以上号码为复式投注，投注号码与开奖号码前3位一致，顺序不限，即为中奖。', '如：01 02 03，01 03 02', 'gd11x5Q3z', 'r3', 'fs', '115_q3_zu', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60152', '前三单式', '1', '6', '1890.90', '1653.30', '3', '6050', '与前后任选四星单复式同理，只是下注号改为4位。', '与前后任选四星单复式同理，只是下注号改为4位。', '与前后任选四星单复式同理，只是下注号改为4位。', 'syxwQ3d', 'ds', 'ds', '115_3x_q3d', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60153', '后三单式', '1', '6', '1890.90', '1653.30', '3', '6050', '与前后任选四星单复式同理，只是下注号改为6位。', '与前后任选四星单复式同理，只是下注号改为6位。', '与前后任选四星单复式同理，只是下注号改为6位。', 'syxwH3d', 'ds', 'ds', '115_3x_q3d', '0', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60155', '前二单式', '1', '6', '210.10', '183.70', '2', '6050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwQ2d', 'ds', 'ds', '115_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60156', '后二单式', '1', '6', '210.10', '183.70', '2', '6050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwH2d', 'ds', 'ds', '115_2x_2d', '0', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60157', '任选二单式', '1', '6', '210.10', '183.70', '2', '6050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwR2d', 'rx2ds', 'ds', '115_2x_r2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60259', '趣味_猜中位', '1', '6', '10.00', '10.00', '1', '6075', '从3-9中任意选择1个及1个以上数字。', '从3-9中选择一个号码进行购买，所选开奖号码与5个开奖号码按照大小顺序排列后的第三个号码相同，即为中奖', '投注方案：08，开奖号码:按大小顺序排列后04 05 08 09 11，中间数08，即中趣味_猜中位', 'qwwfczw', 'r1', 'r1', 'qwwf_czw', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60260', '趣味_定单双', '1', '6', '10.00', '10.00', '1', '6075', '从不同的单双组合中任意选择1个或1个以上的组合。', '从6个单双个数组合中选择1种组合，当前开奖号码的单双个数与所选单双组合一致，即为中奖', '投注方案：5单0双，开奖号码:01 03 05 07 09五个单数，即中趣味_定单双', 'qwwfdds', 'dds', '', 'qwwf_dds', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60281', '定位胆', '1', '6', '21.01', '18.37', '1', '6077', '从第一位，第二位，第三位任意位置上任意选择1个或1个以上号码。', '从第一位，第二位，第三位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '', 'gd11x5dwd', '', '', 'ssc_11x5_dwd', '0', '0', '33', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60282', '不定位', '1', '6', '6.99', '6.12', '1', '6078', '从01-11中任意选择1个或1个以上号码。', '从01-11中共11个号码中选择1个号码，每注由1个号码组成，只要当期顺序摇出的第一位、第二位、第三位开奖号码中包含所选号码，即为中奖。', '', 'gd11x5bdw', '', '', 'ssc_11x5_bdw', '0', '0', '11', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60292', '任选一中一', '1', '6', '4.14', '3.61', '1', '6079', '手动输入号码，从01-11中任意输入1个号码组成一注。', '', '', 'gd11x5R1ds', '', '', '11x5_r1ds', '0', '0', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60293', '任选二中二', '1', '6', '10.50', '9.18', '2', '6079', '手动输入号码，从01-11中任意输入2个号码组成一注。', '', '', 'gd11x5R2ds', '', '', '11x5_r2ds', '0', '1', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60294', '任选三中三', '1', '6', '31.51', '21.55', '3', '6079', '手动输入号码，从01-11中任意输入3个号码组成一注。', '', '', 'gd11x5R3ds', '', '', '11x5_r3ds', '0', '2', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60295', '任选四中四', '1', '6', '125.26', '109.48', '4', '6079', '手动输入号码，从01-11中任意输入4个号码组成一注。', '', '', 'gd11x5R4ds', '', '', '11x5_r4ds', '0', '3', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60296', '任选五中五', '1', '6', '881.82', '770.98', '5', '6079', '手动输入号码，从01-11中任意输入5个号码组成一注。', '', '', 'gd11x5R5ds', '', '', '11x5_r5ds', '0', '4', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60297', '任选六中五', '1', '6', '146.47', '128.03', '6', '6079', '手动输入号码，从01-11中任意输入6个号码组成一注。', '', '', 'gd11x5R6ds', '', '', '11x5_r6ds', '0', '5', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60298', '任选七中五', '1', '6', '42.02', '36.74', '7', '6079', '手动输入号码，从01-11中任意输入7个号码组成一注。', '', '', 'gd11x5R7ds', '', '', '11x5_r7ds', '0', '6', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('60299', '任选八中五', '1', '6', '15.70', '13.72', '8', '6079', '手动输入号码，从01-11中任意输入8个号码组成一注。', '', '', 'gd11x5R8ds', '', '', '11x5_r8ds', '0', '7', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7045', '任选一中一', '1', '7', '4.14', '3.61', '1', '709', '从01～11中任选1个号码为一注。', '从01～11中任选1个号码为进行购买，只要当期摇出的5个号码中包含所选号码，即为中奖。', '如：05   开奖号码：01,02,03,04,05   即为中奖', 'gd11x5R1', 'r111x5', '', '115_rx1', '0', '0', '11', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7046', '任选二中二', '1', '7', '10.50', '9.18', '2', '709', '从01～11中任选2个号码为一注。', '从01～11中任选2个号码为一注，选择2个以上号码为复式投注，投注号码与开奖号码中任意2个号码相同即为中奖，单注奖金6元。投注时可选择1个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02，01 03', 'gd11x5R2', 'r211x5', '', '115_rx2', '0', '0', '55', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7047', '任选三中三', '1', '7', '31.51', '21.55', '3', '709', '从01～11中任选3个号码为一注。', '从01～11中任选3个号码为一注，选择3个以上号码为复式投注，投注号码与开奖号码中任意3个号码相同即为中奖，单注奖金19元。投注时可选择1～2个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03，01 02 04', 'gd11x5R3', 'r311x5', '', '115_rx3', '0', '0', '165', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7048', '任选四中四', '1', '7', '125.26', '109.48', '4', '709', '从01～11中任选4个号码为一注。', '从01～11中任选4个号码为一注，选择4个以上号码为复式投注，投注号码与开奖号码中任意4个号码相同即为中奖，单注奖金78元。投注时可选择1～3个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04，01 02 03 05', 'gd11x5R4', 'r411x5', '', '115_rx4', '0', '0', '330', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7049', '任选五中五', '1', '7', '881.47', '770.98', '5', '709', '从01～11中任选5个号码为一注。', '从01～11中任选5个号码为一注，选择5个以上号码为复式投注，投注号码与开奖号码全部相同即为中奖，单注奖金540元。投注时可选择1～4个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05', 'gd11x5R5', 'r511x5', '', '115_rx5', '0', '0', '462', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7050', '任选六中五', '1', '7', '146.47', '128.03', '6', '709', '从01～11中任选6个号码为一注。', '从01～11中任选6个号码为一注，选择6个以上号码为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金90元。投注时可选择1～5个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05 X', 'gd11x5R6', 'r611x5', '', '115_rx6', '0', '0', '462', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7051', '任选七中五', '1', '7', '42.02', '36.74', '7', '709', '从01～11中任选7个号码为一注。', '从01～11中任选7个号码为一注，选择7个以上号码即为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金26元。投注时可选择1～6个号码作为每注都有的胆码，再补充其它号码作为拖码进行投注。', '如：01 02 03 04 05 X X', 'gd11x5R7', 'r711x5', '', '115_rx7', '0', '0', '330', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7052', '任选八中五', '1', '7', '15.70', '13.72', '8', '709', '从01～11中任选8个号码为一注。', '从01～11中任选8个号码为一注，选择8个以上号码为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金9元。投注时可选择1～7个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05 X X X', 'gd11x5R8', 'r811x5', '', '115_rx8', '0', '0', '165', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7053', '前二直选', '1', '7', '212.10', '183.70', '2', '7010', '对第1位和第2位各选1个号码为一注。', '对第1位和第2位各选1个号码为一注，某一位或两位选择2个以号码为复式投注，投注号码与开奖号码前2位按位一致即为中奖。', '如：01 02', 'gd11x5Q2', 'descar', 'fs', '115_q2_zhi', '0', '0', '111', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7054', '前二组选', '1', '7', '106.05', '91.85', '2', '7010', '对第1位和第2位各选1个号码为一注。', '对第1位和第2位各选1个号码为一注，某一位或两位选择2个以号码为复式投注，投注号码与开奖号码前2位按位一致即为中奖。', '如：01 02', 'gd11x5Q2z', 'r2', 'fs', '115_q2_zu', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7055', '前三直选', '1', '7', '1800.00', '1400.00', '3', '7011', '对第1位、第2位和第3位各选1个号码为一注。', '对第1位、第2位和第3位各选1个号码为一注，某一位或几位选择2个以号码为复式投注，投注号码与开奖号码前3位按位一致即为中奖。', '如：01 02 03', 'gd11x5Q3', 'descar', 'fs', '115_q3_zhi', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('7056', '前三组选', '1', '7', '300.00', '275.55', '3', '7011', '从01～11中任选3个号码为一注。', '从01～11中任选3个号码为一注，选择3个以上号码为复式投注，投注号码与开奖号码前3位一致，顺序不限，即为中奖。', '如：01 02 03，01 03 02', 'gd11x5Q3z', 'r3', 'fs', '115_q3_zu', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70152', '前三单式', '1', '7', '1890.90', '1653.30', '3', '7050', '与前后任选四星单复式同理，只是下注号改为4位。', '与前后任选四星单复式同理，只是下注号改为4位。', '与前后任选四星单复式同理，只是下注号改为4位。', 'syxwQ3d', 'ds', 'ds', '115_3x_q3d', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70153', '后三单式', '1', '7', '1890.90', '1653.30', '3', '7050', '与前后任选四星单复式同理，只是下注号改为6位。', '与前后任选四星单复式同理，只是下注号改为6位。', '与前后任选四星单复式同理，只是下注号改为6位。', 'syxwH3d', 'ds', 'ds', '115_3x_q3d', '0', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70155', '前二单式', '1', '7', '210.10', '183.70', '2', '7050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwQ2d', 'ds', 'ds', '115_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70156', '后二单式', '1', '7', '210.10', '183.70', '2', '7050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwH2d', 'ds', 'ds', '115_2x_2d', '0', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70157', '任选二单式', '1', '7', '210.10', '183.70', '2', '7050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwR2d', 'rx2ds', 'ds', '115_2x_r2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70259', '趣味_猜中位', '1', '7', '10.00', '10.00', '1', '7075', '从3-9中任意选择1个及1个以上数字。', '从3-9中选择一个号码进行购买，所选开奖号码与5个开奖号码按照大小顺序排列后的第三个号码相同，即为中奖', '投注方案：08，开奖号码:按大小顺序排列后04 05 08 09 11，中间数08，即中趣味_猜中位', 'qwwfczw', 'r1', 'r1', 'qwwf_czw', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70260', '趣味_定单双', '1', '7', '10.00', '10.00', '1', '7075', '从不同的单双组合中任意选择1个或1个以上的组合。', '从6个单双个数组合中选择1种组合，当前开奖号码的单双个数与所选单双组合一致，即为中奖', '投注方案：5单0双，开奖号码:01 03 05 07 09五个单数，即中趣味_定单双', 'qwwfdds', 'dds', '', 'qwwf_dds', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70281', '定位胆', '1', '7', '21.01', '18.37', '1', '7077', '从第一位，第二位，第三位任意位置上任意选择1个或1个以上号码。', '从第一位，第二位，第三位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '', 'gd11x5dwd', '', '', 'ssc_11x5_dwd', '0', '0', '33', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70282', '不定位', '1', '7', '6.99', '6.12', '1', '7078', '从01-11中任意选择1个或1个以上号码。', '从01-11中共11个号码中选择1个号码，每注由1个号码组成，只要当期顺序摇出的第一位、第二位、第三位开奖号码中包含所选号码，即为中奖。', '', 'gd11x5bdw', '', '', 'ssc_11x5_bdw', '0', '0', '11', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70292', '任选一中一', '1', '7', '4.14', '3.61', '1', '7079', '手动输入号码，从01-11中任意输入1个号码组成一注。', '', '', 'gd11x5R1ds', '', '', '11x5_r1ds', '0', '0', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70293', '任选二中二', '1', '7', '10.50', '9.18', '2', '7079', '手动输入号码，从01-11中任意输入2个号码组成一注。', '', '', 'gd11x5R2ds', '', '', '11x5_r2ds', '0', '1', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70294', '任选三中三', '1', '7', '31.51', '21.55', '3', '7079', '手动输入号码，从01-11中任意输入3个号码组成一注。', '', '', 'gd11x5R3ds', '', '', '11x5_r3ds', '0', '2', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70295', '任选四中四', '1', '7', '125.26', '109.48', '4', '7079', '手动输入号码，从01-11中任意输入4个号码组成一注。', '', '', 'gd11x5R4ds', '', '', '11x5_r4ds', '0', '3', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70296', '任选五中五', '1', '7', '881.82', '770.98', '5', '7079', '手动输入号码，从01-11中任意输入5个号码组成一注。', '', '', 'gd11x5R5ds', '', '', '11x5_r5ds', '0', '4', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70297', '任选六中五', '1', '7', '146.47', '128.03', '6', '7079', '手动输入号码，从01-11中任意输入6个号码组成一注。', '', '', 'gd11x5R6ds', '', '', '11x5_r6ds', '0', '5', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70298', '任选七中五', '1', '7', '42.02', '36.74', '7', '7079', '手动输入号码，从01-11中任意输入7个号码组成一注。', '', '', 'gd11x5R7ds', '', '', '11x5_r7ds', '0', '6', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('70299', '任选八中五', '1', '7', '15.70', '13.72', '8', '7079', '手动输入号码，从01-11中任意输入8个号码组成一注。', '', '', 'gd11x5R8ds', '', '', '11x5_r8ds', '0', '7', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15045', '任选一中一', '1', '15', '4.14', '3.61', '1', '1509', '从01～11中任选1个号码为一注。', '从01～11中任选1个号码为进行购买，只要当期摇出的5个号码中包含所选号码，即为中奖。', '如：05   开奖号码：01,02,03,04,05   即为中奖', 'gd11x5R1', 'r111x5', '', '115_rx1', '0', '0', '11', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15046', '任选二中二', '1', '15', '10.50', '9.18', '2', '1509', '从01～11中任选2个号码为一注。', '从01～11中任选2个号码为一注，选择2个以上号码为复式投注，投注号码与开奖号码中任意2个号码相同即为中奖，单注奖金6元。投注时可选择1个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02，01 03', 'gd11x5R2', 'r211x5', '', '115_rx2', '0', '0', '55', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15047', '任选三中三', '1', '15', '31.51', '21.55', '3', '1509', '从01～11中任选3个号码为一注。', '从01～11中任选3个号码为一注，选择3个以上号码为复式投注，投注号码与开奖号码中任意3个号码相同即为中奖，单注奖金19元。投注时可选择1～2个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03，01 02 04', 'gd11x5R3', 'r311x5', '', '115_rx3', '0', '0', '165', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15048', '任选四中四', '1', '15', '125.26', '109.48', '4', '1509', '从01～11中任选4个号码为一注。', '从01～11中任选4个号码为一注，选择4个以上号码为复式投注，投注号码与开奖号码中任意4个号码相同即为中奖，单注奖金78元。投注时可选择1～3个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04，01 02 03 05', 'gd11x5R4', 'r411x5', '', '115_rx4', '0', '0', '330', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15049', '任选五中五', '1', '15', '881.47', '770.98', '5', '1509', '从01～11中任选5个号码为一注。', '从01～11中任选5个号码为一注，选择5个以上号码为复式投注，投注号码与开奖号码全部相同即为中奖，单注奖金540元。投注时可选择1～4个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05', 'gd11x5R5', 'r511x5', '', '115_rx5', '0', '0', '462', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15050', '任选六中五', '1', '15', '146.47', '128.03', '6', '1509', '从01～11中任选6个号码为一注。', '从01～11中任选6个号码为一注，选择6个以上号码为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金90元。投注时可选择1～5个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05 X', 'gd11x5R6', 'r611x5', '', '115_rx6', '0', '0', '462', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15051', '任选七中五', '1', '15', '42.02', '36.74', '7', '1509', '从01～11中任选7个号码为一注。', '从01～11中任选7个号码为一注，选择7个以上号码即为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金26元。投注时可选择1～6个号码作为每注都有的胆码，再补充其它号码作为拖码进行投注。', '如：01 02 03 04 05 X X', 'gd11x5R7', 'r711x5', '', '115_rx7', '0', '0', '330', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15052', '任选八中五', '1', '15', '15.70', '13.72', '8', '1509', '从01～11中任选8个号码为一注。', '从01～11中任选8个号码为一注，选择8个以上号码为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金9元。投注时可选择1～7个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05 X X X', 'gd11x5R8', 'r811x5', '', '115_rx8', '0', '0', '165', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15053', '前二直选', '1', '15', '212.10', '183.70', '2', '15010', '对第1位和第2位各选1个号码为一注。', '对第1位和第2位各选1个号码为一注，某一位或两位选择2个以号码为复式投注，投注号码与开奖号码前2位按位一致即为中奖。', '如：01 02', 'gd11x5Q2', 'descar', 'fs', '115_q2_zhi', '0', '0', '111', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15054', '前二组选', '1', '15', '106.05', '91.85', '2', '15010', '对第1位和第2位各选1个号码为一注。', '对第1位和第2位各选1个号码为一注，某一位或两位选择2个以号码为复式投注，投注号码与开奖号码前2位按位一致即为中奖。', '如：01 02', 'gd11x5Q2z', 'r2', 'fs', '115_q2_zu', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15055', '前三直选', '1', '15', '1800.00', '1400.00', '3', '15011', '对第1位、第2位和第3位各选1个号码为一注。', '对第1位、第2位和第3位各选1个号码为一注，某一位或几位选择2个以号码为复式投注，投注号码与开奖号码前3位按位一致即为中奖。', '如：01 02 03', 'gd11x5Q3', 'descar', 'fs', '115_q3_zhi', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('15056', '前三组选', '1', '15', '300.00', '275.55', '3', '15011', '从01～11中任选3个号码为一注。', '从01～11中任选3个号码为一注，选择3个以上号码为复式投注，投注号码与开奖号码前3位一致，顺序不限，即为中奖。', '如：01 02 03，01 03 02', 'gd11x5Q3z', 'r3', 'fs', '115_q3_zu', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150152', '前三单式', '1', '15', '1890.90', '1653.30', '3', '15050', '与前后任选四星单复式同理，只是下注号改为4位。', '与前后任选四星单复式同理，只是下注号改为4位。', '与前后任选四星单复式同理，只是下注号改为4位。', 'syxwQ3d', 'ds', 'ds', '115_3x_q3d', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150153', '后三单式', '1', '15', '1890.90', '1653.30', '3', '15050', '与前后任选四星单复式同理，只是下注号改为6位。', '与前后任选四星单复式同理，只是下注号改为6位。', '与前后任选四星单复式同理，只是下注号改为6位。', 'syxwH3d', 'ds', 'ds', '115_3x_q3d', '0', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150155', '前二单式', '1', '15', '210.10', '183.70', '2', '15050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwQ2d', 'ds', 'ds', '115_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150156', '后二单式', '1', '15', '210.10', '183.70', '2', '15050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwH2d', 'ds', 'ds', '115_2x_2d', '0', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150157', '任选二单式', '1', '15', '210.10', '183.70', '2', '15050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwR2d', 'rx2ds', 'ds', '115_2x_r2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150259', '趣味_猜中位', '1', '15', '10.00', '10.00', '1', '15075', '从3-9中任意选择1个及1个以上数字。', '从3-9中选择一个号码进行购买，所选开奖号码与5个开奖号码按照大小顺序排列后的第三个号码相同，即为中奖', '投注方案：08，开奖号码:按大小顺序排列后04 05 08 09 11，中间数08，即中趣味_猜中位', 'qwwfczw', 'r1', 'r1', 'qwwf_czw', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150260', '趣味_定单双', '1', '15', '10.00', '10.00', '1', '15075', '从不同的单双组合中任意选择1个或1个以上的组合。', '从6个单双个数组合中选择1种组合，当前开奖号码的单双个数与所选单双组合一致，即为中奖', '投注方案：5单0双，开奖号码:01 03 05 07 09五个单数，即中趣味_定单双', 'qwwfdds', 'dds', '', 'qwwf_dds', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150281', '定位胆', '1', '15', '21.01', '18.37', '1', '15077', '从第一位，第二位，第三位任意位置上任意选择1个或1个以上号码。', '从第一位，第二位，第三位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '', 'gd11x5dwd', '', '', 'ssc_11x5_dwd', '0', '0', '33', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150282', '不定位', '1', '15', '6.99', '6.12', '1', '15078', '从01-11中任意选择1个或1个以上号码。', '从01-11中共11个号码中选择1个号码，每注由1个号码组成，只要当期顺序摇出的第一位、第二位、第三位开奖号码中包含所选号码，即为中奖。', '', 'gd11x5bdw', '', '', 'ssc_11x5_bdw', '0', '0', '11', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150292', '任选一中一', '1', '15', '4.14', '3.61', '1', '15079', '手动输入号码，从01-11中任意输入1个号码组成一注。', '', '', 'gd11x5R1ds', '', '', '11x5_r1ds', '0', '0', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150293', '任选二中二', '1', '15', '10.50', '9.18', '2', '15079', '手动输入号码，从01-11中任意输入2个号码组成一注。', '', '', 'gd11x5R2ds', '', '', '11x5_r2ds', '0', '1', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150294', '任选三中三', '1', '15', '31.51', '21.55', '3', '15079', '手动输入号码，从01-11中任意输入3个号码组成一注。', '', '', 'gd11x5R3ds', '', '', '11x5_r3ds', '0', '2', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150295', '任选四中四', '1', '15', '125.26', '109.48', '4', '15079', '手动输入号码，从01-11中任意输入4个号码组成一注。', '', '', 'gd11x5R4ds', '', '', '11x5_r4ds', '0', '3', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150296', '任选五中五', '1', '15', '881.82', '770.98', '5', '15079', '手动输入号码，从01-11中任意输入5个号码组成一注。', '', '', 'gd11x5R5ds', '', '', '11x5_r5ds', '0', '4', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150297', '任选六中五', '1', '15', '146.47', '128.03', '6', '15079', '手动输入号码，从01-11中任意输入6个号码组成一注。', '', '', 'gd11x5R6ds', '', '', '11x5_r6ds', '0', '5', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150298', '任选七中五', '1', '15', '42.02', '36.74', '7', '15079', '手动输入号码，从01-11中任意输入7个号码组成一注。', '', '', 'gd11x5R7ds', '', '', '11x5_r7ds', '0', '6', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('150299', '任选八中五', '1', '15', '15.70', '13.72', '8', '15079', '手动输入号码，从01-11中任意输入8个号码组成一注。', '', '', 'gd11x5R8ds', '', '', '11x5_r8ds', '0', '7', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16045', '任选一中一', '1', '16', '4.14', '3.61', '1', '1609', '从01～11中任选1个号码为一注。', '从01～11中任选1个号码为进行购买，只要当期摇出的5个号码中包含所选号码，即为中奖。', '如：05   开奖号码：01,02,03,04,05   即为中奖', 'gd11x5R1', 'r111x5', '', '115_rx1', '0', '0', '11', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16046', '任选二中二', '1', '16', '10.50', '9.18', '2', '1609', '从01～11中任选2个号码为一注。', '从01～11中任选2个号码为一注，选择2个以上号码为复式投注，投注号码与开奖号码中任意2个号码相同即为中奖，单注奖金6元。投注时可选择1个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02，01 03', 'gd11x5R2', 'r211x5', '', '115_rx2', '0', '0', '55', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16047', '任选三中三', '1', '16', '31.51', '21.55', '3', '1609', '从01～11中任选3个号码为一注。', '从01～11中任选3个号码为一注，选择3个以上号码为复式投注，投注号码与开奖号码中任意3个号码相同即为中奖，单注奖金19元。投注时可选择1～2个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03，01 02 04', 'gd11x5R3', 'r311x5', '', '115_rx3', '0', '0', '165', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16048', '任选四中四', '1', '16', '125.26', '109.48', '4', '1609', '从01～11中任选4个号码为一注。', '从01～11中任选4个号码为一注，选择4个以上号码为复式投注，投注号码与开奖号码中任意4个号码相同即为中奖，单注奖金78元。投注时可选择1～3个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04，01 02 03 05', 'gd11x5R4', 'r411x5', '', '115_rx4', '0', '0', '330', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16049', '任选五中五', '1', '16', '881.47', '770.98', '5', '1609', '从01～11中任选5个号码为一注。', '从01～11中任选5个号码为一注，选择5个以上号码为复式投注，投注号码与开奖号码全部相同即为中奖，单注奖金540元。投注时可选择1～4个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05', 'gd11x5R5', 'r511x5', '', '115_rx5', '0', '0', '462', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16050', '任选六中五', '1', '16', '146.47', '128.03', '6', '1609', '从01～11中任选6个号码为一注。', '从01～11中任选6个号码为一注，选择6个以上号码为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金90元。投注时可选择1～5个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05 X', 'gd11x5R6', 'r611x5', '', '115_rx6', '0', '0', '462', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16051', '任选七中五', '1', '16', '42.02', '36.74', '7', '1609', '从01～11中任选7个号码为一注。', '从01～11中任选7个号码为一注，选择7个以上号码即为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金26元。投注时可选择1～6个号码作为每注都有的胆码，再补充其它号码作为拖码进行投注。', '如：01 02 03 04 05 X X', 'gd11x5R7', 'r711x5', '', '115_rx7', '0', '0', '330', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16052', '任选八中五', '1', '16', '15.70', '13.72', '8', '1609', '从01～11中任选8个号码为一注。', '从01～11中任选8个号码为一注，选择8个以上号码为复式投注，投注号码中任意5个号码与5位开奖号码相同即为中奖，单注奖金9元。投注时可选择1～7个号码作为每注都有的胆码，再补充其它号码作为拖码投注。', '如：01 02 03 04 05 X X X', 'gd11x5R8', 'r811x5', '', '115_rx8', '0', '0', '165', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16053', '前二直选', '1', '16', '212.10', '183.70', '2', '16010', '对第1位和第2位各选1个号码为一注。', '对第1位和第2位各选1个号码为一注，某一位或两位选择2个以号码为复式投注，投注号码与开奖号码前2位按位一致即为中奖。', '如：01 02', 'gd11x5Q2', 'descar', 'fs', '115_q2_zhi', '0', '0', '111', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16054', '前二组选', '1', '16', '106.05', '91.85', '2', '16010', '对第1位和第2位各选1个号码为一注。', '对第1位和第2位各选1个号码为一注，某一位或两位选择2个以号码为复式投注，投注号码与开奖号码前2位按位一致即为中奖。', '如：01 02', 'gd11x5Q2z', 'r2', 'fs', '115_q2_zu', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16055', '前三直选', '1', '16', '1800.00', '1400.00', '3', '16011', '对第1位、第2位和第3位各选1个号码为一注。', '对第1位、第2位和第3位各选1个号码为一注，某一位或几位选择2个以号码为复式投注，投注号码与开奖号码前3位按位一致即为中奖。', '如：01 02 03', 'gd11x5Q3', 'descar', 'fs', '115_q3_zhi', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('16056', '前三组选', '1', '16', '300.00', '275.55', '3', '16011', '从01～11中任选3个号码为一注。', '从01～11中任选3个号码为一注，选择3个以上号码为复式投注，投注号码与开奖号码前3位一致，顺序不限，即为中奖。', '如：01 02 03，01 03 02', 'gd11x5Q3z', 'r3', 'fs', '115_q3_zu', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160152', '前三单式', '1', '16', '1890.90', '1653.30', '3', '16050', '与前后任选四星单复式同理，只是下注号改为4位。', '与前后任选四星单复式同理，只是下注号改为4位。', '与前后任选四星单复式同理，只是下注号改为4位。', 'syxwQ3d', 'ds', 'ds', '115_3x_q3d', '0', '4', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160153', '后三单式', '1', '16', '1890.90', '1653.30', '3', '16050', '与前后任选四星单复式同理，只是下注号改为6位。', '与前后任选四星单复式同理，只是下注号改为6位。', '与前后任选四星单复式同理，只是下注号改为6位。', 'syxwH3d', 'ds', 'ds', '115_3x_q3d', '0', '5', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160155', '前二单式', '1', '16', '210.10', '183.70', '2', '16050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwQ2d', 'ds', 'ds', '115_2x_2d', '0', '1', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160156', '后二单式', '1', '16', '210.10', '183.70', '2', '16050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwH2d', 'ds', 'ds', '115_2x_2d', '0', '2', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160157', '任选二单式', '1', '16', '210.10', '183.70', '2', '16050', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选三星单复式同理，只是下注号改为2位。', '与前后任选四星单复式同理，只是下注号改为2位。', 'syxwR2d', 'rx2ds', 'ds', '115_2x_r2d', '0', '3', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160259', '趣味_猜中位', '1', '16', '10.00', '10.00', '1', '16075', '从3-9中任意选择1个及1个以上数字。', '从3-9中选择一个号码进行购买，所选开奖号码与5个开奖号码按照大小顺序排列后的第三个号码相同，即为中奖', '投注方案：08，开奖号码:按大小顺序排列后04 05 08 09 11，中间数08，即中趣味_猜中位', 'qwwfczw', 'r1', 'r1', 'qwwf_czw', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160260', '趣味_定单双', '1', '16', '10.00', '10.00', '1', '16075', '从不同的单双组合中任意选择1个或1个以上的组合。', '从6个单双个数组合中选择1种组合，当前开奖号码的单双个数与所选单双组合一致，即为中奖', '投注方案：5单0双，开奖号码:01 03 05 07 09五个单数，即中趣味_定单双', 'qwwfdds', 'dds', '', 'qwwf_dds', '0', '0', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160281', '定位胆', '1', '16', '21.01', '18.37', '1', '16077', '从第一位，第二位，第三位任意位置上任意选择1个或1个以上号码。', '从第一位，第二位，第三位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', '', 'gd11x5dwd', '', '', 'ssc_11x5_dwd', '0', '0', '33', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160282', '不定位', '1', '16', '6.99', '6.12', '1', '16078', '从01-11中任意选择1个或1个以上号码。', '从01-11中共11个号码中选择1个号码，每注由1个号码组成，只要当期顺序摇出的第一位、第二位、第三位开奖号码中包含所选号码，即为中奖。', '', 'gd11x5bdw', '', '', 'ssc_11x5_bdw', '0', '0', '11', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160292', '任选一中一', '1', '16', '4.14', '3.61', '1', '16079', '手动输入号码，从01-11中任意输入1个号码组成一注。', '', '', 'gd11x5R1ds', '', '', '11x5_r1ds', '0', '0', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160293', '任选二中二', '1', '16', '10.50', '9.18', '2', '16079', '手动输入号码，从01-11中任意输入2个号码组成一注。', '', '', 'gd11x5R2ds', '', '', '11x5_r2ds', '0', '1', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160294', '任选三中三', '1', '16', '31.51', '21.55', '3', '16079', '手动输入号码，从01-11中任意输入3个号码组成一注。', '', '', 'gd11x5R3ds', '', '', '11x5_r3ds', '0', '2', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160295', '任选四中四', '1', '16', '125.26', '109.48', '4', '16079', '手动输入号码，从01-11中任意输入4个号码组成一注。', '', '', 'gd11x5R4ds', '', '', '11x5_r4ds', '0', '3', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160296', '任选五中五', '1', '16', '881.82', '770.98', '5', '16079', '手动输入号码，从01-11中任意输入5个号码组成一注。', '', '', 'gd11x5R5ds', '', '', '11x5_r5ds', '0', '4', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160297', '任选六中五', '1', '16', '146.47', '128.03', '6', '16079', '手动输入号码，从01-11中任意输入6个号码组成一注。', '', '', 'gd11x5R6ds', '', '', '11x5_r6ds', '0', '5', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160298', '任选七中五', '1', '16', '42.02', '36.74', '7', '16079', '手动输入号码，从01-11中任意输入7个号码组成一注。', '', '', 'gd11x5R7ds', '', '', '11x5_r7ds', '0', '6', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('160299', '任选八中五', '1', '16', '15.70', '13.72', '8', '16079', '手动输入号码，从01-11中任意输入8个号码组成一注。', '', '', 'gd11x5R8ds', '', '', '11x5_r8ds', '0', '7', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9057', '直选复式', '1', '9', '1910.00', '1670.00', '3', '9012', '从百位、十位、个位各选一个号码组成一注。', '从百位、十位、个位中选择一个3位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。', '如：01 02 03如：百位选1，十位选2，个位选3，则你投两注分别为123，开奖号为123，则为中奖。', 'fc3dFs', 'fs', '', 'ssc_3x_h3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9058', '直选单式', '1', '9', '1910.00', '1670.00', '3', '9012', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的百位、十位、个位相同，且顺序一致，即为中奖。', '如：输入123456，则你投两注分别为123和678，如果开奖号为123，则你中奖一注。', 'fc3dDs', 'ds', '', 'ssc_3x_q3d', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9059', '组三', '1', '9', '636.66', '556.66', '3', '9013', '从0-9中任意选择2个号码组成两注，所选号码与开奖号码的百位、十位、个位相同，且顺序不限，即为中奖。', '从0-9中任意选择2个号码组成两注，所选号码与开奖号码的百位、十位、个位相同，且顺序不限，即为中奖。', '如：选择12（展开为122**，212**，221** 和 112**、121**、211**），开奖号码为212 或 121，即为中奖。', 'fc3dZ3', 'z3', '', 'ssc_z3_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9060', '组六', '1', '9', '318.33', '278.33', '3', '9013', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的万位、千位、百位相同，顺序不限，即为中奖。', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的万位、千位、百位相同，顺序不限，即为中奖。', '如：选择123（展开为123**，132**，231**，213**，312**，321**），开奖号码为321**，即为中奖。', 'fc3dZ6', 'z6', '', 'ssc_z3_q6', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9061', '混合组选', '1', '9', '0.00', '0.00', '3', '9013', '手动输入号码，至少输入1个三位数号码。', '键盘手动输入， 3个数字（不能为同一个数字）号码为一注，开奖号码的百位、十位、个位符合前三的组三或组六均为中奖。', '如：选择百位、十位、个位三位置，再手动输入123、455两注，开奖号码为321即中组六奖，开奖号码为545即中组三奖。', '', '', '', '3d_hzx', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9062', '后二组选单式', '1', '9', '95.50', '83.50', '2', '9014', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入购买号码，2个数字（不能为同一个数字）为一注，所选号码与开奖号码的十位、个位相同，顺序不限，即为中奖。', '如：手动输入12，开奖号码为是*21或者*12，即为中奖。', 'fc3dZH2d', 'ds', 'ds', 'ssc_z2_d2', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9063', '后二组选复式', '1', '9', '95.50', '83.50', '2', '9014', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所选号码与开奖号码的十位、个位相同，顺序不限，即为中奖。', '如：选择7、8，开奖号码*78或*87即为中奖。', 'fc3dZH2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9064', '前二组选单式', '1', '9', '95.50', '83.50', '2', '9014', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入购买号码，2个数字（不能为同一个数字）为一注，所选号码与开奖号码的百位、十位相同，顺序不限，即为中奖。', '如：手动输入12，开奖号码为是21*或12*，即为中奖。', 'fc3dZQ2d', 'ds', 'ds', 'ssc_z2_d2', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9065', '前二组选复式', '1', '9', '95.50', '83.50', '2', '9014', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所择号码与开奖号码的百位、十位相同，顺序不限，即为中奖。', '如：选择7、8，开奖号码78*或87*，即为中奖。', 'fc3dZQ2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9066', '后二单式', '1', '9', '191.00', '167.00', '2', '9014', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，所选号码与开奖号码的十位、个位相同，且顺序一致，即为中奖。', '如：输入1234，则你投两注分别为12和34，如果开奖号为* 12，则您中奖一注。', 'fc3dH2d', 'ds', 'ds', 'ssc_2x_2d', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9067', '后二复式', '1', '9', '191.00', '167.00', '2', '9014', '从十位、个位中至少各选1个号码组成一注。', '从十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码前4位相同，且顺序一致，即为中奖。', '如：十位选1，个位选2，则你投两注分别为12，如果开奖号为* 12，则为中奖。', 'fc3dH2f', 'fs', 'fs', 'ssc_2x_h2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9068', '前二单式', '1', '9', '191.00', '167.00', '2', '9014', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，所选号码与开奖号码的百位、十位相同，且顺序一致，即为中奖。', '如：键盘输入1234，则你投两注分别为12和34，如果开奖号为12*，则您中奖一注。', 'fc3dQ2d', 'ds', 'ds', 'ssc_2x_2d', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9069', '前二复式', '1', '9', '191.00', '167.00', '2', '9014', '从百位、十位中至少各选1个号码组成一注。', '从百位、十位中选择一个2位数号码组成一注，所选号码与开奖号码前2位相同，且顺序一致，即为中奖。', '如：百位选1，十位选2，投两注号码为12，如果开奖号为12*，则为中奖。', 'fc3dQ2f', 'fs', 'fs', 'three_2x_q2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9070', '三星定位胆', '1', '9', '19.10', '16.70', '1', '9016', '在百位、十位、个位任意位置上任意选择1个或1个以上号码。', '从百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', ' 如：定百位为1，开奖号码为1**即为中奖；定十位为2，开奖号码为*2*即为中奖，如此类推。', 'fc3d3xdw', 'dwd', 'fs', 'three_3x_dw', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9071', '一码不定位', '1', '9', '7.00', '6.12', '1', '9017', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择一码不定位4，开出*4*、**4、4**即为中奖。', 'fc3dbdd', 'dwd', '', 'ssc_5x_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9072', '后二大小单双', '1', '9', '7.64', '6.68', '0', '9018', '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。', '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：十位选择大，个位选择单，开出***63即为中奖。', 'fc3dH2dxds', 'dxds', 'dxds', 'ssc_dxds_h2', '1', '0', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('9073', '任选大小单双', '1', '9', '7.64', '6.68', '0', '9018', '先从百位、十位、个位中选定两个位置，再在对应位置下注大小单双。', '先从百位、十位、个位中选定两个位置，再在对应位置下注大小单双。', '如：百位选择大，个位选择单，开出6*3即为中奖。', 'fc3dR2dxds', 'dxds', 'dxds', 'three_dxds_r2', '1', '0', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('90144', '二码不定位', '1', '9', '30.61', '30.61', '2', '9017', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择12，前三位，至少出现1和2各一个即为中奖。', 'bdwQ32', 'r2', '', 'ssc_2x_bdw', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('90300', '直选和值', '1', '9', '1910.00', '1670.00', '3', '9012', '从0-27中任意选择1个或1个以上号码。', '所选数值等于三个开奖号相加之和，即为中奖。', '投注方案：10  开奖号码：5,1,4   这中奖', 'fc3dhz', '', '', '3d_hz', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('90301', '组选和值', '1', '9', '230.00', '230.00', '0', '9013', '从1-26中任意选择1个或1个以上号码。', '所选数值等于开奖号码的三个数字相加之和，即为中奖。组三奖中奖两注，组六奖中奖一注', '', 'fc3d_zxhz', '', '', '3d_zxhz', '0', '0', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10057', '直选复式', '1', '10', '1910.00', '1670.00', '3', '10012', '从百位、十位、个位各选一个号码组成一注。', '从百位、十位、个位中选择一个3位数号码组成一注，所选号码与开奖号码全部相同，且顺序一致，即为中奖。', '如：01 02 03如：百位选1，十位选2，个位选3，则你投两注分别为123，开奖号为123，则为中奖。', 'fc3dFs', 'fs', '', 'ssc_3x_h3f', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10058', '直选单式', '1', '10', '1910.00', '1670.00', '3', '10012', '手动输入号码，至少输入1个三位数号码组成一注。', '手动输入一个3位数号码组成一注，所选号码与开奖号码的百位、十位、个位相同，且顺序一致，即为中奖。', '如：输入123456，则你投两注分别为123和678，如果开奖号为123，则你中奖一注。', 'fc3dDs', 'ds', '', 'ssc_3x_q3d', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10059', '组三', '1', '10', '636.66', '556.66', '3', '10013', '从0-9中任意选择2个号码组成两注，所选号码与开奖号码的百位、十位、个位相同，且顺序不限，即为中奖。', '从0-9中任意选择2个号码组成两注，所选号码与开奖号码的百位、十位、个位相同，且顺序不限，即为中奖。', '如：选择12（展开为122**，212**，221** 和 112**、121**、211**），开奖号码为212 或 121，即为中奖。', 'fc3dZ3', 'z3', '', 'ssc_z3_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10060', '组六', '1', '10', '318.33', '278.33', '3', '10013', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的万位、千位、百位相同，顺序不限，即为中奖。', '从0-9中任意选择3个号码组成一注，所选号码与开奖号码的万位、千位、百位相同，顺序不限，即为中奖。', '如：选择123（展开为123**，132**，231**，213**，312**，321**），开奖号码为321**，即为中奖。', 'fc3dZ6', 'z6', '', 'ssc_z3_q6', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10061', '混合组选', '1', '10', '0.00', '0.00', '3', '10013', '手动输入号码，至少输入1个三位数号码。', '键盘手动输入， 3个数字（不能为同一个数字）号码为一注，开奖号码的百位、十位、个位符合前三的组三或组六均为中奖。', '如：选择百位、十位、个位三位置，再手动输入123、455两注，开奖号码为321即中组六奖，开奖号码为545即中组三奖。', '', '', '', '3d_hzx', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10062', '后二组选单式', '1', '10', '95.50', '83.50', '2', '10014', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入购买号码，2个数字（不能为同一个数字）为一注，所选号码与开奖号码的十位、个位相同，顺序不限，即为中奖。', '如：手动输入12，开奖号码为是*21或者*12，即为中奖。', 'fc3dZH2d', 'ds', 'ds', 'ssc_z2_d2', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10063', '后二组选复式', '1', '10', '95.50', '83.50', '2', '10014', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所选号码与开奖号码的十位、个位相同，顺序不限，即为中奖。', '如：选择7、8，开奖号码*78或*87即为中奖。', 'fc3dZH2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10064', '前二组选单式', '1', '10', '95.50', '83.50', '2', '10014', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入购买号码，2个数字（不能为同一个数字）为一注，所选号码与开奖号码的百位、十位相同，顺序不限，即为中奖。', '如：手动输入12，开奖号码为是21*或12*，即为中奖。', 'fc3dZQ2d', 'ds', 'ds', 'ssc_z2_d2', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10065', '前二组选复式', '1', '10', '95.50', '83.50', '2', '10014', '从0-9中任意选择2个或2个以上号码。', '从0-9中选2个号码组成一注，所择号码与开奖号码的百位、十位相同，顺序不限，即为中奖。', '如：选择7、8，开奖号码78*或87*，即为中奖。', 'fc3dZQ2f', 'z2', 'fs', 'ssc_z2_f2', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10066', '后二单式', '1', '10', '191.00', '167.00', '2', '10014', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，所选号码与开奖号码的十位、个位相同，且顺序一致，即为中奖。', '如：输入1234，则你投两注分别为12和34，如果开奖号为* 12，则您中奖一注。', 'fc3dH2d', 'ds', 'ds', 'ssc_2x_2d', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10067', '后二复式', '1', '10', '191.00', '167.00', '2', '10014', '从十位、个位中至少各选1个号码组成一注。', '从十位、个位中选择一个4位数号码组成一注，所选号码与开奖号码前4位相同，且顺序一致，即为中奖。', '如：十位选1，个位选2，则你投两注分别为12，如果开奖号为* 12，则为中奖。', 'fc3dH2f', 'fs', 'fs', 'ssc_2x_h2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10068', '前二单式', '1', '10', '191.00', '167.00', '2', '10014', '手动输入号码，至少输入1个二位数号码组成一注。', '手动输入一个2位数号码组成一注，所选号码与开奖号码的百位、十位相同，且顺序一致，即为中奖。', '如：键盘输入1234，则你投两注分别为12和34，如果开奖号为12*，则您中奖一注。', 'fc3dQ2d', 'ds', 'ds', 'ssc_2x_2d', '0', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10069', '前二复式', '1', '10', '191.00', '167.00', '2', '10014', '从百位、十位中至少各选1个号码组成一注。', '从百位、十位中选择一个2位数号码组成一注，所选号码与开奖号码前2位相同，且顺序一致，即为中奖。', '如：百位选1，十位选2，投两注号码为12，如果开奖号为12*，则为中奖。', 'fc3dQ2f', 'fs', 'fs', 'three_2x_q2f', '1', '0', '100', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10070', '三星定位胆', '1', '10', '19.10', '16.70', '1', '10016', '在百位、十位、个位任意位置上任意选择1个或1个以上号码。', '从百位、十位、个位任意1个位置或多个位置上选择1个号码，所选号码与相同位置上的开奖号码一致，即为中奖。', ' 如：定百位为1，开奖号码为1**即为中奖；定十位为2，开奖号码为*2*即为中奖，如此类推。', 'fc3d3xdw', 'dwd', 'fs', 'three_3x_dw', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10071', '一码不定位', '1', '10', '7.00', '6.12', '1', '10017', '从0-9中任意选择1个以上号码。', '从0-9中选择1个号码，每注由1个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择一码不定位4，开出*4*、**4、4**即为中奖。', 'fc3dbdd', 'dwd', '', 'ssc_5x_q3', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10072', '后二大小单双', '1', '10', '7.64', '6.68', '0', '10018', '从十位、个位中的“大、小、单、双”中至少各选一个组成一注。', '对十位和个位的“大（56789）小（01234）、单（13579）双（02468）”形态进行购买，所选号码的位置、形态与开奖号码的位置、形态相同，即为中奖。', '如：十位选择大，个位选择单，开出***63即为中奖。', 'fc3dH2dxds', 'dxds', 'dxds', 'ssc_dxds_h2', '1', '0', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('10073', '任选大小单双', '1', '10', '7.64', '6.68', '0', '10018', '先从百位、十位、个位中选定两个位置，再在对应位置下注大小单双。', '先从百位、十位、个位中选定两个位置，再在对应位置下注大小单双。', '如：百位选择大，个位选择单，开出6*3即为中奖。', 'fc3dR2dxds', 'dxds', 'dxds', 'three_dxds_r2', '1', '0', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('100144', '二码不定位', '1', '10', '30.61', '30.61', '2', '10017', '从0-9中任意选择2个以上号码。', '从0-9中选择2个号码，每注由2个号码组成，只要开奖号码的百位、十位、个位中包含所选号码，即为中奖。', '如：选择12，前三位，至少出现1和2各一个即为中奖。', 'bdwQ32', 'r2', '', 'ssc_2x_bdw', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('100300', '直选和值', '1', '10', '1910.00', '1670.00', '3', '10012', '从0-27中任意选择1个或1个以上号码。', '所选数值等于三个开奖号相加之和，即为中奖。', '投注方案：10  开奖号码：5,1,4   这中奖', 'fc3dhz', '', '', '3d_hz', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('100301', '组选和值', '1', '10', '230.00', '230.00', '0', '10013', '从1-26中任意选择1个或1个以上号码。', '所选数值等于开奖号码的三个数字相加之和，即为中奖。组三奖中奖两注，组六奖中奖一注', '', 'fc3d_zxhz', '', '', '3d_zxhz', '0', '0', '210', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17074', '选一数投', '1', '17', '15.00', '12.50', '1', '17020', '从01至18中任选1个,投注号码与开奖号码第一位相同，即中奖。', '从01至18中任选1个,投注号码与开奖号码第一位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码01|-|-|-|-', 'klsfR1B', 'r1', '', 'klsf_x1_r1l', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17075', '选一红投', '1', '17', '5.00', '3.00', '1', '17020', '19，20为红号，从这两个号码任选一个投注，开奖号码第一位是红号（19或20），即为中奖。', '19，20为红号，从这两个号码任选一个投注，开奖号码第一位是红号（19或20），即为中奖。', '示例：开奖号码20 01 02 03 04 05 06 07，投注号码20|-|-|-|-或19|-|-|-|-。', 'klsfR1R', 'r1', '', 'klsf_x1_r1h', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17076', '任选二', '1', '17', '10.00', '8.00', '2', '17019', '从20个号码中任选2个,投注号码与开奖号码任意两位相同，即中奖。', '从20个号码中任选2个,投注号码与开奖号码任意两位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码03 06', 'klsfR2', 'r2', '', 'klsf_rx2', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17077', '任选三', '1', '17', '15.00', '12.00', '3', '17019', '从20个号码中任选3个,投注号码与开奖号码任意三位相同，即中奖。', '从20个号码中任选3个,投注号码与开奖号码任意三位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码04 06 07', 'klsfR3', 'r3', '', 'klsf_rx3', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17078', '任选四', '1', '17', '45.00', '40.00', '4', '17019', '从20个号码中任选4个,投注号码与开奖号码任意四位相同，即中奖。', '从20个号码中任选4个,投注号码与开奖号码任意四位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码01 04 06 07', 'klsfR4', 'r4', '', 'klsf_rx4', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17079', '任选五', '1', '17', '165.00', '160.00', '5', '17019', '从20个号码中任选5个,投注号码与开奖号码任意五位相同，即中奖。', '从20个号码中任选5个,投注号码与开奖号码任意五位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码01 02 03 06 08', 'klsfR5', 'r5', '', 'klsf_rx5', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17080', '选二连直', '1', '17', '35.00', '25.00', '2', '17021', '从20个号码中任选连续两位,投注号码与开奖号码任意连续两位数字、顺序均相同，即中奖。', '从20个号码中任选连续两位,投注号码与开奖号码任意连续两位数字、顺序均相同，即中奖。', '示例：开奖号码01 03 02 04 05 06 07 08，投注号码03 02', 'klsfQ2', 'zx11', '', 'klsf_x2_lzhi', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17081', '选二连组', '1', '17', '16.00', '14.00', '2', '17021', '从20个号码中任选2个,投注号与开奖号任意连续两位数字相同(顺序不限)，即中奖。', '从20个号码中任选2个,投注号与开奖号任意连续两位数字相同(顺序不限)，即中奖。', '示例：开奖号码01 03 02 04 05 06 07 08，投注号码02 03', 'klsfQ2z', 'r2', '', 'klsf_x2_lzu', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17082', '选三前直', '1', '17', '4000.00', '4000.00', '3', '17022', '从20个号码中猜开奖号码前三位,投注号码与开奖号码前三位数字、顺序均相同，即中奖。', '从20个号码中猜开奖号码前三位,投注号码与开奖号码前三位数字、顺序均相同，即中奖。', '示例：开奖号码01 03 02 04 05 06 07 08，投注号码01 03 02', 'klsfQ3', 'zx11', '', 'klsf_x3_qzhi', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('17083', '选三前组', '1', '17', '650.00', '650.00', '3', '17022', '从20个号码中猜开奖号码的前三位,投注号与开奖号前三位数字相同(顺序不限)，即中奖。', '从20个号码中猜开奖号码的前三位,投注号与开奖号前三位数字相同(顺序不限)，即中奖。', '示例：开奖号码01 03 02 04 05 06 07 08，投注号码01 02 03', 'klsfQ3z', 'r3', '', 'klsf_x3_qzu', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18074', '选一数投', '1', '18', '30.00', '25.00', '1', '18020', '从01至18中任选1个,投注号码与开奖号码第一位相同，即中奖。', '从01至18中任选1个,投注号码与开奖号码第一位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码01|-|-|-|-', 'klsfR1B', 'r1', '', 'klsf_x1_r1l', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18075', '选一红投', '1', '18', '7.00', '5.00', '1', '18020', '19，20为红号，从这两个号码任选一个投注，开奖号码第一位是红号（19或20），即为中奖。', '19，20为红号，从这两个号码任选一个投注，开奖号码第一位是红号（19或20），即为中奖。', '示例：开奖号码20 01 02 03 04 05 06 07，投注号码20|-|-|-|-或19|-|-|-|-。', 'klsfR1R', 'r1', '', 'klsf_x1_r1h', '1', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18076', '任选二', '1', '18', '16.00', '13.60', '2', '18019', '从20个号码中任选2个,投注号码与开奖号码任意两位相同，即中奖。', '从20个号码中任选2个,投注号码与开奖号码任意两位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码03 06', 'klsfR2', 'r2', '', 'klsf_rx2', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18077', '任选三', '1', '18', '48.00', '40.80', '3', '18019', '从20个号码中任选3个,投注号码与开奖号码任意三位相同，即中奖。', '从20个号码中任选3个,投注号码与开奖号码任意三位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码04 06 07', 'klsfR3', 'r3', '', 'klsf_rx3', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18078', '任选四', '1', '18', '160.00', '136.00', '4', '18019', '从20个号码中任选4个,投注号码与开奖号码任意四位相同，即中奖。', '从20个号码中任选4个,投注号码与开奖号码任意四位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码01 04 06 07', 'klsfR4', 'r4', '', 'klsf_rx4', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18079', '任选五', '1', '18', '640.00', '544.00', '5', '18019', '从20个号码中任选5个,投注号码与开奖号码任意五位相同，即中奖。', '从20个号码中任选5个,投注号码与开奖号码任意五位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08，投注号码01 02 03 06 08', 'klsfR5', 'r5', '', 'klsf_rx5', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18080', '选二连直', '1', '18', '35.00', '25.00', '2', '18021', '从20个号码中任选连续两位,投注号码与开奖号码任意连续两位数字、顺序均相同，即中奖。', '从20个号码中任选连续两位,投注号码与开奖号码任意连续两位数字、顺序均相同，即中奖。', '示例：开奖号码01 03 02 04 05 06 07 08，投注号码03 02', 'klsfQ2', 'zx11', '', 'klsf_x2_lzhi', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18081', '选二连组', '1', '18', '16.00', '14.00', '2', '18021', '从20个号码中任选2个,投注号与开奖号任意连续两位数字相同(顺序不限)，即中奖。', '从20个号码中任选2个,投注号与开奖号任意连续两位数字相同(顺序不限)，即中奖。', '示例：开奖号码01 03 02 04 05 06 07 08，投注号码02 03', 'klsfQ2z', 'r2', '', 'klsf_x2_lzu', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18082', '选三前直', '1', '18', '2000.00', '1700.00', '3', '18022', '从20个号码中猜开奖号码前三位,投注号码与开奖号码前三位数字、顺序均相同，即中奖。', '从20个号码中猜开奖号码前三位,投注号码与开奖号码前三位数字、顺序均相同，即中奖。', '示例：开奖号码01 03 02 04 05 06 07 08，投注号码01 03 02', 'klsfQ3', 'zx11', '', 'klsf_x3_qzhi', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('18083', '选三前组', '1', '18', '666.66', '566.66', '3', '18022', '从20个号码中猜开奖号码的前三位,投注号与开奖号前三位数字相同(顺序不限)，即中奖。', '从20个号码中猜开奖号码的前三位,投注号与开奖号前三位数字相同(顺序不限)，即中奖。', '示例：开奖号码01 03 02 04 05 06 07 08，投注号码01 02 03', 'klsfQ3z', 'r3', '', 'klsf_x3_qzu', '0', '0', '1000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200233', '九名', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds9', 'dxds', '', 'pk10_lm_dxds1', '0', '9', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200230', '六名', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds6', 'dxds', '', 'pk10_lm_dxds1', '0', '6', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200231', '七名', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds7', 'dxds', '', 'pk10_lm_dxds1', '0', '7', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200246', '冠亚总和', '1', '20', '0.00', '0.00', '1', '20070', '至少选择一个号码。', '冠亚军总和为开奖号码的冠亚军的总和，即为中奖。', '投注方案：03<br开奖号码：01,02********', 'pk10gy2', 'r1', '', 'pk10_gyh1', '0', '2', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200247', '冠亚组合', '1', '20', '100.00', '100.00', '1', '20070', '至少选择一个组合。', '根据前两位数字（第一，二名）中奖号码为兑奖号码，投注两个号码，如果在开奖结果的前二位数中存在，不分顺序，视为中奖。', '投注方案：龙<br>1-2开奖号码：01,02********', 'pk10gyzh', 'r1', '', 'pk10_gyzh', '0', '1', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200242', '冠亚军', '1', '20', '0.00', '0.00', '1', '20068', '选择龙虎作为投注号码。', '前二位(第一、二名)号码总和大于后二位(第九、十名)号码总和视为【龙】中奖、反之小于视为【虎】中奖，其余情形视为不中奖。', '投注方案：龙<br>开奖号码：09,10******01,02', 'pk10lh12', 'lh', '', 'pk10_lh', '0', '6', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200243', '冠亚季军', '1', '20', '0.00', '0.00', '1', '20068', '选择龙虎作为投注号码。', '前三位(第一、二、三名)号码总和大于后三位(第八、九、十名)号码总和视为【龙】中奖、反之小于视为【虎】中奖，其余情形视为不中奖。', '投注方案：龙<br>开奖号码：07,08,09****01,02,03', 'pk10lh123', 'lh', '', 'pk10_lh', '0', '7', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200244', '冠亚季选一', '1', '20', '0.00', '0.00', '1', '20069', '至少选择一个号码。', '前三位(第一、二、三名)中奖号码为兑奖号码，投注一个号码，如果在开奖结果的前三位数中存在，视为中奖。', '投注方案：01<br>开奖号码：01,02,03*******', 'pk10r123', 'r1', '', 'pk10_x1', '0', '1', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200239', '季军', '1', '20', '0.00', '0.00', '1', '20068', '选择龙虎作为投注号码。', '“第三名”号码大于“第八名”号码视为【龙】中奖、反之小于视为【虎】中奖，其余情形视为不中奖。', '投注方案：龙<br>开奖号码：**10****01**', 'pk10lh3', 'lh', '', 'pk10_lh', '0', '3', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200240', '第四名', '1', '20', '0.00', '0.00', '1', '20068', '选择龙虎作为投注号码。', '“第四名”号码大于“第七名”号码视为【龙】中奖、反之小于视为【虎】中奖，其余情形视为不中奖。', '投注方案：龙<br>开奖号码：***10**01***', 'pk10lh4', 'lh', '', 'pk10_lh', '0', '4', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200241', '第五名', '1', '20', '0.00', '0.00', '1', '20068', '选择龙虎作为投注号码。', '“第五名”号码大于“第六名”号码视为【龙】中奖、反之小于视为【虎】中奖，其余情形视为不中奖。', '投注方案：龙<br>开奖号码：****10,01****', 'pk10lh5', 'lh', '', 'pk10_lh', '0', '5', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200236', '冠亚季', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds33', 'dxds', '', 'pk10_lm_dxds1', '0', '12', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200237', '冠军', '1', '20', '0.00', '0.00', '1', '20068', '选择龙虎作为投注号码。', '“第一名”号码大于“第十名”号码视为【龙】中奖、反之小于视为【虎】中奖，其余情形视为不中奖。', '投注方案：龙<br>开奖号码：10********01', 'pk10lh1', 'lh', '', 'pk10_lh', '0', '1', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200235', '冠亚', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds22', 'dxds', '', 'pk10_lm_dxds1', '0', '11', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('20093', '猜冠军', '1', '20', '19.60', '18.00', '1', '20026', '选择1个数字号码竞猜全部开奖号码，投注号码与开奖号码前1相同中奖。', '选择1个数字号码竞猜全部开奖号码，投注号码与开奖号码前1相同中奖。', '', 'kjq1', 'r1', '', 'bjpk10_x1', '0', '1', '10', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('20094', '猜冠亚军', '1', '20', '102.00', '88.00', '2', '20027', '选择2个数字号码竞猜全部开奖号码，投注号码与开奖号码前2相同中奖。', '选择2个数字号码竞猜全部开奖号码，投注号码与开奖号码前2相同中奖。', '', 'kjq2', 'descar', '', 'bjpk10_x2', '0', '2', '90', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('20095', '猜前三名', '1', '20', '308.00', '256.00', '3', '20028', '选择3个数字号码竞猜全部开奖号码，投注号码与开奖号码前3相同中奖。', '选择3个数字号码竞猜全部开奖号码，投注号码与开奖号码前3相同中奖。', '', 'kjq3', 'descar', '', 'bjpk10_x3', '0', '3', '720', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('20096', '定位胆选', '1', '20', '19.60', '18.00', '4', '20029', '任意选择1个或1个以上号码。', '任意选择1个或1个以上号码，投注号码与开奖号码相同中奖。', '', 'dwd10x', 'dwd10', '', 'bjpk10_dw', '0', '4', '50', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('80108', '选一', '1', '8', '6.40', '6.40', '1', '38', '从01-80中任选1个以上号码。', '从80个号码中任选1个,投注号码与开奖号码任意一位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08 09 10 09 10，投注号码01', 'k8R1', 'r1', '', 'k8_rx1', '0', '1', '80', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('80109', '选二', '1', '8', '16.00', '10.00', '2', '38', '从01-80中任选2至8个号码。', '从80个号码中任选2个,投注号码与开奖号码任意二位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08 09 10，投注号码01 06', 'k8R2', 'r2', '', 'k8_rx2', '0', '2', '3160', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('80110', '选三', '1', '8', '30.00', '30.00', '3', '38', '从01-80中任选3至8个号码。', '从80个号码中任选3个,投注号码与开奖号码任意三位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08 09 10，投注号码01 04 06', 'k8R3', 'r3', '', 'k8_rx3', '0', '3', '82160', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('80111', '选四', '1', '8', '40.00', '40.00', '4', '38', '从01-80中任选4至8个号码。', '从80个号码中任选4个,投注号码与开奖号码任意四位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08 09 10，投注号码01 04 06 07', 'k8R4', 'r4', '', 'k8_rx4', '0', '4', '100000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('80112', '选五', '1', '8', '250.00', '250.00', '5', '38', '从01-80中任选5至8个号码。', '从80个号码中任选5个,投注号码与开奖号码任意五位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08 09 10，投注号码01 02 04 06 07', 'k8R5', 'r5', '', 'k8_rx5', '0', '5', '100000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('80113', '选六', '1', '8', '600.00', '600.00', '6', '38', '从01-80中任选6至8个号码。', '从80个号码中任选6个,投注号码与开奖号码任意六位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08 09 10，投注号码01 02 03 04 06 07', 'k8R6', 'r6', '', 'k8_rx6', '0', '6', '100000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('80114', '选七', '1', '8', '8000.00', '8000.00', '7', '38', '从01-80中任选7或8个号码。', '从80个号码中任选7个,投注号码与开奖号码任意七位相同，即中奖。', '示例：开奖号码01 02 03 04 05 06 07 08 09 10，投注号码01 02 03 04 05 06 08', 'k8R7', 'r7', '', 'k8_rx7', '0', '7', '100000', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('250118', '和值', '1', '25', '28.00', '28.00', '1', '25039', '与开奖号码3个数字相加的点数一致即中奖。', '与开奖号码3个数字相加的点数一致即中奖。', '示例：', 'k3hz', 'r1', '', 'k3_hz', '0', '1', '16', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('250119', '三同号通选', '1', '25', '40.00', '40.00', '1', '25040', '2元全包豹子(111,222,333,444,555,666)投注，开出任意豹子即中奖。', '2元全包豹子(111,222,333,444,555,666)投注，开出任意豹子即中奖。', '示例：', 'k33tx', 'r1', '', 'k3_3tx', '0', '3', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('250120', '三同号单选', '1', '25', '240.00', '240.00', '1', '25041', '2元单选1个豹子(111,222,333,444,555,666)投注，选号与开奖号码一致即中奖。', '2元单选1个豹子(111,222,333,444,555,666)投注，选号与开奖号码一致即中奖。', '示例：', 'k33dx', 'r1', '', 'k3_3dx', '0', '2', '6', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('250121', '二同号复选', '1', '25', '15.00', '15.00', '1', '25042', '选择对子(11*,22*,33*,44*,55*,66*)投注，开奖号码中包含选择的对子即中奖。', '选择对子(11*,22*,33*,44*,55*,66*)投注，开奖号码中包含选择的对子即中奖。', '示例：', 'k32fx', 'r1', '', 'k3_2fx', '0', '6', '6', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('250122', '二同号单选', '1', '25', '80.00', '80.00', '2', '25043', '选择1个对子和1个不同号码投注，选号与开奖号码一致即中奖。', '选择1个对子和1个不同号码投注，选号与开奖号码一致即中奖。', '示例：', 'k32dx', 'zx11', '', 'k3_2dx', '0', '7', '36', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('250123', '三不同号', '1', '25', '40.00', '40.00', '3', '25044', '至少选择3个不同号码投注，选号与开奖号码一致即中奖。', '至少选择3个不同号码投注，选号与开奖号码一致即中奖。', '示例：', 'k33x', 'r3', '', 'k3_3x', '0', '5', '20', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('250124', '二不同号', '1', '25', '8.00', '8.00', '2', '25045', '至少选择2个不同号码投注，选号与开奖号码一致即中奖。', '至少选择2个不同号码投注，选号与开奖号码一致即中奖。', '示例：', 'k32x', 'r2', '', 'k3_2x', '0', '8', '15', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('250125', '三连号通选', '1', '25', '10.00', '10.00', '1', '25046', '2元全包顺子(123,234,345,456)投注，开出任意顺子即中奖。', '2元全包顺子(123,234,345,456)投注，开出任意顺子即中奖。', '示例：', 'k33ltx', 'r1', '', 'k3_3ltx', '0', '4', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200234', '十名', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds10', 'dxds', '', 'pk10_lm_dxds1', '0', '10', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200232', '八名', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds8', 'dxds', '', 'pk10_lm_dxds1', '0', '8', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200229', '五名', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds5', 'dxds', '', 'pk10_lm_dxds1', '0', '5', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200228', '四名', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds4', 'dxds', '', 'pk10_lm_dxds1', '0', '4', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200227', '亚军', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds2', 'dxds', '', 'pk10_lm_dxds1', '0', '2', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200226', '季军', '1', '20', '0.00', '0.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds3', 'dxds', '', 'pk10_lm_dxds1', '0', '3', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200225', '冠军', '1', '20', '3.00', '3.00', '1', '20067', '至少选择一个号码。', '', '', 'pk10lmdxds1', 'dxds', '', 'pk10_lm_dxds1', '0', '1', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('200238', '亚军', '1', '20', '0.00', '0.00', '1', '20068', '选择龙虎作为投注号码。', '“第二名”号码大于“第九名”号码视为【龙】中奖、反之小于视为【虎】中奖，其余情形视为不中奖。', '投注方案：龙<br>开奖号码：*10******01*', 'pk10lh2', 'lh', '', 'pk10_lh', '0', '2', '0', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1308', '特码', '1', '30', '84.00', '84.00', '1', '18023', '从1-49中任意选择1个或1个以上号码。', '', '', 'lhctm', 'lhctm', 'dd5x', 'lhc_tm', '0', '0', '49', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1309', '2中2', '1', '30', '120.00', '120.00', '2', '18023', '买2个平码全中，特码不计', '', '', 'lhc2z2', 'lhc2z2', '', 'lhc_2z2', '0', '1', '1176', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1310', '3中3', '1', '30', '800.00', '800.00', '3', '18023', '买3个平码全中，特码不计', '', '', 'lhc3z3', 'lhc3z3', '', 'lhc_3z3', '0', '2', '18424', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1313', '7不中', '1', '30', '6.00', '6.00', '7', '18023', '选择7个号，平码及特码都不中。', '', '', 'lhc7bz', 'lhc7bz', '', 'lhc_7bz', '0', '4', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1311', '特码大小', '1', '30', '3.60', '3.60', '1', '18023', '25号以下为小，26号以上为大', '', '', 'lhctmdx', 'lhctmdx', '', 'lhc_tmdx', '0', '8', '2', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1312', '5不中', '1', '30', '4.00', '4.00', '5', '18023', '选择5个号，平码及特码都不中。', '', '', 'lhc5bz', 'lhc5bz', '', 'lhc_5bz', '0', '3', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1314', '总单双', '1', '30', '3.60', '3.60', '1', '18023', '7个号码总和后的尾数形态', '', '', 'lhczds', 'lhczds', '', 'lhc_zds', '0', '6', '1', '0', '0.0000');
INSERT INTO `ssc_played` VALUES ('1315', '总大小', '1', '30', '3.60', '3.60', '1', '18023', '7个号码总和174以上为大，以下为小', '', '', 'lhczdx', 'lhczdx', '', 'lhc_zdx', '0', '7', '1', '0', '0.0000');

-- ----------------------------
-- Table structure for `ssc_played_daily_count`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_played_daily_count`;
CREATE TABLE `ssc_played_daily_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(8) NOT NULL DEFAULT '0' COMMENT '8位数日期',
  `type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '采种',
  `played` int(11) NOT NULL DEFAULT '0' COMMENT '玩法',
  `betCount` int(5) NOT NULL DEFAULT '0' COMMENT '订单总数',
  `betAmount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '总投注金额',
  `zjAmount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '总中奖金额',
  `fanDianAmount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '总返点金额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni` (`date`,`type`,`played`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_played_daily_count
-- ----------------------------
INSERT INTO `ssc_played_daily_count` VALUES ('5', '20150111', '1', '3', '18', '79687.9620', '78855.2000', '-5671.3191');
INSERT INTO `ssc_played_daily_count` VALUES ('6', '20150111', '1', '2', '0', '0.0000', '0.0000', '0.0000');

-- ----------------------------
-- Table structure for `ssc_played_group`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_played_group`;
CREATE TABLE `ssc_played_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `type` tinyint(4) NOT NULL COMMENT 'ssc_type.type',
  `groupName` varchar(32) CHARACTER SET utf8 NOT NULL,
  `sort` int(4) NOT NULL,
  `bdwEnable` tinyint(1) NOT NULL DEFAULT '0',
  `android` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `enable` (`enable`,`type`,`groupName`,`sort`,`bdwEnable`)
) ENGINE=MyISAM AUTO_INCREMENT=26012 DEFAULT CHARSET=latin1 COMMENT='玩法组表';

-- ----------------------------
-- Records of ssc_played_group
-- ----------------------------
INSERT INTO `ssc_played_group` VALUES ('16077', '1', '16', '定位胆', '3', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('16075', '1', '16', '趣味型', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('16050', '1', '16', '单式', '2', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('16011', '1', '16', '前三', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('16010', '1', '16', '前二', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1609', '1', '16', '任选复试', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('15079', '1', '15', '任选单试', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('15078', '1', '15', '不定位', '4', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('15077', '1', '15', '定位胆', '3', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('15075', '1', '15', '趣味型', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('15050', '1', '15', '单式', '2', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('15011', '1', '15', '前三', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('15010', '1', '15', '前二', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1509', '1', '15', '任选复试', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('7079', '1', '7', '任选单试', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('7078', '1', '7', '不定位', '4', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('7077', '1', '7', '定位胆', '3', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('7075', '1', '7', '趣味型', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('7050', '1', '7', '单式', '2', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('7011', '1', '7', '前三', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('7010', '1', '7', '前二', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('709', '1', '7', '任选复试', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('6079', '1', '6', '任选单试', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('20026', '1', '20', '猜冠军', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('20027', '1', '20', '猜冠亚军', '2', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('20028', '1', '20', '猜前三名', '3', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('20029', '0', '20', '定位胆选', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('38', '1', '8', '任选', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('25039', '1', '25', '和值', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('25040', '1', '25', '三同号通选', '3', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('25041', '1', '25', '三同号单选', '2', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('25042', '1', '25', '二同号复选', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('25043', '1', '25', '二同号单选', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('25044', '1', '25', '三不同号', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('25045', '1', '25', '二不同号', '8', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('25046', '1', '25', '三连号通选', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('6078', '1', '6', '不定位', '4', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('6077', '1', '6', '定位胆', '3', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('6075', '1', '6', '趣味型', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('6050', '1', '6', '单式', '2', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('6011', '1', '6', '前三', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('6010', '1', '6', '前二', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('609', '1', '6', '任选复试', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('26011', '1', '26', '趣味', '11', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('20067', '1', '20', '两面', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('20068', '1', '20', '龙虎', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('20069', '1', '20', '冠亚季选一', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('20070', '1', '20', '冠亚组合', '8', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('26010', '1', '26', '任选玩法', '10', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('2609', '1', '26', '大小单双', '9', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('2608', '1', '26', '不定胆', '8', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('2607', '1', '26', '定位胆', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('2606', '1', '26', '二星组选', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('2605', '1', '26', '二星直选', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('2604', '1', '26', '三星组选', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('101', '1', '1', '五星玩法', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('102', '1', '1', '四星玩法', '2', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('103', '1', '1', '三星玩法', '3', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('104', '1', '1', '三星组选', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('105', '1', '1', '二星直选', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('106', '1', '1', '二星组选', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('107', '0', '1', '定位胆', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('108', '1', '1', '不定胆', '8', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('109', '1', '1', '大小单双', '9', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1010', '1', '1', '任选玩法', '10', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1011', '1', '1', '趣味', '11', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('301', '1', '3', '五星玩法', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('302', '1', '3', '四星玩法', '2', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('303', '1', '3', '三星玩法', '3', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('304', '1', '3', '三星组选', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('305', '1', '3', '二星直选', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('306', '1', '3', '二星组选', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('307', '1', '3', '定位胆', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('308', '1', '3', '不定胆', '8', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('309', '1', '3', '大小单双', '9', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('3010', '1', '3', '任选玩法', '10', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('3011', '1', '3', '趣味', '11', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('501', '1', '5', '五星玩法', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('502', '1', '5', '四星玩法', '2', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('503', '1', '5', '三星玩法', '3', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('504', '1', '5', '三星组选', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('505', '1', '5', '二星直选', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('506', '1', '5', '二星组选', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('507', '1', '5', '定位胆', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('508', '1', '5', '不定胆', '8', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('509', '1', '5', '大小单双', '9', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('5010', '1', '5', '任选玩法', '10', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('5011', '1', '5', '趣味', '11', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1401', '1', '14', '五星玩法', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1402', '1', '14', '四星玩法', '2', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('1403', '1', '14', '三星玩法', '3', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('1404', '1', '14', '三星组选', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1405', '1', '14', '二星直选', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1406', '1', '14', '二星组选', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1407', '1', '14', '定位胆', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1408', '1', '14', '不定胆', '8', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('1409', '1', '14', '大小单双', '9', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('14010', '1', '14', '任选玩法', '10', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('14011', '1', '14', '趣味', '11', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1201', '1', '12', '五星玩法', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1202', '1', '12', '四星玩法', '2', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('1203', '1', '12', '三星玩法', '3', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('1204', '1', '12', '三星组选', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1205', '1', '12', '二星直选', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1206', '1', '12', '二星组选', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1207', '1', '12', '定位胆', '7', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('1208', '1', '12', '不定胆', '8', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('1209', '1', '12', '大小单双', '9', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('12010', '1', '12', '任选玩法', '10', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('12011', '1', '12', '趣味', '11', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('2601', '1', '26', '五星玩法', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('2602', '1', '26', '四星玩法', '2', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('2603', '1', '26', '三星玩法', '3', '0', '1');
INSERT INTO `ssc_played_group` VALUES ('16078', '1', '16', '不定位', '4', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('16079', '1', '16', '任选单试', '6', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('9012', '1', '9', '直选', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('9013', '1', '9', '组选', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('9014', '1', '9', '二码', '3', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('9016', '1', '9', '定位胆', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('9017', '1', '9', '不定位', '2', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('9018', '1', '9', '大小单双', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('10012', '1', '10', '直选', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('10013', '1', '10', '组选', '1', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('10014', '1', '10', '二码', '3', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('10016', '1', '10', '定位胆', '5', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('10017', '1', '10', '不定位', '2', '1', '0');
INSERT INTO `ssc_played_group` VALUES ('10018', '1', '10', '大小单双', '4', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('17019', '1', '17', '任选', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('17020', '1', '17', '选一', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('17021', '1', '17', '选二', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('17022', '1', '17', '选三', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('18019', '1', '18', '任选', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('18020', '1', '18', '选一', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('18021', '1', '18', '选二', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('18022', '1', '18', '选三', '0', '0', '0');
INSERT INTO `ssc_played_group` VALUES ('18023', '1', '10', '一般玩法', '0', '0', '0');

-- ----------------------------
-- Table structure for `ssc_prize_lock`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_prize_lock`;
CREATE TABLE `ssc_prize_lock` (
  `id` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_prize_lock
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_problem`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_problem`;
CREATE TABLE `ssc_problem` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `content` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ssc_problem
-- ----------------------------
INSERT INTO `ssc_problem` VALUES ('1', '<p>ddddddddddddddddddd</p>\n');
INSERT INTO `ssc_problem` VALUES ('2', '在线充值说明');
INSERT INTO `ssc_problem` VALUES ('3', '平台提现说明');
INSERT INTO `ssc_problem` VALUES ('4', '在线客服说明');
INSERT INTO `ssc_problem` VALUES ('5', '免责声明');

-- ----------------------------
-- Table structure for `ssc_score_goods`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_score_goods`;
CREATE TABLE `ssc_score_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '描述',
  `picmin` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '小图片',
  `picmax` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '大图片',
  `intoTime` int(11) NOT NULL COMMENT '加入时间',
  `restriction` int(11) NOT NULL DEFAULT '0' COMMENT '限制单人兑换件数',
  `sum` int(11) NOT NULL DEFAULT '0' COMMENT '商品总数',
  `surplus` int(11) NOT NULL COMMENT '剩余件数',
  `persons` int(11) NOT NULL DEFAULT '0' COMMENT '参与人数',
  `startTime` int(11) NOT NULL COMMENT '开始时间',
  `stopTime` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `score` int(11) NOT NULL COMMENT '积分',
  `price` int(11) NOT NULL COMMENT '价值',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '开关状态：0关闭，1开启',
  `isdelete` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COMMENT='兑换商品表';

-- ----------------------------
-- Records of ssc_score_goods
-- ----------------------------
INSERT INTO `ssc_score_goods` VALUES ('42', '积分兑换', '25000积分兑换50元现金', 'template/images/goods/4.png', 'template/images/goods/4.png', '1434430666', '0', '999999', '15', '0', '1434430742', '0', '25000', '50', '1', '0');
INSERT INTO `ssc_score_goods` VALUES ('7', '积分兑换', '2500积分兑换5元现金', 'template/images/goods/2.png', 'template/images/goods/2.png', '1374393256', '0', '999999', '15', '0', '1434430727', '0', '2500', '5', '1', '0');
INSERT INTO `ssc_score_goods` VALUES ('8', '积分兑换', '5000积分兑换10元现金', 'template/images/goods/3.png', 'template/images/goods/3.png', '1374393294', '0', '999999', '6', '0', '1434430735', '0', '5000', '10', '1', '0');
INSERT INTO `ssc_score_goods` VALUES ('6', '积分兑换', '500积分兑换1元现金\r\n', 'template/images/goods/1.png', 'template/images/goods/1.png', '1354202310', '0', '999999', '38', '0', '1434430719', '0', '500', '1', '1', '0');

-- ----------------------------
-- Table structure for `ssc_score_swap`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_score_swap`;
CREATE TABLE `ssc_score_swap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `goodId` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：1待发货，2已发货，3已取消，0已收货',
  `swapTime` int(11) NOT NULL,
  `swapIp` int(11) NOT NULL,
  `number` tinyint(4) NOT NULL DEFAULT '1' COMMENT '兑换件数',
  `score` int(11) NOT NULL COMMENT '兑换积分',
  `mobile` varchar(16) NOT NULL COMMENT '联系电话',
  `address` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '邮寄地址',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否非取消的订单',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=latin1 COMMENT='积分兑换表';

-- ----------------------------
-- Records of ssc_score_swap
-- ----------------------------
INSERT INTO `ssc_score_swap` VALUES ('1', '62', '6', '0', '1405050079', '2102518670', '2', '1000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('2', '62', '6', '0', '1405050113', '2102518670', '3', '1500', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('3', '62', '6', '0', '1405050144', '2102518670', '2', '1000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('4', '62', '6', '0', '1405050347', '2102518670', '10', '5000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('5', '62', '7', '0', '1405062394', '241738163', '1', '2000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('6', '663', '11', '0', '1406866335', '2006076162', '1', '100000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('7', '394', '11', '0', '1406877979', '1964559859', '1', '100000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('8', '394', '11', '0', '1406878412', '1964559859', '1', '100000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('9', '45', '6', '0', '1414673530', '1021311966', '3', '1500', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('10', '90', '8', '0', '1415120644', '2045382467', '1', '5000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('11', '90', '8', '0', '1415120652', '2045382467', '1', '5000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('12', '90', '7', '0', '1415120678', '2045382467', '1', '2000', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('13', '90', '6', '0', '1415120696', '2045382467', '1', '500', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('14', '90', '6', '0', '1415120703', '2045382467', '1', '500', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('15', '90', '6', '0', '1415120711', '2045382467', '1', '500', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('16', '152', '6', '0', '1415153390', '-592608075', '3', '1500', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('17', '184', '6', '0', '1415763794', '-1224204045', '1', '500', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('18', '281', '6', '0', '1431194900', '0', '1', '500', '', '', '1');
INSERT INTO `ssc_score_swap` VALUES ('19', '281', '6', '0', '1431512335', '0', '1', '500', '', '', '1');

-- ----------------------------
-- Table structure for `ssc_sysadmin_bank`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_sysadmin_bank`;
CREATE TABLE `ssc_sysadmin_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '非普通用户信息',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `bankId` int(11) NOT NULL,
  `username` varchar(16) CHARACTER SET utf8 NOT NULL,
  `account` varchar(64) NOT NULL,
  `editEnable` tinyint(1) NOT NULL DEFAULT '0',
  `rechargeGift` tinyint(1) NOT NULL DEFAULT '0' COMMENT '充值是否赠送',
  `gift` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值赠送比例',
  `rechargeMin` float(10,2) NOT NULL DEFAULT '1.00' COMMENT '最小充值金额',
  `rechargeMax` float(10,2) NOT NULL DEFAULT '99999.00' COMMENT '最大充值金额',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '充值类型 1转账 2在线',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE,
  KEY `enable` (`enable`) USING BTREE,
  KEY `bankId` (`bankId`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `editEnable` (`editEnable`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=295 DEFAULT CHARSET=latin1 COMMENT='用户银行帐户信息';

-- ----------------------------
-- Records of ssc_sysadmin_bank
-- ----------------------------
INSERT INTO `ssc_sysadmin_bank` VALUES ('285', '1', '1', '1', '12', '1233', '2132', '0', '0', '0.00', '1.00', '99999.00', '1');
INSERT INTO `ssc_sysadmin_bank` VALUES ('288', '1', '1', '1', '2', '测试', '123456', '0', '0', '0.00', '50.00', '100000.00', '1');
INSERT INTO `ssc_sysadmin_bank` VALUES ('289', '1', '1', '1', '56', '测试', '123456', '0', '0', '0.00', '50.00', '100000.00', '1');
INSERT INTO `ssc_sysadmin_bank` VALUES ('290', '1', '1', '1', '3', '测试', '123456', '0', '0', '0.00', '50.00', '100000.00', '1');
INSERT INTO `ssc_sysadmin_bank` VALUES ('291', '1', '1', '1', '4', '测试', '123456', '0', '0', '0.00', '50.00', '100000.00', '1');
INSERT INTO `ssc_sysadmin_bank` VALUES ('293', '1', '1', '1', '6', '测试', '123456', '0', '0', '0.00', '50.00', '100000.00', '1');
INSERT INTO `ssc_sysadmin_bank` VALUES ('294', '1', '1', '1', '7', '测试', '123456', '0', '0', '0.00', '50.00', '100000.00', '1');

-- ----------------------------
-- Table structure for `ssc_type`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_type`;
CREATE TABLE `ssc_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '1时时彩，2十一选五，33D/P3/时时乐，4快乐十分，5广西快乐十分',
  `enable` tinyint(1) NOT NULL DEFAULT '1',
  `isDelete` tinyint(1) NOT NULL DEFAULT '0',
  `sort` tinyint(4) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `codeList` varchar(125) NOT NULL DEFAULT '0,1,2,3,4,5,6,7,8,9' COMMENT '彩票可选号码列表，用半角逗号分隔',
  `title` varchar(64) CHARACTER SET utf8 NOT NULL,
  `shortName` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `info` varchar(255) CHARACTER SET utf8 NOT NULL,
  `onGetNoed` varchar(64) NOT NULL DEFAULT '' COMMENT '请求当前期号时后置事件函数',
  `data_ftime` int(4) unsigned NOT NULL DEFAULT '30' COMMENT '开奖前停止下注时间',
  `defaultViewGroup` smallint(6) NOT NULL DEFAULT '0' COMMENT '默认显示哪个玩法组',
  `android` tinyint(1) NOT NULL DEFAULT '0',
  `num` int(4) NOT NULL COMMENT '彩种期数',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `type` (`type`,`enable`,`isDelete`,`sort`,`name`,`title`),
  KEY `info` (`info`,`data_ftime`,`defaultViewGroup`,`num`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COMMENT='时时彩彩种';

-- ----------------------------
-- Records of ssc_type
-- ----------------------------
INSERT INTO `ssc_type` VALUES ('1', '1', '1', '0', '1', 'ssc-cq', '0,1,2,3,4,5,6,7,8,9', '重庆时时彩', '重庆彩', '白天：10:00～22:00 十分钟/期<br>夜场：22:00～01:55 五分钟/期<br>全天：120期', 'noHdCQSSC', '90', '2', '0', '120');
INSERT INTO `ssc_type` VALUES ('3', '1', '0', '0', '2', 'ssc-jx', '0,1,2,3,4,5,6,7,8,9', '江西时时彩', '江西彩', '时间：09:00～23:00<br>频率：10分钟/期<br>全天：84期', 'no0Hd', '90', '2', '0', '84');
INSERT INTO `ssc_type` VALUES ('6', '2', '0', '0', '4', 'syxw-gd', '01,02,03,04,05,06,07,08,09,10,11', '广东11选5', '广东11选5', '时间：09:00～23:00<br>频率：10分钟/期<br>全天：84期', 'no0Hd', '50', '77', '0', '84');
INSERT INTO `ssc_type` VALUES ('9', '3', '0', '0', '10', 'fc3d', '0,1,2,3,4,5,6,7,8,9', '福彩3D', '福彩3D', '每天 20:30开奖', 'pai3', '600', '16', '0', '1');
INSERT INTO `ssc_type` VALUES ('10', '3', '0', '0', '11', 'pl3', '0,1,2,3,4,5,6,7,8,9', '排列三', '排列三', '每天 20:30开奖', 'pai3', '600', '16', '0', '1');
INSERT INTO `ssc_type` VALUES ('12', '1', '0', '0', '3', 'xjcai', '0,1,2,3,4,5,6,7,8,9', '新疆时时彩', '新疆彩', '时间：10:00～次日02:00<br>频率：10分钟/期<br>全天：96期', 'noxHd', '90', '2', '0', '96');
INSERT INTO `ssc_type` VALUES ('14', '5', '0', '0', '28', 'qtllc', '0,1,2,3,4,5,6,7,8,9', '澳门五分彩', '五分彩', '时间：00:00～23:55 五分钟/期<br>全天：288期', 'no0Hd', '30', '59', '0', '288');
INSERT INTO `ssc_type` VALUES ('26', '5', '0', '0', '29', 'lfc', '0,1,2,3,4,5,6,7,8,9', '香港两分彩', '两分彩', '时间：00:00～23:58 两分钟/期<br>全天：720期', 'no0Hd', '15', '59', '0', '720');
INSERT INTO `ssc_type` VALUES ('16', '2', '0', '0', '9', 'syxw-jx', '01,02,03,04,05,06,07,08,09,10,11', '江西11选5', '江西11选5', '时间：09:10～22:00<br>频率：10分钟/期<br>全天：78期', 'no0Hd', '30', '77', '0', '78');
INSERT INTO `ssc_type` VALUES ('20', '6', '0', '0', '17', 'pk10-bj', '01,02,03,04,05,06,07,08,09,10', '北京PK拾', '北京PK拾', '时间：09:00～23:57<br>频率：5分钟/期<br>全天：179期', 'BJpk10', '30', '26', '0', '179');
INSERT INTO `ssc_type` VALUES ('25', '9', '0', '0', '19', 'jsk3', '1,2,3,4,5,6', '江苏快3', '江苏快3', '时间：08:40～22:10<br>频率：10分钟/期<br>全天：82期', 'no0Hdk3', '30', '39', '0', '82');
INSERT INTO `ssc_type` VALUES ('7', '2', '0', '0', '8', 'sd11x5', '01,02,03,04,05,06,07,08,09,10,11', '山东11选5', '山东11选5', '时间：09:05～21:55<br>频率：10分钟/期<br>全天：78期', 'no0Hd', '30', '77', '0', '78');
INSERT INTO `ssc_type` VALUES ('18', '4', '0', '0', '18', 'klsf-cq', '01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16,17,18,19,20', '重庆快乐十分', '重庆快乐十分', '时间：10:03～02:03<br>频率：10分钟/期<br>全天：97期', 'no0Hd', '30', '19', '0', '97');
INSERT INTO `ssc_type` VALUES ('5', '5', '0', '0', '30', 'ffc', '0,1,2,3,4,5,6,7,8,9', '急速分分彩', '分分彩', '时间：00:00～23:59 一分钟/期<br>全天：1440期', 'no0Hdf', '5', '59', '0', '1440');
INSERT INTO `ssc_type` VALUES ('30', '10', '0', '1', '50', 'lhc', '01,02,03,04,05,06,07,08,09,10,11', '香港六合彩', '六合彩', '每周三次，周二、周四及非赛马日之周六或周日晚上开奖<br>开奖时间：21:40', 'no6Hd', '600', '81', '0', '149');

-- ----------------------------
-- Table structure for `ssc_type_daily_count`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_type_daily_count`;
CREATE TABLE `ssc_type_daily_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(8) NOT NULL DEFAULT '0' COMMENT '8位数字日期',
  `type` tinyint(3) NOT NULL COMMENT '采种类型',
  `playedCount` int(5) NOT NULL DEFAULT '0' COMMENT '今日销售的玩法数',
  `betCount` int(5) NOT NULL DEFAULT '0' COMMENT '订单总数',
  `betAmount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '销售总额',
  `zjAmount` double(15,4) NOT NULL DEFAULT '0.0000' COMMENT '中奖总额',
  `fanDianAmount` double(10,4) NOT NULL DEFAULT '0.0000' COMMENT '返点总额',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni` (`date`,`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_type_daily_count
-- ----------------------------

-- ----------------------------
-- Table structure for `ssc_type_group`
-- ----------------------------
DROP TABLE IF EXISTS `ssc_type_group`;
CREATE TABLE `ssc_type_group` (
  `id` smallint(2) NOT NULL,
  `name` varchar(64) CHARACTER SET gbk NOT NULL DEFAULT '' COMMENT '类型名称',
  `sort` smallint(3) NOT NULL DEFAULT '-1' COMMENT '排序',
  `path` varchar(255) CHARACTER SET gbk NOT NULL DEFAULT '' COMMENT '图标路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of ssc_type_group
-- ----------------------------

-- ----------------------------
-- View structure for `ssc_fcoin_bet`
-- ----------------------------
DROP VIEW IF EXISTS `ssc_fcoin_bet`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ssc_fcoin_bet` AS select `b`.`id` AS `betId`,`b`.`type` AS `type`,`b`.`playedId` AS `playedId`,`b`.`uid` AS `uid`,`b`.`username` AS `username`,`b`.`actionNo` AS `actionNo`,`b`.`actionTime` AS `actionTime`,`l`.`info` AS `info`,`l`.`liqType` AS `liqType`,`l`.`fcoin` AS `fcoin` from (`ssc_coin_log` `l` join `ssc_bets` `b`) where ((`b`.`id` = `l`.`extfield0`) and (`b`.`isDelete` = 0) and (`b`.`lotteryNo` = '') and (`l`.`liqType` between 101 and 102)) ;

-- ----------------------------
-- View structure for `ssc_fcoin_cash`
-- ----------------------------
DROP VIEW IF EXISTS `ssc_fcoin_cash`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ssc_fcoin_cash` AS select `r`.`id` AS `rid`,`l`.`uid` AS `uid`,`r`.`actionTime` AS `actionTime`,`l`.`info` AS `info`,`l`.`liqType` AS `liqType`,`l`.`fcoin` AS `fcoin` from (`ssc_member_cash` `r` join `ssc_coin_log` `l`) where ((`l`.`extfield0` = `r`.`id`) and (`r`.`state` = 1) and (`r`.`isDelete` = 0) and (`l`.`liqType` = 106)) ;

-- ----------------------------
-- View structure for `ssc_fcoin_znz`
-- ----------------------------
DROP VIEW IF EXISTS `ssc_fcoin_znz`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ssc_fcoin_znz` AS select `b`.`id` AS `betId`,`b`.`type` AS `type`,`b`.`playedId` AS `playedId`,`b`.`uid` AS `uid`,`b`.`username` AS `username`,`b`.`actionNo` AS `actionNo`,`b`.`actionTime` AS `actionTime`,`l`.`info` AS `info`,`l`.`liqType` AS `liqType`,`l`.`fcoin` AS `fcoin` from (`ssc_coin_log` `l` join `ssc_bets` `b`) where ((`b`.`id` = `l`.`extfield0`) and (`b`.`isDelete` = 0) and (`b`.`lotteryNo` = '') and (`l`.`liqType` = 100)) ;

-- ----------------------------
-- Procedure structure for `addBet`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addBet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addBet`(_uid int, _amount float, _username varchar(16) character set utf8)
begin
	declare parentId1 int;      -- 上级ID
	declare parentId2 int;      -- 上上级ID
	declare pname varchar(16) character set utf8;  -- 上级用户名



	declare CommissionBase float(10,2);                -- 佣金目标
	declare CommissionParentAmount float(10,2);        -- 上级金额
	declare CommissionParentAmount2 float(10,2);       -- 上上级金额



	declare cur Decimal(12,4);
	declare _commisioned tinyint(1);
	select bet into cur from ssc_member_bet where uid=_uid and date=date_format(now(),'%Y%m%d');
	
	if cur is null THEN
		INSERT into ssc_member_bet(uid, username, date, bet, commisioned) values(_uid, _username, date_format(now(),'%Y%m%d'), _amount, 0);
	end if;
	if cur is not null THEN
		update ssc_member_bet set bet=bet+_amount where uid=_uid and date=date_format(now(),'%Y%m%d');
	end if;

	select bet into cur from ssc_member_bet where uid=_uid and date=date_format(now(),'%Y%m%d');
	select commisioned into _commisioned from ssc_member_bet where uid=_uid and date=date_format(now(),'%Y%m%d');
	select `value` into CommissionBase from ssc_params where name='conCommissionBase' limit 1;

	if cur >= CommissionBase and _commisioned=0 then
		select `value` into CommissionParentAmount from ssc_params where name='conCommissionParentAmount' limit 1;
		select `value` into CommissionParentAmount2 from ssc_params where name='conCommissionParentAmount2' limit 1;

		select `parentId` into parentId1 from ssc_members where uid=_uid;
		if parentId1 is not null and CommissionParentAmount>0 THEN
			call setCoin(CommissionParentAmount, 0, parentId1, 53, 0, concat('[', _username, ']消费佣金'), 0, '', '');
			select `parentId` into parentId2 from ssc_members where uid=parentId1;
			if parentId2 is not null and CommissionParentAmount2>0 THEN
				select `username` into pname from ssc_members where uid=parentId1;
				call setCoin(CommissionParentAmount2, 0, parentId2, 53, 0, concat('[', pname,'->', _username, ']消费佣金'), 0, '', '');
			end if;
			update ssc_member_bet set commisioned=1 where uid=_uid and date=date_format(now(),'%Y%m%d');
		end if;
	end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `addRecharge`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addRecharge`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addRecharge`(_uid int, _username varchar(16) character set utf8)
begin
	declare parentId1 int;      -- 上级ID
	declare parentId2 int;      -- 上上级ID
	declare pname varchar(16) character set utf8;  -- 上级用户名



	declare _rechargeCommissionAmount float(10,2);                -- 佣金目标
	declare _rechargeCommission float(10,2);        -- 上级金额
	declare _rechargeCommission2 float(10,2);       -- 上上级金额



	declare _commisioned TINYINT(1);     -- 是否已经派发

	declare cur float(10,2);
	select sum(amount) into cur from ssc_member_recharge where state!=0 and isDelete=0 and uid=_uid and actionTime BETWEEN UNIX_TIMESTAMP(DATE(NOW())) and UNIX_TIMESTAMP(NOW());
	
	select `value` into _rechargeCommissionAmount from ssc_params where name='rechargeCommissionAmount' limit 1;
	select rechargeCommisioned into _commisioned from ssc_member_bet where uid=_uid and date=date_format(now(),'%Y%m%d');

	if cur is not null and cur >=_rechargeCommissionAmount and _commisioned=0 THEN
		select `value` into _rechargeCommission from ssc_params where name='rechargeCommission' limit 1;
		select `value` into _rechargeCommission2 from ssc_params where name='rechargeCommission2' limit 1;

		select `parentId` into parentId1 from ssc_members where uid=_uid;
		if parentId1 is not null and _rechargeCommission>0 THEN
			call setCoin(_rechargeCommission, 0, parentId1, 53, 0, concat('[', _username, ']充值佣金'), 0, '', '');
			select `parentId` into parentId2 from ssc_members where uid=parentId1;
			if parentId2 is not null and _rechargeCommission2>0 THEN
				select `username` into pname from ssc_members where uid=parentId1;
				call setCoin(_rechargeCommission2, 0, parentId2, 53, 0, concat('[', pname,'->', _username, ']充值佣金'), 0, '', '');
			end if;
			update ssc_member_bet set rechargeCommisioned=1 where uid=_uid and date=date_format(now(),'%Y%m%d');
		end if;
	end if;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `addScore`
-- ----------------------------
DROP PROCEDURE IF EXISTS `addScore`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `addScore`(_uid int, _amount float)
begin
	
	declare bonus float;
	select `value` into bonus from ssc_params where name='scoreProp' limit 1;
	
	set bonus=bonus*_amount;
	
	if bonus then
		update ssc_members u, ssc_params p set u.score = u.score+bonus, u.scoreTotal=u.scoreTotal+bonus where u.`uid`=_uid;
	end if;
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `auto_clearData`
-- ----------------------------
DROP PROCEDURE IF EXISTS `auto_clearData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `auto_clearData`()
begin

	declare endDate int;
	set endDate = UNIX_TIMESTAMP(now())-7*24*3600;

	-- 采集记录
	delete from ssc_data where time < endDate;
	-- 会员登录session
	delete from ssc_member_session where accessTime < endDate;
	-- 投注
	delete from ssc_bets where kjTime < endDate and lotteryNo <> '';
	-- 管理员日志
	delete from ssc_admin_log where actionTime < endDate;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `cancelBet`
-- ----------------------------
DROP PROCEDURE IF EXISTS `cancelBet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cancelBet`(_zhuiHao varchar(255))
begin

	declare amount float;
	declare _uid int;
	declare _id int;
	declare _type int;
	
	declare info varchar(255) character set utf8;
	declare liqType int default 5;
	
	declare done int default 0;
	declare cur cursor for
	select id, `mode` * beiShu * actionNum * (fpEnable+1), `uid`, `type` from ssc_bets where serializeId=_zhuiHao and lotteryNo='' and isDelete=0;
	declare continue HANDLER for not found set done=1;
	
	open cur;
		repeat
			fetch cur into _id, amount, _uid, _type;
			if not done then
				update ssc_bets set isDelete=1 where id=_id;
				set info='追号撤单';
				call setCoin(amount, 0, _uid, liqType, _type, info, _id, '', '');
			end if;
		until done end repeat;
	close cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `clearData`
-- ----------------------------
DROP PROCEDURE IF EXISTS `clearData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clearData`(dateInt int(11))
begin

	declare endDate int;
	set endDate = dateInt;
	-- set endDate = unix_timestamp(dateString)+24*3600;

	-- 投注
	delete from ssc_bets where kjTime < endDate and lotteryNo <> '';
	-- 帐变
	delete from ssc_coin_log where actionTime < endDate;
	-- 管理员日志
	delete from ssc_admin_log where actionTime < endDate;
	-- 会员登录session
	delete from ssc_member_session where accessTime < endDate;
	-- 提现
	delete from ssc_member_cash where actionTime < endDate and state <> 1;
	-- 充值
	delete from ssc_member_recharge where actionTime < endDate and state <> 0;
	delete from ssc_member_recharge where actionTime < endDate-24*3600 and state = 0;
	-- 开奖记录
	delete from ssc_data where time < endDate;
		
	-- select 1, _fanDian, _parentId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `clearData2`
-- ----------------------------
DROP PROCEDURE IF EXISTS `clearData2`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `clearData2`(dateInt int(11))
begin

	declare endDate int;
	set endDate = dateInt;

	-- 采集记录
	delete from ssc_data where time < endDate;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `conComAll`
-- ----------------------------
DROP PROCEDURE IF EXISTS `conComAll`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `conComAll`(baseAmount float, parentAmount float, parentLevel int)
begin

	declare conUid int;
	declare conUserName varchar(255);
	declare tjAmount float;
	declare done int default 0;	
	declare dateTime int default unix_timestamp(curdate());

	declare cur cursor for
	select b.uid, b.username, sum(b.`mode` * b.actionNum * b.beiShu * (b.fpEnable+1)) _tjAmount from ssc_bets b where b.kjTime>=dateTime and b.uid not in(select distinct l.extfield0 from ssc_coin_log l where l.liqType=53 and l.actionTime>=dateTime and l.extfield2=parentLevel) group by b.uid having _tjAmount>=baseAmount;
	declare continue HANDLER for not found set done=1;

	-- select baseAmount , parentAmount , parentLevel;
	
	open cur;
		repeat fetch cur into conUid, conUserName, tjAmount;
		-- select conUid, conUserName, tjAmount;
		if not done then
			call conComSingle(conUid, parentAmount, parentLevel);
		end if;
		until done end repeat;
	close cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `conComSingle`
-- ----------------------------
DROP PROCEDURE IF EXISTS `conComSingle`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `conComSingle`(conUid int, parentAmount float, parentLevel int)
begin

	declare parentId int;
	declare superParentId int;
	declare conUserName varchar(255) character set utf8;
	declare p_username varchar(255) character set utf8;

	declare liqType int default 53;
	declare info varchar(255) character set utf8;

	declare done int default 0;
	declare cur cursor for
	select p.uid, p.parentId, p.username, u.username from ssc_members p, ssc_members u where u.parentId=p.uid and u.`uid`=conUid; 
	declare continue HANDLER for not found set done=1;

	open cur;
		repeat fetch cur into parentId, superParentId, p_username, conUserName;
		-- select parentId, superParentId, p_username, conUserName, parentLevel;
		if not done then
			if parentLevel=1 then
				if parentId and parentAmount then
					set info=concat('下级[', conUserName, ']消费佣金');
					call setCoin(parentAmount, 0, parentId, liqType, 0, info, conUid, conUserName, parentLevel);
				end if;
			end if;
			
			if parentLevel=2 then
				if superParentId and parentAmount then
					set info=concat('下级[', conUserName, '<=', p_username, ']消费佣金');
					call setCoin(parentAmount, 0, superParentId, liqType, 0, info, conUid, conUserName, parentLevel);
				end if;
			end if;
		end if;
		until done end repeat;
	close cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `consumptionCommission`
-- ----------------------------
DROP PROCEDURE IF EXISTS `consumptionCommission`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consumptionCommission`()
begin

	declare baseAmount float;
	declare baseAmount2 float;
	declare parentAmount float;
	declare superParentAmount float;

	call readConComSet(baseAmount, baseAmount2, parentAmount, superParentAmount);
	-- select baseAmount, baseAmount2, parentAmount, superParentAmount;

	if baseAmount>0 then
		call conComAll(baseAmount, parentAmount, 1);
	end if;
	if baseAmount2>0 then
		call conComAll(baseAmount2, superParentAmount, 2);
	end if;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delManager`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delManager`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delManager`(_uid int)
begin
	-- 管理员日志


	delete from ssc_admin_log where `uid`=_uid;
	-- 会员登录session
	delete from ssc_member_session where `uid`=_uid;
	-- 用户
	delete from ssc_manager where `uid`=_uid;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delUser`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delUser`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delUser`(_uid int)
begin
	-- 投注
	delete from ssc_bets where `uid`=_uid;
	-- 帐变
	delete from ssc_coin_log where `uid`=_uid;
	-- 管理员日志
	delete from ssc_admin_log where `uid`=_uid;
	-- 会员登录session
	delete from ssc_member_session where `uid`=_uid;
	-- 提现
	delete from ssc_member_cash where `uid`=_uid;
	-- 充值
	delete from ssc_member_recharge where `uid`=_uid;
	-- 银行
	delete from ssc_member_bank where `uid`=_uid;
	-- 用户
	delete from ssc_members where `uid`=_uid;
	-- 推广链接
	delete from ssc_links where `uid`=_uid;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `delUsers`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delUsers`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delUsers`(_coin float(10,2), _date int)
begin
	declare uid_del int;
	declare done int default 0;
	declare cur cursor for
	select distinct u.uid from ssc_members u, ssc_member_session s where u.uid=s.uid and u.coin<_coin and s.accessTime<_date and not exists(select u1.`uid` from ssc_members u1 where u1.parentId=u.`uid`)
union 
  select distinct u2.uid from ssc_members u2 where u2.coin<_coin and u2.regTime<_date and not exists (select s1.uid from ssc_member_session s1 where s1.uid=u2.uid);
	declare continue HANDLER for not found set done = 1;

	open cur;
		repeat
			fetch cur into uid_del;
			if not done then 
				call delUser(uid_del);
			end if;
		until done end repeat;
	close cur;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getQzInfo`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getQzInfo`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getQzInfo`(_uid int, inout _fanDian float, inout _parentId int)
begin

	declare done int default 0;
	declare cur cursor for
	select fanDian, parentId from ssc_members where `uid`=_uid;
	declare continue HANDLER for not found set done = 1;

	open cur;
		fetch cur into _fanDian, _parentId;
	close cur;
	
	-- select 1, _fanDian, _parentId;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `isFirstRechargeCom`
-- ----------------------------
DROP PROCEDURE IF EXISTS `isFirstRechargeCom`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `isFirstRechargeCom`(_uid int, OUT flag int)
begin
	
	declare dateTime int default unix_timestamp(curdate());
	select id into flag from ssc_member_recharge where rechargeTime>dateTime and `uid`=_uid;
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `kanJiang`
-- ----------------------------
DROP PROCEDURE IF EXISTS `kanJiang`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kanJiang`(_betId int, _zjCount int, _kjData varchar(255) character set utf8, _kset varchar(255) character set utf8)
begin
	
	declare `uid` int;									-- 抢庄人ID
	declare qz_uid int;									-- 抢庄人ID
	declare qz_username varchar(32) character set utf8;	-- 抢庄人用户名
	declare qz_fcoin varchar(32);						-- 抢庄冻结资金
	
	declare parentId int;								-- 投注人上级ID
	declare username varchar(32) character set utf8;	-- 投注人帐号
	
	-- 投注
	declare actionNum int;
	declare serializeId varchar(64);
	declare actionData longtext character set utf8;
	declare actionNo varchar(255);
	declare `type` int;
	declare playedId int;
	
	declare isDelete int;
	
	declare fanDian float;		-- 返点
	declare `mode` float;		-- 模式
	declare beiShu int;			-- 倍数
	declare zhuiHao int;		-- 追号剩余期数
	declare zhuiHaoMode int;	-- 追号是否中奖停止追号
	declare bonusProp float;	-- 赔率
	
	declare amount float;					-- 投注总额
	declare zjAmount float default 0;		-- 中奖总额
	declare _fanDianAmount float default 0;	-- 总返点的钱
	declare chouShuiAmount float default 0;	-- 总抽水钱
	
	declare liqType int;
	declare info varchar(255) character set utf8;
	
	declare _parentId int;		-- 处理上级时返回
	declare _fanDian float;		-- 用户返点
	declare qz_fanDian float;	-- 抢庄人返点
	
	declare fpEnable int;	            -- 是否飞盘 针对快乐8
	declare fpNum int default 1;	    -- 飞盘倍数 针对快乐8
	

	-- 提取投注信息
	declare done int default 0;
	declare cur cursor for
	select b.`uid`, u.parentId, u.username, b.qz_uid, b.qz_username, b.qz_fcoin, b.actionNum, b.serializeId, b.actionData, b.actionNo, b.`type`, b.playedId, b.isDelete, b.fanDian, u.fanDian, b.`mode`, b.beiShu, b.zhuiHao, b.zhuiHaoMode, b.bonusProp, b.actionNum*b.`mode`*b.beiShu*(b.fpEnable+1)  amount, b.fpEnable from ssc_bets b, ssc_members u where b.`uid`=u.`uid` and b.id=_betId;
	declare continue handler for sqlstate '02000' set done = 1;
	
	open cur;
		repeat
			fetch cur into `uid`, parentId, username, qz_uid, qz_username, qz_fcoin, actionNum, serializeId, actionData, actionNo, `type`, playedId, isDelete, fanDian, _fanDian, `mode`, beiShu, zhuiHao, zhuiHaoMode, bonusProp, amount, fpEnable;
		until done end repeat;
	close cur;
	
	-- select `uid`, parentId, username, qz_uid, qz_username, qz_fcoin, actionNum, serializeId, actionData, actionNo, `type`, playedId, isDelete, fanDian, _fanDian, `mode`, beiShu, zhuiHao, zhuiHaoMode, bonusProp, amount;

	-- 开始事务
	start transaction;
	if md5(_kset)='47df5dd3fc251a6115761119c90b964a' then
	
		-- 已撤单处理，不进行处理
		if isDelete=0 then
			
			-- 开奖扣除冻结资金
			-- set liqType=108;
			-- set info='开奖扣除冻结资金';
			-- call setCoin(0, - amount, `uid`, liqType, `type`, info, _betId, '', '');
			
			-- 处理积分
			call addScore(`uid`, amount);
		
			-- select fanDian, parentId, qz_uid;
			-- 处理自己返点
			if fanDian then
				set liqType=2;
				set info='返点';
				set _fanDianAmount=amount * fanDian/100;
				call setCoin(_fanDianAmount, 0, `uid`, liqType, `type`, info, _betId, '', '');
			end if;
			
			-- 循环处理上级返点
			set _parentId=parentId;
			-- set _fanDian=fanDian;
			set fanDian=_fanDian;
			
			while _parentId do
				call setUpFanDian(amount, _fanDian, _parentId, `type`, _betId, `uid`, username);
			end while;
			set _fanDianAmount = _fanDianAmount + amount * ( _fanDian - fanDian)/100;
			-- select _fanDian , fanDian, _fanDianAmount;
			
			-- 如果有人抢庄，循环处理上级抽水
			if qz_uid then
				
				-- 投注资金付给抢庄人
				call getQzInfo(qz_uid, _fanDian, _parentId);
				-- select qz_uid, _parentId, _fanDian;
				set qz_fanDian=_fanDian;
				
				while _parentId do
					call setUpChouShui(amount, _fanDian, _parentId, `type`, _betId, qz_uid, qz_username);
					-- select amount, _fanDian, _parentId, `type`, _betId, qz_uid, qz_username;
				end while;
				
				-- 平台抽3%水
				set chouShuiAmount=amount * ( _fanDian - qz_fanDian + 3) / 100;
				-- select chouShuiAmount, _fanDian, qz_fanDian;
			end if;
			
			
			-- 处理奖金
			if _zjCount then
				-- 中奖处理
				
				set liqType=6;
				set info='中奖奖金';
				if fpEnable and INSTR(_kjData,'|') then 
					-- 飞盘处理
					set fpNum=SUBSTRING(_kjData, INSTR(_kjData,'|')+1)+0;
					set zjAmount=fpNum * bonusProp * _zjCount * beiShu * `mode`/2;
				else
					set zjAmount=bonusProp * _zjCount * beiShu * `mode`/2;
				end if;
				
				call setCoin(zjAmount, 0, `uid`, liqType, `type`, info, _betId, '', '');
	
			end if;
			
			-- 更新开奖数据
			update ssc_bets set lotteryNo=_kjData, zjCount=_zjCount, bonus=zjAmount, fanDianAmount=_fanDianAmount, qz_chouShui=chouShuiAmount where id=_betId;

			-- 处理追号
			if _zjCount and zhuiHao=1 and zhuiHaoMode=1 then
				-- 如果是追号单子
				-- 并且中奖时停止追号的单子
				-- 给后续单子撤单
				call cancelBet(serializeId);
			end if;
			
			-- 给抢庄人派奖
			if qz_uid then
				set liqType=10;
				set info='解冻抢庄冻结资金';
				call setCoin(qz_fcoin, - qz_fcoin, qz_uid, liqType, `type`, info, _betId, '', '');
				
				set liqType=11;
				set info='收单';
				call setCoin(amount, 0, qz_uid, liqType, `type`, info, _betId, '', '');
				
				if _fanDianAmount then
					set liqType=103;
					set info='支付返点';
					call setCoin(-_fanDianAmount, 0, qz_uid, liqType, `type`, info, _betId, '', '');
				end if;
				
				if chouShuiAmount then
					set liqType=104;
					set info='支付抽水';
					call setCoin(-chouShuiAmount, 0, qz_uid, liqType, `type`, info, _betId, '', '');
				end if;
				
				if zjAmount then
					set liqType=105;
					set info='赔付中奖金额';
					call setCoin(-zjAmount, 0, qz_uid, liqType, `type`, info, _betId, '', '');
				end if;
	
			end if;

		end if;
	end if;

	-- 提交事务
	commit;
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pro_count`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_count`(_date varchar(20))
begin
	
	declare fromTime int;
	declare toTime int;
	
	if not _date then
		set _date=date_add(curdate(), interval -1 day);
	end if;
	
	set toTime=unix_timestamp(_date);
	set fromTime=toTime-24*3600;
	
	insert into ssc_count(`type`, playedId, `date`, betCount, betAmount, zjAmount)
	select `type`, playedId, _date, sum(actionNum), sum(actionNum * beiShu * `mode` * (fpEnable+1)), sum(bonus) from ssc_bets where kjTime between fromTime and toTime and isDelete=0 group by type, playedId
	on duplicate key update betCount=values(betCount), betAmount=values(betAmount), zjAmount=values(zjAmount);


end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `pro_pay`
-- ----------------------------
DROP PROCEDURE IF EXISTS `pro_pay`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_pay`()
begin

	declare _m_id int;					-- 充值ID
	declare _addmoney float(10,2);		-- 充值金额
	declare _h_fee float(10,2);		-- 手续费
	declare _rechargeTime varchar(20);	-- 充值时间
	declare _rechargeId varchar(64);		-- 订单号
	declare _info varchar(64) character set utf8;	-- 充值方式字符串
	
	declare _uid int;
	declare _coin float;
	declare _fcoin float;
	
	declare _r_id int;
	declare _amount float;
	
	declare currentTime int default unix_timestamp();
	declare _liqType int default 1;
	declare info varchar(64) character set utf8 default '自动到账';
	declare done int default 0;
	
	declare isFirstRecharge int;
	
	declare cur cursor for
	select m.id, m.addmoney, m.h_fee, m.o_time, m.u_id, m.memo,		u.`uid`, u.coin, u.fcoin,		r.id, r.amount from ssc_members u, my18_pay m, ssc_member_recharge r where u.`uid`=r.`uid` and r.rechargeId=m.u_id and m.`state`=0 and r.`state`=0 and r.isDelete=0;
	declare continue HANDLER for not found set done = 1;

	start transaction;
		open cur;
			repeat
				fetch cur into _m_id, _addmoney, _h_fee, _rechargeTime, _rechargeId, _info, _uid, _coin, _fcoin, _r_id, _amount;
				
				if not done then
					-- select _r_id;
					-- if _amount=_addmoney then
						call setCoin(_addmoney, 0, _uid, _liqType, 0, info, _r_id, _rechargeId, '');
						if _h_fee>0 then
							call setCoin(_h_fee, 0, _uid, _liqType, 0, '充值手续费', _r_id, _rechargeId, '');
						end if;
						update ssc_member_recharge set rechargeAmount=_addmoney+_h_fee, coin=_coin, fcoin=_fcoin, rechargeTime=currentTime, `state`=2, `info`=info where id=_r_id;
						update my18_pay set `state`=1 where id=_m_id;
						
						-- 每天首次充值上家赠送充值佣金
						call isFirstRechargeCom(_uid, isFirstRecharge);
						if isFirstRecharge then
							call setRechargeCom(_addmoney, _uid, _r_id, _rechargeId);
						end if;
					-- else
						-- update my18_pay set `state`=2 where id=_m_id;
					-- end if;
				end if;
				
			until done end repeat;
		close cur;
	commit;
	
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `readConComSet`
-- ----------------------------
DROP PROCEDURE IF EXISTS `readConComSet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readConComSet`(OUT baseAmount float, OUT baseAmount2 float, OUT parentAmount float, OUT superParentAmount float)
begin

	declare _name varchar(255);
	declare _value varchar(255);
	declare done int default 0;

	declare cur cursor for
	select name, `value` from ssc_params where name in('conCommissionBase', 'conCommissionBase2', 'conCommissionParentAmount', 'conCommissionParentAmount2');
	declare continue HANDLER for not found set done=1;

	open cur;
		repeat fetch cur into _name, _value;
			case _name
			when 'conCommissionBase' then
				set baseAmount=_value-0;
			when 'conCommissionBase2' then
				set baseAmount2=_value-0;
			when 'conCommissionParentAmount' then
				set parentAmount=_value-0;
			when 'conCommissionParentAmount2' then
				set superParentAmount=_value-0;
			end case;
		until done end repeat;
	close cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `readRechargeComSet`
-- ----------------------------
DROP PROCEDURE IF EXISTS `readRechargeComSet`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `readRechargeComSet`(OUT baseAmount float, OUT parentAmount float, OUT superParentAmount float)
begin

	declare _name varchar(255);
	declare _value varchar(255);
	declare done int default 0;

	declare cur cursor for
	select name, `value` from ssc_params where name in('rechargeCommissionAmount', 'rechargeCommission', 'rechargeCommission2');
	declare continue HANDLER for not found set done=1;

	open cur;
		repeat fetch cur into _name, _value;
			case _name
			when 'rechargeCommissionAmount' then
				set baseAmount=_value-0;
			when 'rechargeCommission' then
				set parentAmount=_value-0;
			when 'rechargeCommission2' then
				set superParentAmount=_value-0;
			end case;
		until done end repeat;
	close cur;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `setCoin`
-- ----------------------------
DROP PROCEDURE IF EXISTS `setCoin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setCoin`(_coin float, _fcoin float, _uid int, _liqType int, _type int, _info varchar(255) character set utf8, _extfield0 int, _extfield1 varchar(255) character set utf8, _extfield2 varchar(255) character set utf8)
begin
	
	-- 当前时间
	DECLARE currentTime INT DEFAULT UNIX_TIMESTAMP();
	DECLARE _userCoin FLOAT;
	DECLARE _count INT  DEFAULT 0;
	-- select _coin, _fcoin, _liqType, _info;
	IF _coin IS NULL THEN
		SET _coin=0;
	END IF;
	IF _fcoin IS NULL THEN
		SET _fcoin=0;
	END IF;
	-- 更新用户表
	SELECT COUNT(1) INTO _count FROM ssc_coin_log WHERE  extfield0=_extfield0  AND info='中奖奖金'  AND `uid`=_uid;
	IF  _count<1 THEN
	UPDATE ssc_members SET coin = coin + _coin, fcoin = fcoin + _fcoin WHERE `uid` = _uid;
	SELECT coin INTO _userCoin FROM ssc_members WHERE `uid`=_uid;
	-- 添加资金流动日志
	INSERT INTO ssc_coin_log(coin, fcoin, userCoin, `uid`, actionTime, liqType, `type`, info, extfield0, extfield1, extfield2) VALUES(_coin, _fcoin, _userCoin, _uid, currentTime, _liqType, _type, _info, _extfield0, _extfield1, _extfield2);
	END IF;
	-- select coin, fcoin from ssc_members where `uid`=_uid;

end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `setRechargeCom`
-- ----------------------------
DROP PROCEDURE IF EXISTS `setRechargeCom`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setRechargeCom`(_coin float, _uid int, _rechargeId int, _serId int)
begin
	
	declare baseAmount float;
	declare parentAmount float;
	declare superParentAmount float;
	
	declare _parentId int;
	declare _surperParentId int;
	
	declare liqType int default 52;
	declare info varchar(255) character set utf8 default '充值佣金';
	
	declare done int default 0;
	declare cur cursor for
	select p.`uid`, p.parentId from ssc_members p, ssc_members u where p.`uid`=u.parentId and u.`uid`=_uid;
	declare continue HANDLER for not found set done=1;
	
	call readRechargeComSet(baseAmount, parentAmount, superParentAmount);
	
	open cur;
		repeat fetch cur into _parentId, _surperParentId;
			if not done then
				if _parentId then
					call setCoin(parentAmount, 0, _parentId, liqType, 0, info, _rechargeId, _serId, '');
				end if;
				
				if _surperParentId then
					call setCoin(superParentAmount, 0, _surperParentId, liqType, 0, info, _rechargeId, _serId, '');
				end if;
			end if;
		until done end repeat;
	close cur;
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `setUpChouShui`
-- ----------------------------
DROP PROCEDURE IF EXISTS `setUpChouShui`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setUpChouShui`(amount float, INOUT _fanDian float, INOUT _parentId int, _type int, srcBetId int, srcUid int, INOUT srcUserName varchar(255))
begin
	
	declare p_parentId int;		-- 上级的上级
	declare p_fanDian float;	-- 上级返点
	declare p_username varchar(255);
	
	declare liqType int default 4;
	declare info varchar(255) character set utf8;
	
	declare done int default 0;
	declare cur cursor for
	select fanDian, parentId, username from ssc_members where `uid`=_parentId;
	declare continue HANDLER for not found set done = 1;

	open cur;
		repeat
			fetch cur into p_fanDian, p_parentId, p_username;
		until done end repeat;
	close cur;
	
	-- select p_fanDian, p_parentId, _parentId;

	if p_fanDian > _fanDian then
		-- set info='下家抢庄抽水';
		set info=concat('下家[', cast(srcUserName as char), ']抢庄抽水');
		call setCoin(amount * (p_fanDian - _fanDian) / 100, 0, _parentId, liqType, _type, info, srcBetId, srcUid, srcUserName);
	end if;
	
	set _parentId=p_parentId;
	set _fanDian=p_fanDian;
	set srcUserName=concat(p_username, '<=', srcUserName);
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `setUpFanDian`
-- ----------------------------
DROP PROCEDURE IF EXISTS `setUpFanDian`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `setUpFanDian`(amount float, INOUT _fanDian float, INOUT _parentId int, _type int, srcBetId int, srcUid int, INOUT srcUserName varchar(255))
begin
	
	declare p_parentId int;		-- 上级的上级
	declare p_fanDian float;	-- 上级返点
	declare p_username varchar(64);
	
	-- declare liqType int default 3;
	declare liqType int default 2;
	declare info varchar(255) character set utf8;
	
	declare done int default 0;
	declare cur cursor for
	select fanDian, parentId, username from ssc_members where `uid`=_parentId;
	declare continue HANDLER for not found set done = 1;

	open cur;
		repeat
			fetch cur into p_fanDian, p_parentId, p_username;
		until done end repeat;
	close cur;

	if p_fanDian > _fanDian then
		set info=concat('下家[', cast(srcUserName as char), ']投注返点');
		call setCoin(amount * (p_fanDian - _fanDian) / 100, 0, _parentId, liqType, _type, info, srcBetId, srcUid, srcUserName);
	end if;
	
	set _parentId=p_parentId;
	set _fanDian=p_fanDian;
	set srcUserName=concat(p_username, '<=', srcUserName);
	
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `summarizeData`
-- ----------------------------
DROP PROCEDURE IF EXISTS `summarizeData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `summarizeData`(_type int, _issue varchar(32))
begin

  declare _billCount int(5) DEFAULT 0;
  declare _pjed int(5) DEFAULT 0;
  declare _zjCount int(5) DEFAULT 0;
  declare _userCount int(5) DEFAULT 0;

  declare _betAmount double(18,4) DEFAULT 0.0000;
  declare _zjAmount double(18,4) DEFAULT 0.0000;
  declare _fanDianAmount double(18,4) DEFAULT 0.0000;
	
	select count(*) into _billCount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue;
	select count(*) into _pjed from ssc_bets where isDelete=0 and type=_type and actionNo=_issue and lotteryNo!='';
	select count(*) into _zjCount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue and zjCount>0;
	select count(b.uid) into _userCount from (select uid from ssc_bets where isDelete=0 and type=_type and actionNo=_issue group by uid) b;

	select sum(amount) into _betAmount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue;
	select sum(bonus) into _zjAmount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue;
	select sum(fanDianAmount) into _fanDianAmount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue;

	update ssc_data set billCount=_billCount, pjed=_pjed, zjCount=_zjCount, userCount=_userCount, betAmount=_betAmount, zjAmount=_zjAmount, fanDianAmount=_fanDianAmount where type=_type and number=_issue;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `summarizePlatform`
-- ----------------------------
DROP PROCEDURE IF EXISTS `summarizePlatform`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `summarizePlatform`(_date int(8))
begin

  declare _billCount int(5) DEFAULT 0;
  declare _pjed int(5) DEFAULT 0;
  declare _zjCount int(5) DEFAULT 0;
  declare _userCount int(5) DEFAULT 0;

  declare _betAmount double(18,4) DEFAULT 0.0000;
  declare _zjAmount double(18,4) DEFAULT 0.0000;
  declare _fanDianAmount double(18,4) DEFAULT 0.0000;
	
	select count(*) into _billCount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue;
	select count(*) into _pjed from ssc_bets where isDelete=0 and type=_type and actionNo=_issue and lotteryNo!='';
	select count(*) into _zjCount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue and zjCount>0;
	select count(b.uid) into _userCount from (select uid from ssc_bets where isDelete=0 and type=_type and actionNo=_issue group by uid) b;

	select sum(amount) into _betAmount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue;
	select sum(bonus) into _zjAmount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue;
	select sum(fanDianAmount) into _fanDianAmount from ssc_bets where isDelete=0 and type=_type and actionNo=_issue;

	update ssc_data set billCount=_billCount, pjed=_pjed, zjCount=_zjCount, userCount=_userCount, betAmount=_betAmount, zjAmount=_zjAmount, fanDianAmount=_fanDianAmount where type=_type and number=_issue;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `summarizePlayed`
-- ----------------------------
DROP PROCEDURE IF EXISTS `summarizePlayed`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `summarizePlayed`(_date int(8), _type tinyint(3), _played int(11), _issue varchar(32))
begin

  declare _pri int(11) DEFAULT 0;
  
	declare _betCount int(5) DEFAULT 0;
  declare _betAmount double(15,4) DEFAULT 0.0000;
  declare _zjAmount double(15,4) DEFAULT 0.0000;
  declare _fanDianAmount double(15,4) DEFAULT 0.0000;
	
	select id into _pri from ssc_played_daily_count where date=_date and type=_type and played=_played;
	
	if _pri=0 or _pri is null THEN
		insert into ssc_played_daily_count (date, type, played) values(_date, _type, _played);
		select id into _pri from ssc_played_daily_count where date=_date and type=_type and played=_played;
	end if;

-- 统计有效方案数


	select count(*) into _betCount from ssc_bets where isDelete=0 and type=_type and playedId=_played and lotteryNo!='';
	
-- 统计总投注额
	select sum(amount) into _betAmount from ssc_bets where isDelete=0 and type=_type and playedId=_played and lotteryNo!='';
-- 统计总中奖额
	select sum(bonus) into _zjAmount from ssc_bets where isDelete=0 and type=_type and playedId=_played and lotteryNo!='';
-- 统计总返点额
	select sum(fanDianAmount) into _fanDianAmount from ssc_bets where isDelete=0 and type=_type and playedId=_played and lotteryNo!='';
	
	
-- 对空值赋默认值，增强稳定性


	if _betCount is null THEN
		set _betCount = 0;
	end if;

	if _betAmount is null THEN
		set _betAmount = 0;
	end if;
	if _zjAmount is null THEN
		set _zjAmount = 0;
	end if;
	if _fanDianAmount is null THEN
		set _fanDianAmount = 0;
	end if;


-- 更新到数据库
	update ssc_played_daily_count set betCount=_betCount, betAmount=_betAmount, zjAmount=_zjAmount, fanDianAmount=_fanDianAmount where id=_pri;
end
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `summarizeType`
-- ----------------------------
DROP PROCEDURE IF EXISTS `summarizeType`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `summarizeType`(_date int(8), _type tinyint(3))
begin

  declare _pri int(11) DEFAULT 0;
  
	declare _betCount int(5) DEFAULT 0;
  declare _betAmount double(15,4) DEFAULT 0.0000;
  declare _zjAmount double(15,4) DEFAULT 0.0000;
  declare _fanDianAmount double(15,4) DEFAULT 0.0000;
	
	select id into _pri from ssc_played_daily_count where date=_date and type=_type and played=_played;
	
	if _pri=0 or _pri is null THEN
		insert into ssc_played_daily_count (date, type, played) values(_date, _type, _played);
		select id into _pri from ssc_played_daily_count where date=_date and type=_type and played=_played;
	end if;

-- 统计有效方案数


	select count(*) into _betCount from ssc_bets where isDelete=0 and type=_type and playedId=_played and actionNo=_issue and lotteryNo!='';
	
-- 统计总投注额
	select sum(amount) into _betAmount from ssc_bets where isDelete=0 and type=_type and playedId=_played and actionNo=_issue and lotteryNo!='';
-- 统计总中奖额
	select sum(bonus) into _zjAmount from ssc_bets where isDelete=0 and type=_type and playedId=_played and actionNo=_issue and lotteryNo!='';
-- 统计总返点额
	select sum(fanDianAmount) into _fanDianAmount from ssc_bets where isDelete=0 and type=_type and playedId=_played and actionNo=_issue and lotteryNo!='';
	
	
-- 对空值赋默认值，增强稳定性


	if _betCount is null THEN
		set _betCount = 0;
	end if;

	if _betAmount is null THEN
		set _betAmount = 0;
	end if;
	if _zjAmount is null THEN
		set _zjAmount = 0;
	end if;
	if _fanDianAmount is null THEN
		set _fanDianAmount = 0;
	end if;


-- 更新到数据库
	update ssc_played_daily_count set betCount=_betCount, betAmount=_betAmount, zjAmount=_zjAmount, fanDianAmount=_fanDianAmount where id=_pri;
end
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_auto_clearData`
-- ----------------------------
DROP EVENT IF EXISTS `event_auto_clearData`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_auto_clearData` ON SCHEDULE EVERY 1 WEEK STARTS '2014-10-12 00:03:00' ON COMPLETION NOT PRESERVE ENABLE DO call auto_clearData()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_conCom`
-- ----------------------------
DROP EVENT IF EXISTS `event_conCom`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_conCom` ON SCHEDULE EVERY 5 MINUTE STARTS '2012-08-10 00:03:00' ON COMPLETION NOT PRESERVE ENABLE DO call consumptionCommission()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_count`
-- ----------------------------
DROP EVENT IF EXISTS `event_count`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_count` ON SCHEDULE EVERY 1 DAY STARTS '2012-08-10 00:03:00' ON COMPLETION NOT PRESERVE ENABLE DO call pro_count('')
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_pay`
-- ----------------------------
DROP EVENT IF EXISTS `event_pay`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `event_pay` ON SCHEDULE EVERY 90 SECOND STARTS '2017-02-21 11:14:30' ON COMPLETION NOT PRESERVE ENABLE DO begin
	
	call pro_pay();

end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `trig_recharge_update`;
DELIMITER ;;
CREATE TRIGGER `trig_recharge_update` AFTER UPDATE ON `ssc_member_recharge` FOR EACH ROW BEGIN
	declare _gift float(10, 2);
	-- 改变状态的update就是到账事件
	IF OLD.state = 0 and NEW.state !=0 THEN
		select `gift` into _gift from ssc_member_recharge where `id`=OLD.id;
		-- 处理充值赠送
		if _gift is not null and _gift>0 THEN
			call setCoin(_gift, 0, OLD.uid, 88, 0, '充值赠送T', OLD.id, '', '');
		end if;
		
		-- 处理充值佣金
		call addRecharge(OLD.uid, OLD.username);
	END IF;
END
;;
DELIMITER ;
