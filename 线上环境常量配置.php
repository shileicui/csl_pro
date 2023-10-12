<?php
/**
 * @Description: 接口域名配置
 * @Author     : gaosong
 * @CreateTime : 2020-04-23 15:22
 */

// 用户系统接口秘钥
define('USER_API_ACCESS_SECRET', 'OPJMKLWN');
// 用户系统接口域名
define('USER_API_DOMAIN', 'http://127.0.0.1:10000');
// oms后台域名
define('OMS_ADMIN_DOMAIN', 'http://oms.ashsh.com.cn');
define('OMS_ADMIN', 'http://oms.ashsh.com.cn:10011');
// 运输后台域名
define('TMS_ADMIN_DOMAIN', 'http://oms.ashsh.com.cn:10012');

//QMS后台
define('QMS_ADMIN_DOMAIN','http://oms.ashsh.com.cn:10014');
// 消息服务域名
define('MESSAGE_API_ACCESS_SECRET', 'OPJMKLWN');
define('MESSAGE_API_DOMAIN', 'http://127.0.0.1:10019');
//OMS调用
define('OMS_API_DOMAIN','http://127.0.0.1:10016');
//日志
define('LOG_API_DOMAIN', 'http://127.0.0.1:10021');
//质控系统调用
define('QMS_API_DOMAIN','http://127.0.0.1:10024');
//ams接口域名
define('AMS_API_DOMAIN', 'http://127.0.0.1:10001');
//wms接口域名
define('WMS_API_DOMAIN', 'http://127.0.0.1:10036');
//财务系统接口
define('BMS_API_DOMAIN','http://127.0.0.1:10023');
//客户端系统接口
define('CUSTOMER_ADMIN_DOMAIN','http://oms.ashsh.com.cn:10010');
//tms接口域名
define('TMS_API_DOMAIN', 'http://127.0.0.1:10018');
//文件服务器域名
define('FILE_API_DOMAIN',"http://down.ashsh.com.cn");
//批量下载文件域名
define('FILE_API_ZIPDOMAIN',"http://down.ashsh.com.cn/mnt");
//暂存货总数推送模板id
define('ZANCUNCOUNT_MESSAGE_ID','19');
 //签收通知邮件id
define('SIGN_DATA_EMAIL_ID','5');
//温度数据邮件id
define('TEMP_DATA_EMAIL_ID','4');
//投保订单推送id
define('INSURE_MESSAGE_ID','21');
//手动反馈邮件模板
define('FEED_BACK_EMAIL_ID','6');
//鼎为异常数据推送
define('DEWAV_YCDATA_MESSAGE_ID','31');
//订单取消邮件模板
define('CANCEL_ORDER_EMAIL_ID','7');
//鼎为主动数据推送
define('DEWAV_TUIAW_MESSAGE_ID','45');
//车辆异常数据推送
define('Yl_TUIAW_MESSAGE_ID','46');
//取消订单抄送邮件主题
define('ORDER_CANCEL_EMAIL_ID','9');
//暂存超过三天提醒
define('ZANCUNOVERTIME_MESSAGE_ID','53');
//迈迪朗杰服务器路径
define('MDLJ_URL',"http://otms.medlogistics.com.cn");
//数据后台
define('DATA_ADMIN_DOMAIN', 'http://oms.ashsh.com.cn:10022');
//大数据接口
define('BIG_DATA_DOMAIN', 'http://172.19.166.202:8080');
//20-25度订单确认推送
define('ORDER_CONFIRM_TEMPERATURE_PUSH','68');
//月结供应商大数据推送(有发货单号)
define('KAFKA_SHIPNO_PUSH','month_supno_cost_pro');
//月结供应商大数据推送(无发货单号)
define('KAFKA_NOSHIP_PUSH','month_city_cost_pro');
//算法
define('ARITHMETIC_DOMAIN','http://172.19.166.201:5004');
//车辆年检和运输证到期推送
define('CAR_VAILDDATA_PUSH','88');
//oa系统路径配置
define('OA_API_DOMAIN','http://127.0.0.1:10037');
//宴嘉接口
define('YJ_DOMAIN', 'https://oms.ashsh-yj.cn');
//智能路由推荐
define('ARITHMETIC_DOMAIN_ROUTE','http://172.19.166.201:5004');

//推送配置
define("DINGWEI_ALARM_ROOBKEY","6e477af3-a024-4297-8a29-9c5840346e38");
define("DINGWEI_WARNING_ROOBKEY","62137d66-2ef6-4152-b161-0157d5c9ffdb");
define("DINGWEI_ELECTRICITY_ROOBKEY","0725b027-392a-4536-99da-df71281e48f1");
define("DINGWEI_NUOHE_ROOBKEY","583ed722-4b3f-418b-be16-32f3c9a8bb4c");
define("DINGWEI_ZHONGHE_ROOBKEY","744ae999-f41d-4fe4-9ae7-d2781e4269c0");
//苏州盛迪亚
define('DINGWEI_SZSDY_ROOBKEY','1743784c-0cac-4d49-96da-f26c9deb6ee4');

define("DEWAV_TUIAW_NEWMESSAGE_ID","99");
//液氮罐温度预警群机器人key
define("DINGWEI_YDG_ROOBKEY","01267886-8edf-4614-90e5-c5628534ea30");
//易碎品消息
define("FRAGILE_DATA_PUSH","96");
//液氮罐时效换箱推送
define('YDG_REPLACR_MESSAGE_ID','97');
//鼎为低电量推送（新 @大区经理）
define('DEWAV_EQCAREA_MESSAGE_ID','98');
// session前端cookie域
defined('SESSION_COOKIE_DOMAIN') or define('SESSION_COOKIE_DOMAIN', 'oms.ashsh.com.cn');
//取件给收件客户发送短信
define('PICKUP_SMS_MESSAGE','32');
//临时核酸任务模板
define('TEMPORARY_NUCLEIC_ACID_TASK', '103');
define('UNFINISHED_NUCLEIC_ACID_TASK', '104');//核酸信息补全提醒
define('MONITOR_NUCLEIC_ACID_TASK', '105');//任务监控及提醒
define('ABNORMAL_NUCLEIC_ACID_TASK', '106');//核酸任务异常提醒
define('CHANGE_NUCLEIC_ACID_TASK', '107');//核酸变更推送提醒（箱子、运单号）
define('CHANGE_NOT_NO_NUCLEIC_ACID_TASK', '108');//核酸变更推送提醒 没有运单号（箱子、运单号）
//低温订单预警推送
define('LTORDER_YG_MESSAGE','131');
//取件给收件客户发送短信 场景值
define('PICKUP_SMS_MESSAGE_SCENE','32');
//液氮罐温度异常统计通知
define('DEWAV_YDG_MESSAGE_ID','143');
//回程车订单删除通知
define('BACKCAR_REMOVE_MESSAGE','148');

//专车回程数据统计群机器人key
define('BACK_CAR_ORDER_STATS_ROOBKEY','988371b7-56e2-499b-b463-2a39c9bec829');
//派件到达统计机器人key
define('PJARRVICE_ROOB_KEY','93e50fec-f89d-4cf0-869e-4eda37bf6c2f');
//路由变更申请统计
define('ROUTESTATUS_CHANGEAPPLY_COUNT','154');
 
//立项审批推送到企业微信个人
define('PROJECT_APPROVAL_MESSAGE',160);
//新泛微接口
define('OA_ECOLOGY_DOMAIN','http://127.0.0.1:10059');//OA审批
define('ORDER_CAR_BACK_DAILY_STATS', '163');//        回程带货每日统计
define('ORDER_CAR_BACK_MONTH_STATS', '164');//        回程带货每月统计
define('AUTO_GET_WORKSHEET_STATISTICS','165');//      订单确认统计	
define('SITE_TUIAW_MESSAGE_ID','166');  //坐标点错误纠正推送模板
define('ORDER_WORKSHEET_CHANGE_STATS', '168');//工作单修改统计
//自动指派修改失败推送
define('ASSIGNFAILE_MESSAGE_ID','174');
//自动指派统计推送
define('AUTO_ASSIGN_WORKSHEET_STATISTICS','175');
define('DIS_API_DOMAIN', 'http://127.0.0.1:10029');
//换冰排时效通知
define('CHANGEBOX_RESIDUETIME_YCMESSAGE','178');
//换冰排时效机器人key
define('CHANGETIMEMESSAGE_ROOB_KEY','83f0312c-3fb3-4301-a0d7-33d778fd623d');
//跨越platfrom
define('KUAI_YU_PLATFROMFLAG','P7GONVOGR5BDJIR9X7HTC25SSSCDSEEQ');
//温度计开机异常机器人
define('WDJOFFANDOFFLINE_ROOB_KEY','92759d30-4d23-4705-8eeb-fa881129706b');
