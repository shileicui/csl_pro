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
feature_12110_csl_20230323 tms_admin  未上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12110


路由配置管理1.3.1：批量添加供应商，路由审核
feature_12161_csl_20230324 dispath_admin 未上线
feature_12161_csl_20230327 tms_admin 未上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12161


外协费用列表调整
feature_12239_csl_20230329  已上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=12239


冷藏车，增加新的字段

操作站点数据导出

  ALTER table car add COLUMN `car_emission_standard` int(4) NOT NULL DEFAULT '0' COMMENT '排放标准 0暂无',
   add COLUMN `car_ailwaycarriage_model` varchar(255) NOT NULL DEFAULT '' COMMENT '车厢型号和品牌',
   add COLUMN `car_refrigerator_model` varchar(255) NOT NULL DEFAULT '' COMMENT '冷机品牌和型号',
   add COLUMN `car_probe_calibration_date` int(11) NOT NULL DEFAULT '0' COMMENT '易流探头校准日期',
   add COLUMN `car_wintervalidation_date` int(11) NOT NULL DEFAULT '0' COMMENT '冬季验证日期',
   add COLUMN `car_summervalidation_date` int(11) NOT NULL DEFAULT '0' COMMENT '夏季验证日期',
   add COLUMN `car_initialvalidation_date` int(11) NOT NULL DEFAULT '0' COMMENT '初次验证日期';