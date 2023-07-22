<?
TMS_CUSTOMER_CONFIG
 {
  "tcc_dwt_shutdown_verify" : {"on" : 1, "off" : 0, "label" : "鼎为关机验证", "span" : ""},
   "cu_piece_feedback" : {"on" : 1, "off" : 2, "label" : "签收自动反馈", "span" : "（派件1小时后自动邮件签收反馈）"}, 
   "cu_temperature_feedback" : {"on" : 1, "off" : 2, "label" : "温度自动反馈", "span" : "（每晚8点自动邮件温度数据反馈）"},
   "cu_temperature_type" : {"on" : 1, "off" : 2, "label" : "支持批量上传温度数据", "span" : "（默认客户支持批量上传温度数据）"},
   "cu_tengsen_trmperature" : {"on" : 1, "off" : 2, "label" : "不支持批量上传滕森温度数据", "span" : "（默认客户支持上传）"},
   "cu_sign_feedback" : {"on" : 1, "off" : 2, "label" : "代签短信提醒", "span" : ""},
   "cu_goods_print" : {"on" : 1, "off" : 0, "label" : "打印运单时将货物名称打印在运单上", "span" : ""},
   "cu_send_message" : {"on" : 0, "off" : 1, "label" : "不发送取派短信", "span" : "（配置后不给收发件人发送取派短信）"},
   "cu_print_express_remark" : {"on" : 1, "off" : 0, "label" : "客户单号打印到运单备注", "span" : ""},
   "main_plural_thermometer" : {"on" : 1, "off" : 0, "label" : "支持主副温度计", "span" : " "},  
   "connect_verify" : {"on" : 1, "off" : 0, "label" : "上传客户交接单", "span" : " "},  
   "write_temp_switch" : {"on" : 1, "off" : 0, "label" : "取派件填写开启关闭温度", "span" : " "},  
   "batch_delivery_switch" : {"on" : 1, "off" : 0, "label" : "批量派件", "span" : " "},
   "cpc_not_use_ssexpress" : {"on" : 1, "off" : 0, "label" : "不使用生生签收单据", "span" : " "},
   "cpc_use_customer_express" : {"on" : 1, "off" : 0, "label" : "使用客户签收单据", "span" : " "}
  }

TMS_PROJECT_CONFIG
  {
    "pickup_collect_note_switch" : {"on" : 1, "off" : 0, "label" : "取件给收件方发送短信", "span" : " "},  
    "pickup_client_mail_switch" : {"on" : 1, "off" : 0, "label" : "取件给客户发送邮件", "span" : " "}, 
    "note_code_switch" : {"on" : 1, "off" : 0, "label" : "派件验证码校验", "span" : " "}, 
    "cpc_send_message_add_customer" : {"on" : 1, "off" : 0, "label" : " 取派短信发送项目人员信息", "span" : ""},
    "send_code_verify" : {"on" : 1, "off" : 0, "label" : "到达派件签收码校验", "span" : " "},  
    "connect_verify" : {"on" : 1, "off" : 0, "label" : "上传客户交接单", "span" : " "},  
    "batch_delivery_switch" : {"on" : 1, "off" : 0, "label" : "批量派件", "span" : " "},
    "cpc_not_use_ssexpress" : {"on" : 1, "off" : 0, "label" : "不使用生生签收单据", "span" : " "},
   "cpc_use_customer_express" : {"on" : 1, "off" : 0, "label" : "使用客户签收单据", "span" : " "}
  }