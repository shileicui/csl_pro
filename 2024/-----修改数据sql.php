<?


//修改车辆维保类型
update car_repair set cr_type=2,maintain_type=1 where cr_id=12172;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',12172, 0, '系统', 0, 'IT协助修改 将2024年11月30日沪DYT068的车辆维保类型由车辆维修更正为车辆保养  审批单号：ITSJ202412060002', 1733455466, 13, 0);



update car_repair set cr_type=2,maintain_type=1 where cr_id=13584;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',13584, 0, '系统', 0, 'IT协助修改 	浙G06ZT8车辆2025-03-22更正为车辆保养  审批单号：ITSJ202505130006', 1733455466, 13, 0);



update car_repair set cr_type=2,maintain_type=1 where cr_id=14005;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',14005, 0, '系统', 0, 'IT协助修改 津C467X7在4月21日维保类型选择错误，维修改为常规保养  审批单号：ITSJ202505070004', 1747012994, 13, 0);




update car_repair set cr_type=2,maintain_type=1 where cr_id=12653;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',12653, 0, '系统', 0, 'IT协助修改  鲁A39B9B车辆在25年1月7号这条数据已经更换机油机滤，属于常规保养，操作确认选择错误，需修改为常规保养  审批单号：ITSJ202504170003', 1745197242, 13, 0);



update car_repair set cr_type=2,maintain_type=1 where cr_id=13496;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',13496, 0, '系统', 0, 'IT协助修改  鲁AK8P45车辆3月16号维保，操作确认完成是选错选项，修改为车辆常规保养。  审批单号： ITSJ202504230001', 1745821921, 13, 0);








//修改维保里程
update car_repair set repair_mile=306564,repair_finish_mile=306564 where cr_id=12021;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',12021, 0, '系统', 0, 'IT协助修改  2024-11-19系统保养操作录入里程错误，需要修改。原来录入30806KM需要修改为306564KM  审批单号：   
ITSJ202412190003', 1734598396, 13, 0);



update car_repair set repair_mile=134984,repair_finish_mile=134984 where cr_id=14230;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',14230, 0, '系统', 0, 'IT协助修改  维保里程修改为134984KM  审批单号：   
ITSJ202507280002', 1753681138, 13, 0);


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




cart订单修改取件时间

UPDATE tms_cart_operation_record SET tcor_time=1751159280 where tcor_id = 27940;

update order_logistics set ol_pickup_time=1751159280   where to_id=3838160;
update oms_logistics set ol_pickup_time=1751159280   where to_id=3838160;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102040', 3838160, 0, '系统申请', 0, ' 取件时间修改为2025.06.29  09:08 审批单号：ITSJ202506290001 ', 1751245564, 13, 0);






cart订单修改取件时间

UPDATE tms_cart_operation_record SET tcor_time=1746769560 where tcor_id = 25039;

update order_logistics set ol_pickup_time=1746769560   where to_id=3731106;
update oms_logistics set ol_pickup_time=1746769560   where to_id=3731106;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102040', 3731106, 0, '系统申请', 0, ' 取件时间修改为2025-05-09 13:46 审批单号：ITSJ202505090001 ', 1746772106, 13, 0);



修改cart工作单指派人

update order_worksheet set op_uid=6601 where ow_id=16849216;
update order_worksheet set op_uid=6601 where ow_id=16849217;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102032',3468703, 0, '系统', 0, '更改取派件工作单操作人为时圣峰  审批单号： ', 1735785076, 13, 0);





修改cart工作单指派人

update order_worksheet set op_uid=18492 where ow_id=19376071;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102032',3468703, 0, '系统', 0, '更改派件工作单操作人为 居冠祥  审批单号： ITSJ202507030005', 1751538522, 13, 0);




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




SELECT start_address,start_itude FROM `transport_order` WHERE to_id =3660067;
SELECT start_address,start_itude FROM `oms_order` WHERE to_id =3660067;

//修改订单地址
UPDATE transport_order SET start_address='广西壮族自治区肿瘤医院南宁市河堤路71号',start_itude='108.348333,22.801332' where to_id = 3660067;

UPDATE oms_order SET start_address='广西壮族自治区肿瘤医院南宁市河堤路71号',start_itude='108.348333,22.801332' where to_id = 3660067;


INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102002', 3660067, 0, '系统申请', 0, ' 修改取件地址为：广西壮族自治区肿瘤医院南宁市河堤路71号 审批单号：ITSJ202504070001 ', 1743991160, 13, 0);



//修改取件联系人
UPDATE transport_order SET start_mobile_phone =13338000538,start_co_name='滕丽蕊'  where to_id = 3660067;

UPDATE oms_order SET start_mobile_phone =13338000538,start_co_name='滕丽蕊'  where to_id = 3660067;

UPDATE order_contact_relation SET mobile_phone =13338000538,co_name='滕丽蕊'  where id = 1080579;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102002', 3660067, 0, '系统申请', 0, ' 修改取件联系人为滕丽蕊 审批单号：ITSJ202504070001', 1743992739, 13, 0);




108.368949,22.730064






//修改订单地址
UPDATE transport_order SET start_cu_name='广西壮族自治区肿瘤医院（五象院区）',start_address='南宁市良庆区良玉大道50号',start_itude='108.368949,22.730064' where to_id = 3660067;

UPDATE oms_order SET start_cu_name='广西壮族自治区肿瘤医院（五象院区）',start_address='南宁市良庆区良玉大道50号',start_itude='108.368949,22.730064' where to_id = 3660067;


INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102002', 3660067, 0, '系统申请', 0, ' 修改发件客户：广西壮族自治区肿瘤医院（五象院区）取件地址：南宁市良庆区良玉大道50号  审批单号：ITSJ202504070001 ', 1744009008, 13, 0);




UPDATE car SET cumulative_duration=1251 where ca_id = 224;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170001',224, 0, '系统', 0, 'IT协助修改 冷机保养时总时长改为1251H 审批单号：ITSJ202504100002', 1744337121, 13, 0);



//修改车辆维保完成里程
UPDATE car_repair SET repair_finish_mile=247161 where cr_id = 13314;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',13314, 0, '系统', 0, 'IT协助修改 维保里程填写错误需修改为247161KM。  审批单号：ITSJ202504140005', 1744686596, 13, 0);


//删除事故数据

update car_accident set ca_id = 0,ca_number = '' where id=613;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170004',613, 0, '系统', 0, 'IT协助修改 鲁AN6185车辆2099-03-01日期维修数据删除 审批单号：ITSJ202505130004', 1747130895, 13, 0);



update car_accident set ca_id = 0,ca_number = '' where id=620;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170004',620, 0, '系统', 0, 'IT协助修改 闽DZ2B99车辆2023-03-30日期2条数据删除 审批单号：ITSJ202505130004', 1747130895, 13, 0);



update car_accident set ca_id = 0,ca_number = '' where id=612;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170004',612, 0, '系统', 0, 'IT协助修改 闽DZ2B99车辆2023-03-30日期2条数据删除 审批单号：ITSJ202505130004', 1747130895, 13, 0);




//开启白名单 客户
update customer set mini_program_switch = 2 where cu_id in (201900274,202106109,201601388,202100186,202103993,201207765,20120228,202000178,202101805,201900428,201601487,201900462,202105481,201900188,202101724,202102152,202000487,202100705,202102084,20120119,202100844,202103630,201600407,201601361,202102382,202000077,201600719,202000743,202106187,202104126,201601479,201207858,201900959,201207498,202100783,201900234,201600464,201900044,202102801,202105360,201208031,201600169,201900076,202104470,201600343,201900127,202001059,202103241,201601144,202101800,202101162,201900433,202100336,202102857,202104994,201900352,202001001,202000086,202105967,201207297,201207221,20120422,201207622,202104005,201207399,201207888,202103689,201601374,201901029,202104854,201900670,202105124,202103502,202102255,201600453,202104633,201207290,201600760,20120239,202103837,201207494,201900824,202101992,202103245,202102071,202101718,201207255,201207460,201600629,202105916,202104951,201601116,202103976,201207921,202106481,202101340,201900686,201601346,201207877,202100737,202100230,202000729,201900543,202106479,20121007,201900677,202100789,202101714,202104840,201601056,201207728,202106190,202000720,202102561,202104653,202106182,202103621,201601002,201207235,202106395,202101463,20120975,201600260,202102699,202101389);





update customer set mini_program_switch = 2 where cu_id in (202102205,201901049,202102117,201900727,202104353,201900874,202100250,201207946,202102620,201601553,202106169,202106947,20120028,202103322,201900418,202100353,202100105,201207274,201207625,202106910,201601383,202001292,202000237,202000551,202102376,20120802,201900569,202102985,201601261,202103834,202000280,202103436,201207793,201900233,202000567,202106450,202104676,201601024,201208044,201900722,202104799,201207839,202105999,202101073,201600467,201207414,202106513,20120745,201601395,202101132,201207802,201600014,202106948,201600100,201600957,202100445,201601026,201207398,202106424,201207665,201601524,201207783,202106470,202104407,202001172,202102488,202106841,20120791,201900390,202106659,202103892,202103508,202001299,201600136,202102766,202107108,201901023,202106586,201207109,202100311,202105333,202102457,201900708,202000525,202000282,201600418,201207383,202101020,202106815,202106561,202104296,201207895,201900473,20120524,201207553,202000826,202105429,202100675,202106268,20120846,202000344,202000526,202107036,202001327,20120756,202106567,201601451,202000013,202101165,202105975,201600198,202102031,202001331,202102059,20120722,202102306,202102983,202101114,20120278,202100334,202100559,202101949,202001235,202105300,202101527,201600301,201207318,201207644,201600002,202104125,201600044,201600936,202106975,202000127,202001024,202106609,202102412,201600412,202105725,201600175,202104596);




update customer set mini_program_switch = 2 where cu_id in (202101193,20120837,201207818,202102262,201207425,202000219,202100610,201601508,202100896,202100866,202101438,20120981,201600300,201600396,201900455,202100720,201900612,20120310,201600204,201207268,201207735,201900776,201207338,202103471,202100084,202000098);




//修改预约取件预约派件时间
UPDATE oms_logistics SET ol_pickup_planbegin=1747957200,ol_pickup_planend=1747957200,ol_delivery_planbegin=1748046600,ol_delivery_planend=1748046600 where to_id = 3758325;

UPDATE order_logistics SET ol_pickup_planbegin=1747957200,ol_pickup_planend=1747957200,ol_delivery_planbegin=1748046600,ol_delivery_planend=1748046600 where to_id = 3758325;


INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102002', 3758325, 0, '系统申请', 0, ' 预约取件时间修改为:2025-05-23 07:40-07:40 预约派件时间修改为:2025-05-24 08:30-08:30 审批单号：ITSJ202505220004 ', 1747894317, 13, 0);




update attachment set at_visible=0 where at_id=41252879;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102042',3758325, 0, '系统', 0, '删除附件：2025-05-22华东医药（杭州）-科济项目郑州市郑州大学第一附属医院到上海市上海科济制药-85513302others1747821688972831d7a54a17f.pdf  审批单号：ITSJ202505220004', 1747894317, 13, 0);






UPDATE tms_road_record SET trr_visible=2  WHERE deal_time >=1746028800 and deal_time <1748707200 and reconciliation_status=1 and payment_company = '生生供应链管理（济南）有限公司'

UPDATE tms_road_record SET trr_visible=2  WHERE deal_time >=1746028800 and deal_time <1748707200 and reconciliation_status=1 and payment_company = '生生供应链管理（广州）有限公司'



加油记录 取消入账

UPDATE tms_refuel_record_bill SET notarize_month='',invoice_money='',invoice_tax='',trrb_remark='',bill_status=2,invoice_cost='' where trrb_id = 125;


INSERT INTO `tms_remark_log` ( `trl_type`, `trl_subtype`, `trl_identifier`, `trl_uid`, `trl_username`, `trl_status`, `trl_remark`, `trl_createtime`, `trl_server_type`) VALUES ( '151', '151003', 125, 0, '系统申请', 0, ' 取消入账  审批单号：ITSJ202506180005', 1750225438, 13);



UPDATE customer_address SET child_region_name=''  WHERE child_region_name='无法找到该城市' and  ca_id in (498601,498597,498420,497575,496393,496001,495070,494514,494462,494433,493367,493140,493138,493090,492805,492633,491926,491810,490978,490949,490601,490136,489158,488051,487809,486905,486675,486638,486619,483803,483094,482356,482354,482355,482353,481700,480884,480565,480507,479230,479189,477749,477663,477664,477525,476043,474663,472975,469196,464951,464221,461426,459502,458212,458184,457175,456874,456755,453605,447310,447194,446213,440853,440544,440288,440286,437869,437171,436668,429671);




update tms_city_config set is_twog_unsupported=1 where tcc_id in (39,51,65,78,87,88,89,93,95,96,97,98,99,108,110,121,142,143,145,148,151,165,166,169,176,177,201,202,203,205,207,208,209,215,238,262,265,267,270,271,272,273,276,277,278,279,280,281,282,284,286,288,289,292,293,294,295,296,300,301,304,305,307,308,311)



cart订单修改派件时间

UPDATE tms_cart_operation_record SET tcor_time=1752839640 where tcor_id = 29025;

update order_logistics set ol_delivery_time=1752839640   where to_id=3888376;
update oms_logistics set ol_delivery_time=1752839640   where to_id=3888376;

update tms_logistics_remark set lr_opn_date=1752839640         where lr_id=11514975; 
update tms_logistics_log set tll_operation_time=1752839640        where tll_id=9955020;
update operation set opn_date=1752839640                  where opn_id=15901120;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102041', 3888376, 0, '系统申请', 0, ' 派件时间修改为2025-07-18 19:54审批单号：ITSJ202507220001 ', 1753173574, 13, 0);



cart订单修改取件时间

UPDATE tms_cart_operation_record SET tcor_time=1753752360 where tcor_id = 29646;

update order_logistics set ol_pickup_time=1753752360   where to_id=3908674;
update oms_logistics set ol_pickup_time=1753752360   where to_id=3908674;


update tms_logistics_remark set lr_opn_date=1753752360         where lr_id=11650159; 
update tms_logistics_log set tll_operation_time=1753752360        where tll_id=10062622;
update operation set opn_date=1753752360                  where opn_id=15997042;


INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102040', 3908674, 0, '系统申请', 0, ' 取件时间修改为2025.07.29  09:26 审批单号：TSJ202507290002 ', 1753771835, 13, 0);



