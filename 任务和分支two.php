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
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12611 未上线 


ALTER table tms_fahuochange_apply add COLUMN tfa_appcause_type  tinyint(4)  not null  DEFAULT '0' COMMENT 'app提交原因 1 原路由车次停运 2 现结、月结选择错误 3 订单通知修改 4 货到晚了 5 提货提晚了 6 其他' AFTER tfa_handleuid,
add COLUMN tfa_tmsremark  varchar(300)  not null  DEFAULT '' COMMENT '后台处理原因备注' AFTER tfa_handleuid,
add COLUMN tfa_tmscause_type  tinyint(4)  not null  DEFAULT '0' COMMENT '后台处理原因 1 原路由车次停运 2 现结、月结选择错误 3 订单通知修改 4 货到晚了 5 提货提晚了 6 其他' AFTER tfa_handleuid,
 add COLUMN old_ro_id int(11)  not null DEFAULT '0' COMMENT '修改前路由ro_id' AFTER tfa_handleuid,
 add COLUMN new_ro_id int(11)  not null DEFAULT '0' COMMENT '修改后路由ro_id' AFTER tfa_handleuid,
 add COLUMN source tinyint(1)  not null DEFAULT '0' COMMENT '来源 1后台 2 APP' AFTER tfa_handleuid;


ALTER table tms_fahuochange_apply add COLUMN old_departure_trans_time int(11) unsigned DEFAULT '0' COMMENT '修改前路由出港时间';
ALTER table tms_fahuochange_apply add COLUMN new_departure_trans_time int(11) unsigned DEFAULT '0' COMMENT '修改后路由出港时间';
ALTER table tms_fahuochange_apply add COLUMN old_arrive_trans_time int(11) unsigned DEFAULT '0' COMMENT '修改前路由到港时间';
ALTER table tms_fahuochange_apply add COLUMN new_arrive_trans_time int(11) unsigned DEFAULT '0' COMMENT '修改后路由到港时间';

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
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12616  未上线



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
feature_12828_csl_20230425 tms_service
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12828 未上线


路由站点增加停用、启用和批量停用启用
feature_12814_csl_20230425 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12814 未上线



项目立项 人员备案历史数据同步
feature_12866_csl_20230426  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12866 已上线
php yii project-approval/old-cart-person   // 老cart数据同步
php yii project-approval/new-cart-person   // 新cart数据同步


路由批量删除按钮优化
feature_12873_csl_20230426 dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12873  已上线


/mnt/wwwroot/tms_admin_test/tms_admin/protected



客户配置 新增 取派件填写开启关闭温度 配置    未上线
ALTER table tms_customer_config add COLUMN write_temp_switch  tinyint(4)  not null  DEFAULT '0' COMMENT '取派件填写开启关闭温度 1填写 0不填写';
'write_temp_switch' => ['on' => 1, 'off' => 0, 'label' => '取派件填写开启关闭温度', 'span' => ' '],  


路由名称 历史数据处理
feature_12918_csl_20230504 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12918 未上线


HistoryDataController

history-data/route-name

order/ams-eamstatus

/usr/local/php7.1/bin/php /data/mnt/wwwroot/tms_admin_test/tms_admin/yii history-data/route-name


客户配置 和 项目配置 新增批量派件配置
http://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12951  未上线

ALTER table tms_customer_config add COLUMN batch_delivery_switch  tinyint(4)  not null  DEFAULT '0' COMMENT '批量派件 1支持 0不支持';

ALTER table tms_project_config add COLUMN batch_delivery_switch  tinyint(4)  not null  DEFAULT '0' COMMENT '批量派件 1支持 0不支持';

'batch_delivery_switch' => ['on' => 1, 'off' => 0, 'label' => '批量派件', 'span' => ' '],  

'batch_delivery_switch' => ['on' => 1, 'off' => 0, 'label' => '批量派件', 'span' => ' '],  
