<?

车辆管理4.0：车辆信息拓展
feature_14585_csl_20230807  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14585 未上线


{tms_admin}history-data/car-info  车辆附属信息
这个帮我执行一下


违章 feature_14585wz_csl_20230810

CREATE TABLE `tms_car_break` (
  `tcb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `car_number` varchar(32) DEFAULT NULL DEFAULT '' COMMENT '车牌号',
  `break_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '违章日期',
  `break_uid` int(11) NOT NULL DEFAULT '0' COMMENT '违章人/驾驶人uid',
  `break_username` varchar(30) NOT NULL DEFAULT '' COMMENT '违章人/驾驶人姓名',
  `project_name` varchar(255) NOT NULL DEFAULT '' COMMENT '违章项目',
  `duty_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有责  1无责  2有责',
  `tcb_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '处理状态 1未处理 2已处理',
  `buckle_minute` int(11) NOT NULL DEFAULT '0' COMMENT '扣分',
  `break_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '罚款金额',
  `tcb_address` varchar(800) NOT NULL DEFAULT '' COMMENT '违章地址',
  `tcb_remark` text COMMENT '备注内容',
  `tcb_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tar_id`),
  KEY `idx_break_uid` (`break_uid`)
) COMMENT='车辆违章记录';


年检

CREATE TABLE `tms_car_yearcheck` (
  `tcy_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `car_number` varchar(32) DEFAULT NULL DEFAULT '' COMMENT '车牌号',
  `yearcheck_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '年检日期',
  `next_yearcheck_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下次年检日期',
  `yearcheck_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '年检费用',
  `yearcheck_content` text COMMENT '年检内容',
  `car_manage_name` varchar(255) NOT NULL DEFAULT '' COMMENT '车管所',
  `responsible_uid` int(11) NOT NULL DEFAULT '0' COMMENT '经手人uid',
  `responsible_username` varchar(30) NOT NULL DEFAULT '' COMMENT '经手人姓名',
  `tcy_remark` text COMMENT '备注内容',
  `tcy_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tcy_id`),
  KEY `idx_responsible_uid` (`responsible_uid`)
) COMMENT='车辆年检记录';

字段调整
 alter table car modify column `car_volume` double(10,1) NOT NULL DEFAULT '0' COMMENT '车辆容积';

证件管理
CREATE TABLE `tms_car_certificate` (
  `tcc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `car_number` varchar(32) DEFAULT NULL DEFAULT '' COMMENT '车牌号',
  `serial_number` varchar(100) NOT NULL DEFAULT '' COMMENT '编号',
  `certificate_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发证/卡日期',
  `validity_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效截止日期',
  `tcc_status` int(11) NOT NULL DEFAULT '0' COMMENT '101001 : 行驶证, 101003 : 登记证, 101010 : 运输证, 101011 : 油卡, 101012: ETC',
  `tcc_visible` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1显示，2删除',
  `tcc_remark` longtext NOT NULL COMMENT '备注',
  `tcc_att_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '附件ID',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tcc_id`)
) COMMENT='车辆证件管理';


冷机配置

alter table
  tms_car_info
add
  column `refrigerator_num` int(11) NOT NULL DEFAULT '0' COMMENT '机组数量',
add
  column `refrigerator_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '机组性质 1、独立 2、非独立',
add
  column `refrigerator_setnums` varchar(50) NOT NULL DEFAULT '' COMMENT '设置参数 1、除霜间隔4H 2、除霜间隔6H 3、回温度间隔2C 4、回温度间隔1C',
add
  column `refrigerator_number` varchar(100) NOT NULL DEFAULT '' COMMENT '主冷机编号',
add
  column `first_premium_hour` int(11) NOT NULL DEFAULT '0' COMMENT '主冷机首保时长',
add
  column `renewal_premium_hour` int(11) NOT NULL DEFAULT '0' COMMENT '主冷机续保时长',
add
  column `vice_refrigerator_name` varchar(255) NOT NULL DEFAULT '' COMMENT '副冷机品牌和型号',
add
  column `vice_refrigerator_number` varchar(100) NOT NULL DEFAULT '' COMMENT '副冷机编号',
add
  column `vice_first_premium_hour` int(11) NOT NULL DEFAULT '0' COMMENT '副冷机首保时长',
add
  column `vice_renewal_premium_hour` int(11) NOT NULL DEFAULT '0' COMMENT '副冷机续保时长',
add
  column `vice_cumulative_duration` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '副冷机累计使用时长',
add
  column `door_require` varchar(255) NOT NULL DEFAULT '' COMMENT '安装要求',
add
  column `door_num` int(11) NOT NULL DEFAULT '0' COMMENT '门帘数量',
add
  column `door_num_qualified` tinyint(4) NOT NULL DEFAULT '0' COMMENT '门帘数量是否合格 1是 2否',
add
  column `door_position_qualified` tinyint(4) NOT NULL DEFAULT '0' COMMENT '门帘位置是否合格 1是 2否';



冷机保养记录

CREATE TABLE `tms_car_refrigerator` (
  `tcr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `car_number` varchar(32) DEFAULT NULL DEFAULT '' COMMENT '车牌号',
  `refrigerator_name` varchar(255) NOT NULL DEFAULT '' COMMENT '冷机品牌和型号',
  `refrigerator_number` varchar(100) NOT NULL DEFAULT '' COMMENT '冷机编号',
  `tcr_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '主副冷机 1、主 2、副',
  `upkeep_hour`  int(11) NOT NULL DEFAULT '0' COMMENT '最新保养时数',
  `upkeep_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最新保养日期',
  `upkeep_project` varchar(255) NOT NULL DEFAULT '' COMMENT '保养项目',
  `upkeep_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保养金额',
  `tcr_visible` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1显示，2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tcr_id`)
) COMMENT='车辆冷机保养记录';







car_door
car_box
car_tail_lift








诺和包装功能修改-后端
feature_14675_csl_20230807 omsapi 
feature_14675_csl_20230807 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14675 已上线


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

ALTER table
  tms_order_drug
add
  COLUMN `log_tod_id` int(11) unsigned not null DEFAULT '0' COMMENT '操作记录表tod_id',
add
  COLUMN `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作员id',
add
  COLUMN `username` varchar(30) NOT NULL DEFAULT '' COMMENT '操作员名称';
  
ALTER table
  tms_orderdrug_info
add
  COLUMN `log_toi_id` int(11) unsigned not null DEFAULT '0' COMMENT '操作记录表toi_id',
add
  COLUMN `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作员id',
add
  COLUMN `username` varchar(30) NOT NULL DEFAULT '' COMMENT '操作员名称';



智能创建工作单周末不收件异常
fixbug_9667_csl_20230810  tms_admin
https://project.ashsh.com.cn/index.php?m=bug&f=view&bugID=9667 已上线



发运规则 时间限制支持全选
feature_14746_csl_20230810 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14746 未上线



cart订单编号 63260471 取件节点 时间 更改为 2023-08-10 21:54:00（改之前：2023-08-10 23:26:00）

update tms_cart_operation_record set tcor_time = 1691675640 where tcor_id=10045;
update order_logistics set ol_pickup_time = 1691675640 where to_id=2590569;


update remark_log set rl_remark = ' 取件到达：到达时间：2023-08-10 21:54 到达附近坐标点：113.297454,23.137755' where rl_id=81219205;
update remark_log set rl_remark = ' 取件人：罗文深，取件时间：2023-08-10 21:54，取件件数：1，运单编号:63260471，</br> 激活工作单:11377026</br>自动指派给： 组长： 组员：罗文深' where rl_id=81219208;



批量录入发货单号 限制条数放开
feature_14797_csl_20230811 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14797 已上线



//        $date = date('Y-m');
//        $nosql = "SELECT tmd_number  from tms_mileage_declare where  FROM_UNIXTIME( created_time, '%Y-%m' ) = '".$date."' order by tmd_id DESC ";
//        $tmno = Yii::$app->db->createCommand($nosql)->queryOne();
//        if($tmno['tmd_number']){
//            $tmd_number = substr($tmno['tmd_number'],2,10);
//            $tmd_number =$tmd_number+1;
//            $tmd_number = 'LC'.$tmd_number;
//        }else{
//            $tmd_number = 'LC'.date('Ym',time()).'0001';
//        }
//        return $tmd_number;




里程申报 申请编号 生成优化
feature_14875_csl_20230816  tms_service 
feature_14875_csl_20230817 tms_admin
feature_14875_csl_20230817 omsapi
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14875  未上线



user-operator

订单调度：发货单号管理
feature_14915_csl_20230822 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14915  未上线



车辆管理4.0：车辆信息拓展 第二版
feature_15030_csl_20230824  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15030 未上线