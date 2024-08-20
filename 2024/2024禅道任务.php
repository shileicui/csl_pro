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
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=17694 已上线


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
https://project.ashsh.com.cn/index.php?m=task&f=view&id=17960 已上线





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
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19017  已上线

php yii timing-push/add-lc



维修保养优化
feature_19019_csl_20240401  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19019  已上线



供应商管理字段显示优化
feature_19093_csl_20240408  ams_admin
feature_19093_csl_20240408  ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19093  已上线


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
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19161 已上线



月结路桥费成本线上化
feature_19124_csl_20240408  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19124 已上线


alter table
  tms_refuel_record
add
  column  `trade_type`   varchar(100) NOT NULL DEFAULT ''  COMMENT '交易类型',
add
  column  `unit_price`    decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
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


冷藏车监控调用易流接口调整
feature_19334_csl_20240418 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19334 已上线


供应商管理附件上传优化
feature_19335_csl_20240418   ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19335  已上线


外协操作费用新增提货费提醒
feature_19338_csl_20240418   tms_admin
feature_19338_csl_20240418   omsapi

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19338  已上线


alter table
  tms_outsource_rule_conf
add
  column  `torc_carry_fee`  varchar(50) NOT NULL DEFAULT '' COMMENT '标准提货费';

update tms_outsource_rule_conf set torc_carry_fee=10 where torc_visible=1;

alter table
  tms_operation_feeremind
add
  column  `opn_carry_msg` varchar(255) NOT NULL DEFAULT '' COMMENT '提货费提醒';



仓库工作单v1.1：方案准备增加温度计校准证书
feature_19384_csl_20240423   tms_admin
feature_19384_csl_20240423   tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19384  已上线（等app一起上线）





已确认-已提货




供应商增加个人供应商
feature_19249_csl_20240423  ams_admin
feature_19249_csl_20240423  ams_service

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19249 已上线



cr_type=2 maintain_type=1


月结路桥费成本线上化 路桥费导入去掉所属账单
feature_19415_csl_20240425   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19415  已上线 



车辆维保月结记录界面，增加维修项目显示
feature_19416_csl_20240425    tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19416   已上线

 
alter table
  tms_car_repair_monthlysettlement
add
  column  `tcrm_remark` text COMMENT '备注内容';




ITSJ202404270001

8482


update car_repair set repair_mile=191874,repair_finish_mile=191874 where cr_id=8482

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',8482, 0, '系统', 0, 'IT协助修改  2024年03月12号 保养里程修改为191874公里   审批单号：   
ITSJ202404270001', 1714295383, 13, 0);



ITSJ202404290002

8482

update car_repair set repair_mile=291874,repair_finish_mile=291874 where cr_id=8482

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',8482, 0, '系统', 0, 'IT协助修改  2024年03月12号 保养里程修改为291874公里   审批单号：   
ITSJ202404290002', 1714361442, 13, 0);



供应商管理优化v1
feature_19478_csl_20240429  ams_admin
feature_19478_csl_20240509  ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19478  已上线


alter table
  supplier
add
   column  `su_source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 供应商主体自动创建';


alter table
  tms_supplier
add
   column  `tms_source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 供应商主体自动创建';


alter table
  ams_supplier_main
add 
  column `questionnaire_atids` varchar(100) NOT NULL DEFAULT '' COMMENT '调查问卷：附件上传ids',
add 
  column `site_audit` text COMMENT '现场审核 泛微上传同步的图片地址';




alter table
  ams_supplier_main
add 
  column `site_audit` text COMMENT '现场审核 泛微上传同步的图片地址';


{
    "262001": "营业执照",
    "262002": "资质证件",
    "262003": "调查问卷"
}

{
  "0": "增值税普通发票",
  "1": "增值税专用发票",
  "2": "增值税电子普通发票",
  "5": "增值税电子专用发票",
  "3": "全电票-普通发票",
  "4": "全电票-增值税专用发票"
}



物流日志跟踪 提货时间优化
feature_19494_csl_20240430  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19494  已上线







3013361

update tms_logistics_remark set lr_opn_date=1714375335 where lr_id=6302256;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102002',3013361, 0, '系统', 0, 'IT协助修改    审批单号：   
ITS1202404290002', 1714447621, 13, 0);




ITSJ202404290002


  

沪DYT068在2024年3月12日完成保养，保养里程录入错误，需要进行修改
修改内容  
保养里程修改为291874公里

update car_repair set repair_mile=291874,repair_finish_mile=291874 where cr_id=8482

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',8482, 0, '系统', 0, 'IT协助修改  2024年03月12号 保养里程修改为291874公里   审批单号：   
ITS1202404290002', 1714361442, 13, 0);





2962906
2962898
2969176
2969177


17033090
17033111
17075321
17075335


2976329

17073179


update order_logistics set ol_delivery_person=2793,ol_delivery_name='武威-李席德' where to_id=2962906;
update oms_logistics set ol_delivery_person=2793,ol_delivery_name='武威-李席德' where to_id=2962906;


update order_logistics set ol_delivery_person=2793,ol_delivery_name='武威-李席德' where to_id=2962898;
update oms_logistics set ol_delivery_person=2793,ol_delivery_name='武威-李席德' where to_id=2962898;


update order_logistics set ol_delivery_person=2793,ol_delivery_name='武威-李席德' where to_id=2969176;
update oms_logistics set ol_delivery_person=2793,ol_delivery_name='武威-李席德' where to_id=2969176;


update order_logistics set ol_delivery_person=2793,ol_delivery_name='武威-李席德' where to_id=2969177;
update oms_logistics set ol_delivery_person=2793,ol_delivery_name='武威-李席德' where to_id=2969177;



update opn_operator set user_id=2793,username='武威-李席德' where opnop_id=17033090;

update opn_operator set user_id=2793,username='武威-李席德' where opnop_id=17033111;

update opn_operator set user_id=2793,username='武威-李席德' where opnop_id=17075321;

update opn_operator set user_id=2793,username='武威-李席德' where opnop_id=17075335;



INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102012',2962906, 0, '系统', 0, 'IT协助修改  派件人 员工账号：李席德 改成 外协账号：武威-李席德 审批单号：ITSJ202405080002', 1715564675, 13, 0);

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102012',2962898, 0, '系统', 0, 'IT协助修改  派件人 员工账号：李席德 改成 外协账号：武威-李席德 审批单号：ITSJ202405080002 ', 1715564675, 13, 0);

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102012',2969176, 0, '系统', 0, 'IT协助修改  派件人 员工账号：李席德 改成 外协账号：武威-李席德 审批单号：ITSJ202405080002 ', 1715564675, 13, 0);

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102012',2969177, 0, '系统', 0, 'IT协助修改  派件人 员工账号：李席德 改成 外协账号：武威-李席德 审批单号：ITSJ202405080002 ', 1715564675, 13, 0);


update order_logistics set ol_pickup_person=2793,ol_pickup_name='武威-李席德' where to_id=2976329;
update oms_logistics set ol_pickup_person=2793,ol_pickup_name='武威-李席德' where to_id=2976329;


update opn_operator set user_id=2793,username='武威-李席德' where opnop_id=17073179;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102010',2976329, 0, '系统', 0, 'IT协助修改  取件人 员工账号：李席德 改成 外协账号：武威-李席德 审批单号：ITSJ202405080002 ', 1715564675, 13, 0);





车辆属性调整：将叉车分开管理
feature_19662_csl_20240511  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19662  已上线




月结路桥费成本线上化1.1优化
feature_19697_csl_20230513  tms_admin
feature_19697_csl_20230513  dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19697  未上线


alter table
  tms_road_record
add
  column  `reconciliation_status`  tinyint(4) NOT NULL DEFAULT '1' COMMENT '对账状态  1、未对账 2已对账';


alter table
  tms_road_record_bill
add
  column  `reconciliation_month`  varchar(30) NOT NULL DEFAULT ''  COMMENT '对账月份 ',
add
  column  `car_money`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '停车费 ';

update tms_road_record set reconciliation_status=2 where provisional_status in (2,3);

update tms_road_record_bill set reconciliation_month=provisional_month;





alter table
  tms_refuel_record
add
  column  `reconciliation_status`  tinyint(4) NOT NULL DEFAULT '1' COMMENT '对账状态  1、未对账 2已对账',
add
  column  `account_province`  varchar(30) NOT NULL DEFAULT '' COMMENT '开户省份';


alter table
  tms_refuel_record_bill
add
  column  `reconciliation_month`  varchar(30) NOT NULL DEFAULT ''  COMMENT '对账月份 ',
add
  column  `car_money`  decimal(10,2) NOT NULL DEFAULT '0.00'  COMMENT '停车费 ',
add
  column  `account_province`  varchar(30) NOT NULL DEFAULT '' COMMENT '开户省份';

update tms_refuel_record set reconciliation_status=2 where provisional_status in (2,3);

update tms_refuel_record_bill set reconciliation_month=provisional_month;



仓库工作单v1.1：方案准备增加温度计校准证书 调整
feature_19754_csl_20240516 tms_admin
feature_19754_csl_20240516 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19754  已上线



CREATE TABLE `tms_temperature_print` (
  `ttp_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `gd_series_number`  varchar(32) NOT NULL DEFAULT '' COMMENT '温度计序列号',
  `temperature_print`  int(11) unsigned  NOT NULL  DEFAULT '0'  COMMENT '温度计校准证书 最后打印时间',
  `ttp_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`ttp_id`)
  )COMMENT='温度计校准证书打印';





LVBV6P0C8PW071619

update car set car_frame_number='LVBV6PDC8PW071619' where ca_id=901;


INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170001',901, 0, '系统', 0, 'IT协助修改  更改车架号为 LVBV6PDC8PW071619   审批单号：   
ITSJ202405150008', 1715840961, 13, 0);




外协耗材监控优化
feature_19771_csl_20240517  tms_service
feature_19771_csl_20240517  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19771  已上线


取派时间补录 优化
feature_19779_csl_20240517   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19779   已上线


时间和操作取件时间不在同一天，请注意复核！



14702 9095  安排工作指令  3050923 1716163200  12220 章甜甜 1716121844  1
14718 9096  购买车票  3050923 1716162427  47363 李冬源 1716162428  2
14723 9097  到达车站  3050923 1716178500  47363 李冬源 1716178542  3
14724 9098  乘车  3050923 1716178560  47363 李冬源 1716178581  4
14725 9099  车辆出发  3050923 1716178800  47363 李冬源 1716178847  5
14726 9100  到达取件城市  3050923 1716178860  47363 李冬源 1716178884  6
14727 9101  到达取件单位  3050923 1716178860  47363 李冬源 1716178897  7






  UPDATE tms_cart_operation_record SET tcor_time=1716169680 where tcor_id = 14723;

  UPDATE tms_cart_operation_record SET tcor_time=1716169800 where tcor_id = 14724;

  UPDATE tms_cart_operation_record SET tcor_time=1716169980 where tcor_id = 14725;

  UPDATE tms_cart_operation_record SET tcor_time=1716170280 where tcor_id = 14726;

  UPDATE tms_cart_operation_record SET tcor_time=1716170340 where tcor_id = 14727;



INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102040', 3050923, 0, '系统申请', 0, ' 乘车9:50 车辆出发：9:53 到达取件城市:9:58 到达取件单位：9:59 到达车站：9:48
审批单号：ITSJ202405200005 ', 1716188194, 1, 0)

107548822



UPDATE remark_log SET rl_server_type=13 where rl_id = 107548822;


UPDATE tms_cart_operation_record SET tcor_time=1716181020 where tcor_id = 14732;

update order_logistics set ol_pickup_time=1716181020   where to_id=3047587;
update oms_logistics set ol_pickup_time=1716181020   where to_id=3047587;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102040', 3047587, 0, '系统申请', 0, ' 取件时间修改为2024.05.20 12:57 审批单号：ITSJ202405200006 ', 1716189380, 13, 0);




UPDATE tms_cart_operation_record SET tcor_time=1716182400 where tcor_id = 14739;

update order_logistics set ol_pickup_time=1716182400   where to_id=3050989;
update oms_logistics set ol_pickup_time=1716182400   where to_id=3050989;

INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102040', 3050989, 0, '系统申请', 0, ' 取件时间修改为2024.05.20 13:20 审批单号：ITSJ202405200006 ', 1716189380, 13, 0);





update car_repair set repair_status=6 where cr_id=8241;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',8241, 0, '系统', 0, 'IT协助修改维保状态：完成   审批单号：ITSJ202405200001', 1716198579, 13, 0)




update car_repair set repair_status=6 where cr_id=7969;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',7969, 0, '系统', 0, 'IT协助修改维保状态：完成   审批单号：ITSJ202405200001', 1716198579, 13, 0);




UPDATE remark_log SET rl_identifier=7969 where rl_id = 107587589;


取派时间补录 优化  5.20

外协耗材监控优化  5.21


月结路桥费成本线上化1.1优化




小程序退款补差价1.2
feature_19819_csl_20240521  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19819  未上线





feature_csl_supplier_20240523

php yii history-data/add-supplier-main



3050921





UPDATE tms_cart_operation_record SET tcor_time=1716249600 where tcor_id = 14790;

UPDATE tms_cart_operation_record SET tcor_time=1716251040 where tcor_id = 14794;

update order_logistics set ol_delivery_time=1716251040   where to_id=3050921;
update oms_logistics set ol_delivery_time=1716251040   where to_id=3050921;


INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102041', 3050921, 0, '系统申请', 0, '更改 到达派件单位 2024-05-21 8:00 车辆运输流程2024-05-21 8:05 实际派件2024-05-21 8:24 审批单号：ITSJ202405210001 ', 1716444156, 13, 0);



UPDATE remark_log SET rl_remark='派件人：潘晶，货物状态：货物完好，签收时间：2024-05-21 8:24，签收人：袁善杰 ' where rl_id = 107625141;

UPDATE remark_log SET rl_remark=' 派件到达：到达时间：2024-05-21 8:05 到达附近坐标点：120.796014,31.284618 ' where rl_id = 107618229;

UPDATE remark_log SET rl_remark='2024-05-21 8:00到达派件单位' where rl_id = 107618209;


  
到达派件单位   8:00
车辆运输流程   8:05
实际派件   8:24



车辆管理查询优化
feature_19904_csl_20240524   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19904  未上线




取派时间补录 优化  5.20  已上线  （取派时间补录  选择的时间和实际操作取派时间 不是同一天  提醒）
外协耗材监控优化  5.21   已上线   （外协耗材监控 子单绑定耗材  推送子单号）
小程序退款补差价1.2   5.23  已提测（1、正常变更为：专人、专车、冷藏车  2、专人、专车、冷藏车相互变更产生费用的）
月结路桥费成本线上化1.1优化  已上线
同步泛微供应商数据  进行中  （根据exel 表格导入供应商数据）


同步泛微供应商数据
feature_csl_19894_20240523  已上线
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19894

history-data/add-supplier-main



车辆随车资产管理
feature_19929_csl_20240527  tms_admin
feature_19929_csl_20240528  ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19929   未上线


alter table
  tms_car_info
add
  column  `tailplate_no`   varchar(32) NOT NULL  DEFAULT '' COMMENT '尾板编码',
add
  column  `video_surveillance_status`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有视频监控 0 否 1 是',
add
  column  `video_surveillance_no`   varchar(32) NOT NULL  DEFAULT '' COMMENT '视频监控编码',
add
  column  `cooler_status`  tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有冷分机 0 否 1 是',
add
  column  `cooler_no`   varchar(32) NOT NULL  DEFAULT '' COMMENT '冷风机编码';








  17082 11574 3040906 83656613  1 2024-05-18 09:10:59 2024-05-18 09:10:59 0000-00-00 00:00:00





  tms_mileage_order


update tms_mileage_order set to_id=3040160,to_no=83643470   where tmo_id=17082;

INSERT INTO `tms_remark_log` (`trl_type`, `trl_subtype`, `trl_identifier`, `trl_uid`, `trl_username`, `trl_status`, `trl_remark`, `trl_createtime`, `trl_server_type`) VALUES ( 126, 126002, 11574, 0, '系统', 0, ' 订单号改为83643470， 审批编号：ITSJ202405240007', 1716010883, 13);





车辆维保提醒，里程调整为提前1000KM
feature_19948_csl_20240530  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=19948  已上线




1.供应商管理优化v1（自动创建物流、资产供应商） 已上线
2.车辆属性调整：将叉车分开管理  已上线
3.月结路桥费成本线上化1.1优化   已上线
4.仓库工作单v1.1：方案准备增加温度计校准证书 调整  已上线
5.外协耗材监控优化  已上线
6.取派时间补录 优化  已上线
7.车辆维保提醒 调整  已上线
8.同步泛微供应商数据  已上线
9.小程序退款补差价  已上线
10.车辆随车资产管理   待发布


代码规范性逻辑性
严格执行规范



发货单号规则去除
feature_20027_csl_20240531   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20027   已上线


调度单匹配
feature_20004_csl_20240531  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20004  已上线



车辆保险资金支付对接
feature_20044_csl_20240603  tms_admin   
feature_20044_csl_20240607 ams_service
feature_20044_csl_20240608 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20044  未上线


// CREATE TABLE `car_insurance` (
//   `ci_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆保险序号',
//   `ca_id` int(11) DEFAULT NULL COMMENT '车辆序号',
//   `ca_number` varchar(30) DEFAULT NULL COMMENT '车牌号',
//   `price` decimal(10,2) DEFAULT NULL COMMENT '购买金额',
//   `ci_compulsory` decimal(10,2) DEFAULT NULL COMMENT '交强险',
//   `ci_vehicle` decimal(10,2) DEFAULT NULL COMMENT '车税险',
//   `ci_commercial` decimal(10,2) DEFAULT NULL COMMENT '商业险',
//   `ci_loss` decimal(10,2) DEFAULT NULL COMMENT '机动车损失保险',
//   `ci_third_loss_1` decimal(10,2) DEFAULT NULL COMMENT '机动车第三者责任险(100万)',
//   `ci_third_loss_2` decimal(10,2) DEFAULT NULL COMMENT '机动车第三者责任险(150万)',
//   `ci_loss_driver` decimal(10,2) DEFAULT NULL COMMENT '车上人员责任险：驾驶员',
//   `ci_loss_passenger` decimal(10,2) DEFAULT NULL COMMENT '车上人员责任险：乘客',
//   `project` varchar(255) DEFAULT NULL COMMENT '购买项目',
//   `company` varchar(30) DEFAULT NULL COMMENT '保险公司',
//   `contacts` varchar(30) DEFAULT NULL COMMENT '联系人',
//   `insured` varchar(30) DEFAULT NULL COMMENT '被保险人',
//   `term_start_time` int(11) DEFAULT NULL COMMENT '保险起始时间',
//   `term_end_time` int(11) DEFAULT NULL COMMENT '保险结束时间',
//   `ci_state` tinyint(4) DEFAULT NULL COMMENT '状态  1 已续保  2 即将过期  3 已过期   0过期后已续保数据  ',
//   `desc` varchar(255) DEFAULT NULL COMMENT '备注',
//   `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
//   PRIMARY KEY (`ci_id`)
// ) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='车辆保险';



alter table
  car_insurance
add
  column  `commerce_start_time` int(11) unsigned  NOT NULL  DEFAULT '0' COMMENT '商业保险起始时间',
add
  column  `commerce_end_time` int(11) unsigned  NOT NULL  DEFAULT '0' COMMENT '商业保险结束时间',
add
  column  `ci_third_loss_two` decimal(10,2) unsigned  NOT NULL  DEFAULT '0' COMMENT '机动车第三者责任险(200万)',
add
  column  `medicine_risk`  decimal(10,2)  NOT NULL   DEFAULT '0' COMMENT '医保外用药',
add
  column  `new_car_type` tinyint(4)  NOT NULL  DEFAULT '0' COMMENT '状态 1 新车 2 非自营 3 自营续保',
add
  column  `payment_state` tinyint(4)  NOT NULL  DEFAULT '3' COMMENT '支付审批状态 0 待提交 1 审核中 2 审批完成 3 正常 4 已退回 5 已变更 6 已作废 7已支付 9 即将到期 10 已过期',
add
  column  `applicant_uid` int(11)  NOT NULL  DEFAULT '0' COMMENT '申请人uid',
add
  column  `applicant_name` char(32)  NOT NULL  DEFAULT '' COMMENT '申请人名称',
add
  column  `su_id` int(11)  NOT NULL  DEFAULT '0' COMMENT '保险公司id （资产供应商id）',
add
  column  `tipa_id` int(11)  NOT NULL  DEFAULT '0' COMMENT '资金支付申请id';




alter table
  car
add
  column  `car_commerce_start_time` int(11) unsigned  NOT NULL  DEFAULT '0' COMMENT '商业保险起始时间',
add
  column  `commerce_ci_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上次商业险保险ci_id';



CREATE TABLE `tms_insurance_payment_apply` (
  `tipa_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `request_id` int(11)  NOT NULL  DEFAULT '0' COMMENT '泛微id',
  `workflow_number`  varchar(100) NOT NULL DEFAULT '' COMMENT '北森 workflow_number 字段',
  `eteams_push_param` json DEFAULT NULL COMMENT '北森推送内容参数',
  `inprocess_name` varchar(50) DEFAULT NULL NOt NULL  DEFAULT '' COMMENT '审批中',

  `apply_name` varchar(50) DEFAULT NULL NOt NULL  DEFAULT '' COMMENT '提交资金支付人',
  `apply_uid` int(11) DEFAULT NULL NOt NULL  DEFAULT '0' COMMENT '提交资金支付人 uid',
  `next_inprocess_name` varchar(50) DEFAULT NULL NOt NULL  DEFAULT '' COMMENT '下一个审批人',
  `finish_name` varchar(50) DEFAULT NULL NOt NULL  DEFAULT '' COMMENT '审批完成人',

  `inprocess_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00'  COMMENT '审批中时间',
  `finish_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审批完成人时间',
  `payment_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `predict_payment_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计支付时间',

  `payment_state` tinyint(4)  NOT NULL  DEFAULT '1' COMMENT '支付审批状态  1 审核中 2 审批完成 4 已退回 7 已支付 8 删除',
  `tipa_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tipa_id`)
  )COMMENT='车辆保险支付申请';



CREATE TABLE `tms_car_insurance_warn` (
  `tciw_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `ca_id` int(11)  NOT NULL  DEFAULT '0' COMMENT '车辆id',
  `ci_id` int(11)  NOT NULL  DEFAULT '0' COMMENT '保险ci_id',
  `term_start_time` int(11) unsigned  NOT NULL  DEFAULT '0' COMMENT '保险起始时间',
  `term_end_time` int(11) unsigned  NOT NULL  DEFAULT '0' COMMENT  '保险结束时间',
  `tciw_type`  tinyint(4)  NOT NULL  DEFAULT '1'  COMMENT '1 交强险 2 商业险',

  `tciw_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tciw_id`)
  )COMMENT='车辆上次交强险商业险';


{"rule":{"bool":{"must":[{"term":{"template_key":"fund_payment"}},{"term":{"extend_params":"tms"}}]}}}



{tms_admin} car/car-insurance-status

{tms_admin} timing-push/car-remind-data




















update order_worksheet set ow_cart_type=1 where ow_id=14256121;

  14256121





INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('102', '102107',3075344, 0, '系统', 0, 'IT协助修改 更改操作节点 审批编号 ITSJ202406040005', 1717473237, 13, 0);

update tms_cart_operation_record set to_id=0 where tcor_id=14989;
update tms_cart_operation_record set to_id=0 where tcor_id=14990;
update tms_cart_operation_record set to_id=0 where tcor_id=14991;


// 单号录入优化
// feature_20156_csl_20240607  tms_admin
// https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20156




中石油加油卡管理
feature_20311_csl_20240617  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20311  未上线


alter table
  tms_caroil_cardbalance
add
  column  `trr_payment_method` tinyint(3) NOT NULL DEFAULT '1' COMMENT '加油方式，1 油卡-中石化，3 油卡-中石油';





车辆维保增加年审、尾板保养、大金额对公支付
feature_20335_csl_20240618  tms_admin
feature_20335_csl_20240619  ams_service
feature_20335_csl_20240625  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20335  未上线


history-data/upd-insurance



alter table
  tms_car_info
add
  column  `record_status`  tinyint(3) NOT NULL  DEFAULT '0' COMMENT '是否备案 1是 2 否',
add
  column  `maintenance_cycle`  tinyint(4) NOT NULL  DEFAULT '0' COMMENT '维保周期 1、6个月 2、12个月',
add
  column  `tailplate_status`  tinyint(4) NOT NULL  DEFAULT '0' COMMENT '是否安装 1、是 2、否',
add
  column  `tailplate_time`  int(11) unsigned NOT NULL  DEFAULT '0' COMMENT '安装时间',
add
  column  `storage_address`  varchar(255) NOT NULL  DEFAULT '' COMMENT '存放地点';




alter table
  car
add
  column  `tail_plate_time` int(11) unsigned  NOT NULL  DEFAULT '0' COMMENT '尾板保养时间',
add
  column  `next_tail_plate_time` int(11) unsigned  NOT NULL  DEFAULT '0' COMMENT '下次尾板保养时间';


CREATE TABLE `tms_repair_payment_apply` (
  `trpa_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录主键id',
  `request_id` int(11)  NOT NULL  DEFAULT '0' COMMENT '泛微id',
  `workflow_number`  varchar(100) NOT NULL DEFAULT '' COMMENT '北森 workflow_number 字段',
  `eteams_push_param` json DEFAULT NULL COMMENT '北森推送内容参数',
  `inprocess_name` varchar(50) DEFAULT NULL NOt NULL  DEFAULT '' COMMENT '审批中',

  `apply_name` varchar(50) DEFAULT NULL NOt NULL  DEFAULT '' COMMENT '提交资金支付人',
  `apply_uid` int(11) DEFAULT NULL NOt NULL  DEFAULT '0' COMMENT '提交资金支付人 uid',
  `next_inprocess_name` varchar(50) DEFAULT NULL NOt NULL  DEFAULT '' COMMENT '下一个审批人',
  `finish_name` varchar(50) DEFAULT NULL NOt NULL  DEFAULT '' COMMENT '审批完成人',

  `inprocess_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00'  COMMENT '审批中时间',
  `finish_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审批完成人时间',
  `payment_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '支付时间',
  `predict_payment_time`  datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计支付时间',
  `payment_msg` varchar(255)  NOT NULL  DEFAULT '' COMMENT '付款说明',

  `payment_state` tinyint(4)  NOT NULL  DEFAULT '1' COMMENT '支付审批状态  1 审核中 2 审批完成 4 已退回 7 已支付 8 删除',
  `trpa_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`trpa_id`)
  )COMMENT='车辆维保支付申请';





alter table
  car_repair
add
  column  `trpa_id` int(11)  NOT NULL  DEFAULT '0' COMMENT '资金支付申请id',
add
  column  `tcy_id` int(11)  NOT NULL  DEFAULT '0' COMMENT '年检id';


  





{
    "170001": "修改车辆",
    "170002": "添加车辆",
    "170003": "添加事故",
    "170004": "修改事故",
    "170005": "添加保险",
    "170006": "修改保险",
    "170007": "添加维修",
    "170008": "修改维修",
    "170009": "绑定温度计探头",
    "170010": "删除温度计探头",
    "170011": "启用温度计探头",
    "170012": "停用温度计探头",
    "170013": "提交维修保养审批",
    "170014": "确认完成",
    "170015": "提交报销审批",
    "170016": "油卡充值记录",
    "170017": "提交资金支付申请"
}




/index.php?r=car-repair/update-type



差旅管家接口请求优化
feature_20347_csl_20240618
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20347





update car_repair set repair_finish_mile=144617 where cr_id=9167;


INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',9167, 0, '系统', 0, 'IT协助修改 保养里程改为 144617 审批编号 ITSJ202406190001', 1719213620, 13, 0);





供应商管理增加类型
feature_20081_csl_20240626   ams_admin
feature_20081_csl_20240701  ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20081  未上线






ALTER table tms_project_config add COLUMN corpuscle_single_status tinyint(4)  not null  DEFAULT '0' COMMENT '支持电子面单 1支持 0不支持';

ALTER table tms_customer_config add COLUMN corpuscle_single_status tinyint(4)  not null  DEFAULT '0' COMMENT '支持电子面单 1支持 0不支持';


,
    "corpuscle_single_status": {
        "on": 1,
        "off": 0,
        "label": "支持电子面单",
        "span": " "
    }


    1995
    1994
    1993
    1992
    1991
    1990
    1989

car_insurance

update car_insurance set payment_state=3 where ci_id=1995;

    payment_state




    1.车辆保险资金支付对接    已上线
    2.中石油加油卡管理        已上线
    3.车辆维保增加年审、尾板保养、大金额对公支付   待发布


    代码规范性逻辑性

严格执行规范



    1.车辆保险资金支付对接    已上线
    2.中石油加油卡管理        已上线
    3.车辆维保增加年审、尾板保养、大金额对公支付   待发布


1.车辆保险资金支付对接   已上线

2.中石油加油卡管理       已上线

3.车辆保险提醒（商业险、交强险分开提醒）  已上线

4.车辆维保：尾板保养   待发布

5.供应主体新增海外供应商  ams    已上线

6.发货记录 新增调度单匹配按钮   已上线

7.车辆保险历史数据批量修改     待发布

8.车辆维保：车辆年审    待发布

9.项目、客户配置 新增 支持电子面单配置   待发布

10.车辆维保大金额对公支付   待发布



小程序异常收费
feature_20633_csl_20240703 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20633  未上线




 外协操作费用优化调整
 feature_20622_csl_20240703 tms_admin
 feature_20622_csl_20240704 omsapi
 https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20622  未上线



ALTER table
  tms_operation_feeremind
add
  COLUMN fee_status tinyint(4) not null DEFAULT '0' COMMENT '续单费类型 1相同人续单费 2不同人续单费',
add
  COLUMN to_id int(11) unsigned NOT NULL DEFAULT '0' COMMENT '续单费上一个to_id';



换冰排时效管理添加箱型筛选
feature_20699_csl_20240705 tms_admin  
https://project.ashsh.com.cn/index.php?m=task&f=view&id=20699  未上线




ITSJ202407050006





update tms_operation_feeremind set opn_id=0 where tofd_id=26760;

update tms_operation_feeremind set opn_id=0 where tofd_id=26925;

update tms_operation_feeremind set opn_id=0 where tofd_id=27595;

update tms_operation_feeremind set opn_id=0 where tofd_id=28010;

update tms_operation_feeremind set opn_id=0 where tofd_id=50493;

update tms_operation_feeremind set opn_id=0 where tofd_id=57039;

update tms_operation_feeremind set opn_id=0 where tofd_id=59297;

update tms_operation_feeremind set opn_id=0 where tofd_id=62056;

update tms_operation_feeremind set opn_id=0 where tofd_id=62160;





车辆维保项目管理
feature_20662_csl_20240708  ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20662  未上线


油卡加油记录优化
feature_20842_csl_20240712  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20842  已上线





生生耗材管理、

包装箱清洁管理
feature_20912_csl_20240817  ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20912  未上线
history-data/add-cleaning-management

update ams_packaging_box_cleaning_management set is_deleted=1 where sto_id=0;






车辆维保入账月份调整
feature_20914_csl_20240717   tms_service
feature_20914_csl_20240717   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=20914  已上线




外协耗材现结、月结
feature_20922_csl_20240718  ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20922  已上线

ALTER TABLE ams_external_assist_material MODIFY COLUMN return_no TEXT COMMENT '返回单号';





油卡路桥费优化
feature_20974_csl_20240722 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20974  未上线

ALTER table car add COLUMN refund_tenancy_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '退租时间';




外协耗材监控补录单号
feature_21033_csl_20240724  ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21033  未上线


update car_insurance set payment_state=7 where ci_id=2027;
update car_insurance set payment_state=7 where ci_id=2026;
update car_insurance set payment_state=7 where ci_id=2025;

update tms_insurance_payment_apply set payment_state=7,payment_time='2024-07-18 14:30:02' where workflow_number='FDPA202407120012';


INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170006',2027, 0, '系统', 0, 'IT协助修改状态：已支付 审批单号：ITSJ202407250001', 1721804738, 13, 0);

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170006',2026, 0, '系统', 0, 'IT协助修改状态：已支付 审批单号：ITSJ202407250001', 1721804738, 13, 0);

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170006',2025, 0, '系统', 0, 'IT协助修改状态：已支付 审批单号：ITSJ202407250001', 1721804738, 13, 0);





车辆管理优化
feature_21152_csl_20240726   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=21152  未上线





1.小程序异常收费   已上线

2.外协操作费用优化调整  已上线

3.换冰排时效管理优化   已上线

4.油卡加油记录优化   已上线

5.车辆维保入账月份调整   已上线

6.油卡路桥费优化   已上线

7.车辆维保项目管理 已上线

8.外协耗材现结、月结（AMS系统）   已上线

9.包装箱清洁管理（AMS系统）   已上线

10.供应商新增类型（AMS系统）   已上线

11.外协耗材监控补录单号（AMS系统)   已上线

12.油卡路桥费优化：停车费拆分，暂估比较隐藏等   开发中

严格执行规范
  
代码规范性逻辑性

查计划箱型接口
feature_21176_csl_20240729   tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&id=21176  已上线


路由列表优化
feature_21190_csl_20240730  dispath_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=21190   已上线


大件路由增加路由类型筛选
feature_21194_csl_20240730  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21194   未上线



供应商新增类型
feature_21210_csl_20240730   ams_admin
feature_21210_csl_20240731   ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21210   未上线




油卡路桥费优化：停车费拆分，暂估比较隐藏等
feature_21218_csl_20240731   tms_admin
feature_21218_csl_20240806   ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21218  未上线

油卡路桥批量对账调整
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21454  未上线


update tms_road_record set cost_type=2  where outbound_name like '停车';


ALTER table 
  tms_road_record 
add 
  COLUMN cost_type  tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1路桥费  2停车费',
ADD
  INDEX idx_deal_time (`deal_time`);


ALTER table
  tms_road_record_bill
add
  COLUMN road_money decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '路桥费暂估金额',
add
  COLUMN stop_money decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '停车费暂估金额',
add
  COLUMN road_cost decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '路桥费暂估成本',
add
  COLUMN stop_cost decimal(10, 2) NOT NULL DEFAULT '0.00' COMMENT '停车费暂估成本',
add
  COLUMN sm_name  varchar(100) NOT NULL DEFAULT '' COMMENT '供应商主体名称',
add
  COLUMN sm_id   int(11) NOT NULL DEFAULT '0' COMMENT '供应商主体id（关联 ams_supplier_main.id）';


ALTER table
  tms_car_certificate
add
  COLUMN sm_name  varchar(100) NOT NULL DEFAULT '' COMMENT '供应商主体名称',
add
  COLUMN sm_id   int(11) NOT NULL DEFAULT '0' COMMENT '供应商主体id（关联 ams_supplier_main.id）';




ALTER table
  tms_refuel_record_bill
add
  COLUMN sm_name  varchar(100) NOT NULL DEFAULT '' COMMENT '供应商主体名称',
add
  COLUMN sm_id   int(11) NOT NULL DEFAULT '0' COMMENT '供应商主体id（关联 ams_supplier_main.id）';


ALTER table
  tms_refuel_record
add
  COLUMN sm_name  varchar(100) NOT NULL DEFAULT '' COMMENT '供应商名称',
ADD
  INDEX idx_deal_time (`deal_time`);





车辆维保台账入账确认调整
feature_21263_csl_20240801   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=21263  已上线





update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=92;

update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=120;

update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=104;

update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=69;

update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=71;

update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=106;

update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=109;

update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=89;

update tms_car_repair_monthly_billing set tcrmb_pay_month=1719763200,tcrmb_entry_month=0  where tcrmb_id=99;


  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-12 14:48:26 <br>自动确认入账：付款月份：2024-07' where trl_id =277733;
  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-12 14:48:26 <br>自动确认入账：付款月份：2024-07' where trl_id =277734;
  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-16 17:22:05 <br>自动确认入账：付款月份：2024-07' where trl_id =290136;
  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-16 17:24:07 <br>自动确认入账：付款月份：2024-07' where trl_id =290149;
  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-16 17:24:07 <br>自动确认入账：付款月份：2024-07' where trl_id =290150;
  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-16 17:24:07 <br>自动确认入账：付款月份：2024-07' where trl_id =290151;
  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-16 17:24:10 <br>自动确认入账：付款月份：2024-07' where trl_id =290152;
  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-16 17:24:06 <br>自动确认入账：付款月份：2024-07' where trl_id =290153;
  update tms_remark_log set trl_remark ='资金支付-成功 支付时间：2024-07-16 17:24:06 <br>自动确认入账：付款月份：2024-07' where trl_id =290154;



TMS
查计划箱型接口  7.29 已上线
路由列表优化   7.30  已上线
大件路由增加路由类型筛选   7.30  已上线
车辆维保台账入账确认调整    8.1  测试中
车辆保险优化     8.1  测试中
油卡路桥费优化：停车费拆分，暂估比较隐藏等   7.31 开发中

AMS
供应商新增类型  7.31  已上线

下周
油卡路桥费优化：停车费拆分，暂估比较隐藏等




车辆保险优化
feature_21272_csl_20240801   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21272  未上线


ALTER table car_insurance add COLUMN pci_id   int(11) NOT NULL DEFAULT '0' COMMENT '父级保险id（关联 car_insurance.ci_id）';




自动生成里程申报优化
feature_21301_csl_20240805  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21301  已上线


取派件补录优化
feature_21338_csl_20240806   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21338  未上线



update tms_road_record set trr_visible=2  where payment_company = '生生供应链管理（广州）有限公司' and deal_time >=1719763200 and deal_time <1722441600;


SELECT * FROM `tms_road_record` WHERE payment_company = '生生供应链管理（广州）有限公司' and deal_time >=1719763200 and deal_time <1722441600;




车辆维保项目管理
feature_20662_csl_20240708  ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=20662  已上线






车辆维保申请、完成、复核。叉车字段调整
feature_21349_csl_20240807      tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21349  未上线






油卡路桥费优化：停车费拆分，暂估比较隐藏等 8.7  测试中


update tms_car_repair_monthly_billing set tcrmb_entry_month=1719763200  where tcrmb_id=99;

INSERT INTO `tms_remark_log` (`trl_type`, `trl_subtype`, `trl_identifier`, `trl_uid`, `trl_username`, `trl_status`, `trl_remark`, `trl_createtime`, `trl_server_type`) VALUES ( 141, 141002, 99, 0, '系统', 0, ' 入账月份修改为2024-07 审批编号：ITSJ202408070003', 1723098540, 13);




CAR-T订单新增恺兴商业化项目

feature_21474_csl_20240813   tms_admin

feature_21474_csl_20240813   tms_service
feature_21474_csl_20240813   omsapi

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21474
{
    "cu_ids":[202101157],
    "cp_ids": [8548,8595],
    "recycle_cp_ids": [8595],
    "single_cp_ids": [8548],
}

{
    "cu_ids":[202101157,202105217],
    "cp_ids": [8548,8595,25302,25303,25330,25331],
    "recycle_cp_ids": [8595,25303,25330],
    "single_cp_ids": [8548,25302,25331]
}



上海医药物流中心有限公司这个客户下面的这两个项目号号：恺兴生命商业化单采血、恺兴生命商业化回输
华东医药（杭州）有限公司-科济项目这个客户下面的这两个项目号：        恺兴生命商业化回输、        恺兴生命商业化单采


                        <option value="25331" >恺兴生命商业化单采</option>
                        <option value="25330" >恺兴生命商业化回输</option>



车辆保险优化
feature_21272_csl_20240801   tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21272  未上线




物流供应商，预付款类型修改
feature_21381_csl_20240815  tms_admin
feature_21381_csl_20240816  ams_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21381 未上线





车辆维保申请、完成、复核。叉车字段调整  8.12  已上线

CAR-T订单新增恺兴商业化项目   8.13   测试中

油卡路桥批量对账调整  8.14    测试中

物流供应商，预付款类型修改  8.16 开发中


车辆维保信息导出优化
feature_21514_csl_20240819  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&id=21514  未上线

ALTER table
  tms_car_certificate
ADD
  INDEX idx_ca_id (`ca_id`);


ALTER table
  tms_road_record
ADD
  INDEX idx_trr_car_id (`trr_car_id`);


ALTER table
  tms_refuel_record
ADD
  INDEX idx_trr_car_id (`trr_car_id`);



tms_dr_stop_mileage


CREATE TABLE `tms_drive_record` (
  `tms_dr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '行车记录主键ID',
  `tms_dr_car_id` int(11) DEFAULT NULL COMMENT '车辆ID',
  `tms_tcc_id` int(11) NOT NULL DEFAULT '0' COMMENT '新版车辆检查表ID,tms_car_check_new',
  `tms_rti_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用车检查记录表',
  `tms_dr_car_record` varchar(200) DEFAULT NULL COMMENT '行车记录',
  `rti_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用车记录表',
  `tms_dr_recordtime` int(11) DEFAULT NULL COMMENT '记录时间',
  `tms_dr_start_mileage` decimal(10,2) DEFAULT NULL COMMENT '起始里程，保留小数点两位数字',
  `tms_dr_stop_mileage` decimal(10,2) DEFAULT NULL COMMENT '结束里程，保留小数点两位数字',
  `tms_dr_refuel_money` decimal(10,2) DEFAULT NULL COMMENT '加油金额，保留小数点两位数字',
  `tms_dr_ur_uid` int(11) DEFAULT NULL COMMENT '记录人ID',
  `tms_dr_username` varchar(32) DEFAULT NULL COMMENT '记录人员姓名',
  `tms_dr_start_time` int(11) DEFAULT NULL COMMENT '开始用车时间',
  `tms_dr_stop_time` int(11) DEFAULT NULL COMMENT '结束用车时间',
  `tms_dr_is_over` int(11) DEFAULT '1' COMMENT '是否结束用车，1：正常用车，2：结束用车',
  `tms_dr_visible` tinyint(1) DEFAULT '1' COMMENT '1：显示，2：删除',
  `tms_dr_coworkeruids` varchar(100) DEFAULT '' COMMENT '同乘人id',
  `tms_dr_coworkernames` varchar(100) DEFAULT '' COMMENT '同乘人姓名',
  `tms_dr_abnormal` tinyint(2) DEFAULT '2' COMMENT '异常是否处理 0:未处理 1:处理',
  `tms_dr_abnormal_feedback` varchar(100) DEFAULT NULL COMMENT '处理结果',
  `sw_id` int(11) NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sw_name` varchar(1024) NOT NULL DEFAULT '' COMMENT '仓库名称',
  PRIMARY KEY (`tms_dr_id`),
  KEY `tms_dr_car_id` (`tms_dr_car_id`) USING BTREE,
  KEY `idx_tms_dr_ur_uid` (`tms_dr_ur_uid`) USING BTREE COMMENT '领车人',
  KEY `idx_tms_dr_coworkeruids` (`tms_dr_coworkeruids`) USING BTREE COMMENT '同乘人',
  KEY `idx_tms_dr_is_over` (`tms_dr_is_over`) USING BTREE COMMENT '是否结束'
) ENGINE=InnoDB AUTO_INCREMENT=1233 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='行车记录表';


数据导入
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=21218



1942



Tms_Dwt_Wcmessage_Log