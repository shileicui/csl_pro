<?






221026

UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 20120083;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 20120119;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 20120717;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 20120796;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201206985;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201207063;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201207242;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201207300;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201207338;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201208064;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201208073;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201600375;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201600917;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201601314;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900109;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900290;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900337;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900561;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900751;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201900879;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 201901042;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000111;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000141;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000255;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000283;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202000470;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202001191;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202001266;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100068;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100308;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100513;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100531;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202100551;
UPDATE tms_customer_config SET cu_send_message = 0 WHERE cu_id = 202102127;



(cu_piece_feedback = 1
OR cu_temperature_feedback = 1
OR cu_temperature_type = 1
OR cu_tengsen_trmperature = 1
OR cu_sign_feedback = 1
OR cu_goods_print = 1
OR cu_send_message = 0
OR cu_print_express_remark = 1)



SELECT count(*) from customer WHERE cu_piece_feedback = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_temperature_feedback = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_temperature_type = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_tengsen_trmperature = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_sign_feedback = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_goods_print = 1 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_send_message = 0 and cu_visible=1;

SELECT count(*) from customer WHERE  cu_print_express_remark = 1 and cu_visible=1;


SELECT count(*) from tms_customer_config WHERE cu_piece_feedback = 1;

SELECT count(*) from tms_customer_config WHERE  cu_temperature_feedback = 1;

SELECT count(*) from tms_customer_config WHERE  cu_temperature_type = 1;

SELECT count(*) from tms_customer_config WHERE  cu_tengsen_trmperature = 1;

SELECT count(*) from tms_customer_config WHERE  cu_sign_feedback = 1;

SELECT count(*) from tms_customer_config WHERE  cu_goods_print = 1;

SELECT count(*) from tms_customer_config WHERE  cu_send_message = 0;

SELECT count(*) from tms_customer_config WHERE  cu_print_express_remark = 1;








SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id where tcc.cu_piece_feedback != 1 and c.cu_piece_feedback = 1 and c.cu_visible=1;

SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id where tcc.cu_temperature_feedback != 1 and  c.cu_temperature_feedback = 1 and c.cu_visible=1;

SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id where tcc.cu_temperature_type != 1 and  c.cu_temperature_type = 1 and c.cu_visible=1;

SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id where tcc.cu_sign_feedback != 1 and  c.cu_sign_feedback = 1 and c.cu_visible=1;





SELECT c.* FROM customer as c LEFT JOIN tms_customer_config as tcc ON c.cu_id = tcc.cu_id tcc.cu_piece_feedback != 1 and c.cu_piece_feedback = 1 AND c.cu_visible = 1; 



CREATE TABLE `order_worksheet` (
  `ow_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作单表id 自增', `to_id` int(10) NOT NULL COMMENT '订单id',
  `region_name` char(32) NOT NULL COMMENT '城市名称',
  `ow_type` int(2) NOT NULL COMMENT '操作类型 1 取件 2 发货 3 派件 4 提货并派件 5 提货并发货',
  `ow_adderss` varchar(255) NOT NULL COMMENT '工作单地址',
  `ow_remark` varchar(1024) DEFAULT NULL COMMENT '工作单备注',
  `ow_lastup_uid` int(10) DEFAULT NULL COMMENT '最后更新人',
  `ow_lastup_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `op_uid` varchar(50) DEFAULT NULL COMMENT '操作员id',
  `dr_uid` int(10) DEFAULT NULL COMMENT '主管uid',
  `region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '工作单城市',
  `ow_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '工作单状态 1 已完成 2待执行',
  `ow_date` date DEFAULT NULL COMMENT '工作单日期',
  `ow_create_uid` int(10) DEFAULT NULL COMMENT '创建人id',
  `ow_create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `ow_create_username` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `transfer_region_name` varchar(100) DEFAULT NULL COMMENT '中转城市名',
  `transfer_region_id` int(10) DEFAULT NULL COMMENT '中转城市id',
  `child_region_id` int(10) DEFAULT NULL COMMENT '地区id',
  `child_region_name` varchar(255) DEFAULT NULL COMMENT '地区名称',
  `ow_tobeconfirmed` int(10) NOT NULL DEFAULT '0' COMMENT '0：已确认 1:待确认',
  `di_id` int(11) DEFAULT NULL COMMENT '调度id',
  `ow_cbox` int(2) NOT NULL DEFAULT '1' COMMENT '提发工作单是否换箱 1未换，2已换',
  `ow_print` int(2) NOT NULL DEFAULT '0' COMMENT '0未打印，1 已打印',
  `ow_tops_id` int(11) DEFAULT NULL COMMENT '站点id',
  `ow_tops_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `ow_cart_pd` int(4) DEFAULT '0' COMMENT 'cart备案判断 0普通  1.取件类型 2取派类型',
  `ow_night_work` tinyint(1) DEFAULT '0' COMMENT '是否为夜班工作单',
  `ow_recheck` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否复核 0未复核，1已复核',
  `ow_cart_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,普通订单 1.单采单人同城 2.单采单人非同城  3.单采专车 4.回输专人非同城 5.回输专车',
  `owr_no` varchar(20) NOT NULL DEFAULT '' COMMENT '工作单排线编号',
  `next_op_uid` varchar(100) NOT NULL DEFAULT '' COMMENT '联动指派人',
  `fulfil_task_username` varchar(100) NOT NULL DEFAULT '' COMMENT '完成任务人',
  `route_text` varchar(70) DEFAULT '' COMMENT '调度路由',
  `route_station` varchar(30) DEFAULT '' COMMENT '调度路由站点',
  `di_remark` varchar(200) DEFAULT '' COMMENT '调度备注',
  `ow_pid` int(11) DEFAULT NULL COMMENT '父级工作单id',
  PRIMARY KEY (`ow_id`),
  KEY `to_id` (`to_id`),
  KEY `region_id` (`region_id`),
  KEY `ow_type` (`ow_type`),
  KEY `ow_status` (`ow_status`),
  KEY `op_uid` (`op_uid`),
  KEY `ow_date` (`ow_date`),
  KEY `ow_lastup_time` (`ow_lastup_time`),
  KEY `idx_create_uid` (`ow_create_uid`),
  KEY `idx_create_time` (`ow_create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=494213 DEFAULT CHARSET=utf8 COMMENT='订单工作单表';



CREATE TABLE `transport_order` (
  `to_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单序号',
  `to_no` char(32) DEFAULT '' COMMENT '纸质运单编号',
  `to_customer_no` char(128) DEFAULT '' COMMENT '客户单号，客户内部单号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '委托客户序号',
  `cu_no` char(32) DEFAULT NULL COMMENT '委托客户编号',
  `co_id` int(11) unsigned DEFAULT NULL COMMENT '委托人序号',
  `cp_id` int(11) unsigned DEFAULT NULL COMMENT '项目序号',
  `cp_no` char(128) DEFAULT NULL COMMENT '项目编号',
  `to_taketime` int(11) unsigned DEFAULT '0' COMMENT '接单时间',
  `to_type` tinyint(4) unsigned DEFAULT '0' COMMENT '订单类型，0标准运输，1耗材调拨 ，2山东齐鲁订单',
  `to_goodstype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '货物类型（1=血样，2=样本，3=药品）',
  `to_important` tinyint(4) unsigned DEFAULT '0' COMMENT '重要程序，0普通，1重要',
  `to_timelimit` tinyint(4) unsigned DEFAULT '0' COMMENT '运送时限，0：12小时，1：24小时，2：36小时，3：48小时，4：72小时',
  `to_temperature` tinyint(4) unsigned DEFAULT '0' COMMENT '运输温度，1 CW0-30，2 HW15-25，3 HW18-30，4 LB2-8，5 GB-20，6 YD-150',
  `to_temperature_name` varchar(30) DEFAULT NULL COMMENT '运输温度记录',
  `to_thermometer` tinyint(4) unsigned DEFAULT '0' COMMENT '温度计，1无温度计，2生生温度计，3客户温度计，4客户和生生温度计',
  `to_hygrometer` tinyint(4) DEFAULT '0' COMMENT '湿度计，1无湿度计，2生生湿度计，3客户湿度计，4客户和生生湿度计',
  `to_insure` tinyint(4) unsigned DEFAULT '0' COMMENT '是否投保，0否，1是',
  `to_insure_value` decimal(20,2) DEFAULT '0.00' COMMENT '声明价值',
  `to_getcash` tinyint(4) unsigned DEFAULT '0' COMMENT '付款方式，0月结，1发货方现金，2收货方现金',
  `to_invoice` tinyint(4) unsigned DEFAULT '0' COMMENT '是否开票，0否，1是',
  `to_assign_uid` int(11) unsigned DEFAULT '0' COMMENT '指派给用户序号',
  `to_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发件所在地区ID',
  `start_region_name` char(128) DEFAULT NULL COMMENT '发件地区名',
  `start_cu_id` int(11) DEFAULT NULL,
  `start_cu_name` varchar(400) DEFAULT NULL COMMENT '发件客户',
  `start_co_name` varchar(300) DEFAULT NULL COMMENT '发件客户',
  `start_mobile_phone` varchar(180) DEFAULT NULL COMMENT '发件联系手机',
  `start_address` varchar(800) DEFAULT NULL COMMENT '发件联系地址',
  `start_itude` varchar(255) DEFAULT NULL COMMENT '收件地址经纬度',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '收件所在地区ID',
  `stop_region_name` char(128) DEFAULT NULL COMMENT '收件地区名',
  `stop_cu_id` int(11) DEFAULT NULL,
  `stop_cu_name` varchar(400) DEFAULT NULL COMMENT '收件客户',
  `stop_co_name` varchar(300) DEFAULT NULL COMMENT '收件联系人',
  `stop_mobile_phone` varchar(180) DEFAULT NULL COMMENT '收件联系手机',
  `stop_address` varchar(800) DEFAULT NULL COMMENT '收件联系地址',
  `stop_itude` varchar(255) DEFAULT NULL COMMENT '收件地址经纬度',
  `to_status` tinyint(4) unsigned DEFAULT '0' COMMENT '运输单状态 0新建 1已审核 2已取件 3已发货 4已提货 5已派件 6已反馈 7已取消 8已关闭 9 删除',
  `to_performance_status` char(4) DEFAULT '0000' COMMENT '绩效状态，0000异常投诉索赔奖励',
  `to_settlement_status` tinyint(4) unsigned DEFAULT '0' COMMENT '结算状态，0未结算，1已结算',
  `to_invoice_status` tinyint(4) unsigned DEFAULT '0' COMMENT '开票状态，0未开票，1已开票',
  `to_goods_status` tinyint(4) unsigned DEFAULT '0' COMMENT '货物状态，0货物完好，1货物破损，2货物丢失，3货物超温，4货物延时',
  `to_outbox_status` tinyint(4) unsigned DEFAULT '0' COMMENT '取件结存状态，0未结存，1已结存',
  `to_inbox_status` tinyint(4) unsigned DEFAULT '0' COMMENT '派件结存状态，0未结存，1已结存',
  `to_sign_status` tinyint(4) unsigned DEFAULT '0' COMMENT '签收单据附件状态，0未上传，1已上传',
  `to_temprecord_status` tinyint(4) unsigned DEFAULT '0' COMMENT '温度数据附件状态，0未上传，1已上传',
  `to_email` text COMMENT '联系邮箱',
  `to_remark` longtext COMMENT '客户备注',
  `to_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `to_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `to_closetime` int(10) unsigned DEFAULT '0' COMMENT '结案时间',
  `to_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `to_outbox_out_no` char(32) DEFAULT '' COMMENT '取件结存出库单号',
  `to_outbox_in_no` char(32) DEFAULT '' COMMENT '取件结存入库单号',
  `to_inbox_out_no` char(32) DEFAULT '' COMMENT '派件结存出库单号',
  `to_inbox_in_no` char(32) DEFAULT '' COMMENT '派件结存入库单号',
  `to_nocheck` tinyint(4) unsigned DEFAULT '0' COMMENT '是否不需要审核 1-是 0-否',
  `to_fileurl` varchar(255) DEFAULT NULL COMMENT '太美api附件链接',
  `to_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源',
  `changebox` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否完成换箱',
  `to_site_id` int(11) DEFAULT NULL COMMENT '科文斯项目siteId',
  `to_check_status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '客户审核状态（0=未审核，1=一审，2=二审，5=终审）',
  `to_template` tinyint(1) NOT NULL DEFAULT '1' COMMENT '济南脐血库消息推送状态 0-未推送 1-已推送',
  `to_tags` varchar(150) DEFAULT NULL COMMENT '订单标签',
  `cp_tags` varchar(150) DEFAULT NULL COMMENT '项目标签',
  `to_receipt` int(1) unsigned DEFAULT NULL COMMENT '签收类型: 1-本人签收，2-他人代收',
  `to_trequirement` int(1) DEFAULT '0' COMMENT '运输要求 0正常 2专人 3专车',
  `to_temporary` tinyint(1) DEFAULT '0' COMMENT '暂存货类型 0 未暂存  1 已暂存',
  `to_aging_remark` varchar(1024) DEFAULT NULL COMMENT '时效备注',
  `child_start_region_id` int(11) DEFAULT NULL COMMENT '出发城市子级id',
  `child_start_region_name` varchar(255) DEFAULT NULL COMMENT '出发城市子级名称',
  `child_stop_region_id` int(11) DEFAULT NULL COMMENT '到达城市子级id',
  `child_stop_region_name` varchar(255) DEFAULT NULL COMMENT '到达城市子级名称',
  `to_gatt_status` int(4) DEFAULT '0' COMMENT '校准证书状态',
  `oinvennum` varchar(25) DEFAULT NULL COMMENT '暂存编号',
  `to_hygrometer_range` varchar(255) DEFAULT NULL COMMENT '湿度区间',
  `contact_name` varchar(30) DEFAULT NULL COMMENT '委托人姓名',
  `contact_tel` varchar(30) DEFAULT NULL COMMENT '委托人手机号',
  `to_pid` int(11) DEFAULT NULL COMMENT '主单id',
  `to_attributes` int(4) NOT NULL DEFAULT '1' COMMENT '1.普通订单 2.主单 3.子单',
  `to_category` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1正常订单，2仓库发药',
  `colorcar_true` int(2) DEFAULT '0' COMMENT '是否冷藏车派送 0否 1是',
  `to_kpi` tinyint(1) DEFAULT '1' COMMENT 'KPI 1是 2否',
  `to_review_status` int(4) NOT NULL COMMENT '订单复核 1.未复核 2.已复核',
  `to_abnormal_charge_type` tinyint(1) DEFAULT '1' COMMENT '异常收费 1 无异常收费 2 异常收费',
  `bi_id` int(10) unsigned DEFAULT NULL COMMENT '开票客户id',
  `bi_name` varchar(100) DEFAULT NULL COMMENT '开票客户抬头',
  `to_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `to_identify` int(4) DEFAULT '0' COMMENT '0普通订单 1臻和合单 2泰琨合单 3九州通合单',
  `transport_type` tinyint(3) unsigned DEFAULT '0' COMMENT '运输类型 0=常规运输  1=临床发运 2=营销样品  3=其他',
  `cod_amount` decimal(20,2) DEFAULT NULL COMMENT '到付金额',
  `cod_way` tinyint(1) DEFAULT NULL COMMENT '到付方式',
  `outsource` int(11) DEFAULT '3' COMMENT '迈迪朗杰外包类型  全外包   4\n取发外包 5\n提派外包 6\n发提派外包 7',
  `to_is_lable` int(1) DEFAULT '1',
  `to_nucleic_acid` tinyint(2) DEFAULT '0' COMMENT '核酸服务 0无需检测，1 人员核酸，2外包装核酸，3药品核酸，4人员抗体检测',
  `order_check_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '订单审核状态 1待审核 2审核通过',
  `to_business_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0正常订单 2仓库发药',
  `to_the_num` tinyint(4) NOT NULL DEFAULT '1' COMMENT '温度计数量',
  PRIMARY KEY (`to_id`),
  KEY `to_no` (`to_no`),
  KEY `to_assign_uid` (`to_assign_uid`),
  KEY `to_create_uid` (`to_create_uid`),
  KEY `to_customer_no` (`to_customer_no`),
  KEY `start_region_id` (`start_region_id`),
  KEY `stop_region_id` (`stop_region_id`),
  KEY `to_status` (`to_status`),
  KEY `to_type` (`to_type`),
  KEY `to_temperature` (`to_temperature`),
  KEY `cu_id` (`cu_id`),
  KEY `index_to_pid` (`to_pid`),
  KEY `cp_id_index` (`cp_id`),
  KEY `to_auto_lastupdtime` (`to_auto_lastupdtime`),
  KEY `idx_nuc_acid` (`to_nucleic_acid`)
) ENGINE=InnoDB AUTO_INCREMENT=1683016 DEFAULT CHARSET=utf8 COMMENT='运输订单表';


221027


 'tcp_route_sort', 'tcp_out_region_name', 'tcp_out_region_id', 'tcp_in_region_name', 'tcp_in_region_id', 'tcp_operation_name', 'tcp_operation_id', 'tcp_tagid', 'tcp_sortid', 'created_at', 'updated_at', 'deleted_at'

CREATE TABLE `tms_cart_plan` (
  `tcp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tcp_to_id` int(11) NOT NULL COMMENT '关联订单信息',
  `tcp_type` int(4) NOT NULL COMMENT '类型 1.专车 2.专人同城 3.专人非同城 去往  4.专人非同城发货',
  `tcp_travel_model` int(4) NOT NULL COMMENT '出行方式 1.生生车辆 2.外租车 3.铁路 4.航空 5.公路',
  `tcp_travel_message` varchar(100) NOT NULL COMMENT '车牌号或航班号或车次',
  `tcp_travel_starttime` int(11) DEFAULT NULL COMMENT '出发时间',
  `tcp_travel_stoptime` int(11) DEFAULT NULL COMMENT '到达时间',
  `tcp_route_sort` int(11) NOT NULL DEFAULT '0' COMMENT '0去取件城市 其他为中转',
  `tcp_out_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '出发城市名称',
  `tcp_out_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '出发城市id',
  `tcp_in_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '到达城市名称',
  `tcp_in_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '到达城市id',
  `tcp_operation_name` varchar(11) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `tcp_operation_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `tcp_tagid` int(11) NOT NULL DEFAULT '0' COMMENT '标识id',
  `tcp_sortid` int(11) NOT NULL DEFAULT '0' COMMENT '排序id',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tcp_id`),
  KEY `tcp_to_id` (`tcp_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COMMENT='cart订单车辆安排';


array (
  'out_region_name' => '出发城市',
  'out_region_id' => '出发城市',
  'in_region_name' => '到达城市',
  'in_region_id' => '到达城市',
  'tcp_travel_model' => '路由类型',
  'tcp_travel_message' => '车次',
  'tcp_travel_starttime' => '出发时间',
  'tcp_travel_stoptime' => '到达时间',
  'tcp_work_time' => '实际工作时间',
  'tcp_operation_name' => '操作人',
  'tcp_operation_id' => '操作人'
)



 $info_arr = array (
            'out_region_name' => '出发城市',
            'out_region_id' => '出发城市',
            'in_region_name' => '到达城市',
            'in_region_id' => '到达城市',
            'tcp_travel_model' => '路由类型',
            'tcp_travel_message' => '车次',
            'tcp_travel_starttime' => '出发时间',
            'tcp_travel_stoptime' => '到达时间',
            'tcp_work_time' => '实际工作时间',
            'tcp_operation_name' => '操作人',
            'tcp_operation_id' => '操作人'
        );

[
'out_region_name' =>'',
'out_region_id' =>'',
'in_region_name' =>'',
'in_region_id' =>'',
'tcp_travel_model' =>'',
'tcp_travel_message' =>'',
'tcp_travel_starttime' =>'',
'tcp_travel_stoptime' =>'',
'tcp_work_time' =>'',
'tcp_operation_name' =>'',
'tcp_operation_id' =>'',
]


$update_obj->tcp_travel_model = 
$update_obj->tcp_travel_message = 
$update_obj->tcp_travel_starttime = 
$update_obj->tcp_travel_stoptime = 
$update_obj->tcp_route_sort = 
$update_obj->tcp_out_region_name = 
$update_obj->tcp_out_region_id = 
$update_obj->tcp_in_region_name = 
$update_obj->tcp_in_region_id = 
$update_obj->tcp_operation_name = 
$update_obj->tcp_operation_id = 


$post['tcp_travel_model'.$tag_id],
                $post['tcp_travel_message'.$tag_id],
                strtotime($post['tcp_travel_starttime'.$tag_id]),
                strtotime($post['tcp_travel_stoptime'.$tag_id]),
                $key,
                $post['tcp_out_region_name'.$tag_id],
                $post['tcp_out_region_id'.$tag_id],
                $post['tcp_in_region_name'.$tag_id],
                $post['tcp_in_region_id'.$tag_id],
                $post['tcp_operation_name'.$tag_id],
                $post['tcp_operation_id'.$tag_id],


$update_obj->tcp_travel_model = $post['tcp_travel_model'.$tag_id];
$update_obj->tcp_travel_message = $post['tcp_travel_message'.$tag_id];
$update_obj->tcp_travel_starttime = strtotime($post['tcp_travel_starttime'.$tag_id]);
$update_obj->tcp_travel_stoptime = strtotime($post['tcp_travel_stoptime'.$tag_id]);
$update_obj->tcp_route_sort = $key;
$update_obj->tcp_out_region_name = $post['tcp_out_region_name'.$tag_id];
$update_obj->tcp_out_region_id = $post['tcp_out_region_id'.$tag_id];
$update_obj->tcp_in_region_name = $post['tcp_in_region_name'.$tag_id];
$update_obj->tcp_in_region_id = $post['tcp_in_region_id'.$tag_id];
$update_obj->tcp_operation_name = $post['tcp_operation_name'.$tag_id];
$update_obj->tcp_operation_id = $post['tcp_operation_id'.$tag_id];




<tr class="tr" val="0">
            <td val="0">0</td>
            <td>去取件城市</td>
            <td>
                <div class="controls" id="tcp_out_region_namelect" >
                    <input type="text" style="width: 90px" class="control-text" id="tcp_out_region_name<?php echo $value['tcp_tagid']?:0;?>" name="tcp_out_region_name<?php echo $value['tcp_tagid']?:0;?>" value='<?php echo $value['tcp_out_region_name']?:$order['start_region_name'];?>'/>
                </div>

                <input type="hidden" name="tcp_out_region_id<?php echo $value['tcp_tagid']?:0;?>" id="tcp_out_region_id<?php echo $value['tcp_tagid']?:0;?>" value='<?php echo $value['tcp_out_region_id']?:$order['start_region_id'];?>'  placeholder='点击选择'/>
            </td>
            <td>
                <div class="controls" id="tcp_in_region_namelect" >
                    <input type="text" onchange="updatecity(this)" style="width: 90px"   class="control-text" id="tcp_in_region_name<?php echo $value['tcp_tagid']?:0;?>" name="tcp_in_region_name<?php echo $value['tcp_tagid']?:0;?>" value='<?php echo $value['tcp_in_region_name']?:$order['stop_region_name'];?>'/>
                </div>
                <input type="hidden" name="tcp_in_region_id<?php echo $value['tcp_tagid']?:0;?>" id="tcp_in_region_id<?php echo $value['tcp_tagid']?:0;?>" value='<?php echo $value['tcp_in_region_id']?:$order['stop_region_id'];?>'/>
            </td>
            <td><div class="controls">
                    <select name="tcp_travel_model<?php echo $value['tcp_tagid']?:0;?>" id="tcp_travel_model" class="search-input span3 span-width">
                        <option value=''>请选择</option>
                        <?php foreach ($tcp_travel_arr as $k => $v): ?>
                            <option value="<?php echo $k; ?>" <?php echo $k == $value['tcp_travel_model']?'selected':'';?> ><?php echo $v; ?></option>
                        <?php endforeach ?>


                    </select>
                </div>
            </td>
            <td>
                <input type="text"  style="width: 90px"   class="control-text" id="tcp_travel_message<?php echo $value['tcp_tagid']?:0;?>" name="tcp_travel_message<?php echo $value['tcp_tagid']?:0;?>" value='<?php echo $value['tcp_travel_message'];?>'/>

            </td>
            <td>
                <input type="text"  style="width: 128px"  class="form-control bot-ipt bot-time-ipt calendar" value="<?php echo date('Y-m-d H:i:s',$value['tcp_travel_starttime']);?>" name="tcp_travel_starttime<?php echo $value['tcp_tagid']?:0;?>" id="tcp_travel_starttime<?php echo $value['tcp_tagid']?:0;?>" autocomplete="off">
            </td>
            <td>
                <input type="text"  style="width: 128px"  class="form-control bot-ipt bot-time-ipt calendar" value="<?php echo date('Y-m-d H:i:s',$value['tcp_travel_stoptime']);?>"  name="tcp_travel_stoptime<?php echo $value['tcp_tagid']?:0;?>" id="tcp_travel_stoptime<?php echo $value['tcp_tagid']?:0;?>" autocomplete="off">
            </td>

            <td>
                <div class="controls"  >
                    <input type="text"  style="width: 90px"  class="control-text" id="tcp_operation_name<?php echo $value['tcp_tagid']?:0;?>" name="tcp_operation_name<?php echo $value['tcp_tagid']?:0;?>" value='<?php echo $value['tcp_operation_name'];?>'/>
                </div>
                <input type="hidden" name="tcp_operation_id<?php echo $value['tcp_tagid']?:0;?>" id="tcp_operation_id<?php echo $value['tcp_tagid']?:0;?>" value='<?php echo $value['tcp_operation_id'];?>'/>
            </td>
            <td>
                <a href="javascript:;" onclick="addtr(this)">添加</a>
            </td>

        </tr>






 'tcc_id', 'tcc_name', 'tcop_type', 'to_id', 'tcc_sort', 'tcop_sort',


'到达中转城市',
'货物交接',
'到达中转车站',
'乘车',
'中转城市出发',

1.单采单人同城 2.单采单人非同城  3.单采专车 4.回输专人非同城 5.回输专车
[
	1=>[
		1 => '安排工作指令',
		2 => '购买车票',
		3 => '到达取件单位',
		4 => '取件',
		5 => '离开取件单位',
		6 => '到达发货站点',
		7 => '乘车',
		8 => '车辆出发',
		9 => '到达派件城市',
		10 => '去往派件单位',
		11 => '到达派件单位',
		12 => '签收',
		13 => '离开派件单位',

	]
	2=>[
		1 =>'安排工作指令',
		2 =>'购买车票',
		3 =>'到达车站',
		4 =>'乘车',
		5 =>'车辆出发',
		6 =>'到达取件城市',
		7 =>'到达取件单位',
		8 =>'取件',
		9 =>'离开取件单位',
		10 =>'到达发货站点',
		11 =>'乘车',
		12 =>'车辆出发',

	    '到达中转城市',


		'货物交接',
		'到达中转车站',
		'乘车',
		'中转城市出发',
 		'到达中转城市',

		'货物交接',
		'到达中转车站',
		'乘车',
		'中转城市出发',
		13 =>'到达派件城市',

		'货物交接',
		14 =>'去往派件单位',
		15 =>'到达派件单位',
		16 =>'签收',
		17 =>'离开派件单位',



<!-- 		18=>'货物交接',
		20=>'到达中转车站',
		21=>'乘车',
		22=>'中转城市出发',
 		23=>'到达中转城市', -->
	],
	3=>[
		1 =>'安排工作指令',
		2 =>'领取车辆',
		3 =>'车辆出发',
		4 =>'到达取件单位',
		5 =>'取件',
		6 =>'离开取件单位',


		7 =>'车辆开往派件城市',
		8 =>'到达派件城市',
		9 =>'去往派件单位',
		10 =>'到达派件单位',
		11 =>'签收',
		12 =>'离开派件单位',
	],
	4=>[
		1 =>'安排工作指令',
		2 =>'购买车票',
		3 =>'到达车站',
		4 =>'乘车',
		5 =>'车辆出发',
		6 =>'到达取件城市',
		7 =>'到达取件单位',
		8 =>'取件',
		9 =>'到达康德乐',
		10 =>'离开康德乐',
		11 =>'到达发货站点',
		12 =>'乘车',
		13 =>'车辆出发',
        '到达中转城市',


		'货物交接',
		'到达中转车站',
		'乘车',
		'中转城市出发',
 		'到达中转城市',


		'货物交接',
		'到达中转车站',
		'乘车',
		'中转城市出发',
		14 =>'到达派件城市',


		'货物交接',
		15 =>'去往DTP药房',
		16 =>'到达DTP药房',
		17 =>'药房签收',
		18 =>'离开DTP药房',
		19 =>'到达DTP药房',
		20 =>'交接完毕',
		21 =>'离开DTP药房',
		22 =>'到达中心',
		23 =>'签收',
		24 =>'离开中心',
	],
	5=>[
		1 => '安排工作指令',
		2 => '领取车辆',
		3 => '车辆出发',
		4 => '到达取件单位',
		5 => '取件',
		6 => '到达康德乐',
		7 => '离开康德乐',
		8 => '车辆开往派件城市',
		9 => '到达派件城市',
		10 => '去往DTP药房',
		11 => '到达DTP药房',
		12 => '药房签收',
		13 => '离开DTP药房',
		14 => '到达DTP药房',
		15 => '交接完毕',
		16 => '离开DTP药房',
		17 => '到达中心',
		18 => '签收',
		19 => '离开中心',
	]
]


[
	1=>[
		1 => '安排工作指令',2 => '购买车票',3 => '到达取件单位',4 => '取件',5 => '离开取件单位',6 => '到达发货站点',7 => '乘车',8 => '车辆出发',9 => '到达派件城市',10 => '去往派件单位',11 => '到达派件单位',12 => '签收',13 => '离开派件单位',]
	2=>[
		1 =>'安排工作指令',2 =>'购买车票',3 =>'到达车站',4 =>'乘车',5 =>'车辆出发',6 =>'到达取件城市',7 =>'到达取件单位',8 =>'取件',9 =>'离开取件单位',10 =>'到达发货站点',11 =>'乘车',12 =>'车辆出发',13 =>'到达派件城市',14 =>'去往派件单位',15 =>'到达派件单位',16 =>'签收',17 =>'离开派件单位',],
	3=>[
		1 =>'安排工作指令',2 =>'领取车辆',3 =>'车辆出发',4 =>'到达取件单位',5 =>'取件',6 =>'离开取件单位',7 =>'车辆开往派件城市',8 =>'到达派件城市',9 =>'去往派件单位',10 =>'到达派件单位',11 =>'签收',12 =>'离开派件单位',],
	4=>[
		1 =>'安排工作指令',2 =>'购买车票',3 =>'到达车站',4 =>'乘车',5 =>'车辆出发',6 =>'到达取件城市',7 =>'到达取件单位',8 =>'取件',9 =>'到达康德乐',10 =>'离开康德乐',11 =>'到达发货站点',12 =>'乘车',13 =>'车辆出发',14 =>'到达派件城市',15 =>'去往DTP药房',16 =>'到达DTP药房',17 =>'药房签收',18 =>'离开DTP药房',19 =>'到达DTP药房',20 =>'交接完毕',21 =>'离开DTP药房',22 =>'到达中心',23 =>'签收',24 =>'离开中心',],
	5=>[
		1 => '安排工作指令',2 => '领取车辆',3 => '车辆出发',4 => '到达取件单位',5 => '取件',6 => '到达康德乐',7 => '离开康德乐',8 => '车辆开往派件城市',9 => '到达派件城市',10 => '去往DTP药房',11 => '到达DTP药房',12 => '药房签收',13 => '离开DTP药房',14 => '到达DTP药房',15 => '交接完毕',16 => '离开DTP药房',17 => '到达中心',18 => '签收',19 => '离开中心',]
]












