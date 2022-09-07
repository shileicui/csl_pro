
<?
4000121321 SSWL

//phpstorm 破解
https://pdd.ismicool.cn/idea/

https://pdd.ismicool.cn/idea/code.html

//Hyper-v
bcdedit /set hypervisorlaunchtype off    //Hyper-v 关闭
bcdedit /set hypervisorlaunchtype auto    //Hyper-v 开启
openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'

sudo  codesign --force --deep --sign - /Applications/Navicat\ Premium.app  //mac 闪退
codesign --force --deep --sign - /Applications/Sourcetree.app  //mac 闪退

        Yii::info('csl=='.json_encode($fharray,JSON_UNESCAPED_UNICODE));

mds、mds_stores、mdworker占用大量的CPU，是因为系统在建立索引，开机后的一段时间比较明显
解决方案1：

sudo mdutil -a -i off    # 关闭
sudo mdutil -a -i on    # 还原
解决方案二：

关闭控制聚焦参数文件的加载：

sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
想打开的时候，使用：

sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist



tail -f /d/phpstudy_pro/WWW/tms_admin/protected/runtime/logs/error.log |grep 'csl'

/d/phpstudy_pro/WWW/yii3/basic/yii csl/cui 


/添加索引

ALTER  TABLE  `work_map`  ADD  INDEX idx_wmp_region_id (  `wmp_region_id`  );
ALTER TABLE work_map modify COLUMN wmp_type  int(4) NOT NULL DEFAULT '1' COMMENT '排班类型 1.取发提派 3耗材组 4项目组 5专人专车组 6长途专线组';


ALTER  TABLE  `work_map`  ADD  INDEX idx_wmp_region_id (  `wmp_region_id`  ), modify COLUMN wmp_type  int(4) NOT NULL DEFAULT '1' COMMENT '排班类型 1.取发提派 3耗材组 4项目组 5专人专车组 6长途专线组';





ALTER  TABLE  tms_route_recommend modify COLUMN tms_rr_result text DEFAULT NULL COMMENT '路由推荐内容';
ALTER  TABLE  tms_material_plan_recommend modify COLUMN tms_mpr_result text DEFAULT NULL COMMENT '计划箱型内容';





t
//添加字段
ALTER table tms_supplier add COLUMN tms_sup_bank_account VARCHAR (255) DEFAULT '' COMMENT '银行账号' AFTER tms_sup_invoicetype;
ALTER table tms_supplier add COLUMN tms_sup_bank_name VARCHAR (255) DEFAULT '' COMMENT '开户银行名称' AFTER tms_sup_invoicetype;
ALTER table tms_supplier add COLUMN tms_sup_payee_name VARCHAR (255) DEFAULT '' COMMENT '银行账号' AFTER tms_sup_invoicetype;


ALTER table car add COLUMN car_volume int (11) DEFAULT 0 COMMENT '车辆容积' AFTER car_lastuse_time;
ALTER table car add COLUMN car_ratify_size VARCHAR (255) DEFAULT '' COMMENT '核定大小' AFTER car_lastuse_time;


ALTER table tms_mf_shipnoadd add COLUMN tms_mf_send_month VARCHAR (15) DEFAULT '' COMMENT '发货月份' AFTER tms_mf_createday;
ALTER table tms_mf_shipnoadd add COLUMN tms_mf_carriers_name VARCHAR (255) DEFAULT '' COMMENT '物流承运商' AFTER tms_mf_createday;

//车辆管理添加字段
ALTER table car add COLUMN trucks_type  int(4)  COMMENT '货车类型' AFTER car_volume;
ALTER table car add COLUMN car_level  int(4)  COMMENT '技术等级评定' AFTER car_volume;
ALTER table car add COLUMN car_level_time  int(11)  COMMENT '技术等级评定时间' AFTER car_volume;
ALTER table car add COLUMN car_send_card_time  int(11)  COMMENT '运输证发证日期' AFTER car_volume;
ALTER table car add COLUMN car_year_valid_time  int(11)  COMMENT '运输证年审有效日期至' AFTER car_volume;
ALTER table car add COLUMN car_valid_time  int(11)  COMMENT '运输证有效期至' AFTER car_volume;

//车辆事故表
ALTER table car add COLUMN car_source_type int(4) not null  default '1' COMMENT '车辆数据来源 1 物流系统添加 2资产系统录入';

//供应商管理
ALTER table tms_supplier add COLUMN tms_sup_advance int(4) not null  default '2' COMMENT '是否预付款 1是 2否';

ALTER table car_accident add COLUMN we_price  varchar(50)  COMMENT '我方理赔金额' AFTER ndc_data;
ALTER table car_accident add COLUMN other_price  varchar(50)  COMMENT '对方理赔金额' AFTER ndc_data;
ALTER table car_accident add COLUMN at_present_status  int(4)  COMMENT '当前状态 1处理中 2 完成（未进保） 3 完成（已结案）' AFTER ndc_data;
ALTER table car_accident add COLUMN severity_degree  int(4)  COMMENT '严重程度 1轻微车辆损伤 2 严重车辆损伤 3 轻微人伤 4 严重人伤 5 严重车损+轻微人伤 6 重大事故 7 高金额事故' AFTER ndc_data;

 
ALTER table car add COLUMN trucks_type  int(4) not null default '0' COMMENT '货车类型',
add COLUMN car_level  int(4) not null  default '0'  COMMENT '技术等级评定',
add COLUMN car_level_time  int(11)  not null default '0'   COMMENT '技术等级评定时间',
add COLUMN car_send_card_time  int(11) not null default '0'     COMMENT '运输证发证日期' ,
add COLUMN car_year_valid_time  int(11) not null default '0'    COMMENT '运输证年审有效日期至',
add COLUMN car_valid_time  int(11) not null  not null  default '0'  COMMENT '运输证有效期至' ;
 
ALTER table car_accident add COLUMN we_price  varchar(50) not null  default ''  COMMENT '我方理赔金额',
add COLUMN other_price  varchar(50) not null  default '' COMMENT '对方理赔金额',
add COLUMN at_present_status  int(4) not null  default '3' COMMENT '当前状态 1处理中 2 完成（未进保） 3 完成（已结案）' ,
add COLUMN severity_degree  int(4) not null  default '0' COMMENT '严重程度 1轻微车辆损伤 2 严重车辆损伤 3 轻微人伤 4 严重人伤 5 严重车损+轻微人伤 6 重大事故 7 高金额事故';

ALTER TABLE `tms_customer_user` drop COLUMN `tcu_level`;


// 操作站点 
   CREATE TABLE `tms_operation_site_user` (
              `topsu_id`  int(11)  unsigned  NOT NULL  AUTO_INCREMENT COMMENT '主键id',
              `tops_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作站点id',
              `topsu_phone` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号',
              `topsu_principal_opuid` int(11) NOT NULL DEFAULT '0' COMMENT '站点负责人uid',
              `topsu_principal_opname` varchar(50) NOT NULL DEFAULT '' COMMENT '站点负责人名称',
              `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
              `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
              `deleted_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
              `topsu_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
              PRIMARY KEY (`topsu_id`),
              KEY `idx_tops_id` (`tops_id`)
            ) COMMENT = '操作站点附属表';


 ALTER table tms_operation_site add COLUMN tops_number  varchar(50)  NOT NULL  DEFAULT '' COMMENT '站点编号',add COLUMN tops_nucleic_acid  varchar(50)  NOT NULL  DEFAULT '' COMMENT '物表核酸检测（1生生外包装 2药品外包装)', add COLUMN tops_carea_name  varchar(50)  NOT NULL  DEFAULT '' COMMENT '大区名称', add COLUMN tops_carea_id  int(11) NOT NULL   DEFAULT '0' COMMENT '大区ID', add COLUMN tops_province_region_name  varchar(50)  NOT NULL  DEFAULT '' COMMENT '省级名称', add COLUMN tops_province_region_id  int(11) NOT NULL  DEFAULT '0' COMMENT '省级id',add COLUMN tops_type  int(4) NOT NULL  DEFAULT '0'  COMMENT '站点类型', add COLUMN tops_project_opname  varchar(255)  NOT NULL  DEFAULT '' COMMENT '项目负责人名称', add COLUMN tops_project_opuid  varchar(255)  NOT NULL  DEFAULT '' COMMENT '项目负责人uid', add COLUMN tops_order_opname  varchar(255)  NOT NULL  DEFAULT '' COMMENT '订单负责人名称', add COLUMN tops_order_opuid  varchar(255)  NOT NULL  DEFAULT '' COMMENT '订单负责人uid';


//操作大区 修改
 alter table carea modify column carea_risk_user_id varchar(255) NOT NULL DEFAULT ''  COMMENT '风险外协通知人ids', modify column carea_risk_user_name varchar(255) NOT NULL  DEFAULT '' COMMENT '风险外协通知人名称';


// 分组管理附属表 
   CREATE TABLE `tms_work_map_site` (
              `wms_id`  int(11)  unsigned  NOT NULL  AUTO_INCREMENT COMMENT '主键id',
              `wmp_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组管理id',
              `wms_ts_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货站点id',
              `wms_ts_name` varchar(50) NOT NULL DEFAULT '' COMMENT '发货站点名称',
              `wms_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
              `created_at` datetime NOT NULL DEFAULT now() COMMENT '创建时间',
              `updated_at` datetime NOT NULL DEFAULT now() COMMENT '修改时间',
              `deleted_at` datetime NOT NULL DEFAULT now() COMMENT '删除时间',
              PRIMARY KEY (`wms_id`),
              KEY `idx_wmp_id` (`wmp_id`)
            ) COMMENT = '分组管理附属表';

 ALTER table work_map add COLUMN wmp_type int(4) NOT NULL DEFAULT '1' COMMENT '排班类型 1 取派 2 提发';

alter table work_map DROP wmp_ts_name;
alter table work_map DROP wmp_ts_id;

alter table 'tms_work_map_user' rename to 'tms_work_map_site'


//同行人表
   CREATE TABLE `tms_together_work_user` (
              `twu_id`  int(11)  unsigned  NOT NULL  AUTO_INCREMENT COMMENT '主键id',
              `twu_ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人员ID',
              `twu_username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人员名称',
              `twu_type` int(4) NOT NULL DEFAULT '0' COMMENT '状态  0无分组  1有分组',
              `twu_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
              `twu_pid` int(11) NOT NULL DEFAULT '0' COMMENT '分组关联id',
              `twu_adduid` int(11) NOT NULL DEFAULT '0' COMMENT '添加分组人uid',
              `twu_addname` varchar(50) NOT NULL DEFAULT '' COMMENT '添加分组人名称',
              `created_at` datetime NOT NULL DEFAULT now() COMMENT '创建时间',
              `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
              `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
              PRIMARY KEY (`twu_id`),
               KEY `idx_twu_ur_uid` (`twu_ur_uid`)
            ) COMMENT = '同行人用户';

    CREATE TABLE `tms_together_work_log` (
              `twl_id`  int(11)  unsigned  NOT NULL  AUTO_INCREMENT COMMENT '主键id',
              `twu_pid` int(11) NOT NULL DEFAULT '0' COMMENT '分组关联id',
              `twl_ur_uids` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人员ID',
              `twl_usernames` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人员名称',
              `twl_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
              `created_at` datetime NOT NULL DEFAULT now() COMMENT '创建时间',
              `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
              `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
              PRIMARY KEY (`twl_id`),
              KEY `idx_twu_pid` (`twu_pid`)
            ) COMMENT = '同行人历史记录表';


//客户项目 和 客户列表配置

   CREATE TABLE `tms_customer_config` (
              `tcc_id`  int(11)  unsigned  NOT NULL  AUTO_INCREMENT COMMENT '主键id',
              `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
              `cu_name` varchar(50) NOT NULL DEFAULT '' COMMENT  '客户名称',
              `tcc_dwt_shutdown_verify` tinyint(4) DEFAULT '0'  COMMENT '鼎为关机验证（0不验证1验证）',
              `tcc_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
              `created_at` datetime NOT NULL DEFAULT now() COMMENT '创建时间',
              `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
              `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
              PRIMARY KEY (`tcc_id`),
              KEY `idx_cu_id` (`cu_id`)
            ) COMMENT = 'tms客户配置表';


   CREATE TABLE `tms_project_config` (
              `tpc_id`  int(11)  unsigned  NOT NULL  AUTO_INCREMENT COMMENT '主键id',
              `cp_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
              `cp_name` varchar(50) NOT NULL DEFAULT '' COMMENT  '项目名称',
              `tpc_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
              `created_at` datetime NOT NULL DEFAULT now() COMMENT '创建时间',
              `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
              `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
              PRIMARY KEY (`tpc_id`),
              KEY `idx_cp_id` (`cp_id`)
            ) COMMENT = 'tms项目配置表';
   

CREATE TABLE `tms_outsource_rule_conf` (
  `torc_id`  int(11)  unsigned  NOT NULL  AUTO_INCREMENT COMMENT '主键id',
  `torc_uid` int(11) NOT NULL DEFAULT '0' COMMENT '联系人uid',
  `torc_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人名称',
  `torc_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `torc_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '城市名称',
  `torc_far_type` int(4) NOT NULL DEFAULT '0' COMMENT '超远距离类型  1 减30km 2不减30km',
  `torc_dryrun_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '空跑费',
  `torc_standard_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '标准操作费',
  `torc_sameperson_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '相同人续单费',
  `torc_diverseperson_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '不相同人续单费',
  `torc_remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `torc_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT now() COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`torc_id`)
) COMMENT = '外协费用规则配置';

CREATE TABLE `tms_outsource_rule_box` (
  `torb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `torc_id` int(11) NOT NULL DEFAULT '0' COMMENT '外协费用规则配置id',
  `torb_sto_id` int(11) NOT NULL DEFAULT '0' COMMENT '存货序号',
  `torb_sto_name` varchar(32) NOT NULL DEFAULT ''  COMMENT '存货名称',
  `torb_box_fee` decimal(10,2)NOT NULL DEFAULT '0.00' COMMENT '箱型费',
  `torb_type` int(4) NOT NULL DEFAULT '0'  COMMENT '大箱补贴 2多箱补贴',
  `torb_visible` int(1) NOT NULL DEFAULT '1' COMMENT '1有效 2无效',
  `created_at` datetime NOT NULL DEFAULT now() COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`torb_id`),
  KEY `idx_torc_id` (`torc_id`)
) COMMENT='外协费用规则配置附属表';

//供应商 新增状态
ALTER table tms_supplier add COLUMN tms_sup_status  int(4) not null  default '1' COMMENT '状态 1正常 2停用'



ALTER table tms_project_config add COLUMN pickup_collect_note_switch  tinyint(4)  not null  DEFAULT '0' COMMENT '取件给收件方发送短信开关 1发送 0不发送'

ALTER table tms_route_recommend add COLUMN tms_rr_to_id  int(11)  not null  DEFAULT '0' COMMENT '订单to_id',ADD  INDEX idx_tms_rr_to_id (  `tms_rr_to_id`  );


百优康国际货运代理
UPDATE operation SET opn_source = 1  WHERE opn_id = 5909144；

//修改类型
 alter table tms_mf_shipnoadd modify column tms_mf_send_month varchar(15) COMMENT '发货月份';
 //修改长度
 alter table work_map modify column wmp_tops_name varchar(300) COMMENT '站点名称';

 cuishilei Cui123
 60988387

谷歌邮箱
shileicui666@gmail.com
S***123
docker 
csl666
S***123
git  http://2587984bx6.zicp.vip
cuishilei   aiuz4mz_ggU5*'kO
cuishilei   123456
18310120387@163.com    k7el2*B{vxfpzp~R  yapi.ashsh.com.cn

生生git
http://2587984bx6.zicp.vip/dashboard/projects

git remote update origin -p
021-5429-6788
cxv+T\o6-spT7wxr
yxeVvbRfyakxeA==

throw new \RuntimeException('');
catch (\Exception $e) {
           return $e->getMessage();
       }

取件 order/get
发货 order/dissend   order/qxdissend  order-closing/dissend *
提货 order/distask  order-closing/distask *  order/mdljdistask
派件 order/send


订单列表/批量发货（order-closing/plsend）、确认（order/auditing）

订单详情/确认（order/auditing）、取件（order/get）、发货（order/dissend）、提货（order/distask）、派件（order/send）

迈迪朗杰订单/确认（order/auditing）

石药订单/确认（order/auditing）、批量取件（order/syplget）

晏嘉订单/确认（）

临检项目/确认（order/auditing）、批量取件（order/ljplget）*、批量派件（order/ljplsend）

订单调度/批量提货（dispatch/plpick）


   \Yii::error('csl=========$to_id========'.$to_id);
        \Yii::error('csl=========$opn_type========'.$opn_type);
        \Yii::error('csl=========info========'.json_encode($post,JSON_UNESCAPED_UNICODE));

  //物流跟踪日志
  TmsLogisticsRemark::add();

  60944067 测试环境 记得 测一下 发货

61190200

45165652

订单列表/批量发货、确认
订单详情/确认、取件、发货、提货、派件
迈迪朗杰订单/确认
石药订单/确认、批量取件
晏嘉订单/确认
临检项目/确认、批量取件、批量派件
订单调度/批量提货


    //合单订单 子单处理
        if ($transport['to_attributes'] == 3) {

            TmsLogisticsRemark::addonelog($transport['to_pid'], $region_id, $region_name, $opn_date, $opn_name, $opn_type, $uid, $name, $stop_region_name, $to_receipt);

            //子订单物流跟踪日志 冗余
            $transports = TransportOrder::find()
                ->select("to_id")
                ->where(["to_pid" => $transport['to_pid']])
                ->asArray()->all();

            foreach ($transports as $info) {
                TmsLogisticsRemark::addonelog($info['to_id'], $region_id, $region_name, $opn_date, $opn_name, $opn_type, $uid, $name, $stop_region_name, $to_receipt);
            }
            return true;
        }



        江苏恒瑞医药股份有限公司-综合事业部

function cui(index = 0) {
    //+now.getFullYear()
    var now = new Date();
    var now_date = 'csl'+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+(now.getDate()<10?"0":"")+now.getDate();
    
    $('input[name=to_no]').val(now_date + index);

    $('#e_cu_name').val('kh20120001-百优康国际货运代理（上海）有限公司')
    $('#e_cu_no').val('kh20120001')
    $('#e_cu_id').val('20120001')
    $('#cp_name').val('冷链运输-冷链运输')
    $('#cp_id').val('9477')
    $('#start_region_name').val('北京市')
    $('#start_region_id').val('110000')
    $('#stop_region_name').val('天津市')
    $('#stop_region_id').val('120000')

    $('#ol_pickup_planbegin').val(now.getFullYear()+'-'+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+'-'+(now.getDate()<10?"0":"")+now.getDate())
    
    $('#ol_delivery_planbegin').val(now.getFullYear()+'-'+((now.getMonth()+1)<10?"0":"")+(now.getMonth()+1)+'-'+(now.getDate()<10?"0":"")+now.getDate())
    
    $('#ol_pickup_planfw').val('7')
    
    $('#ol_delivery_planfw').val('5')
    $('#start_co_name').val('崔市磊')
    $('#start_co_mobile_phone').val('18310102039')

    $('#start_co_address').val('生生物流')
    $('#stop_co_name').val('崔市磊')
    $('#stop_co_mobile_phone').val('18919293876')
    $('#stop_co_address').val('生生物流')

    $('select[name=to_thermometer]').val('1');
    $('#temperature_num').val('91')
    $("#to_goodstype").val('2')
    $("#to_timelimit").val('1')
    $("#to_trequirement").val('0')
    $("#to_category").val('1')
    $('#to_insure').val('0')

    //$('#dosub').click()
    //$("body > div.bui-message.bui-dialog.bui-overlay.bui-ext-position.x-align-cc-cc > div.bui-stdmod-footer > button.button.button-primary").click()

}
cui()
function sleep(numberMillis) {
    var now = new Date();
    var exitTime = now.getTime() + numberMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
}
function co() {
    for (let index = 0; index < 2; index++) {

        cui(index)
        
        var now = new Date();
        var exitTime = now.getTime() + 10000;
        while (true) {
            now = new Date();
            if (now.getTime() > exitTime)
                return;
        }
    }
}

function mr() {
     $('#start_region_name').val('北京市')
    $('#start_region_id').val('110000')
    $('#stop_region_name').val('天津市')
    $('#stop_region_id').val('120000')

    $('#ol_pickup_planbegin').val('2022-05-23')
    $('#ol_pickup_planfw').val('7')
    $('#start_co_name').val('崔市磊')
    $('#start_co_mobile_phone').val('18310102039')

    $('#start_co_address').val('生生物流')
    $('#stop_co_name').val('崔市磊')
    $('#stop_co_mobile_phone').val('18919293876')
    $('#stop_co_address').val('生生物流')

    $('select[name=to_thermometer]').val('1');
    $('#temperature_num').val('91')
    $("#to_goodstype").val('2')
    $("#to_timelimit").val('1')
    $("#to_trequirement").val('0')
    $("#to_category").val('1')
    $('#to_insure').val('0')
}
