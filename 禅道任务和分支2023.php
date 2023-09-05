<?

车辆管理4.0：车辆信息拓展
feature_14585_csl_20230807  tms_admin
feature_14585_csl_20230830 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14585 已上线

车辆附属信息

{tms_admin}history-data/car-info  
这个帮我执行一下


违章 feature_14585wz_csl_20230810

CREATE TABLE `tms_car_break` (
  `tcb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `car_number` varchar(32) NOT NULL DEFAULT '' COMMENT '车牌号',
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
  PRIMARY KEY (`tcb_id`),
  KEY `idx_break_uid` (`break_uid`)
) COMMENT='车辆违章记录';


年检

CREATE TABLE `tms_car_yearcheck` (
  `tcy_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `car_number` varchar(32) NOT NULL DEFAULT '' COMMENT '车牌号',
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
 alter table car modify column `car_volume` decimal(10,1) NOT NULL DEFAULT '0' COMMENT '车辆容积';

证件管理
CREATE TABLE `tms_car_certificate` (
  `tcc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `car_number` varchar(32) NOT NULL DEFAULT '' COMMENT '车牌号',
  `serial_number` varchar(100) NOT NULL DEFAULT '' COMMENT '编号',
  `certificate_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发证/卡日期  运输证 取car.car_send_card_time',
  `validity_time`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效截止日期 运输证 取car.car_valid_time',
  `tcc_status` int(11) NOT NULL DEFAULT '0' COMMENT '101001 : 行驶证, 101003 : 登记证, 101010 : 运输证, 101011 : 油卡, 101012: ETC',
  `tcc_visible` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1显示，2删除',
  `tcc_remark` text  COMMENT '备注',
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
  `car_number` varchar(32) NOT NULL DEFAULT '' COMMENT '车牌号',
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
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14746 已上线



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
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14875  已上线



user-operator

订单调度：发货单号管理
feature_14915_csl_20230822 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14915  已上线






//62782808  临沧-张远锋 改成 芒市-王昱凯
UPDATE opn_operator SET username = '芒市-王昱凯',user_id='7024' WHERE opn_id = 10255066;
UPDATE tms_operation_fee SET username = '芒市-王昱凯',user_id='7024' WHERE opn_id = 10255066;

//更改调度信息发货人
UPDATE dispatch SET di_consignor_name = '外协-芒市-王昱凯',di_consignor_uid='7024' WHERE di_id = 2693924;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102023', 2596988, 0, '系统申请', 0, 'IT协助修改数据 审批单号：ITSJ202308280003 调度单号2322614424 发货人 临沧-张远锋 改成 芒市-王昱凯', 1693018518, 1, 0);






UPDATE order_logistics SET ol_pickup_name = '外协-芒市-王昱凯',ol_pickup_person='7024' WHERE to_id = 2596988;

UPDATE opn_operator SET username = '芒市-王昱凯',user_id='7024' WHERE opn_id = 10255046;

UPDATE remark_log SET rl_remark = '取件人：外协-芒市-王昱凯，取件时间：2023-08-19 14:40，取件件数：1，运单编号:62782808，</br> 激活工作单:11418541<br>激活调度单：2322614424',user_id='7024', username = '外协-芒市-王昱凯', WHERE rl_id = 82022373;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102023', 2596988, 0, '系统申请', 0, 'IT协助修改数据 审批单号：ITSJ202308280004 实际取件人改成 改成 芒市-王昱凯', 1693018518, 1, 0);




差旅管家2.3：出差申请和报销查询优化

feature_15089_csl_20230829 tms_admin
feature_15089_csl_20230904 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15089  已上线

CREATE TABLE `tms_travel_steward` (
  `tos_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `steward_number` varchar(50) NOT NULL DEFAULT '' COMMENT '差旅管家订单号',
  `travel_number` varchar(50) NOT NULL DEFAULT '' COMMENT '出差单编号',
  `travel_name` varchar(25) NOT NULL DEFAULT '' COMMENT '出差人名称',
  `cost_name` varchar(25) NOT NULL DEFAULT '' COMMENT '费用类型',
  `travel_tool` varchar(25) NOT NULL DEFAULT '' COMMENT '交通工具',
  `tts_travel_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 1火车 2飞机 3住宿 4未订',

  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `stop_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `start_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '出发城市名称',
  `stop_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '目的城市名称',
  `steward_price` varchar(50) NOT NULL DEFAULT '' COMMENT '金额',
  `result_param` json DEFAULT NULL COMMENT '获取差旅管家的json 数据',
  `steward_type` varchar(50) NOT NULL DEFAULT '' COMMENT '差旅订单状态',

  `tos_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tos_id`)
) COMMENT='出差单相关差旅管家表';

ALTER table
  tms_travel
add
  COLUMN `booking_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订票状态 1交通 2住宿 3 交通/住宿 4未订',
add
  COLUMN `result_params`  json DEFAULT NULL  COMMENT '获取差旅管家的json';


{tms_admin}timing-push/get-travel
每天 8:00 14:00 17:00 执行一次




路由配置管理2.4.1：路由类型调整

feature_15093_csl_20230829  dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15093  已上线

alter table route add column `ro_label`  varchar(255) NOT NULL DEFAULT '' COMMENT '路由标签';


外协操作费用 批量审核通过 优化
feature_15164_csl_20230901  tms_admin
feature_15164_csl_20230901  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15164 已上线


车辆管理调整
feature_15208_csl_20230904
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15208 已上线


里程申报 已作废 不在同步数据
feature_15211_csl_20230904  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15211  未上线


路由详情修改供应商优化
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15216  已上线




自动生成里程申报优化
feature_15223_csl_20230905  tms_admin
feature_15223_csl_20230905  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15223

56e64ea2a6118223cf3ef428e637dddd