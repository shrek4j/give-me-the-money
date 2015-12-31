CREATE TABLE `stock_list` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '����',
  `stock_name` varchar(20) DEFAULT '""' COMMENT '��Ʊ����',
  `stock_code` char(6) NOT NULL COMMENT '��Ʊ����',
  `stock_belong` char(3) NOT NULL COMMENT '6:��֤ 0:��� 3:��ҵ',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0:δִ�� 1:��ִ��',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `history_data_6` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(10) NOT NULL,
  `trade_date` varchar(15) NOT NULL,
  `open_price` int(10) DEFAULT '0' COMMENT '���̼�',
  `highest_price` int(10) DEFAULT '0' COMMENT '��߼�',
  `close_price` int(10) DEFAULT '0' COMMENT '���̼�',
  `lowest_price` int(10) DEFAULT '0' COMMENT '��ͼ�',
  `volume` varchar(20) DEFAULT '"0"' COMMENT '�ɽ������ɣ�',
  `amount` varchar(20) DEFAULT '"0"' COMMENT '�ɽ����',
  PRIMARY KEY (`id`),
  KEY `stock_code` (`stock_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `history_data_3` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(10) NOT NULL,
  `trade_date` varchar(15) NOT NULL,
  `open_price` int(10) DEFAULT '0' COMMENT '���̼�',
  `highest_price` int(10) DEFAULT '0' COMMENT '��߼�',
  `close_price` int(10) DEFAULT '0' COMMENT '���̼�',
  `lowest_price` int(10) DEFAULT '0' COMMENT '��ͼ�',
  `volume` varchar(20) DEFAULT '"0"' COMMENT '�ɽ������ɣ�',
  `amount` varchar(20) DEFAULT '"0"' COMMENT '�ɽ����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `history_data_0` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `stock_code` varchar(10) NOT NULL,
  `trade_date` varchar(15) NOT NULL,
  `open_price` int(10) DEFAULT '0' COMMENT '���̼�',
  `highest_price` int(10) DEFAULT '0' COMMENT '��߼�',
  `close_price` int(10) DEFAULT '0' COMMENT '���̼�',
  `lowest_price` int(10) DEFAULT '0' COMMENT '��ͼ�',
  `volume` varchar(20) DEFAULT '"0"' COMMENT '�ɽ������ɣ�',
  `amount` varchar(20) DEFAULT '"0"' COMMENT '�ɽ����',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

