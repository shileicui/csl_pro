return [
// 需要校验登录会话的ajax请求url地址
'need_check_login_session_ajax_request_urls' => ['commonorder/ctonotwo','order/setnoprint','commonorder/goodtagsp','common/printlog'],
'create_order_params' => [
// 项目默认值
'default_value' => [

],
// 固定不变的值
'fixed_value' => [
'HS628-III' => [
'co_id' => '238546', //委托联系人
'to_email' => 'yingying.he@gcp-clinplus.com/gcp-3242-f@gcp-clinplus.com/juan.ma@bioraypharm.com', //反馈邮箱
'to_temperature_name' => '蓝冰2~8℃',
'to_temperature' => '31'
],
'Aom0498-CT03-01' =>[
'co_id' => '242656',//委托联系人
'to_email' => 'jiang_jing0701@wuxiapptec.com', //反馈邮箱
'to_goodstype' => '3',
'to_thermometer' => '2'
],
'TRS00303001' => [
'to_temperature_name' => '蓝冰2~8℃',
'to_temperature' => '31'
],
'HTD1801.PCT106' => [
'to_check_status' =>0,
],
'AKTN-NSCLC-01' => [
'to_temperature_name' => '蓝冰2~8℃',
'to_temperature' => '31',
'to_email' => 'jiang_jing0701@wuxiapptec.com12121', //反馈邮箱
'to_goodstype' => '4',
],
               // 普沐PMG1015_CHN_Ib 
              'PMG1015_CHN_Ib' => [
                     'to_check_status' => 0, // 需要客户审核
              ],
],
    // 更改值
    'change_value' => [
        'da19648b4e9711ed916a00163e089126' => [
            'T8132205' => ['ProjectNumber' => '金墁利IN10018-011/T8132205'],
            'T7292111' => ['ProjectNumber' => '金墁利 MRG002-009/T7292111'],
            'T8062205' => ['ProjectNumber' => '金墁利T8062205/JS105-001-I'],
            'T7992204' => ['ProjectNumber' => '金墁利T7992204/NC-110-101'],
            'T8452208' => ['ProjectNumber' => '金墁利T8452208/BM2L202201'],
            'T8472208' => ['ProjectNumber' => '金墁利 T8472208/ALTN-AK105-II-06'],
            'T8572209' => ['ProjectNumber' => '金墁利 T8572209/FS-1502-II201'],
            'T8252206' => ['ProjectNumber' => '金墁利 T8252206/PC002-01'],
            'T8522209' => ['ProjectNumber' => '金墁利T8522209 QL1706-304'],
            'T8632210' => ['ProjectNumber' => '金墁利T8632210/DKX-DDCI-01L04'],
            'T8592209' => ['ProjectNumber' => '金墁利 T8592209/YZJ101980-II-202102'],
            'T8442208' => ['ProjectNumber' => '金墁利T8442208/Z-ZSYTW-PI-Ⅱa-2020-BYSZYYY-01'],
            'T8582209' => ['ProjectNumber' => '金墁利T8582209/ZBKB-XBYZXFZ-20220426'],
            'T6692108' => ['ProjectNumber' => '金墁利T6692108/SSGJ-609+302-BC-II-01'],
            'T8672210' => ['ProjectNumber' => '金墁利T8672210/YCRF-YMBP-I-101'],
            'T8762210' => ['ProjectNumber' => '金墁利 T8762210/ZM-H1505R-201'],
            'T8722210' => ['ProjectNumber' => '金墁利HRAIN01-ALL02/T8722210'],
            'T8562209' => ['ProjectNumber' => '金墁利38ADC-RRMM-C101/T8562209'],
            'T8462208' => ['ProjectNumber' => '金墁利 T8462208/SYSS-SSS17-RA-II-01'],
            'T8872211' => ['ProjectNumber' => '金墁利T8872211/JS002-007'],
            'T8752210' => ['ProjectNumber' => '金墁利 T8752210/BH-OH2-020'],
            'T8642210' => ['ProjectNumber' => '金墁利 T8642210/TNM001-201'],
            'T8792210' => ['ProjectNumber' => '金墁利 T8792210/LB4001-301'],
            'T8842211' => ['ProjectNumber' => '金墁利T8842211/SCW0502-1031'],
            'T8852211' => ['ProjectNumber' => '金墁利T8852211/SCW0502-1032'],
            'T8622209' => ['ProjectNumber' => '金墁利 T8622209/BGT-001-002'],
            'T8552209' => ['ProjectNumber' => '金墁利 T8552209/IN10018-012'],
            'T8832211' => ['ProjectNumber' => '金墁利T8832211/YDHY（HZBio1)-001（Ib/II）'],
            'T9012211' => ['ProjectNumber' => '金墁利T9012211/PCiVAC--001'],
            'T9122212' => ['ProjectNumber' => '金墁利T9122212/HBV003'],
            'T8882211' => ['ProjectNumber' => '金墁利T8882211 SC0245-102'],
            'T8862211' => ['ProjectNumber' => '金墁利 T8862211/KC1702'],
            'T9232301' => ['ProjectNumber' => '金墁利T9232301 QL1706-303'],
            'T8392208' => ['ProjectNumber' => '金墁利T8392208/RN-0001-Ph-II-01'],
            'T9212301' => ['ProjectNumber' => '金墁利T9212301 GenSci073-101'],
            'T8742210' => ['ProjectNumber' => '金墁利 T8742210/LW402-II-01'],
            'T8952211' => ['ProjectNumber' => '金墁利T8952211/YHGT-UC-01'],
            'T9182301' => ['ProjectNumber' => '金墁利T9182301 HP501-01-02-02'],
            'T8892211' => ['ProjectNumber' => '金墁利 T8892211/MRG003-010'],
            'T8702210' => ['ProjectNumber' => '金墁利T8702210/2020-003-CN'],
            'T9422302' => ['ProjectNumber' => '金墁利APG115XC103/T9422302'],
        ]
    ],
],

// 药品订单配置
'drug_order_config' => [
// 药品订单手机号
'drug_order_telephone' => [
"15301083445","15188565698","021-62202650","010-67837532","021-54320195","020-31602581","13501083445","13315408955","18078815208","020-31602581"
],
// 药品订单联系人
'drug_order_co_name' => [
"谷俊伸","徐磊","吴冬松","北京药品库","上海药品库","广州药品库","生生北京库房","生生上海库房","生生广州库房","生生物流广州仓库"
],
// 药品订单地址1
'drug_order_start_address' => [
"生生物流"
]
],
//样本订单列表配置
'sample_order_config' => [
	'mobile' => ['18217499175'],
	'address' => ['平乐路165'],
	'co_name' => ['卞建', '卞健']
],
'send_order_evaluate_sms_switch' => 1,
'send_order_evaluate_sms_customer_list' => ['202100384']
];