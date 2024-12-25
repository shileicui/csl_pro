<?

小程序搭建、发货与费用录入
feature_21638_csl_20240822    tms_admin
feature_21638_csl_20240823    mini_program
feature_21638_csl_20240829    ams_service
feature_21638_csl_20240906    tms_service
// feature_21638_csl_20240910    dispath_admin  不用了 废弃
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21638  未上线

上线前提醒小虎映射 upload 附件文件

确认调拨 发货 添加异步


主题
// tms.fahuo.add.receiptno


order.fourth.delivery 

tms.order.fadb.update 

异步接收地址
index.php?r=tms-su-shipment/update-status

CREATE TABLE `tms_supplier_operator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `su_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属供应商id',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户表id(user.ur_uid)',
  `operator` varchar(20) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `operator_phone` varchar(15) NOT NULL DEFAULT '0' COMMENT '操作人手机',
  `op_token` varchar(50) NOT NULL DEFAULT '' COMMENT '登录token',
  `op_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '操作人状态 1正常，2.停用',
  `op_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态 1正常，0删除',
  `mini_openid` varchar(50) NOT NULL DEFAULT '' COMMENT '小程序openid',
  `nickname` varchar(120) NOT NULL DEFAULT '' COMMENT '微信名称',
  `mini_avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '微信头像',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `last_login_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '上一次登录时间',
  PRIMARY KEY (`id`),
  KEY `idx_su_id` (`su_id`),
  KEY `idx_phone` (`operator_phone`),
  KEY `idx_ur_uid` (`ur_uid`),
  KEY `idx_token` (`op_token`)
) COMMENT='供应商操作人表';


CREATE TABLE `tms_su_shipment` (
  `tss_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tss_shipment_time` int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '发货时间',
  `ro_id` int(11) NOT NULL DEFAULT '0' COMMENT '路由ID （关联route.ro_id）',
  `tssr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '路由发货状态表id （关联tms_su_shipment_route.tssr_id）',

  `su_name`  varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `su_id`   int(11) NOT NULL DEFAULT '0' COMMENT '供应商id（关联 tms_supplier.tms_sup_id)',
  `start_ts_id` int(11) NOT NULL DEFAULT '0' COMMENT '出港站点id （关联transport_stations.ts_id）',
  `stop_ts_id` int(11) NOT NULL DEFAULT '0' COMMENT '到港站点id （关联transport_stations.ts_id）',

  `start_region_id` int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '发货城市ID',
  `start_region_name` varchar(128)  NOT NULL DEFAULT '' COMMENT '发货城市',

  `stop_region_id` int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '到货城市ID',
  `stop_region_name` varchar(128)  NOT NULL DEFAULT '' COMMENT '到货城市',

  `train_flight_no` varchar(100)  NOT NULL DEFAULT '' COMMENT '车次/航班',
  `tss_shipment_no` varchar(255)  NOT NULL DEFAULT '' COMMENT '发货单号',
  `tss_type` tinyint(4)  NOT NULL DEFAULT '1'  COMMENT '货物类型 1、干冰 2、锂电池 3、其他',
  `tss_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '总件数',
  `standard_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '标准重量',
  `actual_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际重量',
  `actual_remark` text COMMENT '发货备注',
  `register_state` tinyint(4) NOT NULL DEFAULT '1'  COMMENT '费用登记状态 1、未登记 2、已登记 3、已通过 4、已驳回',
  `tss_state` tinyint(4) NOT NULL DEFAULT '0'  COMMENT '发货明细变更状态 0未变更 1 已变更',
  `unit_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '单价',
  `freight_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '运费',

  `examine_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '检查费',
  `operation_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '操作费',
  `overweight_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '超重费',
  `cable_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '电报费',
  `packing_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '包装费',
  `pick_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '提货费',

  `total_money`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '总金额',

  `expense_remark` text COMMENT '费用备注',
  `cause_rejection` text COMMENT '驳回原因',

  `operator_phone` varchar(15) NOT NULL DEFAULT '' COMMENT '操作人手机',

  `distask_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：未提货，2：已提货',
  `tss_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：显示，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tss_id`),
  KEY `idx_ro_id` (`ro_id`) ,
  KEY `idx_start_ts_id` (`start_ts_id`) ,
  KEY `idx_stop_ts_id` (`stop_ts_id`) ,
  KEY `idx_start_region_id` (`start_region_id`) ,
  KEY `idx_stop_region_id` (`stop_region_id`) 
) COMMENT='供应商发货表明细';




CREATE TABLE `tms_su_shipment_order` (
  `tsso_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tss_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商发货ID （关联tms_su_shipment.tss_id)',
  `to_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '订单id(关联transport_order.to_id)',
  `di_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '调度ID （关联dispatch.di_id）',
  `tsso_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '发货数量',
  `tsso_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：显示，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tsso_id`),
  KEY `idx_tss_id` (`tss_id`) ,
  KEY `idx_di_id` (`di_id`) ,
  KEY `idx_to_id` (`to_id`) 
) COMMENT='供应商发货订单表';


CREATE TABLE `tms_su_shipment_box` (
  `tssb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `to_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '订单id(关联transport_order.to_id)',
  `tsso_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '发货明细订单表id(关联tms_su_shipment_order.tsso_id)',
  `sto_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '箱型sto_id(关联order_material.sto_id)',
  `sto_no` char(32)  NOT NULL DEFAULT '' COMMENT '存货编号',
  `tssb_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '发货数量',
  `box_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单个箱子的标准重量',
  `temp_text` varchar(255) NOT NULL DEFAULT '' COMMENT '箱子对应的温度计',
  `tssb_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：显示，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tssb_id`),
  KEY `idx_sto_id` (`sto_id`) ,
  KEY `idx_tsso_id` (`tsso_id`) ,
  KEY `idx_to_id` (`to_id`) 
) COMMENT='供应商发货表对应箱型';



CREATE TABLE `tms_su_shipment_route` (
  `tssr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ro_id` int(11) NOT NULL DEFAULT '0' COMMENT '路由ID （关联route.ro_id）',
  `departure_trans_time`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '订单id(关联dispatch_detail.departure_trans_time)',
  `tssr_state` tinyint(4) NOT NULL DEFAULT '1'  COMMENT '发货状态 1、部分发货 2、已发货',
  `tssr_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：显示，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tssr_id`),
  KEY `idx_ro_id` (`ro_id`) ,
  KEY `idx_departure_trans_time` (`departure_trans_time`),
  UNIQUE KEY `uniq_roid_time_index` (`ro_id`, `departure_trans_time`)
) COMMENT='供应商发货明细状态表';



CREATE TABLE `tms_supplier_operator_order` (
  `tsoo_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tso_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商操作人表ID （关联tms_supplier_operator.id)',
  `tssr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '路由发货状态表id （关联tms_su_shipment_route.tssr_id）',
  `to_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '订单id(关联transport_order.to_id)',
  `di_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '调度ID （关联dispatch.di_id）',
  `tsoo_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否确认发货 1 未确认发货 2 已确认发货 ',
  `tsoo_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：显示，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tsoo_id`),
  KEY `idx_tssr_id` (`tssr_id`) ,
  KEY `idx_tso_id` (`tso_id`) ,
  KEY `idx_di_id` (`di_id`) ,
  KEY `idx_to_id` (`to_id`) 
) COMMENT='供应商操作人表发货扫码运单表';


ALTER table
  tms_supplier
add
  COLUMN `tss_su_id`   int(11) NOT NULL DEFAULT '0' COMMENT '代理供应商id（关联 tms_supplier.tms_sup_id)',
add
  COLUMN `tss_su_name`   varchar(255) NOT NULL DEFAULT '' COMMENT '代理供应商';


// ALTER TABLE tms_su_shipment MODIFY COLUMN `standard_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '标准重量',
// MODIFY COLUMN `actual_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际重量';


//提货--------------------lllllllllllllllllllllllll----------------------、、、、、、、







// ALTER table
//   tms_su_shipment
// add
//   COLUMN `tsd_id`   int(11) NOT NULL DEFAULT '0' COMMENT '关联提货id（关联 tms_supplier_distask.tsd_id)';


CREATE TABLE `tms_supplier_operator_distask` (
  `tsod_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',

  `tso_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商操作人表ID （关联tms_supplier_operator.id)',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市ID （关联route.stop_region_id)',
  // `tss_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '扫描选择的发货明细id tms_su_shipment.tss_id',

  `distask_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '提货日期',
  `to_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '订单id(关联transport_order.to_id)',
  `di_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '调度ID （关联dispatch.di_id）',

  `tsod_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否确认提货 1 未确认提货 2 已确认提货 ',
  `tsod_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：正常，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tsod_id`),
  KEY `idx_tso_id` (`tso_id`) ,
  KEY `idx_distask_time` (`distask_time`) ,
  KEY `idx_di_id` (`di_id`) ,
  KEY `idx_to_id` (`to_id`) 
) COMMENT='供应商操作人表提货扫码运单表';



CREATE TABLE `tms_supplier_distask` (
  `tsd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',

  `distask_time` int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '提货时间',

  `region_name` varchar(128)  NOT NULL DEFAULT '' COMMENT '提货城市名称',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市ID （关联route.stop_region_id)',
  `su_id`   int(11) NOT NULL DEFAULT '0' COMMENT '供应商id（关联 tms_supplier.tms_sup_id)',

  `unit_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '单价',
  `distask_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '提货费',
  `service_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '服务费',
  `other_price`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '其他收费',

  `tsd_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '总件数',
  `tsd_order_num` int(10) NOT NULL DEFAULT '0' COMMENT '订单单数',

  `operator_phone` varchar(15) NOT NULL DEFAULT '' COMMENT '操作人手机',
  `tsd_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：正常，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tsd_id`),
  KEY `idx_distask_time` (`distask_time`) 
) COMMENT='供应商提货表明细';



// CREATE TABLE `tms_supplier_distask_relevance` (
//   `tdsr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',

//   `tsd_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商提货ID tms_supplier_distask.tsd_id)',

//   `tss_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商发货ID （关联tms_su_shipment.tss_id)',

//   `tdsr_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '提货数量',
//   `tdsr_order_num` int(10) NOT NULL DEFAULT '0' COMMENT '订单数量',

//   `tdsr_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否确认发货 1 显示 2 隐藏 ',
//   `tdsr_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：正常，2：删除',
//   `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
//   `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
//   `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
//   PRIMARY KEY (`tdsr_id`),
//   KEY `idx_tsd_id` (`tsd_id`) ,
//   KEY `idx_tss_id` (`tss_id`) 
// ) COMMENT='供应商提货关联表';


CREATE TABLE `tms_su_shipment_order_distask` (
  `tssod_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',

  // `tsso_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货明细订单表id(关联tms_su_shipment_order.tsso_id)',
  `tsd_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商提货ID tms_supplier_distask.tsd_id)',

  // `tss_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商发货ID （关联tms_su_shipment.tss_id)',
  `to_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '订单id(关联transport_order.to_id)',

  `di_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '调度ID （关联dispatch.di_id）',
  `tssod_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '提货数量',

  // `tssod_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '显示状态 1 显示 2 隐藏 ',
  `tssod_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：正常，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at`  datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tssod_id`),
  KEY `idx_tss_id` (`tss_id`) ,
  KEY `idx_tsso_id` (`tsso_id`) ,
  KEY `idx_di_id` (`di_id`) ,
  KEY `idx_tsd_id` (`tsd_id`) ,
  KEY `idx_to_id` (`to_id`) 
) COMMENT='供应商提货订单表';


CREATE TABLE `tms_su_shipment_box_distask` (
  `tssbd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',

  `to_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '订单id(关联transport_order.to_id)',
  `tssod_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '提货明细订单表id(tms_su_shipment_order_distask.tssod_id)',
  // `tsso_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '发货明细订单表id(关联tms_su_shipment_order.tsso_id)',

  `sto_id`  int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '箱型sto_id(关联order_material.sto_id)',
  `sto_no` char(32)  NOT NULL DEFAULT '' COMMENT '存货编号',

  `tssbd_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '提货数量',
  `box_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单个箱子的标准重量',
  `temp_text` varchar(255) NOT NULL DEFAULT '' COMMENT '箱子对应的温度计',

  `tssbd_state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否确认发货 1 显示 2 隐藏 ',
  `tssbd_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：正常，2：删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tssbd_id`),
  KEY `idx_sto_id` (`sto_id`) ,
  KEY `idx_tssod_id` (`tssod_id`) ,
  KEY `idx_tsso_id` (`tsso_id`) ,
  KEY `idx_to_id` (`to_id`) 
) COMMENT='供应商提货表对应箱型';


ALTER table
  tms_su_shipment
add
 `distask_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：未提货，2：已提货';

ALTER table
  tms_supplier_operator_distask
add
 `tss_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '扫描选择的发货明细id tms_su_shipment.tss_id';



// alter table ams_external_assist_materials drop su_name;


// ALTER table
//   tms_supplier_operator_distask
// ADD
//   COLUMN `tss_ids` varchar(255)  NOT NULL DEFAULT '' COMMENT '扫码选择的发货明细ids tms_su_shipment.tss_id';


// ALTER table
//   tms_su_shipment_box
// ADD
//   COLUMN `tsso_id` int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '发货明细订单表id(关联tms_su_shipment_order.tsso_id)',
// ADD
//   INDEX idx_tsso_id (`tsso_id`);

// ALTER table
//   tms_su_shipment
// add
//   COLUMN `tssr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '路由发货状态表id （关联tms_su_shipment_route.tssr_id）';


// ALTER table
//   tms_su_shipment
// add
//   COLUMN `su_name`  varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称',
// add
//   COLUMN `su_id`   int(11) NOT NULL DEFAULT '0' COMMENT '供应商id（关联 tms_supplier.tms_sup_id)';



// ALTER table
//   tms_su_shipment_order
// add
//   COLUMN `di_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '调度ID （关联dispatch.di_id）';


// ALTER table
//   tms_su_shipment_box
// add
//   COLUMN `box_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单个箱子的标准重量';

// ALTER table
//   tms_su_shipment_box
// add
//   COLUMN `temp_text` varchar(255) NOT NULL DEFAULT '' COMMENT '箱子对应的温度计';

// ALTER table
//   tms_su_shipment
// add
//   COLUMN `tss_operator_phone` varchar(15) NOT NULL DEFAULT '0' COMMENT '操作人手机';


// ALTER table
//   tms_su_shipment
// add
//   COLUMN `cause_rejection` text COMMENT '驳回原因';



// ALTER TABLE tms_su_shipment_route
// ADD UNIQUE KEY `uniq_roid_time_index` (`ro_id`, `departure_trans_time`);


// UPDATE tms_su_shipment tss
// LEFT JOIN tms_remark_log trl ON tss.tss_id = trl.trl_identifier and trl_subtype =158001
// LEFT JOIN tms_supplier_operator tso ON tso.id = trl.trl_uid  
// SET tss.tss_operator_phone = tso.operator_phone;
