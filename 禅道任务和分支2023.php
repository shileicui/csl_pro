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

UPDATE remark_log SET rl_remark = '取件人：外协-芒市-王昱凯，取件时间：2023-08-19 14:40，取件件数：1，运单编号:62782808，</br> 激活工作单:11418541<br>激活调度单：2322614424',ur_uid='7024', username = '外协-芒市-王昱凯', WHERE rl_id = 82022373;

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
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15211  已删除


路由详情修改供应商优化
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15216  已上线




自动生成里程申报优化
feature_15223_csl_20230905  tms_admin
feature_15223_csl_20230905  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15223 已上线

56e64ea2a6118223cf3ef428e637dddd



供应商结构调整
feature_15243_csl_20230906  tms_admin  20230911 发第一版 
feature_15243_csl_20230906  dispath_admin   20230911 发第一版 
feature_15243_csl_20230906  tms_service  已上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15243  未上线（已发第一版）

alter table tms_supplier modify column `tms_sup_supply_type` varchar(255) NOT NULL DEFAULT '' COMMENT '供货类型 对应路由类型 rt_id';

UPDATE tms_supplier SET tms_sup_supply_type=9 where  tms_sup_supply_type = 3;

alter table tms_sdeduction add column `su_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '供应商序号';

// php yii history-data/opn-order


//未上线 （第二版 sql）
// 清空历史数据 供应商代码
update tms_supplier_main set sup_code = ''; 

//历史供应商主体 同步大数据
php yii history-data/supplier-main-data


供应商主体 
feature_15243_csl_20230906  tms_admin  

feature_15243_csl_20230906  tms_service  已发版


ALTER TABLE
  tms_supplier_main
ADD
  COLUMN `sup_credit_code` VARCHAR (100) NOT NULL DEFAULT '' COMMENT '统一信用社代码',
ADD
  COLUMN `bank_type` VARCHAR (50) NOT NULL DEFAULT '' COMMENT '银行类别',
ADD
  COLUMN `account_natures` TINYINT (4) NOT NULL DEFAULT '0' COMMENT '账号性质 1公司 2个人',
ADD
  COLUMN `tsa_currency` TINYINT (4) NOT NULL DEFAULT '1' COMMENT '币种 1人民币';


// CREATE TABLE `tms_supplier_account` (
//   `tsa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
//   `sup_main_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '供应商主体id',
//   `sup_bank_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开户银行名称',
//   `sup_bank_account` varchar(255) NOT NULL DEFAULT '' COMMENT '银行账号',
//   `sup_payee_name` varchar(255) NOT NULL DEFAULT '' COMMENT '账号名称',

//   `bank_type` varchar(50) NOT NULL DEFAULT '' COMMENT '银行类别',
//   `bank_code` varchar(50) NOT NULL DEFAULT '' COMMENT '银行行号',
//   `account_natures` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账号性质 1公司 2个人',
//   `tsa_currency` varchar(50) NOT NULL DEFAULT '' COMMENT '币种',

//   `expiry_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '失效日期',
//   `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '启用日期',
//   `effective_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '生效日期',
  
//   `tsa_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
//   `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
//   `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
//   `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
//   PRIMARY KEY (`tsa_id`),
//   KEY `idx_sup_main_id` (`sup_main_id`)
// ) COMMENT='供应商主体相关账号信息';



// tms_bank

// CREATE TABLE `tms_bank` (
//   `tb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  
//   `bank_name` varchar(255) NOT NULL DEFAULT '' COMMENT '账号名称',

//   `bank_code` varchar(50) NOT NULL DEFAULT '' COMMENT '银行行号',
 
//   `tsa_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
//   `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
//   `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
//   `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
//   PRIMARY KEY (`tb_id`)
// ) COMMENT='银行名称';







//62782853  临沧-张远锋 改成 芒市-王昱凯
UPDATE opn_operator SET username = '芒市-王昱凯',user_id='7024' WHERE opn_id = 10272293;

//更改调度信息发货人
UPDATE dispatch SET di_consignor_name = '外协-芒市-王昱凯',di_consignor_uid='7024' WHERE di_id = 2688528;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102023', 2592770, 0, '系统申请', 0, 'IT协助修改数据 审批单号：ITSJ202309070003 调度单号2322252764 发货人 员工-昆明市-文汉(0500) 改成 芒市-王昱凯', 1694073106, 1, 0);






UPDATE order_logistics SET ol_pickup_name = '外协-芒市-王昱凯',ol_pickup_person='7024' WHERE to_id = 2592770;

UPDATE opn_operator SET username = '芒市-王昱凯',user_id='7024' WHERE opn_id = 10272249;

UPDATE remark_log SET rl_remark = '取件人：外协-芒市-王昱凯，取件时间：2023-08-21 15:19，取件件数：1，运单编号:62782853，</br> 激活工作单:11391491<br>激活调度单：2322241759',ur_uid='7024', username = '外协-芒市-王昱凯', WHERE rl_id = 82256821;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102023', 2592770, 0, '系统申请', 0, 'IT协助修改数据 审批单号：ITSJ202309070003 实际取件人改成 改成 芒市-王昱凯', 1694073106, 1, 0);










 

发货记录增加，是否有上传附件的筛选
feature_15310_csl_20230911  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15310 未上线

//历史数据状态更新
php yii history-data/dispatch-file



增加对仓库工作单操作的接口
feature_15355_csl_20230911 tms_service
feature_15355_csl_20230911  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15355  未上线



薛滨测试数据  
UPDATE tms_refuel_record set trr_visible=0 where trr_id=1431;


车辆管理4.1：车辆详情，保养和提醒优化
feature_15384_csl_20130913 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15384 未上线



alter table
  tms_car_info
add
  column `car_power` varchar(50) NOT NULL DEFAULT '' COMMENT '排量/功率 ',
add
  column `refrigerator_hour_fuel` int(11) NOT NULL DEFAULT '0' COMMENT '冷机官方小时油耗',
add
  column `start_refrigerator_kilometre` int(11) NOT NULL DEFAULT '0' COMMENT '满油开冷机可行驶公里数',
add
  column `car_scrap_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '报废日期',
add
  column `car_scrap_remark` text COMMENT '报废备注内容',
add
  column `runny_expect_status` TINYINT (4) NOT NULL DEFAULT '0' COMMENT '易流安装要求 1需安装已安装 2需安装未安装 3无需安装 ',
add
  column `runny_probes_num` TINYINT (4) NOT NULL DEFAULT '0' COMMENT '探头数量 2、2路 4、4路',
add
  column `runny_probes_place` TINYINT (4) NOT NULL DEFAULT '0' COMMENT '探头位置是否合格 1是 2否';

//证件历史数据 执行时先导出一份数据
php yii history-data/upd-car-cert

alter table
  car_repair
add
  column `maintain_type` TINYINT (4) NOT NULL DEFAULT '0' COMMENT '保养类型  1常规保养 2临时保养';



供应商主体限制
feature_15574_csl_20230920 tms_admin
feature_15574_csl_20230920 tms_service

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15574 未上线




路由类型 新增
feature_15628_csl_20230925 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15628  已上线



供应商主体 调整
feature_15609_csl_20230922
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15609


ALTER TABLE
  tms_supplier_main
ADD
  COLUMN `sup_remark`  text   COMMENT '备注';








  SELECT
        ro.ro_id as '路由id',
        ro.ro_name as '路由名称',
  CASE 
          ro.ro_type
                WHEN '1' THEN '待审核'
                WHEN '2' THEN '已审核'
                END '路由审核状态',
        CASE
        ro.ro_status 
        WHEN '0' THEN
        '正常' 
        WHEN '1' THEN
        '停运' 
        END '路由状态',
  ts1.ts_name as '出港站点',
  ts1.ts_id as '出港站点id',
  ts1.region_name as '出发城市',
  ts1.child_region_name as '出发地区',          
        ts2.ts_name as '到港站点',
        ts2.ts_id as '到港站点id',
  ts2.region_name as '到达城市',
  ts2.child_region_name as '到达地区',
  rt.rt_name as '路由类型'          
FROM
        route ro
  left join transport_stations ts1 on ts1.ts_id=ro.start_ts_id
  left join transport_stations ts2 on ts2.ts_id=ro.stop_ts_id
  left join route_type rt on rt.rt_id=ro.rt_id         
WHERE
        ro.ro_visible =1 and use_count=0




供应商kpi
feature_15605_csl_20231007
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15605  未上线



CREATE TABLE `tms_supplier_kpi` (
  `tsk_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tms_sup_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '供应商id',
  `month_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '月份',
  `assess_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '考核结果 1优秀 2良好 3一般',
  `grade` int(4) NOT NULL DEFAULT '0' COMMENT '分数',
  `tsk_remark` text COMMENT '备注内容',
  `tsk_att_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '附件ID',
  `tsk_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tsk_id`),
  KEY `idx_tms_sup_id` (`tms_sup_id`)
) COMMENT='供应商kpi';











烟台市-杭州市-航空  10.8启用



出差单新增 同步状态
feature_15692_csl_20231008 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15692


客户配置 不可以高铁押运  开关

ALTER table tms_customer_config add COLUMN high_speed_status tinyint(4)  not null  DEFAULT '0' COMMENT '不可以高铁押运 1不可以 0可以';



{
    "tcc_dwt_shutdown_verify": {
        "on": 1,
        "off": 0,
        "label": "鼎为关机验证",
        "span": ""
    },
    "cu_piece_feedback": {
        "on": 1,
        "off": 2,
        "label": "签收自动反馈",
        "span": "（派件1小时后自动邮件签收反馈）"
    },
    "cu_temperature_feedback": {
        "on": 1,
        "off": 2,
        "label": "温度自动反馈",
        "span": "（每晚8点自动邮件温度数据反馈）"
    },
    "cu_temperature_type": {
        "on": 1,
        "off": 2,
        "label": "支持批量上传温度数据",
        "span": "（默认客户支持批量上传温度数据）"
    },
    "cu_tengsen_trmperature": {
        "on": 1,
        "off": 2,
        "label": "不支持批量上传滕森温度数据",
        "span": "（默认客户支持上传）"
    },
    "cu_sign_feedback": {
        "on": 1,
        "off": 2,
        "label": "代签短信提醒",
        "span": ""
    },
    "cu_goods_print": {
        "on": 1,
        "off": 0,
        "label": "打印运单时将货物名称打印在运单上",
        "span": ""
    },
    "cu_send_message": {
        "on": 0,
        "off": 1,
        "label": "不发送取派短信",
        "span": "（配置后不给收发件人发送取派短信）"
    },
    "cu_print_express_remark": {
        "on": 1,
        "off": 0,
        "label": "客户单号打印到运单备注",
        "span": ""
    },
    "main_plural_thermometer": {
        "on": 1,
        "off": 0,
        "label": "支持主副温度计",
        "span": " "
    },
    "connect_verify": {
        "on": 1,
        "off": 0,
        "label": "上传客户交接单",
        "span": " "
    },
    "write_temp_switch": {
        "on": 1,
        "off": 0,
        "label": "取派件填写开启关闭温度",
        "span": " "
    },
    "batch_delivery_switch": {
        "on": 1,
        "off": 0,
        "label": "批量派件",
        "span": " "
    },
    "cpc_not_use_ssexpress": {
        "on": 1,
        "off": 0,
        "label": "不使用生生签收单据",
        "span": " "
    },
    "cpc_use_customer_express": {
        "on": 1,
        "off": 0,
        "label": "使用客户签收单据",
        "span": " "
    },
    "ice_aging_status": {
        "on": 1,
        "off": 0,
        "label": "不允许中途私自换冰排",
        "span": " "
    },
    "high_speed_status": {
        "on": 1,
        "off": 0,
        "label": "不可以高铁押运",
        "span": " "
    }
}


路由全选 默认选中 20条
feature_15737_csl_20231010 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15737 未上线




201208064
202102951


荣昌成品药/协和麒麟冷藏车机器人提醒易流预警及超温
feature_15754_csl_20231010  tms_admin

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15754 未上线

//车辆异常数据推送 消息模板 新
define('Yl_TUIAW_MESSAGE_NEW_ID','186');

//车辆异常推送群 诺和
define('NH_YL_TUIAW_MESSAGE_CARQWKEY','ff0b8708-79cb-4298-be77-2b8234826f1d');

//车辆异常推送群  荣昌成品药/协和麒麟
define('QT_YL_TUIAW_MESSAGE_CARQWKEY','52af3331-ed9c-44d0-8cab-90d89f3c3f3b');





路由配置管理2.4：路由类型调整
feature_15812_csl_20231012  tms_service
feature_15812_csl_20231012  dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15812 未上线



193条 rt_id =12

19条 rt_id =11



15815 耗材发货记录按钮

feature_15815_csl_20231012 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15815 已上线



物流供应商2.5：供应商增加附件
feature_15832_csl_20231013
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15832  已上线


ALTER table tms_supplier add COLUMN `at_ids` varchar(200) NOT NULL DEFAULT '' COMMENT '附件ID';



车辆管理4.1：车辆详情，保养和提醒优化
feature_15834_csl_20231013  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15834  已上线
alter table
  car_repair
add
  column `unique_number` varchar(100) NOT NULL DEFAULT '' COMMENT '泛微ecology关联编号',
add
  column `cr_md` varchar(100) NOT NULL DEFAULT '' COMMENT '泛微ecology数据md5',
add
  column `cr_url` text COMMENT '泛微上传的图片';


alter table
  car
add
  column `car_mileage` varchar(50)  NOT NULL  DEFAULT '' COMMENT  '行驶里程',
add
  column `car_repair_mile`  varchar(50)  NOT NULL  DEFAULT ''  COMMENT '上次维修保养里程',
add
  column `car_ga_indate`  int(11) unsigned NOT NULL  DEFAULT '0'  COMMENT '冷藏车 冷机验证有效期',
add
  column `car_min_ga_indate`  int(11) unsigned NOT NULL  DEFAULT '0'  COMMENT '易流验证有效期',
add
  column `car_term_start_time`  int(11) unsigned NOT NULL  DEFAULT '0'  COMMENT '保险上次购买日期';

//车辆提醒消息推送 消息模板
define('CAR_REMIND_MESSAGE_ID','190');
//车辆提醒消息推送群
define('CAR_REMIND_MESSAGE_CARKEY','1178ecf7-42fa-4900-9504-b34dffe5f53f');


车辆提醒 企业微信推送 每天早上8:00
{tms_admin}timing-push/car-remind-send



车辆提醒 企业微信推送 exel 每天早上 8:01
{tms_admin}timing-push/car-remind-exel-send


车辆提醒 维护需要提醒的数据 每天 00:00:10 执行一次
{tms_admin}timing-push/car-remind-data



 alter table tms_car_info modify column `hundred_fuel` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '官方百公里油耗',
 modify column `refrigerator_hour_fuel` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '冷机官方小时油耗';




车辆管理 车辆维修 对接北森
feature_15902_csl_20231016 tms_admin
feature_15902_csl_20231016 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15902 已上线

alter table
  car_repair
add
  column `unique_number` varchar(100) NOT NULL DEFAULT '' COMMENT '泛微ecology关联编号',
add
  column `cr_md` varchar(100) NOT NULL DEFAULT '' COMMENT '泛微ecology数据md5',
add
  column `cr_url` text COMMENT '泛微上传的图片';



温度数据邮件推送调整
feature_15932_csl_20231018 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15932 已上线




面单打印调整
feature_15935_csl_20231018 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15935  已上线



车辆油耗 冷机的油耗 改成小数点后2位
feature_15976_csl_20231020 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15976 已上线


车辆提醒企业微信通知
feature_15978_csl_20231020  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=15978  已上线


计划箱型推荐 接口更换
feature_16059_csl_20131025 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16059 已上线



代签收人员选择配置
feature_16053_csl_20131025 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16053  已上线



CREATE TABLE `tms_sign_customer` (
  `tsc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sign_customer_name` varchar(255) NOT NULL DEFAULT ''  COMMENT '待签收客户',
  `usernames` text COMMENT '人员名称',
  `tsc_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tsc_id`)
) COMMENT='代签收客户表';




// CREATE TABLE `tms_sign_customer_user` (
//   `tscu_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
//   `tsc_id` int(11) NOT NULL  DEFAULT '0'  COMMENT '代签收客户表id',
//   `username` varchar(25) NOT NULL DEFAULT '' COMMENT '人员名称',
//   `tscu_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
//   `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
//   `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
//   `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
//   PRIMARY KEY (`tscu_id`),
//   KEY `idx_ur_uid` (`ur_uid`),
//   KEY `idx_tsc_id` (`tsc_id`)
// ) COMMENT='代签收客户人员配置表';




易流推送优化
feature_16077_csl_20231026 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16077  已上线


鼎为推送优化
feature_16096_csl_20231027   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16096  未上线

消息主题（鼎为温度预警推送）
tms.temperature.abnormal_push

//鼎为消息推送 委托客户是 方案培训测试 企业微信群
define('DINGWEI_FAPXTS_ROOBKEY','9d55f255-8d4c-4dee-9b5e-0a41171bd19d');

//鼎为消息推送 订单类型是验证订单 企业微信群
define('DINGWEI_CATEGORY_YZDD_ROOBKEY','ecf307fb-e215-472d-a4bb-41482d3eb67c');

62991828


项目配置复制脚本
feature_16120_csl_20231030  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16120 未上线

history-data/project-data
23533  23480

车辆管理统计优化
feature_16133_csl_20231031 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16133  已上线



车辆管理4.2：车辆详情，行车记录添加和修改

feature_16163_csl_20231101 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=16163 已上线



车辆维修 新增类型同步
feature_16179_csl_20231101 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16179  已上线





车辆配置
feature_16176_zzp_231101 tms_admin

ALTER table tms_city_config add COLUMN cold_storage_state tinyint(4)  not null  DEFAULT '0' COMMENT '是否有冷库 1有 0没有';

{
    "warehouse_worksheet_switch": {
        "on": 1,
        "off": 0,
        "span": " ",
        "label": "仓库工作单配置"
    },
    "cold_storage_state": {
        "on": 1,
        "off": 0,
        "span": " ",
        "label": "是否有冷库"
    }
}





出差单管理新增同步字段到北森
feature_16325_csl_20231108 tms_admin
feature_16325_csl_20231108 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16325 未上线

                if($tms_travel->trip_type != $trip_type && isset($message['BusinessVehicleText']) && trim($message['BusinessVehicleText'])!=''){




城市配置新增 可以购买干冰

ALTER table tms_city_config add COLUMN buy_drikold_state tinyint(4)  not null  DEFAULT '0' COMMENT '可以购买干冰 1是 0否';

{
    "warehouse_worksheet_switch": {
        "on": 1,
        "off": 0,
        "span": " ",
        "label": "仓库工作单配置"
    },
    "cold_storage_state": {
        "on": 1,
        "off": 0,
        "span": " ",
        "label": "有冷库"
    },
    "buy_drikold_state": {
        "on": 1,
        "off": 0,
        "span": " ",
        "label": "可以购买干冰"
    }
}






//历史供应商主体 同步大数据
php yii history-data/supplier-main-data





仓库工作单方案准备优化调整
feature_16411_csl_20231113   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16411  已上线



63401075
INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102002', 2740140, 0, '系统申请', 0, 'IT协助修改数据 审批单号：ITS202311150001 取件时间更正为2023-11-11 19:17', 1700030976, 1, 0);

update order_logistics set ol_pickup_time = 1699701420 where to_id=2740140;
update oms_logistics set ol_pickup_time = 1699701420 where to_id=2740140;





订单详情路由修改 同步 调度变更申请状态  
feature_16502_csl_20231116  tms_admin
feature_16502_csl_20231116  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16502  已上线

tms.order.route.change

TmsFahuochangeApply




订单取消生成耗材监控数据

feature_16531_csl_20231117 tms_admin

https://project.ashsh.com.cn/index.php?m=task&f=view&id=16531  已上线


车辆保险新增中国大地财产保险、中银保险
feature_16537_csl_20231117 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16537  已上线


冷藏车监控优化
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16571 已上线



外协超远距离结算记录
feature_16382_csl_20231120 tms_admin
feature_16382_csl_20231110 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16382  已上线

tms.order.send

ALTER table charge add COLUMN `pickup_distance` varchar(100) not null DEFAULT '' COMMENT '取件公里数',
add COLUMN `delivery_distance` varchar(100) not null  DEFAULT '' COMMENT '派件公里数';

80081871



车辆冷机保养新增限制
feature_16595_csl_20231121  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16595  已上线



国际订单绑定保温箱有效期验证
feature_16573_csl_20231127 tms_admin
feature_16573_csl_20231122 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16573  未上线




正常订单，半程专人专车标记和结算
feature_16608_csl_20231122  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&id=16608  已上线
 
INSERT INTO `tag` (`tag_id`, `tag_name`, `tag_type`, `tag_visible`, `tag_createtime`) VALUES (77, '专人取件', 1, 1, 0);
INSERT INTO `tag` (`tag_id`, `tag_name`, `tag_type`, `tag_visible`, `tag_createtime`) VALUES (78, '专人派件', 1, 1, 0);
INSERT INTO `tag` (`tag_id`, `tag_name`, `tag_type`, `tag_visible`, `tag_createtime`) VALUES (79, '专车取件', 1, 1, 0);
INSERT INTO `tag` (`tag_id`, `tag_name`, `tag_type`, `tag_visible`, `tag_createtime`) VALUES (80, '专车派件', 1, 1, 0);




车辆管理v4.2：车辆维修保养字段调整
feature_16609_csl_20231122    tms_admin
feature_16609_csl_20231122    tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16609  已上线

ALTER  TABLE  `tms_mileage_declare`  ADD  INDEX idx_created_time (  `created_time`  );

ALTER table car_repair add COLUMN `create_name` varchar(30) NOT NULL DEFAULT '' COMMENT '创建人名称',
add COLUMN `create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人uid',
add COLUMN `upkeep_project`  varchar(30) NOT NULL DEFAULT ''  COMMENT '保养项目 0、机油 1、机油滤清器 2、柴油滤洁器 3、空气滤清器 4、其他';

