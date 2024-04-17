<?
供应商主体接口调整
feature_17406_csl_20240102  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17406  已上线


发票归还时间优化
feature_17416_csl_20240102 ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17416  已上线



1.车辆领取归还库存位置更新
2.操作站点设置为停用
3.客户配置、项目配置
4.特殊收费-专人专车冷藏车取派件调整
5.车辆维保 删除，新增、修改页面
6.车辆保养申请 审批状态同步到tms
7.确认维修保养完成页面、同步冷机数据到冷机保养记录
8.干冰液氮台账限制
9.超期未到货数据推送优化
10.集团资产新增、审核优化
11.供应商增加类型及接口
12.采购付款增加结算方式
13.到货管理增加修改
14.采购订单下载优化
15.采购申请创建订单金额计算
16.采购申请、订单公司显示统一
17.采购三单付款优化


外勤操作记录 新增时间限制
feature_17535_csl_20240105 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17535  已上线 

站点分组批量导入
feature_17555_csl_20240105 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17555 已上线


php yii history-data/work-map-data


car_mileage


车辆管理优化
feature_17609_csl_20240109 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17609 已上线


专人专车里程申请 生成规则调整  
feature_17615_csl_20240109  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17615  已上线


发送温度计异常通知时讲消息内容写入数据库中
feature_17623_csl_20240110  
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17623 已上线


创建时间：当前异常数据推送时间
耗材名称：温度计序列号关联耗材名称
明细编号：鼎为推送温度计序列号
异常类型：鼎为推动温度计异常类型
订单编号：鼎为推送温度计序列号当前绑定订单编号
取件城市：当前订单取件城市
派件城市：当前订单派件城市
订单状态：当前订单状态




CREATE TABLE `tms_temperature_abnormal` (
  `tta_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `gd_series_number` varchar(255) NOT NULL DEFAULT '' COMMENT '耗材编号',
  `sto_name` varchar(255) NOT NULL DEFAULT '' COMMENT '耗材名称',
  `tta_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '异常类型 1、校准证书过期 2、离线超时 3、支架故障 4、非最新版本 5、返厂检修 6、待报废 7、隔离待处理 8、联网波动异常 9、频繁重启 10、libero电池监控 11、libero内存重置',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `to_no` char(32) NOT NULL DEFAULT '' COMMENT '订单编号',
  `to_status` tinyint(4) unsigned  NOT NULL DEFAULT '0'  COMMENT '订单状态',
  `start_region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '取件城市id',
  `start_region_name` varchar(255) NOT NULL  DEFAULT '' COMMENT '取件城市',
  `stop_region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '派件城市id',
  `stop_region_name` varchar(255) NOT NULL  DEFAULT '' COMMENT '派件城市',
  `tta_status` tinyint(4) unsigned  NOT NULL DEFAULT '0'  COMMENT '是否处理 0未处理 1已处理',
  `way_status` tinyint(4) unsigned  NOT NULL DEFAULT '0'  COMMENT '处理方式 1、添加备用温度 2、更换温度计 3、安排尽快派件 4、其他',
  `tta_remark` text COMMENT '备注内容',
  `tta_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tta_id`),
  KEY `idx_to_id` (`to_id`),
  KEY `idx_start_region_id` (`start_region_id`),
  KEY `idx_stop_region_id` (`stop_region_id`)
) COMMENT='订单在途异常数据';



订单在途温度计异常列表
feature_17621_csl20240110 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17621  已上线





车辆除霜周期新增1.5H，3.0H，12.0H
fearture_17670_csl_20240111 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17670  已上线



供应商主体新增通过id查数据接口
feature_17694_csl_20240111  ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17694 未上线


发货记录新增大区筛选
feature_17734_csl_20240112  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17734 已上线



车辆管理优化
feature_17788_csl_20240112 tms_admin 
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17788 已上线



暂估税额 = 暂估含税金额*税率



加油记录删除限制
feature_17841_csl_20240116 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17841  已上线


车辆维保新增工作城市、车辆管理员
feature_17852_csl_20240116  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17852 已上线



项目配置-新增温度绑定配置
feature_17866_csl_20240117 tms_admin
feature_17866_csl_20240117 ams_service
feature_17866_csl_20240122 tms_serviec
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17866 未上线


CREATE TABLE `tms_project_config_temp` (
  `tpct_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cp_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `tpct_sto_id` int(11) NOT NULL DEFAULT '0' COMMENT '温度计耗材id',
  `tpct_sto_name` varchar(255) NOT NULL DEFAULT '' COMMENT '温度计耗材名称',
  `tpct_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tpct_id`),
  KEY `idx_tpct_sto_id` (`tpct_sto_id`) USING BTREE COMMENT '温度计耗材id',
  KEY `idx_cp_id` (`cp_id`) USING BTREE COMMENT '项目id'
)  COMMENT='温度计绑定限制配置';



出纳付款确认、财务入账确认、下载账单


 alter table car_repair modify column `desc` text COMMENT '备注';


车辆维保申请，修改，完成、详情，增加备注，不必填
车辆管理
车辆维保、月结记录 新增修改按钮

车辆维保 维保完成后，月结记录复核之前  支持修改数据

180800


zzp 自己上线
// ALTER table tms_project_config add COLUMN high_speed_status tinyint(4)  not null  DEFAULT '0' COMMENT '不可以高铁押运 1不可以 0可以';
,
    "high_speed_status": {
        "on": 1,
        "off": 0,
        "label": "不可以高铁押运",
        "span": " "
    }



校准返修界面增加附件查看功能
feature_17921_csl_20240122 ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17921  已上线



采购订单关闭增加附件
feature_17861_csl_20240122 ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17861 已上线




到货管理增加发货和采购订单状态查询
feature_17686_csl_20240103   ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17686 已上线



车辆管理v4.3：车辆维修保养免费支持
feature_17960_csl_20240124 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=17960 未上线





路由新增限制
feature_17989_csl_20240124 dispath_admin
feature_17989_csl_20240124 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17989  已上线



相同路由名称、路由站点、路由类型、承运商



update car_repair set maintain_type=1 where cr_id=7460;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7460, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202401240005', 1706236482, 1, 0)



耗材列表修改增加温度计类型
feature_17649_csl_20240129 ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17649  已上线



油卡增加所属公司字段，在公司列表里面选择
feature_18062_csl_20240130        tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=18062   已上线



alter table
  tms_car_certificate
add
  column `company_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属公司id',
add
  column `company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '所属公司名称';




采购申请自行采购不创建采购订单
feature_17706_csl_20240130  ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=17706 已上线


alter table
  procurement_approval
add
  column `since_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否自行采购 0否 1是';



Qq111111.



            //过滤掉自行采购 的数据（自行采购的不需要创建采购订单）
            $purchaseApplyDetail = self::getIsCgData($purchaseApplyDetail);
    /**
     * 过滤掉自行采购
     * @param $purchaseApplyDetail
     * @author csl
     * @Date 2024/1/30 16:41
     */
    public static function getIsCgData($purchaseApplyDetail){

        $list = [];
        foreach ($purchaseApplyDetail as $item) {
            if($item['since_status'] == 1){
                continue;
            }
            $list[] = $item;
        }

        return $list;
    }


到货不入库订单，限制到货日期不能修改
feature_18086_csl_20240131  ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=18086 已上线


定时任务批量停运失败
fixbug_10970_csl_20240201  tms_admin
https://project.ashsh.com.cn/index.php?m=bug&f=view&id=10970




采购订单台账下载
feature_18123_csl_20240202  ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18123  已上线



7406




update car_repair set maintain_type=1 where cr_id=7406;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7406, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0);




鲁A59H0H

update car_repair set maintain_type=1 where cr_id=7049;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7049, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)



陕U653R9

7458

update car_repair set maintain_type=1 where cr_id=7458;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7458, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)



鲁A23A3A

7311

update car_repair set maintain_type=1 where cr_id=7311;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7311, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)




豫VPM032


7400

update car_repair set maintain_type=1 where cr_id=7400;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7400, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)

辽A3Y21W	

7452

update car_repair set maintain_type=1 where cr_id=7452;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7452, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)



川A7M0W5	


7180


update car_repair set maintain_type=1 where cr_id=7180;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7180, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)


豫VP1D38


7401

update car_repair set maintain_type=1 where cr_id=7401;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7401, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)

陕U653R9


7458

update car_repair set maintain_type=1 where cr_id=7458;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7458, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)

苏A07PR6	
7457

update car_repair set maintain_type=1 where cr_id=7457;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7457, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)


浙AE67E0	
7346



update car_repair set maintain_type=1 where cr_id=7346;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7346, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)



辽A7CZ22


7463


update car_repair set maintain_type=1 where cr_id=7463;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7463, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)

蒙A436ME	

7396

update car_repair set maintain_type=1 where cr_id=7396;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7396, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)


沪BNR361	

2936

update car_repair set maintain_type=1 where cr_id=2936;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',2936, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)


鲁AH3M14	


7340

update car_repair set maintain_type=1 where cr_id=7340;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7340, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)

鲁A59H0H	

7049


update car_repair set maintain_type=1 where cr_id=7049;
INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7049, 0, '系统', 0, 'IT协助修改车辆维保类型：常规保养   审批单号：ITSJ202402020001', 1707014833, 1, 0)


外协订单通知短信文案调整
feature_18142_csl_20230219  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=18142 已上线

alter table
  tms_city_config
add
  column `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '紧急电话';




采购对账发起付款审批，合同附件去重
feature_18096_csl_20240220  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18096  已上线


车辆维保申请上次维保日期+上次维保里程取值优化
fixbug_11022_csl_20240221  tms_admin
https://project.ashsh.com.cn/index.php?m=bug&f=view&bugID=11022 已上线


供应商主体 调整
feature_18255_csl_20240221   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18255   已上线



alter table
  tms_supplier_main
add
  column `company_type` int(4) NOT NULL DEFAULT '0'  COMMENT '公司类型 1企事业单位,2个人,3海外公司,4其他特殊单位';




操作端APP，问题反馈 后台页面  （线上放 运营监控 测试环境 放 监控管理 菜单）
feature_18283_csl_20240222  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18283 未上线



供应商修改 调整
feature_18366_csl_20240227  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18366   已上线





车辆属性调整
feature_18134_csl_20240201  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=18134   未上线(发过一个版本)

alter table
  car
add
  column `car_use_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '车辆用途 1、客运 2、货运 3、行政用车',
ADD
  INDEX idx_region_id (`region_id`),
ADD
  INDEX idx_car_region_city (`car_region_city`);



ALTER TABLE `tms_car_yearcheck` ADD INDEX idx_yearcheck_time ( `yearcheck_time` ), ADD INDEX idx_next_yearcheck_time ( `next_yearcheck_time` );

ALTER TABLE `tms_car_refrigerator` ADD INDEX idx_ca_id ( `ca_id` ), ADD INDEX idx_upkeep_hour ( `upkeep_hour` ), ADD INDEX idx_upkeep_time ( `upkeep_time` );

ALTER TABLE `tms_car_info` ADD INDEX idx_renewal_premium_hour ( `renewal_premium_hour` ), ADD INDEX idx_vice_renewal_premium_hour ( `vice_renewal_premium_hour` );

ALTER TABLE `tms_car_repair_detail` ADD INDEX idx_tcr_id ( `tcr_id` ), ADD INDEX idx_tcrd_ca_id ( `tcrd_ca_id` );


//脚本
php yii history-data/car-upd-data



,,,,,,,沪ETU618



https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=52af3331-ed9c-44d0-8cab-90d89f3c3f3b


冷藏车异常监控 推送
feature_18591_csl_20240306   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18591  已上线



车辆管理v4.5：车辆提醒汇总管理
feature_18621_csl_20240308  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18621  已上线

alter table
  car
add
  column  `cr_id` int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '上次保养cr_id',
add
  column  `car_ci_id` int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '上次保险ci_id',
add
  column  `car_subordinate_id` int(11) unsigned  NOT NULL DEFAULT '0' COMMENT '车辆所属公司id（IT系统）';

php yii history-data/car-company

php yii timing-push/car-remind-data



取派件时间补录
feature_18656_csl_20240311   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18656  未上线(20240402  第四版)

// ALTER TABLE `carea` ADD INDEX idx_tcr_id ( `tcr_id` ), ADD INDEX idx_tcrd_ca_id ( `tcrd_ca_id` );

alter table
  carea
add
  column  `order_carea_uid` varchar(255) NOT NULL DEFAULT '' COMMENT '订单大区负责人ID',
add
  column  `order_carea_username` varchar(255) NOT NULL DEFAULT '' COMMENT '订单大区负责人';


  car-insurance


车辆维修保养管理：新增修改维保增加供应商
feature_18737_csl_20240314   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18737   已上线


路由锁定 优化
feature_18757_csl_20240315  dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18757  已上线




资产系统供应管理逻辑调整
feature_18759_csl_20240318 ams_admin

feature_18759_csl_20240325 ams_service


https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18759  未上线

// suppliers/main/index   原

tms_supplier
ams_supplier_main
tms_supplier_main
tms_supplier_quotation_change

// suppliers/main/list

//天眼查key  ams_admin
define('TIAN_YAN_CHA_KEY','db44cb06-bb48-41ee-9086-92ec6423a7d0');

//大数据接口   ams_service
defined('BIG_DATA_DOMAIN') or define('BIG_DATA_DOMAIN','http://foreign.ashsh.com.cn');//上线注意

//处理物流供应商历史数据
php yii history-data/supplier-data

//资产供应商主体 账户信息数据处理 
php yii history-data/gong-ams

//物流供应商主体 账户信息数据处理 
php yii history-data/gong-tms

//资产供应商主体历史数据同步大数据
php yii history-data/push-big-data


供应商主体数据合并
feature_18808_csl_20240329 dispath_admin

feature_18808_csl_20240319  tms_admin

feature_18808_csl_20240327   tms_service

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18808   未上线


alter table
  ams_supplier_main
add
  column  `firm_nature` tinyint(4) NOT NULL DEFAULT '0'  COMMENT '企业性质 1、外资 2、合资 3、私营',
add
  column  `company_types` varchar(255) NOT NULL DEFAULT ''  COMMENT '所属公司 1集团 2、生生 3、国际 4、元廷',
add
  column  `supplier_tag` varchar(255) NOT NULL DEFAULT ''  COMMENT '供应商性质：1、运营类供应商 2、采购中心供应商',
add
  column  `sex_status` tinyint(4) NOT NULL DEFAULT '0'   COMMENT '性别：1、男 2、女',
add
  column  `asm_job` varchar(255) NOT NULL DEFAULT ''   COMMENT '职务：本文输入，必填',
add
  column  `legal_person` varchar(255) NOT NULL DEFAULT ''   COMMENT '法人：本文输入，必填',
add
  column  `standing_number` varchar(255) NOT NULL DEFAULT ''   COMMENT '法人身份证：文本输入，18位，必填',
add
  column  `company_time` varchar(50) NOT NULL DEFAULT ''  COMMENT '公司成立时间',
add
  column  `credit_level` tinyint(4) NOT NULL DEFAULT '0'  COMMENT '信用等级：1、AA 2、AA 3、A、三个等级',
add
  column  `registered_capital` int(11) unsigned NOT NULL DEFAULT '0'  COMMENT '注册资金：文本输入',
add
  column  `mail_address` varchar(255) NOT NULL DEFAULT ''  COMMENT '邮箱地址：文本输入，必填',
add
  column  `nation_name` varchar(50) NOT NULL DEFAULT ''  COMMENT '所属国家',
add
  column  `service_field` varchar(100) NOT NULL DEFAULT ''  COMMENT '服务领域：文本输入',
add
  column  `landline` varchar(100) NOT NULL DEFAULT ''  COMMENT '座机：文本输入',
add
  column  `fax` varchar(100) NOT NULL DEFAULT ''  COMMENT '传真：文本输入',
add
  column  `license_atids` varchar(100) NOT NULL DEFAULT ''  COMMENT '营业执照：附件上传ids',
add
  column  `certificate_start_time` int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '证件有效期开始',
add
  column  `certificate_end_time` int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '证件有效期结束',
add
  column  `main_business` varchar(255) NOT NULL DEFAULT ''   COMMENT '主营业务：文本输入',
add
  column  `unique_number` varchar(50) NOT NULL DEFAULT ''   COMMENT 'Ecology参数:unique_number',
add
  column  `request_id` varchar(50) NOT NULL DEFAULT ''   COMMENT 'Ecology参数:request_id',
add
  column  `workflow_number` varchar(50) NOT NULL DEFAULT ''   COMMENT 'Ecology参数:workflow_number',
add
  column  `supplier_name` varchar(50) NOT NULL DEFAULT ''   COMMENT '简称',
add
  column  `business_type` tinyint(4) NOT NULL DEFAULT '0'   COMMENT '行业类别 1、互联网/软件/电子 2、金融/银行/投资 3、制造/生产加工 4、媒体/广告/咨询 5、教育/培训科研 6、服务/酒店/旅游 7、建筑/房地产/物业 8、医疗/健康保健 9、零售/批发/贸易 10、交通/运输/物流 ',
add
  column `expense_json_data` text COMMENT '泛微流程存储数据',
add
  column  `created_name` varchar(25) NOT NULL DEFAULT '' COMMENT '创建人名称',
add
  column `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id';


CREATE TABLE `ams_supplier_main_account` (
  `asma_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `asm_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商主体id',
  `account_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '账户类型 1、主账户 2、副账户',
  `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '开户行名称',
  `bank_account` varchar(100) NOT NULL DEFAULT '' COMMENT '开户行账号',
  `asma_remark` text COMMENT '备注内容',
  `asma_status` tinyint(4) NOT NULL  DEFAULT '1' COMMENT '使用状态 1 正常 2 停用',
  `asma_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`asma_id`),
  KEY `idx_asm_id` (`asm_id`)
)COMMENT='供应商主体账户信息';

CREATE TABLE `ams_supplier_main_qualification` (
  `asmq_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `asm_id` int(11) NOT NULL DEFAULT '0' COMMENT '供应商主体id',
  `asmq_name` varchar(100) NOT NULL DEFAULT '' COMMENT '资质名称',
  `effective_start_time` int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '资质有效期开始',
  `effective_end_time` int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '资质有效期结束',
  `asmq_atids` varchar(255) NOT NULL DEFAULT ''  COMMENT '资质证件 atids',
  `asmq_remark` text COMMENT '备注内容',
  `asmq_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`asmq_id`),
  KEY `idx_asm_id` (`asm_id`)
  )COMMENT='供应商主体资质信息';


alter table
  tms_supplier
add
  column  `asm_id`  int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '资产供应商主体id',
add
  column  `asma_id`  int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '资产供应商主体银行账户id',
add
  column  `asm_name`  varchar(50) NOT NULL DEFAULT ''   COMMENT '资产供应商主体名称';


alter table
  tms_supplier_quotation_change
add
  column  `asm_id`  int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '资产供应商主体id',
add
  column  `asm_name`  varchar(50) NOT NULL DEFAULT ''   COMMENT '资产供应商主体名称';



alter table
  tms_supplier_main
add
  column  `asm_id`  int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '资产供应商主体id',
add
  column  `asma_id`  int(11) unsigned NOT NULL DEFAULT '0'   COMMENT '资产供应商主体银行账户id';




//20240401


alter table
  ams_supplier_main
add
   column  `stair_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '供应商一级分类';


INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('22','行政用品类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('23','临床耗材类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('24','虫害服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('25','计算机系统');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('26','软件服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('27','校准验证服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('28','保险服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('29','租赁服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('30','中介服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('31','销毁服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('32','冷藏车辆采购');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('33','车辆采购（非温控要求）');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('34','制冷设备');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('35','温度监控设备');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('36','临床相关包装设备类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('37','常规设备');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('38','总部大楼建设类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('39','冷库基建');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('40','基础基建');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('41','冷藏车辆维保');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('42','冷库维保');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('43','基建维保（非温控要求）');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('44','临时供应商');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('45','运力服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('46','检测服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('47','差旅服务类');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('48','包装箱及冰排');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('49','液氮供应商');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('50','设施设备维保');
INSERT INTO `supplier_type` (`st_id`, `st_name`) VALUES ('51','保险服务类');

update supplier_type set st_name='轻型车辆维保' where st_id=20;
update supplier_type set st_name='冷机维保' where st_id=21;


// 供应商名称：文本输入、必填
// 统一社会信用代码：文本输入，必填
// 供应商分级：可选择A、B、C，必填
// 企业性质：可选择外资、合资、私营，必填
// 供应商类型：可选择干冰、物资、服务、耗材、设备、工程、车辆维保、车辆冷机维保供应商、一般供应商、承运商，必填
// 所属公司：可选择集团、生生、国际、元廷，必填，支持多选
// 供应商标签：可选择物流、资产、其他，必填，支持多选
// 姓名：文本输入，必填
// 性别：可选择男、女，必填
// 职务：本文输入，必填
// 手机号：允许输入11位数字，必填
// 邮箱地址：文本输入（做邮箱验证匹配）
// 法人：文本输入，必填
// 法人身份证：文本输入，18位，必填
// 公司成立时间：日期选择，必填
// 信用等级：可选择A、AA、AAA、三个等级
// 注册资金：文本输入
// 工商注册地址：文本输入，必填
// 所属国家：国家选择，支持搜索的选择框（方便的话中国放第一个），必填
// 所属城市：支持搜索的城市选择框，必填
// 行业类别：文本输入
// 服务领域：文本输入
// 座机：文本输入
// 传真：文本输入
// 营业执照：附件上传，必填
// 证件有效期起：日期选择框，必填
// 证件有效期止：日期选择框，必填
// 主营业务：文本输入
// 开户行：文本输入，必填
// 开户行账号：文本输入，必填
// 资质名称：文本输入
// 资质有效期起：日期选择
// 资质有效期止：日期选择
// 资质附件：上传附件，单个
// 备注：文本输入

// CREATE TABLE `ams_supplier_main` (
//   `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
//   `name` varchar(50) NOT NULL DEFAULT '' COMMENT '供应商名称',
//   `code` varchar(50) NOT NULL DEFAULT '' COMMENT '供应商代码',
//   `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
//   `region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '城市名称',
//   `usci` varchar(100) NOT NULL DEFAULT '' COMMENT '统一社会信用代码(Unified Social Credit Identifier)',
//   `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '供应商类型：',
//   `person_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人',
//   `person_phone` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人号码',
//   `person_address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人地址',
//   `bank_name` varchar(50) NOT NULL DEFAULT '' COMMENT '开户行名称',
//   `bank_account` varchar(100) NOT NULL DEFAULT '' COMMENT '开户行账号',
//   `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态: 1,正常；2,停用',
//   `category` varchar(50) NOT NULL DEFAULT '' COMMENT '类别',
//   `account_name` varchar(50) NOT NULL DEFAULT '' COMMENT '账户名称',
//   `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '记录是否删除',
//   `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
//   `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录更新时间',
//   PRIMARY KEY (`id`)
// ) ENGINE=InnoDB AUTO_INCREMENT=270 DEFAULT CHARSET=utf8mb4 COMMENT='供应商主记录';


车辆管理v4.5：车辆提醒汇总管理
feature_18621_csl_20240308  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=18621  已上线（新增排序）


{"rule":{"bool":{"must":[{"term":{"template_key":"supplier_access"}},{"term":{"extend_params":"ams"}]}}}



{"rule":{"bool":{"must":[{"term":{"template_key":"supplier_access"}},{"term":{"extend_params":"ams"}}]}}}




出差单优化
feature_19017_csl_20240330  tms_admin
feature_19017_csl_20240401 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19017  未上线

php yii timing-push/add-lc



维修保养优化
feature_19019_csl_20240401  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19019  未上线



供应商管理字段显示优化
feature_19093_csl_20240408  ams_admin
feature_19093_csl_20240408  ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19093  未上线


alter table
  ams_supplier_main
add
  column  `company_profile`  text COMMENT '公司简介 文本输入';

{ams_admin}history-data/upd-gy




 update ams_supplier_main set stair_type=5 where name='上海仁铃汽车销售服务有限公司';
 update ams_supplier_main set stair_type=5 where name='上海菱云汽车销售服务有限公司';
 update ams_supplier_main set stair_type=5 where name='庆铃巨咖（天津）汽车销售有限公司';
 update ams_supplier_main set stair_type=5 where name='天津汇众汽车服务有限公司';
 update ams_supplier_main set stair_type=5 where name='上海膜良汽车服务有限公司';
 update ams_supplier_main set stair_type=5 where name='广州朋行汽车有限公司';
 update ams_supplier_main set stair_type=5 where name='广州市顺福铃汽车有限公司';
 update ams_supplier_main set stair_type=5 where name='北京盛达顺泰汽车配件商店';
 update ams_supplier_main set stair_type=5 where name='广州科亚实业有限公司';
 update ams_supplier_main set stair_type=5 where name='苏州工业园区雷骏汽车维修中心';
 update ams_supplier_main set stair_type=5 where name='洛阳博众汽车维修有限公司';
 update ams_supplier_main set stair_type=5 where name='无锡顺维欣汽车贸易有限公司';


update ams_supplier_main set supplier_tag=2 where supplier_tag='';


出差单获取差旅管家数据接口调整
feature_19158_csl_20240408  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19158   已上线



php yii {tms_admin}history-data/cl-data




操作反馈 后台 支持回复功能
feature_19161_csl_20240409  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19161 未上线



月结路桥费成本线上化
feature_19124_csl_20240408  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19124 未上线


alter table
  tms_refuel_record
add
  column  `trade_type`   varchar(100) NOT NULL DEFAULT ''  COMMENT '交易类型',
add
  column  `unit_price`   varchar(100) NOT NULL DEFAULT ''  COMMENT '单价',
add
  column  `bonus_points`   varchar(100) NOT NULL DEFAULT ''  COMMENT '奖励积分',
add
  column  `balance`   varchar(100) NOT NULL DEFAULT ''  COMMENT '余额',
add
  column  `main_card_number`   varchar(255) NOT NULL DEFAULT ''  COMMENT '主卡号',
add
  column   `deal_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '交易时间',
add
  column   `cardholder_name`   varchar(100) NOT NULL DEFAULT '' COMMENT '持卡人',
add
  column  `payment_company`   varchar(100) NOT NULL DEFAULT ''  COMMENT '付款公司',
add
  column  `provisional_status`    tinyint(4) NOT NULL DEFAULT '1'   COMMENT '暂估状态 1未暂估 2已暂估',
add
  column  `trrb_id` int(11) unsigned NOT NULL DEFAULT '0'  COMMENT '加油记录台账id';



CREATE TABLE `tms_refuel_record_bill` (
  `trrb_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `payment_company` varchar(100) NOT NULL DEFAULT ''  COMMENT '付款公司',
  `trrb_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `trrb_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本',
  `trrb_tax` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '税额',
  `invoice_money` decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '发票金额',
  `invoice_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '发票成本',
  `invoice_tax`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '发票税额',
  `notarize_month` varchar(30) NOT NULL DEFAULT '' COMMENT '确认月份',
  `provisional_month` varchar(30) NOT NULL DEFAULT '' COMMENT '暂估月份',
  `bill_status`  tinyint(4) NOT NULL DEFAULT '2'   COMMENT '暂估状态 2 已暂估 3 已入账',
  `trrb_remark` text COMMENT '备注内容',
  `trrb_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`trrb_id`)
  )COMMENT='加油记录台账';





CREATE TABLE `tms_road_record` (
  `trr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `serial_number` varchar(100) NOT NULL DEFAULT ''  COMMENT '编号',
  `trr_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `trr_car_id` int(11) NOT NULL DEFAULT '0' COMMENT '车辆ID',
  `trr_car_number` varchar(20) NOT NULL DEFAULT '' COMMENT '车牌号',
  `etc_no` varchar(100) NOT NULL DEFAULT ''  COMMENT 'etc 卡号',
  `deal_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属账单日',
  `inbound_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '入站时间',
  `outbound_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '出站时间',
  `inbound_name` varchar(100) NOT NULL DEFAULT ''  COMMENT '入站口',
  `outbound_name` varchar(100) NOT NULL DEFAULT ''  COMMENT '出站口',
  `car_colour` varchar(50) NOT NULL DEFAULT ''  COMMENT '车辆颜色',
  `card_type` varchar(50) NOT NULL DEFAULT ''  COMMENT '卡种',
  `exchange_type` varchar(150) NOT NULL DEFAULT ''  COMMENT '交易类型',
  `payment_company` varchar(100) NOT NULL DEFAULT ''  COMMENT '付款公司',
  `provisional_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '暂估状态 1未暂估 2已暂估',
  `trr_money_source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '金额数据来源   2.批量导入',
  `trrb_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '路桥费台账id',
  `trr_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`trr_id`),
  KEY `idx_trrb_id` (`trrb_id`)
  )COMMENT='路桥费月结账单';



CREATE TABLE `tms_road_record_bill` (
  `trrb_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `payment_company` varchar(100) NOT NULL DEFAULT ''  COMMENT '付款公司',
  `trrb_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `trrb_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '成本',
  `trrb_tax` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '税额',
  `invoice_money` decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '发票金额',
  `invoice_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '发票成本',
  `invoice_tax`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '发票税额',
  `notarize_month` varchar(30) NOT NULL DEFAULT '' COMMENT '确认月份',
  `provisional_month` varchar(30) NOT NULL DEFAULT '' COMMENT '暂估月份',
  `bill_status`  tinyint(4) NOT NULL DEFAULT '2'   COMMENT '暂估状态 2 已暂估 3 已入账',
  `trrb_remark` text COMMENT '备注内容',
  `trrb_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`trrb_id`)
  )COMMENT='路桥费月结台账';

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=16943 



车辆管理资产同步的数据默认在自营车辆显示
feature_19275_csl_20240416  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19275  已上线