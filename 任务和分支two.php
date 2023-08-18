<?php 



智能排线v1.1
feature_12080_csl_20230321 tms_admin  已上线
http://project.ashsh.com.cn/index.php?m=task&f=view&id=12080

CREATE TABLE `tms_path_planning` (
  `tpp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `date_time` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '城市名称',
  `wmp_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组id',
  `wmp_name` varchar(255) NOT NULL DEFAULT '' COMMENT '站点名称',
  `path_num` int(11) NOT NULL DEFAULT '0' COMMENT '路线数量',
  `tpp_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tpp_id`),
  KEY `idx_region_id` (`region_id`),
  KEY `idx_wmp_idd` (`wmp_id`)
) COMMENT='排序策略';

CREATE TABLE `tms_worksheet_path` (
  `twp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tpp_id` int(11) NOT NULL DEFAULT '0' COMMENT '排线策略id',
  `path_no` varchar(32) NOT NULL DEFAULT '' COMMENT '路线编号',
  `path_no_num` int(11) NOT NULL DEFAULT '0' COMMENT '线路 1 A线',
  `ca_id` int(11) NOT NULL DEFAULT '0' COMMENT '车辆id',
  `car_number` varchar(32) NOT NULL DEFAULT ''  COMMENT '车牌',
  `user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '用户ID ',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `twp_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`twp_id`),
  KEY `idx_tpp_id` (`tpp_id`)
) COMMENT='工作单排线';


项目配置 新增到达派件签收码校验 开关
ALTER table tms_project_config add COLUMN send_code_verify  tinyint(4)  not null  DEFAULT '0' COMMENT '到达派件签收码校验 1验证 0不验证';

'send_code_verify' => ['on' => 1, 'off' => 0, 'label' => '到达派件签收码校验', 'span' => ' '],  


外协操作费用：统计数据提示
feature_12110_csl_20230323 tms_admin  已上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12110


路由配置管理1.3.1：批量添加供应商，路由审核
feature_12161_csl_20230324 dispath_admin 已上线
feature_12161_csl_20230327 tms_admin 已上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12161


外协费用列表调整
feature_12239_csl_20230329  已上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12239


冷藏车，增加新的字段

操作站点数据导出
车辆管理v3.0：备案车辆的车辆维修保养最新记录
  ALTER table car add COLUMN `car_emission_standard` int(4) NOT NULL DEFAULT '0' COMMENT '排放标准 0暂无',
   add COLUMN `car_ailwaycarriage_model` varchar(255) NOT NULL DEFAULT '' COMMENT '车厢型号和品牌',
   add COLUMN `car_refrigerator_model` varchar(255) NOT NULL DEFAULT '' COMMENT '冷机品牌和型号',
   add COLUMN `car_wintervalidation_date` int(11) NOT NULL DEFAULT '0' COMMENT '冬季验证日期',
   add COLUMN `car_summervalidation_date` int(11) NOT NULL DEFAULT '0' COMMENT '夏季验证日期',
   add COLUMN `car_initialvalidation_date` int(11) NOT NULL DEFAULT '0' COMMENT '初次验证日期';


   tms_drive_record

   tms_refrigerated_truck_inspections

     ALTER table tms_refrigerated_truck_inspections add COLUMN `rti_pdf_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未生成pdf  1 生成PDF',
   add COLUMN `rti_pdf_path` varchar(1024) NOT NULL DEFAULT '' COMMENT 'pdf文件路径',
   add COLUMN `rti_pdf_filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'pdf文件路径';

    ALTER table tms_refrigerated_truck_inspections add COLUMN `rti_pdf_filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'pdf文件路径'；



 车辆管理v3.0：冷藏车检车记录表线上管理
 feature_12257_csl_20230330 tms_admin  已上线  二期修改 已上线
 https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12257
       <span >否</span>
            
            <img style="'.$display_off[$chcek_car['temperature_probe_damage']].'" src="'.$no_image.'">
            <img style="'.$display_no[$chcek_car['temperature_probe_damage']].'" src="'.$off_image.'">
           
            <span >是</span>
         
            <img style="'.$display_no[$chcek_car['temperature_probe_damage']].'" src="'.$no_image.'">
            <img style="'.$display_off[$chcek_car['temperature_probe_damage']].'" src="'.$off_image.'">


UPDATE tms_refrigerated_truck_inspections SET indoor_unit_frost='2',fan_blockage='2',temperature_probe_damage='2';
UPDATE tms_refrigerated_truck_inspections SET indoor_unit_frost='1' where  rti_id = 137;
UPDATE tms_refrigerated_truck_inspections SET indoor_unit_frost='1' where  rti_id = 413;
UPDATE tms_refrigerated_truck_inspections SET indoor_unit_frost='1' where  rti_id = 436;

SELECT 
rti_id,
indoor_unit_frost,
fan_blockage,
temperature_probe_damage
 FROM `tms_refrigerated_truck_inspections` WHERE indoor_unit_frost =2 or fan_blockage=2 or temperature_probe_damage=2;

仓库工作单优化
feature_11996_csl_20230328 tms_admin 已上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=11996


1.仓库工作单优化 已提测
2.车辆管理v3.0：冷藏车检车记录表线上管理 已上线
3.小程序退款补差价 推送数据调整

外协费用统计调整
feature_12459_csl_20230406  tms_admin 
http://project.ashsh.com.cn/index.php?m=task&f=view&id=12459

质量管控1.06：订单任务清单管理
feature_12449_zzp_230406 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12469  已上线


物流系统配置管理1.3：主副温度计配置
feature_12522_csl_20230410  tms_admin  
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12522 已上线 二期修改 已上线
客户配置 支持主副温度计  开关
ALTER table tms_customer_config add COLUMN main_plural_thermometer  tinyint(4)  not null  DEFAULT '0' COMMENT '支持主副温度计 1支持 0不支持';

tms_customer_conf

'main_plural_thermometer' => ['on' => 1, 'off' => 0, 'label' => '支持主副温度计', 'span' => ' '],  



物流系统配置管理1.4：交界单上传配置
http://project.ashsh.com.cn/index.php?m=task&f=view&id=12560  已上线
ALTER table tms_customer_config add COLUMN connect_verify  tinyint(4)  not null  DEFAULT '0' COMMENT '上传客户交接单 1验证 0不验证';
ALTER table tms_project_config add COLUMN connect_verify  tinyint(4)  not null  DEFAULT '0' COMMENT '上传客户交接单 1验证 0不验证';
tms_project_conf

'connect_verify' => ['on' => 1, 'off' => 0, 'label' => '上传客户交接单', 'span' => ' '],  

tms_customer_conf
'connect_verify' => ['on' => 1, 'off' => 0, 'label' => '上传客户交接单', 'span' => ' '],  




connect_verify


停运路由优化
https://project.ashsh.com.cn/index.php?m=bug&f=view&bugID=8506 已上线
fixbug_8506_csl_20230412  dispath_admin
fixbug_8506_csl_20230412  tms_service


调度变更管理，操作变更路由提醒
feature_12611_csl_20230413 tms_admin
feature_12611_csl_20230424 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12611 已上线 


ALTER table tms_fahuochange_apply add COLUMN tfa_appcause_type  tinyint(4)  not null  DEFAULT '0' COMMENT 'app提交原因 1 原路由车次停运 2 现结、月结选择错误 3 订单通知修改 4 货到晚了 5 提货提晚了 6 其他',
add COLUMN tfa_tmsremark  varchar(300)  not null  DEFAULT '' COMMENT '后台处理原因备注',
add COLUMN tfa_tmscause_type  tinyint(4)  not null  DEFAULT '0' COMMENT '后台处理原因 1 原路由车次停运 2 现结、月结选择错误 3 订单通知修改 4 货到晚了 5 提货提晚了 6 其他',
 add COLUMN old_ro_id int(11)  not null DEFAULT '0' COMMENT '修改前路由ro_id',
 add COLUMN new_ro_id int(11)  not null DEFAULT '0' COMMENT '修改后路由ro_id',
 add COLUMN source tinyint(1)  not null DEFAULT '0' COMMENT '来源 1后台 2 APP',
add COLUMN old_departure_trans_time int(11) unsigned DEFAULT '0' COMMENT '修改前路由出港时间',
add COLUMN new_departure_trans_time int(11) unsigned DEFAULT '0' COMMENT '修改后路由出港时间',
add COLUMN old_arrive_trans_time int(11) unsigned DEFAULT '0' COMMENT '修改前路由到港时间',
add COLUMN new_arrive_trans_time int(11) unsigned DEFAULT '0' COMMENT '修改后路由到港时间';


ALTER table tms_fahuochange_apply add COLUMN tfa_appcause_type  tinyint(4)  not null  DEFAULT '0' COMMENT 'app提交原因 1 原路由车次停运 2 现结、月结选择错误 3 订单通知修改 4 货到晚了 5 提货提晚了 6 其他',
add COLUMN tfa_tmsremark  varchar(300)  not null  DEFAULT '' COMMENT '后台处理原因备注',
add COLUMN tfa_tmscause_type  tinyint(4)  not null  DEFAULT '0' COMMENT '后台处理原因 1 原路由车次停运 2 现结、月结选择错误 3 订单通知修改 4 货到晚了 5 提货提晚了 6 其他',
 add COLUMN old_ro_id int(11)  not null DEFAULT '0' COMMENT '修改前路由ro_id',
 add COLUMN new_ro_id int(11)  not null DEFAULT '0' COMMENT '修改后路由ro_id',
 add COLUMN tfa_source tinyint(1)  not null DEFAULT '0' COMMENT '来源 1后台 2 APP',
add COLUMN old_departure_trans_time int(11) unsigned not null  DEFAULT '0' COMMENT '修改前路由出港时间',
add COLUMN new_departure_trans_time int(11) unsigned not null  DEFAULT '0' COMMENT '修改后路由出港时间',
add COLUMN old_arrive_trans_time int(11) unsigned not null  DEFAULT '0' COMMENT '修改前路由到港时间',
add COLUMN new_arrive_trans_time int(11) unsigned not null  DEFAULT '0' COMMENT '修改后路由到港时间';

TMS_CAUSE_TYPE_MAP
{
    "1": "原路由车次停运",
    "2": "现结、月结选择错误",
    "3": "订单通知修改",
    "4": "货到晚了",
    "5": "提货提晚了",
    "6": "其他"
}


供应商账单明细接口 财务接口 对接人冯修业
feature_12616_csl_20230414 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12616  已上线



订单短信校验
feature_12657_csl_20230414 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12657 已上线 上线通知mongo
ALTER table tms_order_information add COLUMN is_note_code  tinyint(1)  not null  DEFAULT '0' COMMENT '短信校验 0否 1是';

102002



收发件人周末去派件提示，取派时间管理
feature_12684_csl_20230417 tms_admin
feature_12684_csl_20230418 tms_service
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12684 已上线


CREATE TABLE `tms_address_remind` (
  `tar_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `recipients_name` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人名称',
  `mobile_phone` varchar(180)  NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `telephone` varchar(180) NOT NULL DEFAULT '' COMMENT '座机号',
  `temperature` tinyint(4) unsigned  NOT NULL DEFAULT '0' COMMENT '温区id',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '所在地区ID',
  `region_name` char(128) NOT NULL DEFAULT ''  COMMENT '地区名',
  `address` varchar(800) NOT NULL DEFAULT '' COMMENT '收件人联系地址',
  `address_type` tinyint(4) unsigned  NOT NULL DEFAULT '0' COMMENT '地址类型 1周末不取件 2周末不派件 3周末不取件不派件',
  `tar_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2停用',
  `tar_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tar_id`)
) COMMENT='周末取派件地址提醒配置';

ALTER table tms_order_information add COLUMN is_getsend  tinyint(1)  not null  DEFAULT '0' COMMENT '是否支持周末取派 1周末不取件 2周末不派件 3周末不取件不派件';



冷藏车线上管理，后台展示
feature_12738_csl_20230419 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=12738 已上线


SELECT
  ro.ro_id AS '路由id',
  ro.ro_name AS '路由名称',
  ts.tms_sup_name AS '出港城市',
  ro.start_region_name AS '出港城市',
  ro.stop_region_name AS '到港城市',
  rt.rt_name AS '路由类型',
   (
      CASE
          ro.ro_status 
          WHEN 0 THEN
          '正常' 
          WHEN 1 THEN
          '停运' 
      END 
      ) AS '路由状态',
  count( tro.ro_id ) AS '供应商数量' 
FROM
  `route` AS ro
  LEFT JOIN (SELECT * FROM tms_supplier_route WHERE tsr_visible = 1) AS tro ON ro.ro_id = tro.ro_id 
  LEFT JOIN route_type AS rt ON ro.rt_id = rt.rt_id
  LEFT JOIN tms_supplier AS ts ON ro.su_id = ts.tms_sup_id
WHERE
  ro.ro_visible = 1 
GROUP BY
  ro.ro_id;


当前订单取件方配置了周末不取件 ，请注意后续工作单日期


方案准备导出：增加温区和包装箱信息
feature_12785_csl_20230421 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=12785 已上线


路由名称增加区县
feature_12806_csl_20230421 tms_admin 
http://project.ashsh.com.cn/index.php?m=task&f=view&id=12806 已上线


路由配置管理1.3.2：路由定时停运
feature_12828_csl_20230424 dispath_admin
feature_12828_csl_20230424 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12828 已上线

feature_12828_csl_20230425 tms_service


路由站点增加停用、启用和批量停用启用
feature_12814_csl_20230425 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12814 已上线



项目立项 人员备案历史数据同步
feature_12866_csl_20230426  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12866 已上线
php yii project-approval/old-cart-person   // 老cart数据同步
php yii project-approval/new-cart-person   // 新cart数据同步


路由批量删除按钮优化
feature_12873_csl_20230426 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12873  已上线


/mnt/wwwroot/tms_admin_test/tms_admin/protected



客户配置 新增 取派件填写开启关闭温度 配置    已上线
ALTER table tms_customer_config add COLUMN write_temp_switch  tinyint(4)  not null  DEFAULT '0' COMMENT '取派件填写开启关闭温度 1填写 0不填写';
'write_temp_switch' => ['on' => 1, 'off' => 0, 'label' => '取派件填写开启关闭温度', 'span' => ' '],  


路由名称 历史数据处理
feature_12918_csl_20230504 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12918 已上线


HistoryDataController

history-data/route-name

order/ams-eamstatus

/usr/local/php7.1/bin/php /data/mnt/wwwroot/tms_admin_test/tms_admin/yii history-data/route-name


客户配置 和 项目配置 新增批量派件配置
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12951  未上线

ALTER table tms_customer_config add COLUMN batch_delivery_switch  tinyint(4)  not null  DEFAULT '0' COMMENT '批量派件 1支持 0不支持';

ALTER table tms_project_config add COLUMN batch_delivery_switch  tinyint(4)  not null  DEFAULT '0' COMMENT '批量派件 1支持 0不支持';

tms_customer_conf

'batch_delivery_switch' => ['on' => 1, 'off' => 0, 'label' => '批量派件', 'span' => ' '],  

tms_project_conf

'batch_delivery_switch' => ['on' => 1, 'off' => 0, 'label' => '批量派件', 'span' => ' '],  


1.调度变更管理 新增 变更类型筛选
2.路由临时停运 提前生成调度变更申请 


物流项目管理流程线上化1.1.1：液氮称重记录、CART耗材准备记录
feature_12990_csl_20230508 omsapi 
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12990 未上线

remark_subtype2
,102173=>'液氮罐称重'

at_subtype7
,207025=>'液氮罐记录表',207026=>'液氮罐称重'


易流推送异常数据优化
feature_13052_csl_20230510 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=13052  已上线

ALTER table tms_ylt_wcmessage_log add COLUMN tms_ylt_wl_type  tinyint(4)  not null  DEFAULT '0' COMMENT '推送类型 1超温 2预警';


CREATE TABLE `tms_ylt_remark` (
  `tyr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tms_ylt_wl_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联id tms_ylt_wcmessage_log表',
  `car_number` varchar(30) NOT NULL DEFAULT ''  COMMENT '车牌号',
  `tyr_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '推送类型 1超温 2预警',
  `tyr_to_id` varchar(255) NOT NULL DEFAULT '' COMMENT '关联订单ids',
  `tyr_to_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `tyr_remark` text COMMENT '备注内容',
  `tyr_create_name` varchar(25) NOT NULL DEFAULT '' COMMENT '创建人',
  `tyr_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `tyr_remark_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '备注时间',
  `tyr_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tyr_id`)
) COMMENT='易流异常备注';



订单地址坐标错误优化
fearture_13080_csl_20230512 tms_service
feature_13080_csl_20230512 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=13080 已上线

CREATE TABLE `tms_redress_site` (
  `trs_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `big_data_id` int(11) NOT NULL DEFAULT '0' COMMENT '大数据相关id',
  `trs_to_id` varchar(255) NOT NULL DEFAULT '' COMMENT '关联订单ids',
  `trs_to_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `city_id`  int(11) NOT NULL DEFAULT '0' COMMENT '城市Id',
  `city_name` varchar(50) NOT NULL DEFAULT '' COMMENT '城市名称',
  `trs_address` varchar(800) NOT NULL  DEFAULT '' COMMENT '错误地址',
  `lng` varchar(30) NOT NULL  DEFAULT '' COMMENT '经度坐标',
  `lat` varchar(30) NOT NULL  DEFAULT '' COMMENT '纬度坐标',
  `trs_redress_name` varchar(25) NOT NULL DEFAULT '' COMMENT '纠正人',
  `trs_redress_uid` int(11) NOT NULL DEFAULT '0' COMMENT '纠正人id',
  `trs_redress_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '备注时间',
  `trs_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '纠正状态  1未纠正  2已纠正',
  `trs_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`trs_id`)
) COMMENT='异常坐标纠正表';

define('SITE_TUIAW_MESSAGE_ID','166');
{
    "msgtype":"markdown",
    "markdown":{
        "content":"【异常坐标地址】\n地址：@@address@@\n城市：@@cityname@@\n运单编号：@@tonolist@@\n@@datadis@@"
    },
    "key":"af9dfb0f-81c3-4186-b793-199505dabab4"
}

{
  "id":"68874",
  "lng":"114.711113",
  "lat":"38.034088"
}

冷藏车 异常数据推送 只推送 诺和客户

订单列表文案更换
feature_13136_csl_20230516 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13136 已上线


新增客户 客户配置默认值
feature_13134_csl_20230516 tms_service   上线前通知虹桥
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13134 已上线



工作单计划箱型结算箱型 数量输入框 禁止历史记录
feature_13207_csl_20230519 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13207 已上线



自动数据反馈：签章后反馈
feature_13189_csl_20230518 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13189 未上线

thind.applet_order_temperature_data.push  消息主题
index.php?r=timing/applet-ordertemperaturepush  处理消息主题


php yii local/applet-temperaturepush  测试

php yii order-feedback/applet-temperaturepush 每天早上五点执行

60923641
60938773
/upload/signature/2021-09/2019-07-31广东东阳光药业东莞市广东东阳光药业到北京市中国人民解放军总医院-60923641temp1631778857595.pdf



签单返回2.0.7：返回“订单”修改为返回“客服”
feature_13287_csl_20230524 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=13287  已上线



清空异常坐标地址表
TRUNCATE TABLE `tms_redress_site`;  

测试环境 手机号处理
UPDATE `transport_order` set start_mobile_phone = '13800000000',stop_mobile_phone= '13800000000';


路由配置管理1.3.3：路由停运启用驳回
feature_13288_csl_20230524  dispath_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13288  已上线 上线时间20230531 

alter table route add column `rejective_reason`  varchar(500) NOT NULL DEFAULT '' COMMENT '驳回原因';


20230525
1.异常坐标地址推送企业微信 优化
2.定时删除没有匹配到订单的 异常地址并通知算法接口
3.异常坐标地址 新增 确认按钮
4.跟进 签单返回文案修改 测试 及发布上线

路由配置管理1.3.3：路由停运启用驳回


20250506
1.路由配置管理1.3.3：路由停运启用驳回


异常坐标地址优化
feature_13368_csl_20230529  tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13368 未上线

alter table tms_redress_site add column `is_order`  tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有相关订单 1没有 2有';

alter table tms_redress_site add column `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '匹配到的订单id';

alter table tms_redress_site add column `to_no` char(32) NOT NULL DEFAULT '' COMMENT '匹配到的订单to_no';

alter table tms_redress_site add column `start_cu_name` varchar(400) DEFAULT NULL  DEFAULT '' COMMENT '发件客户';
alter table tms_redress_site add column `stop_cu_name` varchar(400) DEFAULT NULL  DEFAULT '' COMMENT '收件客户';

alter table tms_redress_site add column `is_getsend`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '匹配到的订单类型 1取件 2派件';

alter table
  tms_redress_site
add
  column `is_order` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否有相关订单 1没有 2有',
add
  column `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '匹配到的订单id',
add
  column `to_no` char(32) NOT NULL DEFAULT '' COMMENT '匹配到的订单to_no',
add
  column `start_cu_name` varchar(400) NOT NULL DEFAULT '' COMMENT '发件客户',
add
  column `stop_cu_name` varchar(400)  NOT NULL  DEFAULT '' COMMENT '收件客户',
add
  column `is_getsend` tinyint(4) NOT NULL DEFAULT '0' COMMENT '匹配到的订单类型 1取件 2派件';

php yii history-data/site-data


订单  温度计 箱子序列号  药品序列号


tms_order_druginfo




13380 APP 取件扫码 诺和订单药品关联表信息
feature_13380_csl_20230529  omsapi
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13380 未上线

CREATE TABLE `tms_order_drug` (
  `tod_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单to_id',
  `temp_number` varchar(50) NOT NULL DEFAULT '' COMMENT '温度计序列号',
  `out_temp_number` varchar(50) NOT NULL DEFAULT '' COMMENT '温度计序列号',
  `box_number` varchar(50) NOT NULL DEFAULT '' COMMENT '箱子序列号',
  `tod_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tod_id`)
) COMMENT='订单药品信息表';

CREATE TABLE `tms_orderdrug_info` (
  `toi_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tod_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'tms_order_drug表 tod_id',
  `drug_number` varchar(50) NOT NULL DEFAULT '' COMMENT '药品序列号',
  `toi_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`toi_id`)
) COMMENT='订单药品信息关联表';

select temp_number,out_temp_number,box_number,group_cont(‘,’,drug_number) FROM tms_order_drug tod left join tms_orderdrug_info toi on tod.tod_id=toi.tod_id  where to_id = 2505558 and tod_visible =1 and toi_visible=1;



诺和关联表导出
feature_13381_zzp_230529 tms_admin
fearture_13381_csl_20230531 tms_service
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13381 已上线 上线时间（20230601）


诺和项目绑定温度计优化 新增统一配置
featrue_13426_csl_20230601 tms_admin
featrue_13426_csl_20230601 tms_service
featrue_13426_csl_20230601 omsapi
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13426 未上线

TMS_THERMOMETER_MAP  项目绑定温度计 新增统一配置
{
    "cp_ids":"3680,2905,20256,20257,20573,20575,12396"
}



UPDATE tms_orderdrug_info SET drug_number='00357122460017208985' where  toi_id = 2;
UPDATE tms_orderdrug_info SET drug_number='00357122460017208961' where  toi_id = 4;


        $where[] = 'ts_status=0';



路由站点优化
feature_13461_csl_20230601 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13461 已上线


订单确认 新增修改按钮 处理异常坐标信息
feature_13472_csl_20230602 tms_admin
feature_13472_csl_20230606 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13472 未上线

UPDATE tms_redress_site SET trs_visible=2

116.5666491696746,39.7971908469835

69506021


1.APP液氮称重记录接口
2.APP 诺和扫码 关联订单药品信息接口
3.订单 异常坐标地址 管理
4.易流推送异常数据优化
5.自动数据反馈：签章后反馈
6.路由配置管理1.3.3：路由停运启用驳回
7.路由名称 历史数据处理
8.客户配置和项目配置
9.新增客户 客户配置默认值
10.工作单计划箱型结算箱型优化
11.签单返回2.0.7：返回订单修改为返回客服
12.路由站点优化


UPDATE tms_order_drug SET out_temp_number='T247C0B1' where  tod_id = 24;



tod_id

T247C0B1


9112270311029


225860

225860  LiberoCL

223430  LiberoCL test


诺和扫码优化
feature_13497_csl_20230605 omsapi
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13497 已上线



虹桥获取箱型配置信息接口
feature_13515_csl_20230605  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13515 未上线



物流供应商主体调整
feature_13492_csl_20230606 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13492 未上线

alter table
  tms_supplier_main
add
  column `sup_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '供应商类别',
add
  column `sup_code` varchar(100) NOT NULL DEFAULT '' COMMENT '供应商代码',
add
  column `sup_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '所在城市',
add
  column `sup_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '所在城市名称';



订单确认、复核：识别温度计提醒
feature_13379_csl_20230607 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13379 已上线



差旅管家2.1：出差单关联运单费用报销，流程调整
feature_13540_csl_20230607 tms_admin
feature_13540_csl_20230608 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13540  已上线

//dis接口域名
define('DIS_API_DOMAIN', 'http://oms.ashsh.com.cn:10029');

CREATE TABLE `tms_travel` (
 `tt_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `travel_number` varchar(50) NOT NULL DEFAULT '' COMMENT '出差单编号',
  `travel_name` varchar(25) NOT NULL DEFAULT '' COMMENT '出差人名称',
  `travel_uid` int(11) NOT NULL DEFAULT '0' COMMENT '出差人id',
  `travel_em_no` varchar(25) NOT NULL DEFAULT '' COMMENT '发起人工号',
  `accompany_names` varchar(255) NOT NULL DEFAULT '' COMMENT '陪同人名称',
  `accompany_uids` varchar(255) NOT NULL DEFAULT '' COMMENT '陪同人id',
  `accompany_em_nos` varchar(255) NOT NULL DEFAULT '' COMMENT '陪同人工号',
  `start_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '出发城市id',
  `start_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '出发城市名称',
  `stop_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '目的城市id',
  `stop_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '目的城市名称',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `stop_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `trip_reason` varchar(800) NOT NULL DEFAULT '' COMMENT '出差事由',
  `tt_address` varchar(800) NOT NULL DEFAULT '' COMMENT '工作地址',
  `tt_remark` text COMMENT '备注内容',
  `created_name` varchar(25) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tt_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '出差单状态  1新建 2审批中  5审批通过 6已取消 7已退回',
  `trip_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '出行方式  1飞机 2高铁 3动车 4火车 5出租车 6轮船 7汽车大巴 8自驾',
  `oid` varchar(100) NOT NULL DEFAULT '' COMMENT '出差单标识符',
  `round_trip_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否往返 0否 1是 ',
  `is_reimbursed` tinyint(4) NOT NULL DEFAULT '0' COMMENT '否已报销  0未报销 1已报销',
  `document_type` varchar(25) NOT NULL DEFAULT '' COMMENT '北森审批类型',
  `approve_status` varchar(25) NOT NULL DEFAULT '' COMMENT '北森审批状态',
  `eteams_push_param` json DEFAULT NULL COMMENT '北森推送内容参数',
  `sp_id` varchar(50) NOT NULL DEFAULT '' COMMENT '出差单报销申请审批ID',
  `tt_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tt_id`)
) COMMENT='出差单申请表';



CREATE TABLE `tms_order_travel` (
 `tot_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tt_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '出差单申请表id',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单to_id',
  `to_no` char(32) NOT NULL DEFAULT '' COMMENT '订单to_no',
  `tot_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tot_id`),
  KEY `idx_tt_id` (`tt_id`),
  KEY `idx_to_id` (`to_id`)
) COMMENT='出差单相关订单表';


北森出差单数据同步
生产者 user_service
user-service.business-trip.change   消息主题
/index.php?r=tms-travel/update      消费接口



//暂时不用
// CREATE TABLE `tms_travel_steward` (
//   `tos_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
//   `steward_number` varchar(50) NOT NULL DEFAULT '' COMMENT '差旅管家订单号',
//   `travel_number` varchar(50) NOT NULL DEFAULT '' COMMENT '出差单编号',
//   `travel_name` varchar(25) NOT NULL DEFAULT '' COMMENT '出差人名称',
//   `cost_name` varchar(25) NOT NULL DEFAULT '' COMMENT '费用类型',
//   `travel_tool` varchar(25) NOT NULL DEFAULT '' COMMENT '交通工具',

//   `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
//   `stop_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
//   `start_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '出发城市名称',
//   `stop_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '目的城市名称',
//   `steward_price` varchar(50) NOT NULL DEFAULT '' COMMENT '金额',
//   `steward_type` varchar(50) NOT NULL DEFAULT '' COMMENT '差旅订单状态',

//   `tos_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
//   `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
//   `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
//   `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
//   PRIMARY KEY (`tos_id`)
// ) COMMENT='出差单相关差旅管家表';





异常坐标地址 
feature_13472_csl_20230602  tms_admin
tms_redress_site


订单附属信息表新增 是否签收反馈 和是否温度反馈 字段
feature_13680_csl_20230613 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13680 已上线

alter table
  tms_order_information
add
  column `is_sign_feedback` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否签收反馈 0未反馈 1已反馈',
add
  column `is_temperature_feedback` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否温度反馈 0未反馈 1已反馈';

UPDATE tms_order_information SET is_sign_feedback='1',is_temperature_feedback='1';

thind.order_sign_data.push   签收反馈 timing/ordersignbackpush
thind.order_temperature_data.push   温度反馈  timing/ordertemperaturepush
thind.applet_order_temperature_data.push   小程序温度反馈 timing/AppletOrdertemperaturepush

php yii local/signbackpush
php yii local/temperaturepush
php yii local/applet-temperaturepush
18831161
php yii order-feedback/applet-temperaturepush






差旅管家2.1：出差单专人专车里程申报
feature_13539_csl_20230614 tms_admin
feature_13539_csl_20230616 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13539 已上线




CREATE TABLE `tms_mileage_declare` (
  `tmd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tmd_number` varchar(50) NOT NULL DEFAULT '' COMMENT '申请编号',
  `travel_number` varchar(50) NOT NULL DEFAULT '' COMMENT '出差单编号',
  `tt_id` int(11) NOT NULL DEFAULT '0' COMMENT '出差单id',
  `start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开始时间',
  `stop_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结束时间',
  `start_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '出发城市id',
  `start_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '出发城市名称',
  `halfway_region_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '途径城市id',
  `halfway_region_names` varchar(255) NOT NULL DEFAULT '' COMMENT '途径城市名称',
  `stop_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '目的城市id',
  `stop_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '目的城市名称',
  `tmd_mileage` varchar(50) NOT NULL DEFAULT '' COMMENT '申报里程数',
  `travel_mileage` varchar(50) NOT NULL DEFAULT '' COMMENT '出差距离',
  `car_number` varchar(32) NOT NULL DEFAULT '' COMMENT '车牌号',
  `unique_number` varchar(100) NOT NULL DEFAULT '' COMMENT '泛微ecology关联编号',
  `request_id` int(11) NOT NULL DEFAULT '0' COMMENT '泛微ecology流程ID',
  `accompany_names` varchar(255) NOT NULL DEFAULT '' COMMENT '陪同人名称',
  `accompany_uids` varchar(255) NOT NULL DEFAULT '' COMMENT '陪同人id',
  `accompany_em_nos` varchar(255) NOT NULL DEFAULT '' COMMENT '陪同人工号',
  `send_reason` varchar(800) NOT NULL DEFAULT '' COMMENT '配送说明',
  `cancel_reason` varchar(500) NOT NULL DEFAULT '' COMMENT '作废原因',
  `car_back_to_ids` varchar(1024) NOT NULL DEFAULT '' COMMENT '返程的订单id',
  `car_back_to_nos` varchar(1024) NOT NULL DEFAULT '' COMMENT '返程的单号',
  `created_name` varchar(25) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `created_em_no` varchar(25) NOT NULL DEFAULT '' COMMENT '创建人工号',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tmd_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '里程申报状态 1未申报 2已申报 3已完成 4已作废',
  `tmd_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  `tmd_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '专车专人类型 0 专车冷藏车 1 专人',
  PRIMARY KEY (`tmd_id`),
  KEY `idx_tt_id` (`tt_id`)
) COMMENT='里程申报';

CREATE TABLE `tms_mileage_order` (
  `tmo_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tmd_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '里程申报表id',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单to_id',
  `to_no` char(32) NOT NULL DEFAULT '' COMMENT '订单to_no',
  `tmo_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tmo_id`),
  KEY `idx_tmd_id` (`tmd_id`),
  KEY `idx_to_id` (`to_id`)
) COMMENT='里程申报相关订单表';


office-service.workflow-approval.change-notify
index.php?r=tms-travel/update-mileage

{"code":0,"msg":"ok","data":{"unique_number":61866421542887424,"request_id":24049}}


ALTER table tms_mileage_declare add COLUMN `tmd_url`  text COMMENT '图片链接';
ALTER table tms_travel add COLUMN `tt_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '出差单类型 1 业务出差 2 公务出差';








异常坐标地址 新增订单负责人
feature_13771_csl_20230619 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13771  已上线


TMS迁移不使用生生签收单据与使用客户签收单据配置项
feature_13786_csl_20230620 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=13786  已上线

php yii history-data/project-conf-data



ALTER table tms_customer_config add COLUMN `cpc_not_use_ssexpress` tinyint(3) unsigned  NOT NULL DEFAULT '0' COMMENT '不使用生生面单  0使用  1不使用',
add COLUMN `cpc_use_customer_express` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用客户面单 1使用 0不使用';


ALTER table tms_project_config add COLUMN `cpc_not_use_ssexpress` tinyint(3) unsigned  NOT NULL DEFAULT '0' COMMENT '不使用生生面单  0使用  1不使用',
add COLUMN `cpc_use_customer_express` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用客户面单 1使用 0不使用';

\sswl\utils\config\SystemEnum::getSystemEnumByEnumType('TMS_CUSTOMER_CONFIG');

  \sswl\utils\config\SystemEnum::getSystemEnumByEnumType('TMS_PROJECT_CONFIG');
//物流系统，客户项目特殊配置
TMS_CUSTOMER_CONFIG
 {
  "tcc_dwt_shutdown_verify" : {"on" : 1, "off" : 0, "label" : "鼎为关机验证", "span" : ""},
   "cu_piece_feedback" : {"on" : 1, "off" : 2, "label" : "签收自动反馈", "span" : "（派件1小时后自动邮件签收反馈）"}, 
   "cu_temperature_feedback" : {"on" : 1, "off" : 2, "label" : "温度自动反馈", "span" : "（每晚8点自动邮件温度数据反馈）"},
   "cu_temperature_type" : {"on" : 1, "off" : 2, "label" : "支持批量上传温度数据", "span" : "（默认客户支持批量上传温度数据）"},
   "cu_tengsen_trmperature" : {"on" : 1, "off" : 2, "label" : "不支持批量上传滕森温度数据", "span" : "（默认客户支持上传）"},
   "cu_sign_feedback" : {"on" : 1, "off" : 2, "label" : "代签短信提醒", "span" : ""},
   "cu_goods_print" : {"on" : 1, "off" : 0, "label" : "打印运单时将货物名称打印在运单上", "span" : ""},
   "cu_send_message" : {"on" : 0, "off" : 1, "label" : "不发送取派短信", "span" : "（配置后不给收发件人发送取派短信）"},
   "cu_print_express_remark" : {"on" : 1, "off" : 0, "label" : "客户单号打印到运单备注", "span" : ""},
   "main_plural_thermometer" : {"on" : 1, "off" : 0, "label" : "支持主副温度计", "span" : " "},  
   "connect_verify" : {"on" : 1, "off" : 0, "label" : "上传客户交接单", "span" : " "},  
   "write_temp_switch" : {"on" : 1, "off" : 0, "label" : "取派件填写开启关闭温度", "span" : " "},  
   "batch_delivery_switch" : {"on" : 1, "off" : 0, "label" : "批量派件", "span" : " "},
   "cpc_not_use_ssexpress" : {"on" : 1, "off" : 0, "label" : "不使用生生签收单据", "span" : " "},
   "cpc_use_customer_express" : {"on" : 1, "off" : 0, "label" : "使用客户签收单据", "span" : " "}
  }

TMS_PROJECT_CONFIG
  {
    "pickup_collect_note_switch" : {"on" : 1, "off" : 0, "label" : "取件给收件方发送短信", "span" : " "},  
    "pickup_client_mail_switch" : {"on" : 1, "off" : 0, "label" : "取件给客户发送邮件", "span" : " "}, 
    "note_code_switch" : {"on" : 1, "off" : 0, "label" : "派件验证码校验", "span" : " "}, 
    "cpc_send_message_add_customer" : {"on" : 1, "off" : 0, "label" : " 取派短信发送项目人员信息", "span" : ""},
    "send_code_verify" : {"on" : 1, "off" : 0, "label" : "到达派件签收码校验", "span" : " "},  
    "connect_verify" : {"on" : 1, "off" : 0, "label" : "上传客户交接单", "span" : " "},  
    "batch_delivery_switch" : {"on" : 1, "off" : 0, "label" : "批量派件", "span" : " "},
    "cpc_not_use_ssexpress" : {"on" : 1, "off" : 0, "label" : "不使用生生签收单据", "span" : " "},
   "cpc_use_customer_express" : {"on" : 1, "off" : 0, "label" : "使用客户签收单据", "span" : " "}
  }

系统添加供应商加不了了，选择供应商主体之后银行账号和收款人信息出不来
fixbug_9142_csl_20230620 tms_admin
http://project.ashsh.com.cn/index.php?m=bug&f=view&id=9142 


路由列表 站点筛选框组件优化
feature_13832_csl_20230621 dispath_admin

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13832



 
诺和 导出 优化
feature_13834_csl_20230621  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13834


路由站点停运 提示 文案添加链接跳转
feature_13840_csl_20230625 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13840 已上线




路由站点地址调整
feature_13861_csl_20230627 tms_admin
feature_13861_csl_20230626 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13861 已上线

php yii history-data/station-data


换箱时效配置
feature_13933_csl_20230627 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13933 已上线

php yii history-data/boxchange-data

CREATE TABLE `tms_boxchange_aging` (
 `tba_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货id',
  `sto_name` char(32) NOT NULL DEFAULT '' COMMENT '存货名称',
  `aging_num` int(11) NOT NULL DEFAULT '0' COMMENT '时效',
  `send_day` varchar(100) NOT NULL DEFAULT '' COMMENT '派件时间',
  `send_day_remark` varchar(500) NOT NULL DEFAULT '' COMMENT '派件时间节点文案',
  `tba_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2停用',
  `tba_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tba_id`),
  KEY `idx_sto_id` (`sto_id`)
) COMMENT='换箱时效配置';


CREATE TABLE `tms_boxchange_temp` (
  `tbt_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tba_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货id',
  `tem_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '温度id',
  `tem_name` varchar(50) NOT NULL DEFAULT '' COMMENT '温度区间',
  `tbt_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tbt_id`),
  KEY `idx_tem_id` (`tem_id`),
  KEY `idx_tba_id` (`tba_id`)
) COMMENT='换箱时效温度配置';



异常坐标地址优化
feature_13938_csl_20230628 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13938 已上线


质量管控点不合格提醒-tms端
feature_13864_csl_20230628
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13864 未上线


车辆管理3.2：车辆租赁信息调整
feature_13978_csl_20230629  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=13978 已上线



获取物流供应商启用数据   0703
feature_14007_csl_20230630  tms_service
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14007 未上线

无重大BUG发生
严格执行规范


1.物流供应商主体调整  
2.oms获取箱型配置信息接口
3.订单确认、复核：识别温度计提醒
4.差旅管家2.1：出差单关联运单费用报销
5.差旅管家2.1：出差单专人专车里程申报
6.订单附属信息表新增 是否签收反馈 和是否温度反馈 标识
7.TMS迁移不使用生生签收单据与使用客户签收单据配置项
8.路由站点地址调整
9.换箱时效配置
10.质量管控点不合格提醒-tms端
11.车辆管理3.2：车辆租赁信息调整



历史站点错误数据修改（审批编号ITSJ202307030002） 0703




SELECT
  ro.ro_id AS '路由id',
  ro.ro_name AS '路由名称',
  rt.rt_name AS '路由类型',
  ro.start_region_name AS '出港城市',
  start_ts.ts_name AS '出港站点',
  ro.start_ts_id AS '出港站点id',
  ro.stop_region_name AS '到港城市',
  stop_ts.ts_name AS '到港站点',
  ro.stop_ts_id AS '到港站点id',(
  CASE
      ro.ro_status 
      WHEN 0 THEN
      '正常' 
      WHEN 1 THEN
      '停运' 
    END 
    ) AS '路由状态',
    count( tro.ro_id ) AS '供应商数量',
    use_count AS '路由使用次数',
    CONCAT(( rto.con_time * 4 ), '-',(( rto.con_time * 4 )+ 4 ), '小时' ) AS '路由时效',
    CONCAT(
      transport_price,(
      CASE
          ro.units_type 
          WHEN 1 THEN
          '元/千克' 
          WHEN 2 THEN
          '元/件' 
        END 
        )) AS '路由成本',
      ts.tms_sup_name AS '承运商名称',(
  CASE
      ts.tms_sup_monjs
      WHEN 1 THEN
      '月结' 
      WHEN 2 THEN
      '日结' 
    END 
    ) AS '承运商结算类型'

    FROM
      `route` AS ro
      LEFT JOIN route_type AS rt ON ro.rt_id = rt.rt_id
      LEFT JOIN transport_stations AS start_ts ON ro.start_ts_id = start_ts.ts_id
      LEFT JOIN transport_stations AS stop_ts ON ro.stop_ts_id = stop_ts.ts_id
      LEFT JOIN ( SELECT * FROM tms_supplier_route WHERE tsr_visible = 1 OR tsr_visible IS NULL ) AS tro ON ro.ro_id = tro.ro_id
      LEFT JOIN ro_time AS rto ON rto.ro_id = ro.ro_id 
      LEFT JOIN tms_supplier AS ts ON ro.su_id = ts.tms_sup_id
    WHERE
      ro.ro_visible = 1 
  GROUP BY
  ro.ro_id;

导出路由数据  20230705

app和oms派件时间限制
feature_14107_csl_20230706  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14107 未上线



特殊收费优化
feature_14136_csl_20230707  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14136 已上线


差旅管家2.2：出差申请和报销优化
feature_14150_csl_20230710 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=14150 已上线

ALTER table tms_travel add COLUMN `tt_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '出差单类型 1 业务出差 2 公务出差';


 派件、反馈操作按钮限制
 feature_14208_csl_20230711 tms_admin
 http://project.ashsh.com.cn/index.php?m=task&f=view&id=14208 已上线



路由推荐应用2.2 ：推荐路由批量导入
feature_14228_csl_20230712 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14228  已上线

{tms_admin}history-data/route-data


  日喀则市-日喀则市-大巴


  郑州市-无锡市-中铁

14302 车辆租赁增加宴嘉=
feature_14302_csl_20230717   tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=14302 已上线



alter table
  route
add
  column `shipping_rules` tinyint(4) NOT NULL DEFAULT '1' COMMENT '发运规则 1无限制 2按星期 3按日期 4 手动选择',
add
  column `shipping_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发运时间 1周一 2周二 3周三 4周四 5周五 6周六 7周日 8单日发运 9双日发运';



ice_aging


ALTER table tms_customer_config add COLUMN `ice_aging_status` tinyint(3)  NOT NULL DEFAULT '0' COMMENT '不需要换冰排时效监控  0不勾选  1勾选';

ALTER table tms_project_config add COLUMN `ice_aging_status` tinyint(3)  NOT NULL DEFAULT '0' COMMENT '不需要换冰排时效监控  0不勾选  1勾选';

'ice_aging_status' => ['on' => 1, 'off' => 0, 'label' => '不需要换冰排时效监控', 'span' => ' '],  

update tms_customer_config set ice_aging_status=1 where cu_id = '201900337';
update tms_customer_config set ice_aging_status=1 where cu_id = '202000180';

//物流系统，客户项目特殊配置
TMS_CUSTOMER_CONFIG
 {
  "tcc_dwt_shutdown_verify" : {"on" : 1, "off" : 0, "label" : "鼎为关机验证", "span" : ""},
   "cu_piece_feedback" : {"on" : 1, "off" : 2, "label" : "签收自动反馈", "span" : "（派件1小时后自动邮件签收反馈）"}, 
   "cu_temperature_feedback" : {"on" : 1, "off" : 2, "label" : "温度自动反馈", "span" : "（每晚8点自动邮件温度数据反馈）"},
   "cu_temperature_type" : {"on" : 1, "off" : 2, "label" : "支持批量上传温度数据", "span" : "（默认客户支持批量上传温度数据）"},
   "cu_tengsen_trmperature" : {"on" : 1, "off" : 2, "label" : "不支持批量上传滕森温度数据", "span" : "（默认客户支持上传）"},
   "cu_sign_feedback" : {"on" : 1, "off" : 2, "label" : "代签短信提醒", "span" : ""},
   "cu_goods_print" : {"on" : 1, "off" : 0, "label" : "打印运单时将货物名称打印在运单上", "span" : ""},
   "cu_send_message" : {"on" : 0, "off" : 1, "label" : "不发送取派短信", "span" : "（配置后不给收发件人发送取派短信）"},
   "cu_print_express_remark" : {"on" : 1, "off" : 0, "label" : "客户单号打印到运单备注", "span" : ""},
   "main_plural_thermometer" : {"on" : 1, "off" : 0, "label" : "支持主副温度计", "span" : " "},  
   "connect_verify" : {"on" : 1, "off" : 0, "label" : "上传客户交接单", "span" : " "},  
   "write_temp_switch" : {"on" : 1, "off" : 0, "label" : "取派件填写开启关闭温度", "span" : " "},  
   "batch_delivery_switch" : {"on" : 1, "off" : 0, "label" : "批量派件", "span" : " "},
   "cpc_not_use_ssexpress" : {"on" : 1, "off" : 0, "label" : "不使用生生签收单据", "span" : " "},
   "cpc_use_customer_express" : {"on" : 1, "off" : 0, "label" : "使用客户签收单据", "span" : " "},
    "ice_aging_status" : {"on" : 1, "off" : 0, "label" : "不需要换冰排时效监控", "span" : " ","disabled_ids":"201900337,202000180"}
  }

TMS_PROJECT_CONFIG
  {
    "pickup_collect_note_switch" : {"on" : 1, "off" : 0, "label" : "取件给收件方发送短信", "span" : " "},  
    "pickup_client_mail_switch" : {"on" : 1, "off" : 0, "label" : "取件给客户发送邮件", "span" : " "}, 
    "note_code_switch" : {"on" : 1, "off" : 0, "label" : "派件验证码校验", "span" : " "}, 
    "cpc_send_message_add_customer" : {"on" : 1, "off" : 0, "label" : " 取派短信发送项目人员信息", "span" : ""},
    "send_code_verify" : {"on" : 1, "off" : 0, "label" : "到达派件签收码校验", "span" : " "},  
    "connect_verify" : {"on" : 1, "off" : 0, "label" : "上传客户交接单", "span" : " "},  
    "batch_delivery_switch" : {"on" : 1, "off" : 0, "label" : "批量派件", "span" : " "},
    "cpc_not_use_ssexpress" : {"on" : 1, "off" : 0, "label" : "不使用生生签收单据", "span" : " "},
   "cpc_use_customer_express" : {"on" : 1, "off" : 0, "label" : "使用客户签收单据", "span" : " "},
   "ice_aging_status" : {"on" : 1, "off" : 0, "label" : "不需要换冰排时效监控", "span" : " "}
  }


异常坐标地址 修改时把cu_id给算法
feature_14357_csl_20230720 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14357 未上线


大件发货页面优化调整
feature_14347_csl_20230720  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14347 已上线（优化查询）



路由添加修改优化
feature_14388_csl_20230721  tms_admin
feature_14388_csl_20230721  dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14388  已上线



// 路由发运规则设置
// feature_14303_csl_20230717  dispath_admin
// http://project.ashsh.com.cn/index.php?m=task&f=view&id=14303  未上线

路由推荐应用2.3：路由发运规则设置
feature_14399_csl_20230724 dispath_admin
feature_14399_csl_20230727 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&id=14399  未上线

// alter table
//   route
// add
//   column `shipping_rules` tinyint(4) NOT NULL DEFAULT '1' COMMENT '发运规则 1无限制 2按星期 3按日期 4 手动选择',
// add
//   column `shipping_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发运时间 1周一 2周二 3周三 4周四 5周五 6周六 7周日 8单日发运 9双日发运';



CREATE TABLE `tms_routerules_restrict` (
  `rr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ro_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '路由id',
  `months` varchar(50) NOT NULL DEFAULT '' COMMENT '月份 1、1月 2、2月.. 多个用逗号隔开',
  `weeks` varchar(50) NOT NULL DEFAULT '' COMMENT '星期 1、星期一 2、星期二 ..多个用逗号隔开',
  `tag_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '标签id',
  `tag_names` varchar(500) NOT NULL DEFAULT '' COMMENT '标签名称',
  `shipping_rules` tinyint(4) NOT NULL DEFAULT '0' COMMENT '时间限制 1按月份 2按星期',
  `insure_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '保价 0无  1 大于300万',
  `drikold_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否干冰 0 否 1是',
  `sto_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '箱型ids',
  `sto_names` varchar(500) NOT NULL DEFAULT '' COMMENT '箱型名称',
  `cp_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '项目ids',
  `cp_names` text COMMENT '项目名称',
  `rr_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`rr_id`),
  KEY `idx_ro_id` (`ro_id`)
) COMMENT='路由发运规则设置';



        $('.demo').fSelect({
            placeholder: '请选择标签',
            numDisplayed: 10,
            overflowText: '{n} selected',
            noResultsText: 'No results found',
            searchText: 'Search',
            showSearch: true
        });

诺和关联表优化
feature_14442_csl_20230725 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14442  已上线

223430 ->225860  stock sto_id 测试环境


车辆类型新增 小型普通货车
feature_14458_csl_20230726  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14458 已上线



订单详情，绑定车辆功能调整
feature_14476_csl_20230728 tms_admin
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14476 已上线

北森出差单 删除 状态 同步
feature_14559_csl_20230801 tms_admin
feature_14559_csl_20230801 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14559  已上线

ALTER table tms_travel add COLUMN serial_number  varchar(100)  not null  DEFAULT '' COMMENT '北森 SerialNumber 字段';



1.里程申报数据同步  已上线
2.oms派件时间限制   已上线
3.特殊收费优化    已上线
4.差旅管家2.2：出差申请和报销优化      已上线
5.派件、反馈操作按钮限制               已上线
6.路由推荐应用2.2 ：推荐路由批量导入   已上线
7.车辆租赁增加宴嘉           已上线
8.不允许中途私自换冰排 配置   已上线
9.大件发货页面优化调整       已上线
10.路由添加修改优化                   已上线
11.路由推荐应用2.3：路由发运规则设置   已上线
12.诺和关联表导出优化                 已上线
13.车辆类型新增 小型普通货车          已上线
14.订单详情，绑定车辆功能调整         已上线



车辆管理4.0：车辆信息拓展 （第一版）  油耗
feature_14584_csl_20230801 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14584 未上线

CREATE TABLE `tms_car_info` (
  `tci_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '车辆id',
  `hundred_fuel` int(11) NOT NULL DEFAULT '0' COMMENT '官方百公里油耗',
  `kilometer_num` int(11)  NOT NULL DEFAULT '0' COMMENT '满油/电 可行驶公里数',
  `first_kilometer_num` int(11)  NOT NULL DEFAULT '0' COMMENT '首保公里数',
  `maintainance_num` int(11)  NOT NULL DEFAULT '0' COMMENT '保养公里数',
  `maintainance_cycle` int(11)  NOT NULL DEFAULT '0' COMMENT '保养周期 天',
  `tank_num` int(11) NOT NULL DEFAULT '0' COMMENT '油箱大小',
  `tci_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tci_id`),
  KEY `idx_ca_id` (`ca_id`)
) COMMENT='车辆信息附属表';



出差单绑定单号 限制 放开
feature_14613_csl_20230802 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14613 已上线


AMS 获取使用中的 供应商 接口
feature_14624_csl_20230803 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14624 已上线


车辆管理4.0：车辆信息拓展  违章

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14585  未上线


发运规则配置优化
feature_14657_csl_20230804  dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=14657 未上线