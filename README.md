# csl_pro
4000121321 SSWL

bcdedit /set hypervisorlaunchtype off    //Hyper-v 关闭
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All



ALTER table tms_supplier add COLUMN tms_sup_bank_account VARCHAR (255) DEFAULT NULL COMMENT '银行账号' AFTER tms_sup_invoicetype;
ALTER table tms_supplier add COLUMN tms_sup_bank_name VARCHAR (255) DEFAULT NULL COMMENT '开户银行名称' AFTER tms_sup_invoicetype;
ALTER table tms_supplier add COLUMN tms_sup_payee_name VARCHAR (255) DEFAULT NULL COMMENT '银行账号' AFTER tms_sup_invoicetype;