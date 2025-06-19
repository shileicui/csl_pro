<?

加油费、路桥费车辆所属城市冗余
feature_23542_csl_20250102
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=23542  未上线




ALTER table
  tms_refuel_record
ADD
  COLUMN car_region_id int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '车辆所属城市城市ID car.region_id',
ADD
  COLUMN car_region_name char(128) NOT NULL DEFAULT '' COMMENT '车辆所属城市名 car.region_name';


ALTER table
  tms_road_record
ADD
  COLUMN car_region_id int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '车辆所属城市城市ID car.region_id',
ADD
  COLUMN car_region_name  char(128) NOT NULL DEFAULT '' COMMENT '车辆所属城市名 car.region_name';




车辆加油汇总优化
feature_23547_csl_20250103
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=23547  已上线


CAR-T同城订单节点改造
feature_23618_csl_20250107  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=23618   未上线








客户端下单小程序   
feature_22944_csl_20241115  mini_program
feature_22944_csl_20250113  tms_admin

feature_22944_csl_20250120  oms_admin

feature_22944_csl_20250222  oms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=22944  未上线




UPDATE customer_configure
SET source = CONCAT(source, ',11')
WHERE source LIKE '%2%' AND source NOT LIKE '%11%';


//上线记得加  params.php
    'customerConfig' => require(__DIR__ . '/customerConfig.php'),
    'weChatParams' => require(__DIR__ . '/weChatParams.php'),




oms_config.php 

,11=>'小程序合同订单'


//订单来源
    'to_source' => [1=>'oms系统', 2=>'客户oms系统' ,3=>'微信服务号', 4=>'API接口', 5=>'国际系统',6=>'迈迪朗杰API',7 => 'OMS系统批量导入', 8 => '机器人邮件自动下单',9 => '小程序',10=>'宴嘉API',11=>'小程序合同订单'],


MINI_PROGRAM_CUID

//特殊客户的白名单
{
  "cu_id": [
   201900710
  ]
}

        <div style="width: 100%;height: 210px;margin-top: 60px">
            <style>.btn { width:100%;
                    height:54px;
                    border:2px solid rgba(0,149,162,1);
                    border-radius:8px;
                    background:#fff;
                    color:rgba(0,149,162,1);
                    font-size:19px;
                    font-weight:600;
                    margin-top:15px; }</style>
            <button class="btn apply-btn">前往小程序</button>
        </div>



// MINI_PROGRAM_NOT_CUID

// //特殊客户的黑名单
// {
//   "cu_id": [
//     20120010,
//     20120504,
//     202000110,
//     201900710,
//     20120206,
//     202100384,
//     202001201,
//     201207741
//   ]
// }









//暂时不需要客户配置 start
// alter table
//   customer
// add
//   column `program_contract_order`  tinyint(1) NOT NULL DEFAULT '1' COMMENT '小程序允许下无合同订单 1关闭 2开启';


// UPDATE customer SET  program_contract_order = 1;

//
// ALTER TABLE customer
// MODIFY COLUMN program_contract_order tinyint(1) NOT NULL DEFAULT '1' COMMENT '小程序允许下无合同订单 1关闭 2开启';


// customer_conf  新增

// 'program_contract_order' => array('on' => 2, 'off' => 1, 'label' => '小程序允许下无合同订单', 'span' => ''), //小程序允许下无合同订单  1：关闭 2：开启

// program_contract_order


//暂时不需要客户配置 end




















//下多温区合单
  "cpc_many_temperature": "1",

  "to_temperatures": [
    "11",
    "12"
  ],


稀释液 选药品 根据 温度 发货城市



      // 是否展示货物
    // to_business_type：出货仓库   生生||非生生
    // to_goodstype：货物类型 临床药品||ivd(器械)
    // 订单类型：to_category  dtp
    cargoShowStatus() {
      if (this.activeTab != 3) {
        if (this.ruleForm.to_carrier_type == 2) return false
        if (this.ruleForm.to_business_type == 2) {
          return false
        } else if (this.ruleForm.to_goodstype == 12) {
          return false
        } else if (this.ruleForm.is_dtp == 1) {
          return this.show_dtp_goods_cpids.includes(Number(this.ruleForm.cp_id))
        } else {
          return true
        }
      } else {
        return false
      }

      // show_dtp_goods_cpidsreturn ruleForm.to_business_type != 2 && ruleForm.to_goodstype != 12 && ruleForm.to_category != 4
    },




    https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=23694



'to_goodstype_cuid' => [
[
"cu_id" => [201206985],//诺和诺德（中国）制药有限公司
"goods_id" => [11=>'样品']
],
[
"cu_id" => [201900151],
"goods_id" => [12 => '稀释液']
],
[
            "cu_id" => [ ],
            "goods_id" => [13 => '体外诊断试剂']
        ],
[
            "cu_id" => [202105449],
            "goods_id" => [14 => '细胞制剂']
        ],
[
            "cu_id" => [20120272,201900296],
            "goods_id" => [15 => '原料药']
        ],
],


    


ALTER table
  car_repair
ADD
  INDEX idx_ca_id (`ca_id`);








车辆保险状态同步优化

feature_24288_csl_20250218  tms_service

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24288  未上线




服务号引导到小程序下单
feature_csl_24510_20250306
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24510  已上线



外协操作费地址标红同步bms
feature_csl_24554_20250311  tms_admin
feature_csl_24554_20250311  tms_service
feature_csl_24554_20250320  omsapi
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24554  已上线






服务号引导小程序走配置
feature_25712_csl_20250529  oms_wechat
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25712  未上线

OMS_WECHAT_CUST_CONFIG
{
	"cu_id":[
		202000086
	],
	"sg_id":[
		42
	]
}





https://api.weixin.qq.com/cgi-bin/user/info?access_token=90_LyYI-ivLzDeJXxCDXQ63xNP3RUevYvUYXVO1dWOt6rT4i9mkPVfQIQADDE8JMng1JtFpvyAZSXAl73Tey2U-ouQq6z4IpX6MQgr2rfDBj60bW5BdLMemJd4iG88IWJgACAZNA&openid=oKTZF6nsTG5z7tqmPpTJB7Z4cmos&lang=zh_CN




：access_token90_LyYI-ivLzDeJXxCDXQ63xNP3RUevYvUYXVO1dWOt6rT4i9mkPVfQIQADDE8JMng1JtFpvyAZSXAl73Tey2U-ouQq6z4IpX6MQgr2rfDBj60bW5BdLMemJd4iG88IWJgACAZNAopenidoKTZF6nsTG5z7tqmPpTJB7Z4cmos



pagesC/statementAfAccount/statementDetails



//19号改动
feature_csl_20250319







客户端供应链入库订单审核状态调整
feature_24667_csl_20250324   mini_program
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24667

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24699




车辆维保冗余优化
feature_24753_csl_20250325
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24753  已上线


服务号跳转到小程序优化
feature_24730_csl_20250325
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24730   已上线



小程序和服务号关联
feature_24758_csl_20250326  oms_wechat
feature_24758_csl_20250326  mini_program
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24758  已上线







CREATE TABLE `wechat_openid` (
  `wo_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `unionid`  varchar(32) NOT NULL DEFAULT '' COMMENT '微信unionid',
  `service_openid` varchar(32) NOT NULL DEFAULT '' COMMENT '服务号openid',
  `mini_openid` varchar(32) NOT NULL DEFAULT '' COMMENT '小程序openid',
  `wo_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`wo_id`),
  KEY `idx_unionid` (`unionid`) ,
  KEY `idx_service_openid` (`service_openid`) ,
  KEY `idx_mini_openid` (`mini_openid`)
)  COMMENT='微信小程序服务号openid表';



//搜索条件






客户小程序-运单支持查询收发客户
feature_24762_csl_20250326
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24762  已上线





小程序提发货子单扫码优化
feature_24864_csl_20250401
http://project.ashsh.com.cn/index.php?m=task&f=view&id=24864  废弃





冷机保养添加限制优化
feature_25016_csl_20250410 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25016  已上线






客户小程序-白名单修改为客户配置

feature_24763_csl20250410  oms_admin

feature_24763_csl_20250410 mini_program

feature_24763_csl_20250411 oms_wechat

feature_24763_csl_20250411 oms_service

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24763  已上线


MINI_PROGRAM_CUID


 alter table
   customer
 add
   column `mini_program_switch`  tinyint(1) NOT NULL DEFAULT '1' COMMENT '允许小程序下单 1关闭 2开启';



   'mini_program_switch' => array('on' => 2, 'off' => 1, 'label' => '允许小程序下单', 'span' => ' (请谨慎勾选，选中则屏蔽客户服务号下单功能，切换至小程序下单 )'), //允许小程序下单  1：关闭 2：开启



保险查询优化
feature_25059_csl_20250414  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25059  已上线



车辆保养提醒优化
feature_25087_csl_20250416  tms_admin
feature_25087_csl_20250416  omsapi
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25087 已上线












小程序对账通知
feature_24559_csl_20250312  oms_admin
feature_24559_csl_20250318  mini_program
//feature_24559_csl_20250320  customer_ns
feature_24559_csl_20250314  oms_service

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24559  已上线





小程序收发件地址保存添加限制
feature_24907_csl_20250403  mini_program
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24907  未上线







车辆保险优化
feature_csl_25138_20250421  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25138  已上线


小程序下单添加限制
mini_program
feature_25192_csl_20250424
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25192 已上线


支持管理员账号不需要选项目也能下单  测试中
车辆保险优化   已上线 4.21
小程序下单添加限制 已上线 4.24
小程序审核通知  已完成  4.26
下周
跟进 小程序审核通知 测试
车辆违章增加批量处理功能



车辆违章增加批量处理功能
feature_25214_csl_20250425  tms_admin 
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25214  已上线



https://oms.ashsh.com.cn:18012/index.php?r=common/dwon-drive-record&month_start=2025-06-01&month_end=2025-06-12



回收药下单默认无温度要求
feature_25334_csl_20250506
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25334  未上线



小程序审核通知
feature_25086_csl_20250416 oms_service
feature_25086_csl_20250416 mini_program
feature_25086_csl_20250416 customer_cs
feature_25086_csl_20250421 oms_wechat

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25086 已上线
上线记得提醒 老黄 改文件名称



客户小程序-允许管理员不选择项目下单
feature_24778_csl_20250327
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24778  已上线





小程序支持草稿箱功能
mini_program
feature_25194_csl_20250508
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25194  已上线









客户小程序-允许管理员不选择项目下单  待上线
小程序审核通知 测试中
小程序支持草稿箱功能  已完成  5.9
下周
跟进  小程序支持草稿箱功能 测试
客户小程序-特殊客户配置支持多温区下单







货物类型保存优化
feature_25416_csl_20250512
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25416





诺和导出表格文案调整
featuer_25440_csl_20250514  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25440



限制外协不允许申报发货费用
feature_25566_csl_20250520  tms_admin
feature_25566_csl_20250520  omsapi
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25566  已上线






车辆冷机保养提醒调整
feature_25597_csl_20250521  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25597  已上线





feature_cart_202505233



项目修改CAR-T已确认订单
feature_25634_csl_20250523 tms_admin
feature_25634_csl_20250523 oms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25634 未上线



客户小程序-允许管理员不选择项目下单  已上线 5.19
小程序审核通知  已上线 5.21
小程序支持草稿箱功能 已上线 5.19
客户小程序-特殊客户配置支持多温区下单（接口已完成） 进行中
客户小程序-支持不选温度下单（根据药品温度拆单） 进行中

限制外协不允许申报发货费用  已上线 5.22
车辆冷机保养提醒调整  已上线 5.22

下周

客户小程序-特殊客户支持不选温度下单（根据药品温度拆单）
项目修改CAR-T已确认订单


客户端小程序新增地址优化
feature_25681_csl_20250527
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25681 已上线





oms
特殊客户配置支持多温区下单（接口已完成） 进行中
客户小程序-特殊客户支持不选温度下单（根据药品温度拆单）接口已完成	  进行中
小程序新增地址、新增货物优化	已完成  5.29
CRA、CRC下单，发件地址绑定医院地址	进行中

tms
项目修改CAR-T已确认订单  已完成 5.28

下周
CRA、CRC下单，发件地址绑定医院地址



路桥费导入优化
feature_25732_csl_20250603  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25732  未上线








预报单导出
feature_25768_csl_20250605
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25768 未上线

forecast-sheet-export

forecast_export_conf


CREATE TABLE `forecast_export_conf` (
  `fec_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '查询序号',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `fec_type` tinyint(4) unsigned DEFAULT '0' COMMENT '属性类型，0我的查询，1',
  `fec_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `fec_content` text COMMENT '内容',
  `fec_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`fec_id`),
  KEY `ur_uid` (`ur_uid`)
) COMMENT='预报单导出配置';


FORECAST_EXPORT_CONFIG

{"rowNum" :"序号",
"supplierName" :"供应商",
"cu_name" :"委托客户",
"cp_name" :"项目名称",
"shipment_city" :"发件城市",
"start_cu_name" :"发件单位",
"start_address" :"发件地点",
"start_co_name" :"发件人",
"start_mobile_phone" :"发件人联系方式",
"reserve_pick_time" :"预约取件时间",
"reserve_delivery_time" :"预约派件时间",
"ol_pickup_time" :"实际取件日期",
"ol_delivery_time" :"实际派件时间",
"signStatusExplain" :"签收状态",
"to_no" :"运单号",
"ol_goods_quantity" :"取件数量",
"ol_pickup_quantity" :"实取数量",
"to_temperature_name" :"运输温度",
"cp_no" :"项目编号",
"to_customer_no" :"客户单号",
"ol_remark" :"取派备注",
"ol_become_time" :"采血时间",
"to_remark" :"客户备注",
"gdseriesnumber" :"温度计序列号",
"recipient_city" :"收件城市",
"stop_cu_name" :"收件单位",
"stop_address" :"收件地址",
"stop_co_name" :"收件人",
"stop_mobile_phone" :"收件人联系方式",
"to_email" :"反馈邮箱",
"to_status" :"订单状态",
"to_source" :"订单来源",
"order_time" :"下单时间",
"rt_name" :"路由名称",
"boxtype" :"箱型",
"accessorytype" :"配件",
"quantity" :"数量",
"station_str" :"途经节点",
"contact_name" :"委托人姓名",
"contact_tel" :"委托人联系方式",
"current_city" :"当前所在城市",
"to_goodstype" :"货物类型",
"cptag" :"项目标签",
"ol_sign_name" :"签收人",
"ow_date" :"派件工作单日",
"estimate_type" :"预派件时段"}












客户小程序-特殊客户配置支持多温区下单
feature_25393_csl_20250509
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25393  未上线


特殊客户支持不选温度下单
feature_25458_csl_20250515    mini_program
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25458  未上线


MINI_NOT_TEMPERATURE
{
    "cu_id": [
        20120010,
        20120504,
        202000110,
        20120206,
        202100384,
        201900710,
        202001201
    ],
    "cp_id": [
        16812
    ],
    "noshow_date_cuid": [
        202100384,
        20120206
    ]

}


特殊客户逻辑
feature_25789_csl_20250609
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25789  未上线


MINI_CUSTOMER_CONFIG  小程序下单客户可选项配置	

{
	"other_good_show":[201206985],
	"drug_show":[201900151],
	"cod_amount_show":[202001281],
	"title_text_show":[20120010],
	"jinmanli_show":[202100068,20120083],
	"to_goodstype_noshow":[20120010,20120206,20120504,201207741,201900702,201900710,202000110,202000187,202000528,202100384,202100841,202100899],
	"no_week_show":[20120010,201900710,20120206,202100384,202001201]
}


customer-order/create-data


materials





MINI_ID_CONFIG

{
    "drug_city_id": [
        440100,
        220100
    ],
    "cod_amount_cp_id":[
    	5738
    ],
    "title_text_cp_id":[7221],
    "title_text":"基因外周血-恒温10~30℃,基因肿瘤组织-恒温10~30℃,PK血样-超低温-60~100℃",
    "jinmanli_text":"下单时间：周一~周日 上午8:30-下午17:30，正常上班时间最快可预约次日取件，如非正常上班时间以及县级医院预约送检，需提前2天下单。（国家法定节日放假另行通知）",
    "no_week_cp_id":[16812]
}


to_goodstype

试验中心编号





特殊客户逻辑-不选 运输温度、预取日期、预派日期、运输时效下单
feature_25827_csl_20250611
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25827  未上线


客户端项目专员/CRA、客户端项目经理 



车辆加油记录及导入优化
feature_csl_25650_20250616
https://project.ashsh.com.cn/index.php?m=task&f=view&id=25650




ALTER table
  tms_refuel_record_bill
ADD
  COLUMN discounts_money  decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠消费金额';