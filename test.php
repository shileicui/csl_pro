Skip to content
GitLab

项目
群组
更多
搜索或转到...
9
帮助
朱志鹏
P
publish_config_temp
项目概览
仓库
议题0
合并请求0
CI/CD
安全与合规
运维
分析
Wiki
代码片段
成员
设置
admin
publish_config_temp
Repository
master
publish_config_temp
tms_admin
test
build
config
domain.php
朱志鹏's avatar
指派失败配置
由朱志鹏编写于4天前
80a8e615
 domain.php  5.8 KB
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
<?php
/**
 * @Description: 接口域名配置
 * @Author     : gaosong
 * @CreateTime : 2020-04-23 15:22
 */
// 用户系统接口秘钥
define('USER_API_ACCESS_SECRET', 'OPJMKLWN');
// 用户系统接口域名
define('USER_API_DOMAIN', 'http://userapitest.ashsh.com.cn');
// oms后台域名
define('OMS_ADMIN_DOMAIN', 'http://omstest.ashsh.com.cn');
// oms后台域名
define('OMS_ADMIN', 'http://omstest.ashsh.com.cn:10011');
// 运输后台域名
define('TMS_ADMIN_DOMAIN', 'http://omstest.ashsh.com.cn:10012');
// 消息服务域名
define('MESSAGE_API_ACCESS_SECRET', 'OPJMKLWN');
define('MESSAGE_API_DOMAIN', 'http://omstest.ashsh.com.cn:10019');
//OMS调用
define('OMS_API_DOMAIN','http://omstest.ashsh.com.cn:10016');
//日志
define('LOG_API_DOMAIN', 'http://omstest.ashsh.com.cn:10021');
//质控系统调用
define('QMS_API_DOMAIN','http://omstest.ashsh.com.cn:10024');
 //QMS后台
define('QMS_ADMIN_DOMAIN','http://omstest.ashsh.com.cn:10014');
//ams接口域名
define('AMS_API_DOMAIN', 'http://omstest.ashsh.com.cn:10001');
//wms接口域名
define('WMS_API_DOMAIN', 'http://omstest.ashsh.com.cn:10036');
//财务系统接口
define('BMS_API_DOMAIN','http://omstest.ashsh.com.cn:10023');
//客户端系统接口
define('CUSTOMER_ADMIN_DOMAIN','http://omstest.ashsh.com.cn:10010');
//tms接口域名
define('TMS_API_DOMAIN', 'http://omstest.ashsh.com.cn:10018');
//文件服务器域名
define('FILE_API_DOMAIN',"http://omstest.ashsh.com.cn:10012");
//压缩文件下载域名
define('FILE_API_ZIPDOMAIN',"http://omstest-down.ashsh.com.cn");
//暂存货总数推送模板id
define('ZANCUNCOUNT_MESSAGE_ID','15');
//签收通知邮件id
define('SIGN_DATA_EMAIL_ID','5');
//温度数据邮件id
define('TEMP_DATA_EMAIL_ID','4');
//投保订单推送id
define('INSURE_MESSAGE_ID','17');
//手动反馈邮件模板
define('FEED_BACK_EMAIL_ID','6');
//订单取消邮件模板
define('CANCEL_ORDER_EMAIL_ID','7');
//鼎为异常数据推送
define('DEWAV_YCDATA_MESSAGE_ID','26');
//鼎为主动异常数据推送
define('DEWAV_TUIAW_MESSAGE_ID','40');
//车辆异常数据推送
define('Yl_TUIAW_MESSAGE_ID','41');
//取消订单抄送邮件主题
define('ORDER_CANCEL_EMAIL_ID','9');
//暂存超过三天提醒
define('ZANCUNOVERTIME_MESSAGE_ID','46');
//迈迪朗杰服务器路径
define('MDLJ_URL',"http://mdljtest.ashsh.com.cn");
//数据后台
define('DATA_ADMIN_DOMAIN', 'http://omstest.ashsh.com.cn:10022');
//月结供应商大数据推送(有发货单号)
define('KAFKA_SHIPNO_PUSH','month_supno_cost_test');
//月结供应商大数据推送(无发货单号)
define('KAFKA_NOSHIP_PUSH','month_city_cost_test');
//大数据接口
define('BIG_DATA_DOMAIN', 'http://172.19.166.202:28080');
//20-25度订单确认推送
define('ORDER_CONFIRM_TEMPERATURE_PUSH','63');
//算法
define('ARITHMETIC_DOMAIN','http://172.19.166.201:6002');
//车辆年检和运输证到期推送
define('CAR_VAILDDATA_PUSH','84');
//oa系统路径配置
define('OA_API_DOMAIN','http://omstest.ashsh.com.cn:10037');
//宴嘉接口
define('YJ_DOMAIN', 'https://yjtest.ashsh.com.cn');
 
//推送机器人key
define("DINGWEI_ALARM_ROOBKEY","54b332ea-ef0f-42fd-84ec-35606692a952");
define("DINGWEI_WARNING_ROOBKEY","54b332ea-ef0f-42fd-84ec-35606692a952");
define("DINGWEI_ELECTRICITY_ROOBKEY","54b332ea-ef0f-42fd-84ec-35606692a952");
//诺和
define("DINGWEI_NUOHE_ROOBKEY","54b332ea-ef0f-42fd-84ec-35606692a952");
//苏州众合
define("DINGWEI_ZHONGHE_ROOBKEY","54b332ea-ef0f-42fd-84ec-35606692a952");
//苏州盛迪亚
define('DINGWEI_SZSDY_ROOBKEY','e9b9afa7-52cc-4837-ba15-74fbe6e66ac8');
define("DEWAV_TUIAW_NEWMESSAGE_ID","97");
//液氮罐温度预警群机器人key
define("DINGWEI_YDG_ROOBKEY","54b332ea-ef0f-42fd-84ec-35606692a952");
//易碎品取件通知
define("FRAGILE_DATA_PUSH","95");
//鼎为电量异常数据推送（大区经理版）
define('DEWAV_EQCAREA_MESSAGE_ID','96');
//液氮罐时效换箱推送
define('YDG_REPLACR_MESSAGE_ID','94');
// session前端cookie域
defined('SESSION_COOKIE_DOMAIN') or define('SESSION_COOKIE_DOMAIN', 'omstest.ashsh.com.cn');
//取件给收件客户发送短信
define('PICKUP_SMS_MESSAGE','31');
//临时核酸任务模板
define('TEMPORARY_NUCLEIC_ACID_TASK', '101');
define('UNFINISHED_NUCLEIC_ACID_TASK', '102');//核酸信息补全提醒
define('MONITOR_NUCLEIC_ACID_TASK', '103');//任务监控及提醒
define('ABNORMAL_NUCLEIC_ACID_TASK', '104');//核酸任务异常提醒
define('CHANGE_NUCLEIC_ACID_TASK', '105');//核酸变更推送提醒（箱子、运单号）
define('CHANGE_NOT_NO_NUCLEIC_ACID_TASK', '106');//核酸变更推送提醒 没有运单号（箱子、运单号）
//低温订单预警推送
define('LTORDER_YG_MESSAGE','123');
//取件给收件客户发送短信 场景值
define('PICKUP_SMS_MESSAGE_SCENE','pickupToRecipient');
//液氮罐温度异常统计通知
define('DEWAV_YDG_MESSAGE_ID','134');
//回程车订单删除通知
define('BACKCAR_REMOVE_MESSAGE','137');
//专车回程数据统计群机器人key
define('BACK_CAR_ORDER_STATS_ROOBKEY','f1343a01-82e0-4d31-8a1b-73f3f3e96981');
//派件到达统计机器人key
define('PJARRVICE_ROOB_KEY','54b332ea-ef0f-42fd-84ec-35606692a952');
//路由变更申请统计
define('ROUTESTATUS_CHANGEAPPLY_COUNT','143');
define('PROJECT_APPROVAL_MESSAGE', 148);
define('OA_ECOLOGY_DOMAIN','http://omstest.ashsh.com.cn:10059');//OA审批
//换箱复核异常通知
define('CHANGEBOX_CHECK_YCMESSAGE','151');
define('ORDER_CAR_BACK_DAILY_STATS', '153');//        回程带货每日统计
define('ORDER_CAR_BACK_MONTH_STATS', '154');//        回程带货每月统计
//自动工作单统计
define('AUTO_GET_WORKSHEET_STATISTICS','155');
//异常坐标信息推送
define('SITE_TUIAW_MESSAGE_ID','156');
define('ORDER_WORKSHEET_CHANGE_STATS', '157');//        工作单修改统计
//dis接口域名
define('DIS_API_DOMAIN', 'http://omstest.ashsh.com.cn:10029');
//自动指派修改失败推送
define('ASSIGNFAILE_MESSAGE_ID','163');