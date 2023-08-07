

车辆管理4.0：车辆信息拓展
feature_14585_csl_20230807  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14585 未上线



CREATE TABLE `tms_car_break` (
  `tcb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `break_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '违章日期',
  `break_uid` int(11) NOT NULL DEFAULT '0' COMMENT '违章人/驾驶人uid',
  `break_username` varchar(30) NOT NULL DEFAULT '' COMMENT '违章人/驾驶人姓名',
  `project_name` varchar(255) NOT NULL DEFAULT '' COMMENT '违章项目',
  `duty_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有责  0无责  1有责',
  `buckle_minute` int(11) NOT NULL DEFAULT '0' COMMENT '扣分',
  `break_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '罚款金额',
  `address` varchar(800) NOT NULL DEFAULT '' COMMENT '违章地址',
  `tcb_remark` text COMMENT '备注内容',
  `tcb_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tar_id`)
) COMMENT='车辆违章记录';



CREATE TABLE `tms_order_druglog` (
  `tod_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作员id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '操作员名称',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单to_id',
  `temp_number` varchar(50) NOT NULL DEFAULT '' COMMENT 'Libero温度计',
  `out_temp_number` varchar(50) NOT NULL COMMENT '外显温度计',
  `box_number` varchar(50) NOT NULL DEFAULT '' COMMENT '箱子序列号',
  `sync_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否同步主表  0未同步  1已同步',
  `tod_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tod_id`)
)COMMENT='操作员订单药品信息表';


CREATE TABLE `tms_orderdrug_infolog` (
  `toi_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作员id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '操作员名称',
  `tod_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tms_order_druglog表 tod_id',
  `drug_number` varchar(50) NOT NULL DEFAULT '' COMMENT '药品序列号',
  `sync_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否同步主表  0未同步  1已同步',
  `toi_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`toi_id`)
)COMMENT='操作员订单药品信息关联表';

ALTER table tms_order_drug add COLUMN log_tod_id  tinyint(4)  not null  DEFAULT '0' COMMENT '操作记录表tod_id';
