CREATE TABLE `stock_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `stock_name` varchar(20) DEFAULT '""' COMMENT '股票名称',
  `stock_code` char(6) NOT NULL COMMENT '股票编码',
  `stock_belong` char(3) NOT NULL COMMENT '6:上证 0:深成 3:创业',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:未执行 1:已执行',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `history_data_6` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(10) NOT NULL,
  `trade_date` varchar(15) NOT NULL,
  `open_price` int(10) DEFAULT '0' COMMENT '开盘价',
  `highest_price` int(10) DEFAULT '0' COMMENT '最高价',
  `close_price` int(10) DEFAULT '0' COMMENT '收盘价',
  `lowest_price` int(10) DEFAULT '0' COMMENT '最低价',
  `volume` varchar(20) DEFAULT '"0"' COMMENT '成交量（股）',
  `amount` varchar(20) DEFAULT '"0"' COMMENT '成交金额',
  PRIMARY KEY (`id`),
  KEY `stock_code` (`stock_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `history_data_3` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(10) NOT NULL,
  `trade_date` varchar(15) NOT NULL,
  `open_price` int(10) DEFAULT '0' COMMENT '开盘价',
  `highest_price` int(10) DEFAULT '0' COMMENT '最高价',
  `close_price` int(10) DEFAULT '0' COMMENT '收盘价',
  `lowest_price` int(10) DEFAULT '0' COMMENT '最低价',
  `volume` varchar(20) DEFAULT '"0"' COMMENT '成交量（股）',
  `amount` varchar(20) DEFAULT '"0"' COMMENT '成交金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `history_data_0` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(10) NOT NULL,
  `trade_date` varchar(15) NOT NULL,
  `open_price` int(10) DEFAULT '0' COMMENT '开盘价',
  `highest_price` int(10) DEFAULT '0' COMMENT '最高价',
  `close_price` int(10) DEFAULT '0' COMMENT '收盘价',
  `lowest_price` int(10) DEFAULT '0' COMMENT '最低价',
  `volume` varchar(20) DEFAULT '"0"' COMMENT '成交量（股）',
  `amount` varchar(20) DEFAULT '"0"' COMMENT '成交金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

