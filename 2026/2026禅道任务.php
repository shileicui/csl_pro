<?

计划箱型配置接口
feature_28712_csl_20251225 tms_service
feature_28712_csl_20251229 tms_admin

https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28712 未上线


计划箱型配置接口 
{
默认选项   客户选择包材 > 自动工作单配置 > 大数据推荐（接口新增可选项参数）

可选项 固定箱型 > 备案箱型 >计划箱型（有项目id （项目、客户）> 客户 >无客/项 ）>基础箱型（温区） 

计划箱型、基础箱型
过滤 stt_id=137（D系列箱子）  cu_id = 202000654（和元生物技术（上海）股份有限公司）
}



计划箱型推荐调整
客户下单选包材接口  接口已完成 待客户端对接
物流订单确认、物流计划信息、临床箱型推荐接口  测试中

{
            "ol_pickup_planbegin"          : "1767603985",
            "start_region_id"       : "31000",
            "stop_region_id"       : "31000",
            "tem_id"    : "12",
            "cu_id"    : "201900710",
            "cp_id"    : "3785",
            "order_goods": {
                {
                    "og_long"    : "1", 
                    "og_width"         : "2", 
                    "og_height"         : "1", 
                    "og_quantity"         : "2",
                }
            },

        }



订单详情添加内部变更申请
feature_28827_csl_20260106
https://project.ashsh.com.cn/index.php?m=task&f=view&id=28827  未上线


供应商邀请注册、更新审核
feature_29001_csl_20260109  ams_admin
feature_29001_csl_20260115	ams_service
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=29001  未上线

需求
https://project.ashsh.com.cn/index.php?m=story&f=view&storyID=5123


alter table
   ams_supplier_main
add
  column `invite_data`  text COMMENT '邀请供应商填写的数据',
add  
  column `big_data`  text COMMENT '记录账号改之前的数据',
add
  column `asm_invoice_type` tinyint(4) NOT NULL  DEFAULT '0' COMMENT '发票类型 1、增值税普通发票 2、增值税专用发票',
add
  column `asm_tax_rate` tinyint(4)  NOT NULL DEFAULT '99' COMMENT '税率  0=>0% 1=>1% 3=>3% 5=>5% 6=>6% 9=>9% 13=>13% 99=>未设置';



AMS_ADMIN_SKIP_SIGN


线上
[
    "common-ams/handle-abnormal-thermometer",
    "wechat-message/sale-confirm-h5",
    "wechat-message/arrival-list",
    "wechat-message/ams-lease-order-update",
    "common-ams/sync-fcs-pay-status",
    "hdmtask/c-yexcel",
    "common-ams-on/handle-car-data",
    "common/supplier-invite"
]


//测试
[
    "common-ams/handle-abnormal-thermometer",
    "wechat-message/sale-confirm-h5",
    "common-ams/sync-fcs-pay-status",
    "common-ams-on/handle-car-data",
    "common-ams/handle-abnormal-thermometer-jc",
    
    "common/supplier-invite",
    "common/invite-get-bank-name",
    "common/search-bank",
    "common-ams/invite-upload"
]


[
    "common-ams/handle-abnormal-thermometer",
    "wechat-message/sale-confirm-h5",
    "wechat-message/arrival-list",
    "wechat-message/ams-lease-order-update",
    "common-ams/sync-fcs-pay-status",
    "hdmtask/c-yexcel",
    "common-ams-on/handle-car-data",
    "common/supplier-invite",
    "common/invite-get-bank-name",
    "common/search-bank",
    "common-ams/invite-upload"
]

https://omstest.ashsh.com.cn:18002/index.php?r=common/search-bank&cnapsCode=310241000101&fullName=上海浦东发展银行股份有限公司长春湖西路支行


调度变更申请ｓｑｌ查询优化
feature_28907_csl_20260107
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=28907  已上线






X-客户文件签字后上传系统并返回
客户文件返回务必签字和盖章
客户文件需签名与签收日期后上传系统并返回




{"list":[{"sto_id":"200648","sto_name":"VIP6N保温箱","stt_id":"5","quantity":1},{"sto_id":"209567","sto_name":"VIP6M+保温箱","stt_id":"5","quantity":1},{"sto_id":"27","sto_name":" VIP12保温箱","stt_id":"5","quantity":1},{"sto_id":"25","sto_name":"VIP16保温箱","stt_id":"5","quantity":1},{"sto_id":"209568","sto_name":" VIP16M+保温箱","stt_id":"5","quantity":1},{"sto_id":"24","sto_name":" VIP28保温箱","stt_id":"5","quantity":1},{"sto_id":"200646","sto_name":"VIP36保温箱","stt_id":"5","quantity":1},{"sto_id":"209569","sto_name":" VIP36M+保温箱","stt_id":"5","quantity":1},{"sto_id":"20","sto_name":"VIP56保温箱","stt_id":"5","quantity":1},{"sto_id":"209570","sto_name":" VIP56M+保温箱","stt_id":"5","quantity":1},{"sto_id":"208007","sto_name":" VIP58保温箱","stt_id":"5","quantity":1},{"sto_id":"226718","sto_name":"VIP82保温箱","stt_id":"5","quantity":1},{"sto_id":"21","sto_name":"VIP96保温箱","stt_id":"5","quantity":1},{"sto_id":"241025","sto_name":"K97保温箱","stt_id":"163","quantity":1},{"sto_id":"201417","sto_name":" VIP100保温箱","stt_id":"5","quantity":1},{"sto_id":"226719","sto_name":"VIP160保温箱","stt_id":"5","quantity":1},{"sto_id":"201418","sto_name":" VIP168保温箱","stt_id":"5","quantity":1},{"sto_id":"209105","sto_name":"VIP210保温箱","stt_id":"5","quantity":1},{"sto_id":"209838","sto_name":" VIP520保温箱","stt_id":"5","quantity":1},{"sto_id":"207378","sto_name":" 客户包装-托盘","stt_id":"70","quantity":1},{"sto_id":"207379","sto_name":" 客户包装-非托盘","stt_id":"70","quantity":1}],"data":[]}



签单返回改造
feature_29161_csl_20260121 tms_admin

feature_29161_csl_20260128  配置的单独分支  已上线
https://project.ashsh.com.cn/index.php?m=task&f=view&id=29161

需求：https://project.ashsh.com.cn/index.php?m=story&f=view&storyID=5166


 签单返回改造V1.1
feature_29425_csl_20260205  tms_service
禅道任务：https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=29425
需求:https://project.ashsh.com.cn/index.php?m=story&f=view&storyID=5211



ON_LINE_TIME_SWITCH
{
	"sign_time":"2026-01-26"
}


alter table
   tms_signing_file
add
  column `customer_show`  tinyint(4) NOT NULL DEFAULT '2' COMMENT  '是否在客户端展示 1、是 2、否';


alter table
   tms_ordersign_file
add
  column `customer_show`  tinyint(4) NOT NULL DEFAULT '2' COMMENT  '是否在客户端展示 1、是 2、否';


alter table
   tms_signing_conf
MODIFY
`back_frequency` tinyint(4) NOT NULL DEFAULT '0' COMMENT '返回频率 4、月初 5、月中 6、月底';


alter table
   tms_ordersign_conf
MODIFY
`back_frequency` tinyint(4) NOT NULL DEFAULT '0' COMMENT '返回频率 4、月初 5、月中 6、月底';


alter table
   tms_sign_bill
add
  column `upload_type`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否上传 0、未上传 1、部分上传 2、全部上传',
ADD
  INDEX idx_end_outtime (`end_outtime`);


php yii history-data/sign-conf


客户文件签字后上传系统
客户文件返回务必签字和盖章
客户文件需签名与签收日期后上传系统并返回
交接单签字后上传系统

SELECT `tp`.* FROM `tms_project` `tp` LEFT JOIN `tms_sign_project_type` `tspt` ON tspt.cp_id=tp.cp_id WHERE ((`tspt`.`status`=1) AND (`tp`.`status`=1)) AND (tspt.id is not null) GROUP BY `tp`.`cp_id`


oms_tag_conf_rule

tms_sign_type






alter table
   tms_sign_bill
add
  column `end_outtime`  int(11)  unsigned NOT NULL DEFAULT '0'  COMMENT '截止时间';



CREATE TABLE `tms_signing_conf` (
  `tsc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_type`  int(11) NOT NULL DEFAULT '0' COMMENT '规则类型: 1全局、2客户、3项目',
  `identifier` int(11) NOT NULL DEFAULT '0' COMMENT 'customer表cu_id，或customer_project表cp_id',
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT 'tag表tag_id',
  `back_frequency`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '返回频率 1、当日 2、每周 3、每月',
  `cu_person` varchar(50)  NOT NULL DEFAULT '' COMMENT '客户接收人',
  `cu_phone` varchar(50)  NOT NULL DEFAULT '' COMMENT '联系电话',
  `receiver_addr` varchar(200)  NOT NULL DEFAULT '' COMMENT '接收地址',
  `tsc_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tsc_id`)
)  COMMENT='签单返回配置客户标签/tms_admin';


CREATE TABLE `tms_signing_file` (
  `tsf_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int(6) unsigned NOT NULL DEFAULT '0'  COMMENT '签单类型subtype 关联tms_sign_type表subtype',
  `tsc_id` int(11)  unsigned NOT NULL DEFAULT '0'  COMMENT '签单配置id  /tms_signing_conf.tsc_id',
  `tat_id`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT  '附件id 关联tms_attachment表',
  `tsf_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT  '上传节点 1、取件 2、派件',
  `is_sign_return` tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否需返回 1、是 2、否',
  `tsf_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tsf_id`),
  KEY idx_tat_id (`tat_id`)
)  COMMENT='签单附件内容/tms_admin';




CREATE TABLE `tms_ordersign_conf` (
  `toc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `rule_type`  int(11) NOT NULL DEFAULT '0' COMMENT '规则类型: 1全局、2客户、3项目',
  `identifier` int(11) NOT NULL DEFAULT '0' COMMENT 'customer表cu_id，或customer_project表cp_id',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单id /transport_order.to_id',
  `tsc_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认配置id /tms_signing_conf表tsc_id',
  `tag_id` int(11) NOT NULL DEFAULT '0' COMMENT 'tag表tag_id',
  `back_frequency`  tinyint(4) NOT NULL DEFAULT '0' COMMENT  '返回频率 1、当日 2、每周 3、每月',
  `cu_person` varchar(50)  NOT NULL DEFAULT '' COMMENT '客户接收人',
  `cu_phone` varchar(50)  NOT NULL DEFAULT '' COMMENT '联系电话',
  `receiver_addr` varchar(200)  NOT NULL DEFAULT '' COMMENT '接收地址',
  `toc_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `upload_reason` varchar(500) NOT NULL DEFAULT '' COMMENT '未上传原因',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`toc_id`),
  KEY idx_to_id (`to_id`)
)  COMMENT='订单签单返回配置客户标签/tms_admin';


CREATE TABLE `tms_ordersign_file` (
  `tsf_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type_id` int(6) unsigned NOT NULL DEFAULT '0'  COMMENT '签单类型subtype 关联tms_sign_type表subtype',
  `toc_id` int(11)  unsigned NOT NULL DEFAULT '0'  COMMENT '签单配置id / tms_ordersign_conf.toc_id',
  `tat_id`  int(11)  unsigned NOT NULL DEFAULT '0' COMMENT  '附件id 关联tms_attachment表',
  `tsf_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT  '上传节点 1、取件 2、派件',
  `is_sign_return` tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否需返回 1、是 2、否',
  `is_upload_file` tinyint(4) NOT NULL DEFAULT '0' COMMENT  '是否上传附件 1、是 2、否',
  `upload_time`  int(11)  unsigned NOT NULL DEFAULT '0'  COMMENT '上传时间',
  `upload_atids`  varchar(300) NOT NULL DEFAULT ''  COMMENT '上传附件id',
  `tst_type`  char(3) NOT NULL DEFAULT ''  COMMENT '签单类型type 关联tms_sign_type表type',
  `tsf_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间 为null表示未删除',
  PRIMARY KEY (`tsf_id`),
  KEY idx_tat_id (`tat_id`)
)  COMMENT='订单签单附件内容/tms_admin';






remark_subtype2
{
    "102001": "生成订单",
    "102002": "修改订单",
    "102003": "确认订单",
    "102004": "指派订单",
    "102005": "取件备注",
    "102006": "回退订单",
    "102007": "关闭订单",
    "102008": "取消订单",
    "102009": "预约取件",
    "102010": "实际取件",
    "102011": "修改耗材",
    "102012": "实际派件",
    "102013": "上传附件",
    "102014": "调度发货",
    "102015": "签收反馈",
    "102016": "费用结算",
    "102017": "拆分订单",
    "102018": "订单绩效",
    "102019": "修改客户备注",
    "102020": "提货成功",
    "102021": "修改取派备注",
    "102022": "派件备注",
    "102023": "操作费用",
    "102024": "数据反馈",
    "102025": "更新方案",
    "102026": "修改项目",
    "102027": "耗材绑定",
    "102028": "耗材归还",
    "102029": "中转换冰排",
    "102030": "创建工作单",
    "102031": "指派组长",
    "102032": "指派操作",
    "102033": "审核订单",
    "102034": "生成耗材调拨",
    "102035": "单号绑定",
    "102036": "修改工作单",
    "102037": "指派调度单",
    "102038": "打标签",
    "102039": "批量上传",
    "102040": "修改取件",
    "102041": "修改派件",
    "102042": "删除数据",
    "102043": "工作单交接",
    "102044": "订单存货",
    "102045": "发货成功",
    "102046": "修改调度单",
    "102047": "删除调度",
    "102048": "订单作废",
    "102049": "申请修改",
    "102050": "申请取消",
    "102051": "处理申请",
    "102052": "温度检查",
    "102053": "方案调拨",
    "102054": "订单打印",
    "102055": "批量结算",
    "102056": "辅助结算",
    "102057": "自动结算",
    "102058": "添加/修改运输成本",
    "102059": "添加异常",
    "102060": "合并订单",
    "102061": "拆除订单",
    "102062": "确认到达",
    "102063": "时效换冰排",
    "102064": "暂存换冰排",
    "102065": "添加干冰",
    "102066": "删除编号",
    "102067": "生成预警单",
    "102068": "子单耗材解绑",
    "102069": "专人专车绩效补充",
    "102070": "取消工作单",
    "102071": "时效换冰排复核",
    "102072": "中转换冰排复核",
    "102073": "跳过换冰排",
    "102074": "暂存换冰排复核",
    "102075": "订单信息二次确认",
    "102076": "添加收费异常",
    "102077": "修改收费异常",
    "102078": "货物数量确认",
    "102079": "货物数量复核",
    "102080": "取消指派",
    "102081": "批量取件",
    "102082": "修改结算抬头",
    "102083": "修改结算",
    "102084": "批量派件",
    "102085": "系统自动确认",
    "102086": "生成出库单",
    "102087": "预约派件",
    "102088": "自动上传",
    "102089": "鼎为异常备注",
    "102090": "绑定车辆",
    "102091": "解绑车辆",
    "102092": "消杀记录",
    "102093": "生成子血订单",
    "102094": "取消子血订单",
    "102095": "生成消杀文件",
    "102096": "提货异常",
    "102097": "计划与实际箱型不符",
    "102098": "推送迈迪外包",
    "102099": "地址校验",
    "102100": "自动创建工作单",
    "102101": "工作单交接",
    "102102": "药品装箱",
    "102103": "鼎为远程开启",
    "102104": "批量创建工作单",
    "102105": "添加西门子订单信息",
    "102106": "修改西门子订单信息",
    "102107": "安排工作指令",
    "102108": "购买车票",
    "102109": "到达取件单位",
    "102110": "离开取件单位",
    "102111": "到达发货站点",
    "102112": "乘车",
    "102113": "车辆出发",
    "102114": "到达派件城市",
    "102115": "去往派件单位",
    "102116": "到达派件单位",
    "102117": "离开派件单位",
    "102118": "到达车站",
    "102119": "到达取件城市",
    "102120": "领取车辆",
    "102121": "车辆开往派件城市",
    "102122": "到达经销商",
    "102123": "离开经销商",
    "102124": "去往DTP药房",
    "102125": "到达DTP药房",
    "102126": "药房签收",
    "102127": "离开DTP药房",
    "102128": "交接完毕",
    "102129": "到达中心",
    "102130": "离开中心",
    "102131": "核酸服务检测",
    "102132": "修改仓库审核状态",
    "102133": "计划箱型配置",
    "102134": "创建待激活工作单",
    "102135": "删除药品",
    "102136": "订单转交",
    "102137": "订单升级",
    "102138": "智能路由推荐",
    "102139": "计划箱型",
    "102140": "添加药品",
    "102141": "删除药品",
    "102142": "鼎为终端自解绑",
    "102143": "药品合单",
    "102144": "发货站点异常",
    "102145": "订单异常处理",
    "102146": "添加仓库工作单",
    "102147": "修改仓库工作单",
    "102148": "完成仓库工作单",
    "102149": "批量修改工作单",
    "102150": "车辆运输流程",
    "102151": "货物交接",
    "102152": "到达中转车站",
    "102153": "中转城市出发",
    "102154": "到达中转城市",
    "102155": "车辆开往中转城市",
    "102156": "前往取件城市",
    "102157": "到达取件城市",
    "102158": "到达取件单位",
    "102159": "完成退货交接",
    "102160": "派送签收完成",
    "102161": "完成CART操作节点",
    "102162": "暂存监控自动检查",
    "102163": "冷藏车监控编辑",
    "102164": "退回转寄",
    "102165": "暂存原因修改",
    "102166": "专车回程带货",
    "102167": "订单分级更新",
    "102168": "夜班工作单",
    "102169": "自动创建取派工作单",
    "102170": "发起财务审核",
    "102171": "财务审核通过",
    "102172": "财务审核拒绝",
    "102173": "液氮罐称重",
    "102174": "修改是否延迟上传",
    "102175": "修改备注和延迟原因",
    "102176": "换冰排标识变更",
    "102177": "批量上传单据",
    "102178": "请求跨越api",
    "102180": "创建客户主体",
    "102181": "修改客户主体",
    "102182": "删除客户主体",
    "102183": "自动创建方案调拨",
    "102184": "自动创建工作单",
    "102185": "自动创建工作单",
    "102186": "下发待办任务",
    "102187": "完成待办任务",
    "102188": "专人专车冷藏车交接",
    "102189": "供应商确认",
    "102190": "批量修改调度单",
    "102191": "路由停运更换路由",
    "102192": "报价变更",
    "102193": "时效复核",
    "102194": "自动创建工作单",
    "102195": "备用温度计处理",
    "102196": "取消跨越下单",
    "102197": "标准地址库",
    "102198": "调整外协风险等级",
    "102199": "诺和订单合并",
    "102200": "取消作废",
    "102201": "结算箱型修改",
    "102202": "计划配件信息修改",
    "102203": "诺和药品入库",
    "102204": "诺和药品入箱",
    "102205": "诺和药品出库",
    "102206": "取派上传附件类型",
    "102207": "调度单站点变更",
    "102208": "修改打印备注",
    "102209": "转运关联航空订单",
    "102210": "已派件未更新备注",
    "102211": "扫码核对",
    "102212": "订单类型",
    "102213": "方案调拨回退",
    "102214": "订单接收",
    "102215": "工作单删除",
    "102216": "CAR-T预约单",
    "102217": "集运",
    "102218": "设置温度计记录间隔",
    "102219": "取件揽收",
    "102220": "上传签单配置",
    "1020591": "删除异常",
    "1020592": "绑定实验中心",
    "1020593": "修改计划派件"
}



瀚森发运复核表
feature_29328_csl_20260130 tms_admin 
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=29328  未上线

bms_settlement_config.php	
special_day
 "2026-02-13" => 1,
 "2026-02-24" => 1,


 https://omstest.ashsh.com.cn:18002/index.php?r=common/supplier-invite&openid=caec5045ffb88b3e26e2d7c9337c3502

 https://omstest.ashsh.com.cn:18002/index.php?r=common/supplier-invite&openid=c50f47b301c4f856c2f4a32fd4e5c839


质量管控管理sql添加索引

ALTER table
  tms_rule_detail_verify
MODIFY
  column  `trdv_operation_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行时间',
MODIFY
  column  `trdv_confirm_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '确认时间',
ADD
  INDEX idx_trdv_operation_time (`trdv_operation_time`),
ADD
  INDEX idx_trdv_to_id (`trdv_to_id`);


取派件补录sql查询优化

feature_29403_csl_20260204
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=29403



瀚森发运复核表
质量管控管理sql添加索引
取派件补录sql查询优化


供应商邀请注册(提交接口过滤sql关键字，上传附件接口限制上传次数)


车牌号更改同步备案车辆车牌号
feature_29418_csl_20260204
https://project.ashsh.com.cn/index.php?m=task&f=view&taskID=29418




供应商邀请注册、更新审核  已上线
签单返回改造  （签单配置已上线）
瀚森发运复核表  已上线
车牌号更改同步备案车辆车牌号  已上线
慢sql优化调整 （取派件补录慢sql查询优化、质量管控管理慢sql添加索引）  已上线
签单返回改造V1.1  已完成
下周
跟进 签单返回改造V1.1  测试







精麻订单业务线上化V1.0-主体流程
feature_csl_5210_20260209
https://project.ashsh.com.cn/index.php?m=story&f=view&storyID=5210