<?


//修改车辆维保类型
update car_repair set cr_type=2,maintain_type=1 where cr_id=12172;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',12172, 0, '系统', 0, 'IT协助修改 将2024年11月30日沪DYT068的车辆维保类型由车辆维修更正为车辆保养  审批单号：ITSJ202412060002', 1733455466, 13, 0);



//修改维保里程
update car_repair set repair_mile=306564,repair_finish_mile=306564 where cr_id=12021;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',12021, 0, '系统', 0, 'IT协助修改  2024-11-19系统保养操作录入里程错误，需要修改。原来录入30806KM需要修改为306564KM  审批单号：   
ITSJ202412190003', 1734598396, 13, 0);


//修改冷机时长
update car set cumulative_duration=2366 where ca_id=739;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170001',540, 0, '系统', 0, 'IT协助修改 修改冷机时数3284 改为2366  审批单号：   
ITSJ202412190003', 1734598396, 13, 0);




            $tms_car_refrigerator->ca_id = $tms_car_repair_detail->tcrd_ca_id;
            $tms_car_refrigerator->car_number = $tms_car_repair_detail->tcrd_ca_number;
            //冷机品牌和型号
            $tms_car_refrigerator->refrigerator_name = $tms_car_repair_detail->tcrd_refrigerator_name;
            //冷机编号
            $tms_car_refrigerator->refrigerator_number = $tms_car_repair_detail->tcrd_refrigerator_number;
            //主副冷机
            $tms_car_refrigerator->tcr_status = $tms_car_repair_detail->tcr_status;
            //最新使用时数
            $tms_car_refrigerator->upkeep_hour = $tms_car_repair_detail->tcrd_hour ?: 0;
            $car_repair = CarRepair::find()->where(['cr_id' => $cr_id])->one();
            //维修保养日期
            $tms_car_refrigerator->upkeep_time = $car_repair->repair_finish_time;
            //维修保养项目
            $tms_car_refrigerator->upkeep_project = $tms_car_repair_detail->tcrd_project ?: '';




//主冷机修改为副冷机
update tms_car_repair_detail  set tcr_status=2,tcrd_hour=362,tcrd_project='更换机油、机滤、柴滤' where tcrd_cr_id =13162;


INSERT INTO tms_car_refrigerator ( upkeep_hour, upkeep_project, ca_id, car_number, refrigerator_name, refrigerator_number, tcr_status,upkeep_time )
VALUES
	( '362', '更换机油、机滤、柴滤', 739, '沪FJ9758', 'Carrier/SUPRA850+', '', 2,1739980800);

update tms_car_info  set vice_cumulative_duration=362 where ca_id =739;


INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',13162, 0, '系统', 0, 'IT协助修改  沪FJ9758车辆冷机保养2025-2-20本次保养主冷机保养系统修改为副冷机保养  审批单号：   
ITSJ202503040004', 1741227530, 13, 0);










cart订单修改取件时间

UPDATE tms_cart_operation_record SET tcor_time=1724563380 where tcor_id = 16154;

update order_logistics set ol_pickup_time=1724563380   where to_id=3220257;
update oms_logistics set ol_pickup_time=1724563380   where to_id=3220257;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102040', 3220257, 0, '系统申请', 0, ' 取件时间修改为2024-08-25 13:23 审批单号：ITSJ202408260003 ', 1724633519, 13, 0);



修改cart工作单指派人

update order_worksheet set op_uid=6601 where ow_id=16849216;
update order_worksheet set op_uid=6601 where ow_id=16849217;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102032',3468703, 0, '系统', 0, '更改取派件工作单操作人为时圣峰  审批单号： ', 1735785076, 13, 0);





update order_worksheet set op_uid=879 where ow_id=17391217;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102032',3551526, 0, '系统', 0, '派件工作单操作人为李鑫鑫  审批单号：ITSJ202502130004 ', 1739447162, 13, 0);



ITSJ202502130004


84932818 保单第一个上传错误，麻烦删除



38689116


//删除订单附件

update attachment set at_visible=0 where at_id=38689116;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102042',3484490, 0, '系统', 0, '删除附件：2025-01-09上海医药物流中心上海市上海交通大学医学院附到苏州市苏州药明巨诺生物科技-84932818others1736385865954068a534a2fb2.pdf  审批单号：ITSJ202501090001 ', 1735785076, 13, 0);


//cart 删除节点

update tms_cart_operation_plan set tcop_visible=2 where tcop_id=14327;

update tms_cart_operation_plan set tcop_visible=2 where tcop_id=14333;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102107',3484475, 0, '系统', 0, '删除 最后一个 离开DTP药房操作节点  审批单号：ITSJ202501100003 ', 1736494435, 13, 0);

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102107',3484482, 0, '系统', 0, '删除 最后一个 离开DTP药房操作节点  审批单号：ITSJ202501100003', 1736494435, 13, 0);




cart订单修改取件时间

UPDATE tms_cart_operation_record SET tcor_time=1737339120 where tcor_id = 20635;

update order_logistics set ol_pickup_time=1737339120   where to_id=3506556;
update oms_logistics set ol_pickup_time=1737339120   where to_id=3506556;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102040', 3506556, 0, '系统申请', 0, ' 取件时间修改为2025-01-20 10:12 审批单号：ITSJ202501200001 ', 1737341997, 13, 0);




删除25年1月份路桥数据
UPDATE tms_road_record SET trr_visible=2 where WHERE deal_time >= 1735660800 and  deal_time<=1738339199;



UPDATE car SET  car_level_time =0,car_year_valid_time=0,car_level=0 where ca_id =685;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '170', '170001', 685, 0, '系统申请', 0, '川AF40086已录入的技术等级评定及日期数据删除。 审批单号：ITSJ202502100001 ', 1739251930, 13, 0);





120.657995,31.276771




SELECT start_address,start_itude FROM `transport_order` WHERE to_id =3654158;
SELECT start_address,start_itude FROM `oms_order` WHERE to_id =3654158;

//修改订单地址
UPDATE transport_order SET start_address='苏州市吴中区吴东路1339号',start_itude='120.657995,31.276771' where to_id = 3654158;
UPDATE oms_order SET start_address='苏州市吴中区吴东路1339号',start_itude='120.657995,31.276771' where to_id = 3654158;


INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102002', 3654158, 0, '系统申请', 0, ' 修改取件地址为：苏州市吴中区吴东路1339号 审批单号：ITSJ202504010008 ', 1743503900, 13, 0);

