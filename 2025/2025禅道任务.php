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








小程序对账通知
feature_24559_csl_20250312  oms_admin
feature_24559_csl_20250318  mini_program
feature_24559_csl_20250320  customer_ns

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24559  未上线









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


客户小程序-允许管理员不选择项目下单
feature_24778_csl_20250327
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=24778



小程序提发货子单扫码优化
feature_24864_csl_20250401
http://project.ashsh.com.cn/index.php?m=task&f=view&id=24864  未上线