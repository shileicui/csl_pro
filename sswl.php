
<?
4000121321 SSWL

//phpstorm 破解
https://pdd.ismicool.cn/idea/

https://pdd.ismicool.cn/idea/code.html

//Hyper-v
bcdedit /set hypervisorlaunchtype off    //Hyper-v 关闭
bcdedit /set hypervisorlaunchtype on    //Hyper-v 开启
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All


tail -f /d/phpstudy_pro/WWW/tms_admin/protected/runtime/logs/error.log |grep 'csl'

/d/phpstudy_pro/WWW/yii3/basic/yii csl/cui 


/添加索引
ALTER  TABLE  `table_name`  ADD  INDEX index_name (  `column`  )

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




UPDATE operation SET opn_source = 1  WHERE opn_id = 5909144；

//修改类型
 alter table tms_mf_shipnoadd modify column tms_mf_send_month varchar(15) COMMENT '发货月份';

 cuishilei Cui123
 60988387

谷歌邮箱
shileicui666@gmail.com
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