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


上次保养里程 （保养类型：常规保养，临时保养，首次保养）



新增 保养类型：临时保养 属于上次保养里程范围（任务来源天山）









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


20120010	江苏恒瑞医药股份有限公司-肿瘤临床研究部
20120206	广东东阳光药业股份有限公司
20120504	上海恒瑞医药有限公司
201900710	江苏恒瑞医药股份有限公司-综合产品事业部
202000110	江苏恒瑞医药股份有限公司-中央医学事务部
202001201	歌礼生物科技（杭州）有限公司
202100384	诺合泰生物科技（重庆）有限公司

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
    ],//出库不选择运输温度客户id
    "cp_id": [
        16812
    ],//出库不选择运输温度cpid
    "noshow_date_cuid": [
        202100384,
        20120206
    ]//出库不选择预取、预派、时效 配置

}


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
	"other_good_show":[201206985],//显示随货物资
	"cu_name_show":[201206985],
	"drug_show":[201900151],//勃林 货物类型稀释液、 发件城市在广州、长春 支持 选药品  
	"cod_amount_show":[202001281],//到付金额 、到付方式
	"title_text_show":[20120010],//顶部 显示 title_text
	"jinmanli_show":[202100068,20120083],// 修改订单、下单提醒 (只提醒一次 ) jinmanli_text
	"to_goodstype_noshow":[20120010,20120206,20120504,201207741,201900702,201900710,202000110,202000187,202000528,202100384,202100841,202100899],//服务号特殊逻辑 客户端CRC账号 隐藏 货物类型：临床药品
	"no_week_show":[20120010,201900710,20120206,202100384,202001201],//周末不弹框 选择了项目 并且 货物类型：临床药品  并且   出货仓库：生生仓库出库
	"cargo_size_show":[201207340],//显示货物尺寸  
	"compute_box_show":[201600962]//柯乾-获取箱型
}


{
    "other_good_show": [
        201206985
    ],
    "cu_name_show": [
        201206985
    ],
    "drug_show": [
        201900151
    ],
    "cod_amount_show": [
        202001281
    ],
    "title_text_show": [
        20120010
    ],
    "jinmanli_show": [
        202100068,
        20120083
    ],
    "to_goodstype_noshow": [
        20120010,
        20120206,
        20120504,
        201207741,
        201900702,
        201900710,
        202000110,
        202000187,
        202000528,
        202100384,
        202100841,
        202100899
    ],
    "no_week_show": [
        20120010,
        201900710,
        20120206,
        202100384,
        202001201
    ],
    "cargo_size_show": [
        201207340
    ],
    "compute_box_show": [
        201600962
    ],
    "is_ad_goods": [
        202000722
    ]
}

,
    "send_date_flag": [
        201900162,201207722
    ]
customer-order/create-data


materials





MINI_ID_CONFIG

{
    "drug_city_id": [
        440100,
        220100
    ],//勃林 货物类型稀释液、 发件城市在广州、长春 支持 选药品  
    "cod_amount_cp_id":[
    	5738
    ],//到付金额 、到付方式
    "title_text_cp_id":[7221],
    "title_text":"基因外周血-恒温10~30℃,基因肿瘤组织-恒温10~30℃,PK血样-超低温-60~100℃",
    "jinmanli_text":"下单时间：周一~周日 上午8:30-下午17:30，正常上班时间最快可预约次日取件，如非正常上班时间以及县级医院预约送检，需提前2天下单。（国家法定节日放假另行通知）",
    "no_week_cp_id":[16812],//周末不弹框 选择了项目 并且 货物类型：临床药品  并且   出货仓库：生生仓库出库
    "become_cp_id":[1154,2243]//显示采血时间
}

{
    "drug_city_id": [
        440100,
        220100
    ],
    "cod_amount_cp_id": [
        5738
    ],
    "title_text_cp_id": [
        7221
    ],
    "title_text": "基因外周血-恒温10~30℃,基因肿瘤组织-恒温10~30℃,PK血样-超低温-60~100℃",
    "jinmanli_text": "下单时间：周一~周日 上午8:30-下午17:30，正常上班时间最快可预约次日取件，如非正常上班时间以及县级医院预约送检，需提前2天下单。（国家法定节日放假另行通知）",
    "no_week_cp_id": [
        16812
    ],
    "become_cp_id": [
        1154,
        2243
    ]
}


to_goodstype

试验中心编号





特殊客户逻辑-2
feature_25827_csl_20250611
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25827  未上线


客户端项目专员/CRA、客户端项目经理 



车辆加油记录及导入优化
feature_csl_25650_20250616
https://project.ashsh.com.cn/index.php?m=task&f=view&id=25650  已上线


ALTER table
  tms_refuel_record_bill
ADD
  COLUMN discounts_money  decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠消费金额';

  $model->car_region[$value['car_region_city']];



 预报单导出优化
  https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25949

  featrue_25949_csl_20250624




小程序特殊客户-3
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25966


/customer/customer-common/inventory-detail_x.html



小程序下单区县优化
feature_csl_25993_20250626
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25993  






无法找到该城市

update customer_address





ITSJ202506290001


客户下单填写CRA/CRC信息
feature_26115_csl_20250703
http://project.ashsh.com.cn/index.php?m=task&f=view&id=26115 未上线



小程序现结授权登录提示优化
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26124  已上线



小程序不支持选药编号限制
feature_26126_csl_20250704
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26126  未上线




温控运输下单不允许选择无温度计
feature_26131_csl_20250704
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26131  未上线


特殊客户逻辑
feature_25789_csl_20250609
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25789  未上线



//上线发这一个就够了
小程序查询列表新增功能及其他调整
feature_26025_csl_20250717
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26025


外勤车、人员管理
feature_26145_csl_20250707
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26145  未上线


ALTER table
  tms_keep_record_car
ADD
  COLUMN tkc_use_nature   tinyint(4) NOT NULL DEFAULT '0' COMMENT  '使用性质  1 临时使用 2 长期使用',
ADD
  COLUMN driving_start_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '驾驶证 开始日期',
ADD
  COLUMN driving_end_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '驾驶证 结束日期',
ADD
  COLUMN travel_start_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '行驶证 开始日期',
ADD
  COLUMN travel_end_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '行驶证 结束日期',
ADD
  COLUMN operator_start_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '运营证 开始日期',
ADD
  COLUMN operator_end_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '运营证 结束日期',

ADD
  COLUMN term_start_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '交强险 开始日期',
ADD
  COLUMN term_end_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '交强险 结束日期',

ADD
  COLUMN commerce_start_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '商业险 开始日期',
ADD
  COLUMN commerce_end_time int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '商业险 结束日期',

ADD
  COLUMN main_refrigerator_state   tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否有主冷机  1是 2 否',
ADD
  COLUMN main_refrigerator_version  varchar(255) NOT NULL DEFAULT '' COMMENT '主冷机型号',
ADD
  COLUMN vice_refrigerator_state   tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否有副冷机  1是 2 否',
ADD
  COLUMN vice_refrigerator_version  varchar(255) NOT NULL DEFAULT '' COMMENT '副冷机型号',

ADD
  COLUMN front_portiere_state   tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否有前门帘  1是 2 否',
ADD
  COLUMN later_portiere_state   tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否有后门帘  1是 2 否',
ADD
  COLUMN easy_flow_num int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '易流数量',
ADD
  COLUMN tkrc_remark text COMMENT '备注',
ADD
  COLUMN tkrci_id int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '交强险保险id',
ADD
  COLUMN tkrcr_id int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '车辆保养维保id',
ADD
  COLUMN tkryr_id int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '冬季验证报告id',
ADD
  COLUMN tkrc_tkrci_id int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '商业险保险id',
ADD
  COLUMN tkrc_tkrcr_id int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '冷机保养维保id',
ADD
  COLUMN tkrc_tkryr_id int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '夏季验证报告id',
ADD
  INDEX idx_tkrc_tkrci_id (`tkrc_tkrci_id`),
ADD
  INDEX idx_tkrc_tkrcr_id (`tkrc_tkrcr_id`),
ADD
  INDEX idx_tkrc_tkryr_id (`tkrc_tkryr_id`),
ADD
  INDEX idx_tkrci_id (`tkrci_id`),
ADD
  INDEX idx_tkrcr_id (`tkrcr_id`),
ADD
  INDEX idx_tkryr_id (`tkryr_id`);


CREATE TABLE `tms_keep_record_car_insurance` (
  `tkrci_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tkrci_start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '保险开始日期',
  `tkrci_end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '保险结束日期',
  `tkrci_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '保险类型  1交强险 2 商业险',
  `tkc_id` int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '合格资质车辆id',
  `tkc_car_number` varchar(50)  NOT NULL DEFAULT '' COMMENT '合格资质车辆车牌',
  `tkrci_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tkrci_id`),
  KEY idx_tkc_id (`tkc_id`)
)  COMMENT='合格资质车辆保险表';


CREATE TABLE `tms_keep_record_car_repair` (
  `tkrcr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tkrcr_start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '维保开始日期',
  `tkrcr_end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '维保结束日期',
  `tkrcr_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '维保类型  1车辆保养 2 冷机保养',
  `tkc_id` int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '合格资质车辆id',
  `tkc_car_number` varchar(50)  NOT NULL DEFAULT '' COMMENT '合格资质车辆车牌',
  `tkrcr_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tkrcr_id`),
  KEY idx_tkc_id (`tkc_id`)
)  COMMENT='合格资质车辆维保表';



CREATE TABLE `tms_car_person` (
  `tcp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ur_uid`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT 'uid',
  `username` varchar(50) NOT NULL DEFAULT ''  COMMENT '姓名',
  `identity_start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '身份证 开始日期',
  `identity_end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '身份证 结束日期',

  `driving_start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '驾驶证 开始日期',
  `driving_end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '驾驶证 结束日期',

  `qualification_start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '从业资格证 开始日期',
  `qualification_end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '从业资格证 结束日期',

  `health_start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '健康证 开始日期',
  `health_end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '健康证 结束日期',
  `tcp_remark` text COMMENT '备注',

  `tcp_state`  tinyint(4) NOT NULL DEFAULT '1' COMMENT  '状态  1正常 2停用',
  `tcp_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tcp_id`)
)  COMMENT='资质人员管理';



CREATE TABLE `tms_car_person_cultivate` (
  `tcpc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ur_uids` varchar(1024) NOT NULL DEFAULT ''  COMMENT '培训人员uid',
  `usernames` varchar(1024) NOT NULL DEFAULT ''  COMMENT '培训人员',
  `tcp_ids` varchar(1024) NOT NULL DEFAULT ''  COMMENT '资质人员id',
  `tcpc_content` text  COMMENT '培训内容',
  `cultivate_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '培训时间',

  `tcpc_state`  tinyint(4) NOT NULL DEFAULT '1' COMMENT  '状态  1正常 2停用',
  `tcpc_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tcpc_id`)
)  COMMENT='资质人员培训管理';


ALTER table
  tms_keep_record_car_yzreport
ADD
  COLUMN tkryr_check_time_end int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '验证结束日期',
ADD
  COLUMN tkryr_type tinyint(4)  NOT NULL DEFAULT '0' COMMENT '验证报告类型 1 冬季验证 2 夏季验证';



车辆配件门帘增加附件上传
feature_26151_csl_20250707
http://project.ashsh.com.cn/index.php?m=task&f=view&id=26151  未上线


404,456,509,510,516,517,520,537,587,588

''



 异常坐标地址优化
 feature_26272_csl_20250715
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26272



feature_26293_csl_20250717
车辆行车修改优化
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26293


外勤车、人员管理 开发中  进度90%

小程序不支持选药编号限制  待上线
小程序查询列表优化   待上线   
客户下单填写CRA/CRC信息   待上线 
小程序不支持选药编号提示  待上线  

下周
外勤车、人员管理（消息提醒推送、车辆备案）





CRA和CRC互看的功能先祥医药

https://project.ashsh.com.cn/index.php?m=story&f=view&id=4810




项目配置，单项配置，增加客户单号必填
feature_25962_csl_20250723
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=25962  未上线



路由发运规则项目搜索优化
feature_26364_csl_20250723
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26364



新增客户默认开启白名单

 alter table
   customer
 MODIFY
   column `mini_program_switch`  tinyint(1) NOT NULL DEFAULT '2' COMMENT '允许小程序下单 1关闭 2开启';


   外勤车、人员管理 	验证报告、维保、保险、证照
资质人员管理
资质人员培训管理
消息提醒推送
支持大文件上传、

1.支持大文件上传（分片上传）
2.添加资质合格车辆新增供应商选项
3.添加资质合格人员新增备注字段



外协操作费续单费优化
feature_26449_csl_20250730
feature_26449_csl_20250730
feature_26449_csl_20250805  tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26449  未上线



1、下单选择试验中心
feature_26354_csl_20250730
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26354   未上线



ALTER TABLE
  `customer`
ADD
  COLUMN `cex_require` TINYINT UNSIGNED NOT NULL DEFAULT '1' COMMENT '物流订单试验中心必填 1关闭 2开启'

   'cex_require' => array('on' => 2, 'off' => 1, 'label' => '物流订单可关联试验中心', 'span' => ''), //物流订单可关联试验中心  1：关闭 2：开启



2、DTP拆分
feature_26485_csl_20250731  mini_program
feature_26485_csl_20250731  oms_admin
feature_26485_csl_20250807  order_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26485  未上线




{mini_program}history-data/cp-dtp-data

{
    "1": "DTP",
    "3": "DFP",
    "2": "否"
}


临床非生生运输订单调整
feature_26602_csl_20250804  mini_program
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26602  未上线




DTP拆分 小程序后端
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26601   新建

下单选择试验中心（小程序）
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26600   新建



 冷藏车订单新增委托方
feature_26469_csl_20250731
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26469  已上线





齐鲁制药隐藏收发件信息
feature_26490_csl_20250805
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26490  未上线



导预报单新增定制化下载
feature_26527_csl_20250805
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26527  未上线



{
    "1": "临床样本",
    "2": "回收药",
    "3": "临床药品",
    "4": "其他物品",
    "5": "商业成品药",
    "6": "脐带血",
    "7": "细胞产品或CAR-T",
    "8": "IVD试剂（器械）",
    "9": "特检普检",
    "10": "科研样本",
    "11": "样品",
    "12": "稀释液",
    "13": "体外诊断试剂",
    "14": "细胞制剂",
    "15": "原料药",
    "16": "送检产品",
    "17": "其他临床试验物资",
    "18": "医疗器械",
}



DTP/DFP隐藏逻辑调整
feature_26566_csl_20250807  tms_admin
feature_26566_csl_20250807  tms_service
feature_26566_csl_20250811 dispatch_admin

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26566  未上线

js  版本号记得改大点

 特殊客户签收人支持复选框勾选
feature_26703_csl_20250815
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26703



{
    "1": "10405",
    "2": "10405"
}


{
    "1": "11010",
    "2": "11010"
}


https://project.ashsh.com.cn/index.php?m=story&f=view&storyID=4864




CAR-T预约安排
feature_26732_csl_20250819 tms_admin
feature_26732_csl_20250905 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26732  未上线

测试

//CAR-T预约单消息推送模板ID
define('CART_RESERVE_ORDER_MESSAGE_ID','280');
tms.reserve.ordermsg

线上

//CAR-T预约单消息推送模板ID
define('CART_RESERVE_ORDER_MESSAGE_ID','292');


{
    "msgtype":"markdown",
    "markdown":{
        "content":"@@touser@@ 你有一个@@type_msg@@CAR-T常规预约，请及时安排人员！\n委托客户：@@cu_name@@\n项目名称：@@cp_name@@\n温区：@@to_temperature_name@@\n运输方式：@@to_trequirement_name@@\n运输城市：@@start_end_region@@\n预取日期：@@pickup_date@@\nID：@@tro_id@@@@remark@@"
    },
    "key":"0a28a195-fdee-4354-b239-3413b04999bc"
}

alter table
   tms_city_config
 add
   column `logistics_feedback_uid`   varchar(100) NOT NULL DEFAULT ''  COMMENT '物流反馈人 uid',
add
   column `logistics_feedback_username`   varchar(255) NOT NULL DEFAULT ''  COMMENT '物流反馈人名称 ',
 add
   column `consumable_feedback_uid`   varchar(100) NOT NULL DEFAULT ''  COMMENT '耗材反馈人 uid',
 add
   column `consumable_feedback_username`   varchar(255) NOT NULL DEFAULT ''  COMMENT '耗材反馈人名称';




CREATE TABLE `tms_reserve_order` (
  `tro_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cu_id`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '委托客户id',
  `cu_name`  varchar(255) NOT NULL DEFAULT ''  COMMENT '委托客户名称',
  `cp_id`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '项目id',
  `cp_name`  varchar(255) NOT NULL DEFAULT ''  COMMENT '项目名称',
  `to_temperature` tinyint(4) unsigned NOT NULL DEFAULT '0'   COMMENT '温区',
  `to_temperature_name`  varchar(100) NOT NULL DEFAULT ''    COMMENT '温区名称',
  `to_trequirement` tinyint(4) unsigned NOT NULL DEFAULT '0'   COMMENT '运输方式 2 专人 3 专车',

  `start_region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发件城市ID',
  `start_region_name` varchar(128) NOT NULL DEFAULT '' COMMENT '发件城市名',
  `stop_region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '收件城市ID',
  `stop_region_name` varchar(128) NOT NULL  DEFAULT '' COMMENT '收件城市名',

  `arrange_region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安排城市ID',
  `arrange_region_name` varchar(128) NOT NULL  DEFAULT '' COMMENT '安排城市名',

  `pickup_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '预取时间',
  `delivery_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '预派时间',
  `reserve_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '预约生成时间',
  `feedback_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '反馈时间',

  `tro_type` tinyint(4) unsigned  NOT NULL  DEFAULT '1'   COMMENT '预约状态 1未反馈 2已反馈 3已确认 4已驳回 5已下单',
  `to_id` int(11)  unsigned NOT NULL DEFAULT '0'  COMMENT '绑定的订单id',

  `logistics_ur_uid`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '物流反馈人uid',
  `logistics_username` varchar(50) NOT NULL DEFAULT ''  COMMENT '物流反馈人姓名',

  `consumable_ur_uid`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '耗材反馈人uid',
  `consumable_username` varchar(50) NOT NULL DEFAULT ''  COMMENT '耗材反馈人姓名',

  `operation_uid`   varchar(100) NOT NULL DEFAULT ''  COMMENT '人员姓名 uid',
  `operation_username`   varchar(255) NOT NULL DEFAULT ''  COMMENT '人员姓名',
  `phone_number` varchar(50) NOT NULL DEFAULT '' COMMENT '手机号',
  `identity_card` varchar(100) NOT NULL DEFAULT '' COMMENT '身份证号',
  `car_number` varchar(50) NOT NULL DEFAULT ''  COMMENT '车牌号',
  `start_train_number` varchar(50) NOT NULL DEFAULT ''  COMMENT '去往车次',
  `end_train_number` varchar(50) NOT NULL DEFAULT ''  COMMENT '返程车次',
  `start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '出发日期',
  `end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '返回日期',

  `box_number`   varchar(50) NOT NULL DEFAULT ''   COMMENT '保温箱编号',
  `temp_number_one`   varchar(50) NOT NULL DEFAULT ''   COMMENT '温度计编号1',
  `temp_number_two`   varchar(50) NOT NULL DEFAULT ''   COMMENT '温度计编号2',
  `temp_number_three`   varchar(50) NOT NULL DEFAULT ''   COMMENT '温度计编号3',
  `tro_remark` text  COMMENT '备注',

  `designate_ur_uid`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '指派人uid',
  `designate_username` varchar(50) NOT NULL DEFAULT ''  COMMENT '指派人姓名',

  `consumable_designate_ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '耗材指派人-id',
  `consumable_designate_username` varchar(50) NOT NULL DEFAULT '' COMMENT '耗材指派人',
  `contradict_remark`   varchar(500) NOT NULL DEFAULT ''  COMMENT '驳回原因',

  `tro_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tro_id`),
  KEY idx_cu_id (`cu_id`),
  KEY idx_cp_id (`cp_id`)
)  COMMENT='car-t预约单';


alter table
   tms_reserve_order
add
   column `pick_address`   varchar(800) NOT NULL DEFAULT ''  COMMENT '取件地址',
add
   column `delivery_address`   varchar(800) NOT NULL DEFAULT ''  COMMENT '派件地址',
 add
   column `reserved_remark`  text  COMMENT '预约单备注';


//不加项目
{
    "cu_ids": [
        202101157,
        202105217
    ],
    "cp_ids": [
        8548,
        8595,
        25302,
        25303,
        25330,
        25331
    ],
    "recycle_cp_ids": [
        8595,
        25303,
        25330
    ],
    "single_cp_ids": [
        8548,
        25302,
        25331
    ]
}


温度计绑定限制配置优化
feature_26729_csl_20250819
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26729  已上线







车辆维保台账页面
feature_26800_csl_20250821
https://project.ashsh.com.cn/index.php?m=task&f=view&id=26800 未上线



预报单定制化
feature_26814_csl_20250822
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26814  未上线


CREATE TABLE `tms_forecast_mailtemp` (
  `tfm_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cu_id`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '委托客户id',
  `cu_name`  varchar(255) NOT NULL DEFAULT ''  COMMENT '委托客户名称',
  `tfm_title`  varchar(500) NOT NULL DEFAULT ''  COMMENT '邮件标题',
  `tfm_content` text  COMMENT '邮件内容',
  `tfm_receiver` text COMMENT '邮件接收人',
  `tfm_person` text COMMENT '邮件抄送人',
  `tfm_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tfm_id`),
  KEY idx_cu_id (`cu_id`)
)  COMMENT='预报单邮件模板';



 财务获取绑定的车辆数据接口调整
 feature_26981_csl_20250904
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=26981


预报单发送邮件-支持富文本编辑器




DTP拆分     已上线
DTP/DFP隐藏逻辑调整  已上线
临床非生生运输订单调整  待测试

预报单定制化  已上线
预报单发送邮件-支持富文本编辑器 已上线
car-t预约单   进行中（进度 90%）

下周计划
car-t预约单  完成开发


承运商车辆支持模糊查询
feature_27027_csl_20250905
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27027  已上线





车辆行车列表增加冷机附件
feature_27004_csl_20250908
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27004



预报单发邮件模板配置调整
feature_27062_csl_20250908
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27062  已上线




预报单发送邮件支持上传多个附件
feature_27070_csl_20250908
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27070  已上线




car-t订单退回取件方调整
feature_27114_csl_20250911
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27114  已上线






物流项目配置汇总改造
feature_27188_csl_20250917
https://project.ashsh.com.cn/index.php?m=task&f=view&id=27188  未上线


TMS_PROJECT_CONFIG
{
    "pickup_collect_note_switch": {
        "on": 1,
        "off": 0,
        "label": "取件给收件方发送短信",
        "span": "取件完成，给收件人发送短信"
    },
    "pickup_client_mail_switch": {
        "on": 1,
        "off": 0,
        "label": "取件给客户发送邮件",
        "span": "取件完成，给客户发送邮件"
    },
    "note_code_switch": {
        "on": 1,
        "off": 0,
        "label": "派件验证码校验",
        "span": "派件时，给收件方发送短信验证，操作在APP需要录入验证码"
    },
    "cpc_send_message_add_customer": {
        "on": 1,
        "off": 0,
        "label": " 取派短信发送项目人员信息",
        "span": ""
    },
    "send_code_verify": {
        "on": 1,
        "off": 0,
        "label": "到达派件签收码校验",
        "span": " "
    },
    "connect_verify": {
        "on": 1,
        "off": 0,
        "label": "上传客户交接单",
        "span": "取派件时，要求APP上传客户交接单拍照"
    },
    "batch_delivery_switch": {
        "on": 1,
        "off": 0,
        "label": "批量派件",
        "span": "项目支持，APP批量派件"
    },
    "cpc_not_use_ssexpress": {
        "on": 1,
        "off": 0,
        "label": "不使用生生签收单据",
        "span": " "
    },
    "cpc_use_customer_express": {
        "on": 1,
        "off": 0,
        "label": "使用客户签收单据",
        "span": " "
    },
    "ice_aging_status": {
        "on": 1,
        "off": 0,
        "label": "不允许中途私自换冰排",
        "span": "APP提示不能换冰排"
    },
    "app_send_time_status": {
        "on": 1,
        "off": 0,
        "label": "取派件不获取温度计开关机时间",
        "span": " "
    },
    "pickup_contact_status": {
        "on": 1,
        "off": 0,
        "label": "取件前电话联系客户",
        "span": "提醒APP，和标签是否有重复"
    },
    "send_contact_status": {
        "on": 1,
        "off": 0,
        "label": "派件前电话联系客户",
        "span": "提醒APP，和标签是否有重复"
    },
    "high_speed_status": {
        "on": 1,
        "off": 0,
        "label": "禁止高铁押运、专人专车交接",
        "span": "开启后，禁止使用高铁押运"
    },
    "is_blood_bag_clamp": {
        "on": 1,
        "off": 0,
        "label": "需要绑定血袋夹",
        "span": "提醒APP，做方案的时候需要绑定血袋夹"
    },
    "corpuscle_single_status": {
        "on": 1,
        "off": 0,
        "label": "支持电子面单",
        "span": "开启后，客户可以使用电子面单"
    },
    "write_temp_switch": {
        "on": 1,
        "off": 0,
        "label": "取派件填写开启关闭温度 ",
        "span": "开启后，要求APP在取派件时填写温度"
    }
}

临床非生生运输订单调整 待测试

物流car-t预约单  待上线
car-t订单退回取件方调整  已上线
物流项目配置汇总改造  测试中


车辆保养数据修改
诺和关联表数据修改




添加固定箱型配置页面
feature_27234_csl_20250922
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27234

CREATE TABLE `tms_fixed_drug` (
  `tfd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cu_id`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '委托客户id',
  `cu_name`  varchar(255) NOT NULL DEFAULT ''  COMMENT '委托客户名称',
  `cp_id`  int(11) unsigned NOT NULL DEFAULT '0' COMMENT '项目id',
  `cp_no`  varchar(255) NOT NULL DEFAULT ''  COMMENT '项目名称',
  `to_temperature` tinyint(4) unsigned NOT NULL DEFAULT '0'   COMMENT '温区',
  `to_temperature_name`  varchar(100) NOT NULL DEFAULT ''    COMMENT '温区名称',
  `drug_name`  varchar(255) NOT NULL DEFAULT ''  COMMENT '药品名称',
  `tfd_long` decimal(10,2)  NOT NULL DEFAULT '0.00'  COMMENT '长（厘米）',
  `tfd_width` decimal(10,2)  NOT NULL DEFAULT '0.00'  COMMENT '宽（厘米）',
  `tfd_height` decimal(10,2)  NOT NULL DEFAULT '0.00'  COMMENT '高（厘米）',
  `tfd_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tfd_id`),
  KEY idx_cu_id (`cu_id`),
  KEY idx_cp_id (`cp_id`)
)  COMMENT='固定箱型配置表/tms_admin';


CREATE TABLE `tms_fixed_box` (
  `tfb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tfd_id` int(11) NOT NULL DEFAULT '0' COMMENT 'tms_fixed_drug.tfd_id',
  `sto_id` int(11) NOT NULL DEFAULT '0' COMMENT '箱型id',
  `sto_name` varchar(255)  NOT NULL DEFAULT '' COMMENT '箱型名称',
  `tfb_num` int(11) NOT NULL DEFAULT '0' COMMENT '箱型数量',
  `tfb_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tfb_id`),
  KEY idx_sto_id (`sto_id`),
  KEY idx_tfd_id (`tfd_id`)
)  COMMENT='固定箱型配置附属箱型表/tms_admin';



物流car-t预约单  待上线
物流项目配置汇总改造  待上线
添加固定箱型配置页面   已上线



预报单发送邮件支持不包含附件
feature_27327_csl_20251009  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27327  未上线


临时对公支付接口调整
异常收费等待费优化


工作单航空发货预报导出优化
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27432


car-t按钮权限优化
car-t订单修改派件时间

凯强-青浦
士伟-闵行
三叔-浦东


结算箱型批量确认
feature_27467_csl_20251015
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27467  未上线




签单返回管理支持批量修改状态
feature_27508_csl_20251016
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27508  已上线


大数据接口调用调整
feature_27550_csl_20251017
feature_27550_csl_20251105 tms_service
feature_27550_csl_20251105 omsapi
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27550 已上线

car-t预约单



feature_mc_csl_20251022



每刻对接
feature_27623_csl_20251028 tms_admin
feature_27623_csl_20251029 ams_service
feature_27623_csl_20251103 bms_service
feature_27623_csl_20251105 bms_admin
feature_27623_csl_20251110 tms_service
feature_27623_20251127 srm
feature_27623_csl_20251117 omsapi
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27623  未上线



/*********上线注意事项 start******/


tms_admin/bms_service/bms_admin
test
define('MC_API_DOMAIN',"http://omstest.ashsh.com.cn:10059");

线上
define('MC_API_DOMAIN',"http://127.0.0.1:10059");

//过滤策略
{templateKey}等于fund_payment
{"rule":{"bool":{"term":{"templateKey":"fund_payment"}}}}



bms_settlement_config/fee_pay_apply_config
新增        
 'code'=>'CS112190',
 'uruid'=>'10988',
bms_remarklog_config  158007 去掉 泛微两字



MC_COMPANY_CODE
{
"上海生生医药冷链科技股份有限公司":"SS",
"上海生生物流有限公司":"SS01",
"北生（北京）供应链管理有限公司":"SS01001",
"生生供应链管理（广州）有限公司":"SS01002",
"生生供应链管理（杭州）有限公司":"SS01003",
"生生供应链管理（成都）有限公司":"SS01004",
"生生供应链管理（济南）有限公司":"SS01005",
"云南生生物流有限公司":"SS01006",
"宴嘉供应链管理（武汉）有限公司":"SS01007",
"瑞生供应链管理（南京）有限公司":"SS01008",
"瑞生供应链管理（南京）有限公司徐州分公司":"SS01009",
"苏州生生供应链管理有限公司":"SS01010",
"生生供应链管理（天津）有限公司":"SS01011",
"西安生生供应链管理有限公司":"SS01012",
"深圳宴嘉供应链管理有限公司":"SS01013",
"郑州生生供应链管理有限公司":"SS01014",
"贵州生生供应链管理有限公司":"SS01015",
"湖南生生供应链管理有限公司":"SS01016",
"吉林生生供应链管理有限公司":"SS01017",
"上海生生物流有限公司石家庄分公司":"SS01018",
"南昌宴嘉供应链管理有限公司":"SS01019",
"厦门生生供应链管理有限公司":"SS01020",
"合肥宴佳瑞生供应链管理有限公司":"SS01021",
"晏嘉供应链管理（哈尔滨）有限公司":"SS01022",
"重庆生生供应链管理有限公司":"SS01023",
"生生供应链管理（沈阳）有限公司":"SS01024",
"乌鲁木齐宴嘉供应链管理有限公司":"SS01025",
"甘肃宴伽供应链管理服务有限公司":"SS01026",
"海南宴嘉供应链管理有限公司":"SS01027",
"广西宴嘉供应链管理有限公司":"SS01028",
"福州生生供应链管理有限公司":"SS01029",
"上海生生冷链物流有限公司":"SS01030",
"上海宴嘉冷链物流有限公司":"SS01031",
"宴嘉冷链物流（武汉）有限公司":"SS01032",
"北京宴嘉冷链物流有限公司":"SS01033",
"石家庄宴嘉供应链管理有限公司":"SS01034",
"西安宴嘉供应链管理有限公司":"SS01035",
"烟台生生供应链管理有限公司":"SS01036",
"上海元廷科技有限公司":"SS02",
"上海生生国际物流有限公司":"SS03",
"American shengsheng supply chain llc":"SS03001",
"Shengsheng Supply Chain Management":"SS03002",
"Shengsheng Australia pty ltd":"SS03003",
"北京迈迪朗杰医疗器械股份有限公司":"SS04",
"海南银瀚投资有限公司":"SS05",
"Shengsheng International Logistics Pte. Ltd.":"SS06"
}

server_type
{
    "1": "oms系统",
    "2": "m3",
    "3": "微信服务号",
    "4": "微信操作号",
    "5": "客户oms系统",
    "6": "API接口",
    "7": "操作端APP",
    "8": "邮件",
    "9": "小程序",
    "10": "企业微信",
    "11": "ecology",
    "12": "药品端APP",
    "13": "审计平台",
    "14": "小程序合同订单",
    "15": "SRM系统",
    "16": "每刻系统"
}



alter table
   tms_repair_payment_apply
add
   column `arrive_ticket_at`  datetime DEFAULT NULL COMMENT '到票时间';

alter table
   tms_car_repair_monthly_billing
add
   column `arrive_ticket_at`   datetime DEFAULT NULL COMMENT '到票时间';



alter table
   carrier_bill
add
   column `arrive_ticket_at`   datetime DEFAULT NULL COMMENT '到票时间/预计到票时间';




/*********上线注意事项 end******/


签单返回管理新增取件城市搜索
feature_27790_csl_20251103
http://project.ashsh.com.cn/index.php?m=task&f=view&id=27790 已上线





出差单列表新增是否支援字段并支持导出
feature_27851_csl_20251106  tms_admin
feature_27851_csl_20251106 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27851  未上线


车辆违章增加城市数据
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27984

车辆配件增加定位仪、温度监控主机绑定
feature_27923_csl_20251111 ams_service
feature_27923_csl_20251111 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=27923  已上线


alter table
  tms_car_info
add
  column `orientator_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有定位仪 0 否 1 是',
add
  column `orientator_no` varchar(32) NOT NULL DEFAULT '' COMMENT '定位仪编码',
add
  column `temp_monitoring_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否有温度监控主机 0 否 1 是',
add
  column `temp_monitoring_no` varchar(32) NOT NULL DEFAULT '' COMMENT '温度监控主机编码';



 CAR-T订单预约优化
feature_28011_csl_20251113 tms_admin
feature_28011_csl_20251114 tms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28011   未上线

102216 CAR-T预约单


{
    "msgtype":"markdown",
    "markdown":{
        "content":"@@touser@@ 你有一个@@type_msg@@CAR-T常规预约，请及时安排人员！\n委托客户：@@cu_name@@\n项目名称：@@cp_name@@\n温区：@@to_temperature_name@@\n运输方式：@@to_trequirement_name@@\n取派城市：@@start_end_region@@\n预取日期：@@pickup_date@@\nID：@@tro_id@@@@remark@@"
    },
    "key":"0a28a195-fdee-4354-b239-3413b04999bc"
}

{
    "msgtype":"markdown",
    "markdown":{
        "content":"@@touser@@ 你有一个@@type_msg@@CAR-T常规预约，请及时安排人员！\n委托客户：@@cu_name@@\n项目名称：@@cp_name@@\n温区：@@to_temperature_name@@\n运输方式：@@to_trequirement_name@@\n运输城市：@@start_end_region@@\n预取日期：@@pickup_date@@\nID：@@tro_id@@@@remark@@"
    },
    "key":"0a28a195-fdee-4354-b239-3413b04999bc"
}


alter table
   tms_reserve_order
add
   column `pick_address`   varchar(800) NOT NULL DEFAULT ''  COMMENT '取件地址',
add
   column `delivery_address`   varchar(800) NOT NULL DEFAULT ''  COMMENT '派件地址',
add
   column `reserved_remark`  text  COMMENT '预约单备注',
add
   column `start_cu_name`   varchar(400) NOT NULL DEFAULT ''  COMMENT '取件单位',
add
   column `stop_cu_name`   varchar(400) NOT NULL DEFAULT ''  COMMENT '派件单位',
add
   column `warehouse_address`  varchar(800) NOT NULL DEFAULT ''  COMMENT '仓库地址',
add
   column `pharmacy_address`  varchar(800) NOT NULL DEFAULT ''  COMMENT '药房地址';



车辆监控推送优化
feature_28002_csl_20251112
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28002  已上线


车辆违章增加城市数据
车辆监控推送优化
车辆配件增加定位仪、温度监控主机绑定
CAR-T订单预约优化


订单时效管控优化
feature_28133_csl_20251119  tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28133  已上线

alter table
   tms_order_information
add
   column `aging_status` tinyint(1) NOT NULL  DEFAULT '1' COMMENT '时效处理状态 1、未处理 2、已处理',
add
   column `aging_dispose_num` tinyint(2) NOT NULL  DEFAULT '0' COMMENT '时效处理次数',
add
   column `aging_remark`  varchar(100) NOT NULL DEFAULT '' COMMENT '时效处理备注';
订单时效管控-每日下午5点10分更新项目未派件管控的处理状态 为未处理


临检项目订单列表添加筛选
feature_28158_csl_20251124
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28158  已上线







诺和商药项目添加专车节点
feature_28225_csl_20251128
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28225  未上线




人员备案管理
feature_28289_csl_20251201 tms_admin
feature_28289_csl_20251208 qms_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28289 未上线


CREATE TABLE `tms_operation_health_record` (
  `tohr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tohr_start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '有效期起',
  `tohr_end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '有效期止',
  `tohr_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '档案类型 1、体检报告 2、健康证',
  `ur_uid` int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '技能类型',
  `username` varchar(50)  NOT NULL DEFAULT '' COMMENT '操作员uid',
  `tohr_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tohr_id`),
  KEY idx_tkc_id (`ur_uid`)
)  COMMENT='操作员健康档案';


CREATE TABLE `tms_operation_skill_certificate` (
  `tosc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tosc_start_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '有效期起',
  `tosc_end_time`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '有效期止',
  `tosc_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '技能类型 1、从业资格证 2、安全员 3、安全负责人',
  `ur_uid` int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '操作员uid',
  `username` varchar(50)  NOT NULL DEFAULT '' COMMENT '操作员名称',
  `tosc_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tosc_id`),
  KEY idx_ur_uid (`ur_uid`)
)  COMMENT='操作员技能资格证';



CREATE TABLE `tms_operation_segment` (
  `tos_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tos_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '业务板块 1、科研及临床样本及药品 2、商业成品药 3、体外诊断试剂 4、特检普检样本 5、脐带血 6、免疫细胞 7、疫苗 8、其他 9、国际客户',
  `ur_uid` int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '操作员uid',
  `username` varchar(50)  NOT NULL DEFAULT '' COMMENT '操作员名称',
  `skilled_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT  '熟练程度 1、首选 2、备选',
  `tos_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tos_id`),
  KEY idx_ur_uid (`ur_uid`)
)  COMMENT='操作员业务板块熟练程度';



CREATE TABLE `tms_operation_project_type` (
  `topt_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `topt_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '项目类型 1、临床 2、商业成品药 3、IVD试剂 4、脐带血 5、细胞 6、特检普检 7、其他 ',
  `ur_uid` int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '操作员uid',
  `username` varchar(50)  NOT NULL DEFAULT '' COMMENT '操作员名称',
  `skilled_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT  '熟练程度 1、首选 2、备选',
  `topt_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`topt_id`),
  KEY idx_ur_uid (`ur_uid`)
)  COMMENT='操作员项目类型熟练程度';


CREATE TABLE `tms_operation_user` (
  `tou_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tou_cu_ids` text COMMENT '重点保障客户id',
  `tou_cu_name` text COMMENT '重点保障客户名称',
  `tou_support`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否支援 1、是 2、否',
  `ur_uid` int(11)  unsigned NOT NULL DEFAULT '0' COMMENT '操作员uid',
  `username` varchar(50)  NOT NULL DEFAULT '' COMMENT '操作员名称',
  `tou_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tou_id`),
  KEY idx_ur_uid (`ur_uid`)
)  COMMENT='操作员附属信息';


TMS_CU_SEGMENT
{
    "1": "科研及临床样本及药品",
    "2": "商业成品药",
    "3": "体外诊断试剂(IVD)",
    "4": "特检普检样本",
    "5": "脐带血",
    "6": "免疫细胞",
    "7": "疫苗",
    "8": "其他",
    "9": "国际客户"
}

TMS_CU_PROJECT_TYPE

{
    "1": "临床",
    "2": "商业成品药",
    "3": "IVD试剂",
    "4": "脐带血",
    "5": "细胞",
    "6": "特检普检",
    "7": "其他"
}

QMS_PENALTY_TYPE


{
    "0": "待岗培训",
    "1": "停薪待岗培训",
    "2": "罚款",
    "3": "严重警告",
    "4": "无"
}

荣昌生物制药添加复制功能
feature_28187_csl_20251202
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28187  已上线


CP_CUIDS_CPIDS
 {
 	"cu_ids":[202000471, 20120237, 201600300, 202107140, 201601314, 202102951],
 	"cp_ids":[12387]
 }
 	





订单时效管控 新增收件客户名称、车牌号
feature_28442_csl_20251209 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28442




预报单定时发送
feature_28470_csl_20251211
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28470 未上线

//定时任务
timing-push/tomorrow-mail


//需求   预报单定时发送
https://project.ashsh.com.cn/index.php?m=story&f=view&storyID=5103  未上线

alter table
   tms_forecast_mailtemp
add
   column `newest_send_at` datetime DEFAULT NULL COMMENT '最近发送时间',
add
   column `next_send_at` datetime DEFAULT NULL COMMENT '下次发送时间',
add
    column `time_status` tinyint(4) NOT NULL  DEFAULT '2' COMMENT '是否定时任务发送 1、是 2、否',
add
    column `send_type` tinyint(4) NOT NULL  DEFAULT '0' COMMENT '发送逻辑 1、周期循环 2、固定时间',
add
    column `cycle_period_type` tinyint(4) NOT NULL  DEFAULT '0' COMMENT '循环周期 1、每工作日 2、每天 3、每周 4、每月 5、每月最后一天',
add
    column `weekly_days` varchar(255) NOT NULL  DEFAULT '' COMMENT '每周:1-7',
add
    column `monthly_days` varchar(255) NOT NULL  DEFAULT '' COMMENT '每月:1-31',
add
    column `fixed_at` datetime DEFAULT NULL  COMMENT '固定发送时间',
add
    column `point_time` time DEFAULT NULL COMMENT '时间点',
add
    column `tomorrow_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记明天需要执行的数据';



车辆管理优化
feature_28538_csl_20251216 tms_admin
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28538 未上线

alter table
   car
add
   column `car_condition` tinyint(4) NOT NULL  DEFAULT '0' COMMENT '车况 1、完好（可长途使用）2、一般（跨城市非长途使用）3、不好（只能同城使用）';


alter table
   tms_keep_record_car_yzreport
add
  column `tkryr_temperature` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '温区',
add
  column `tkryr_temperature_name` varchar(100) NOT NULL  DEFAULT ''  COMMENT '温区名称';





纯电车辆管理优化
feature_28602_csl_20251219
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28602 未上线




电池电量：电池电量是否满足本次出行里程需求
车辆电池：车辆启动自检，是否有电池故障图标亮起
驱动系统：车辆启动自检，是否有电机故障图标亮起
电控系统：车辆启动自检，是否有控制器故障等图标亮起


alter table
   tms_car_check_new
add
  column `tcc_battery_capacity` tinyint(4) NOT NULL  DEFAULT '0' COMMENT '电池电量:电池电量是否满足本次出行里程需求 1、合格 2、不合格',
add
  column `tcc_car_battery` tinyint(4) NOT NULL  DEFAULT '0' COMMENT '车辆电池:车辆启动自检，是否有电池故障图标亮起 1、合格 2、不合格',
add
  column `tcc_drive_system` tinyint(4) NOT NULL  DEFAULT '0' COMMENT '驱动系统:车辆启动自检，是否有电机故障图标亮起 1、合格 2、不合格',
add
  column `tcc_electronic_system` tinyint(4) NOT NULL  DEFAULT '0' COMMENT '电控系统:车辆启动自检，是否有控制器故障等图标亮起 1、合格 2、不合格';




ALTER TABLE 
	tms_refuel_record
MODIFY
  COLUMN `trr_payment_method` tinyint(3) NOT NULL DEFAULT '1' COMMENT  '加油方式/充电方式，1、油卡-中石化，2、现金，3油卡-中石油，4、电卡充电 5、自营充电',
MODIFY
  COLUMN `trr_date` varchar(30) NOT NULL DEFAULT '' COMMENT '加油日期/充电日期',
MODIFY
  COLUMN `refuel_uid` int(11) NOT NULL DEFAULT '0' COMMENT '加油人/充电人 ID',
MODIFY
  COLUMN `refuel_username` varchar(30) NOT NULL DEFAULT '' COMMENT '加油人/充电人 姓名',
MODIFY
  COLUMN `trr_mileage` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加油/充电 里程',
MODIFY
  COLUMN `trr_quantity` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加油升数/充电电量',
MODIFY
  COLUMN `trr_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加油金额/充电金额',
MODIFY
  COLUMN `trr_region_name` varchar(100) NOT NULL DEFAULT '' COMMENT '加油城市/充电城市',
MODIFY
  COLUMN `trr_station_address` varchar(255) NOT NULL DEFAULT '' COMMENT '加油地点/充电地点';




ALTER TABLE `tms_keep_record_car`
COMMENT = '承运商车辆';



计划箱型配置接口
feature_28712_csl_20251225 tms_service
feature_28712_csl_20251229 tms_admin

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28712 未上线




每刻 月结承运商多主体付款：新增成本月份、未含税金额、税额

承运车辆优化  冷藏车添加验证报告相关必填限制 非冷藏车 隐藏验证报告、配置 

取派件时间补录 默认展示最近7天未处理数据

计划箱型配置接口 
{
默认选项   客户选择包材 > 自动工作单配置 > 大数据推荐（接口新增可选项参数）

可选项 固定箱型 > 备案箱型 >计划箱型（有项目id （项目、客户）> 客户 >无客/项 ）>基础箱型（温区） 

计划箱型、基础箱型
过滤 stt_id=137（D系列箱子）  cu_id = 202000654（和元生物技术（上海）股份有限公司）
}


4月	6441	2961
5月	7557	3094
6月	7770	3423
7月	7705	3555
8月	3058	3619
9月	2826	3445
10月	3009	3468
11月	2459	3191
12月	3194	3510




订单详情添加内部变更申请
https://project.ashsh.com.cn/index.php?m=task&f=view&id=28827