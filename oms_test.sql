/*
 Navicat Premium Data Transfer

 Source Server         : oms_test
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 139.224.82.62:3456
 Source Schema         : oms_test

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 22/06/2022 09:26:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for 2019_sup_preise
-- ----------------------------
DROP TABLE IF EXISTS `2019_sup_preise`;
CREATE TABLE `2019_sup_preise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ro_name` varchar(40) DEFAULT NULL,
  `start_city` varchar(30) DEFAULT NULL,
  `stop_city` varchar(30) DEFAULT NULL,
  `ro_type` varchar(30) DEFAULT NULL,
  `sup_name` varchar(100) DEFAULT NULL,
  `preise` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=989 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for 2020_sup_preise
-- ----------------------------
DROP TABLE IF EXISTS `2020_sup_preise`;
CREATE TABLE `2020_sup_preise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ro_name` varchar(40) DEFAULT NULL,
  `start_city` varchar(30) DEFAULT NULL,
  `stop_city` varchar(30) DEFAULT NULL,
  `ro_type` varchar(30) DEFAULT NULL,
  `sup_name` varchar(100) DEFAULT NULL,
  `preise` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1476 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for 2021_1_sup_preise
-- ----------------------------
DROP TABLE IF EXISTS `2021_1_sup_preise`;
CREATE TABLE `2021_1_sup_preise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ro_name` varchar(40) DEFAULT NULL,
  `start_city` varchar(30) DEFAULT NULL,
  `stop_city` varchar(30) DEFAULT NULL,
  `ro_type` varchar(30) DEFAULT NULL,
  `sup_name` varchar(100) DEFAULT NULL,
  `preise` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1407 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for 2021_2_sup_preise
-- ----------------------------
DROP TABLE IF EXISTS `2021_2_sup_preise`;
CREATE TABLE `2021_2_sup_preise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ro_name` varchar(40) DEFAULT NULL,
  `start_city` varchar(30) DEFAULT NULL,
  `stop_city` varchar(30) DEFAULT NULL,
  `ro_type` varchar(30) DEFAULT NULL,
  `sup_name` varchar(100) DEFAULT NULL,
  `preise` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2883 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for abnormal_punishment
-- ----------------------------
DROP TABLE IF EXISTS `abnormal_punishment`;
CREATE TABLE `abnormal_punishment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qc_id` int(11) NOT NULL DEFAULT '0' COMMENT '异常质控表对应id',
  `duty_person_id` int(11) DEFAULT NULL COMMENT '责任人id',
  `duty_name` varchar(50) DEFAULT NULL COMMENT '责任人名字',
  `penalty_type` int(3) DEFAULT NULL COMMENT '处罚类型 0待岗培训,1停薪待岗培训,2罚款,3严重警告',
  `penalty_amount` decimal(10,2) DEFAULT '0.00' COMMENT '处罚金额',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=409 DEFAULT CHARSET=utf8mb4 COMMENT='责任人异常处罚表';

-- ----------------------------
-- Table structure for account_subject
-- ----------------------------
DROP TABLE IF EXISTS `account_subject`;
CREATE TABLE `account_subject` (
  `as_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '科目id',
  `as_rank` tinyint(11) DEFAULT '0' COMMENT '科目级别',
  `as_name` char(128) DEFAULT NULL COMMENT '科目名称',
  `as_pid` tinyint(11) unsigned DEFAULT '0' COMMENT '父级科目id',
  `as_visbile` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 0--停用,1--正常',
  `as_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `as_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`as_id`),
  KEY `as_pid` (`as_pid`),
  KEY `as_name` (`as_name`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 COMMENT='会计科目表';

-- ----------------------------
-- Table structure for achievements_box
-- ----------------------------
DROP TABLE IF EXISTS `achievements_box`;
CREATE TABLE `achievements_box` (
  `oab_id` int(11) NOT NULL AUTO_INCREMENT,
  `oab_stoid` int(11) NOT NULL COMMENT '箱子id',
  `oab_stoname` varchar(255) NOT NULL COMMENT '箱子名称',
  `oab_ctpk` float(11,2) DEFAULT '0.00' COMMENT '温控取件绩效',
  `oab_fctpk` float(11,2) DEFAULT '0.00' COMMENT '非温控取件绩效',
  `oab_ctde` float(11,2) DEFAULT '0.00' COMMENT '温控发货绩效',
  `oab_fctde` float(11,2) DEFAULT '0.00' COMMENT '非温控发货绩效',
  `oab_cttde` float(11,2) DEFAULT '0.00' COMMENT '温控提货绩效',
  `oab_fcttde` float(11,2) DEFAULT '0.00' COMMENT '非温控提货绩效',
  `oab_ctsend` float(11,2) DEFAULT '0.00' COMMENT '温控派件绩效',
  `oab_fctsend` float(11,2) DEFAULT '0.00' COMMENT '非温控派件绩效',
  `oab_pallocation` float(11,2) DEFAULT '0.00' COMMENT '温控方案调拨绩效',
  `oab_fpallocation` float(11,2) DEFAULT '0.00' COMMENT '非温控方案调拨绩效',
  PRIMARY KEY (`oab_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='箱型绩效配置表';

-- ----------------------------
-- Table structure for achievements_log
-- ----------------------------
DROP TABLE IF EXISTS `achievements_log`;
CREATE TABLE `achievements_log` (
  `oar_id` int(11) NOT NULL AUTO_INCREMENT,
  `oa_id` int(11) NOT NULL COMMENT '关联绩效记录',
  `oar_type` int(2) DEFAULT '0' COMMENT '记录类型 0创建绩效  1.补充绩效 2.删除绩效 3.修改绩效',
  `oar_log` varchar(255) DEFAULT NULL COMMENT '绩效变化',
  `oar_uid` int(11) DEFAULT '0' COMMENT '记录操作人id',
  `oar_uname` varchar(255) DEFAULT NULL COMMENT '记录操作人名称',
  `oar_time` int(11) DEFAULT '0' COMMENT '操作时间',
  `oar_beizu` varchar(255) DEFAULT NULL COMMENT '操作备注',
  PRIMARY KEY (`oar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13012 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for added_service
-- ----------------------------
DROP TABLE IF EXISTS `added_service`;
CREATE TABLE `added_service` (
  `as_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号ID',
  `to_id` int(11) DEFAULT '0' COMMENT '运输单序号',
  `as_items` varchar(10) DEFAULT '0' COMMENT '检测项 1-取派人员核酸检测 2-外包装核酸检测 3-药品外包装检测',
  `as_per_pick_up_time` tinyint(3) NOT NULL DEFAULT '0' COMMENT '人员检测-取件人核酸时效',
  `as_per_delivery_time` tinyint(3) NOT NULL DEFAULT '0' COMMENT '人员检测-派件人核酸时效',
  `as_drug_time` tinyint(3) NOT NULL DEFAULT '0' COMMENT '药品检测-时间范围',
  `as_antibody_pick_up_time` tinyint(3) NOT NULL DEFAULT '0' COMMENT '抗体检测-取件人核酸时效',
  `as_antibody_delivery_time` tinyint(3) NOT NULL DEFAULT '0' COMMENT '抗体检测-派件人核酸时效',
  `as_pack_time` tinyint(3) NOT NULL DEFAULT '0' COMMENT '外包装检测-时间范围',
  `as_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `as_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  `as_price_json` text NOT NULL,
  PRIMARY KEY (`as_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10462 DEFAULT CHARSET=utf8mb4 COMMENT='订单增值服务表';

-- ----------------------------
-- Table structure for adjustment_income
-- ----------------------------
DROP TABLE IF EXISTS `adjustment_income`;
CREATE TABLE `adjustment_income` (
  `ai_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ai_no` varchar(64) DEFAULT NULL COMMENT '调整单号',
  `ai_settlement` tinyint(1) NOT NULL COMMENT '结算类型 1物流 2样本 3 仓储、其他',
  `ai_settlement_type` int(10) DEFAULT NULL COMMENT '结算单业务类型 1 物流 2 样本 3 仓储 4 耗材 5 其他',
  `ai_settlement_id` int(10) NOT NULL COMMENT '结算单id',
  `to_no` varchar(32) DEFAULT NULL COMMENT '运单号',
  `cu_id` int(10) NOT NULL COMMENT '调整客户id',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '调整客户名称',
  `ai_month` varchar(12) NOT NULL COMMENT '调整月份',
  `ur_uid` int(10) DEFAULT NULL COMMENT '调整人ID',
  `username` varchar(32) DEFAULT NULL COMMENT '调整人姓名',
  `ai_create_time` int(10) DEFAULT NULL COMMENT '调整时间',
  `ai_ago_amount` decimal(12,2) DEFAULT NULL COMMENT '调整前金额',
  `ai_later_amount` decimal(12,2) DEFAULT NULL COMMENT '调整后金额',
  `ai_amount` decimal(12,2) DEFAULT NULL COMMENT '调整金额',
  `ai_fee_type` int(5) NOT NULL COMMENT '费用类型 见config定义',
  `ai_rate` decimal(10,4) DEFAULT NULL COMMENT '调整单税率',
  `ai_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '结转状态 1 未结转 2 已结转',
  `cdr_id` int(10) DEFAULT NULL COMMENT '结转id',
  `ai_remark` longtext COMMENT '结转备注信息',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  `ai_settlement_month` varchar(12) DEFAULT NULL COMMENT '原结算单月份',
  PRIMARY KEY (`ai_id`),
  KEY `ai_month` (`ai_month`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8mb4 COMMENT='费用调整表';

-- ----------------------------
-- Table structure for allocation
-- ----------------------------
DROP TABLE IF EXISTS `allocation`;
CREATE TABLE `allocation` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `allot_no` varchar(30) NOT NULL COMMENT '调拨编号',
  `type` int(1) unsigned NOT NULL COMMENT '调拨类型：1返修出库2返修入库3外借出库4外借入库5国际出库6国际入库7盘亏出库8盘盈入库9质控出库10质控入库',
  `csw_id` int(10) unsigned NOT NULL COMMENT '调出仓库',
  `rsw_id` int(10) unsigned NOT NULL COMMENT '调入仓库',
  `duty_uid` int(10) unsigned DEFAULT NULL COMMENT '责任人',
  `approval_no` varchar(30) DEFAULT NULL COMMENT '审批编号',
  `status` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '1新建2完成3取消',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `modify_time` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `confirm_time` int(10) NOT NULL DEFAULT '0' COMMENT '确认时间',
  `id_visible` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-显示 2-删除',
  `cu_id` int(11) DEFAULT NULL COMMENT '外借客户id',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '外借客户名称',
  `em_name` varchar(255) DEFAULT NULL COMMENT '销售人员名称',
  PRIMARY KEY (`id`),
  KEY `cwa_id` (`csw_id`),
  KEY `rwa_id` (`rsw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1058 DEFAULT CHARSET=utf8 COMMENT='仓库调拨表';

-- ----------------------------
-- Table structure for allocation_detail
-- ----------------------------
DROP TABLE IF EXISTS `allocation_detail`;
CREATE TABLE `allocation_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '明细序号',
  `al_id` int(11) unsigned DEFAULT NULL COMMENT '调拨序号',
  `sto_id` int(11) unsigned DEFAULT NULL COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(32) DEFAULT '' COMMENT '存货名称',
  `sto_batch` char(16) DEFAULT '' COMMENT '批号',
  `id_quantity` smallint(6) unsigned DEFAULT '0' COMMENT '数量',
  `sto_has_identifier` int(1) unsigned DEFAULT NULL COMMENT '有无编号',
  `stt_id` int(11) DEFAULT NULL COMMENT '存货类型序号',
  `gd_series_number` varchar(155) DEFAULT NULL COMMENT '存货序列号',
  PRIMARY KEY (`id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1643 DEFAULT CHARSET=utf8 COMMENT='仓库调拨明细表';

-- ----------------------------
-- Table structure for ams_check_inventory_region
-- ----------------------------
DROP TABLE IF EXISTS `ams_check_inventory_region`;
CREATE TABLE `ams_check_inventory_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `check_id` int(11) NOT NULL DEFAULT '0' COMMENT '盘点id(对应check_inventroy表主键id)',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '地区id（对应system_region表id）',
  `sw_id` int(11) NOT NULL DEFAULT '0' COMMENT 'subwarehouse表主键id',
  `check_time_start` int(11) NOT NULL DEFAULT '0' COMMENT '盘点开始时间',
  `check_time_end` int(11) NOT NULL DEFAULT '0' COMMENT '盘点结束时间',
  `system_total` int(11) NOT NULL DEFAULT '0' COMMENT '系统库存',
  `check_total` int(11) NOT NULL DEFAULT '0' COMMENT '盘点库存',
  `check_loss_total` int(11) NOT NULL DEFAULT '0' COMMENT '盘亏总数',
  `check_won_total` int(11) NOT NULL DEFAULT '0' COMMENT '盘盈总数',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '盘点负责人(目前未user id)',
  `status` tinyint(4) DEFAULT '-1' COMMENT '盘点状态：-1，未开始；1，盘点中；2，盘点结束；',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_check_id` (`check_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3212 DEFAULT CHARSET=utf8mb4 COMMENT='盘点区域表';

-- ----------------------------
-- Table structure for ams_cold_stock
-- ----------------------------
DROP TABLE IF EXISTS `ams_cold_stock`;
CREATE TABLE `ams_cold_stock` (
  `cs_id` int(11) NOT NULL AUTO_INCREMENT,
  `sto_id` int(11) NOT NULL COMMENT '资产id',
  `sto_no` varchar(64) DEFAULT NULL COMMENT '资产编号',
  `sto_name` varchar(255) DEFAULT NULL COMMENT '资产名称',
  `cs_number` int(11) NOT NULL COMMENT '库房间数',
  `cs_build_time` int(11) DEFAULT NULL COMMENT '建设时间',
  `cs_check_time` int(11) DEFAULT NULL COMMENT '验收时间',
  `cs_count_measure` decimal(10,2) NOT NULL COMMENT '总面积',
  `cs_count_volume` decimal(10,2) NOT NULL COMMENT '总体积',
  `cs_price` int(11) DEFAULT NULL COMMENT '单价',
  `cs_alternator` tinyint(4) NOT NULL COMMENT '备用发电机',
  `cs_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `cs_updatetime` int(11) DEFAULT NULL COMMENT '最后跟新时间',
  PRIMARY KEY (`cs_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ams_cold_stock_details
-- ----------------------------
DROP TABLE IF EXISTS `ams_cold_stock_details`;
CREATE TABLE `ams_cold_stock_details` (
  `csd_id` int(11) NOT NULL AUTO_INCREMENT,
  `cs_id` int(11) NOT NULL COMMENT '父级id',
  `gd_id` int(11) NOT NULL COMMENT '明细编号id',
  `csd_measure` decimal(10,2) NOT NULL COMMENT '面积',
  `csd_volume` decimal(10,2) NOT NULL COMMENT '体积',
  `csd_temperature` varchar(128) NOT NULL COMMENT '温区',
  `csd_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `csd_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `csd_updatetime` int(11) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`csd_id`),
  KEY `cs_id` (`cs_id`),
  KEY `gd_id` (`gd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ams_dryice_procurement_expense
-- ----------------------------
DROP TABLE IF EXISTS `ams_dryice_procurement_expense`;
CREATE TABLE `ams_dryice_procurement_expense` (
  `dpe_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '干冰费用报销ID',
  `dpe_type` int(11) NOT NULL DEFAULT '1' COMMENT '1:已提交，2未提交',
  `dpe_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '报销金额',
  `dep_purchase_no` varchar(30) NOT NULL COMMENT '采购审批单号',
  `dpe_status` int(11) NOT NULL DEFAULT '0' COMMENT '审批状态 1审批中，2已通过，3已驳回',
  `dpe_creation_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `dpe_lastup_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `dpe_visible` int(11) NOT NULL DEFAULT '1' COMMENT '1正常，0删除',
  `dpe_json` longtext COMMENT '存储json数据，后期审批拒绝的时候重新提交使用',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '提交人ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '提交人姓名',
  `payee_ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '收款人ID',
  `payee_username` varchar(30) NOT NULL DEFAULT '' COMMENT '收款人姓名',
  `wms_dip_id` int(11) NOT NULL DEFAULT '0' COMMENT '采购单ID',
  `sp_bill_type` int(11) NOT NULL DEFAULT '0' COMMENT '1发票，2收据，3待开票',
  `examine_ee_id` int(11) NOT NULL DEFAULT '0' COMMENT 'oa异步创建的ID',
  PRIMARY KEY (`dpe_id`),
  KEY `idx_dep_purchase_no` (`dep_purchase_no`) USING BTREE COMMENT '泛微审批单号',
  KEY `idx_examine_ee_id` (`examine_ee_id`) USING BTREE COMMENT '关联异步ID',
  KEY `idx_ur_uid` (`ur_uid`) USING BTREE COMMENT '提交人ID'
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COMMENT='干冰采购费用报销表';

-- ----------------------------
-- Table structure for ams_dryice_purchase_account
-- ----------------------------
DROP TABLE IF EXISTS `ams_dryice_purchase_account`;
CREATE TABLE `ams_dryice_purchase_account` (
  `dp_id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dp_date` int(11) NOT NULL DEFAULT '0' COMMENT '供货年月',
  `su_id` int(10) NOT NULL DEFAULT '0' COMMENT '供应商序号',
  `su_name` varchar(128) NOT NULL DEFAULT '' COMMENT '供应商名称',
  `tax_rate` int(11) NOT NULL DEFAULT '0' COMMENT '税率',
  `price_uptax` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '含税单价',
  `region_id` int(10) NOT NULL DEFAULT '0' COMMENT '城市序号',
  `region_name` varchar(64) DEFAULT '' COMMENT '城市名称',
  `dp_company` varchar(128) NOT NULL DEFAULT '' COMMENT '所属公司',
  `dp_operate_number` int(11) NOT NULL DEFAULT '0' COMMENT '运营供货数量',
  `dp_estimation_number` int(11) NOT NULL DEFAULT '0' COMMENT '暂估数量',
  `dp_estimation_number_confirm` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0  未确认   1 已确认',
  `dp_estimation_difference` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '暂估差异',
  `dp_reconciliation_number` int(11) NOT NULL DEFAULT '0' COMMENT '对账单数量',
  `dp_customer_invoice_no` varchar(64) NOT NULL DEFAULT '' COMMENT '供应商发票',
  `dp_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `dp_amount_date` int(11) NOT NULL DEFAULT '0' COMMENT '付款月份',
  `at_id` varchar(128) NOT NULL DEFAULT '' COMMENT '附件序号  逗号分割',
  `pay_at_id` varchar(128) NOT NULL DEFAULT '' COMMENT '付款单 附件序号 逗号分割',
  `dp_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态  0 未对账 1  待审核  2 审核中  3 审核通过/未付款  4  审核拒绝 5 已付款   6财务已编辑  7财务已确认',
  `dp_entry_confirm_date` int(11) NOT NULL DEFAULT '0' COMMENT '入账月份',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `username` varchar(64) NOT NULL DEFAULT '' COMMENT '操作人名称',
  `dp_create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dp_update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `approval_id` varchar(64) NOT NULL DEFAULT '' COMMENT '提交泛微审批id',
  `approval_no` varchar(128) NOT NULL DEFAULT '' COMMENT '泛微审批编号',
  `dp_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '付款事由',
  `su_settlement_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '结算方式   1  现结   2 月结',
  `dp_estimation_included` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '暂估成本(含税)  报价*暂估数量',
  `dp_estimation_excluding` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '暂估成本(不含税)  暂估成本（含税）/（1+税率）',
  `dp_actual_excluding` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际成本(不含税)  付款金额/（1+税率）',
  `dp_income_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '进项税额  付款金额-实际成本（不含税）',
  `dp_eorc_excluding` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '暂估与实际成本差异(不含税)  实际成本（不含税）-暂估成本（不含税）',
  PRIMARY KEY (`dp_id`),
  KEY `idx_dp_date` (`dp_date`)
) ENGINE=InnoDB AUTO_INCREMENT=369 DEFAULT CHARSET=utf8mb4 COMMENT='干冰采购台账';

-- ----------------------------
-- Table structure for ams_dryice_recycle_remind
-- ----------------------------
DROP TABLE IF EXISTS `ams_dryice_recycle_remind`;
CREATE TABLE `ams_dryice_recycle_remind` (
  `drr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `drr_date` varchar(20) NOT NULL DEFAULT '' COMMENT '回收时间',
  `drr_visible` int(11) NOT NULL DEFAULT '1' COMMENT '0删除：1正常',
  `drr_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `drr_type` int(11) NOT NULL DEFAULT '0' COMMENT '1:取件，2派件',
  PRIMARY KEY (`drr_id`),
  KEY `idx_ur_uid` (`ur_uid`) USING BTREE COMMENT '人员信息',
  KEY `idx_drr_date` (`drr_date`) USING BTREE COMMENT '日期'
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4 COMMENT='干冰采购回收提醒';

-- ----------------------------
-- Table structure for ams_file_resource
-- ----------------------------
DROP TABLE IF EXISTS `ams_file_resource`;
CREATE TABLE `ams_file_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '文件类型：0，未定义类型；1，采购报账附件',
  `domain` char(50) NOT NULL DEFAULT '' COMMENT '访问域',
  `file_name` varchar(100) NOT NULL DEFAULT '',
  `file_ext` varchar(50) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件的保存地址',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `creator` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`),
  KEY `type` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COMMENT='资产系统资源表';

-- ----------------------------
-- Table structure for ams_inventory_transit_count
-- ----------------------------
DROP TABLE IF EXISTS `ams_inventory_transit_count`;
CREATE TABLE `ams_inventory_transit_count` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `check_id` int(11) NOT NULL COMMENT '盘点id',
  `transit_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '在途类型',
  `sto_id` int(11) NOT NULL COMMENT '资产id',
  `sto_no` varchar(255) NOT NULL DEFAULT '' COMMENT '资产编号',
  `sto_name` varchar(255) NOT NULL DEFAULT '' COMMENT '资产名称',
  `transit_count` int(11) NOT NULL DEFAULT '0' COMMENT '系统库存',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4 COMMENT='在途盘点记录';

-- ----------------------------
-- Table structure for ams_inventory_transit_details
-- ----------------------------
DROP TABLE IF EXISTS `ams_inventory_transit_details`;
CREATE TABLE `ams_inventory_transit_details` (
  `ad_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ac_id` int(11) NOT NULL COMMENT '父级id',
  `gd_series_number` varbinary(128) NOT NULL COMMENT '明细编号',
  `sto_name` varchar(128) NOT NULL COMMENT '耗材id',
  `order_or_user` varchar(64) NOT NULL COMMENT '订单号用户姓名',
  `personal_time` int(11) NOT NULL DEFAULT '0' COMMENT '个人耗材创建时间  订单绑定时间',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117079 DEFAULT CHARSET=utf8mb4 COMMENT='在途盘点明细';

-- ----------------------------
-- Table structure for ams_lease_order
-- ----------------------------
DROP TABLE IF EXISTS `ams_lease_order`;
CREATE TABLE `ams_lease_order` (
  `lo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lo_no` varchar(64) NOT NULL DEFAULT '' COMMENT '订单编号',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '运单id',
  `to_no` varchar(32) NOT NULL DEFAULT '' COMMENT '运单编号',
  `to_customer_no` varchar(128) NOT NULL DEFAULT '' COMMENT '国际单号',
  `sto_id` int(11) NOT NULL DEFAULT '0' COMMENT '资产id',
  `gd_series_number` varchar(32) NOT NULL DEFAULT '' COMMENT '耗材明细编号',
  `lo_lease_time` int(11) NOT NULL DEFAULT '0' COMMENT '租借日期',
  `lo_lease_username` varchar(128) NOT NULL DEFAULT '' COMMENT '租售人名称',
  `lo_lease_phone` varchar(64) NOT NULL DEFAULT '' COMMENT '租售人电话',
  `lo_lease_address` varchar(255) NOT NULL DEFAULT '' COMMENT '租售人地址',
  `cu_id` varchar(255) NOT NULL DEFAULT '' COMMENT '委托客户',
  `cu_name` varchar(255) NOT NULL DEFAULT '' COMMENT '委托客户名称',
  `lo_amount` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `lo_amount_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否确认金额  0 未确认   1  确认',
  `lo_is_charge` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否收费  1  收费   0不收费',
  `lo_operation_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人',
  `lo_operation_name` varchar(64) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `lo_operation_phone` varchar(64) NOT NULL DEFAULT '',
  `lo_sale_uid` int(11) NOT NULL DEFAULT '0' COMMENT '销售负责人',
  `lo_sale_name` varchar(64) NOT NULL DEFAULT '' COMMENT '销售人姓名',
  `lo_pickup_uid` int(11) NOT NULL COMMENT '取件人',
  `lo_pickup_name` varchar(64) NOT NULL DEFAULT '' COMMENT '取件人姓名',
  `lo_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '销售类型：0，未定义（待选择）； 1，出租；2， 销售；',
  `lo_estimate_time` int(11) NOT NULL DEFAULT '0' COMMENT '预计归还时间',
  `lo_actual_time` int(11) NOT NULL DEFAULT '0' COMMENT '实际取回时间',
  `lo_return_username` varchar(128) NOT NULL DEFAULT '' COMMENT '归还人名称',
  `lo_return_phone` varchar(64) NOT NULL DEFAULT '' COMMENT '归还人电话',
  `lo_return_address` varchar(255) NOT NULL DEFAULT '' COMMENT '归还人地址',
  `lo_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `lo_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：0，取消；-1，审核不通过；1，审核中；2，已审核；3，已销售；4，已出租；5，待归还；6，待取货；7，已归还；',
  `lo_order_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源  1 APP  2  OMS',
  `lo_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lo_updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `settlement_status` tinyint(4) DEFAULT '0' COMMENT '结算状态 0未结算 1已结算 2不收费',
  `is_clinical` tinyint(4) DEFAULT '0' COMMENT '是否临床项目 0不是 1是',
  `lo_convert` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否转换   0  否  1  是',
  `lo_pick_method` tinyint(4) NOT NULL DEFAULT '0' COMMENT '取件方式   1  客户自己取回  2  生生安排取件',
  `alw_id` int(10) NOT NULL DEFAULT '0' COMMENT '工作单ID',
  `province_id` int(10) NOT NULL DEFAULT '0' COMMENT '省份ID',
  `province_name` varchar(128) NOT NULL DEFAULT '' COMMENT '省份名称',
  `region_id` int(10) NOT NULL DEFAULT '0' COMMENT '城市ID',
  `region_name` varchar(128) NOT NULL DEFAULT '' COMMENT '城市名称',
  PRIMARY KEY (`lo_id`),
  KEY `idx_gd_series_number` (`gd_series_number`),
  KEY `idx_sto_id` (`sto_id`),
  KEY `idx_to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1714 DEFAULT CHARSET=utf8mb4 COMMENT='耗材租售订单';

-- ----------------------------
-- Table structure for ams_lease_workorder
-- ----------------------------
DROP TABLE IF EXISTS `ams_lease_workorder`;
CREATE TABLE `ams_lease_workorder` (
  `alw_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '工作单ID',
  `alw_no` varchar(64) NOT NULL DEFAULT '' COMMENT '工作单编号',
  `alo_id` varchar(255) NOT NULL DEFAULT '' COMMENT '租售订单 ID',
  `alo_no` varchar(512) NOT NULL DEFAULT '' COMMENT '租售订单编号',
  `alw_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '工作单状态   0已取消   1未指派  2 未完成  3已完成',
  `alw_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '工作单类型 1 外送  2 回收',
  `alw_work_time` int(10) NOT NULL DEFAULT '0' COMMENT '工作日期',
  `alw_completion_time` int(10) NOT NULL COMMENT '完成时间',
  `alw_region_id` int(10) NOT NULL COMMENT '工作城市ID',
  `alw_region_name` varchar(128) NOT NULL DEFAULT '' COMMENT '工作城市名字',
  `alw_leader_uid` int(10) NOT NULL DEFAULT '0' COMMENT '组长ID',
  `alw_leader_name` varchar(64) NOT NULL DEFAULT '' COMMENT '组长姓名',
  `alw_operator_uid` int(10) NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `alw_operator_name` varchar(64) NOT NULL DEFAULT '' COMMENT '操作员姓名',
  `sto_name` varchar(1024) NOT NULL DEFAULT '' COMMENT '资产名称',
  `alw_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '数量',
  `cu_id` int(10) NOT NULL DEFAULT '0' COMMENT '客户ID\r\n',
  `cu_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `alw_address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `alw_name` varchar(128) NOT NULL DEFAULT '' COMMENT '姓名',
  `alw_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `alw_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `lo_created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lo_updated_at` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `alw_cancel_uid` int(11) NOT NULL DEFAULT '0' COMMENT '取消人ID',
  `alw_cancel_name` varchar(20) NOT NULL DEFAULT '' COMMENT '取消人姓名',
  `alw_accomplish_uid` int(11) NOT NULL DEFAULT '0' COMMENT '完成人ID',
  `alw_accomplish_name` varchar(20) NOT NULL DEFAULT '' COMMENT '完成人姓名',
  PRIMARY KEY (`alw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COMMENT='租售订单工作单';

-- ----------------------------
-- Table structure for ams_material_bind_rfid_record
-- ----------------------------
DROP TABLE IF EXISTS `ams_material_bind_rfid_record`;
CREATE TABLE `ams_material_bind_rfid_record` (
  `ams_mbr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `gd_series_number` varchar(32) DEFAULT NULL COMMENT '耗材编码',
  `rfid_code` varchar(80) DEFAULT NULL COMMENT 'RFID芯片原始编码',
  `ur_uid` int(11) DEFAULT NULL COMMENT '扫码绑定人',
  `username` varchar(20) DEFAULT NULL COMMENT '扫码绑定人名字',
  `ams_mbr_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `ams_mbr_lastuptime` int(11) DEFAULT NULL COMMENT '最后修改时间',
  `mbr_visible` tinyint(1) DEFAULT '1' COMMENT '0删除，1:正常',
  `delete_ur_uid` int(11) DEFAULT NULL COMMENT '解绑人ID',
  `delete_username` varchar(20) DEFAULT NULL COMMENT '解绑人名字',
  PRIMARY KEY (`ams_mbr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='耗材绑定RFID记录表';

-- ----------------------------
-- Table structure for ams_material_offer
-- ----------------------------
DROP TABLE IF EXISTS `ams_material_offer`;
CREATE TABLE `ams_material_offer` (
  `mo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `mo_name` int(11) NOT NULL COMMENT '名称（资产名称）',
  `mo_type` int(11) NOT NULL COMMENT '类型(资产类型)',
  `mo_status` tinyint(1) NOT NULL COMMENT '状态 0 显示   1 删除  2 历史记录',
  `mo_specs` varchar(128) DEFAULT NULL COMMENT '规格',
  `mo_offer` double(11,2) NOT NULL COMMENT '报价',
  `mo_offer_time` int(11) NOT NULL COMMENT '报价时间',
  `mo_purchase_money` double(11,2) DEFAULT NULL COMMENT '采购价',
  `mo_purchase_time` int(11) DEFAULT NULL COMMENT '采购时间',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `region_name` varchar(64) NOT NULL DEFAULT '' COMMENT '城市名称',
  `mo_supplier_name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `mo_supplier_id` int(11) NOT NULL COMMENT '供应商id',
  `mo_contact` varchar(64) NOT NULL COMMENT '联系人',
  `mo_contact_mobile` varchar(32) NOT NULL COMMENT '联系电话',
  `mo_address` varchar(255) DEFAULT NULL COMMENT '地址',
  `mo_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `mo_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `mo_updatetime` int(11) DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`mo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COMMENT='物资报价表';

-- ----------------------------
-- Table structure for ams_procurement_approval_detail
-- ----------------------------
DROP TABLE IF EXISTS `ams_procurement_approval_detail`;
CREATE TABLE `ams_procurement_approval_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sp_id` int(11) NOT NULL COMMENT 'procurement_approval表id',
  `stock_no` varchar(100) NOT NULL DEFAULT '' COMMENT '物资编号（可能会没有）',
  `stock_name` varchar(100) NOT NULL DEFAULT '' COMMENT '物资名称（泛微表单中的名称，不代表系统名称）',
  `category_name` varchar(50) DEFAULT '' COMMENT '物资分类（只是泛微表单中对应的分类名称，不代表系统中的分类）',
  `type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物资类型（这个类型只是泛微定义的类型名称，不代表系统中的资产类型）',
  `num` mediumint(9) NOT NULL DEFAULT '0' COMMENT '采购数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `expected_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '期望到货时间',
  `estimated_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '预计到货时间',
  `unit` varchar(100) NOT NULL DEFAULT '' COMMENT '单位',
  `arrival_city` varchar(50) NOT NULL DEFAULT '' COMMENT '到货城市',
  `is_del` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_sp_id` (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=516 DEFAULT CHARSET=utf8mb4 COMMENT='采购审批详情表（主要记录采购物资的具体信息）';

-- ----------------------------
-- Table structure for ams_procurement_approval_record
-- ----------------------------
DROP TABLE IF EXISTS `ams_procurement_approval_record`;
CREATE TABLE `ams_procurement_approval_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `procurement_approval_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '采购审批主记录id',
  `procurement_approval_no` varchar(100) NOT NULL DEFAULT '' COMMENT '采购审批号',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '序号',
  `approver` varchar(50) NOT NULL DEFAULT '0' COMMENT '审批人',
  `all_approver` varchar(255) NOT NULL DEFAULT '' COMMENT '节点上全部可审批人字符串（按照逗号隔开）',
  `approve_status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '审批状态：1-审批中；2-已同意；3-已驳回；4-已转审',
  `approve_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批时间',
  `is_del` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_procurement_approval_id` (`procurement_approval_id`),
  KEY `index_procurement_approval_no` (`procurement_approval_no`),
  KEY `index_approver` (`approver`)
) ENGINE=InnoDB AUTO_INCREMENT=2752 DEFAULT CHARSET=utf8mb4 COMMENT='审批记录子表';

-- ----------------------------
-- Table structure for ams_purchase_reimburse
-- ----------------------------
DROP TABLE IF EXISTS `ams_purchase_reimburse`;
CREATE TABLE `ams_purchase_reimburse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `capital_purchase_id` int(11) NOT NULL DEFAULT '0' COMMENT '采购单id',
  `reimburse_time` int(11) NOT NULL DEFAULT '0' COMMENT '报账时间',
  `reimburse_amount` int(11) NOT NULL DEFAULT '0' COMMENT '报账金额（单位:分）',
  `invoice_no` varchar(255) NOT NULL DEFAULT '' COMMENT '发票号',
  `invoice_amount` int(11) NOT NULL DEFAULT '0' COMMENT '发票金额（单位：分）',
  `invoice_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '发票类型：1，增值税专用发票；2，增值税普通发票',
  `tax_rate` float NOT NULL DEFAULT '1' COMMENT '税率',
  `tax_amount` int(11) NOT NULL DEFAULT '0' COMMENT '税额（单位：分）',
  `is_submit_finance` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否提交财务：1，是；0，否',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录生成时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录更新时间',
  PRIMARY KEY (`id`),
  KEY `capital_purchase_id` (`capital_purchase_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='采购报账信息表';

-- ----------------------------
-- Table structure for ams_purchase_reimburse_file
-- ----------------------------
DROP TABLE IF EXISTS `ams_purchase_reimburse_file`;
CREATE TABLE `ams_purchase_reimburse_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_reimburse_id` int(11) NOT NULL DEFAULT '0' COMMENT '采购报账记录id',
  `file_resource_id` int(11) NOT NULL DEFAULT '0' COMMENT '资产系统资源记录表',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除：1，是；0，否',
  PRIMARY KEY (`id`),
  KEY `purchase_reimburse_id` (`purchase_reimburse_id`),
  KEY `file_resource_id` (`file_resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COMMENT='采购报账文件关系表（附件）';

-- ----------------------------
-- Table structure for ams_stock_param
-- ----------------------------
DROP TABLE IF EXISTS `ams_stock_param`;
CREATE TABLE `ams_stock_param` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sto_id` int(11) NOT NULL COMMENT '资产id',
  `inner_size_length` int(11) NOT NULL DEFAULT '0' COMMENT '内径-长',
  `inner_size_width` int(11) NOT NULL DEFAULT '0' COMMENT '内径宽',
  `inner_size_height` int(11) NOT NULL DEFAULT '0' COMMENT '内径-高',
  `load_size_length` int(11) NOT NULL DEFAULT '0' COMMENT '装载尺寸--长',
  `load_size_width` int(11) NOT NULL DEFAULT '0' COMMENT '装载尺寸',
  `load_size_height` int(11) NOT NULL DEFAULT '0' COMMENT '装载尺寸 - 高',
  `out_pack_size_length` int(11) NOT NULL DEFAULT '0' COMMENT '外包装尺寸 - 长',
  `out_pack_size_width` int(11) NOT NULL DEFAULT '0' COMMENT '外包装 - 宽',
  `out_pack_size_height` int(11) NOT NULL DEFAULT '0' COMMENT '外包装尺寸 - 高',
  `inner_pack_size_length` int(11) NOT NULL DEFAULT '0' COMMENT '内纸盒尺寸（内包装尺寸） — 长',
  `inner_pack_size_width` int(11) NOT NULL DEFAULT '0' COMMENT '内包装尺寸 - 宽',
  `inner_pack_size_height` int(11) NOT NULL DEFAULT '0' COMMENT '内纸盒尺寸 - 高',
  `weight` float(8,1) NOT NULL DEFAULT '0.0' COMMENT '重量 （kg）',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='vip保温箱参数表';

-- ----------------------------
-- Table structure for ams_stock_param_temperature
-- ----------------------------
DROP TABLE IF EXISTS `ams_stock_param_temperature`;
CREATE TABLE `ams_stock_param_temperature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sto_id` int(11) NOT NULL COMMENT '资产id',
  `stock_param_id` int(11) NOT NULL DEFAULT '0' COMMENT '资产参数表id',
  `updated_at` tinyint(4) NOT NULL DEFAULT '0',
  `is_del` tinyint(4) DEFAULT '0',
  `temp_id` int(11) NOT NULL DEFAULT '0',
  `created_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=721 DEFAULT CHARSET=utf8mb4 COMMENT='vip保温箱与温区关联表';

-- ----------------------------
-- Table structure for annual_sales
-- ----------------------------
DROP TABLE IF EXISTS `annual_sales`;
CREATE TABLE `annual_sales` (
  `as_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `em_id` int(11) unsigned NOT NULL COMMENT '客户发展业务员员工序号',
  `em_name` varchar(32) DEFAULT '' COMMENT '客户发展业务员员工姓名',
  `as_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1销售，2回款',
  `as_year` int(6) unsigned NOT NULL COMMENT '年度',
  `as_january` decimal(12,2) DEFAULT NULL COMMENT '1月',
  `as_february` decimal(12,2) DEFAULT NULL COMMENT '2月',
  `as_march` decimal(12,2) DEFAULT NULL COMMENT '3月',
  `as_april` decimal(12,2) DEFAULT NULL COMMENT '4月',
  `as_may` decimal(12,2) DEFAULT NULL COMMENT '5月',
  `as_june` decimal(12,2) DEFAULT NULL COMMENT '6月',
  `as_july` decimal(12,2) DEFAULT NULL COMMENT '7月',
  `as_august` decimal(12,2) DEFAULT NULL COMMENT '8月',
  `as_september` decimal(12,2) DEFAULT NULL COMMENT '9月',
  `as_october` decimal(12,2) DEFAULT NULL COMMENT '10月',
  `as_november` decimal(12,2) DEFAULT NULL COMMENT '11月',
  `as_december` decimal(12,2) DEFAULT NULL COMMENT '12月',
  `as_total` decimal(12,2) DEFAULT NULL,
  `as_createtime` int(12) DEFAULT '0' COMMENT '创建时间',
  `as_lastupdtime` int(12) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`as_id`),
  KEY `as_type` (`as_type`),
  KEY `em_id` (`em_id`),
  KEY `as_year` (`as_year`)
) ENGINE=InnoDB AUTO_INCREMENT=622 DEFAULT CHARSET=utf8mb4 COMMENT='销售进度(回款完成)年度统计表';

-- ----------------------------
-- Table structure for annual_sales_plan
-- ----------------------------
DROP TABLE IF EXISTS `annual_sales_plan`;
CREATE TABLE `annual_sales_plan` (
  `sl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '计划序号',
  `em_id` int(11) unsigned NOT NULL COMMENT '客户发展业务员员工序号',
  `em_name` varchar(32) DEFAULT '' COMMENT '客户发展业务员员工姓名',
  `sl_year` int(6) unsigned NOT NULL COMMENT '年度',
  `sl_january` decimal(12,2) DEFAULT NULL COMMENT '1月',
  `sl_february` decimal(12,2) DEFAULT NULL COMMENT '2月',
  `sl_march` decimal(12,2) DEFAULT NULL COMMENT '3月',
  `sl_april` decimal(12,2) DEFAULT NULL COMMENT '4月',
  `sl_may` decimal(12,2) DEFAULT NULL COMMENT '5月',
  `sl_june` decimal(12,2) DEFAULT NULL COMMENT '6月',
  `sl_july` decimal(12,2) DEFAULT NULL COMMENT '7月',
  `sl_august` decimal(12,2) DEFAULT NULL COMMENT '8月',
  `sl_september` decimal(12,2) DEFAULT NULL COMMENT '9月',
  `sl_october` decimal(12,2) DEFAULT NULL COMMENT '10月',
  `sl_november` decimal(12,2) DEFAULT NULL COMMENT '11月',
  `sl_december` decimal(12,2) DEFAULT NULL COMMENT '12月',
  `sl_total` decimal(12,2) DEFAULT NULL,
  `sl_createtime` int(12) DEFAULT '0' COMMENT '创建时间',
  `sl_lastupdtime` int(12) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`sl_id`),
  UNIQUE KEY `em_id` (`em_id`,`sl_year`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='年计划表';

-- ----------------------------
-- Table structure for annual_sales_record
-- ----------------------------
DROP TABLE IF EXISTS `annual_sales_record`;
CREATE TABLE `annual_sales_record` (
  `asr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ur_uid` int(10) unsigned DEFAULT NULL COMMENT '记录操作人ID',
  `username` char(32) DEFAULT NULL COMMENT '记录操作人姓名',
  `asr_type` tinyint(1) DEFAULT NULL COMMENT '统计类型 1 定时 2 手动',
  `as_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '类型 1销售，2回款',
  `asr_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `asr_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`asr_id`),
  KEY `asr_type` (`asr_type`),
  KEY `as_type` (`as_type`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='销售年度统计记录表';

-- ----------------------------
-- Table structure for api_delivery_approval
-- ----------------------------
DROP TABLE IF EXISTS `api_delivery_approval`;
CREATE TABLE `api_delivery_approval` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `receive_parms` text,
  `forward_parms` text,
  `receive_status` varchar(255) DEFAULT '',
  `forward_status` varchar(255) DEFAULT '',
  `receive_to_ids` varchar(50) DEFAULT '',
  `create_time` varchar(50) DEFAULT '',
  `last_update_time` varchar(50) DEFAULT '',
  `sp_num` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for api_drug
-- ----------------------------
DROP TABLE IF EXISTS `api_drug`;
CREATE TABLE `api_drug` (
  `ad_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'api药品表自增id',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '运单id',
  `sw_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `sto_has_identifier` tinyint(1) DEFAULT '0' COMMENT '有无编号',
  `sto_id` int(11) NOT NULL DEFAULT '0' COMMENT '存货id',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `sto_no` varchar(255) DEFAULT NULL COMMENT '存货编号',
  `sto_name` varchar(255) DEFAULT NULL COMMENT '存货名称',
  `sto_batch` varchar(128) DEFAULT NULL COMMENT '批号',
  `sto_volume` char(128) DEFAULT '' COMMENT '规格/容量',
  `sto_counting` char(32) DEFAULT '' COMMENT '计数说明',
  `ad_quantity` int(6) DEFAULT NULL,
  `id_stock_detail` longtext COMMENT '药品编号',
  `io_id` int(11) DEFAULT NULL COMMENT '出库单id',
  `cex_id` int(11) DEFAULT NULL COMMENT '实验表id',
  `ad_createiotime` int(10) DEFAULT NULL COMMENT '出库单生成日期',
  `ad_createtime` int(10) DEFAULT NULL COMMENT '生成时间',
  `ad_create_uid` int(11) DEFAULT NULL COMMENT '创建生成id',
  `conditions` varchar(255) DEFAULT NULL COMMENT '条件区间',
  `id_sto_numbers` text COMMENT '批量录入明细',
  `ad_visible` tinyint(2) DEFAULT '1' COMMENT '状态 1正常 2 删除',
  `hw_id` int(11) unsigned DEFAULT NULL COMMENT '货位ID 对应inventory wa_id ',
  `ad_status` tinyint(1) unsigned DEFAULT '1' COMMENT '药品状态 1-新建 2-已出库',
  `center_no` varchar(10) DEFAULT '' COMMENT '中心编号',
  `center_number` varchar(10) DEFAULT '' COMMENT '中心编号',
  PRIMARY KEY (`ad_id`),
  KEY `sto_id` (`sto_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62446 DEFAULT CHARSET=utf8 COMMENT='api药品表';

-- ----------------------------
-- Table structure for api_group
-- ----------------------------
DROP TABLE IF EXISTS `api_group`;
CREATE TABLE `api_group` (
  `alg_id` int(11) NOT NULL AUTO_INCREMENT,
  `ag_id` int(11) NOT NULL COMMENT '权限组id',
  `al_id` int(11) NOT NULL COMMENT 'api  列表id',
  `ag_visible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '权限状态  1 正常 2 锁定',
  PRIMARY KEY (`alg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8 COMMENT='api 权限分组表';

-- ----------------------------
-- Table structure for api_grouping
-- ----------------------------
DROP TABLE IF EXISTS `api_grouping`;
CREATE TABLE `api_grouping` (
  `ag_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ag_name` varchar(55) COLLATE utf8_unicode_ci NOT NULL COMMENT '分组名称',
  `desc` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '描述',
  `create_at` int(10) DEFAULT NULL COMMENT '添加时间',
  `update_at` int(10) DEFAULT NULL COMMENT '更新时间',
  `ag_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1：正常 2：锁定',
  `limit_custormer` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '限制客户',
  `limit_project` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '限制项目',
  PRIMARY KEY (`ag_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for api_list
-- ----------------------------
DROP TABLE IF EXISTS `api_list`;
CREATE TABLE `api_list` (
  `al_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'api接口id',
  `al_url` varchar(255) CHARACTER SET armscii8 NOT NULL COMMENT 'apiurl',
  `al_remark` varchar(255) DEFAULT NULL COMMENT '接口说明',
  PRIMARY KEY (`al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COMMENT='api 列表';

-- ----------------------------
-- Table structure for api_medidata_backlog
-- ----------------------------
DROP TABLE IF EXISTS `api_medidata_backlog`;
CREATE TABLE `api_medidata_backlog` (
  `mo_id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_no` varchar(200) DEFAULT NULL COMMENT '项目编号',
  `to_customer_no` varchar(100) DEFAULT NULL COMMENT '客户单号',
  `mo_uuid` varchar(50) DEFAULT NULL COMMENT '运件id',
  `mo_study_uuid` varchar(50) DEFAULT NULL COMMENT 'site id',
  `unit_count` int(6) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL COMMENT '订单id',
  `mo_updatetime` int(12) DEFAULT NULL COMMENT '更新时间',
  `mo_createtime` int(12) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`mo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for api_static_medidata
-- ----------------------------
DROP TABLE IF EXISTS `api_static_medidata`;
CREATE TABLE `api_static_medidata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `s_id` char(36) DEFAULT NULL,
  `cp_no` varchar(50) DEFAULT NULL,
  `cu_id` varchar(50) DEFAULT '' COMMENT '客户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for api_user
-- ----------------------------
DROP TABLE IF EXISTS `api_user`;
CREATE TABLE `api_user` (
  `au_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'api用户id',
  `ur_uid` int(11) NOT NULL COMMENT '系统用户id ',
  `au_key` varchar(32) NOT NULL,
  `au_token` varchar(255) NOT NULL,
  `ag_id` int(11) NOT NULL DEFAULT '1' COMMENT '权限id ',
  `au_createtime` int(12) NOT NULL COMMENT '创建时间',
  `au_visible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态  1 正常 2 锁定',
  `au_updatetime` int(12) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`au_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='api 用户列表';

-- ----------------------------
-- Table structure for app_attachment
-- ----------------------------
DROP TABLE IF EXISTS `app_attachment`;
CREATE TABLE `app_attachment` (
  `aat_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `aat_type` int(6) NOT NULL DEFAULT '0' COMMENT '文件分类',
  `aat_subtype` int(11) NOT NULL DEFAULT '0' COMMENT '文件子分类',
  `aat_identifier` int(11) NOT NULL DEFAULT '0' COMMENT '文件标识',
  `aat_filename` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名称',
  `aat_filepath` varchar(1024) NOT NULL DEFAULT '' COMMENT '文件路径',
  `aat_visible` int(4) NOT NULL DEFAULT '1' COMMENT '文件状态 1.正常 2删除',
  `aat_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '上传时间',
  `aat_createuid` int(11) NOT NULL DEFAULT '0' COMMENT '上传人',
  `aat_createname` varchar(255) NOT NULL DEFAULT '' COMMENT '上传人名称',
  `aat_filesize` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '附件文件大小，单位：KB',
  PRIMARY KEY (`aat_id`),
  KEY `idx_aat_type` (`aat_type`),
  KEY `idx_aat_subtype` (`aat_subtype`)
) ENGINE=InnoDB AUTO_INCREMENT=2801 DEFAULT CHARSET=utf8mb4 COMMENT='app独立文件列表';

-- ----------------------------
-- Table structure for app_monitoring_record
-- ----------------------------
DROP TABLE IF EXISTS `app_monitoring_record`;
CREATE TABLE `app_monitoring_record` (
  `amr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'app监控记录ID',
  `start_time` int(11) DEFAULT NULL COMMENT '请求时间',
  `end_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `url_name` varchar(100) DEFAULT NULL COMMENT '接口请求名称',
  `ur_uid` int(11) DEFAULT NULL COMMENT '请求人',
  `request_time` int(11) DEFAULT NULL COMMENT '请求多少秒',
  PRIMARY KEY (`amr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=352076 DEFAULT CHARSET=utf8mb4 COMMENT='app接口监控表格';

-- ----------------------------
-- Table structure for apply_order
-- ----------------------------
DROP TABLE IF EXISTS `apply_order`;
CREATE TABLE `apply_order` (
  `ao_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请序号id',
  `to_id` int(11) unsigned DEFAULT NULL COMMENT '运输单id',
  `to_no` char(32) CHARACTER SET utf8 DEFAULT '' COMMENT '运单编号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户序号',
  `cu_name` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请客户名称',
  `reason` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '申请理由',
  `type` int(2) unsigned DEFAULT '1' COMMENT '申请操作类型',
  `co_id` int(10) unsigned DEFAULT '0' COMMENT '联系人id',
  `status` int(2) unsigned DEFAULT '1' COMMENT '处理状态',
  `ao_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ao_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`ao_id`),
  KEY `to_no` (`to_no`),
  KEY `cu_name` (`cu_name`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=utf8mb4 COMMENT='订单修改、取消申请表';

-- ----------------------------
-- Table structure for apportion_settlement
-- ----------------------------
DROP TABLE IF EXISTS `apportion_settlement`;
CREATE TABLE `apportion_settlement` (
  `as_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分摊费用自增id',
  `as_join_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '结算费绑定id',
  `as_join_type` int(1) NOT NULL COMMENT '结算费绑定类型1:other;2:sample',
  `as_cmonth` char(20) NOT NULL DEFAULT '0' COMMENT '分摊月',
  `as_start_time` int(10) NOT NULL COMMENT '起始时间',
  `as_end_time` int(10) NOT NULL COMMENT '截至时间',
  `as_total_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '报价总额',
  `as_share_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '分摊金额',
  `as_income` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '不含税金额',
  `as_taxrate` decimal(12,4) NOT NULL COMMENT '税率',
  `as_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '税金',
  `xsf_id` int(11) DEFAULT NULL COMMENT '销售方ID',
  `xsf_name` varchar(255) DEFAULT NULL COMMENT '销售方名称',
  `bi_id` int(11) NOT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) NOT NULL COMMENT '开票客户名称',
  `as_carry_down_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '结转状态 1 未确认 2 已确认',
  `as_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1正常2删除',
  `as_create_uid` int(10) NOT NULL COMMENT '创建人',
  `as_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `as_createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `as_lastupd_uid` int(10) NOT NULL COMMENT '最后更新人',
  `as_lastupd_username` char(32) DEFAULT '' COMMENT '更新人姓名',
  `as_lastupdtime` int(10) DEFAULT '0' COMMENT '最后更新时间',
  `as_createtime1` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `as_lastupdtime1` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `cdr_id` int(11) DEFAULT NULL COMMENT '收入结转ID carry_down_record 自增ID',
  PRIMARY KEY (`as_id`),
  KEY `as_join_id` (`as_join_id`),
  KEY `xsf_id` (`xsf_id`),
  KEY `bi_id` (`bi_id`),
  KEY `cdr_id` (`cdr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21346 DEFAULT CHARSET=utf8 COMMENT='费用分摊表';

-- ----------------------------
-- Table structure for area
-- ----------------------------
DROP TABLE IF EXISTS `area`;
CREATE TABLE `area` (
  `ar_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ar_name` varchar(30) NOT NULL COMMENT '大区名称',
  `ar_em_id` int(11) NOT NULL COMMENT '销售负责人ID',
  `ar_em_name` varchar(30) NOT NULL COMMENT '销售负责人',
  `ar_lo_id` int(11) NOT NULL COMMENT '物流负责人ID',
  `ar_lo_name` varchar(30) NOT NULL COMMENT '物流负责人',
  `ar_region` text NOT NULL COMMENT '管辖城市',
  `ar_exist` int(4) NOT NULL DEFAULT '0' COMMENT '是否删除（0未删除，1已删除）',
  `ar_se_id` int(11) DEFAULT NULL COMMENT '结算负责人id',
  `ar_se_name` varchar(30) DEFAULT NULL COMMENT '结算负责人',
  `ar_cu_id` int(11) DEFAULT NULL COMMENT '项目负责人id',
  `ar_cu_name` varchar(30) DEFAULT NULL COMMENT '项目负责人',
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='大区表';

-- ----------------------------
-- Table structure for area_salesemployee_relation
-- ----------------------------
DROP TABLE IF EXISTS `area_salesemployee_relation`;
CREATE TABLE `area_salesemployee_relation` (
  `asr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ar_id` int(11) NOT NULL COMMENT '销售大区ID',
  `ar_name` varchar(30) NOT NULL COMMENT '大区名称',
  `em_id` int(11) NOT NULL COMMENT '销售员工ID',
  `em_name` varchar(30) NOT NULL COMMENT '员工名称',
  `delete_flag` int(4) NOT NULL DEFAULT '0' COMMENT '是否删除（0未删除，1已删除）',
  PRIMARY KEY (`asr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='大区销售人员关系表';

-- ----------------------------
-- Table structure for arrival_order
-- ----------------------------
DROP TABLE IF EXISTS `arrival_order`;
CREATE TABLE `arrival_order` (
  `ao_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '到货单id',
  `ao_no` varchar(32) DEFAULT NULL COMMENT '到货单号',
  `pu_no` varchar(32) DEFAULT NULL COMMENT '采购单号',
  `io_id` int(11) DEFAULT NULL COMMENT '入库id',
  `io_no` varchar(32) DEFAULT NULL COMMENT '入库单号',
  `ao_status` int(11) DEFAULT NULL COMMENT '到货单状态  0:新建 1:已入库 2:已取消',
  `create_time` int(11) DEFAULT NULL COMMENT '创建日期',
  `update_time` int(1) DEFAULT NULL COMMENT '修改日期',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `ur_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `ao_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '到货时间',
  PRIMARY KEY (`ao_id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8mb4 COMMENT='到货单表';

-- ----------------------------
-- Table structure for arrival_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `arrival_order_detail`;
CREATE TABLE `arrival_order_detail` (
  `aod_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '到货单明细id',
  `ao_id` int(11) DEFAULT NULL COMMENT '到货单id',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `sto_no` varchar(32) DEFAULT NULL COMMENT '存货编号',
  `sto_name` varchar(32) DEFAULT NULL COMMENT '存货名称',
  `arrival_num` int(11) DEFAULT NULL COMMENT '到货数量',
  `aod_visible` int(11) DEFAULT NULL COMMENT '货物状态 1;正常 0;删除',
  `aod_create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `aod_update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `pd_id` int(11) NOT NULL DEFAULT '0' COMMENT '采购明细记录id',
  `aod_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '到货时间',
  PRIMARY KEY (`aod_id`)
) ENGINE=InnoDB AUTO_INCREMENT=444 DEFAULT CHARSET=utf8mb4 COMMENT='到货单明细表';

-- ----------------------------
-- Table structure for asset_allocation
-- ----------------------------
DROP TABLE IF EXISTS `asset_allocation`;
CREATE TABLE `asset_allocation` (
  `aa_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '创建人ID',
  `aa_no` varchar(30) NOT NULL COMMENT '调拨单号',
  `out_sw_id` int(10) unsigned NOT NULL COMMENT '移出仓库',
  `in_sw_id` int(10) unsigned NOT NULL COMMENT '移入仓库',
  `in_uid` int(10) unsigned NOT NULL COMMENT '移入仓管员ID',
  `in_name` char(32) NOT NULL DEFAULT '' COMMENT '移入仓管员名称',
  `create_uid` int(10) unsigned NOT NULL COMMENT '创建人ID',
  `create_name` char(32) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `aa_status` int(1) NOT NULL DEFAULT '1' COMMENT '调拨状态:(1-新建, 2-已移入, 3-已取消)',
  `aa_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '移库时间',
  `aa_remarks` varchar(255) NOT NULL COMMENT '备注',
  `aa_createtime` int(10) unsigned NOT NULL COMMENT '创建时间',
  `aa_lastuptime` int(10) NOT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`aa_id`),
  KEY `out_sw_id` (`out_sw_id`),
  KEY `in_sw_id` (`in_sw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='资产调拨单';

-- ----------------------------
-- Table structure for asset_allocation_detail
-- ----------------------------
DROP TABLE IF EXISTS `asset_allocation_detail`;
CREATE TABLE `asset_allocation_detail` (
  `aad_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '调拨单详情自增ID',
  `aa_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '调拨单自增ID',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `sto_no` varchar(255) NOT NULL COMMENT '存货编号',
  `sto_name` varchar(255) NOT NULL COMMENT '存货名称',
  `sto_batch` varchar(255) NOT NULL COMMENT '批号',
  `sto_counting` char(32) NOT NULL COMMENT '计数说明',
  `aad_detail` longtext NOT NULL COMMENT '明细编号',
  `aad_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `sto_has_identifier` smallint(2) NOT NULL COMMENT '有无编号',
  `out_location_id` int(11) NOT NULL DEFAULT '0' COMMENT '移出货位',
  `in_location_id` int(11) NOT NULL DEFAULT '0' COMMENT '移入货位',
  `aad_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态: (1-正常, 0-删除)',
  `aad_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `aad_lastuptime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`aad_id`),
  KEY `idx_sto_id` (`sto_id`),
  KEY `idx_aa_id` (`aa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='资产调拨单详情表';

-- ----------------------------
-- Table structure for asset_change_detail_log
-- ----------------------------
DROP TABLE IF EXISTS `asset_change_detail_log`;
CREATE TABLE `asset_change_detail_log` (
  `acdl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '资产库存变动详情记录表ID',
  `acl_id` int(11) unsigned NOT NULL COMMENT '库存变动记录表ID',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `gd_series_number` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '存货明细编号',
  `acdl_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`acdl_id`),
  KEY `idx_acl_id` (`acl_id`),
  KEY `idx_sto_id_gd_series_number` (`sto_id`,`gd_series_number`)
) ENGINE=InnoDB AUTO_INCREMENT=733 DEFAULT CHARSET=utf8mb4 COMMENT='资产库存变动详情记录表';

-- ----------------------------
-- Table structure for asset_change_log
-- ----------------------------
DROP TABLE IF EXISTS `asset_change_log`;
CREATE TABLE `asset_change_log` (
  `acl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '资产库存变动记录表ID',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `sto_has_identifier` tinyint(2) unsigned DEFAULT '0' COMMENT '有无编号:( 0-否，1-有)',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库货位id',
  `acl_change_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '变动类型: (1-资产领用, 2-领用作废, 3-调拨单出库，4-调拨单入库)',
  `acl_change_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '变动数量',
  `in_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前可用库存数量',
  `in_locknum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前使用中库存锁定数量',
  `locking` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前后台过期锁定数量',
  `acl_source_id` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '来源单号，对应变动类型',
  `acl_remark` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `acl_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`acl_id`),
  KEY `idx_sto_id` (`sto_id`),
  KEY `idx_acl_source_id_sto_has_identifier` (`acl_source_id`,`sto_has_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COMMENT='资产库存变动记录表';

-- ----------------------------
-- Table structure for asset_use
-- ----------------------------
DROP TABLE IF EXISTS `asset_use`;
CREATE TABLE `asset_use` (
  `au_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '资产领用记录自增ID\r\n',
  `au_no` char(32) CHARACTER SET utf8 DEFAULT '' COMMENT '资产领用编号，系统按规则生成：LY+8位序号数字',
  `em_id` int(11) unsigned NOT NULL COMMENT '领用人ID',
  `em_name` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '领用人',
  `de_no` varchar(20) NOT NULL DEFAULT '' COMMENT '部门序号',
  `de_name` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '所属部门',
  `create_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `au_place` varchar(100) NOT NULL COMMENT '存放地',
  `au_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '领用类型: (1-常规领用, 2-其它领用)',
  `au_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '领用状态: (1-正常, 2-作废)',
  `au_remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '领用说明',
  `au_use_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '领用时间',
  `au_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `au_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `create_uname` varchar(50) DEFAULT '' COMMENT '创建人姓名',
  PRIMARY KEY (`au_id`),
  KEY `idx_au_no` (`au_no`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8mb4 COMMENT='资产领用表';

-- ----------------------------
-- Table structure for asset_use_detail
-- ----------------------------
DROP TABLE IF EXISTS `asset_use_detail`;
CREATE TABLE `asset_use_detail` (
  `aud_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '资产领用详情表ID',
  `au_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '资产领用表ID',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(255) CHARACTER SET ujis DEFAULT '' COMMENT '存货编号',
  `sto_name` char(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '存货名称',
  `stt_name` char(32) CHARACTER SET utf8 DEFAULT '' COMMENT '存货类型名称',
  `sto_volume` char(128) CHARACTER SET utf8 DEFAULT '' COMMENT '规格/容量',
  `sto_counting` char(32) CHARACTER SET utf8 DEFAULT '' COMMENT '计数单位说明',
  `sto_has_identifier` tinyint(4) unsigned DEFAULT '0' COMMENT '有无编号:(0否, 1有)',
  `aud_quantity` int(11) DEFAULT NULL COMMENT '领用数量',
  `aud_detail` longtext CHARACTER SET utf8 COMMENT '资产详情编号, 多个用逗号分隔\r\n',
  `aud_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `aud_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `sw_id` int(11) NOT NULL DEFAULT '0' COMMENT '货位id',
  `aud_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态：-1，取消；1，待确认；2，已领用；3,部分归还；4，已归还',
  `aud_is_need_return` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否需要归还:1,是；0，否',
  `sw_no` varchar(50) NOT NULL DEFAULT '' COMMENT '货位编号',
  `sw_name` varchar(50) NOT NULL DEFAULT '' COMMENT '货位名称',
  `aud_return_time` int(11) NOT NULL DEFAULT '0' COMMENT '归还时间',
  `aud_gd_series_number` varchar(50) NOT NULL DEFAULT '' COMMENT '资产序号',
  `aud_gd_specs` varchar(50) NOT NULL DEFAULT '' COMMENT '型号',
  `aud_gd_model` varchar(50) NOT NULL DEFAULT '' COMMENT '资产明细的规格',
  `aud_return_num` int(11) NOT NULL DEFAULT '0' COMMENT '已归还数量',
  `stt_id` int(11) NOT NULL DEFAULT '0' COMMENT '资产id',
  PRIMARY KEY (`aud_id`)
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=utf8mb4 COMMENT='资产领用详情表';

-- ----------------------------
-- Table structure for att_backup
-- ----------------------------
DROP TABLE IF EXISTS `att_backup`;
CREATE TABLE `att_backup` (
  `at_id` int(11) NOT NULL COMMENT '备份文件',
  `ab_filepath` varchar(255) DEFAULT NULL COMMENT '备份文件路径',
  `ab_filename` varchar(255) DEFAULT NULL COMMENT '原文件名称',
  `ab_visible` int(1) DEFAULT '0' COMMENT '状态 1正常  0 删除',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `at_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件序号',
  `at_type` char(8) DEFAULT '' COMMENT '附件类型，如：001客户、002供应商、003订单、004采购单、005出库单 006-项目',
  `at_subtype` char(16) DEFAULT '' COMMENT '附件子类型，如：001001客户证件、001002客户文件、002001供应商证件',
  `at_identifier` int(11) unsigned DEFAULT '0' COMMENT '附件标识，如：客户序号、订单序号等',
  `at_create_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `at_create_username` char(32) DEFAULT '' COMMENT '上传用户',
  `at_filesize` int(11) unsigned DEFAULT '0' COMMENT '附件文件大小，单位：KB',
  `at_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '附件状态 1正常，0删除',
  `at_filename` char(255) DEFAULT '' COMMENT '附件文件名',
  `at_filepath` varchar(1024) DEFAULT NULL COMMENT '附件文件路径',
  `at_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `at_mechanism` tinyint(2) DEFAULT '0' COMMENT '校准机构 0无 1.生生内校 2.厂家校准 3.第三方校准-检测机构 4.第三方校准-计量院',
  `tag` tinyint(1) NOT NULL DEFAULT '0',
  `at_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '签章状态 0未签章 1已签章',
  `at_source` tinyint(1) unsigned DEFAULT '0' COMMENT '附件来源 0--oms 1--oms客户系统 2--微信服务号',
  `at_check_status` tinyint(1) DEFAULT '0' COMMENT '审核所处阶段(0=>待校准人审核；1=>待审核人审核；2=>待批准人审核；3=>已批准)',
  `at_audit` tinyint(1) DEFAULT '1' COMMENT '附件审核  0：待审核 1：审核通过 2：审核不通过',
  `at_temp_type` tinyint(1) DEFAULT '0' COMMENT '温度计类型 1.鼎为   2.腾森   3.精创或者其他',
  `gd_series_number` varchar(32) DEFAULT '' COMMENT '温度计编号',
  `qc_files_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`at_id`),
  KEY `at_identifier` (`at_identifier`),
  KEY `tag` (`tag`),
  KEY `at_mechanism` (`at_mechanism`),
  KEY `at_type` (`at_type`),
  KEY `at_subtype` (`at_subtype`),
  KEY `at_createtime` (`at_createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=18809355 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Table structure for attachment_info
-- ----------------------------
DROP TABLE IF EXISTS `attachment_info`;
CREATE TABLE `attachment_info` (
  `ai_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件详情id',
  `ai_identifier` int(11) NOT NULL DEFAULT '0' COMMENT '对应主键id',
  `at_id` int(11) NOT NULL DEFAULT '0' COMMENT '附件id',
  `ai_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0失效 1有效',
  `ai_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型；1未签章对账单 2签章对账单',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`ai_id`),
  KEY `ai_identifier` (`ai_identifier`),
  KEY `at_id` (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COMMENT='附件详情表';

-- ----------------------------
-- Table structure for auto_worksheet_customer
-- ----------------------------
DROP TABLE IF EXISTS `auto_worksheet_customer`;
CREATE TABLE `auto_worksheet_customer` (
  `ac_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动工作单序号',
  `cu_id` int(11) NOT NULL COMMENT '客户id',
  `ac_create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `ac_status` tinyint(1) DEFAULT '0' COMMENT '0 停用, 1 启用',
  PRIMARY KEY (`ac_id`),
  UNIQUE KEY `idx_unique_key` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COMMENT='自动工作单客户表';

-- ----------------------------
-- Table structure for auto_worksheet_recommend
-- ----------------------------
DROP TABLE IF EXISTS `auto_worksheet_recommend`;
CREATE TABLE `auto_worksheet_recommend` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `arc_id` int(11) DEFAULT '0' COMMENT '客户id',
  `re_start_region_id` int(11) NOT NULL COMMENT '取件城市',
  `re_start_region_name` varchar(30) DEFAULT '' COMMENT '取件城市名',
  `re_stop_region_id` int(11) NOT NULL COMMENT '派件城市',
  `re_stop_region_name` varchar(30) DEFAULT '' COMMENT '派件城市名',
  `re_last_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `re_visible` tinyint(1) DEFAULT '1' COMMENT '0 删除, 1 正常',
  `pc_id` int(11) DEFAULT '0' COMMENT '项目客户序号',
  PRIMARY KEY (`re_id`),
  KEY `idx_arc_id` (`arc_id`),
  KEY `idx_start_id` (`re_start_region_id`),
  KEY `idx_stop_id` (`re_stop_region_id`),
  KEY `idx_pc_id` (`pc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='自动工作单推荐路由表';

-- ----------------------------
-- Table structure for auto_worksheet_route
-- ----------------------------
DROP TABLE IF EXISTS `auto_worksheet_route`;
CREATE TABLE `auto_worksheet_route` (
  `ar_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `ro_id` int(11) NOT NULL COMMENT '路由id',
  `ar_last_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `ar_visible` tinyint(1) DEFAULT '1' COMMENT '0 删除, 1 正常',
  `re_id` int(11) NOT NULL DEFAULT '0' COMMENT '推荐路由序号',
  PRIMARY KEY (`ar_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='自动工作单路由表';

-- ----------------------------
-- Table structure for auto_worksheet_route_customer
-- ----------------------------
DROP TABLE IF EXISTS `auto_worksheet_route_customer`;
CREATE TABLE `auto_worksheet_route_customer` (
  `arc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `cu_id` int(11) NOT NULL COMMENT '客户id',
  `arc_last_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `arc_visible` tinyint(1) DEFAULT '1' COMMENT '0 删除, 1 正常',
  PRIMARY KEY (`arc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='自动工作单路由客户表';

-- ----------------------------
-- Table structure for auto_worksheet_route_project
-- ----------------------------
DROP TABLE IF EXISTS `auto_worksheet_route_project`;
CREATE TABLE `auto_worksheet_route_project` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `pc_id` int(11) NOT NULL COMMENT '项目客户序号',
  `cp_id` int(11) NOT NULL COMMENT '项目序号',
  `cp_no_name` char(120) DEFAULT '' COMMENT '项目编号-名称',
  `pro_last_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `pro_visible` tinyint(1) DEFAULT '1' COMMENT '0 删除, 1 正常',
  PRIMARY KEY (`pro_id`),
  KEY `idx_pcp_id` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='自动工作单路由项目表';

-- ----------------------------
-- Table structure for auto_worksheet_route_project_customer
-- ----------------------------
DROP TABLE IF EXISTS `auto_worksheet_route_project_customer`;
CREATE TABLE `auto_worksheet_route_project_customer` (
  `pc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `cu_id` int(11) NOT NULL COMMENT '客户序号',
  `pc_last_time` int(11) DEFAULT NULL COMMENT '更新时间',
  `pc_visible` tinyint(1) DEFAULT '1' COMMENT '0 删除, 1 正常',
  PRIMARY KEY (`pc_id`),
  KEY `idx_pcu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='自动工作单路由项目-客户表';

-- ----------------------------
-- Table structure for auto_worksheet_setting
-- ----------------------------
DROP TABLE IF EXISTS `auto_worksheet_setting`;
CREATE TABLE `auto_worksheet_setting` (
  `as_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '温区配置序号',
  `at_id` int(11) NOT NULL COMMENT '客户温区序号',
  `as_status` tinyint(2) NOT NULL COMMENT '触发时运输单状态',
  `as_type` tinyint(2) NOT NULL COMMENT '自动创建的工作单操作类型',
  `as_config` varchar(1000) NOT NULL COMMENT '自动创建的工作单配置',
  `at_visible` tinyint(1) DEFAULT '1' COMMENT '0 无效, 1 有效',
  PRIMARY KEY (`as_id`),
  KEY `at_id` (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=619 DEFAULT CHARSET=utf8 COMMENT='自动工作单-客户温区配置表';

-- ----------------------------
-- Table structure for auto_worksheet_temperature
-- ----------------------------
DROP TABLE IF EXISTS `auto_worksheet_temperature`;
CREATE TABLE `auto_worksheet_temperature` (
  `at_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '温区序号',
  `ac_id` int(11) NOT NULL COMMENT '自动工作单序号',
  `at_temperature` tinyint(2) NOT NULL COMMENT '温区',
  `at_visible` tinyint(1) DEFAULT '1' COMMENT '0 无效, 1 有效',
  `at_thermometer` varchar(30) DEFAULT '' COMMENT '温度计',
  PRIMARY KEY (`at_id`),
  UNIQUE KEY `idx_temp_key` (`ac_id`,`at_temperature`),
  KEY `ac_id` (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=346 DEFAULT CHARSET=utf8 COMMENT='自动工作单-客户温区表';

-- ----------------------------
-- Table structure for balance_detail
-- ----------------------------
DROP TABLE IF EXISTS `balance_detail`;
CREATE TABLE `balance_detail` (
  `bd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '实开id',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户id',
  `bd_inout` tinyint(1) DEFAULT '0' COMMENT '收支状态 0支出 1收入',
  `bd_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1收款 2付款 3发票',
  `bd_rrbrid` int(11) unsigned DEFAULT '0' COMMENT '实开发票 或收款记录id',
  `bd_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '本次金额',
  `bd_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '清账余额',
  `bd_date` int(10) NOT NULL DEFAULT '0' COMMENT '清账日期',
  `bd_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `bd_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `bd_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `bd_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `bd_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`bd_id`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=58270 DEFAULT CHARSET=utf8 COMMENT='客户余额细节表';

-- ----------------------------
-- Table structure for bank_record
-- ----------------------------
DROP TABLE IF EXISTS `bank_record`;
CREATE TABLE `bank_record` (
  `br_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '收款记录序号',
  `br_no` char(32) NOT NULL DEFAULT '0' COMMENT '收款编号',
  `br_ourbank` tinyint(1) NOT NULL COMMENT '本公司银行',
  `br_paybank` char(255) NOT NULL DEFAULT '' COMMENT '支付银行',
  `br_payremark` varchar(512) DEFAULT NULL COMMENT '支付备注',
  `br_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收款日期',
  `br_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收款总额',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `bi_id` int(11) DEFAULT NULL COMMENT '发票抬头ID',
  `br_remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `balance_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未清账 1已清账',
  `br_assign_uid` int(11) DEFAULT NULL COMMENT '指派id',
  `br_assign_username` char(32) DEFAULT NULL COMMENT '指派用户名',
  `br_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `br_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `br_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `br_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `br_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `br_status` tinyint(2) DEFAULT '1' COMMENT '收款单审核状态 1 待审核 2 已审核',
  `br_modes` tinyint(1) NOT NULL DEFAULT '0' COMMENT '销账方式 0手动销账 1 自动销账',
  `br_refund_status` tinyint(1) unsigned zerofill NOT NULL DEFAULT '0' COMMENT '退款状态 0无退款 1有退款',
  `br_carry_down_status` tinyint(1) DEFAULT NULL COMMENT '结转状态 1未结转 2 已结转',
  `cdr_id` int(11) DEFAULT NULL COMMENT '结转ID',
  `to_id` int(11) unsigned DEFAULT NULL COMMENT '运输单序号',
  `open_id` varchar(255) DEFAULT NULL COMMENT '微信账户open_id账号',
  `mobile_phone` int(11) DEFAULT NULL COMMENT '手机号',
  `transaction_id` char(64) DEFAULT NULL COMMENT '订单交易号',
  `adjust_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '调整状态 0未调整 1已调整',
  `adjust_br_id` int(11) DEFAULT NULL COMMENT '调整单父收款记录id',
  PRIMARY KEY (`br_id`),
  KEY `cu_id` (`cu_id`),
  KEY `br_no` (`br_no`),
  KEY `cdr_id` (`cdr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121254 DEFAULT CHARSET=utf8 COMMENT='收款记录表';

-- ----------------------------
-- Table structure for base_city_offer
-- ----------------------------
DROP TABLE IF EXISTS `base_city_offer`;
CREATE TABLE `base_city_offer` (
  `bco_id` int(11) NOT NULL AUTO_INCREMENT,
  `sto_id` int(11) NOT NULL DEFAULT '0' COMMENT '包装箱packing sto_id',
  `sto_name` varchar(255) NOT NULL COMMENT '包装箱名称',
  `bts_id` int(11) NOT NULL DEFAULT '0' COMMENT '温区方案 bms_tempzone_scheme bts_id',
  `bts_name` varchar(255) NOT NULL COMMENT '温区方案名称 ',
  `bco_customer_area` tinyint(3) NOT NULL DEFAULT '1' COMMENT '客户领域 参考globaltype  ',
  `bco_start_city_category` tinyint(3) NOT NULL COMMENT '出发城市等级 参考globaltype',
  `bco_stop_city_category` tinyint(3) NOT NULL COMMENT '目的城市等级 参考globaltype',
  `bco_timelimit` tinyint(3) NOT NULL COMMENT '时效 参考globaltype',
  `bco_offer` decimal(10,2) NOT NULL COMMENT '报价',
  `bco_units` varchar(20) NOT NULL COMMENT '单位',
  `bco_remark` varchar(1000) NOT NULL COMMENT '备注',
  `bco_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态1正常2删除',
  `bco_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `bco_create_username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '创建人姓名',
  `bco_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bco_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `bco_lastupd_username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '更新人姓名',
  `bco_lastupdtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`bco_id`),
  KEY `sto_id` (`sto_id`),
  KEY `bts_id` (`bts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1512 DEFAULT CHARSET=utf8mb4 COMMENT='城市分类基础报价';

-- ----------------------------
-- Table structure for base_order_settlement
-- ----------------------------
DROP TABLE IF EXISTS `base_order_settlement`;
CREATE TABLE `base_order_settlement` (
  `bos_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `os_id` int(11) NOT NULL COMMENT '结算序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户序号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `os_insurate` decimal(10,3) DEFAULT '0.000' COMMENT '保价费率',
  `os_firstfee` decimal(10,2) DEFAULT '0.00' COMMENT '首重费',
  `os_plusfee` decimal(10,2) DEFAULT '0.00' COMMENT '续重费',
  `os_packfee` decimal(10,2) DEFAULT '0.00' COMMENT '包装费',
  `os_icefee` decimal(10,2) DEFAULT '0.00' COMMENT '制冷费',
  `os_insufee` decimal(10,2) DEFAULT '0.00' COMMENT '保险费',
  `os_changefee` decimal(10,2) DEFAULT '0.00' COMMENT '中转费',
  `os_tempfee` decimal(10,2) DEFAULT '0.00' COMMENT '温度计费用',
  `os_otherfee` decimal(10,2) DEFAULT '0.00' COMMENT '其他费',
  `os_totalfee` decimal(12,4) DEFAULT '0.0000' COMMENT '合计费用',
  `os_cpid` int(11) DEFAULT '0' COMMENT '项目ID',
  `rb_id` int(11) DEFAULT NULL,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `os_remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `os_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `os_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `os_tax` decimal(10,2) DEFAULT '0.00' COMMENT '税金',
  `os_income` decimal(12,4) DEFAULT '0.0000' COMMENT '不含税金额',
  `os_tot` decimal(10,2) DEFAULT '0.00' COMMENT '报价总额',
  `os_boxs` varchar(64) DEFAULT NULL COMMENT '订单结算箱型',
  `os_weight` double(6,2) DEFAULT '0.00' COMMENT '订单结算重量',
  `os_modes` tinyint(1) NOT NULL DEFAULT '0' COMMENT '结算方式 0 手动结算 1自动结算',
  `os_carry_down_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '结转状态 1未结转 2 已结转',
  `os_taxrate` decimal(10,2) DEFAULT NULL COMMENT '结算税率',
  `os_month` varchar(255) DEFAULT NULL COMMENT '结算单月份',
  `cdr_id` int(10) DEFAULT NULL COMMENT '结转id',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  PRIMARY KEY (`bos_id`),
  KEY `to_id` (`to_id`),
  KEY `cu_id` (`cu_id`),
  KEY `cdr_id` (`cdr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=947 DEFAULT CHARSET=utf8 COMMENT='物流结算费用基础表';

-- ----------------------------
-- Table structure for base_other_settlement
-- ----------------------------
DROP TABLE IF EXISTS `base_other_settlement`;
CREATE TABLE `base_other_settlement` (
  `bots_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ots_id` int(11) NOT NULL COMMENT '其他费用id',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '仓储序号id',
  `ots_name` char(255) DEFAULT '' COMMENT '其他费用名称',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户id',
  `cu_name` char(50) NOT NULL DEFAULT '' COMMENT '客户名称',
  `ots_cmonth` char(20) NOT NULL DEFAULT '0' COMMENT '结算月',
  `ots_feetype` int(1) NOT NULL DEFAULT '5' COMMENT '1证件代办费 2仓储管理费 3设备耗材费 4劳务支出费 5其它',
  `ots_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `ots_totalfee` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '费用总额',
  `ms_id` int(11) unsigned DEFAULT '0' COMMENT '对账单序号',
  `ots_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ots_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `ots_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `ots_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `ots_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ots_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `ots_tax` decimal(10,2) DEFAULT '0.00' COMMENT '税金',
  `ots_income` decimal(12,4) DEFAULT '0.0000' COMMENT '不含税金额',
  `ots_tot` decimal(10,2) DEFAULT '0.00' COMMENT '报价总额',
  `to_no` varchar(32) DEFAULT NULL COMMENT '运单编号',
  `ots_amount` decimal(12,2) DEFAULT '0.00' COMMENT '运单结算金额',
  `ots_start_time` int(10) DEFAULT NULL COMMENT '起始时间',
  `ots_end_time` int(10) DEFAULT NULL COMMENT '截至时间',
  `ots_carry_down_status` tinyint(1) DEFAULT '1' COMMENT '结转状态 1 未结转 2 已结转',
  `cdr_id` int(10) DEFAULT NULL COMMENT '结转id',
  `ots_taxrate` varchar(255) DEFAULT NULL COMMENT 'o',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  PRIMARY KEY (`bots_id`),
  KEY `cu_id` (`cu_id`),
  KEY `cdr_id` (`cdr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15728 DEFAULT CHARSET=utf8 COMMENT='其它结算费用基础表';

-- ----------------------------
-- Table structure for base_sample_settlement
-- ----------------------------
DROP TABLE IF EXISTS `base_sample_settlement`;
CREATE TABLE `base_sample_settlement` (
  `bss_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ss_id` int(11) NOT NULL COMMENT '结算序号',
  `ss_name` varchar(88) DEFAULT NULL COMMENT '结算名称',
  `ss_cmonth` int(6) DEFAULT NULL COMMENT '结算月',
  `io_id` int(11) DEFAULT NULL COMMENT '出入库id',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `create_uid` int(10) unsigned DEFAULT NULL COMMENT '创建人ID',
  `create_username` varchar(128) DEFAULT NULL COMMENT '创建人',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户序号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `ss_cpid` int(11) DEFAULT '0' COMMENT '项目ID',
  `ms_id` int(11) DEFAULT '0' COMMENT '对账单ID',
  `rb_id` int(11) DEFAULT '0' COMMENT '实开发票ID',
  `ss_quantity` smallint(6) DEFAULT NULL COMMENT '结算数量',
  `ss_type` smallint(1) DEFAULT NULL COMMENT '结算类型 0入库结算1出库结算',
  `ss_cycle` smallint(5) DEFAULT NULL COMMENT '结算周期 按月单位',
  `ss_price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `ss_boxnums` int(5) unsigned DEFAULT '0' COMMENT '盒数',
  `ss_totalfee` decimal(10,2) DEFAULT '0.00' COMMENT '合计费用',
  `ss_remark` varchar(1024) DEFAULT '' COMMENT '备注',
  `ss_paymenttype` int(1) unsigned DEFAULT '1' COMMENT '样本结算支付类型 1-预付费 2-后付费',
  `ss_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ss_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `ss_tax` decimal(10,2) DEFAULT '0.00' COMMENT '税金',
  `ss_taxrate` int(2) DEFAULT '0' COMMENT '税率',
  `ss_income` decimal(10,2) DEFAULT '0.00' COMMENT '不含税收入',
  `ss_tot` decimal(10,2) DEFAULT '0.00' COMMENT '报价汇总，用于获取未税金额',
  `ss_expiretime` int(10) DEFAULT NULL COMMENT '结算到期时间',
  `ss_pid` int(11) DEFAULT NULL COMMENT '到期结算ID',
  `ss_status` int(1) DEFAULT '1' COMMENT '状态:1未到期2到期已生成新结算单',
  `ss_visible` int(1) DEFAULT '1' COMMENT '状态 1正常，2删除',
  `ss_starttime` int(10) unsigned DEFAULT NULL COMMENT '结算周期开始时间',
  `ss_endtime` int(10) unsigned DEFAULT NULL COMMENT '结算周期结束时间',
  `ss_iotime` int(10) unsigned DEFAULT NULL COMMENT '出入库时间',
  `ss_carry_down_status` tinyint(1) DEFAULT '1' COMMENT '结转状态 1 未结转 2 已结转',
  `cdr_id` int(10) DEFAULT NULL COMMENT '结转id',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  PRIMARY KEY (`bss_id`),
  KEY `cu_id` (`cu_id`),
  KEY `cdr_id` (`cdr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='样本结算费用基础表';

-- ----------------------------
-- Table structure for basis_offer
-- ----------------------------
DROP TABLE IF EXISTS `basis_offer`;
CREATE TABLE `basis_offer` (
  `bo_id` int(11) NOT NULL AUTO_INCREMENT,
  `ps_id` int(11) NOT NULL COMMENT '包装箱方案id',
  `bo_customer_area` smallint(2) DEFAULT NULL COMMENT '客户领域 参考globaltype  ',
  `bo_city_category` smallint(2) DEFAULT NULL COMMENT '价格等级 参考globaltype  ',
  `bo_firstbox_offer` decimal(10,2) DEFAULT NULL COMMENT '首箱报价',
  `bo_extendbox_offer` decimal(10,2) DEFAULT NULL COMMENT '续箱报价',
  `bo_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `bo_status` tinyint(2) DEFAULT '1' COMMENT '1 正常 2 删除',
  `bo_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `bo_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`bo_id`),
  KEY `ps_id` (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1219 DEFAULT CHARSET=utf8 COMMENT='基础报价';

-- ----------------------------
-- Table structure for basis_offer_temp_history
-- ----------------------------
DROP TABLE IF EXISTS `basis_offer_temp_history`;
CREATE TABLE `basis_offer_temp_history` (
  `both_id` int(11) NOT NULL AUTO_INCREMENT,
  `both_customer_area` smallint(2) DEFAULT NULL COMMENT '客户领域 参考globaltype  ',
  `both_city_category` smallint(2) DEFAULT NULL COMMENT '价格等级 参考globaltype  ',
  `both_old_ps_id` int(11) DEFAULT NULL COMMENT '原 包装箱方案id',
  `both_old_firstbox_offer` decimal(10,2) DEFAULT NULL COMMENT '原 首箱报价',
  `both_old_extendbox_offer` decimal(10,2) DEFAULT NULL COMMENT '原 续箱报价',
  `both_new_ps_id` int(11) DEFAULT NULL COMMENT '新 包装箱方案id',
  `both_new_firstbox_offer` decimal(10,2) DEFAULT NULL COMMENT '新 首箱报价',
  `both_new_extendbox_offer` decimal(10,2) DEFAULT NULL COMMENT '新 续箱报价',
  `both_price_status` tinyint(2) DEFAULT '1' COMMENT '前后价格 1相同 2不同',
  `both_status` tinyint(2) DEFAULT '1' COMMENT '修改状态 1未修改 2已修改',
  `both_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `both_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`both_id`),
  KEY `ps_id` (`both_old_ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1969 DEFAULT CHARSET=utf8 COMMENT='基础报价历史数据处理表';

-- ----------------------------
-- Table structure for beforehand_realbill
-- ----------------------------
DROP TABLE IF EXISTS `beforehand_realbill`;
CREATE TABLE `beforehand_realbill` (
  `br_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '预开票id',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `cu_name` varchar(255) NOT NULL DEFAULT '' COMMENT '委托客户名称',
  `bi_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '开票信息id',
  `bi_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开票客户名称',
  `br_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预开票余额',
  `br_rush_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已冲预开票金额',
  `br_reality_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已销账金额',
  `br_returned_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '待回款金额',
  `rb_billtype` int(11) NOT NULL DEFAULT '0' COMMENT '0 增值税普通发票 1增增值税专用发票 2 增值税电子普通发票',
  `rb_rate` decimal(10,4) NOT NULL DEFAULT '0.0000' COMMENT '税率',
  `br_create_uid` int(10) NOT NULL DEFAULT '0' COMMENT '创建人',
  `br_lastupd_uid` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `br_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `br_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`br_id`),
  KEY `idx_bi_id` (`bi_id`),
  KEY `idx_cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='预开票管理';

-- ----------------------------
-- Table structure for beforehand_realbill_detil
-- ----------------------------
DROP TABLE IF EXISTS `beforehand_realbill_detil`;
CREATE TABLE `beforehand_realbill_detil` (
  `brd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '预开票明细id',
  `br_id` int(11) NOT NULL DEFAULT '0' COMMENT '预开票id',
  `brd_type` int(11) NOT NULL DEFAULT '1' COMMENT '1预开票 2冲预开票',
  `rb_id` int(11) NOT NULL DEFAULT '0' COMMENT '发票id 关联realbill表',
  `in_id` int(11) NOT NULL DEFAULT '0' COMMENT '实开发票id 关联invoice表',
  `brd_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '预开票状态 0添加1开票2冲抵3销账4返销帐5删除',
  `brd_amount_type` int(11) NOT NULL DEFAULT '1' COMMENT '1预开票增加 2预开票减少 3销账增加4销账减少',
  `brd_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '开票金额',
  `br_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预开票余额',
  `br_reality_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已销账余额',
  `br_remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `br_create_uid` int(10) NOT NULL DEFAULT '0' COMMENT '创建人',
  `br_lastupd_uid` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `br_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `br_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`brd_id`),
  KEY `idx_br_id` (`br_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8 COMMENT='预开票管理明细';

-- ----------------------------
-- Table structure for billinfo
-- ----------------------------
DROP TABLE IF EXISTS `billinfo`;
CREATE TABLE `billinfo` (
  `bi_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '开票序号',
  `bi_type` tinyint(4) unsigned DEFAULT '0' COMMENT '开票类型，1外协,2一般供应商,3承运商,4客户,5员工',
  `bi_identifier` int(11) unsigned DEFAULT '0' COMMENT '开票所属标识，如：客户序号、供应商序号等',
  `bi_name` char(128) DEFAULT '' COMMENT '开票抬头',
  `bi_bank_account` char(32) DEFAULT '' COMMENT '银行账户',
  `bi_bank_name` char(32) DEFAULT '' COMMENT '开户行',
  `bi_billtype` tinyint(4) unsigned DEFAULT '0' COMMENT '发票类型，0普通发票 1增值发票',
  `bi_tax_no` char(32) DEFAULT '' COMMENT '税务号',
  `co_id` int(11) unsigned DEFAULT '0' COMMENT '收票联系人序号',
  `co_name` char(32) DEFAULT '' COMMENT '收票联系人',
  `bi_address` char(128) DEFAULT '' COMMENT '收票地址',
  `bi_mobile_phone` char(32) DEFAULT '' COMMENT '手机号码',
  `bi_cycle` tinyint(4) unsigned DEFAULT '0' COMMENT '结算周期， 0次结  1月结',
  `bi_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `bi_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `bi_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `bi_add` char(255) DEFAULT NULL COMMENT '开票信息 地址  发票地址',
  `bi_phone` char(32) DEFAULT NULL COMMENT '开票信息 电话 发票号码',
  `bi_title` varchar(255) NOT NULL COMMENT '实际开票名称',
  `parent_bi_id` int(11) DEFAULT NULL COMMENT '默认信息父ID',
  `bi_cus_type` tinyint(3) DEFAULT '1' COMMENT '抬头类型  1企业 2个人或事业单位',
  `old_bi_name` varchar(150) DEFAULT '' COMMENT '开票抬头（旧）',
  `check_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '验证状态 0未验证 1验证通过 2验证未通过 3已处理',
  PRIMARY KEY (`bi_id`),
  KEY `bi_type_identifier` (`bi_type`,`bi_identifier`),
  KEY `co_id` (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102699 DEFAULT CHARSET=utf8 COMMENT='开票信息表';

-- ----------------------------
-- Table structure for billinfo_address
-- ----------------------------
DROP TABLE IF EXISTS `billinfo_address`;
CREATE TABLE `billinfo_address` (
  `bia_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bi_id` int(10) unsigned DEFAULT NULL COMMENT 'billinfo的主键',
  `c_id` int(10) unsigned DEFAULT NULL COMMENT '联系人id',
  `bia_invoice_contact` varchar(30) DEFAULT NULL COMMENT '收票联系人',
  `bia_invoice_tel` varchar(30) DEFAULT NULL COMMENT '收票人手机号',
  `bia_invoice_address` varchar(100) DEFAULT NULL COMMENT '收票地址',
  `bia_status` tinyint(3) unsigned DEFAULT '0' COMMENT '是否是默认收票地址 1默认 0不默认',
  `bia_visible` tinyint(3) unsigned DEFAULT '1' COMMENT '1正常 0删除',
  `bia_email` varchar(64) DEFAULT '' COMMENT '电子发票邮箱',
  `bia_tel` varchar(30) DEFAULT '' COMMENT '电子发票电话',
  PRIMARY KEY (`bia_id`),
  KEY `bi_id` (`bia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1495 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for billinfo_history
-- ----------------------------
DROP TABLE IF EXISTS `billinfo_history`;
CREATE TABLE `billinfo_history` (
  `bih_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '开票历史主键',
  `bi_id` int(11) NOT NULL DEFAULT '0' COMMENT '开票序号',
  `bi_history` longtext COMMENT 'json格式历史数据',
  `platform` tinyint(4) NOT NULL DEFAULT '0' COMMENT '操作平台 1小程序 2 oms系统',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`bih_id`),
  KEY `bi_id` (`bi_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='开票信息历史表';

-- ----------------------------
-- Table structure for bms_dn_information
-- ----------------------------
DROP TABLE IF EXISTS `bms_dn_information`;
CREATE TABLE `bms_dn_information` (
  `dn_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `dn_temperature` varchar(50) DEFAULT '' COMMENT '温区',
  `dn_no` varchar(255) DEFAULT '' COMMENT 'dn号',
  `dn_yunshu_type` varchar(255) DEFAULT '' COMMENT '运输方式',
  `dn_goods_address` varchar(255) DEFAULT '' COMMENT '提货方式',
  `dn_order_type` varchar(30) DEFAULT '' COMMENT '订单类型',
  `dn_product_line` varchar(100) DEFAULT '' COMMENT 'product_line',
  `dn_stop_province` varchar(50) DEFAULT '' COMMENT '目的地省份',
  `dn_stop_city` varchar(50) DEFAULT '' COMMENT '目的地城市',
  `dn_stop_address` varchar(255) DEFAULT '' COMMENT '目的地地址',
  `dn_stop_co_name` varchar(255) DEFAULT '' COMMENT '联系人',
  `dn_stop_mobile_phone` varchar(255) DEFAULT '' COMMENT '联系方式',
  `dn_customer_type` varchar(255) DEFAULT '' COMMENT '客户类型',
  `dn_order_time` int(11) DEFAULT '0' COMMENT 'dn建表时间',
  `dn_num` int(3) DEFAULT '0' COMMENT '件数',
  PRIMARY KEY (`dn_id`),
  KEY `idx_to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1965 DEFAULT CHARSET=utf8mb4 COMMENT='BMS订单dn信息表';

-- ----------------------------
-- Table structure for bms_fahuofee_approve
-- ----------------------------
DROP TABLE IF EXISTS `bms_fahuofee_approve`;
CREATE TABLE `bms_fahuofee_approve` (
  `bfa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sp_no` char(32) DEFAULT '' COMMENT '审批单号',
  `sp_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审批状态（1-审批中；2-已通过；3-已驳回；4-已撤销；6-通过后撤销；7-已删除；10-已支付）',
  `fee_type` int(5) NOT NULL COMMENT '费用类型：1 发货费 2 提货费',
  `fee_subtype` int(5) DEFAULT NULL COMMENT '费用明细类型：发货费（大巴），发货费（高铁）等',
  `fee_subname` varchar(255) DEFAULT NULL COMMENT '费用明细名称',
  `fahuo_cost` decimal(12,2) DEFAULT '0.00' COMMENT '发货费',
  `fahuo_receipts` varchar(100) DEFAULT '' COMMENT '发货单据号',
  `sumweight` decimal(12,2) DEFAULT '0.00' COMMENT '总重量',
  `ur_uid` char(32) DEFAULT '' COMMENT '审批提交人id',
  `username` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '审批提交人姓名',
  `business_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '业务发生时间',
  `commit_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '审批提交时间',
  `ro_id` char(32) DEFAULT '' COMMENT '路由id',
  `ro_name` varchar(255) DEFAULT '' COMMENT '路由name',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发货城市ID',
  `start_region_name` varchar(255) DEFAULT '' COMMENT '发货城市name',
  `start_ts_name` varchar(255) DEFAULT '' COMMENT '路由发货站点name',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '到货城市ID',
  `stop_region_name` varchar(255) DEFAULT '' COMMENT '到货城市name',
  `sup_id` int(11) DEFAULT NULL COMMENT '供应商id',
  `sup_name` varchar(255) DEFAULT '' COMMENT '供应商name',
  `sup_region_id` int(11) unsigned DEFAULT '0' COMMENT '供应商城市ID',
  `sup_region_name` varchar(255) DEFAULT '' COMMENT '供应商城市',
  `sup_company` varchar(255) DEFAULT '' COMMENT '供应商所属公司',
  `business_month` varchar(12) CHARACTER SET utf8mb4 NOT NULL COMMENT '业务发生月份',
  `sup_taxrate` decimal(10,4) NOT NULL COMMENT '发票税率',
  `sup_invoicetype` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '发票类型: (0-增值税普通发票, 1-增值税专用发票, 2-增值税电子普通发票)',
  `unsplit_data` longtext COMMENT '接口数据打包存储',
  `bfa_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `bfa_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `bfa_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发货费用审批状态（0-正常，1-删除）',
  `os_type` int(5) NOT NULL DEFAULT '1' COMMENT '结算类型（1-现结；2-月结 ; 3-外协发货费）',
  `sp_type` int(5) NOT NULL DEFAULT '1' COMMENT '审批类型',
  `opn_id` int(11) DEFAULT NULL COMMENT '外协操作费id',
  PRIMARY KEY (`bfa_id`),
  KEY `ro_id` (`ro_id`),
  KEY `ur_uid` (`ur_uid`),
  KEY `sup_id` (`sup_id`),
  KEY `business_month` (`business_month`),
  KEY `sp_no` (`sp_no`),
  KEY `opn_id` (`opn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=577 DEFAULT CHARSET=utf8 COMMENT='发货费用审批表';

-- ----------------------------
-- Table structure for bms_fahuofee_attachment
-- ----------------------------
DROP TABLE IF EXISTS `bms_fahuofee_attachment`;
CREATE TABLE `bms_fahuofee_attachment` (
  `bfat_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bfa_id` int(11) NOT NULL COMMENT '审批单id',
  `at_id` int(11) NOT NULL COMMENT '附件id',
  `at_filepath` varchar(400) DEFAULT '' COMMENT '附件地址',
  `at_filename` varchar(400) DEFAULT '' COMMENT '附件名称',
  `bfat_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `bfat_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `at_filepath_url` varchar(400) DEFAULT NULL COMMENT '附件url',
  PRIMARY KEY (`bfat_id`),
  KEY `bfa_id` (`bfa_id`),
  KEY `at_id` (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=670 DEFAULT CHARSET=utf8 COMMENT='发货费用附件表';

-- ----------------------------
-- Table structure for bms_fahuofee_details
-- ----------------------------
DROP TABLE IF EXISTS `bms_fahuofee_details`;
CREATE TABLE `bms_fahuofee_details` (
  `bfd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bfa_id` int(11) NOT NULL COMMENT '审批单id',
  `to_id` int(11) NOT NULL COMMENT '订单号id',
  `to_no` char(32) DEFAULT '' COMMENT '纸质运单编号',
  `split_money` decimal(12,2) DEFAULT '0.00' COMMENT '拆分金额',
  `ol_goods_weight` decimal(12,2) DEFAULT '0.00' COMMENT '拆分重量',
  `bfd_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `bfd_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `bfr_id` int(11) NOT NULL COMMENT '发货路由费用ID',
  PRIMARY KEY (`bfd_id`),
  KEY `bfa_id` (`bfa_id`),
  KEY `to_id` (`to_id`),
  KEY `to_no` (`to_no`),
  KEY `bfr_id` (`bfr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=712 DEFAULT CHARSET=utf8 COMMENT='发货费用明细表';

-- ----------------------------
-- Table structure for bms_fahuofee_route
-- ----------------------------
DROP TABLE IF EXISTS `bms_fahuofee_route`;
CREATE TABLE `bms_fahuofee_route` (
  `bfr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `bfa_id` int(11) unsigned NOT NULL COMMENT '发货费用审批ID',
  `fee_subtype` int(5) DEFAULT NULL COMMENT '费用明细类型：发货费（大巴），发货费（高铁）等',
  `fee_subname` varchar(255) DEFAULT NULL COMMENT '费用明细名称',
  `fahuo_route_cost` decimal(12,2) DEFAULT '0.00' COMMENT '发货费',
  `fahuo_receipts` varchar(100) DEFAULT '' COMMENT '发货单据号',
  `sumweight` decimal(12,2) DEFAULT '0.00' COMMENT '总重量',
  `business_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '业务发生时间',
  `ro_id` char(32) DEFAULT '' COMMENT '路由id',
  `ro_name` varchar(255) DEFAULT '' COMMENT '路由name',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发货城市ID',
  `start_region_name` varchar(255) DEFAULT '' COMMENT '发货城市name',
  `start_ts_name` varchar(255) DEFAULT '' COMMENT '路由发货站点name',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '到货城市ID',
  `stop_region_name` varchar(255) DEFAULT '' COMMENT '到货城市name',
  `sup_id` int(11) DEFAULT NULL COMMENT '供应商id',
  `sup_name` varchar(255) DEFAULT '' COMMENT '供应商name',
  `sup_region_id` int(11) unsigned DEFAULT '0' COMMENT '供应商城市ID',
  `sup_region_name` varchar(255) DEFAULT '' COMMENT '供应商城市',
  `sup_company` varchar(255) DEFAULT '' COMMENT '供应商所属公司',
  `business_month` varchar(12) CHARACTER SET utf8mb4 NOT NULL COMMENT '业务发生月份',
  `sup_taxrate` decimal(10,4) NOT NULL COMMENT '发票税率',
  `sup_invoicetype` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '发票类型: (0-增值税普通发票, 1-增值税专用发票, 2-增值税电子普通发票)',
  `bfr_createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `bfr_lastupdtime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后一次修改时间',
  `bfr_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '发货路由状态 1 正常 0删除',
  `os_type` int(5) NOT NULL DEFAULT '1' COMMENT '结算类型（1-现结；2-月结）',
  PRIMARY KEY (`bfr_id`),
  KEY `ro_id` (`ro_id`),
  KEY `sup_id` (`sup_id`),
  KEY `business_month` (`business_month`)
) ENGINE=InnoDB AUTO_INCREMENT=439 DEFAULT CHARSET=utf8 COMMENT='发货路由表';

-- ----------------------------
-- Table structure for bms_operation
-- ----------------------------
DROP TABLE IF EXISTS `bms_operation`;
CREATE TABLE `bms_operation` (
  `opn_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作ID',
  `to_id` int(11) NOT NULL COMMENT '订单序号',
  `to_no` int(11) DEFAULT NULL COMMENT '运单编号',
  `opn_order_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '操作订单类型1其它2脐血',
  `opn_type` tinyint(2) DEFAULT NULL COMMENT '操作类型 1 取件 2 派件 3 发货 4 提货',
  `opn_region_id` int(11) DEFAULT NULL COMMENT '操作城市ID',
  `opn_region_name` varchar(20) DEFAULT NULL COMMENT '操作城市名称',
  `opn_date` int(11) DEFAULT NULL COMMENT '操作时间',
  `opn_opfee` decimal(10,2) DEFAULT '0.00' COMMENT '取派转操作费用',
  `opn_longdisfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '远距离费',
  `opn_bigboxfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '大箱补贴',
  `opn_fahuofee` decimal(10,2) DEFAULT '0.00' COMMENT '发货费',
  `opn_tihuofee` decimal(10,2) DEFAULT '0.00' COMMENT '提货费',
  `opn_carfee` decimal(10,2) DEFAULT '0.00' COMMENT '停车费',
  `opn_dryicefee` decimal(10,2) DEFAULT '0.00' COMMENT '干冰费',
  `opn_tollfee` decimal(10,2) DEFAULT '0.00' COMMENT '路桥费',
  `opn_remark` varchar(1024) DEFAULT NULL COMMENT '操作备注',
  `opn_status` int(2) DEFAULT '0' COMMENT '状态 0未录1已录入2已审3已批准4已复核5已支付',
  `od_id` int(10) DEFAULT NULL COMMENT '取派件存order_logistics ID 提发货存dispatch ID',
  `opn_visible` tinyint(2) DEFAULT '1' COMMENT '状态1 正常 0 删除',
  `opn_othfee` decimal(10,2) DEFAULT '0.00' COMMENT '其他费',
  `opn_totalfee` decimal(10,2) DEFAULT '0.00' COMMENT '汇总费',
  `opn_zucarfee` decimal(10,2) DEFAULT '0.00' COMMENT '租车费',
  `opn_fuwufee` decimal(10,2) DEFAULT '0.00' COMMENT '服务费',
  `opn_total` decimal(10,2) DEFAULT '0.00' COMMENT '合计(含服务费)',
  `opn_person` int(11) DEFAULT NULL COMMENT '付费责任人id',
  `opn_paymentday` int(11) DEFAULT NULL COMMENT '支付日期',
  `opn_opt_type` tinyint(2) DEFAULT '0' COMMENT '结算方式（付费方式）',
  `opn_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `opn_pay_type` tinyint(2) DEFAULT '1' COMMENT '垫付状态  1 非垫付 2 垫付',
  `opn_pay_name` varchar(255) DEFAULT NULL COMMENT '垫付人姓名',
  `opn_reason` varchar(1024) DEFAULT NULL COMMENT '审核不通过原因',
  `opn_check_state` tinyint(2) DEFAULT '1' COMMENT '检查状态 1.未检查 2.已检查',
  `opn_inspect` varchar(255) DEFAULT NULL COMMENT '检查人',
  `opn_hidden` int(2) NOT NULL DEFAULT '0' COMMENT '0显示 1隐藏',
  `opn_applyer_id` int(11) DEFAULT NULL COMMENT '费用申请人id',
  `opn_applyer_name` varchar(255) DEFAULT NULL COMMENT '费用申请人姓名',
  `username` varchar(255) DEFAULT NULL COMMENT '付费责任人姓名',
  `ymmid` char(32) DEFAULT NULL COMMENT '运满满账号',
  `addr` char(128) DEFAULT '' COMMENT '付费责任人详细地址',
  `fhf_status` int(2) NOT NULL DEFAULT '0' COMMENT '是否已计入发货费 0未计入  1已计入',
  `opn_sp_no` char(32) DEFAULT '' COMMENT '企业微信支付申请审批编号',
  `co_card` varchar(100) DEFAULT NULL COMMENT '身份证号码',
  `co_bankcard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `co_accountname` varchar(30) DEFAULT NULL COMMENT '户名',
  `co_mobile_phone` varchar(30) DEFAULT NULL COMMENT '手机号码',
  PRIMARY KEY (`opn_id`),
  KEY `opn_type` (`opn_type`),
  KEY `to_id` (`to_id`),
  KEY `opn_status` (`opn_status`)
) ENGINE=InnoDB AUTO_INCREMENT=901073 DEFAULT CHARSET=utf8 COMMENT='bms操作表';

-- ----------------------------
-- Table structure for bms_order
-- ----------------------------
DROP TABLE IF EXISTS `bms_order`;
CREATE TABLE `bms_order` (
  `bms_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `bms_to_id` int(11) unsigned DEFAULT NULL COMMENT '运输单序号',
  `bms_bi_id` int(11) unsigned DEFAULT NULL COMMENT '抬头id',
  `bms_bi_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '抬头名称',
  `bms_em_id` int(11) unsigned DEFAULT NULL COMMENT '销售人员ID',
  `bms_emp_id` int(11) DEFAULT NULL COMMENT '项目人员ID',
  `bms_emc_id` int(11) DEFAULT NULL COMMENT '结算人员ID',
  `bms_ol_goods_quantity` int(10) DEFAULT '0' COMMENT '货物件数',
  `bms_ol_goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克）',
  `bms_ol_pickup_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约取件时间',
  `bms_ol_pickup_time` int(10) unsigned DEFAULT '0' COMMENT '取件时间',
  `bms_ol_delivery_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约派件时间',
  `bms_ol_delivery_time` int(10) unsigned DEFAULT '0' COMMENT '派件时间',
  `bms_ol_remark` longtext CHARACTER SET utf8 COMMENT '取派备注',
  `bms_ol_become_time` int(10) unsigned DEFAULT NULL COMMENT '采血时间',
  `bms_cu_id` int(11) unsigned DEFAULT NULL COMMENT '委托客户序号',
  `bms_cu_no` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '委托客户编号',
  `bms_cu_name` char(32) CHARACTER SET utf8 DEFAULT '' COMMENT '客户名称',
  `bms_cu_knot_type` tinyint(4) DEFAULT NULL COMMENT '结算类型 参考globaltype knot_type',
  `bms_to_no` char(32) CHARACTER SET utf8 DEFAULT '' COMMENT '纸质运单编号',
  `bms_to_status` tinyint(4) unsigned DEFAULT '0' COMMENT '运输单状态 0新建 1已审核 2已取件 3已发货 4已提货 5已派件 6已反馈 7已取消 8已关闭 9删除',
  `bms_to_insure` tinyint(4) unsigned DEFAULT '0' COMMENT '是否投保，0否，1是',
  `bms_to_insure_value` decimal(20,2) DEFAULT '0.00' COMMENT '声明价值',
  `bms_to_trequirement` int(1) DEFAULT '0' COMMENT '运输要求 0正常 2专人 3专车',
  `bms_to_abnormal_charge_type` tinyint(1) DEFAULT '1' COMMENT '异常收费 1 无异常收费 2 异常收费',
  `bms_to_customer_no` char(128) CHARACTER SET utf8 DEFAULT '' COMMENT '客户单号，客户内部单号',
  `bms_to_getcash` tinyint(4) unsigned DEFAULT '0' COMMENT '付款方式，0月结，1发货方现金，2收货方现金',
  `bms_to_remark` longtext CHARACTER SET utf8 COMMENT '客户备注',
  `bms_to_temperature` tinyint(4) unsigned DEFAULT '0' COMMENT '运输温度，1 CW0-30，2 HW15-25，3 HW18-30，4 LB2-8，5 GB-20，6 YD-150',
  `bms_to_temperature_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '运输温度记录',
  `bms_to_thermometer` tinyint(4) unsigned DEFAULT '0' COMMENT '温度计，1无温度计，2生生温度计，3客户温度计，4客户和生生温度计',
  `bms_to_hygrometer` tinyint(4) DEFAULT '0' COMMENT '湿度计，1无湿度计，2生生湿度计，3客户湿度计，4客户和生生湿度计',
  `bms_to_type` tinyint(4) unsigned DEFAULT '0' COMMENT '订单类型，0标准运输，1耗材调拨 2 山东齐鲁订单',
  `bms_to_sign_status` tinyint(4) unsigned DEFAULT '0' COMMENT '签收单据附件状态，0未上传，1已上传',
  `bms_to_timelimit` tinyint(4) unsigned DEFAULT NULL COMMENT '运送时限，0：12小时，1：24小时，2：36小时，3：48小时，4：72小时',
  `bms_to_email` char(70) CHARACTER SET utf8 DEFAULT NULL COMMENT '联系邮箱',
  `bms_to_assign_username` char(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '指派给用户姓名',
  `bms_cp_id` int(11) unsigned DEFAULT NULL COMMENT '项目序号',
  `bms_cp_no` char(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目编号',
  `bms_start_co_name` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '收发件人',
  `bms_start_cu_name` varchar(400) CHARACTER SET utf8 DEFAULT NULL COMMENT '发件客户',
  `bms_start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发件所在地区ID',
  `bms_child_start_region_id` int(11) DEFAULT NULL COMMENT '出发城市子级id',
  `bms_stop_cu_name` varchar(400) CHARACTER SET utf8 DEFAULT NULL COMMENT '收件客户',
  `bms_stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '收件所在地区ID',
  `bms_child_stop_region_id` int(11) DEFAULT NULL COMMENT '到达城市子级id',
  `bms_start_address` varchar(800) CHARACTER SET utf8 DEFAULT NULL COMMENT '发件联系地址',
  `bms_start_region_name` char(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '发件地区名',
  `bms_child_start_region_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '出发城市子级名称',
  `bms_start_mobile_phone` varchar(180) CHARACTER SET utf8 DEFAULT NULL COMMENT '发件联系手机',
  `bms_stop_address` varchar(800) CHARACTER SET utf8 DEFAULT NULL COMMENT '收件联系地址',
  `bms_stop_co_name` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '收件联系人',
  `bms_stop_mobile_phone` varchar(180) CHARACTER SET utf8 DEFAULT NULL COMMENT '收件联系手机',
  `bms_stop_region_name` char(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '收件地区名',
  `bms_child_stop_region_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '到达城市子级名称',
  `bms_cp_tags` varchar(150) CHARACTER SET utf8 DEFAULT NULL COMMENT '项目标签',
  `bms_to_tags` varchar(150) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单标签',
  `bms_to_settlement_status` tinyint(4) unsigned DEFAULT '0' COMMENT '结算状态，0未结算，1已结算',
  `bms_to_invoice` tinyint(4) unsigned DEFAULT '0' COMMENT '是否开票，0否，1是',
  `bms_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `bms_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `bms_to_category` tinyint(1) DEFAULT NULL COMMENT '订单类型 1 正常订单 2仓库发药 3 验证订单',
  `to_business_type` tinyint(1) DEFAULT NULL COMMENT '订单类型 0 正常订单 2仓库发药',
  `bms_to_attributes` int(255) DEFAULT '1' COMMENT '订单类型 1.普通订单 2.主单 3.子单',
  `contact_name` varchar(30) DEFAULT NULL COMMENT '委托人姓名',
  `contact_tel` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '委托人手机号',
  `to_source` tinyint(4) DEFAULT NULL COMMENT '订单来源',
  `ol_static_class` int(10) DEFAULT NULL COMMENT '下单部门ID',
  `to_identify` int(4) DEFAULT NULL COMMENT '合单类型 0普通订单1 臻和订单 2泰锟合单',
  `to_pid` int(11) DEFAULT NULL COMMENT '主单ID',
  `ol_sign_name` char(32) DEFAULT NULL COMMENT '签收人',
  `transport_type` tinyint(3) unsigned DEFAULT '0' COMMENT '运输类型 0=常规运输  1=临床发运 2=营销样品  3=其他',
  `to_goodstype` tinyint(4) DEFAULT '0' COMMENT '货物类型',
  PRIMARY KEY (`bms_id`),
  KEY `bms_cu_id` (`bms_cu_id`),
  KEY `bms_to_id` (`bms_to_id`),
  KEY `bms_order_bms_to_abnormal_charge_type_index` (`bms_to_abnormal_charge_type`),
  KEY `bms_start_region_id` (`bms_start_region_id`),
  KEY `bms_stop_region_id` (`bms_stop_region_id`),
  KEY `bms_to_customer_no` (`bms_to_customer_no`),
  KEY `bms_to_no` (`bms_to_no`),
  KEY `bms_to_status` (`bms_to_status`),
  KEY `bms_pickup_time` (`bms_ol_pickup_time`),
  KEY `delivery_time` (`bms_ol_delivery_time`)
) ENGINE=InnoDB AUTO_INCREMENT=358099 DEFAULT CHARSET=utf8mb4 COMMENT='运输订单表';

-- ----------------------------
-- Table structure for bms_order_hot
-- ----------------------------
DROP TABLE IF EXISTS `bms_order_hot`;
CREATE TABLE `bms_order_hot` (
  `bms_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `bms_to_id` int(11) unsigned DEFAULT NULL COMMENT '运输单序号',
  `bms_bi_id` int(11) unsigned DEFAULT NULL COMMENT '抬头id',
  `bms_bi_name` varchar(128) DEFAULT NULL COMMENT '抬头名称',
  `bms_em_id` int(11) unsigned DEFAULT NULL COMMENT '销售人员ID',
  `bms_emp_id` int(11) DEFAULT NULL COMMENT '项目人员ID',
  `bms_emc_id` int(11) DEFAULT NULL COMMENT '结算人员ID',
  `bms_ol_goods_quantity` int(10) DEFAULT '0' COMMENT '货物件数',
  `bms_ol_goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克）',
  `bms_ol_pickup_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约取件时间',
  `bms_ol_pickup_time` int(10) unsigned DEFAULT '0' COMMENT '取件时间',
  `bms_ol_delivery_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约派件时间',
  `bms_ol_delivery_time` int(10) unsigned DEFAULT '0' COMMENT '派件时间',
  `bms_ol_remark` longtext COMMENT '取派备注',
  `bms_ol_become_time` int(10) unsigned DEFAULT NULL COMMENT '采血时间',
  `bms_cu_id` int(11) unsigned DEFAULT NULL COMMENT '委托客户序号',
  `bms_cu_no` char(32) DEFAULT NULL COMMENT '委托客户编号',
  `bms_cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `bms_cu_knot_type` tinyint(4) DEFAULT NULL COMMENT '结算类型 参考globaltype knot_type',
  `bms_to_no` char(32) DEFAULT '' COMMENT '纸质运单编号',
  `bms_to_status` tinyint(4) unsigned DEFAULT '0' COMMENT '运输单状态 0新建 1已审核 2已取件 3已发货 4已提货 5已派件 6已反馈 7已取消 8已关闭 9删除',
  `bms_to_insure` tinyint(4) unsigned DEFAULT '0' COMMENT '是否投保，0否，1是',
  `bms_to_insure_value` decimal(20,2) DEFAULT '0.00' COMMENT '声明价值',
  `bms_to_trequirement` int(1) DEFAULT '0' COMMENT '运输要求 0正常 2专人 3专车',
  `bms_to_abnormal_charge_type` tinyint(1) DEFAULT '1' COMMENT '异常收费 1 无异常收费 2 异常收费',
  `bms_to_customer_no` char(128) DEFAULT '' COMMENT '客户单号，客户内部单号',
  `bms_to_getcash` tinyint(4) unsigned DEFAULT '0' COMMENT '付款方式，0月结，1发货方现金，2收货方现金',
  `bms_to_remark` longtext COMMENT '客户备注',
  `bms_to_temperature` tinyint(4) unsigned DEFAULT '0' COMMENT '运输温度，1 CW0-30，2 HW15-25，3 HW18-30，4 LB2-8，5 GB-20，6 YD-150',
  `bms_to_temperature_name` varchar(30) DEFAULT NULL COMMENT '运输温度记录',
  `bms_to_thermometer` tinyint(4) unsigned DEFAULT '0' COMMENT '温度计，1无温度计，2生生温度计，3客户温度计，4客户和生生温度计',
  `bms_to_hygrometer` tinyint(4) DEFAULT '0' COMMENT '湿度计，1无湿度计，2生生湿度计，3客户湿度计，4客户和生生湿度计',
  `bms_to_type` tinyint(4) unsigned DEFAULT '0' COMMENT '订单类型，0标准运输，1耗材调拨 2 山东齐鲁订单',
  `bms_to_sign_status` tinyint(4) unsigned DEFAULT '0' COMMENT '签收单据附件状态，0未上传，1已上传',
  `bms_to_timelimit` tinyint(4) unsigned DEFAULT NULL COMMENT '运送时限，0：12小时，1：24小时，2：36小时，3：48小时，4：72小时',
  `bms_to_email` char(70) DEFAULT NULL COMMENT '联系邮箱',
  `bms_to_assign_username` char(32) DEFAULT NULL COMMENT '指派给用户姓名',
  `bms_cp_id` int(11) unsigned DEFAULT NULL COMMENT '项目序号',
  `bms_cp_no` char(128) DEFAULT NULL COMMENT '项目编号',
  `bms_start_co_name` varchar(300) DEFAULT NULL COMMENT '收发件人',
  `bms_start_cu_name` varchar(400) DEFAULT NULL COMMENT '发件客户',
  `bms_start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发件所在地区ID',
  `bms_child_start_region_id` int(11) DEFAULT NULL COMMENT '出发城市子级id',
  `bms_stop_cu_name` varchar(400) DEFAULT NULL COMMENT '收件客户',
  `bms_stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '收件所在地区ID',
  `bms_child_stop_region_id` int(11) DEFAULT NULL COMMENT '到达城市子级id',
  `bms_start_address` varchar(800) DEFAULT NULL COMMENT '发件联系地址',
  `bms_start_region_name` char(128) DEFAULT NULL COMMENT '发件地区名',
  `bms_child_start_region_name` varchar(255) DEFAULT NULL COMMENT '出发城市子级名称',
  `bms_start_mobile_phone` varchar(180) DEFAULT NULL COMMENT '发件联系手机',
  `bms_stop_address` varchar(800) DEFAULT NULL COMMENT '收件联系地址',
  `bms_stop_co_name` varchar(300) DEFAULT NULL COMMENT '收件联系人',
  `bms_stop_mobile_phone` varchar(180) DEFAULT NULL COMMENT '收件联系手机',
  `bms_stop_region_name` char(128) DEFAULT NULL COMMENT '收件地区名',
  `bms_child_stop_region_name` varchar(255) DEFAULT NULL COMMENT '到达城市子级名称',
  `bms_cp_tags` varchar(150) DEFAULT NULL COMMENT '项目标签',
  `bms_to_tags` varchar(150) DEFAULT NULL COMMENT '订单标签',
  `bms_to_settlement_status` tinyint(4) unsigned DEFAULT '0' COMMENT '结算状态，0未结算，1已结算',
  `bms_to_invoice` tinyint(4) unsigned DEFAULT '0' COMMENT '是否开票，0否，1是',
  `bms_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `bms_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `bms_to_category` tinyint(1) DEFAULT NULL COMMENT '订单类型 1 正常订单 2仓库发药 3 验证订单',
  `to_business_type` tinyint(1) DEFAULT NULL COMMENT '0正常订单 2仓库发药',
  `bms_to_attributes` int(255) NOT NULL DEFAULT '1' COMMENT '订单类型 1.普通订单 2.主单 3.子单',
  `contact_name` varchar(30) DEFAULT NULL COMMENT '委托人姓名',
  `contact_tel` varchar(30) DEFAULT NULL COMMENT '委托人手机号',
  `to_source` tinyint(4) DEFAULT NULL COMMENT '订单来源',
  `ol_static_class` int(10) DEFAULT NULL COMMENT '下单部门ID',
  `to_identify` int(4) DEFAULT NULL COMMENT '合单类型 0普通订单1 臻和订单 2泰锟合单',
  `to_pid` int(11) DEFAULT NULL COMMENT '主单ID',
  `ol_sign_name` char(32) DEFAULT NULL COMMENT '签收人',
  `transport_type` tinyint(3) unsigned DEFAULT '0' COMMENT '运输类型 0=常规运输  1=临床发运 2=营销样品  3=其他',
  `to_goodstype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '货物类型',
  PRIMARY KEY (`bms_id`),
  KEY `bms_cu_id` (`bms_cu_id`),
  KEY `bms_start_region_id` (`bms_start_region_id`),
  KEY `bms_stop_region_id` (`bms_stop_region_id`),
  KEY `bms_to_customer_no` (`bms_to_customer_no`),
  KEY `bms_to_no` (`bms_to_no`),
  KEY `bms_to_id` (`bms_to_id`),
  KEY `bms_order_bms_to_abnormal_charge_type_index` (`bms_to_abnormal_charge_type`),
  KEY `bms_to_status` (`bms_to_status`) USING BTREE,
  KEY `bms_pickup_time` (`bms_ol_pickup_time`) USING BTREE,
  KEY `delivery_time` (`bms_ol_delivery_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=358099 DEFAULT CHARSET=utf8 COMMENT='BMS订单信息热数据表';

-- ----------------------------
-- Table structure for bms_order_pick_time
-- ----------------------------
DROP TABLE IF EXISTS `bms_order_pick_time`;
CREATE TABLE `bms_order_pick_time` (
  `opt_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL COMMENT '订单id',
  `start_pickup_plan_time` int(10) NOT NULL DEFAULT '0' COMMENT '首次预取开始时间',
  `end_pickup_plan_time` int(10) NOT NULL DEFAULT '0' COMMENT '首次预取结束时间',
  `start_delivery_plan_time` int(10) NOT NULL DEFAULT '0' COMMENT '首次预派开始时间',
  `end_delivery_plan_time` int(10) NOT NULL DEFAULT '0' COMMENT '首次预派结束时间',
  `opt_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `opt_create_username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '创建人姓名',
  `opt_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `opt_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `opt_lastupd_username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '更新人姓名',
  `opt_lastupdtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`opt_id`) USING BTREE,
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1509 DEFAULT CHARSET=utf8mb4 COMMENT='订单预取派时间表';

-- ----------------------------
-- Table structure for bms_order_status
-- ----------------------------
DROP TABLE IF EXISTS `bms_order_status`;
CREATE TABLE `bms_order_status` (
  `bos_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `bos_to_id` int(11) NOT NULL COMMENT '订单id',
  `bos_to_settlement_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '结算状态，0未结算，1已结算',
  `bos_to_invoice_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单开票状态 开票状态，0未开票，1已开票',
  `bos_to_abnormal_charge_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '订单异常收费状态 常收费 1 无异常收费 2 异常收费',
  `bos_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `bos_to_abnormal_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单异常状态 0无异常，1异常',
  `bos_order_settlement_weight` double(10,2) DEFAULT '0.00' COMMENT '订单结算重量',
  `bos_fail_reason` varchar(255) DEFAULT NULL COMMENT '未结算原因',
  PRIMARY KEY (`bos_id`),
  UNIQUE KEY `to_id` (`bos_to_id`),
  KEY `to_settlement` (`bos_to_settlement_status`),
  KEY `to_abnormal_status` (`bos_to_abnormal_status`)
) ENGINE=InnoDB AUTO_INCREMENT=405542 DEFAULT CHARSET=utf8mb4 COMMENT='bms订单状态表';

-- ----------------------------
-- Table structure for bms_remark_log
-- ----------------------------
DROP TABLE IF EXISTS `bms_remark_log`;
CREATE TABLE `bms_remark_log` (
  `rl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '备注序号',
  `rl_type` char(8) DEFAULT '' COMMENT '备注类型，如：100采购单、101入库单 102 订单 103-调渡单',
  `rl_subtype` char(16) DEFAULT '' COMMENT '操作类型，如：100001指派、100002备注、100003生成采购单',
  `rl_identifier` int(11) unsigned DEFAULT '0' COMMENT '备注标识，如：采购单序号、入库单序号等',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `username` char(32) DEFAULT '' COMMENT '操作人',
  `rl_status` tinyint(4) unsigned DEFAULT '0' COMMENT '备注状态 0正常，1删除',
  `rl_remark` longtext COMMENT '备注内容',
  `rl_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `rl_server_type` tinyint(2) DEFAULT '1' COMMENT '操作端口 1 电脑操作  2 m3操作 3 服务号  4 操作号',
  `rl_region_id` int(11) DEFAULT '0' COMMENT '操作城市id',
  PRIMARY KEY (`rl_id`),
  KEY `rl_identifier` (`rl_identifier`),
  KEY `rl_server_type` (`rl_server_type`),
  KEY `rl_type` (`rl_type`),
  KEY `rl_subtype` (`rl_subtype`),
  KEY `rl_createtime` (`rl_createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4922437 DEFAULT CHARSET=utf8 COMMENT='bms备注记录表';

-- ----------------------------
-- Table structure for bms_tempscheme_temps
-- ----------------------------
DROP TABLE IF EXISTS `bms_tempscheme_temps`;
CREATE TABLE `bms_tempscheme_temps` (
  `btt_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bts_id` int(11) NOT NULL COMMENT '温区方案id',
  `bts_name` varchar(255) NOT NULL DEFAULT '' COMMENT '温区方案名称',
  `temp_config_id` int(11) NOT NULL COMMENT '温度范围ID',
  `temp_remark` varchar(255) DEFAULT NULL COMMENT '温区名称',
  `btt_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态  1正常 2删除',
  `btt_create_uid` int(10) DEFAULT NULL COMMENT '创建人uid',
  `btt_create_name` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `btt_create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`btt_id`),
  KEY `temp_config_id` (`temp_config_id`),
  KEY `bts_id` (`bts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='温区方案关联温度表';

-- ----------------------------
-- Table structure for bms_tempzone_scheme
-- ----------------------------
DROP TABLE IF EXISTS `bms_tempzone_scheme`;
CREATE TABLE `bms_tempzone_scheme` (
  `bts_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bts_name` varchar(255) NOT NULL DEFAULT '' COMMENT '温区方案名称',
  `bts_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态  1正常 2删除',
  `bts_price` decimal(10,2) DEFAULT NULL COMMENT '标准价格',
  `bts_remark` varchar(255) DEFAULT NULL COMMENT '温区方案备注',
  `bts_create_uid` int(10) DEFAULT NULL COMMENT '创建人uid',
  `bts_create_name` varchar(256) DEFAULT NULL COMMENT '创建人名称',
  `bts_create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`bts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COMMENT='温区方案表';

-- ----------------------------
-- Table structure for bms_tmp_abnormal_order
-- ----------------------------
DROP TABLE IF EXISTS `bms_tmp_abnormal_order`;
CREATE TABLE `bms_tmp_abnormal_order` (
  `btao_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '临时异常订单id',
  `to_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `btao_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `btao_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`btao_id`),
  UNIQUE KEY `to_id` (`to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='临时异常订单表';

-- ----------------------------
-- Table structure for bms_xm_information
-- ----------------------------
DROP TABLE IF EXISTS `bms_xm_information`;
CREATE TABLE `bms_xm_information` (
  `txm_id` int(11) NOT NULL AUTO_INCREMENT,
  `txm_to_id` int(11) NOT NULL COMMENT '订单id',
  `txm_volume` varchar(255) NOT NULL COMMENT '体积',
  `txm_weight` varchar(255) NOT NULL COMMENT '重量',
  `txm_gd_number` varchar(100) NOT NULL COMMENT '温度计编号',
  `txm_car_info` varchar(255) DEFAULT NULL COMMENT '车辆信息',
  `txm_filght_number` varchar(30) DEFAULT NULL COMMENT '航班号',
  `txm_num` int(3) DEFAULT NULL COMMENT '箱数',
  `txm_warm_area` varchar(255) DEFAULT NULL COMMENT '温区',
  PRIMARY KEY (`txm_id`) USING BTREE,
  KEY `txm_to_id` (`txm_to_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1098 DEFAULT CHARSET=utf8mb4 COMMENT='BMS西门子订单附属信息';

-- ----------------------------
-- Table structure for business_message
-- ----------------------------
DROP TABLE IF EXISTS `business_message`;
CREATE TABLE `business_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `app_id` varchar(50) NOT NULL COMMENT '应用id',
  `message_id` varchar(100) NOT NULL COMMENT '消息id，全局唯一',
  `subject` varchar(100) NOT NULL COMMENT '消息主题',
  `content` longtext NOT NULL COMMENT '消息内容',
  `data_sync_status` tinyint(3) DEFAULT '0' COMMENT '数据同步状态，0待同步、1已同步',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `schedule_push_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '计划推送时间',
  `max_error_retry_num` int(11) DEFAULT '0' COMMENT '最大失败重试次数',
  `data_last_change_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3) COMMENT '数据最后变更时间',
  `extend_params` varchar(100) DEFAULT '' COMMENT '扩展参数',
  `tag` varchar(500) DEFAULT '' COMMENT '消息标签；默认为空，不空情况下里面存json格式，例如：{"source":"xx渠道"}',
  PRIMARY KEY (`id`),
  UNIQUE KEY `message_id` (`message_id`),
  KEY `data_last_change_time` (`data_last_change_time`)
) ENGINE=InnoDB AUTO_INCREMENT=2669 DEFAULT CHARSET=utf8 COMMENT='业务消息表';

-- ----------------------------
-- Table structure for c_push_log
-- ----------------------------
DROP TABLE IF EXISTS `c_push_log`;
CREATE TABLE `c_push_log` (
  `pl_id` int(11) NOT NULL AUTO_INCREMENT,
  `pl_deviceId` varchar(50) DEFAULT NULL COMMENT '设备号',
  `pl_time` int(10) DEFAULT NULL COMMENT '采集时间',
  `pl_temp` varchar(20) DEFAULT NULL COMMENT '温度',
  `pl_lbs` varchar(255) DEFAULT NULL COMMENT '定位',
  `pl_lbs_time` int(10) DEFAULT NULL COMMENT '定位时间',
  `pl_status` tinyint(1) DEFAULT NULL COMMENT '推送状态',
  `pl_lastupdtime` int(10) DEFAULT NULL,
  `pl_createtime` int(10) DEFAULT NULL,
  `pl_lbs_desc` varchar(255) DEFAULT NULL COMMENT '定位描述',
  PRIMARY KEY (`pl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for capital_purchase
-- ----------------------------
DROP TABLE IF EXISTS `capital_purchase`;
CREATE TABLE `capital_purchase` (
  `pu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '采购单序号',
  `pu_no` varchar(32) DEFAULT NULL COMMENT '采购单编号',
  `sp_id` int(11) DEFAULT NULL COMMENT '采购审批id',
  `sp_no` varchar(32) DEFAULT NULL COMMENT '采购审批单号',
  `pu_type` tinyint(4) DEFAULT NULL COMMENT '采购类型 1:行政采购 2:业务采购 3:元廷业务采购 4:元廷行政采购 5:集团内部采购',
  `pu_apply_uid` int(11) DEFAULT NULL COMMENT '申请人id',
  `pu_apply_name` varchar(30) DEFAULT NULL COMMENT '申请人姓名',
  `pu_purchasing_uid` int(11) DEFAULT NULL COMMENT '采购人id',
  `pu_purchasing_name` varchar(30) DEFAULT NULL COMMENT '采购人姓名',
  `pu_time_planbegin` int(11) DEFAULT NULL COMMENT '预计采购日期',
  `arrival_time_planbegin` int(11) DEFAULT NULL COMMENT '预计到货日期',
  `arrival_time_expect` int(11) NOT NULL DEFAULT '0' COMMENT '期望到货时间',
  `pu_status` int(11) DEFAULT '0' COMMENT '采购单状态 0:新建 1:已取消 2:已关闭',
  `pu_arrival_status` int(11) DEFAULT '0' COMMENT '到货状态 0:未到货 1:部分到货 2:已到货',
  `pu_create_uid` int(11) DEFAULT NULL COMMENT '创建人id',
  `pu_create_name` varchar(30) DEFAULT NULL COMMENT '创建人姓名',
  `su_id` int(11) DEFAULT NULL COMMENT '供应商序号',
  `su_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `pu_explain` longtext COMMENT '采购说明',
  `pu_remark` longtext COMMENT '采购备注',
  `pu_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `pu_updatetime` int(11) DEFAULT NULL COMMENT '修改时间',
  `pu_handler_emid` int(11) NOT NULL DEFAULT '0' COMMENT '经办人员工id',
  `pu_applicant_emid` int(11) NOT NULL DEFAULT '0' COMMENT '申请人员工id',
  `pu_handler_name` varchar(50) NOT NULL DEFAULT '' COMMENT '采购经办人姓名',
  `pu_applicant_name` varchar(50) NOT NULL DEFAULT '' COMMENT '采购申请人姓名',
  `pu_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '到货时间（最后到货时间）',
  PRIMARY KEY (`pu_id`),
  UNIQUE KEY `pu_no` (`pu_no`)
) ENGINE=InnoDB AUTO_INCREMENT=348 DEFAULT CHARSET=utf8mb4 COMMENT='采购订单表';

-- ----------------------------
-- Table structure for capital_purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `capital_purchase_detail`;
CREATE TABLE `capital_purchase_detail` (
  `pd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '采购明细序号',
  `pu_id` int(11) DEFAULT NULL COMMENT '采购单id',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `sto_no` varchar(50) DEFAULT NULL COMMENT '存货编号',
  `sto_name` varchar(50) DEFAULT NULL COMMENT '存货名称',
  `pd_unit` varchar(16) DEFAULT NULL COMMENT '单位',
  `pd_quantity` int(11) DEFAULT NULL COMMENT '数量',
  `pd_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `pd_arrival_city` varchar(50) NOT NULL DEFAULT '' COMMENT '到货城市',
  `pd_amount` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `pd_remark` longtext COMMENT '备注',
  `pd_visible` int(11) DEFAULT '1' COMMENT '状态 1:正常 0:删除',
  `pd_status` int(11) DEFAULT '0' COMMENT '到货状态 0:未到货 1:部分到货 2:已到货',
  `pd_quantum` int(11) DEFAULT '0' COMMENT '已到数量',
  `pd_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `pd_updatetime` int(11) DEFAULT NULL COMMENT '修改时间',
  `sto_volume` varchar(50) NOT NULL DEFAULT '' COMMENT '自定义货存/容量',
  `sto_size` varchar(50) NOT NULL DEFAULT '' COMMENT '自定外观尺寸',
  `pd_expected_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '期望到货时间',
  `pd_estimated_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '预计交付时间',
  `pd_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '到货时间（最后到货时间）',
  PRIMARY KEY (`pd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=489 DEFAULT CHARSET=utf8mb4 COMMENT='采购明细表';

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `ca_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '车辆序号',
  `car_number` varchar(32) DEFAULT NULL COMMENT '车牌号',
  `region_id` int(11) DEFAULT NULL COMMENT '所在地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `type` tinyint(5) DEFAULT NULL COMMENT '类型：1公司自有 2一嗨 3租用',
  `car_person_liable` varchar(64) DEFAULT '0' COMMENT '责任人',
  `car_subordinate` varchar(50) DEFAULT '0' COMMENT '所属',
  `car_brand` varchar(64) DEFAULT '0' COMMENT '车辆品牌',
  `car_power_type` tinyint(1) DEFAULT NULL COMMENT '动力类型 1-汽油、2-柴油、3-油电混合、4-纯电',
  `car_innerbox_size` varchar(64) DEFAULT NULL COMMENT '内厢尺寸',
  `car_rated_load` double(10,2) DEFAULT NULL COMMENT '额定载重',
  `car_length` double(10,2) DEFAULT NULL COMMENT '车身长度',
  `car_width` double(10,2) DEFAULT NULL COMMENT '车身宽度',
  `car_height` double(10,2) DEFAULT NULL COMMENT '车身高度',
  `car_tailplate` tinyint(1) DEFAULT NULL COMMENT '是否带尾板  1 是 0 否',
  `car_type` varchar(50) DEFAULT NULL COMMENT '车辆类型',
  `car_createtime` int(10) DEFAULT NULL COMMENT '注册时间',
  `car_remark` varchar(256) DEFAULT NULL COMMENT '备注',
  `car_health` int(10) DEFAULT NULL COMMENT '年检时间',
  `car_management_name` varchar(30) DEFAULT NULL COMMENT '车辆管理人姓名',
  `car_management_id` int(11) DEFAULT NULL COMMENT '车辆管理人ID',
  `car_employ_uid` int(11) DEFAULT NULL COMMENT '车辆使用人ID',
  `car_employ_username` varchar(35) DEFAULT '' COMMENT '车辆使用人姓名',
  `car_region_city` int(11) DEFAULT NULL COMMENT '大区 1:东北华北大区 2:华东华中大区 3:华南西南西北大区',
  `car_model` int(4) DEFAULT NULL COMMENT '车辆种类',
  `car_frame_number` varchar(128) DEFAULT NULL COMMENT '车架号',
  `car_engine_number` varchar(128) DEFAULT NULL COMMENT '发动机号',
  `car_etc_number` varchar(128) DEFAULT NULL COMMENT 'etc编号',
  `car_number_people` varchar(255) DEFAULT NULL COMMENT '核载人数',
  `car_oilcard_number` varchar(128) DEFAULT NULL COMMENT '油卡号',
  `car_total_weight` varchar(255) DEFAULT NULL COMMENT '总质量',
  `car_equipment_weight` varchar(255) DEFAULT NULL COMMENT '装备质量',
  `car_outline_dimension` varchar(255) DEFAULT NULL COMMENT '外廓尺寸',
  `car_usage_status` int(4) DEFAULT NULL COMMENT '使用状态：1.使用中 2.已退租 3.已报废',
  `car_operation_status` int(4) DEFAULT NULL COMMENT '营运状态  1.营运 2.非营运',
  `car_ga_id` int(11) unsigned DEFAULT NULL COMMENT '冷藏车校准附件关联id',
  `car_start_use_time` int(11) DEFAULT NULL COMMENT '开始使用时间',
  `car_lastuse_time` int(11) DEFAULT NULL COMMENT '最新使用时间',
  `car_ratify_size` varchar(255) DEFAULT NULL COMMENT '核定大小',
  `car_volume` int(11) DEFAULT NULL COMMENT '车辆容积',
  `trucks_type` int(4) DEFAULT '0' COMMENT '货车类型',
  `car_level` int(4) DEFAULT NULL COMMENT '技术等级评定',
  `car_level_time` int(11) DEFAULT '0' COMMENT '技术等级评定时间',
  `car_send_card_time` int(11) DEFAULT '0' COMMENT '运输证发证日期',
  `car_year_valid_time` int(11) DEFAULT '0' COMMENT '运输证年审有效日期至',
  `car_valid_time` int(11) DEFAULT '0' COMMENT '运输证有效期至',
  `car_source_type` int(4) NOT NULL DEFAULT '1' COMMENT '车辆数据来源 1 物流系统添加 2资产系统录入',
  PRIMARY KEY (`ca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COMMENT='车辆管理';

-- ----------------------------
-- Table structure for car_accident
-- ----------------------------
DROP TABLE IF EXISTS `car_accident`;
CREATE TABLE `car_accident` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `ca_id` tinyint(5) DEFAULT NULL COMMENT '汽车id',
  `ca_number` varchar(30) DEFAULT NULL COMMENT '车牌号',
  `accident_time` varchar(11) DEFAULT NULL COMMENT '事故日期',
  `responsible` tinyint(2) DEFAULT NULL COMMENT '事故责任方 1:我方全责 2:对方全责',
  `em_id` int(11) DEFAULT NULL COMMENT '员工id',
  `em_name` varchar(30) DEFAULT NULL COMMENT '员工姓名',
  `desc` varchar(100) DEFAULT NULL COMMENT '事故具体内容',
  `price` varchar(50) DEFAULT NULL,
  `repair_day` tinyint(10) DEFAULT NULL COMMENT '维修天数',
  `handle` varchar(100) DEFAULT NULL COMMENT '运营处理情况',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ndc_data` varchar(25) DEFAULT NULL COMMENT 'NDC系数',
  `we_price` varchar(50) DEFAULT '0' COMMENT '我方理赔金额',
  `other_price` varchar(50) DEFAULT '0' COMMENT '对方理赔金额',
  `at_present_status` int(4) NOT NULL DEFAULT '3' COMMENT '当前状态 1处理中 2 完成（未进保） 3 完成（已结案）',
  `severity_degree` int(4) DEFAULT '0' COMMENT '严重程度 1轻微车辆损伤 2 严重车辆损伤 3 轻微人伤 4 严重人伤 5 严重车损+轻微人伤 6 重大事故 7 高金额事故',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='车辆事故';

-- ----------------------------
-- Table structure for car_binding_temp_probe
-- ----------------------------
DROP TABLE IF EXISTS `car_binding_temp_probe`;
CREATE TABLE `car_binding_temp_probe` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ca_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '冷藏车id',
  `gd_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '物资明细表id',
  `start_use_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '使用日期',
  `end_use_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '停用时间',
  `status` tinyint(4) NOT NULL DEFAULT '3' COMMENT '状态(1、使用中，2、已停用，3、未使用)',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '绑定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COMMENT='冷藏车绑定温度计探头';

-- ----------------------------
-- Table structure for car_insurance
-- ----------------------------
DROP TABLE IF EXISTS `car_insurance`;
CREATE TABLE `car_insurance` (
  `ci_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆保险序号',
  `ca_id` int(11) DEFAULT NULL COMMENT '车辆序号',
  `ca_number` varchar(30) DEFAULT NULL COMMENT '车牌号',
  `price` decimal(10,2) DEFAULT NULL COMMENT '购买金额',
  `ci_compulsory` decimal(10,2) DEFAULT NULL COMMENT '交强险',
  `ci_vehicle` decimal(10,2) DEFAULT NULL COMMENT '车税险',
  `ci_commercial` decimal(10,2) DEFAULT NULL COMMENT '商业险',
  `ci_loss` decimal(10,2) DEFAULT NULL COMMENT '机动车损失保险',
  `ci_third_loss_1` decimal(10,2) DEFAULT NULL COMMENT '机动车第三者责任险(100万)',
  `ci_third_loss_2` decimal(10,2) DEFAULT NULL COMMENT '机动车第三者责任险(150万)',
  `ci_loss_driver` decimal(10,2) DEFAULT NULL COMMENT '车上人员责任险：驾驶员',
  `ci_loss_passenger` decimal(10,2) DEFAULT NULL COMMENT '车上人员责任险：乘客',
  `project` varchar(255) DEFAULT NULL COMMENT '购买项目',
  `company` varchar(30) DEFAULT NULL COMMENT '保险公司',
  `contacts` varchar(30) DEFAULT NULL COMMENT '联系人',
  `insured` varchar(30) DEFAULT NULL COMMENT '被保险人',
  `term_start_time` int(11) DEFAULT NULL COMMENT '保险起始时间',
  `term_end_time` int(11) DEFAULT NULL COMMENT '保险结束时间',
  `ci_state` tinyint(4) DEFAULT NULL COMMENT '状态  1 已续保  2 即将过期  3 已过期   0过期后已续保数据  ',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ci_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='车辆保险';

-- ----------------------------
-- Table structure for car_repair
-- ----------------------------
DROP TABLE IF EXISTS `car_repair`;
CREATE TABLE `car_repair` (
  `cr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '车辆维修序号',
  `ca_id` int(11) DEFAULT NULL COMMENT '车辆序号',
  `ca_number` varchar(10) DEFAULT NULL COMMENT '车牌号',
  `em_id` int(11) DEFAULT NULL COMMENT '员工序号',
  `em_name` varchar(30) DEFAULT NULL COMMENT '员工姓名',
  `cr_type` tinyint(2) DEFAULT NULL COMMENT '类型 1:维修 2:保养',
  `repair_shop_name` varchar(128) NOT NULL COMMENT '维修厂名称',
  `repair_phone` varchar(32) NOT NULL COMMENT '维修厂联系方式',
  `reapir_address` varchar(255) NOT NULL COMMENT '维修厂地址',
  `repair_time` varchar(30) DEFAULT NULL COMMENT '维修保养日期',
  `repair_mile` varchar(50) DEFAULT NULL COMMENT '维修保养里程',
  `repair_project` varchar(30) DEFAULT NULL COMMENT '维修保养项目',
  `repair_cost` decimal(10,2) DEFAULT NULL COMMENT '维修保养费用',
  `region_id` int(11) DEFAULT NULL COMMENT '所在地区ID',
  `region_name` varchar(128) DEFAULT NULL COMMENT '地区名',
  `desc` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`cr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for carea
-- ----------------------------
DROP TABLE IF EXISTS `carea`;
CREATE TABLE `carea` (
  `carea_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作运营大区id',
  `carea_region` text NOT NULL COMMENT '操作城市',
  `carea_visible` int(2) NOT NULL DEFAULT '1' COMMENT '是否存在1.存在 2删除',
  `carea_name` varchar(25) NOT NULL COMMENT '大区名称',
  `carea_use_id` varchar(255) NOT NULL COMMENT '大区负责人id',
  `carea_use_name` varchar(255) NOT NULL COMMENT '大区负责人名称',
  `carea_insure_use_id` varchar(255) DEFAULT NULL COMMENT '投保推送人id',
  `carea_insure_use_name` varchar(255) DEFAULT NULL COMMENT '投保推送人名',
  `carea_recycle_id` varchar(255) DEFAULT NULL COMMENT '干冰回收通知人id',
  `carea_recycle_name` varchar(255) DEFAULT NULL COMMENT '干冰回收通知人名',
  `carea_notice_user_id` varchar(255) DEFAULT '' COMMENT '风险报警通知人id',
  `carea_notice_user_name` varchar(255) DEFAULT '' COMMENT '风险报警通知人姓名',
  `top_id` int(11) DEFAULT NULL COMMENT '站点ID',
  `carea_risk_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT '风险外协通知人ids',
  `carea_risk_user_name` varchar(255) NOT NULL DEFAULT '' COMMENT '风险外协通知人名称',
  `carea_sign_uid` varchar(15) DEFAULT '' COMMENT '签单返回负责人',
  `carea_sign_username` varchar(15) DEFAULT '' COMMENT '签单返回负责人',
  `carea_sign_user_mobile` varchar(15) DEFAULT '' COMMENT '签单返回负责人手机',
  `carea_sign_user_addr` varchar(35) DEFAULT '' COMMENT '签单返回负责人地址',
  `carea_sign_order_uid` varchar(15) DEFAULT '' COMMENT '签单返回订单负责人',
  `carea_sign_order_username` varchar(15) DEFAULT '' COMMENT '签单返回订单负责人',
  `carea_sign_order_user_mobile` varchar(15) DEFAULT '' COMMENT '签单返回订单负责人手机',
  `carea_sign_order_user_addr` varchar(35) DEFAULT '' COMMENT '签单返回订单负责人地址',
  `carea_opuid` varchar(255) NOT NULL DEFAULT '' COMMENT '温度电量不足通知人uid',
  `carea_opname` varchar(255) NOT NULL DEFAULT '' COMMENT '温度电量不足通知人',
  `carea_waring_key` varchar(255) NOT NULL DEFAULT '' COMMENT '温度预警推送key',
  PRIMARY KEY (`carea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='操作大区表';

-- ----------------------------
-- Table structure for carrier_bill
-- ----------------------------
DROP TABLE IF EXISTS `carrier_bill`;
CREATE TABLE `carrier_bill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '承运商id',
  `carrier_name` varchar(100) NOT NULL DEFAULT '' COMMENT '承运商名称',
  `cost_month` varchar(20) NOT NULL DEFAULT '0' COMMENT '成本发生月份',
  `happen_area` varchar(50) NOT NULL DEFAULT '' COMMENT '发生地区',
  `company_id` int(11) NOT NULL DEFAULT '0' COMMENT '所属公司id',
  `company` varchar(60) NOT NULL DEFAULT '' COMMENT '所属公司',
  `cost_type` varchar(60) DEFAULT '' COMMENT '成本类型',
  `routing_type` varchar(50) NOT NULL DEFAULT '' COMMENT '路由类型',
  `bank_account` varchar(30) NOT NULL DEFAULT '' COMMENT '银行账号',
  `bank_name` varchar(60) NOT NULL DEFAULT '' COMMENT '开户银行名称',
  `invoice_rate` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '发票税率',
  `invoice_type` varchar(60) NOT NULL DEFAULT '' COMMENT '发票类型',
  `payee_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收款人名称',
  `estimate_amount` decimal(10,2) NOT NULL COMMENT '预提金额(含税)',
  `carry_goods_estimate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预提提货费',
  `deliver_goods_estimate` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预提发货费',
  `accrued_amount_tax` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '对账单金额(含税)',
  `payment_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `invoice_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '发票金额',
  `approve_link_id` varchar(50) NOT NULL DEFAULT '' COMMENT '泛微审批创建关联id',
  `approve_id` varchar(50) NOT NULL DEFAULT '' COMMENT '审批id',
  `approve_no` char(32) CHARACTER SET utf8 DEFAULT '' COMMENT '泛微审批编号',
  `approve_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '审批状态 0默认 1 已预提 2待发起 3待审核 4已通过 5已驳回 6审批创建中',
  `estimate_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '预提状态 0未确认 1已确认',
  `finance_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '财务确认状态 0待确认 1已确认2已编辑',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态 0正常 1已删除',
  `actual_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际成本',
  `input_tax` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '进项税额',
  `actual_diff` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '预提与实际差额',
  `payment_month` varchar(20) NOT NULL DEFAULT '0' COMMENT '付款月份',
  `entry_month` varchar(20) NOT NULL DEFAULT '0' COMMENT '入账月份',
  `payment_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '付款事由',
  `bill_file` varchar(255) NOT NULL DEFAULT '' COMMENT '附件',
  `is_advance` tinyint(3) NOT NULL DEFAULT '2' COMMENT '是否预付 1 是 2 否',
  `create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `idx_cn` (`carrier_name`),
  KEY `idx_cost_month` (`cost_month`)
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8mb4 COMMENT='月结供应商账单';

-- ----------------------------
-- Table structure for carrier_cost_rate
-- ----------------------------
DROP TABLE IF EXISTS `carrier_cost_rate`;
CREATE TABLE `carrier_cost_rate` (
  `ccr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '承运商费用项配置id',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '承运商id',
  `cic_id` int(11) NOT NULL DEFAULT '0' COMMENT '费用项配置主键',
  `cost_item_rate` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '费用项税率',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`ccr_id`),
  KEY `carrier_id` (`carrier_id`) USING BTREE,
  KEY `cic_id` (`ccr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=utf8mb4 COMMENT='承运商费用项配置表';

-- ----------------------------
-- Table structure for carrier_routing_rate
-- ----------------------------
DROP TABLE IF EXISTS `carrier_routing_rate`;
CREATE TABLE `carrier_routing_rate` (
  `crr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '承运商路由税率主键',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '承运商id',
  `carrier_name` varchar(60) NOT NULL DEFAULT '' COMMENT '承运商名称',
  `routing_type` int(4) NOT NULL DEFAULT '0' COMMENT '路由类型 1铁路 2航空 3大巴 4快递',
  `carry_goods_rate` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '发货税率',
  `deliver_goods_rate` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '提货费',
  `carry_goods_invoice_type` varchar(50) NOT NULL DEFAULT '' COMMENT '发货发票类型',
  `deliver_goods_invoice_type` varchar(50) NOT NULL DEFAULT '' COMMENT '提货发票类型',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`crr_id`),
  KEY `carrier_id` (`carrier_id`) USING BTREE,
  KEY `routing_type` (`routing_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COMMENT='承运商路由税率表';

-- ----------------------------
-- Table structure for carry_down_record
-- ----------------------------
DROP TABLE IF EXISTS `carry_down_record`;
CREATE TABLE `carry_down_record` (
  `cdr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cdr_month` varchar(10) NOT NULL COMMENT '结转月份',
  `ur_uid` int(10) NOT NULL COMMENT '结转用户ID',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名称',
  `cdr_create_time` int(10) DEFAULT NULL COMMENT '结转时间',
  `cdr_type` tinyint(1) DEFAULT NULL COMMENT '结转类型 1 结算 2 回款',
  PRIMARY KEY (`cdr_id`),
  KEY `cdr_month` (`cdr_month`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='结算回款应收结转记录表';

-- ----------------------------
-- Table structure for carryover_record
-- ----------------------------
DROP TABLE IF EXISTS `carryover_record`;
CREATE TABLE `carryover_record` (
  `cr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '结转记录ID',
  `cr_time` int(11) DEFAULT NULL COMMENT '操作时间',
  `cr_type` tinyint(2) DEFAULT '1' COMMENT '操作类型 1 结转 2 反结转',
  `rc_id` int(11) NOT NULL COMMENT '结转ID',
  `cr_uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `cr_remark` varchar(255) DEFAULT NULL COMMENT '结转记录备注',
  PRIMARY KEY (`cr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21992 DEFAULT CHARSET=utf8 COMMENT='结转记录表';

-- ----------------------------
-- Table structure for cart_person
-- ----------------------------
DROP TABLE IF EXISTS `cart_person`;
CREATE TABLE `cart_person` (
  `cart_user_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_uid` int(11) NOT NULL COMMENT '关联用户表id',
  `cart_username` varchar(255) NOT NULL COMMENT '关联用户表名称',
  `cart_number` varchar(255) NOT NULL COMMENT '身份证号',
  `cart_phone` varchar(35) NOT NULL COMMENT '电话号码',
  `cart_department` varchar(255) DEFAULT NULL COMMENT '部门',
  `cart_visible` int(4) DEFAULT '1' COMMENT '状态1 正常 2 删除',
  `cart_time` int(11) DEFAULT NULL COMMENT '备案时间',
  `cart_region_name` varchar(255) DEFAULT NULL COMMENT '城市名称',
  `cart_region_id` int(11) DEFAULT NULL COMMENT '城市id',
  `cart_cp_id` int(11) DEFAULT NULL COMMENT '项目id',
  PRIMARY KEY (`cart_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COMMENT='CAR-T备案人员';

-- ----------------------------
-- Table structure for cart_project
-- ----------------------------
DROP TABLE IF EXISTS `cart_project`;
CREATE TABLE `cart_project` (
  `cart_pid` int(11) NOT NULL AUTO_INCREMENT,
  `cart_pcp_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `cart_pcp_id` int(11) NOT NULL COMMENT '项目id',
  `cart_pcp_no` varchar(255) DEFAULT NULL COMMENT '项目编号',
  `cart_pcu_id` int(11) NOT NULL COMMENT '客户id',
  `cart_pcu_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `cart_ptype` int(4) DEFAULT '1' COMMENT '类型 1.取件 2.取派',
  `cart_pvisible` int(4) DEFAULT '1' COMMENT '状态 1.正常 2.删除',
  `cart_pcreate_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `cart_pcreate_uid` int(11) DEFAULT NULL COMMENT '创建人id',
  `cart_pcreate_name` varchar(255) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`cart_pid`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COMMENT='car-t项目配置表';

-- ----------------------------
-- Table structure for centre_city
-- ----------------------------
DROP TABLE IF EXISTS `centre_city`;
CREATE TABLE `centre_city` (
  `cc_id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL COMMENT '地区ID',
  `cc_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 正常 2 删除',
  `cc_type` tinyint(4) DEFAULT '0' COMMENT '1 目标城市反转为中心城市',
  `cc_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `cc_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`cc_id`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='中心城市';

-- ----------------------------
-- Table structure for change_amount_log
-- ----------------------------
DROP TABLE IF EXISTS `change_amount_log`;
CREATE TABLE `change_amount_log` (
  `cal_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cal_join_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '绑定id',
  `cal_join_type` int(1) NOT NULL DEFAULT '5' COMMENT '绑定类型1:order;2:other;3:sample',
  `cal_sub_type` int(1) NOT NULL DEFAULT '5' COMMENT '操作类型1:新增;2:修改',
  `cal_amount_ago` decimal(12,4) DEFAULT NULL COMMENT '变更前金额',
  `cal_amount_later` decimal(12,4) DEFAULT NULL COMMENT '变更后金额',
  `cal_rate_ago` decimal(10,4) DEFAULT NULL COMMENT '变更前税率',
  `cal_rate_later` decimal(10,4) DEFAULT NULL COMMENT '变更后税率',
  `cal_uid` int(11) NOT NULL COMMENT '变更人id',
  `cal_username` varchar(255) NOT NULL COMMENT '变更人名称',
  `cal_time` int(10) NOT NULL DEFAULT '0' COMMENT '变更时间',
  `cal_visible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态，1正常，0异常',
  PRIMARY KEY (`cal_id`),
  KEY `cal_join_id` (`cal_join_id`),
  KEY `cal_uid` (`cal_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=10240 DEFAULT CHARSET=utf8 COMMENT='金额变更记录';

-- ----------------------------
-- Table structure for charge
-- ----------------------------
DROP TABLE IF EXISTS `charge`;
CREATE TABLE `charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL COMMENT '订单ID',
  `holidays` varchar(50) DEFAULT NULL COMMENT '节假日取派',
  `hour` varchar(30) DEFAULT NULL COMMENT '等待时间',
  `wait_cost` varchar(100) DEFAULT NULL COMMENT '等待费',
  `transportation_cost` varchar(100) DEFAULT NULL COMMENT '超运费',
  `urgent_cost` varchar(100) DEFAULT NULL COMMENT '加急费',
  `rent_cost` varchar(100) DEFAULT NULL COMMENT '租赁费',
  `cancel_remark` varchar(150) DEFAULT NULL COMMENT '取消订单',
  `update_time_cost` varchar(150) NOT NULL DEFAULT '' COMMENT '更改取件时间',
  `refundable` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退票费金额',
  `refundable_cost` varchar(150) NOT NULL DEFAULT '' COMMENT '退票费',
  `gratis` varchar(500) DEFAULT NULL COMMENT '更改派送方式',
  `other_remark` text COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=674 DEFAULT CHARSET=utf8mb4 COMMENT='异常收费';

-- ----------------------------
-- Table structure for charge_transport
-- ----------------------------
DROP TABLE IF EXISTS `charge_transport`;
CREATE TABLE `charge_transport` (
  `ct_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单暂存记录序号',
  `ct_to_id` int(11) NOT NULL DEFAULT '0' COMMENT '暂存订单',
  `ct_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户序号',
  `ct_username` varchar(64) NOT NULL DEFAULT '' COMMENT '操作用户',
  `ct_begin_time` int(11) NOT NULL DEFAULT '0' COMMENT '暂存开始时间',
  `ct_end_time` int(11) NOT NULL DEFAULT '0' COMMENT '暂存结束时间',
  `ct_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '暂存状态 1 暂存中 2 暂存结束 0 删除',
  PRIMARY KEY (`ct_id`),
  KEY `idx_ct_to_id` (`ct_to_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for check_inventory
-- ----------------------------
DROP TABLE IF EXISTS `check_inventory`;
CREATE TABLE `check_inventory` (
  `check_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '盘点id',
  `check_name` varchar(255) NOT NULL COMMENT '盘点名称',
  `ci_status` tinyint(4) NOT NULL DEFAULT '-1' COMMENT '盘点状态:-1,未开启;1开启盘点,2关闭盘点',
  `ur_uid` int(10) unsigned DEFAULT '0' COMMENT '操作人',
  `check_type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '盘点类型   2 耗材  3 资产',
  `check_time` int(11) NOT NULL DEFAULT '0' COMMENT '盘点时间',
  `sto_ids` longtext NOT NULL COMMENT '盘点资产id  用逗号分隔',
  `ci_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `ci_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ci_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `is_del` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`check_id`),
  KEY `ci_status` (`ci_status`),
  KEY `ur_uid` (`ur_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8 COMMENT='库存盘点开关表';

-- ----------------------------
-- Table structure for city_category
-- ----------------------------
DROP TABLE IF EXISTS `city_category`;
CREATE TABLE `city_category` (
  `ccg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `ccg_region_id` int(11) NOT NULL COMMENT '目标地区id',
  `cc_id` int(11) NOT NULL COMMENT '中心城市id',
  `ccg_category` smallint(2) DEFAULT NULL COMMENT '城市类别 参考globaltype  ',
  `ccg_distance` int(5) DEFAULT '0' COMMENT '距离',
  `ccg_timelimit` smallint(2) DEFAULT NULL COMMENT '时效 参考globaltype  运送时限',
  `ccg_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ccg_status` tinyint(2) DEFAULT '1' COMMENT '1 正常 2 删除',
  `ccg_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `ccg_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `start_region_id` int(11) DEFAULT NULL COMMENT '开始城市ID',
  `start_region_name` varchar(255) DEFAULT NULL COMMENT '开始城市名称',
  `stop_region_id` int(10) DEFAULT NULL COMMENT '到达城市ID',
  `stop_region_name` varchar(255) DEFAULT NULL COMMENT '到达城市名称',
  PRIMARY KEY (`ccg_id`),
  KEY `ccg_region_id` (`ccg_region_id`),
  KEY `cc_id` (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2046 DEFAULT CHARSET=utf8 COMMENT='城市分类';

-- ----------------------------
-- Table structure for claim_management
-- ----------------------------
DROP TABLE IF EXISTS `claim_management`;
CREATE TABLE `claim_management` (
  `cm_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cm_no` varchar(255) DEFAULT NULL COMMENT '理赔编号',
  `to_id` int(11) DEFAULT NULL COMMENT '订单id',
  `to_no` int(11) DEFAULT NULL COMMENT '运输单号 ',
  `io_no` varchar(32) DEFAULT NULL COMMENT '出入库单号',
  `io_id` int(11) DEFAULT NULL COMMENT '出入库id',
  `yc_id` varchar(255) DEFAULT NULL COMMENT '异常id',
  `yc_no` varchar(255) DEFAULT NULL COMMENT '异常编号',
  `cu_id` int(11) DEFAULT NULL COMMENT '客户id',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `cm_sort` int(11) DEFAULT NULL COMMENT '分类 1重大 2 微小',
  `cm_status` int(11) DEFAULT '1' COMMENT '状态 1新建 2已执行 3已关闭',
  `claim_method` int(11) DEFAULT NULL COMMENT '理赔方式 1现金赔偿 2运费赔偿 3保险赔偿',
  `cm_remark` varchar(255) DEFAULT NULL COMMENT '理赔描述',
  `finance_remark` varchar(255) DEFAULT NULL COMMENT '财务确认备注',
  `claim_execution_remark` varchar(255) DEFAULT NULL COMMENT '理赔执行备注',
  `cm_create_uid` int(11) DEFAULT NULL COMMENT '创建人id',
  `cm_create_username` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `cm_create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `cm_lastupdatime` int(11) DEFAULT NULL COMMENT '修改时间',
  `cm_visible` tinyint(1) DEFAULT '1' COMMENT '状态 1正常 0删除',
  PRIMARY KEY (`cm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='理赔管理表';

-- ----------------------------
-- Table structure for clinic_sup_chain_target
-- ----------------------------
DROP TABLE IF EXISTS `clinic_sup_chain_target`;
CREATE TABLE `clinic_sup_chain_target` (
  `id` int(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `sale_year` tinyint(4) NOT NULL COMMENT '销售年度',
  `ar_name` varchar(30) NOT NULL COMMENT '大区名称',
  `ar_id` tinyint(1) NOT NULL COMMENT '大区ID',
  `sale_year_target` int(11) NOT NULL COMMENT '年度总销售指标',
  `clinic_sup_chain_q1_target` int(11) NOT NULL COMMENT '临床供应链一季度目标',
  `clinic_sup_chain_q2_target` int(11) NOT NULL COMMENT '临床供应链二季度目标',
  `clinic_sup_chain_q3_target` int(11) NOT NULL COMMENT '临床供应链三季度目标',
  `clinic_sup_chain_q4_target` int(11) NOT NULL COMMENT '临床供应链四季度目标',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '最后一次更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='临床供应链收入目标';

-- ----------------------------
-- Table structure for cold_storage_equipment
-- ----------------------------
DROP TABLE IF EXISTS `cold_storage_equipment`;
CREATE TABLE `cold_storage_equipment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL,
  `subwarehouse` varchar(255) DEFAULT NULL,
  `warehouse` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for com_company
-- ----------------------------
DROP TABLE IF EXISTS `com_company`;
CREATE TABLE `com_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_name` varchar(60) DEFAULT '' COMMENT '企业名称',
  `company_abb` varchar(100) DEFAULT NULL COMMENT '公司简称',
  `tax_number` varchar(30) DEFAULT '' COMMENT '税务号',
  `city` varchar(255) DEFAULT '' COMMENT '城市',
  `billing_type` varchar(20) DEFAULT '' COMMENT '开票类型',
  `bank_name` varchar(60) DEFAULT '' COMMENT '开户银行',
  `bank_num` varchar(50) DEFAULT '' COMMENT '银行账号',
  `company_address` varchar(60) DEFAULT '' COMMENT '公司地址',
  `phone` char(11) DEFAULT '' COMMENT '电话号',
  `creat_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `creat_name` char(32) DEFAULT '' COMMENT '创建人',
  `last_update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  `last_update_name` char(32) DEFAULT '' COMMENT '修改人',
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 0正常  1删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for company_group
-- ----------------------------
DROP TABLE IF EXISTS `company_group`;
CREATE TABLE `company_group` (
  `cg_id` int(10) NOT NULL AUTO_INCREMENT,
  `cg_name` varchar(225) NOT NULL COMMENT '集团名称',
  `cg_number` varchar(225) NOT NULL COMMENT '编号',
  `cg_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `cg_status` tinyint(2) DEFAULT '1' COMMENT '1正常2删除',
  `cg_createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `cg_lastuptime` int(10) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`cg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='集团';

-- ----------------------------
-- Table structure for connection_alert_contents
-- ----------------------------
DROP TABLE IF EXISTS `connection_alert_contents`;
CREATE TABLE `connection_alert_contents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connection_id` int(11) NOT NULL DEFAULT '0',
  `alert_content_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_open` tinyint(1) DEFAULT '1',
  `is_read` tinyint(1) DEFAULT '0',
  `end_time` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `remark` text,
  `current_threshold_value` int(11) DEFAULT '0',
  `severity` int(11) DEFAULT '1',
  `manual_close_time` timestamp NULL DEFAULT NULL,
  `current_return_value` double DEFAULT '0',
  `current_alert_direction` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_connection_alert_contents_on_alert_content_id` (`alert_content_id`),
  KEY `idx_connection_alert_contents_on_connection_id_alert_content_id` (`connection_id`,`alert_content_id`),
  KEY `idx_connection_alert_contents_on_created_at` (`created_at`),
  KEY `idx_connection_alert_contents_on_end_time_connection_id` (`end_time`,`connection_id`),
  KEY `idx_alert_contents_on_is_open_connection_id_severity_created_at` (`is_open`,`connection_id`,`severity`,`created_at`),
  KEY `idx_connection_alert_contents_on_is_open_created_at` (`is_open`,`created_at`),
  KEY `idx_alert_contents_on_is_open_connection_id_created_at` (`is_open`,`connection_id`,`created_at`),
  KEY `idx_connection_alert_contents_on_is_open_user_id` (`is_open`,`user_id`),
  KEY `idx_connection_alert_contents_on_user_id` (`user_id`),
  KEY `idx_connection_alert_contents_on_is_open_severity_created_at` (`is_open`,`severity`,`created_at`),
  KEY `idx_connection_alert_contents_on_is_read_is_open` (`is_read`,`is_open`),
  KEY `idx_connection_alert_contents_on_is_open_alert_content_id` (`is_open`,`alert_content_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for connection_alert_settings
-- ----------------------------
DROP TABLE IF EXISTS `connection_alert_settings`;
CREATE TABLE `connection_alert_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `connection_id` int(11) NOT NULL,
  `alert_inherit_parent` tinyint(1) NOT NULL DEFAULT '0',
  `alert_type` int(11) NOT NULL DEFAULT '0',
  `alert_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_direction` tinyint(1) NOT NULL DEFAULT '0',
  `alert_warn_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_warn_threshold` int(11) NOT NULL DEFAULT '0',
  `alert_critical_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_critical_threshold` int(11) NOT NULL DEFAULT '0',
  `alert_length_minute` int(11) NOT NULL DEFAULT '0',
  `alert_sent_when_raise` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_when_end` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_via_email` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_via_sms` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_via_snmp` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_to_user_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_to_all` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_to_roles` varchar(255) NOT NULL DEFAULT '[]',
  `alert_sent_alternative_email` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_to_emails` varchar(255) DEFAULT NULL,
  `alert_sent_via_slack` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_connection_alert_settings_on_connection_id__alert_type` (`connection_id`,`alert_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for connection_groups
-- ----------------------------
DROP TABLE IF EXISTS `connection_groups`;
CREATE TABLE `connection_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_connection_groups_on_group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for connections
-- ----------------------------
DROP TABLE IF EXISTS `connections`;
CREATE TABLE `connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conn_name` varchar(255) NOT NULL,
  `conn_ip` varchar(255) NOT NULL DEFAULT 'localhost',
  `conn_username` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conn_state` tinyint(1) NOT NULL DEFAULT '1',
  `conn_port` int(11) NOT NULL DEFAULT '0',
  `conn_encrypted_pass` varchar(255) NOT NULL,
  `conn_type` varchar(255) NOT NULL,
  `connection_group_id` int(11) NOT NULL,
  `conn_os` varchar(255) NOT NULL DEFAULT '',
  `os_family` varchar(255) NOT NULL,
  `conn_suspend` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(255) NOT NULL DEFAULT '',
  `gateway_is_ssh` tinyint(1) NOT NULL DEFAULT '0',
  `gateway_ssh_ip` varchar(255) NOT NULL,
  `gateway_ssh_port` int(11) NOT NULL,
  `gateway_ssh_username` varchar(255) NOT NULL,
  `gateway_ssh_auth_method` int(11) NOT NULL DEFAULT '1',
  `gateway_ssh_encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `gateway_ssh_private_key_path` varchar(255) NOT NULL,
  `gateway_ssh_encrypted_passphrase` varchar(255) NOT NULL DEFAULT '',
  `cpu_is_ssh` tinyint(1) NOT NULL DEFAULT '0',
  `cpu_ssh_port` int(11) NOT NULL,
  `cpu_ssh_username` varchar(255) NOT NULL,
  `cpu_ssh_auth_method` int(11) NOT NULL DEFAULT '1',
  `cpu_ssh_encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `cpu_ssh_private_key_path` varchar(255) NOT NULL,
  `cpu_ssh_encrypted_passphrase` varchar(255) NOT NULL DEFAULT '',
  `cpu_community` varchar(255) NOT NULL,
  `suspend_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_connections_on_conn_name` (`conn_name`),
  KEY `idx_connection_on_conn_ip` (`conn_ip`),
  KEY `idx_connection_on_connection_group_id` (`connection_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for consignee
-- ----------------------------
DROP TABLE IF EXISTS `consignee`;
CREATE TABLE `consignee` (
  `con_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则序号',
  `con_type` char(32) DEFAULT '' COMMENT '"收货类型 (航空收货,耗材收货)"',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `con_create_username` char(255) DEFAULT NULL COMMENT '创建者姓名',
  `con_ur_uid` int(11) unsigned DEFAULT NULL COMMENT '创建人ID',
  `con_username` char(32) DEFAULT '' COMMENT '收货人姓名',
  `con_phone` char(128) DEFAULT '' COMMENT '收货人电话',
  `con_address` varchar(128) DEFAULT NULL COMMENT '收货人地址',
  `con_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `con_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `con_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `child_region_id` int(11) DEFAULT NULL COMMENT '县级id',
  `child_region_name` varchar(255) DEFAULT NULL COMMENT '县级城市名称',
  `retrieve_time` date DEFAULT NULL COMMENT '回收日期',
  PRIMARY KEY (`con_id`),
  KEY `con_region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8 COMMENT='oms收货人菜单';

-- ----------------------------
-- Table structure for consumables_charge
-- ----------------------------
DROP TABLE IF EXISTS `consumables_charge`;
CREATE TABLE `consumables_charge` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `identifier` int(11) unsigned NOT NULL COMMENT '(出库id)或(调拨id)',
  `cc_no` varchar(25) DEFAULT NULL COMMENT '出库/入库编号',
  `type` int(1) unsigned NOT NULL COMMENT '结算类型 1 销售 2 外借',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_uid` int(11) unsigned NOT NULL COMMENT '创建人',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `confirm_time` int(10) DEFAULT NULL COMMENT '结算时间',
  `ots_id` int(11) unsigned DEFAULT NULL COMMENT '结算id',
  `visible` int(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-显示 2-删除',
  `cu_id` int(11) DEFAULT NULL COMMENT '外借客户id',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '外借客户名称',
  `em_name` varchar(255) DEFAULT NULL COMMENT '销售人员姓名',
  `emc_name` varchar(255) DEFAULT NULL COMMENT '结算人员姓名',
  `cc_status` int(2) DEFAULT NULL COMMENT '耗材归还状态  1.未归还 2 已归还',
  PRIMARY KEY (`id`),
  KEY `io_id` (`identifier`),
  KEY `type` (`type`),
  KEY `ots_id` (`ots_id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COMMENT='耗材结算表';

-- ----------------------------
-- Table structure for consumables_charge_detail
-- ----------------------------
DROP TABLE IF EXISTS `consumables_charge_detail`;
CREATE TABLE `consumables_charge_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `cc_id` int(11) unsigned NOT NULL COMMENT '耗材结算序号',
  `sto_id` int(11) unsigned NOT NULL COMMENT '存货序号',
  `sto_no` varchar(60) DEFAULT NULL COMMENT '存货编号',
  `sto_name` varchar(60) NOT NULL COMMENT '存货名称',
  `id_stock_detail` varchar(60) NOT NULL COMMENT '存货明细编号',
  `status` int(1) NOT NULL COMMENT '归还状态1未归还2已归还',
  `outtime` int(10) unsigned DEFAULT NULL COMMENT '出时间',
  `backtime` int(10) unsigned DEFAULT NULL COMMENT '归时间',
  `gd_id` int(11) DEFAULT NULL COMMENT '物资ID',
  `gd_series_number` longtext COMMENT '序列号',
  PRIMARY KEY (`id`),
  KEY `cc_id` (`cc_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8 COMMENT='耗材结算表详细表';

-- ----------------------------
-- Table structure for contact
-- ----------------------------
DROP TABLE IF EXISTS `contact`;
CREATE TABLE `contact` (
  `co_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '联系人序号',
  `co_type` tinyint(4) unsigned DEFAULT '0' COMMENT '类型:1外协,2一般供应商,3承运商,4客户',
  `co_category` tinyint(3) DEFAULT '0' COMMENT '联系人类型    0 无类型    1 对账人     2 项目联系人   3对账人加项目联系人',
  `co_identifier` int(11) unsigned DEFAULT '0' COMMENT '所属标识，如：客户序号、供应商序号等',
  `co_name` char(32) DEFAULT '' COMMENT '真实姓名',
  `co_email` char(32) DEFAULT '' COMMENT '邮箱',
  `co_birth` date DEFAULT '0000-00-00' COMMENT '生日',
  `co_sex` tinyint(4) unsigned DEFAULT '0' COMMENT '性别 0：男，1：女',
  `co_mobile_phone` char(32) DEFAULT '' COMMENT '手机号码',
  `co_contact_tel` char(16) DEFAULT '' COMMENT '联系电话',
  `co_fax` char(16) DEFAULT '' COMMENT '传真',
  `co_qq` char(16) DEFAULT '' COMMENT 'QQ号码',
  `co_zipcode` char(16) DEFAULT '' COMMENT '邮编',
  `co_weixin` char(32) DEFAULT '' COMMENT '微信',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '所在地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `co_address` char(128) DEFAULT '' COMMENT '详细地址',
  `co_status` tinyint(4) unsigned DEFAULT '0' COMMENT '联系人状态 0启用，1禁用',
  `co_remark` varchar(1024) DEFAULT NULL COMMENT '联系人备注',
  `po_name` char(32) DEFAULT '' COMMENT '职位',
  `co_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `co_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `co_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `is_contact` tinyint(1) NOT NULL DEFAULT '1' COMMENT '客户是否同时是联系人',
  `co_uid` int(10) DEFAULT '0' COMMENT '用户id',
  `relation_status` tinyint(4) DEFAULT '0' COMMENT '关联状态 0待确认 1 已确认 2 锁定',
  `co_bankcard` varchar(50) DEFAULT NULL COMMENT '银行卡号',
  `co_openbank` varchar(35) DEFAULT NULL COMMENT '开户行',
  `co_carnumber` varchar(20) DEFAULT NULL COMMENT '车牌号',
  `co_car` varchar(255) DEFAULT NULL COMMENT '车辆信息',
  `co_equipment` varchar(20) DEFAULT NULL COMMENT '已有设备',
  `co_equipment_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `at_id` varchar(30) DEFAULT NULL COMMENT '合同附件',
  `child_region_id` int(11) DEFAULT NULL COMMENT '城市子级id',
  `child_region_name` varchar(255) DEFAULT NULL COMMENT '城市子级名称',
  `co_accountname` varchar(30) DEFAULT NULL COMMENT '户名',
  `co_emergency_contact` varchar(155) DEFAULT NULL COMMENT '紧急联系人方式',
  `co_card` varchar(100) DEFAULT NULL COMMENT '身份证号码',
  `co_contype` varchar(255) DEFAULT NULL COMMENT '路由收货类型',
  `co_stop_remark` varchar(150) NOT NULL DEFAULT '' COMMENT '停用备注',
  `co_stop_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '停用时间',
  PRIMARY KEY (`co_id`),
  KEY `co_type_identifier` (`co_type`,`co_identifier`),
  KEY `cc` (`co_identifier`),
  KEY `index_co_uid` (`co_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=215097 DEFAULT CHARSET=utf8 COMMENT='联系人表';

-- ----------------------------
-- Table structure for contact_risk_extend
-- ----------------------------
DROP TABLE IF EXISTS `contact_risk_extend`;
CREATE TABLE `contact_risk_extend` (
  `cre_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `co_id` int(11) unsigned NOT NULL COMMENT '关联co_id',
  `cre_tag_new` tinyint(1) DEFAULT '0' COMMENT '新增外协标签, 1标记，0未标记',
  `cre_tag_risk` tinyint(1) DEFAULT '0' COMMENT '风险外协标签, 1标记，0未标记',
  `cre_tag_new_time` int(11) DEFAULT '0' COMMENT '创建标签时间',
  `cre_tag_risk_time` int(11) DEFAULT '0' COMMENT '创建标签时间',
  `cre_create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `cre_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  PRIMARY KEY (`cre_id`),
  KEY `idx_co_id` (`co_id`),
  KEY `idx_tag_new` (`cre_tag_new`),
  KEY `idx_tag_risk` (`cre_tag_risk`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='外协风险类型扩展表';

-- ----------------------------
-- Table structure for control_inventory_log
-- ----------------------------
DROP TABLE IF EXISTS `control_inventory_log`;
CREATE TABLE `control_inventory_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(32) DEFAULT NULL COMMENT '操作  1:微信端操作  2:客户端操作  3:后台oms操作 4:客户端CRA',
  `subtype` varchar(32) DEFAULT NULL COMMENT '方式 1:解锁 2:加锁',
  `url` varchar(100) DEFAULT NULL COMMENT '控制器/方法',
  `service_url` varchar(100) DEFAULT NULL COMMENT 'service/方法',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `wa_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `to_id` varchar(32) DEFAULT NULL COMMENT '订单ID',
  `rl_remark` longtext COMMENT '备注内容',
  `server_type` tinyint(2) DEFAULT NULL COMMENT '操作端口 1:客户端 2:微信端 3:后台oms',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=573 DEFAULT CHARSET=utf8mb4 COMMENT='库存数据操作记录表';

-- ----------------------------
-- Table structure for copy_of_jzt_scattered_offer
-- ----------------------------
DROP TABLE IF EXISTS `copy_of_jzt_scattered_offer`;
CREATE TABLE `copy_of_jzt_scattered_offer` (
  `jso_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '零担报价自增id',
  `jso_temp_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '温控类型 1常温,2控温',
  `start_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '开始城市ID',
  `start_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开始城市名称',
  `stop_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '目标城市ID',
  `stop_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '目标城市名称',
  `jso_pick_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提货费/单',
  `jso_delivery_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '送货费/单',
  `jso_unit_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费/公斤',
  `jso_minimum_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低运费',
  `jso_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1删除',
  `jso_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `jso_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `jso_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jso_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jso_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `jso_lastupd_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jso_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '最后更新时间',
  PRIMARY KEY (`jso_id`),
  KEY `idx_start_region_id` (`start_region_id`),
  KEY `idx_stop_region_id` (`stop_region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='九州通零担报价';

-- ----------------------------
-- Table structure for cost_item_config
-- ----------------------------
DROP TABLE IF EXISTS `cost_item_config`;
CREATE TABLE `cost_item_config` (
  `cic_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '费用项配置主键',
  `routing_type` int(4) NOT NULL DEFAULT '0' COMMENT '路由类型 1铁路 2航空 3大巴 4快递',
  `cost_type` int(4) NOT NULL DEFAULT '0' COMMENT '成本类型 1发货 2提货',
  `cost_item` varchar(50) NOT NULL DEFAULT '' COMMENT '成本费用项',
  `cost_item_rate` decimal(4,2) NOT NULL DEFAULT '0.00' COMMENT '费用项税率',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`cic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='基础费用项配置';

-- ----------------------------
-- Table structure for custcont_project
-- ----------------------------
DROP TABLE IF EXISTS `custcont_project`;
CREATE TABLE `custcont_project` (
  `cp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '联系人项目关联表ID',
  `co_id` int(11) NOT NULL COMMENT '联系人ID',
  `cp_cp_id` int(10) NOT NULL COMMENT '客户项目ID',
  `cp_co_category` tinyint(1) NOT NULL DEFAULT '0' COMMENT '联系人类型',
  `cp_co_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人备注',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  `lastupdtime` int(10) DEFAULT NULL COMMENT '最后更新时间',
  `visible` tinyint(1) DEFAULT '1' COMMENT '状态，1 整除 2 删除',
  `create_uid` int(11) NOT NULL COMMENT '创建用户序号',
  `create_name` char(32) NOT NULL COMMENT '创建用户姓名',
  PRIMARY KEY (`cp_id`),
  KEY `co_id` (`co_id`),
  KEY `cp_cp_id` (`cp_cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120737 DEFAULT CHARSET=utf8 COMMENT='项目管理员表';

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cu_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户序号',
  `cu_no` char(32) DEFAULT '' COMMENT '客户编号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `cu_tel` char(16) DEFAULT '' COMMENT '客户电话',
  `cu_fax` char(20) DEFAULT '' COMMENT '客户传真',
  `cu_url` char(128) DEFAULT NULL COMMENT '客户网址',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `cu_add` char(128) DEFAULT '' COMMENT '客户地址',
  `manage_region_id` int(11) DEFAULT NULL COMMENT '管辖城市id',
  `cu_lat` varchar(15) DEFAULT NULL COMMENT '百度坐标',
  `cu_lng` varchar(15) DEFAULT NULL COMMENT '百度坐标',
  `ct_id` smallint(6) unsigned DEFAULT '0' COMMENT '行业类型',
  `cu_maysize` tinyint(4) unsigned DEFAULT '0' COMMENT '潜在规模 0 超0万 1 超1万 2 超5万 3 超20万 4 超50万',
  `cu_nowsize` tinyint(4) unsigned DEFAULT '0' COMMENT '合作规模 0 超0万 1 超1万 2 超5万 3 超20万 4 超50万',
  `em_id` int(11) unsigned DEFAULT NULL COMMENT '客户发展业务员员工序号',
  `em_name` char(32) DEFAULT '' COMMENT '客户发展业务员员工姓名',
  `cu_relation` tinyint(4) unsigned DEFAULT '0' COMMENT '客户关系 0潜在 1洽谈 2合作 3无效',
  `cu_expiretime` int(10) unsigned DEFAULT '0' COMMENT '合同到期日期',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '账户余额，单位分',
  `cu_status` tinyint(4) unsigned DEFAULT '0' COMMENT '客户状态 0启用，1禁用',
  `cu_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `cu_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cu_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `at_id` varchar(10) NOT NULL DEFAULT '' COMMENT '附件ID，只保留一个',
  `cu_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `emp_id` int(11) DEFAULT NULL COMMENT '项目专员ID',
  `emp_name` char(32) DEFAULT NULL COMMENT '项目专员名称',
  `emc_id` int(11) DEFAULT NULL COMMENT '结算专员ID',
  `emc_name` char(32) DEFAULT NULL COMMENT '结算专员姓名',
  `ar_id` int(11) DEFAULT NULL COMMENT '所属大区ID',
  `is_importent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精益客户',
  `cu_feedback_type` tinyint(2) DEFAULT '1' COMMENT '是否接收自动反馈 1 接收 2 不接收',
  `cu_type` tinyint(2) DEFAULT '1' COMMENT '审核状态 1 待审核 2 已审核',
  `goods_size_type` int(1) DEFAULT '1' COMMENT '货物状态: 1-关闭，2-启用',
  `auto_rem_mess` int(1) DEFAULT '0' COMMENT '自动催款:0-开启,1-关闭',
  `cu_temperature_type` tinyint(4) DEFAULT '1' COMMENT '温度批量上传   1 开启 2 关闭',
  `cu_projectorder` tinyint(3) unsigned DEFAULT '2' COMMENT '1=客户立项 2=没有立项 3=项目立项',
  `cg_id` int(10) DEFAULT NULL COMMENT '集团id',
  `cu_level` tinyint(4) DEFAULT NULL COMMENT '客户级别 参考globaltype customer_level',
  `cu_knot_type` tinyint(4) DEFAULT NULL COMMENT '结算类型 参考globaltype knot_type',
  `cu_sign_feedback` tinyint(4) DEFAULT '1' COMMENT '代签短信提醒  1开启 2关闭',
  `cu_piece_feedback` tinyint(4) DEFAULT '2' COMMENT '签收自动反馈 1开启 2关闭',
  `cu_temperature_feedback` tinyint(4) DEFAULT '2' COMMENT '温度自动反馈 1开启 2关闭',
  `cu_class` tinyint(1) DEFAULT '0' COMMENT '是否开启部门选择',
  `cu_upload` tinyint(1) DEFAULT '0' COMMENT '交接单据上传配置 0:关闭，1：开启',
  `cu_hospital` tinyint(1) DEFAULT '0' COMMENT 'CRA、CRC下单，发件地址绑定医院地址 0:关闭，1：开启',
  `cu_goods_print` tinyint(1) unsigned DEFAULT '0' COMMENT '打印运单时将货物名称打印在运单上',
  `cu_take_contact` tinyint(1) unsigned DEFAULT NULL COMMENT '推送取件人联系方式',
  `cu_take_email` tinyint(1) DEFAULT NULL COMMENT '抄送邮件',
  `cu_template` tinyint(1) DEFAULT '0' COMMENT '客户配置使用中文模板 0：默认不使用  1；使用',
  `cu_upload_print` tinyint(1) DEFAULT '0' COMMENT '客户端上传excel批量打印运单  0：关闭 1：使用',
  `cu_doc_audit` tinyint(3) unsigned DEFAULT '0' COMMENT 'CRA 上传交接单据，药品管理员审核  0不用审核  1需要审核',
  `cu_send_message` tinyint(3) unsigned DEFAULT '1' COMMENT '是否发送取派短信 1发送 0不发送',
  `cu_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `cu_center_manage` tinyint(3) unsigned DEFAULT '0' COMMENT '是否勾选中心管理 1是 0否',
  `cu_configure_center` tinyint(3) unsigned DEFAULT '0' COMMENT '可配置试验中心  1可以配置 0不可配置',
  `receive_unit_match` tinyint(3) unsigned DEFAULT '0' COMMENT '0否 1是',
  `receive_unit_match_key` varchar(100) DEFAULT NULL COMMENT '收件单位匹配关键字',
  `cu_print_express_remark` tinyint(3) unsigned DEFAULT '0' COMMENT '客户单号打印到运单备注',
  `cu_customer_no` tinyint(1) DEFAULT '0' COMMENT '下单可填写客户单号  0：否  1：是',
  `cu_tengsen_trmperature` tinyint(1) DEFAULT '2' COMMENT '不支持批量上传滕森温度数据  1 不支持   2 支持  ',
  `cu_create_account_email` tinyint(1) DEFAULT '0' COMMENT '开通账号发送通知邮件  1 发送  0 不发送 ',
  `cu_bind_project_email` tinyint(1) DEFAULT '0' COMMENT '绑定项目发送通知邮件  1 发送  0 不发送  ',
  `cu_debit` tinyint(1) DEFAULT '0' COMMENT '欠款客户  0不是   1是',
  `stock_warning_sms` tinyint(1) DEFAULT '0' COMMENT '库存预警短信推送 1 发送  0 不发送',
  `cma_id` int(11) DEFAULT NULL COMMENT '销售助理ID',
  `cma_name` char(32) DEFAULT NULL COMMENT '销售助理姓名',
  `feedback_type` varchar(255) DEFAULT NULL,
  `cu_create_username` char(32) DEFAULT NULL COMMENT '客户创建人',
  `cu_create_uid` int(11) DEFAULT NULL COMMENT '客户创建人ID',
  `drug_customer_config` tinyint(4) DEFAULT '1' COMMENT '客户选药配置  1关闭 2开启',
  `cu_important` char(12) DEFAULT NULL COMMENT '客户重要性',
  `cu_grade` tinyint(4) DEFAULT NULL COMMENT '客户重要等级',
  `cu_segment` tinyint(4) DEFAULT '0' COMMENT '业务板块',
  `wechat_drug_customer_config` tinyint(4) DEFAULT '1' COMMENT '微信客户选药配置  1关闭 2开启',
  PRIMARY KEY (`cu_id`) USING BTREE,
  UNIQUE KEY `cu_no` (`cu_no`) USING BTREE,
  KEY `cu_name` (`cu_name`) USING BTREE,
  KEY `region_id` (`region_id`) USING BTREE,
  KEY `ct_id` (`ct_id`) USING BTREE,
  KEY `em_id` (`em_id`) USING BTREE,
  KEY `cu_expiretime` (`cu_expiretime`) USING BTREE,
  KEY `cu_id` (`cu_id`) USING BTREE,
  KEY `manage_region_id` (`manage_region_id`) USING BTREE,
  KEY `cu_auto_lastupdtime` (`cu_auto_lastupdtime`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2019005649 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客户表';

-- ----------------------------
-- Table structure for customer_0518
-- ----------------------------
DROP TABLE IF EXISTS `customer_0518`;
CREATE TABLE `customer_0518` (
  `cu_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户序号',
  `cu_no` char(32) DEFAULT '' COMMENT '客户编号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `cu_tel` char(16) DEFAULT '' COMMENT '客户电话',
  `cu_fax` char(20) DEFAULT '' COMMENT '客户传真',
  `cu_url` char(128) DEFAULT NULL COMMENT '客户网址',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `cu_add` char(128) DEFAULT '' COMMENT '客户地址',
  `manage_region_id` int(11) DEFAULT NULL COMMENT '管辖城市id',
  `cu_lat` varchar(15) DEFAULT NULL COMMENT '百度坐标',
  `cu_lng` varchar(15) DEFAULT NULL COMMENT '百度坐标',
  `ct_id` smallint(6) unsigned DEFAULT '0' COMMENT '行业类型',
  `cu_maysize` tinyint(4) unsigned DEFAULT '0' COMMENT '潜在规模 0 超0万 1 超1万 2 超5万 3 超20万 4 超50万',
  `cu_nowsize` tinyint(4) unsigned DEFAULT '0' COMMENT '合作规模 0 超0万 1 超1万 2 超5万 3 超20万 4 超50万',
  `em_id` int(11) unsigned DEFAULT NULL COMMENT '客户发展业务员员工序号',
  `em_name` char(32) DEFAULT '' COMMENT '客户发展业务员员工姓名',
  `cu_relation` tinyint(4) unsigned DEFAULT '0' COMMENT '客户关系 0潜在 1洽谈 2合作 3无效',
  `cu_expiretime` int(10) unsigned DEFAULT '0' COMMENT '合同到期日期',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '账户余额，单位分',
  `cu_status` tinyint(4) unsigned DEFAULT '0' COMMENT '客户状态 0启用，1禁用',
  `cu_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `cu_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cu_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `at_id` varchar(10) NOT NULL DEFAULT '' COMMENT '附件ID，只保留一个',
  `cu_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `emp_id` int(11) DEFAULT NULL COMMENT '项目专员ID',
  `emp_name` char(32) DEFAULT NULL COMMENT '项目专员名称',
  `emc_id` int(11) DEFAULT NULL COMMENT '结算专员ID',
  `emc_name` char(32) DEFAULT NULL COMMENT '结算专员姓名',
  `ar_id` int(11) DEFAULT NULL COMMENT '所属大区ID',
  `is_importent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精益客户',
  `cu_feedback_type` tinyint(2) DEFAULT '1' COMMENT '是否接收自动反馈 1 接收 2 不接收',
  `cu_type` tinyint(2) DEFAULT '1' COMMENT '审核状态 1 待审核 2 已审核',
  `goods_size_type` int(1) DEFAULT '1' COMMENT '货物状态: 1-关闭，2-启用',
  `auto_rem_mess` int(1) DEFAULT '0' COMMENT '自动催款:0-开启,1-关闭',
  `cu_temperature_type` tinyint(4) DEFAULT '1' COMMENT '温度批量上传   1 开启 2 关闭',
  `cu_projectorder` tinyint(3) unsigned DEFAULT '2' COMMENT '1=客户立项 2=没有立项 3=项目立项',
  `cg_id` int(10) DEFAULT NULL COMMENT '集团id',
  `cu_level` tinyint(4) DEFAULT NULL COMMENT '客户级别 参考globaltype customer_level',
  `cu_knot_type` tinyint(4) DEFAULT NULL COMMENT '结算类型 参考globaltype knot_type',
  `cu_sign_feedback` tinyint(4) DEFAULT '1' COMMENT '代签短信提醒  1开启 2关闭',
  `cu_piece_feedback` tinyint(4) DEFAULT '2' COMMENT '签收自动反馈 1开启 2关闭',
  `cu_temperature_feedback` tinyint(4) DEFAULT '2' COMMENT '温度自动反馈 1开启 2关闭',
  `cu_class` tinyint(1) DEFAULT '0' COMMENT '是否开启部门选择',
  `cu_upload` tinyint(1) DEFAULT '0' COMMENT '交接单据上传配置 0:关闭，1：开启',
  `cu_hospital` tinyint(1) DEFAULT '0' COMMENT 'CRA、CRC下单，发件地址绑定医院地址 0:关闭，1：开启',
  `cu_goods_print` tinyint(1) unsigned DEFAULT '0' COMMENT '打印运单时将货物名称打印在运单上',
  `cu_take_contact` tinyint(1) unsigned DEFAULT NULL COMMENT '推送取件人联系方式',
  `cu_take_email` tinyint(1) DEFAULT NULL COMMENT '抄送邮件',
  `cu_template` tinyint(1) DEFAULT '0' COMMENT '客户配置使用中文模板 0：默认不使用  1；使用',
  `cu_upload_print` tinyint(1) DEFAULT '0' COMMENT '客户端上传excel批量打印运单  0：关闭 1：使用',
  `cu_doc_audit` tinyint(3) unsigned DEFAULT '0' COMMENT 'CRA 上传交接单据，药品管理员审核  0不用审核  1需要审核',
  `cu_send_message` tinyint(3) unsigned DEFAULT '1' COMMENT '是否发送取派短信 1发送 0不发送',
  `cu_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `cu_center_manage` tinyint(3) unsigned DEFAULT '0' COMMENT '是否勾选中心管理 1是 0否',
  `cu_configure_center` tinyint(3) unsigned DEFAULT '0' COMMENT '可配置试验中心  1可以配置 0不可配置',
  `receive_unit_match` tinyint(3) unsigned DEFAULT '0' COMMENT '0否 1是',
  `receive_unit_match_key` varchar(100) DEFAULT NULL COMMENT '收件单位匹配关键字',
  `cu_print_express_remark` tinyint(3) unsigned DEFAULT '0' COMMENT '客户单号打印到运单备注',
  `cu_customer_no` tinyint(1) DEFAULT '0' COMMENT '下单可填写客户单号  0：否  1：是',
  `cu_tengsen_trmperature` tinyint(1) DEFAULT '2' COMMENT '不支持批量上传滕森温度数据  1 不支持   2 支持  ',
  `cu_create_account_email` tinyint(1) DEFAULT '0' COMMENT '开通账号发送通知邮件  1 发送  0 不发送 ',
  `cu_bind_project_email` tinyint(1) DEFAULT '0' COMMENT '绑定项目发送通知邮件  1 发送  0 不发送  ',
  `cu_debit` tinyint(1) DEFAULT '0' COMMENT '欠款客户  0不是   1是',
  `stock_warning_sms` tinyint(1) DEFAULT '0' COMMENT '库存预警短信推送 1 发送  0 不发送',
  `cma_id` int(11) DEFAULT NULL COMMENT '销售助理ID',
  `cma_name` char(32) DEFAULT NULL COMMENT '销售助理姓名',
  `feedback_type` varchar(255) DEFAULT NULL,
  `cu_create_username` char(32) DEFAULT NULL COMMENT '客户创建人',
  `cu_create_uid` int(11) DEFAULT NULL COMMENT '客户创建人ID',
  `drug_customer_config` tinyint(4) DEFAULT '1' COMMENT '客户选药配置  1关闭 2开启',
  `cu_important` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户重要性',
  `cu_grade` tinyint(4) DEFAULT NULL COMMENT '客户重要等级',
  `cu_segment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '业务板块',
  `wechat_drug_customer_config` tinyint(4) DEFAULT '1' COMMENT '微信客户选药配置  1关闭 2开启',
  PRIMARY KEY (`cu_id`),
  UNIQUE KEY `cu_no` (`cu_no`),
  KEY `cu_name` (`cu_name`),
  KEY `region_id` (`region_id`),
  KEY `ct_id` (`ct_id`),
  KEY `em_id` (`em_id`),
  KEY `cu_expiretime` (`cu_expiretime`),
  KEY `cu_id` (`cu_id`),
  KEY `manage_region_id` (`manage_region_id`),
  KEY `cu_auto_lastupdtime` (`cu_auto_lastupdtime`),
  KEY `idx_segment` (`cu_segment`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2019005694 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Table structure for customer_address
-- ----------------------------
DROP TABLE IF EXISTS `customer_address`;
CREATE TABLE `customer_address` (
  `ca_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户地址序号',
  `openid` char(128) NOT NULL DEFAULT '0' COMMENT '微信 openid',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '城市ID',
  `region_name` char(128) DEFAULT '' COMMENT '城市名',
  `address` char(128) DEFAULT '' COMMENT '详细地址',
  `co_name` char(128) DEFAULT '' COMMENT '客户联系人',
  `cu_name` char(128) DEFAULT '' COMMENT '客户名称',
  `mobile_phone` char(128) DEFAULT '' COMMENT '手机号码',
  `address_type` tinyint(1) unsigned DEFAULT '1' COMMENT '地址类型 1--发件，2--收件',
  `ca_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ca_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `cu_id` int(11) DEFAULT NULL COMMENT '客户id',
  `cp_id` int(11) DEFAULT NULL COMMENT '项目id',
  `cp_name` varchar(128) DEFAULT NULL COMMENT '项目名称',
  `ca_status` tinyint(2) DEFAULT '1' COMMENT '1正常2删除',
  `ca_source` tinyint(2) DEFAULT '1' COMMENT '1个人地址 2后台添加',
  `child_region_id` int(11) DEFAULT NULL COMMENT '县级市ID',
  `child_region_name` varchar(255) DEFAULT NULL COMMENT '县级市名称',
  `center_number` varchar(30) DEFAULT NULL COMMENT '中心编号',
  `ccp_true` int(2) NOT NULL DEFAULT '0' COMMENT '是否冷藏车派送  0否 1是',
  `sh_remark` varchar(255) DEFAULT NULL COMMENT '收货备注',
  `hospital` int(11) DEFAULT NULL,
  `drug_type` tinyint(1) unsigned zerofill DEFAULT '0' COMMENT '1:p系列药品，2：h系列药品',
  `cold_first_price` decimal(10,2) unsigned DEFAULT NULL COMMENT '冷藏车价格（首单）',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 普通地址   1是默认地址',
  PRIMARY KEY (`ca_id`),
  KEY `uid` (`uid`),
  KEY `address_type` (`address_type`),
  KEY `openid` (`openid`)
) ENGINE=InnoDB AUTO_INCREMENT=10465 DEFAULT CHARSET=utf8 COMMENT='客户地址表';

-- ----------------------------
-- Table structure for customer_audit
-- ----------------------------
DROP TABLE IF EXISTS `customer_audit`;
CREATE TABLE `customer_audit` (
  `cua_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '订单id',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `username` char(32) DEFAULT '' COMMENT '审核人',
  `cua_type` tinyint(4) unsigned DEFAULT '0' COMMENT '客户审核类型 0--待审核，1--一审，2--二审，5--终审',
  `cua_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`cua_id`),
  KEY `to_id` (`to_id`),
  KEY `ur_uid` (`ur_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=970267 DEFAULT CHARSET=utf8 COMMENT='客户审核记录表';

-- ----------------------------
-- Table structure for customer_balance
-- ----------------------------
DROP TABLE IF EXISTS `customer_balance`;
CREATE TABLE `customer_balance` (
  `cb_id` int(11) NOT NULL AUTO_INCREMENT,
  `cb_balance` decimal(10,2) DEFAULT NULL COMMENT '委托客户余额',
  `cb_createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cb_lastuptime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `cu_id` int(11) NOT NULL COMMENT '委托客户ID',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '委托客户名称',
  PRIMARY KEY (`cb_id`),
  UNIQUE KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16405 DEFAULT CHARSET=utf8mb4 COMMENT='客户余额表';

-- ----------------------------
-- Table structure for customer_bind_company
-- ----------------------------
DROP TABLE IF EXISTS `customer_bind_company`;
CREATE TABLE `customer_bind_company` (
  `cbc_id` int(10) NOT NULL AUTO_INCREMENT,
  `bi_id` int(10) NOT NULL COMMENT '客户id',
  `bi_name` varchar(256) DEFAULT NULL COMMENT '客户名称',
  `com_id` int(10) NOT NULL COMMENT '公司id',
  `com_name` varchar(256) DEFAULT NULL COMMENT '公司名称',
  `cbc_bind_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1启用2禁用',
  `cbc_create_uid` int(10) NOT NULL COMMENT '配置人uid',
  `cbc_create_name` varchar(256) DEFAULT NULL COMMENT '配置人名称',
  `cbc_update_uid` int(10) DEFAULT NULL COMMENT '修改人uid',
  `cbc_update_name` varchar(256) DEFAULT NULL COMMENT '修改人名称',
  `cbc_create_time` int(10) NOT NULL COMMENT '创建时间',
  `cbc_update_time` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cbc_id`),
  KEY `cu_id` (`bi_id`),
  KEY `com_id` (`com_id`),
  KEY `cbc_create_uid` (`cbc_create_uid`),
  KEY `cbc_bind_status` (`cbc_bind_status`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='开票客户绑定开票公司表';

-- ----------------------------
-- Table structure for customer_branch
-- ----------------------------
DROP TABLE IF EXISTS `customer_branch`;
CREATE TABLE `customer_branch` (
  `cb_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cu_id` int(11) NOT NULL COMMENT '客户id',
  `create_uid` int(11) DEFAULT NULL COMMENT '创建人',
  `class_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `pcp_id` int(11) DEFAULT '0' COMMENT '父级部门',
  `cb_visible` tinyint(1) DEFAULT '1',
  `created_at` int(12) DEFAULT NULL,
  `updated_at` int(12) DEFAULT NULL,
  PRIMARY KEY (`cb_id`),
  KEY `index_cu_visible` (`cu_id`,`cb_visible`),
  KEY `index_cu` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for customer_configure
-- ----------------------------
DROP TABLE IF EXISTS `customer_configure`;
CREATE TABLE `customer_configure` (
  `cc_id` int(11) NOT NULL AUTO_INCREMENT,
  `process` tinyint(1) DEFAULT '0' COMMENT '审核流程 0：不需要 其他：为配置参数',
  `created_at` int(10) DEFAULT NULL,
  `update_at` int(10) DEFAULT NULL,
  `cp_id` int(11) NOT NULL COMMENT '项目id',
  `iscounty` tinyint(1) DEFAULT '0' COMMENT '县级市必填配置 0 :  非必填 1：必填',
  `operator_uid` int(11) DEFAULT NULL COMMENT '添加人id',
  `cargotype` varchar(150) DEFAULT NULL COMMENT '审核：货物类型',
  `iscenter` tinyint(1) DEFAULT NULL COMMENT '是否选择实验中心',
  `type` tinyint(1) DEFAULT '1' COMMENT '配置分类 1 单条配置 2： 多条配置类型',
  `cargoname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for customer_contract
-- ----------------------------
DROP TABLE IF EXISTS `customer_contract`;
CREATE TABLE `customer_contract` (
  `cct_id` int(11) NOT NULL AUTO_INCREMENT,
  `cct_title` varchar(100) DEFAULT NULL COMMENT '合同名称',
  `cct_number` varchar(1024) DEFAULT NULL COMMENT '合同编号',
  `cu_id` int(11) NOT NULL COMMENT '客户id',
  `cct_start_time` int(11) NOT NULL COMMENT '合同开始时间',
  `cct_end_time` int(11) NOT NULL COMMENT '合同结束时间',
  `at_id` varchar(128) DEFAULT NULL COMMENT '合同附件',
  `cct_check_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '审核状态  1待审核 2已审核',
  `cct_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 正常 2删除',
  `cct_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `cct_create_uid` int(11) NOT NULL COMMENT '创建人uid',
  `cct_lastup_uid` int(11) DEFAULT '0' COMMENT '最后修改uid',
  `cct_check_uid` int(11) DEFAULT '0' COMMENT '审核人uid',
  `cct_check_time` int(11) DEFAULT '0' COMMENT '审核时间',
  `cct_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `cct_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `cct_contract_type` tinyint(2) DEFAULT NULL COMMENT '合同类型 参考globaltype contract_type',
  `cct_sign_time` int(11) DEFAULT NULL COMMENT '签约日期',
  `cp_id` int(11) DEFAULT NULL COMMENT '项目id',
  PRIMARY KEY (`cct_id`),
  KEY `cu_id` (`cu_id`),
  KEY `at_id` (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COMMENT='客户合同';

-- ----------------------------
-- Table structure for customer_copy
-- ----------------------------
DROP TABLE IF EXISTS `customer_copy`;
CREATE TABLE `customer_copy` (
  `cu_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户序号',
  `cu_no` char(32) DEFAULT '' COMMENT '客户编号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `cu_tel` char(16) DEFAULT '' COMMENT '客户电话',
  `cu_fax` char(20) DEFAULT '' COMMENT '客户传真',
  `cu_url` char(128) DEFAULT NULL COMMENT '客户网址',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `cu_add` char(128) DEFAULT '' COMMENT '客户地址',
  `cu_lat` varchar(15) DEFAULT NULL COMMENT '百度坐标',
  `cu_lng` varchar(15) DEFAULT NULL COMMENT '百度坐标',
  `ct_id` smallint(6) unsigned DEFAULT '0' COMMENT '行业类型',
  `cu_maysize` tinyint(4) unsigned DEFAULT '0' COMMENT '潜在规模 0 超0万 1 超1万 2 超5万 3 超20万 4 超50万',
  `cu_nowsize` tinyint(4) unsigned DEFAULT '0' COMMENT '合作规模 0 超0万 1 超1万 2 超5万 3 超20万 4 超50万',
  `em_id` int(11) unsigned DEFAULT NULL COMMENT '客户发展业务员员工序号',
  `em_name` char(32) DEFAULT '' COMMENT '客户发展业务员员工姓名',
  `cu_relation` tinyint(4) unsigned DEFAULT '0' COMMENT '客户关系 0潜在 1洽谈 2合作 3无效',
  `cu_expiretime` int(10) unsigned DEFAULT '0' COMMENT '合同到期日期',
  `balance` decimal(10,2) DEFAULT '0.00' COMMENT '账户余额，单位分',
  `cu_status` tinyint(4) unsigned DEFAULT '0' COMMENT '客户状态 0启用，1禁用',
  `cu_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `cu_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cu_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `at_id` varchar(10) NOT NULL DEFAULT '' COMMENT '附件ID，只保留一个',
  `cu_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `emp_id` int(11) DEFAULT NULL COMMENT '项目专员ID',
  `emp_name` char(32) DEFAULT NULL COMMENT '项目专员名称',
  `emc_id` int(11) DEFAULT NULL COMMENT '结算专员ID',
  `emc_name` char(32) DEFAULT NULL COMMENT '结算专员姓名',
  `ar_id` int(11) DEFAULT NULL COMMENT '所属大区ID',
  `is_importent` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精益客户',
  `cu_feedback_type` tinyint(2) DEFAULT '1' COMMENT '是否接收自动反馈 1 接收 2 不接收',
  `cu_type` tinyint(2) DEFAULT '1' COMMENT '审核状态 1 待审核 2 已审核',
  `goods_size_type` int(1) DEFAULT '1' COMMENT '货物状态: 1-关闭，2-启用',
  `auto_rem_mess` int(1) DEFAULT '0' COMMENT '自动催款:0-开启,1-关闭',
  `cu_temperature_type` tinyint(4) DEFAULT '1' COMMENT '温度批量上传   1 开启 2 关闭',
  `cu_projectorder` tinyint(4) DEFAULT '2' COMMENT '是否是项目订单   1 是 2 否',
  PRIMARY KEY (`cu_id`),
  UNIQUE KEY `cu_no` (`cu_no`),
  KEY `cu_name` (`cu_name`),
  KEY `region_id` (`region_id`),
  KEY `ct_id` (`ct_id`),
  KEY `em_id` (`em_id`),
  KEY `cu_expiretime` (`cu_expiretime`)
) ENGINE=InnoDB AUTO_INCREMENT=201900455 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Table structure for customer_down_log
-- ----------------------------
DROP TABLE IF EXISTS `customer_down_log`;
CREATE TABLE `customer_down_log` (
  `cdl_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cdl_type` tinyint(2) NOT NULL COMMENT '下载类型(1=>附件批量下载，2=>签章批量下载)',
  `cdl_uid` int(11) NOT NULL COMMENT '用户ID',
  `cdl_file_path` varchar(100) NOT NULL COMMENT '下载文件路径',
  `cdl_file_size` int(11) NOT NULL,
  `cdl_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '下载状态(0=>未完成，1=>已完成)',
  `cdl_createtime` int(10) NOT NULL,
  `cdl_visible` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cdl_id`),
  KEY `cdl_type` (`cdl_type`),
  KEY `cdl_uid` (`cdl_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4 COMMENT='客户端附件下载日志表';

-- ----------------------------
-- Table structure for customer_durg
-- ----------------------------
DROP TABLE IF EXISTS `customer_durg`;
CREATE TABLE `customer_durg` (
  `durg_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cu_id` int(11) DEFAULT NULL COMMENT '客户id',
  `cu_name` varchar(128) DEFAULT NULL COMMENT '客户名称',
  `cp_id` int(11) DEFAULT NULL COMMENT '项目id',
  `cp_name` varchar(128) DEFAULT NULL COMMENT '项目名称',
  `durg_name` varchar(128) DEFAULT NULL COMMENT '客户货物名称',
  `durg_name_abbr` varchar(128) DEFAULT NULL COMMENT '客户货物名称缩写',
  `durg_ug` decimal(10,2) DEFAULT NULL COMMENT '质量单位（µg）',
  `durg_iu` decimal(10,2) DEFAULT NULL COMMENT '国际单位（iu）',
  `durg_volume` decimal(10,2) DEFAULT NULL COMMENT '体积',
  `durg_weight` decimal(10,2) DEFAULT NULL COMMENT '重量',
  `durg_packing` varchar(255) DEFAULT NULL COMMENT '包装规格（支/盒）',
  `durg_money` tinyint(1) DEFAULT NULL COMMENT '收费标准  1按一盒收费  2按两盒收费',
  `durg_status` tinyint(1) DEFAULT '0' COMMENT '状态 0正常  1删除',
  `single_price` decimal(10,2) unsigned DEFAULT NULL COMMENT '单价',
  PRIMARY KEY (`durg_id`),
  KEY `cu_id` (`cu_id`),
  KEY `cp_id` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COMMENT='成品药客户货物';

-- ----------------------------
-- Table structure for customer_email
-- ----------------------------
DROP TABLE IF EXISTS `customer_email`;
CREATE TABLE `customer_email` (
  `ce_id` int(11) NOT NULL AUTO_INCREMENT,
  `cu_id` int(11) DEFAULT NULL,
  `ce_name` varchar(20) DEFAULT NULL,
  `ce_email` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `ce_update_time` int(10) DEFAULT NULL,
  `ce_create_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`ce_id`),
  KEY `cu_id_index` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for customer_err_handel_process
-- ----------------------------
DROP TABLE IF EXISTS `customer_err_handel_process`;
CREATE TABLE `customer_err_handel_process` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(4) DEFAULT '0' COMMENT '状态 0待处理 1处理中 2已处理',
  `parms_id` int(11) DEFAULT '0' COMMENT '关键字段',
  `content` text COMMENT '内容',
  `err_type` varchar(50) DEFAULT NULL COMMENT '错误类型 1:交接单实验中心数据异常',
  `create_times` datetime(6) DEFAULT NULL COMMENT '创建时间',
  `Processing_time` datetime(6) DEFAULT NULL COMMENT '开始处理时间',
  `end_Processing_time` datetime(6) DEFAULT NULL COMMENT '处理结束时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for customer_experiment
-- ----------------------------
DROP TABLE IF EXISTS `customer_experiment`;
CREATE TABLE `customer_experiment` (
  `cex_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '项目序号',
  `cp_id` char(255) DEFAULT '' COMMENT '项目序号',
  `cex_name` char(255) DEFAULT '0' COMMENT '实验中心',
  `cex_no` varchar(255) DEFAULT '0' COMMENT '实验中心编号',
  `cex_username` char(255) DEFAULT '0' COMMENT '研究者',
  `cex_starttime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cex_lastupdtime` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `cex_status` tinyint(1) DEFAULT '1' COMMENT '状态 1启用，0禁用',
  `cex_remark` varchar(255) DEFAULT '' COMMENT '特殊备注',
  PRIMARY KEY (`cex_id`),
  KEY `cex_id` (`cex_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1818 DEFAULT CHARSET=utf8 COMMENT='项目实验表';

-- ----------------------------
-- Table structure for customer_goods
-- ----------------------------
DROP TABLE IF EXISTS `customer_goods`;
CREATE TABLE `customer_goods` (
  `cg_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `cg_name` varchar(100) NOT NULL DEFAULT '' COMMENT '货物名称',
  `cg_type` varchar(30) DEFAULT '0' COMMENT '货物类型',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户序号',
  `cu_name` char(32) DEFAULT '0' COMMENT '客户名称',
  `cp_id` int(6) unsigned DEFAULT '0' COMMENT '项目ID',
  `cp_name` char(255) DEFAULT '' COMMENT '项目名称',
  `cg_long` decimal(10,2) DEFAULT NULL COMMENT '长（厘米）',
  `cg_width` decimal(10,2) DEFAULT NULL COMMENT '宽（厘米）',
  `cg_height` decimal(10,2) DEFAULT NULL COMMENT '高（厘米）',
  `cg_weight` decimal(10,2) DEFAULT NULL COMMENT '货物重量（千克）',
  `cg_timelimit` int(4) unsigned DEFAULT '0' COMMENT '客户货物时效（对应运输时效）',
  `cg_visible` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-正常 2-删除',
  `cg_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cg_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `cg_temperature` tinyint(4) DEFAULT NULL COMMENT '运输温度',
  `cg_temperature_name` varchar(30) DEFAULT NULL COMMENT '运输温度记录',
  `sto_batch` varchar(128) DEFAULT '' COMMENT '批号',
  `expiration_date` int(11) DEFAULT '0' COMMENT '失效日期',
  PRIMARY KEY (`cg_id`),
  KEY `cu_id` (`cu_id`),
  KEY `cp_id` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5600121 DEFAULT CHARSET=utf8 COMMENT='客户货物表';

-- ----------------------------
-- Table structure for customer_hospital
-- ----------------------------
DROP TABLE IF EXISTS `customer_hospital`;
CREATE TABLE `customer_hospital` (
  `ch_id` int(11) NOT NULL AUTO_INCREMENT,
  `cu_id` int(11) DEFAULT NULL COMMENT '委托客户',
  `h_id` int(11) DEFAULT NULL COMMENT 'hospital',
  `ch_createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `ch_updatetime` int(10) DEFAULT NULL COMMENT '更新信息',
  `co_id` int(11) DEFAULT NULL COMMENT '联系人',
  `cp_id` int(11) DEFAULT NULL COMMENT '项目ID',
  PRIMARY KEY (`ch_id`),
  KEY `index_co_id` (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=520 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for customer_invoice_relation
-- ----------------------------
DROP TABLE IF EXISTS `customer_invoice_relation`;
CREATE TABLE `customer_invoice_relation` (
  `cir_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cu_id` int(10) unsigned DEFAULT NULL COMMENT '客户序号',
  `bi_id` int(10) unsigned DEFAULT NULL COMMENT '发票id',
  `bia_id` int(10) unsigned DEFAULT NULL COMMENT '寄送地址表id 默认的地址',
  `cir_status` tinyint(3) unsigned DEFAULT '0' COMMENT '1默认  0非默认 发票默认',
  `cir_visible` tinyint(3) unsigned DEFAULT '1' COMMENT '1正常0删除',
  `cir_createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cir_lastupdtime` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `cir_action` tinyint(3) unsigned DEFAULT '1' COMMENT '1启用 0禁用',
  PRIMARY KEY (`cir_id`),
  KEY `cu_id` (`cu_id`),
  KEY `bi_id` (`bi_id`),
  KEY `bia_id` (`bia_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12844 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for customer_offer
-- ----------------------------
DROP TABLE IF EXISTS `customer_offer`;
CREATE TABLE `customer_offer` (
  `cf_id` int(11) NOT NULL AUTO_INCREMENT,
  `qt_id` int(11) NOT NULL COMMENT '报价单qt_id',
  `cu_id` int(11) DEFAULT NULL COMMENT '客户id',
  `cct_id` int(11) DEFAULT NULL COMMENT '客户合同id',
  `cc_id` int(11) NOT NULL COMMENT '城市中心id',
  `cc_region_id` int(11) NOT NULL COMMENT '中心城市region_id',
  `cf_region_id` int(11) NOT NULL COMMENT '目标城市',
  `ccg_id` int(11) DEFAULT NULL COMMENT '城市分类id',
  `ccg_category` smallint(2) DEFAULT NULL COMMENT '城市类别 参考globaltype  ',
  `ps_id` int(11) DEFAULT NULL COMMENT '包装箱方案id',
  `bts_id` int(11) NOT NULL DEFAULT '0' COMMENT '温区方案id',
  `cf_firstbox_offer` decimal(10,2) DEFAULT NULL COMMENT '首箱/重报价',
  `cf_extendbox_offer` decimal(10,2) DEFAULT NULL COMMENT '续箱/重报价',
  `cf_transit_offer` decimal(10,2) DEFAULT '0.00' COMMENT '中转费',
  `cf_transit_type` tinyint(2) DEFAULT '0' COMMENT '中转费类型 1每箱 2每单',
  `cf_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `cf_status` tinyint(2) DEFAULT '1' COMMENT '1 正常 2删除',
  `cf_timelimit` smallint(2) DEFAULT NULL COMMENT '时效 参考globaltype  运送时限',
  `cf_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `cf_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  `start_region_id` int(11) DEFAULT NULL COMMENT '开始城市ID',
  `start_region_name` varchar(255) DEFAULT NULL COMMENT '开始城市名称',
  `stop_region_id` int(11) DEFAULT NULL COMMENT '目标城市ID',
  `stop_region_name` varchar(255) DEFAULT NULL COMMENT '目标城市名称',
  PRIMARY KEY (`cf_id`),
  KEY `cu_id` (`cu_id`),
  KEY `ccg_id` (`ccg_id`),
  KEY `ps_id` (`ps_id`),
  KEY `stop_region_id` (`stop_region_id`),
  KEY `qt_id` (`qt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1799740 DEFAULT CHARSET=utf8 COMMENT='客户报价';

-- ----------------------------
-- Table structure for customer_offer_change_log
-- ----------------------------
DROP TABLE IF EXISTS `customer_offer_change_log`;
CREATE TABLE `customer_offer_change_log` (
  `cfl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cf_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户报价id',
  `qt_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '报价单id',
  `cfl_type` char(16) CHARACTER SET utf8 DEFAULT '' COMMENT '操作类型，如：119001添加报价单、119002修改报价单、119003删除报价明细',
  `cfl_firstbox_offer_ago` decimal(10,2) DEFAULT NULL COMMENT '首箱/重报价 变更前',
  `cfl_firstbox_offer_later` decimal(10,2) DEFAULT NULL COMMENT '首箱/重报价 变更后',
  `cfl_extendbox_offer_ago` decimal(10,2) DEFAULT NULL COMMENT '续箱/重报价 变更前',
  `cfl_extendbox_offer_later` decimal(10,2) DEFAULT NULL COMMENT '续箱/重报价 变更后',
  `cfl_uid` int(11) NOT NULL COMMENT '变更人id',
  `cfl_username` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '变更人名称',
  `cfl_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`cfl_id`),
  KEY `qt_id` (`qt_id`),
  KEY `cfl_uid` (`cfl_uid`),
  KEY `cfl_createtime` (`cfl_createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=24195 DEFAULT CHARSET=utf8mb4 COMMENT='客户报价变更明细表';

-- ----------------------------
-- Table structure for customer_offer_temp_history
-- ----------------------------
DROP TABLE IF EXISTS `customer_offer_temp_history`;
CREATE TABLE `customer_offer_temp_history` (
  `both_id` int(11) NOT NULL AUTO_INCREMENT,
  `both_old_ps_id` int(11) DEFAULT NULL COMMENT '原 包装箱方案id',
  `both_new_ps_id` int(11) DEFAULT NULL COMMENT '新 包装箱方案id',
  `new_cf_id` int(11) NOT NULL COMMENT 'cf_id',
  `cf_id` int(11) NOT NULL COMMENT 'cf_id',
  `qt_id` int(11) NOT NULL COMMENT '报价单qt_id',
  `ccg_id` int(11) unsigned DEFAULT NULL COMMENT '城市分类id',
  `ccg_category` smallint(2) DEFAULT NULL COMMENT '城市类别 参考globaltype  ',
  `start_region_id` int(11) DEFAULT NULL COMMENT '开始城市ID',
  `start_region_name` varchar(255) DEFAULT NULL COMMENT '开始城市名称',
  `stop_region_id` int(11) DEFAULT NULL COMMENT '目标城市ID',
  `stop_region_name` varchar(255) DEFAULT NULL COMMENT '目标城市名称',
  `cf_firstbox_offer` decimal(10,2) DEFAULT NULL COMMENT '首箱/重报价',
  `cf_extendbox_offer` decimal(10,2) DEFAULT NULL COMMENT '续箱/重报价',
  `cf_transit_offer` decimal(10,2) DEFAULT NULL COMMENT '中转费',
  `cf_transit_type` tinyint(2) DEFAULT '0' COMMENT '中转费类型 1每箱 2每单',
  `status` tinyint(2) DEFAULT '1' COMMENT '修改状态 1未修改 2已修改',
  `createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`both_id`),
  KEY `both_old_ps_id` (`both_old_ps_id`),
  KEY `both_new_ps_id` (`both_new_ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15619 DEFAULT CHARSET=utf8 COMMENT='报价明细历史数据处理表';

-- ----------------------------
-- Table structure for customer_project
-- ----------------------------
DROP TABLE IF EXISTS `customer_project`;
CREATE TABLE `customer_project` (
  `cp_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '项目序号',
  `cp_no` char(255) DEFAULT '' COMMENT '项目编号',
  `cp_name` char(255) DEFAULT '' COMMENT '项目名称',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户序号',
  `co_id` int(11) unsigned DEFAULT '0' COMMENT '联系人序号',
  `cp_status` tinyint(4) unsigned DEFAULT '0' COMMENT '项目状态 0正常 1结束',
  `cp_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cp_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `cp_remark` longtext COMMENT '项目SOP',
  `cp_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `cp_protocol_no` char(255) DEFAULT NULL COMMENT '项目协议号',
  `cp_tags` varchar(150) DEFAULT NULL COMMENT '标签（英文逗号分割）',
  `cp_check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核（0=不审核，1=审核）',
  `cp_sponsor` varchar(255) DEFAULT NULL COMMENT '申办方',
  `dtp_config` int(1) DEFAULT '0' COMMENT 'dtp必选配置 1.必选',
  `cu_project_type` tinyint(1) unsigned DEFAULT NULL COMMENT '项目所属类型',
  `manage_region_id` int(10) unsigned DEFAULT NULL COMMENT '管辖城市id',
  `manage_region_name` varchar(50) DEFAULT NULL COMMENT '管辖城市名称',
  `cp_project_approval` tinyint(3) unsigned DEFAULT '0' COMMENT '是否立项 1是 0 否',
  `cp_project_approval_createtime` date DEFAULT NULL COMMENT '立项时间',
  `cp_project_approval_userid` int(10) unsigned DEFAULT NULL COMMENT '立项人员id',
  `cp_project_approval_username` varchar(50) DEFAULT NULL COMMENT '立项人员name',
  PRIMARY KEY (`cp_id`) USING BTREE,
  KEY `cp_name` (`cp_name`) USING BTREE,
  KEY `cu_id` (`cu_id`) USING BTREE,
  KEY `co_id` (`co_id`) USING BTREE,
  KEY `cp_no` (`cp_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13432 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='客户项目表';

-- ----------------------------
-- Table structure for customer_project_0518
-- ----------------------------
DROP TABLE IF EXISTS `customer_project_0518`;
CREATE TABLE `customer_project_0518` (
  `cp_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '项目序号',
  `cp_no` char(255) DEFAULT '' COMMENT '项目编号',
  `cp_name` char(255) DEFAULT '' COMMENT '项目名称',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户序号',
  `co_id` int(11) unsigned DEFAULT '0' COMMENT '联系人序号',
  `cp_status` tinyint(4) unsigned DEFAULT '0' COMMENT '项目状态 0正常 1结束',
  `cp_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `cp_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `cp_remark` longtext COMMENT '项目SOP',
  `cp_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `cp_protocol_no` char(255) DEFAULT NULL COMMENT '项目协议号',
  `cp_tags` varchar(150) DEFAULT NULL COMMENT '标签（英文逗号分割）',
  `cp_check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核（0=不审核，1=审核）',
  `cp_sponsor` varchar(255) DEFAULT NULL COMMENT '申办方',
  `dtp_config` int(1) DEFAULT '0' COMMENT 'dtp必选配置 1.必选',
  `cu_project_type` tinyint(1) unsigned DEFAULT NULL COMMENT '项目所属类型',
  `manage_region_id` int(10) unsigned DEFAULT NULL COMMENT '管辖城市id',
  `manage_region_name` varchar(50) DEFAULT NULL COMMENT '管辖城市名称',
  `cp_project_approval` tinyint(3) unsigned DEFAULT '0' COMMENT '是否立项 1是 0 否',
  `cp_project_approval_createtime` date DEFAULT NULL COMMENT '立项时间',
  `cp_project_approval_userid` int(10) unsigned DEFAULT NULL COMMENT '立项人员id',
  `cp_project_approval_username` varchar(50) DEFAULT NULL COMMENT '立项人员name',
  PRIMARY KEY (`cp_id`),
  KEY `cp_name` (`cp_name`),
  KEY `cu_id` (`cu_id`),
  KEY `co_id` (`co_id`),
  KEY `cp_no` (`cp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=60001 DEFAULT CHARSET=utf8 COMMENT='客户项目表';

-- ----------------------------
-- Table structure for customer_project_conf
-- ----------------------------
DROP TABLE IF EXISTS `customer_project_conf`;
CREATE TABLE `customer_project_conf` (
  `cpc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cp_id` int(10) unsigned DEFAULT NULL COMMENT '客户项目id',
  `cpc_hide_lot` tinyint(3) unsigned DEFAULT '0' COMMENT '下单选药品隐藏批号  0正常  1隐藏',
  `cpc_out_center_address` tinyint(255) unsigned DEFAULT '0' COMMENT '跳过中心地址  0正常 1跳过',
  `cpc_many_temperature` tinyint(3) unsigned DEFAULT '0' COMMENT '0否 1可选多温区',
  `cpc_not_use_ssexpress` tinyint(3) unsigned DEFAULT '0' COMMENT '不使用生生面单  0使用  1不使用',
  `cpc_use_customer_express` tinyint(3) unsigned DEFAULT '0' COMMENT '是否使用客户面单 1使用 0不使用',
  `cpc_choose_box` tinyint(3) DEFAULT '0' COMMENT '0=>不选择包材，1=>选择包材',
  `cpc_send_message_add_customer` tinyint(1) DEFAULT '0' COMMENT '取派短信发送项目人员信息 0=>不发送，1=>发送',
  PRIMARY KEY (`cpc_id`),
  KEY `cp_id` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=605 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for customer_quotation
-- ----------------------------
DROP TABLE IF EXISTS `customer_quotation`;
CREATE TABLE `customer_quotation` (
  `cq_id` int(10) NOT NULL AUTO_INCREMENT,
  `qt_id` int(10) NOT NULL COMMENT '报价单id',
  `cu_id` int(10) NOT NULL COMMENT '客户id',
  `cp_id` int(10) DEFAULT NULL COMMENT '项目id',
  `uid` int(10) NOT NULL COMMENT '创建人id',
  `cq_start_time` int(10) NOT NULL COMMENT '有效期开始时间',
  `cq_end_time` int(10) NOT NULL COMMENT '有效期结束时间',
  `cq_expire_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1有效2过期3已删除',
  `cq_createtime` int(10) DEFAULT NULL,
  `cq_lastupdtime` int(10) DEFAULT NULL,
  `cq_status` tinyint(2) DEFAULT '1' COMMENT '1正常2删除',
  `cq_autoclear` tinyint(2) DEFAULT '1' COMMENT '是否自动结算 1是2否',
  `cq_packing_cost` tinyint(2) DEFAULT '1' COMMENT '是否配置包装费 1是2否',
  `cq_packing_fee` tinyint(2) DEFAULT '1' COMMENT '是否配置包装费 1是2否',
  `sr_id` int(11) DEFAULT NULL COMMENT '税率表id',
  `cq_premium_rate` decimal(6,2) DEFAULT NULL COMMENT '保险费率',
  `cq_premium_low` int(10) DEFAULT NULL COMMENT '最低保险费',
  `cq_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `to_category` varchar(50) NOT NULL DEFAULT '1,2,3,4' COMMENT '订单类型 1正常订单 2仓库发药 3验证订单 4DTP订单',
  `first_weight` decimal(10,2) unsigned NOT NULL DEFAULT '5.00' COMMENT '首重标准',
  PRIMARY KEY (`cq_id`),
  KEY `qt_id` (`qt_id`),
  KEY `cu_id` (`cu_id`),
  KEY `cp_id` (`cp_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='客户报价单关联表';

-- ----------------------------
-- Table structure for customer_quotation_config
-- ----------------------------
DROP TABLE IF EXISTS `customer_quotation_config`;
CREATE TABLE `customer_quotation_config` (
  `cc_id` int(10) NOT NULL AUTO_INCREMENT,
  `cq_id` int(10) NOT NULL COMMENT 'customer_quotation cq_id',
  `charge_type` tinyint(3) NOT NULL COMMENT '收费类型 参考globaltype charge_type',
  `bts_id` int(10) DEFAULT NULL COMMENT '温区方案bts_id',
  `cost_type` tinyint(3) DEFAULT NULL COMMENT '费用类型 参考globaltype  cost_type',
  `cc_price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `cc_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `cc_status` tinyint(3) DEFAULT '1' COMMENT '1正常2删除',
  `cc_createtime` int(10) DEFAULT NULL,
  `cc_lastupdtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`cc_id`),
  KEY `cq_id` (`cq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COMMENT='客户报价单关联配置';

-- ----------------------------
-- Table structure for customer_quotation_contract_relation
-- ----------------------------
DROP TABLE IF EXISTS `customer_quotation_contract_relation`;
CREATE TABLE `customer_quotation_contract_relation` (
  `cqcr_id` int(11) NOT NULL AUTO_INCREMENT,
  `cq_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户报价id',
  `cct_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户合同id',
  `cct_title` varchar(100) NOT NULL DEFAULT '' COMMENT '合同标题',
  `cct_number` varchar(1024) NOT NULL DEFAULT '' COMMENT '合同编号',
  `cct_contract_type` varchar(50) NOT NULL DEFAULT '' COMMENT '合同类型',
  `cqcr_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `cqcr_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `cqcr_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `cqcr_lastupdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`cqcr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='客户报价绑定合同';

-- ----------------------------
-- Table structure for customer_quotation_jinsai
-- ----------------------------
DROP TABLE IF EXISTS `customer_quotation_jinsai`;
CREATE TABLE `customer_quotation_jinsai` (
  `cqj_id` int(11) NOT NULL AUTO_INCREMENT,
  `cqj_region_id` int(11) unsigned NOT NULL COMMENT '地区ID',
  `cqj_region_name` char(128) NOT NULL COMMENT '城市',
  `cqj_parent_id` int(11) unsigned DEFAULT '0' COMMENT '省ID',
  `cqj_parent_name` char(128) DEFAULT NULL COMMENT '省',
  `cqj_price_two` decimal(10,2) NOT NULL COMMENT '2件/箱 价格',
  `cqj_price_four` decimal(10,2) NOT NULL COMMENT '4件/箱 价格',
  `cqj_price_six` decimal(10,2) NOT NULL COMMENT '6件/箱 价格',
  `cqj_price_eight` decimal(10,2) NOT NULL COMMENT '8件/箱 价格',
  `cqj_price_ten` decimal(10,2) NOT NULL COMMENT '10件/箱 价格',
  `cqj_price_twelve` decimal(10,2) NOT NULL COMMENT '12件/箱 价格',
  `cqj_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `cqj_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`cqj_id`),
  UNIQUE KEY `cqj_region_id` (`cqj_region_id`),
  KEY `cqj_parent_id` (`cqj_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='金赛城市报价';

-- ----------------------------
-- Table structure for customer_quotation_special
-- ----------------------------
DROP TABLE IF EXISTS `customer_quotation_special`;
CREATE TABLE `customer_quotation_special` (
  `cqs_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cq_id` int(10) NOT NULL COMMENT '客户报价单关联表id',
  `cqs_message` varchar(1024) CHARACTER SET utf8 DEFAULT NULL COMMENT '公共特约费用',
  `cqs_createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `cqs_lastupdtime` int(10) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`cqs_id`),
  KEY `cq_id` (`cq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COMMENT='客户报价单关联特约费用';

-- ----------------------------
-- Table structure for customer_rate
-- ----------------------------
DROP TABLE IF EXISTS `customer_rate`;
CREATE TABLE `customer_rate` (
  `cr_id` int(10) NOT NULL AUTO_INCREMENT,
  `cr_cu_id` int(10) DEFAULT NULL COMMENT '客户id',
  `cr_cu_name` varchar(256) DEFAULT NULL COMMENT '客户名称',
  `cr_wl_ra_id` int(10) NOT NULL COMMENT '物流税率 ra_id',
  `cr_cc_ra_id` int(10) NOT NULL COMMENT '仓储税率 ra_id',
  `cr_xs_ra_id` int(10) NOT NULL COMMENT '销售税率 ra_id',
  `cr_wl_rate` decimal(18,2) NOT NULL COMMENT '物流税率',
  `cr_cc_rate` decimal(18,2) NOT NULL COMMENT '仓储税率',
  `cr_xs_rate` decimal(18,2) NOT NULL COMMENT '销售税率',
  `cr_create_uid` int(10) NOT NULL COMMENT '创建人uid',
  `cr_update_uid` int(10) DEFAULT NULL COMMENT '修改人uid',
  `cr_status` tinyint(3) DEFAULT '1' COMMENT '1正常2删除',
  `cr_createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `cr_updatetime` int(10) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cr_id`),
  KEY `cr_cu_id` (`cr_cu_id`),
  KEY `cr_wl_ra_id` (`cr_wl_ra_id`),
  KEY `cr_cc_ra_id` (`cr_cc_ra_id`),
  KEY `cr_xs_ra_id` (`cr_xs_ra_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='客户税率';

-- ----------------------------
-- Table structure for customer_records
-- ----------------------------
DROP TABLE IF EXISTS `customer_records`;
CREATE TABLE `customer_records` (
  `cr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录序号',
  `cu_id` int(11) unsigned NOT NULL COMMENT '客户ID',
  `cr_operator_id` int(11) unsigned NOT NULL COMMENT '操作人',
  `cr_person` varchar(60) DEFAULT NULL COMMENT '回访人姓名',
  `cr_method` varchar(60) DEFAULT NULL COMMENT '访问方式',
  `cr_remarks` varchar(255) DEFAULT NULL COMMENT '访问备注',
  `cr_time` int(10) unsigned DEFAULT NULL COMMENT '访问时间',
  `cr_createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`cr_id`),
  KEY `cu_id` (`cu_id`),
  KEY `cr_operator_id` (`cr_operator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='客户回访记录表';

-- ----------------------------
-- Table structure for customer_settlement
-- ----------------------------
DROP TABLE IF EXISTS `customer_settlement`;
CREATE TABLE `customer_settlement` (
  `cm_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cu_id` int(10) NOT NULL COMMENT '客户id',
  `cu_no` char(32) CHARACTER SET utf8 NOT NULL COMMENT '客户编号',
  `cu_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '客户名称',
  `em_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '所属销售',
  `cm_create_time` int(10) NOT NULL COMMENT '账单生成时间',
  `ms_no` char(32) CHARACTER SET utf8 NOT NULL COMMENT '对账单单号',
  `ms_cmonth` char(20) NOT NULL COMMENT '对账月份',
  `ms_uid` int(10) NOT NULL COMMENT '对账联系人id',
  `ms_username` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '对账联系人',
  `dep_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '对账联系人所属部门',
  `cm_end_time` int(10) DEFAULT NULL COMMENT '对账截止日期',
  `cm_ms_totalfee` decimal(10,4) NOT NULL COMMENT '应收总额',
  `cm_ms_rate` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '应收税率',
  `cm_fb_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '反馈联系人',
  `cm_fb_email` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '反馈邮箱',
  `cm_fb_tel` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '反馈电话',
  `ms_id` int(10) NOT NULL COMMENT '对账单id',
  `cm_create_uid` int(10) NOT NULL COMMENT '创建人id',
  `cm_create_username` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `cm_lastupdtime` int(10) DEFAULT NULL COMMENT '修改时间',
  `cm_send_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '发送客户',
  `cm_send_id` int(10) NOT NULL COMMENT '发送客户id',
  `cm_cc_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '抄送人员id',
  `cm_cc_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '抄送人员',
  `cm_createtime` int(10) NOT NULL COMMENT '生成时间',
  `ms_rbstatus` tinyint(1) DEFAULT '4' COMMENT '对账单确认装态 4 未确认 5已确认',
  PRIMARY KEY (`cm_id`),
  KEY `ms_id` (`ms_id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=latin1 COMMENT='客户对账单';

-- ----------------------------
-- Table structure for customer_special_config
-- ----------------------------
DROP TABLE IF EXISTS `customer_special_config`;
CREATE TABLE `customer_special_config` (
  `csc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户特殊费用配置主键id',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `cu_name` char(32) NOT NULL DEFAULT '' COMMENT '客户名称',
  `csc_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0开启 1禁用',
  `created_username` char(32) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`csc_id`),
  KEY `idx_cu_id` (`cu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='客户特殊费用配置';

-- ----------------------------
-- Table structure for customer_special_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `customer_special_config_detail`;
CREATE TABLE `customer_special_config_detail` (
  `cscd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '详情主键',
  `csc_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户特殊费用配置主键',
  `sc_no` int(20) NOT NULL DEFAULT '0' COMMENT '特殊费用编号',
  `is_ext` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否需要取扩展数据 0不需要 1需要',
  `is_auto` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否自动结算1是2否',
  `sc_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '特殊费用单价',
  `sc_units` varchar(20) NOT NULL DEFAULT '' COMMENT '单位',
  `cscd_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_username` char(32) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`cscd_id`),
  KEY `idx_csc_id` (`csc_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COMMENT='客户特殊费用配置明细';

-- ----------------------------
-- Table structure for customer_special_config_ext
-- ----------------------------
DROP TABLE IF EXISTS `customer_special_config_ext`;
CREATE TABLE `customer_special_config_ext` (
  `csce_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '扩展表主键id',
  `cscd_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户特殊费用配置详情表id',
  `csc_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户特殊费用配置id',
  `sc_no` int(22) NOT NULL DEFAULT '0' COMMENT '特殊费用配置编号',
  `range` varchar(400) NOT NULL DEFAULT '' COMMENT '作用范围，箱型编号逗号拼接',
  `range_show` varchar(400) NOT NULL DEFAULT '' COMMENT '作用范围展示',
  `sc_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '特殊费用单价',
  `sc_units` varchar(20) NOT NULL DEFAULT '' COMMENT '单位',
  `csce_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_username` char(32) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`csce_id`) USING BTREE,
  KEY `idx_cscd_id` (`cscd_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8mb4 COMMENT='客户特殊费用配置明细扩展';

-- ----------------------------
-- Table structure for customer_type
-- ----------------------------
DROP TABLE IF EXISTS `customer_type`;
CREATE TABLE `customer_type` (
  `ct_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '行业类型序号',
  `ct_name` char(32) DEFAULT '' COMMENT '行业类型名称',
  `ct_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ct_area` tinyint(2) DEFAULT '1' COMMENT '参考globaltype  customer_area',
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='客户行业类型表';

-- ----------------------------
-- Table structure for database_performances
-- ----------------------------
DROP TABLE IF EXISTS `database_performances`;
CREATE TABLE `database_performances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `conn_num` int(10) unsigned NOT NULL DEFAULT '0',
  `max_conn_num` int(10) unsigned NOT NULL DEFAULT '0',
  `query_rate` double NOT NULL DEFAULT '0',
  `bytes_received_rate` double NOT NULL DEFAULT '0',
  `bytes_sent_rate` double NOT NULL DEFAULT '0',
  `qcache_hits_rate` double NOT NULL DEFAULT '0',
  `com_select_rate` double NOT NULL DEFAULT '0',
  `com_insert_rate` double NOT NULL DEFAULT '0',
  `com_update_rate` double NOT NULL DEFAULT '0',
  `com_delete_rate` double NOT NULL DEFAULT '0',
  `read_query_rate` double NOT NULL DEFAULT '0',
  `write_query_rate` double NOT NULL DEFAULT '0',
  `table_num` int(10) unsigned NOT NULL DEFAULT '0',
  `table_rows_num` int(10) unsigned NOT NULL DEFAULT '0',
  `db_data_size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `db_idx_size` int(10) unsigned NOT NULL DEFAULT '0',
  `total_db_size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `db_idxfrac_size` int(10) unsigned NOT NULL DEFAULT '0',
  `select_scan_rate` double NOT NULL DEFAULT '0',
  `select_full_join_rate` double NOT NULL DEFAULT '0',
  `innodb_buf_pool_size` int(10) unsigned NOT NULL DEFAULT '0',
  `innodb_buf_pool_free` int(10) unsigned NOT NULL DEFAULT '0',
  `innodb_buf_cache_hit` double NOT NULL DEFAULT '0',
  `query_cache_hit` double NOT NULL DEFAULT '0',
  `myisam_key_cache_hit` double NOT NULL DEFAULT '0',
  `thread_cache_hit` double NOT NULL DEFAULT '0',
  `conn_running` int(10) unsigned NOT NULL DEFAULT '0',
  `conn_cached` int(10) unsigned NOT NULL DEFAULT '0',
  `percent_open_table_against_table_cache` int(10) unsigned NOT NULL DEFAULT '0',
  `opened_table_rate` double NOT NULL DEFAULT '0',
  `table_locks_immediate_rate` double NOT NULL DEFAULT '0',
  `table_locks_waited_rate` double NOT NULL DEFAULT '0',
  `table_lock_wait_ratio` double NOT NULL DEFAULT '0',
  `conn_attempt_rate` double NOT NULL DEFAULT '0',
  `conn_aborted_rate` double NOT NULL DEFAULT '0',
  `client_aborted_rate` double NOT NULL DEFAULT '0',
  `highest_concurrent_conn` int(10) unsigned NOT NULL DEFAULT '0',
  `percent_of_max_reached_conn` double NOT NULL DEFAULT '0',
  `percent_of_refused_conn` double NOT NULL DEFAULT '0',
  `num_of_slow_launch_threads` int(10) unsigned NOT NULL DEFAULT '0',
  `percent_of_innodb_cache_write_wait` double NOT NULL DEFAULT '0',
  `innodb_log_buffer_size` int(10) unsigned NOT NULL DEFAULT '0',
  `percent_of_innodb_log_wait_required` double NOT NULL DEFAULT '0',
  `percent_of_full_table_scan` double NOT NULL DEFAULT '0',
  `created_tmp_tables_rate` double NOT NULL DEFAULT '0',
  `created_tmp_disk_tables_rate` double NOT NULL DEFAULT '0',
  `created_tmp_disk_ratio` double NOT NULL DEFAULT '0',
  `innodb_rows_deleted_rate` double NOT NULL DEFAULT '0',
  `innodb_rows_inserted_rate` double NOT NULL DEFAULT '0',
  `innodb_rows_read_rate` double NOT NULL DEFAULT '0',
  `innodb_rows_updated_rate` double NOT NULL DEFAULT '0',
  `innodb_row_lock_current_waits` int(10) unsigned NOT NULL DEFAULT '0',
  `innodb_row_lock_time` int(10) unsigned NOT NULL DEFAULT '0',
  `innodb_row_lock_time_avg` int(10) unsigned NOT NULL DEFAULT '0',
  `innodb_row_lock_time_max` int(10) unsigned NOT NULL DEFAULT '0',
  `innodb_data_reads_rate` double NOT NULL DEFAULT '0',
  `innodb_data_writes_rate` double NOT NULL DEFAULT '0',
  `com_begin_rate` double NOT NULL DEFAULT '0',
  `com_commit_rate` double NOT NULL DEFAULT '0',
  `com_rollback_rate` double NOT NULL DEFAULT '0',
  `sort_merge_passes_rate` double NOT NULL DEFAULT '0',
  `sort_range_rate` double NOT NULL DEFAULT '0',
  `sort_scan_rate` double NOT NULL DEFAULT '0',
  `sort_rows_rate` double NOT NULL DEFAULT '0',
  `binlog_cache_use_rate` double NOT NULL DEFAULT '0',
  `binlog_cache_disk_use_rate` double NOT NULL DEFAULT '0',
  `total_rows_returned` double NOT NULL DEFAULT '0',
  `total_rows_returned_use_index` double NOT NULL DEFAULT '0',
  `percent_rows_use_index` double NOT NULL DEFAULT '0',
  `percent_pruned_query` double NOT NULL DEFAULT '0',
  `percent_conn_usage` double NOT NULL DEFAULT '0',
  `percent_myisam_cache_usage` double NOT NULL DEFAULT '0',
  `percent_innodb_cache_usage` double NOT NULL DEFAULT '0',
  `slow_query_rate` double NOT NULL DEFAULT '0',
  `innodb_data_fsyncs_rate` double NOT NULL DEFAULT '0',
  `innodb_log_writes_rate` double NOT NULL DEFAULT '0',
  `free_myisam_buffer_size` double NOT NULL DEFAULT '0',
  `key_buffer_size` double NOT NULL DEFAULT '0',
  `percent_of_slow_query` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_database_performances_on_connection_id_created_at` (`connection_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for deadlocks
-- ----------------------------
DROP TABLE IF EXISTS `deadlocks`;
CREATE TABLE `deadlocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` timestamp NULL DEFAULT NULL,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_deadlocks_on_connection_id_created_at` (`connection_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `de_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '部门序号',
  `parent_id` smallint(6) unsigned DEFAULT '0' COMMENT '上一层父节点（根节点为0）',
  `has_child` tinyint(4) unsigned DEFAULT '0' COMMENT '有无子节点（0：无，1：有）',
  `de_name` char(32) DEFAULT '' COMMENT '部门名称',
  `de_remark` varchar(1024) DEFAULT NULL COMMENT '部门描述',
  `de_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `de_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`de_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Table structure for deviation_management
-- ----------------------------
DROP TABLE IF EXISTS `deviation_management`;
CREATE TABLE `deviation_management` (
  `dm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dm_no` varchar(255) DEFAULT NULL COMMENT '偏差编号',
  `cu_id` int(11) DEFAULT NULL COMMENT '委托编号',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '委托客户',
  `dm_status` tinyint(1) DEFAULT NULL COMMENT '1 已完成 2未完成 3 关闭',
  `dm_time` int(10) DEFAULT NULL COMMENT '要求时限',
  `dm_completion_time` int(10) DEFAULT NULL COMMENT '实际完成时间',
  `duty_dm_id` int(11) DEFAULT NULL COMMENT '责任部门id',
  `duty_dm_name` varchar(255) DEFAULT NULL COMMENT '责任部门',
  `yc_id` int(11) DEFAULT NULL COMMENT '异常id',
  `yc_no` varchar(255) DEFAULT NULL COMMENT '异常编号',
  `dm_uid` int(11) DEFAULT NULL COMMENT '编制人id',
  `dm_username` varchar(255) DEFAULT NULL COMMENT '编制人',
  `dm_capa` tinyint(1) DEFAULT '3' COMMENT '1 启动 2未启动',
  `up_id` varchar(255) DEFAULT NULL COMMENT '异常文件id',
  `dm_create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `dm_create_username` varchar(255) DEFAULT NULL COMMENT '创建人',
  `dm_create_uid` int(11) DEFAULT NULL COMMENT '创建人id',
  `dm_lastupdatime` int(11) DEFAULT NULL COMMENT '修改时间',
  `capa_no` varchar(255) DEFAULT NULL COMMENT 'capa编号',
  `dm_visible` tinyint(1) DEFAULT '1' COMMENT '状态 1正常 0删除',
  `dm_rect_time` int(11) DEFAULT NULL COMMENT '整改完成期限',
  `cancel_remark` varchar(255) DEFAULT NULL COMMENT '取消偏差备注',
  PRIMARY KEY (`dm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COMMENT='偏差管理';

-- ----------------------------
-- Table structure for device_service
-- ----------------------------
DROP TABLE IF EXISTS `device_service`;
CREATE TABLE `device_service` (
  `ds_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '设备维护序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(32) DEFAULT '' COMMENT '存货名称',
  `em_id` int(11) unsigned DEFAULT '0' COMMENT '员工序号',
  `em_name` char(32) DEFAULT '' COMMENT '维护人，员工姓名',
  `ds_servicetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '维护时间',
  `ds_type` tinyint(4) unsigned DEFAULT '0' COMMENT '维护类型 0检查，1维修',
  `ds_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ds_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ds_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `ds_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  PRIMARY KEY (`ds_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='设备维护表';

-- ----------------------------
-- Table structure for discount_config
-- ----------------------------
DROP TABLE IF EXISTS `discount_config`;
CREATE TABLE `discount_config` (
  `dc_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dc_type` tinyint(1) NOT NULL COMMENT '折扣类型 1集团 2客户 3集团项目 4客户项目',
  `dc_name` varchar(255) NOT NULL DEFAULT '' COMMENT '折扣名称 根据折扣类型 分别为 项目名 客户名 集团名',
  `dc_discount_type` tinyint(1) NOT NULL COMMENT '折扣规则 1按年 2按月',
  `dc_start_month` int(11) NOT NULL COMMENT '开始月份',
  `dc_stop_month` int(11) NOT NULL COMMENT '结束月份',
  `dc_use_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用状态 0未使用 1已使用',
  `dc_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `dc_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `dc_create_uid` int(10) NOT NULL COMMENT '创建人',
  `dc_lastupd_uid` int(10) NOT NULL COMMENT '最后更新人',
  `dc_createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `dc_lastupdtime` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`dc_id`),
  KEY `dc_name` (`dc_name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COMMENT='结算折扣表';

-- ----------------------------
-- Table structure for discount_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `discount_config_detail`;
CREATE TABLE `discount_config_detail` (
  `dcd_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `dc_id` int(11) NOT NULL COMMENT '折扣id',
  `discount_rule` decimal(12,2) NOT NULL COMMENT '折扣条件',
  `discount_rate` decimal(10,2) NOT NULL COMMENT '折扣率',
  `dcd_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  PRIMARY KEY (`dcd_id`),
  KEY `dc_id` (`dc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COMMENT='结算折扣详情表';

-- ----------------------------
-- Table structure for discount_config_relevance
-- ----------------------------
DROP TABLE IF EXISTS `discount_config_relevance`;
CREATE TABLE `discount_config_relevance` (
  `dcr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '折扣关联表自增id',
  `dc_id` int(11) NOT NULL DEFAULT '0' COMMENT '折扣主表id',
  `cg_id` int(11) NOT NULL DEFAULT '0' COMMENT '集团id',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `cp_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目id',
  `dcr_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  PRIMARY KEY (`dcr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COMMENT='折扣关联表';

-- ----------------------------
-- Table structure for dispatch
-- ----------------------------
DROP TABLE IF EXISTS `dispatch`;
CREATE TABLE `dispatch` (
  `di_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '调度单序号',
  `di_no` char(32) DEFAULT '' COMMENT '调度库单编号，系统按规则生成：DD+8位序号数字',
  `di_dd_id` int(11) unsigned DEFAULT NULL COMMENT '当前调度明细ID',
  `di_assign_uid` int(11) unsigned DEFAULT NULL COMMENT '指派给用户序号',
  `di_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `di_order_count` smallint(6) unsigned DEFAULT '0' COMMENT '票数：即本调度单关联的运输单数',
  `di_goods_quantity` smallint(6) DEFAULT '0' COMMENT '货物件数，所有关联订单及其波次的货物件数之和',
  `di_goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克），所有关联订单及其波次的货物重量之和',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '出发所在地区ID',
  `start_region_name` char(128) DEFAULT NULL COMMENT '出发地区名',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '目的所在地区ID',
  `stop_region_name` char(128) DEFAULT NULL COMMENT '目的地区名',
  `di_transfer` tinyint(4) unsigned DEFAULT '0' COMMENT '中转次数',
  `di_transportfee` decimal(10,2) DEFAULT '0.00' COMMENT '发货费',
  `di_ladingfee` decimal(10,2) DEFAULT '0.00' COMMENT '提货费',
  `di_operatingfee` decimal(10,2) DEFAULT '0.00' COMMENT '操作费',
  `di_status` tinyint(4) unsigned DEFAULT '0' COMMENT '调度单状态 0新建 1已提货 2已取消 3已关闭',
  `di_remark` varchar(255) DEFAULT '' COMMENT '备注',
  `di_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `di_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `di_closetime` int(10) DEFAULT '0' COMMENT '结案时间',
  `di_createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `di_lastupdtime` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `consignee` varchar(255) DEFAULT NULL COMMENT '收货人名称',
  `consignee_phone` varchar(255) DEFAULT NULL COMMENT '收货人电话',
  `sure_status` int(4) NOT NULL DEFAULT '1' COMMENT '确认状态 1未确认 2已确认',
  `di_shipment_no` varchar(50) DEFAULT NULL COMMENT '发货单号',
  `di_consignor_uid` varchar(255) DEFAULT NULL COMMENT '发货人uid',
  `di_consignor_name` varchar(255) DEFAULT NULL COMMENT '发货人名称',
  `di_fhfee_status` int(4) DEFAULT '1' COMMENT '是否有发货费  1没有 2有',
  PRIMARY KEY (`di_id`),
  KEY `di_assign_uid` (`di_assign_uid`),
  KEY `di_create_uid` (`di_create_uid`),
  KEY `di_dd_id` (`di_dd_id`),
  KEY `di_no` (`di_no`)
) ENGINE=InnoDB AUTO_INCREMENT=179138 DEFAULT CHARSET=utf8 COMMENT='调度单表';

-- ----------------------------
-- Table structure for dispatch_detail
-- ----------------------------
DROP TABLE IF EXISTS `dispatch_detail`;
CREATE TABLE `dispatch_detail` (
  `dd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '调度序号',
  `di_id` int(11) unsigned DEFAULT '0' COMMENT '调度单序号',
  `ro_id` int(11) unsigned DEFAULT '0' COMMENT '路由序号',
  `departure_region_id` int(11) unsigned DEFAULT NULL COMMENT '出港城市ID',
  `departure_region_name` char(128) DEFAULT NULL COMMENT '出港城市',
  `departure_trans_station` char(32) DEFAULT NULL COMMENT '出港站点',
  `departure_trans_time` int(10) DEFAULT '0' COMMENT '出港时间',
  `arrive_region_id` int(11) DEFAULT NULL COMMENT '到港城市ID',
  `arrive_region_name` char(128) DEFAULT NULL COMMENT '到港城市',
  `arrive_trans_station` char(32) DEFAULT NULL COMMENT '到港站点',
  `arrive_trans_time` int(10) DEFAULT '0' COMMENT '到港时间',
  `dd_operatingfee` decimal(10,2) DEFAULT '0.00' COMMENT '操作费',
  `dd_transportfee` decimal(10,2) DEFAULT '0.00' COMMENT '发货费',
  `dd_createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `dd_create_uid` int(11) unsigned DEFAULT NULL COMMENT '创建用户ID',
  `dd_create_username` char(32) DEFAULT NULL COMMENT '创建用户姓名',
  `dd_remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `dd_lastupdtime` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`dd_id`),
  KEY `di_id` (`di_id`),
  KEY `ro_id` (`ro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=178853 DEFAULT CHARSET=utf8 COMMENT='调度单调度明细表';

-- ----------------------------
-- Table structure for dispatch_operator
-- ----------------------------
DROP TABLE IF EXISTS `dispatch_operator`;
CREATE TABLE `dispatch_operator` (
  `do_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '调度操作人序号',
  `di_id` int(11) unsigned DEFAULT '0' COMMENT '调度单序号',
  `dd_id` int(11) unsigned DEFAULT '0' COMMENT '调度序号',
  `do_type` tinyint(4) unsigned DEFAULT '0' COMMENT '操作人类型 0调度发货人 1提货人',
  `do_operator_uid` int(11) DEFAULT '0' COMMENT '操作人用户序号',
  `do_operator_username` char(32) DEFAULT NULL COMMENT '操作人用户姓名，具有操作员标识的用户',
  `do_operatingfee` decimal(10,2) DEFAULT '0.00' COMMENT '个人所得操作费，第1、2、N-1个人的操作费= 舍去法精确到分取整（X/N），第N个人的操作费=X-X1-X2-X（N-1）',
  `do_createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`do_id`),
  KEY `di_id` (`di_id`),
  KEY `dd_id` (`dd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35377 DEFAULT CHARSET=utf8 COMMENT='调度单操作人表';

-- ----------------------------
-- Table structure for dispatch_order_and_third_order_relation
-- ----------------------------
DROP TABLE IF EXISTS `dispatch_order_and_third_order_relation`;
CREATE TABLE `dispatch_order_and_third_order_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `from_city` varchar(50) DEFAULT '' COMMENT '出发城市',
  `to_city` varchar(50) DEFAULT '' COMMENT '到达城市',
  `from_date` varchar(15) DEFAULT '' COMMENT '出发日期',
  `third_order_no` varchar(50) NOT NULL COMMENT '第三方订单号；一个第三方订单号可能对应多个公司订单号',
  `dispatch_order_no` varchar(200) DEFAULT '' COMMENT '公司订单号；多个订单号有,隔开',
  `goods_quantity` int(11) DEFAULT '1' COMMENT '货物数量',
  `is_fetch_arrive` tinyint(1) DEFAULT '0' COMMENT '是否到货，0未到货、1已到货',
  `is_notify_arrive` tinyint(1) DEFAULT '0' COMMENT '是否发起过到货通知，0未通知、1已通知',
  `fetch_time` datetime DEFAULT NULL COMMENT '抓取时间',
  `arrive_time` datetime DEFAULT NULL COMMENT '到达时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `arrive_info` varchar(1000) DEFAULT '' COMMENT '到达信息',
  `complete_third_order_no` varchar(50) DEFAULT '' COMMENT '完整第三方单号',
  `fetch_fail_reason` varchar(100) DEFAULT '' COMMENT '抓取失败原因',
  `fetch_state` tinyint(3) DEFAULT '0' COMMENT '0待抓取 1抓取成功 2抓取失败',
  `actual_from_city` varchar(50) DEFAULT '' COMMENT '实际出发城市',
  `actual_to_city` varchar(50) DEFAULT '' COMMENT '实际到达城市',
  `to_date` varchar(15) DEFAULT '' COMMENT '到达日期',
  `upload_user` varchar(20) DEFAULT '' COMMENT '上传人',
  `upload_time` datetime DEFAULT NULL COMMENT '上传日期',
  `upload_template` varchar(50) DEFAULT '' COMMENT '上传数据模板名称',
  `fetch_template` varchar(50) DEFAULT '' COMMENT '抓取数据模板名称',
  `route_type` varchar(20) DEFAULT '火车' COMMENT '路由类型',
  `route_sub_type` varchar(20) DEFAULT '中铁/高铁' COMMENT '路由子类型',
  `extend_params` varchar(50) DEFAULT '' COMMENT '扩展参数',
  `transport_time` int(11) DEFAULT '0' COMMENT '运输耗时',
  `planned_arrive_time` datetime DEFAULT NULL COMMENT '计划到达时间',
  `arrive_state` tinyint(3) DEFAULT '0' COMMENT '0未知、1未收件、2已收件未发货、3已发货在途中、4已到达',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6567 DEFAULT CHARSET=utf8 COMMENT='调度单和三方快递单关系表';

-- ----------------------------
-- Table structure for dms_special_person_travel_order
-- ----------------------------
DROP TABLE IF EXISTS `dms_special_person_travel_order`;
CREATE TABLE `dms_special_person_travel_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `travel_order_no` varchar(50) NOT NULL COMMENT '出差单编号',
  `start_region_id` varchar(20) NOT NULL COMMENT '出发城市id',
  `start_region_name` varchar(20) NOT NULL COMMENT '出发城市名',
  `stop_region_id` varchar(20) NOT NULL COMMENT '到达城市id',
  `stop_region_name` varchar(20) NOT NULL COMMENT '到达城市名',
  `plan_start_date` datetime NOT NULL COMMENT '计划出发时间',
  `plan_stop_date` datetime DEFAULT NULL COMMENT '计划到达时间',
  `actual_start_date` datetime DEFAULT NULL COMMENT '实际出发时间',
  `actual_stop_date` datetime DEFAULT NULL COMMENT '实际到达时间',
  `special_person_uid` int(11) NOT NULL COMMENT '专人员工账户id',
  `special_person_username` varchar(20) DEFAULT '' COMMENT '出差人姓名',
  `escort_person_uid` varchar(100) DEFAULT '' COMMENT '陪同人用户id',
  `escort_person_username` varchar(200) DEFAULT '' COMMENT '陪同人用户名称',
  `create_uid` int(11) NOT NULL COMMENT '创建人',
  `create_username` varchar(20) DEFAULT '' COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_uid` int(11) DEFAULT '0' COMMENT '更新人id',
  `update_username` varchar(20) DEFAULT '' COMMENT '更新人名称',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `travel_status` tinyint(3) DEFAULT '0' COMMENT '出行状态：0待出行 1出行中 2已到达',
  `work_order_ids` varchar(100) DEFAULT '' COMMENT '工作单id',
  `transport_order_ids` varchar(100) DEFAULT '' COMMENT '运单id',
  `transport_order_nos` varchar(100) DEFAULT '' COMMENT '运单编号',
  `traffic_category` tinyint(3) DEFAULT '0' COMMENT '交通类别：1飞机 2高铁 3动车 4火车 5出租车 6汽车大巴 7自驾',
  `work_region_id` varchar(20) NOT NULL COMMENT '工作城市id',
  `work_region_name` varchar(20) NOT NULL COMMENT '工作城市名称',
  `deleted_status` tinyint(3) DEFAULT '0' COMMENT '删除状态：0未删除 1已删除',
  `remark` varchar(100) DEFAULT '' COMMENT '备注',
  `is_journey` tinyint(1) DEFAULT NULL COMMENT '是否返程 1/0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `travel_order_no` (`travel_order_no`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='专人出差订单表';

-- ----------------------------
-- Table structure for dms_travel_order_item
-- ----------------------------
DROP TABLE IF EXISTS `dms_travel_order_item`;
CREATE TABLE `dms_travel_order_item` (
  `dto_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `dsp_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '专人出差单id',
  `dto_no` varchar(50) NOT NULL DEFAULT '' COMMENT '对应差旅管家编号',
  `dto_start_region_name` varchar(20) NOT NULL DEFAULT '' COMMENT '出发城市名称',
  `dto_start_region_id` int(10) NOT NULL COMMENT '出发城市id',
  `dto_stop_region_name` varchar(20) NOT NULL DEFAULT '' COMMENT '到达城市名称',
  `dto_stop_region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '到达城市id',
  `dto_plan_start_date` datetime NOT NULL COMMENT '计划开始时间',
  `dto_plan_stop_date` datetime NOT NULL COMMENT '计划结束时间',
  `dto_actual_start_date` datetime DEFAULT NULL COMMENT '实际出发时间',
  `dto_actual_stop_date` datetime DEFAULT NULL COMMENT '实际到达时间',
  `dto_traffic_category` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '交通类别：1飞机 2火车',
  `dto_train_number` varchar(30) NOT NULL DEFAULT '' COMMENT '车次/航班',
  `dto_total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '费用',
  `dto_travel_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '行程状态 0待出行 1进行中 2已完成 3已作废',
  `dto_delete_status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0未作废 1已作废',
  `dto_create_at` datetime NOT NULL COMMENT '创建时间',
  `dto_delete_at` datetime DEFAULT NULL COMMENT '作废时间',
  `dto_is_journey` tinyint(1) DEFAULT NULL COMMENT '是否返程 1/0',
  PRIMARY KEY (`dto_id`),
  KEY `dsp_id` (`dsp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=777 DEFAULT CHARSET=utf8mb4 COMMENT='出差单行程表';

-- ----------------------------
-- Table structure for drug_arrived_pay
-- ----------------------------
DROP TABLE IF EXISTS `drug_arrived_pay`;
CREATE TABLE `drug_arrived_pay` (
  `dap_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '药品到付表自增长ID',
  `io_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '出入库单序号',
  `dap_amount` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '到付金额',
  `dap_express_company` varchar(100) NOT NULL DEFAULT '' COMMENT '快递公司',
  `dap_pay_type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '支付方式: (1-月结, 2-现结)',
  `dap_visible` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态: (1-显示, 2-删除)',
  `dap_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `dap_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`dap_id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COMMENT='药品到付记录表';

-- ----------------------------
-- Table structure for drug_batch
-- ----------------------------
DROP TABLE IF EXISTS `drug_batch`;
CREATE TABLE `drug_batch` (
  `db_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '药品批次表自增长ID',
  `db_no` varchar(500) NOT NULL COMMENT '药品批次号',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `db_expired` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '有效期(到期时间)',
  `is_month` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '是否月份(1-是, 2-否)',
  `db_security` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安全有效期',
  `db_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态: (1-正常, 2-删除)',
  `db_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `db_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`db_id`),
  UNIQUE KEY `unx_sto_id_db_no_db_status` (`sto_id`,`db_no`,`db_status`),
  KEY `idx_db_expired` (`db_expired`)
) ENGINE=InnoDB AUTO_INCREMENT=23422 DEFAULT CHARSET=utf8mb4 COMMENT='药品批次表';

-- ----------------------------
-- Table structure for drug_lock_abnormal
-- ----------------------------
DROP TABLE IF EXISTS `drug_lock_abnormal`;
CREATE TABLE `drug_lock_abnormal` (
  `dla_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'api药品表自增id',
  `sto_id` int(11) NOT NULL DEFAULT '0' COMMENT '存货id',
  `sto_no` varchar(255) DEFAULT NULL COMMENT '存货编号',
  `sto_name` varchar(255) DEFAULT NULL COMMENT '存货名称',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `db_no` varchar(128) DEFAULT NULL COMMENT '批号',
  `sto_has_identifier` tinyint(1) DEFAULT '0' COMMENT '有无编号:( 0-否，1-有)',
  `dla_quantity` int(11) DEFAULT NULL COMMENT '数量',
  `dla_detail` longtext COMMENT '药品编号',
  `dla_type` tinyint(2) unsigned DEFAULT '1' COMMENT '异常锁类型:( 1-oms系统，2-客户oms系统，3-微信服务号，4-API接口，5-国际系统， 6-迈迪朗杰API，7-oms系统批量导入，8-机器人邮件自动下单，9-微信小程序)',
  `dla_source_id` varchar(50) NOT NULL COMMENT '来源单号，对应异常锁类型',
  `dla_visible` tinyint(2) DEFAULT '1' COMMENT '显示状态:( 1-正常，2-删除 )',
  `dla_status` tinyint(1) unsigned DEFAULT '1' COMMENT '药品状态 1-新建 2-已出库',
  `dla_remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `dla_createtime` int(11) DEFAULT NULL COMMENT '生成时间',
  `dla_lastupdtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`dla_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品加解锁异常表';

-- ----------------------------
-- Table structure for drug_surplus
-- ----------------------------
DROP TABLE IF EXISTS `drug_surplus`;
CREATE TABLE `drug_surplus` (
  `ds_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cu_id` int(11) unsigned NOT NULL COMMENT '客户ID',
  `cu_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `ds_inventory` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总库存',
  `ds_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '总容积数',
  `ds_sl_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '库位容积',
  `ds_tr_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '托盘容积',
  `ds_cp_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '客户包装容积',
  `ds_createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ds_lastupdtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`ds_id`),
  UNIQUE KEY `uni_cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=845 DEFAULT CHARSET=utf8mb4 COMMENT='药品结余表';

-- ----------------------------
-- Table structure for drug_surplus_detail
-- ----------------------------
DROP TABLE IF EXISTS `drug_surplus_detail`;
CREATE TABLE `drug_surplus_detail` (
  `dsd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cu_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `sto_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '存货ID',
  `dsd_location_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '货位ID',
  `dsd_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '容积数',
  `dsd_cubage_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '容积类型: (1-库位盒, 2-托盘, 3-客户包装)',
  `dsd_inventory` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '库存数',
  `dsd_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示状态: (1-显示, 0-删除)',
  `dsd_createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `dsd_lastupdtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`dsd_id`),
  UNIQUE KEY `uni_sto_id_location_id` (`sto_id`,`dsd_location_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11483 DEFAULT CHARSET=utf8mb4 COMMENT='药品结余详情表';

-- ----------------------------
-- Table structure for drug_surplus_monthly
-- ----------------------------
DROP TABLE IF EXISTS `drug_surplus_monthly`;
CREATE TABLE `drug_surplus_monthly` (
  `dsm_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cu_id` int(11) unsigned NOT NULL COMMENT '客户ID',
  `cu_name` varchar(100) NOT NULL DEFAULT '' COMMENT '客户名称',
  `dsm_inventory` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总库存',
  `dsm_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '总容积数',
  `dsm_sl_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '库位容积',
  `dsm_tr_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '托盘容积',
  `dsm_cp_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '客户包装容积',
  `dsm_monthly` char(20) NOT NULL DEFAULT '' COMMENT '月份',
  `dsm_createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `dsm_lastupdtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`dsm_id`),
  UNIQUE KEY `cu_id_dsm_monthly` (`cu_id`,`dsm_monthly`),
  KEY `idx_month` (`dsm_monthly`)
) ENGINE=InnoDB AUTO_INCREMENT=14041 DEFAULT CHARSET=utf8mb4 COMMENT='药品月份结余表';

-- ----------------------------
-- Table structure for drug_surplus_monthly_detail
-- ----------------------------
DROP TABLE IF EXISTS `drug_surplus_monthly_detail`;
CREATE TABLE `drug_surplus_monthly_detail` (
  `dsmd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cu_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户ID',
  `sto_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '存货ID',
  `dsmd_location_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '货位ID',
  `dsmd_cubage` varchar(50) NOT NULL DEFAULT '0' COMMENT '容积数',
  `dsmd_cubage_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '容积类型: (1-库位盒, 2-托盘, 3-客户包装)',
  `dsmd_inventory` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '库存数',
  `dsmd_monthly` char(20) NOT NULL DEFAULT '' COMMENT '月份',
  `dsmd_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '显示状态: (1-显示, 0-删除)',
  `dsmd_createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `dsmd_lastupdtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`dsmd_id`),
  UNIQUE KEY `sto_id_dsmd_location_id_dsmd_monthly` (`sto_id`,`dsmd_location_id`,`dsmd_monthly`),
  KEY `idx_dsmd_month` (`dsmd_monthly`)
) ENGINE=InnoDB AUTO_INCREMENT=226754 DEFAULT CHARSET=utf8mb4 COMMENT='药品月份结余详情表';

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `em_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '员工序号',
  `em_no` char(16) DEFAULT '' COMMENT '员工工号',
  `em_name` char(32) DEFAULT '' COMMENT '真实姓名',
  `em_email` char(32) DEFAULT '' COMMENT '邮箱',
  `em_birth` date DEFAULT '0000-00-00' COMMENT '生日',
  `em_sex` tinyint(4) unsigned DEFAULT '0' COMMENT '性别 0：男，1：女',
  `em_mobile_phone` char(16) DEFAULT '' COMMENT '手机号码',
  `em_contact_tel` char(16) DEFAULT '' COMMENT '联系电话',
  `em_fax` char(16) DEFAULT '' COMMENT '传真',
  `em_qq` char(16) DEFAULT '' COMMENT 'QQ号码',
  `em_province` char(16) DEFAULT '' COMMENT '省',
  `em_city` char(16) DEFAULT '' COMMENT '市',
  `em_county` char(32) DEFAULT '' COMMENT '区/县',
  `em_address` char(128) DEFAULT '' COMMENT '现住地址',
  `em_remark` varchar(1024) DEFAULT NULL COMMENT '用户备注',
  `em_entrydate` date DEFAULT '0000-00-00' COMMENT '入职日期',
  `po_name` char(32) DEFAULT '' COMMENT '职位',
  `em_nation` char(16) DEFAULT '' COMMENT '民族',
  `em_degree` char(8) DEFAULT '' COMMENT '学历',
  `em_certnum` char(18) DEFAULT '' COMMENT '身份证号',
  `em_certaddr` char(128) DEFAULT '' COMMENT '户籍地址',
  `de_name` char(32) DEFAULT '' COMMENT '所属部门',
  `em_status` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '在职状态0在职1离职',
  `em_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `em_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `em_zztime` varchar(50) DEFAULT '' COMMENT '转正时间',
  `em_city_id` int(11) DEFAULT NULL COMMENT '所属城市id',
  `em_qiye_wechat_account_name` varchar(100) DEFAULT '' COMMENT '企业微信员工账号名',
  `em_qiye_wechat_account_id` varchar(100) DEFAULT '' COMMENT '企业微信员工账号id',
  `mini_avatar` varchar(200) DEFAULT '' COMMENT '企业微信人员头像',
  `oms_department_name` varchar(50) DEFAULT '' COMMENT 'oms部门名称',
  `oms_department_no` varchar(50) DEFAULT '' COMMENT 'oms一级部门编号',
  `oms_quarters_name` varchar(50) DEFAULT '' COMMENT 'oms职位名称',
  `oms_quarters_no` varchar(50) DEFAULT '' COMMENT 'oms职位编号',
  `em_qiye_wechat_city_id` varchar(50) DEFAULT '' COMMENT '企业微信员工所在城市id',
  `em_qiye_wechat_city_name` varchar(100) DEFAULT '' COMMENT '企业微信员工所在城市名称',
  `em_et_userid` varchar(100) DEFAULT NULL COMMENT '泛微Eteams中的userid',
  `ehr_em_no` char(20) DEFAULT '' COMMENT 'ehr 员工工号',
  `oms_company_name` varchar(255) NOT NULL DEFAULT '' COMMENT '所属公司',
  `cost_company_name` varchar(190) NOT NULL DEFAULT '' COMMENT '成本归属公司名称',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `em_child_de_no` varchar(50) NOT NULL DEFAULT '' COMMENT '子部门编号',
  `job_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '岗位类型 0 代表未设置',
  `resignation_date` date DEFAULT NULL COMMENT '离职日期',
  PRIMARY KEY (`em_id`),
  UNIQUE KEY `uniq_em_no` (`em_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105246 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Table structure for employee_department
-- ----------------------------
DROP TABLE IF EXISTS `employee_department`;
CREATE TABLE `employee_department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `oms_department_no` varchar(100) NOT NULL COMMENT '部门编号',
  `oms_department_name` varchar(100) NOT NULL COMMENT '部门名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_username` varchar(50) DEFAULT '' COMMENT '创建人名称',
  `update_username` varchar(50) DEFAULT '' COMMENT '更新人名称',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '层级',
  `em_dp_id` bigint(19) unsigned NOT NULL DEFAULT '0' COMMENT '泛微部门ID',
  `parent_no` varchar(50) NOT NULL DEFAULT '' COMMENT '泛微上级部门编号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_de_no` (`oms_department_no`) USING BTREE COMMENT '编号唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='员工部门表';

-- ----------------------------
-- Table structure for employee_department_quarters_relation
-- ----------------------------
DROP TABLE IF EXISTS `employee_department_quarters_relation`;
CREATE TABLE `employee_department_quarters_relation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `department_id` int(11) NOT NULL COMMENT '部门id',
  `quarters_id` int(11) NOT NULL COMMENT '职位id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_username` varchar(50) DEFAULT '' COMMENT '创建人名称',
  `update_username` varchar(50) DEFAULT '' COMMENT '更新人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8 COMMENT='员工部门职位关系表';

-- ----------------------------
-- Table structure for employee_list
-- ----------------------------
DROP TABLE IF EXISTS `employee_list`;
CREATE TABLE `employee_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ehr_no` char(20) CHARACTER SET utf8 DEFAULT '' COMMENT '员工工号',
  `type` varchar(50) DEFAULT '' COMMENT '数据表',
  `status` tinyint(11) NOT NULL COMMENT '在职状态 0在职 1离职',
  `data` text CHARACTER SET utf8 COMMENT '数据',
  `type_id` char(50) DEFAULT '' COMMENT '各表的主键id',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `update_time` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for employee_quarters
-- ----------------------------
DROP TABLE IF EXISTS `employee_quarters`;
CREATE TABLE `employee_quarters` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `oms_quarters_no` varchar(100) NOT NULL COMMENT '职位编号',
  `oms_quarters_name` varchar(100) NOT NULL COMMENT '职位名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_username` varchar(50) DEFAULT '' COMMENT '创建人名称',
  `update_username` varchar(50) DEFAULT '' COMMENT '更新人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8 COMMENT='员工职位表';

-- ----------------------------
-- Table structure for error_notify_tbl
-- ----------------------------
DROP TABLE IF EXISTS `error_notify_tbl`;
CREATE TABLE `error_notify_tbl` (
  `e_app_name` varchar(255) NOT NULL,
  `responsible_user` varchar(255) NOT NULL,
  `e_title` varchar(255) DEFAULT NULL,
  `title_flag` tinyint(1) NOT NULL DEFAULT '0',
  `e_content` varchar(255) DEFAULT NULL,
  `content_flag` tinyint(1) NOT NULL DEFAULT '0',
  `e_log_type` varchar(255) DEFAULT NULL,
  `log_type_flag` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`e_app_name`,`responsible_user`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for error_notify_tbl_modify_20220422
-- ----------------------------
DROP TABLE IF EXISTS `error_notify_tbl_modify_20220422`;
CREATE TABLE `error_notify_tbl_modify_20220422` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `e_app_name` varchar(255) NOT NULL,
  `responsible_user` varchar(255) NOT NULL,
  `e_title` varchar(255) DEFAULT NULL,
  `title_flag` tinyint(1) NOT NULL DEFAULT '0',
  `e_content` varchar(255) DEFAULT NULL,
  `content_flag` tinyint(1) NOT NULL DEFAULT '0',
  `e_log_type` varchar(255) DEFAULT NULL,
  `log_type_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `routing` varchar(255) NOT NULL,
  `routing2` varchar(255) DEFAULT NULL,
  `item` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for error_notify_tbl_test
-- ----------------------------
DROP TABLE IF EXISTS `error_notify_tbl_test`;
CREATE TABLE `error_notify_tbl_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `e_app_name` varchar(255) NOT NULL,
  `responsible_user` varchar(255) NOT NULL,
  `e_title` varchar(255) DEFAULT NULL,
  `title_flag` tinyint(1) NOT NULL DEFAULT '0',
  `e_content` varchar(255) DEFAULT NULL,
  `content_flag` tinyint(1) NOT NULL DEFAULT '0',
  `e_log_type` varchar(255) DEFAULT NULL,
  `log_type_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `routing` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for error_notify_tbl_test_modify_20220424
-- ----------------------------
DROP TABLE IF EXISTS `error_notify_tbl_test_modify_20220424`;
CREATE TABLE `error_notify_tbl_test_modify_20220424` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `e_app_name` varchar(255) NOT NULL,
  `responsible_user` varchar(255) NOT NULL,
  `e_title` varchar(255) DEFAULT NULL,
  `title_flag` tinyint(1) NOT NULL DEFAULT '0',
  `e_content` varchar(255) DEFAULT NULL,
  `content_flag` tinyint(1) NOT NULL DEFAULT '0',
  `e_log_type` varchar(255) DEFAULT NULL,
  `log_type_flag` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `routing` varchar(255) NOT NULL,
  `routing2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for etl_temp
-- ----------------------------
DROP TABLE IF EXISTS `etl_temp`;
CREATE TABLE `etl_temp` (
  `etl_id` int(11) NOT NULL AUTO_INCREMENT,
  `etl_time_stamp` int(10) NOT NULL DEFAULT '0' COMMENT 'kettle成功更新时间',
  `etl_src_table_name` varchar(32) NOT NULL COMMENT 'kettle转换源数据表名称',
  `etl_dest_table_name` varchar(32) NOT NULL COMMENT 'kettle转换目标表名称',
  `etl_job_name` varchar(32) NOT NULL COMMENT 'kettle工作名称',
  `etl_remarks` varchar(255) DEFAULT NULL COMMENT 'kettle工作说明备注',
  PRIMARY KEY (`etl_id`),
  UNIQUE KEY `src_dest_job_name` (`etl_src_table_name`,`etl_dest_table_name`,`etl_job_name`)
) ENGINE=InnoDB AUTO_INCREMENT=20885 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for files_approve
-- ----------------------------
DROP TABLE IF EXISTS `files_approve`;
CREATE TABLE `files_approve` (
  `fa_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fd_id` int(11) NOT NULL COMMENT '申请详情ID',
  `fa_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型(1=>流程审核；2=>文控批准；3=>创建申请)',
  `ur_uid` int(11) NOT NULL COMMENT '审批人ID',
  `fa_approve_name` varchar(20) NOT NULL COMMENT '审批人名字',
  `fa_approve_time` int(10) NOT NULL COMMENT '审批时间',
  `fa_note` varchar(255) NOT NULL COMMENT '审批意见',
  `fa_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审批状态(0=>驳回；1=>未审批；2=>通过)',
  `fa_createtime` int(10) NOT NULL COMMENT '创建时间',
  `fa_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '审批状态 1正常，0删除，',
  PRIMARY KEY (`fa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4162 DEFAULT CHARSET=utf8 COMMENT='文件审批表';

-- ----------------------------
-- Table structure for files_approve_details
-- ----------------------------
DROP TABLE IF EXISTS `files_approve_details`;
CREATE TABLE `files_approve_details` (
  `fd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '申请序号',
  `fd_approve_type` tinyint(1) NOT NULL COMMENT '文件申请类型(1=>新增类型；2=>修订类型；3=>作废类型)',
  `fd_parent_id` int(11) NOT NULL COMMENT '修订的文件ID',
  `fd_fatt_id` int(11) NOT NULL COMMENT '文件附件ID',
  `ur_uid` int(11) NOT NULL COMMENT '申请人ID',
  `fd_user_name` varchar(20) NOT NULL COMMENT '申请人名',
  `fd_de_name` varchar(20) NOT NULL COMMENT '申请人部门',
  `fd_createtime` int(10) NOT NULL COMMENT '申请日期',
  `fd_approve_time` int(10) NOT NULL COMMENT '审批时限',
  `fd_achieve_time` int(10) NOT NULL COMMENT '文件归档时间',
  `fd_discard_time` int(10) NOT NULL COMMENT '废弃时间',
  `fd_approve_reason` varchar(255) NOT NULL COMMENT '申请理由',
  `fd_fapp_id` int(11) NOT NULL COMMENT '当前审批流程',
  `fd_approve_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '流程审批状态(1=>已提交;2=>审批中;3=>已完结)',
  `fd_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文件状态(1=>审批中，2=>归档，3=>作废，4=>生效)',
  `fd_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文件状态 1正常，0删除，',
  `fd_effective_time` int(10) NOT NULL COMMENT '生效时间',
  `fd_related_files` varchar(255) NOT NULL COMMENT '关联文件ID',
  `fd_related_forms` varchar(255) NOT NULL COMMENT '关联表单ID',
  PRIMARY KEY (`fd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1142 DEFAULT CHARSET=utf8 COMMENT='审批详情表';

-- ----------------------------
-- Table structure for files_attachment
-- ----------------------------
DROP TABLE IF EXISTS `files_attachment`;
CREATE TABLE `files_attachment` (
  `fa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fa_create_uid` int(11) NOT NULL COMMENT '创建人ID',
  `fa_create_username` varchar(20) NOT NULL COMMENT '创建人名字',
  `fa_filename` varchar(100) NOT NULL COMMENT '附件名称',
  `fa_filesize` int(10) NOT NULL COMMENT '文件大小',
  `fa_filepath` varchar(200) NOT NULL COMMENT '附件路径',
  `fa_no` varchar(20) NOT NULL COMMENT '文件编号',
  `fa_vn` varchar(10) NOT NULL COMMENT '文件版本号',
  `fa_name` varchar(60) NOT NULL COMMENT '文件名称',
  `fa_en_name` varchar(150) NOT NULL DEFAULT '0' COMMENT '文件英文名称',
  `fa_file_type` tinyint(2) NOT NULL COMMENT '文件类型',
  `fa_view_auth` text NOT NULL,
  `fa_note` varchar(255) NOT NULL COMMENT '文件备注',
  `fa_views` int(11) NOT NULL COMMENT '文件浏览量',
  `fa_downs` int(11) NOT NULL COMMENT '文件下载量',
  `fa_createtime` int(10) NOT NULL COMMENT '文件创建时间',
  `fa_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '文件状态 1正常，0删除，',
  `fa_achieve_path` varchar(200) NOT NULL COMMENT '文件归档后加受控水印存放路径',
  `fa_obsolete_path` varchar(200) NOT NULL COMMENT '文件作废后加作废水印的存放路径',
  `fa_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '文件种类(1=>审批文件；2=>表单文件)',
  `fa_study_type` tinyint(1) NOT NULL COMMENT '文件学习时限(1=>1分钟,2=>2分钟,3=>5分钟,4=>10分钟,5=>20分钟,6=>30分钟)',
  `fa_ff_status` tinyint(1) DEFAULT '2' COMMENT '文件附件表状态（1、正常，2未上传，3不一致）',
  PRIMARY KEY (`fa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1544 DEFAULT CHARSET=utf8mb4 COMMENT='文件附件表';

-- ----------------------------
-- Table structure for files_form
-- ----------------------------
DROP TABLE IF EXISTS `files_form`;
CREATE TABLE `files_form` (
  `ff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fa_id` int(11) NOT NULL COMMENT '文件附件ID',
  `ff_create_uid` int(11) NOT NULL COMMENT '创建者ID',
  `ff_create_name` varchar(50) NOT NULL COMMENT '创建者姓名',
  `ff_create_time` int(10) NOT NULL COMMENT '创建时间',
  `ff_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会否正常(1=>正常;0=>删除)',
  `ffa_id` int(11) DEFAULT NULL COMMENT '四级表单id',
  PRIMARY KEY (`ff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COMMENT='文件表单表';

-- ----------------------------
-- Table structure for files_form_copy
-- ----------------------------
DROP TABLE IF EXISTS `files_form_copy`;
CREATE TABLE `files_form_copy` (
  `ff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fa_id` int(11) NOT NULL COMMENT '文件附件ID',
  `ff_create_uid` int(11) NOT NULL COMMENT '创建者ID',
  `ff_create_name` varchar(50) NOT NULL COMMENT '创建者姓名',
  `ff_create_time` int(10) NOT NULL COMMENT '创建时间',
  `ff_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会否正常(1=>正常;0=>删除)',
  `ffa_id` int(11) unsigned DEFAULT NULL COMMENT '表单id',
  `ff_status` tinyint(1) DEFAULT '1' COMMENT '附件状态（1、正常，2、异常）',
  PRIMARY KEY (`ff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件表单表';

-- ----------------------------
-- Table structure for files_frame_chart
-- ----------------------------
DROP TABLE IF EXISTS `files_frame_chart`;
CREATE TABLE `files_frame_chart` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `fc_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '分类名称',
  `fc_create_username` varchar(30) NOT NULL DEFAULT '0' COMMENT '创建人',
  `fc_update_username` varchar(30) NOT NULL DEFAULT '0' COMMENT '修改人',
  `fc_create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `fc_update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间(上传文件时间)',
  `fc_visible` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态（1、正常，0、删除）',
  `fc_fa_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='文件框图';

-- ----------------------------
-- Table structure for files_log
-- ----------------------------
DROP TABLE IF EXISTS `files_log`;
CREATE TABLE `files_log` (
  `fl_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fl_type` tinyint(1) NOT NULL COMMENT '文件日志类型(1=>新增,2=>修订,3=>作废，4=>审核,5=>督办)',
  `fd_id` int(11) NOT NULL COMMENT '审批详情编号',
  `ur_uid` int(11) NOT NULL COMMENT '操作人编号',
  `fl_ur_name` varchar(255) NOT NULL COMMENT '操作人名',
  `fl_note` text COMMENT '备注',
  `fl_createtime` int(10) NOT NULL COMMENT '创建时间',
  `fl_fapp_id` int(11) NOT NULL,
  PRIMARY KEY (`fl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1357 DEFAULT CHARSET=utf8 COMMENT='文件操作日志表';

-- ----------------------------
-- Table structure for files_set_approver
-- ----------------------------
DROP TABLE IF EXISTS `files_set_approver`;
CREATE TABLE `files_set_approver` (
  `fsa_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ur_uid` int(11) NOT NULL COMMENT '审批人ID',
  `fsa_ur_name` varchar(20) NOT NULL COMMENT '审批人姓名',
  `fsa_mobile` char(16) DEFAULT NULL COMMENT '手机号',
  `fsa_createtime` int(10) NOT NULL COMMENT '创建时间',
  `fsa_visible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=>删除；1=>正常',
  PRIMARY KEY (`fsa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COMMENT='文件审批人配置表';

-- ----------------------------
-- Table structure for files_user_behavior
-- ----------------------------
DROP TABLE IF EXISTS `files_user_behavior`;
CREATE TABLE `files_user_behavior` (
  `fub_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fub_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '用户行为类型(1=>查看,2=>下载，3=>推送)',
  `fub_fd_id` int(11) NOT NULL COMMENT '审批文件ID',
  `fub_part_no` varchar(20) NOT NULL COMMENT '部分编号(人资数据一级部门编号）',
  `fub_ur_uid` int(11) NOT NULL,
  `fub_ur_name` varchar(20) NOT NULL,
  `fub_QtName` varchar(20) NOT NULL COMMENT '岗位名称',
  `fub_city` varchar(10) NOT NULL,
  `fub_is_learn` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否已经学习',
  `fub_createtime` int(10) NOT NULL COMMENT '创建时间',
  `fub_study_time_remaining` int(11) DEFAULT '0' COMMENT '学习剩余时间',
  PRIMARY KEY (`fub_id`),
  KEY `index_fd_id` (`fub_fd_id`),
  KEY `index_type` (`fub_type`),
  KEY `index_uid` (`fub_ur_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1850 DEFAULT CHARSET=utf8mb4 COMMENT='用户操作文件行为记录表';

-- ----------------------------
-- Table structure for gaode_map
-- ----------------------------
DROP TABLE IF EXISTS `gaode_map`;
CREATE TABLE `gaode_map` (
  `gm_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL,
  `to_start_address` varchar(200) DEFAULT NULL,
  `to_end_address` varchar(200) DEFAULT NULL,
  `gm_start_longitude` varchar(50) DEFAULT NULL,
  `gm_start_latitude` varchar(50) DEFAULT NULL,
  `gm_end_longitude` varchar(50) DEFAULT NULL,
  `gm_end_latitude` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `gm_create_time` int(10) DEFAULT NULL,
  `gm_update_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`gm_id`),
  KEY `idx_toid` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6655 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for general_settings
-- ----------------------------
DROP TABLE IF EXISTS `general_settings`;
CREATE TABLE `general_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password_min_length` int(11) DEFAULT '6',
  `different_from_username` tinyint(1) DEFAULT '0',
  `include_upper_lower_number` tinyint(1) DEFAULT '0',
  `at_least_one_symbol` tinyint(1) DEFAULT '0',
  `show_24_hour` tinyint(1) DEFAULT '0',
  `ldap_ip` varchar(255) DEFAULT NULL,
  `ldap_port` int(11) DEFAULT NULL,
  `ldap_encryption` varchar(255) DEFAULT NULL,
  `ldap_allow_anonymous` tinyint(1) DEFAULT NULL,
  `ldap_user_search_base` varchar(255) DEFAULT NULL,
  `ldap_auth_username` varchar(255) DEFAULT NULL,
  `ldap_auth_password` varchar(255) DEFAULT NULL,
  `ldap_auth_mode` varchar(255) DEFAULT NULL,
  `ldap_user_search_attribute` varchar(255) DEFAULT NULL,
  `ad_ip` varchar(255) DEFAULT NULL,
  `ad_port` int(11) DEFAULT NULL,
  `ad_encryption` varchar(255) DEFAULT NULL,
  `ad_allow_anonymous` tinyint(1) DEFAULT NULL,
  `ad_user_search_base` varchar(255) DEFAULT NULL,
  `ad_auth_username` varchar(255) DEFAULT NULL,
  `ad_auth_password` varchar(255) DEFAULT NULL,
  `ad_auth_mode` varchar(255) DEFAULT NULL,
  `ad_user_search_attribute` varchar(255) DEFAULT NULL,
  `data_purging_alert_day` int(11) DEFAULT NULL,
  `data_purging_performance_day` int(11) DEFAULT NULL,
  `ldap_password_attr` text,
  `ldap_digest_mech` text,
  `ad_password_attr` text,
  `ad_digest_mech` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for global_alert_settings
-- ----------------------------
DROP TABLE IF EXISTS `global_alert_settings`;
CREATE TABLE `global_alert_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_type` int(11) NOT NULL DEFAULT '0',
  `alert_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_direction` tinyint(1) NOT NULL DEFAULT '0',
  `alert_warn_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_warn_threshold` int(11) NOT NULL DEFAULT '0',
  `alert_critical_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_critical_threshold` int(11) NOT NULL DEFAULT '0',
  `alert_length_minute` int(11) NOT NULL DEFAULT '0',
  `alert_sent_when_raise` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_when_end` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_via_email` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_via_sms` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_via_snmp` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_to_user_enable` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_to_all` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_to_roles` varchar(255) NOT NULL DEFAULT '[]',
  `alert_sent_alternative_email` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_to_emails` text,
  `manager_note` text,
  `alert_sent_via_slack` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_global_alert_settings_on_alert_type` (`alert_type`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for goods_attachment
-- ----------------------------
DROP TABLE IF EXISTS `goods_attachment`;
CREATE TABLE `goods_attachment` (
  `ga_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '物资附件表ID',
  `at_id` int(12) unsigned NOT NULL COMMENT '附件ID',
  `ga_calibration_time` int(12) unsigned NOT NULL COMMENT '校准时间',
  `ga_indate` int(12) unsigned NOT NULL COMMENT '校准证书有效期（到期日期）',
  `ga_indate_type` tinyint(2) unsigned NOT NULL COMMENT '有效期类型 1. 1个月 2. 3 个月 3.6个月 4.12个月 5.24个月',
  `ga_lastuptime` int(12) NOT NULL,
  `ga_createtime` int(12) NOT NULL COMMENT '创建时间',
  `gd_id` int(12) unsigned NOT NULL COMMENT '物资明细id',
  `ga_visible` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态   0 删除 1正常',
  `ga_humidity` tinyint(2) unsigned NOT NULL DEFAULT '3' COMMENT '湿度校准点     1=>''35%,75%'',  2=>''20%,80%'',  3=>''无''',
  `ga_temperature` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '温度校准点   1=>0℃,5℃,20℃,40℃,  2=>-25℃,0℃,5℃,50℃,  3=>-80℃,-50℃,-20℃,0℃, 4=>-196℃',
  `ga_difference` varchar(50) DEFAULT NULL COMMENT '温度误差值',
  `ga_verify_type` tinyint(4) DEFAULT '0' COMMENT '验证类型(1、使用前验证，2、年度再验证，3、维修后验证)',
  `ga_verify_aging_days` varchar(5) DEFAULT NULL COMMENT '验证保温时效(天)',
  `ga_verify_aging_hours` varchar(3) DEFAULT NULL COMMENT '验证保温时效(小时)',
  `ga_verify_aging_minutes` varchar(3) DEFAULT NULL COMMENT '验证保温时效(分钟)',
  `ga_reviewer_name` varchar(30) DEFAULT NULL COMMENT '审核人员',
  `ga_reviewer_id` int(11) DEFAULT NULL COMMENT '审核人员id',
  `ga_create_user_id` int(11) DEFAULT NULL COMMENT '验证人员Id',
  `ga_create_user_name` varchar(30) DEFAULT NULL COMMENT '验证人员名字',
  `ga_ca_id` int(11) DEFAULT NULL COMMENT 'car表主键id(冷藏车id)',
  `ga_pb_id` int(11) DEFAULT NULL COMMENT '包装箱关联表id',
  `ga_pack_temperature` varchar(200) DEFAULT NULL COMMENT '包装箱环境温度',
  PRIMARY KEY (`ga_id`),
  KEY `gd_id` (`gd_id`),
  KEY `ga_visible` (`ga_visible`)
) ENGINE=InnoDB AUTO_INCREMENT=13103 DEFAULT CHARSET=utf8 COMMENT='物资附件表';

-- ----------------------------
-- Table structure for goods_details
-- ----------------------------
DROP TABLE IF EXISTS `goods_details`;
CREATE TABLE `goods_details` (
  `gd_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '存货明细表ID  ',
  `sto_id` int(10) unsigned NOT NULL COMMENT '存货ID',
  `gd_purchase_time` int(12) unsigned NOT NULL COMMENT '采购日期',
  `gd_indate` int(12) unsigned NOT NULL COMMENT '存货明细编号有效期',
  `gd_series_number` varchar(32) NOT NULL COMMENT '温度计序列号',
  `gd_lastuptime` int(12) NOT NULL,
  `gd_createtime` int(12) NOT NULL COMMENT '创建时间',
  `gd_visible` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0 删除 1 正常 2 锁定',
  `model` varchar(30) DEFAULT NULL COMMENT '型号',
  `gd_model` varchar(255) DEFAULT NULL COMMENT '型号',
  `gd_specs` varchar(128) DEFAULT NULL COMMENT '规格',
  `gd_status` tinyint(1) DEFAULT '0' COMMENT '状态  0 未入库   1  已入库',
  `gd_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0正常 1锁定 2报废出库 3销售出库 4盘亏出库 5换码出库',
  `ga_id` int(15) DEFAULT NULL COMMENT '最新校准证书id',
  `gd_remark` varchar(255) DEFAULT NULL COMMENT '锁定/解锁备注',
  `gd_scrap_time` int(11) DEFAULT NULL COMMENT '报废日期',
  `gd_usetimes` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `gd_lastuse_time` int(11) DEFAULT NULL COMMENT '最后使用时间',
  `gd_check_lock` int(11) DEFAULT '1' COMMENT '盘点锁定 1正常 2：盘点锁定',
  `gd_factory_number` varchar(100) DEFAULT NULL COMMENT '出厂编号',
  `gd_warehousing_time` int(11) DEFAULT NULL COMMENT '入库时间',
  `gd_effective_time` int(11) DEFAULT NULL COMMENT '有效时间',
  `rfid_code` varchar(80) DEFAULT NULL COMMENT 'RFID编码',
  `gd_start_use_time` int(11) DEFAULT NULL COMMENT '开始使用时间',
  PRIMARY KEY (`gd_id`),
  KEY `sto_id` (`sto_id`),
  KEY `gd_series_number` (`gd_series_number`),
  KEY `rfid_code` (`rfid_code`),
  KEY `idx_gdseriesnumber_gdlock` (`gd_series_number`,`gd_lock`)
) ENGINE=InnoDB AUTO_INCREMENT=32612 DEFAULT CHARSET=utf8 COMMENT='物资明细表';

-- ----------------------------
-- Table structure for goods_details_g
-- ----------------------------
DROP TABLE IF EXISTS `goods_details_g`;
CREATE TABLE `goods_details_g` (
  `gd_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '存货明细表ID  ',
  `sto_id` int(10) unsigned NOT NULL COMMENT '存货ID',
  `id_stock_detail` varchar(16) NOT NULL COMMENT '存货编号',
  `gd_purchase_time` int(12) unsigned NOT NULL COMMENT '采购日期',
  `gd_indate` int(12) unsigned NOT NULL COMMENT '存货明细编号有效期',
  `gd_series_number` varchar(32) NOT NULL COMMENT '温度计序列号',
  `gd_lastuptime` int(12) NOT NULL,
  `gd_createtime` int(12) NOT NULL COMMENT '创建时间',
  `gd_visible` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '状态 0 删除 1 正常 2 锁定',
  `model` varchar(30) DEFAULT NULL COMMENT '型号',
  `gd_model` varchar(255) DEFAULT NULL COMMENT '型号',
  `gd_status` tinyint(1) DEFAULT '0' COMMENT '状态  0 未入库   1  已入库',
  PRIMARY KEY (`gd_id`),
  KEY `sto_id` (`sto_id`),
  KEY `id_stock_detail` (`id_stock_detail`),
  KEY `gd_series_number` (`gd_series_number`)
) ENGINE=InnoDB AUTO_INCREMENT=29148 DEFAULT CHARSET=utf8 COMMENT='物资明细表';

-- ----------------------------
-- Table structure for goods_details_lock_log
-- ----------------------------
DROP TABLE IF EXISTS `goods_details_lock_log`;
CREATE TABLE `goods_details_lock_log` (
  `gdll_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '物资锁定记录ID',
  `gd_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '存货明细表ID',
  `sw_no` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '一级仓库编号',
  `sw_name` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '一级仓库名称',
  `sto_id` int(10) unsigned NOT NULL COMMENT '存货ID',
  `sto_no` char(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '存货编号',
  `sto_name` char(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '存货名称',
  `gd_series_number` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '温度计序列号',
  `hw_id` int(11) DEFAULT NULL COMMENT '货位ID',
  `em_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '锁定人ID',
  `em_name` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '锁定人',
  `gdll_lock_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '当前锁定状态: (1-加锁中, 2-已解锁)',
  `gdll_lock_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '锁定类型: (1-温度计加锁, 2-温度计解锁)',
  `gdll_abnormal_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '异常类型: (1-温度计故障, 2-校准证书过期, 3-报废, 4-联网失败, 5-其它)',
  `gdll_model` varchar(30) CHARACTER SET utf8 NOT NULL COMMENT '型号',
  `gdll_operation_platform` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '操作平台: (1-OMS系统)',
  `gdll_remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `gdll_operation_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `gdll_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `gdll_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `gdll_unlock_times` int(11) NOT NULL DEFAULT '0' COMMENT '鼎为自动解锁检索次数',
  PRIMARY KEY (`gdll_id`),
  KEY `idx_wa_name` (`sw_name`),
  KEY `idx_sto_name` (`sto_name`),
  KEY `idx_em_name` (`em_name`),
  KEY `idx_gd_series_number` (`gd_series_number`),
  KEY `idx_glt_gls_gat` (`gdll_lock_type`,`gdll_lock_status`,`gdll_abnormal_type`)
) ENGINE=InnoDB AUTO_INCREMENT=71073 DEFAULT CHARSET=utf8mb4 COMMENT='物资明细锁定记录表';

-- ----------------------------
-- Table structure for group_alert_settings
-- ----------------------------
DROP TABLE IF EXISTS `group_alert_settings`;
CREATE TABLE `group_alert_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `connection_group_id` int(11) NOT NULL,
  `alert_inherit_parent` tinyint(1) NOT NULL DEFAULT '0',
  `alert_type` int(11) NOT NULL DEFAULT '0',
  `alert_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_direction` tinyint(1) NOT NULL DEFAULT '0',
  `alert_warn_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_warn_threshold` int(11) NOT NULL DEFAULT '0',
  `alert_critical_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_critical_threshold` int(11) NOT NULL DEFAULT '0',
  `alert_length_minute` int(11) NOT NULL DEFAULT '0',
  `alert_sent_when_raise` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_when_end` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_via_email` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_via_sms` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_via_snmp` tinyint(1) NOT NULL DEFAULT '1',
  `alert_sent_to_user_enable` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_to_all` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_to_roles` varchar(255) NOT NULL DEFAULT '[]',
  `alert_sent_alternative_email` tinyint(1) NOT NULL DEFAULT '0',
  `alert_sent_to_emails` varchar(255) DEFAULT NULL,
  `alert_sent_via_slack` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_group_alert_settings_on_alert_type` (`alert_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '医院名称',
  `level` varchar(10) DEFAULT NULL COMMENT '医院等级',
  `type` varchar(20) DEFAULT NULL COMMENT '医院类型',
  `provice` varchar(30) DEFAULT NULL COMMENT '省',
  `city` varchar(30) DEFAULT NULL COMMENT '市',
  `country` varchar(30) DEFAULT NULL COMMENT '县',
  `num` varchar(20) DEFAULT NULL COMMENT '床位数',
  `address` varchar(255) DEFAULT NULL COMMENT '医院地址',
  `provice_id` int(10) DEFAULT NULL COMMENT '省code',
  `city_id` int(10) DEFAULT NULL COMMENT '市code',
  `country_id` int(10) DEFAULT NULL COMMENT '县code',
  `source` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`h_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36588 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `in_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '存货货位id   sw_id ',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `in_quantity` smallint(6) DEFAULT '0' COMMENT '库存数量',
  `in_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `in_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `in_status` tinyint(1) unsigned DEFAULT '0' COMMENT '库存状态 0--正常 2--锁定',
  `in_locknum` int(10) unsigned DEFAULT '0' COMMENT '使用中库存锁定数量',
  `locking` int(10) NOT NULL DEFAULT '0' COMMENT '后台库存锁定数量',
  PRIMARY KEY (`in_id`),
  UNIQUE KEY `wa_id_sto_id` (`wa_id`,`sto_id`),
  KEY `wa_id` (`wa_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1029849 DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Table structure for inventory_back
-- ----------------------------
DROP TABLE IF EXISTS `inventory_back`;
CREATE TABLE `inventory_back` (
  `inc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存序号',
  `check_id` mediumint(5) NOT NULL COMMENT '盘点ID',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `inc_quantity` smallint(6) DEFAULT '0' COMMENT '库存数量',
  `inc_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `inc_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`inc_id`),
  KEY `wa_id` (`wa_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12777 DEFAULT CHARSET=utf8 COMMENT='库存盘点备份表';

-- ----------------------------
-- Table structure for inventory_back_detail
-- ----------------------------
DROP TABLE IF EXISTS `inventory_back_detail`;
CREATE TABLE `inventory_back_detail` (
  `icd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存详细序号',
  `check_id` mediumint(5) NOT NULL COMMENT '盘点ID',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `id_stock_detail` char(32) DEFAULT '' COMMENT '存货明细编号',
  `icd_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '盘点时间',
  `icd_user` int(10) unsigned DEFAULT '0' COMMENT '盘点人',
  `icd_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `state` tinyint(1) unsigned DEFAULT '0' COMMENT ' ''状态 0-库存中 1-已出库''',
  `gd_series_number` varchar(32) DEFAULT NULL COMMENT '序列号',
  `pwa_id` int(11) DEFAULT NULL COMMENT '主仓库id',
  `pwa_name` varchar(100) DEFAULT NULL COMMENT '主仓库名称',
  PRIMARY KEY (`icd_id`),
  KEY `id_stock_detail` (`id_stock_detail`),
  KEY `wa_id` (`sto_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=145897 DEFAULT CHARSET=utf8 COMMENT='库存盘点备份明细表';

-- ----------------------------
-- Table structure for inventory_check
-- ----------------------------
DROP TABLE IF EXISTS `inventory_check`;
CREATE TABLE `inventory_check` (
  `inc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存序号',
  `check_id` mediumint(5) NOT NULL COMMENT '盘点ID',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `inc_quantity` smallint(6) DEFAULT '0' COMMENT '库存数量',
  `inc_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `inc_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '盘点状态（0=盘点中，1=盘点结束）',
  `top_wa_id` int(10) unsigned DEFAULT '0' COMMENT '一级市仓ID',
  PRIMARY KEY (`inc_id`),
  UNIQUE KEY `wa_id_sto_id` (`wa_id`,`sto_id`,`check_id`),
  KEY `wa_id` (`wa_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2080 DEFAULT CHARSET=utf8 COMMENT='库存盘点表';

-- ----------------------------
-- Table structure for inventory_check_detail
-- ----------------------------
DROP TABLE IF EXISTS `inventory_check_detail`;
CREATE TABLE `inventory_check_detail` (
  `icd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存详细序号',
  `check_id` mediumint(5) NOT NULL DEFAULT '1' COMMENT '盘点ID',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `gd_series_number` varchar(155) DEFAULT NULL COMMENT '存货序列号',
  `icd_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '盘点时间',
  `icd_user` int(10) NOT NULL COMMENT '盘点人',
  `icd_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-库存中 1-已出库',
  `icd_username` varchar(50) DEFAULT NULL COMMENT '盘点人姓名',
  `top_wa_id` int(10) unsigned DEFAULT '0' COMMENT '一级市仓ID',
  PRIMARY KEY (`icd_id`),
  KEY `wa_id` (`sto_id`),
  KEY `state` (`state`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46790 DEFAULT CHARSET=utf8 COMMENT='库存盘点明细表';

-- ----------------------------
-- Table structure for inventory_check_detail_copy1
-- ----------------------------
DROP TABLE IF EXISTS `inventory_check_detail_copy1`;
CREATE TABLE `inventory_check_detail_copy1` (
  `icd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存详细序号',
  `check_id` mediumint(5) NOT NULL DEFAULT '1' COMMENT '盘点ID',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `gd_series_number` varchar(155) DEFAULT NULL COMMENT '存货序列号',
  `icd_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '盘点时间',
  `icd_user` int(10) NOT NULL COMMENT '盘点人',
  `icd_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-库存中 1-已出库',
  `icd_username` varchar(50) DEFAULT NULL COMMENT '盘点人姓名',
  PRIMARY KEY (`icd_id`),
  KEY `wa_id` (`sto_id`),
  KEY `state` (`state`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存盘点明细表';

-- ----------------------------
-- Table structure for inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `inventory_detail`;
CREATE TABLE `inventory_detail` (
  `id_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存详细序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `in_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `in_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-库存中 1-已出库',
  `in_lockstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态: ( 0-正常, 1-已锁定, 2-使用中)',
  `gd_series_number` varchar(155) DEFAULT NULL COMMENT '存货序列号',
  `stt_id` int(11) DEFAULT NULL COMMENT '存货类型序号',
  `pwa_id` int(11) DEFAULT NULL COMMENT '主仓库序号',
  `pwa_name` varchar(100) DEFAULT NULL COMMENT '主仓库名称',
  PRIMARY KEY (`id_id`),
  KEY `wa_id` (`wa_id`),
  KEY `sto_id` (`sto_id`),
  KEY `state` (`state`),
  KEY `gd_series_number` (`gd_series_number`),
  KEY `idx_waid_stoid_state_gdseriesnumber` (`wa_id`,`sto_id`,`state`,`gd_series_number`)
) ENGINE=InnoDB AUTO_INCREMENT=1452751 DEFAULT CHARSET=utf8 COMMENT='库存详细表';

-- ----------------------------
-- Table structure for inventory_warning
-- ----------------------------
DROP TABLE IF EXISTS `inventory_warning`;
CREATE TABLE `inventory_warning` (
  `iw_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `wa_id` int(11) DEFAULT NULL COMMENT '仓库id',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `top_limit` int(30) DEFAULT NULL COMMENT '上限数量',
  `floor_limit` int(30) DEFAULT NULL COMMENT '下线数量',
  PRIMARY KEY (`iw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COMMENT='库存预警表';

-- ----------------------------
-- Table structure for invoice
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `in_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '时开发票ID',
  `rb_id` int(12) NOT NULL COMMENT '发票申请单ID',
  `bi_id` int(12) NOT NULL COMMENT '发票抬头ID',
  `in_amoun` decimal(18,4) NOT NULL DEFAULT '0.0000' COMMENT '开票总金额',
  `in_amounx` decimal(18,4) DEFAULT '0.0000' COMMENT '折扣金额',
  `in_no` varchar(200) DEFAULT NULL COMMENT '发票号码',
  `in_time` int(12) DEFAULT NULL COMMENT '实际开票时间',
  `in_createtime` int(12) DEFAULT NULL COMMENT '创建时间',
  `in_lastuptime` int(12) DEFAULT NULL COMMENT '更新时间',
  `in_apptime` int(12) DEFAULT NULL COMMENT '导入开票时间',
  `in_remark` varchar(512) DEFAULT NULL COMMENT '发票备注',
  `in_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '实开发票状态 1 待开票 2 已开票 3 虚开票 4 已作废 5 已删除 6 已销账 7待打印',
  `in_amount` decimal(18,4) DEFAULT '0.0000' COMMENT '实际开票金额',
  `in_type` tinyint(2) DEFAULT NULL COMMENT '开票方式 1 金税开票 2 冲预开票 3 不开票 4 电子开票 5百旺开票 6其他',
  `in_electronic_cellphone` varchar(20) DEFAULT NULL COMMENT '电子发票联系手机',
  `in_electronic_email` varchar(50) DEFAULT NULL COMMENT '电子发票寄送邮箱',
  `in_electronic_wx` varchar(50) DEFAULT NULL COMMENT '电子发票微信',
  `com_id` int(12) DEFAULT NULL COMMENT '开票公司ID',
  `in_code` varchar(20) NOT NULL DEFAULT '' COMMENT '发票代码',
  `in_issue_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '发票种类 0蓝字发票 1红字发票',
  `br_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '预开票标记 0 正常发票 1预开票 2 冲预开票 ',
  PRIMARY KEY (`in_id`),
  UNIQUE KEY `inid` (`in_id`),
  KEY `rbid` (`rb_id`),
  KEY `biid` (`bi_id`),
  KEY `instatus` (`in_status`)
) ENGINE=InnoDB AUTO_INCREMENT=17238 DEFAULT CHARSET=utf8 COMMENT='实开发票表';

-- ----------------------------
-- Table structure for invoice_detail
-- ----------------------------
DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `id_id` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '实开发票明细表自增ID',
  `in_id` int(12) NOT NULL COMMENT '实开发票ID',
  `iovname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `imodel` varchar(255) DEFAULT '无' COMMENT '规格型号',
  `iunit` varchar(255) DEFAULT '次' COMMENT '计量单位',
  `iquantity` decimal(18,2) DEFAULT '1.00' COMMENT '数量',
  `ipricet` decimal(18,6) DEFAULT NULL COMMENT '含税单价',
  `imoneyt` decimal(18,6) DEFAULT NULL COMMENT '含税金额',
  `itaxrate` decimal(18,2) NOT NULL COMMENT '税率',
  `itaxpricet` decimal(18,4) DEFAULT NULL COMMENT '无税单价',
  `itaxmoneyt` decimal(18,4) DEFAULT NULL COMMENT '无税金额',
  `id_visible` tinyint(2) DEFAULT '1' COMMENT '状态 1 正常 2 删除',
  `check_code` varchar(30) NOT NULL DEFAULT '' COMMENT '发票校验码',
  `ciphertext` varchar(120) NOT NULL DEFAULT '' COMMENT '发票密文',
  `ss_code` varchar(19) NOT NULL DEFAULT '' COMMENT '服务编码',
  `id_remark` varchar(200) NOT NULL DEFAULT '' COMMENT '开发票备注',
  `return_json` text COMMENT '百旺返回值',
  PRIMARY KEY (`id_id`),
  UNIQUE KEY `idid` (`id_id`),
  KEY `inid` (`in_id`),
  KEY `idvisivle` (`id_visible`)
) ENGINE=InnoDB AUTO_INCREMENT=17222 DEFAULT CHARSET=utf8 COMMENT='实开发票详情';

-- ----------------------------
-- Table structure for invoice_pdf
-- ----------------------------
DROP TABLE IF EXISTS `invoice_pdf`;
CREATE TABLE `invoice_pdf` (
  `ip_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `in_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '实开发票id',
  `ip_url` varchar(255) NOT NULL DEFAULT '' COMMENT '储存地址',
  `ip_raw_url` varchar(255) NOT NULL DEFAULT '' COMMENT '开票地址',
  `ip_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开票日期',
  `ip_status` tinyint(255) NOT NULL DEFAULT '0' COMMENT '发票pdf获取状态  0未获取，1已获取',
  PRIMARY KEY (`ip_id`),
  KEY `in_id` (`in_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='发票pdf表';

-- ----------------------------
-- Table structure for iostorage
-- ----------------------------
DROP TABLE IF EXISTS `iostorage`;
CREATE TABLE `iostorage` (
  `io_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '出入库单序号',
  `io_no` char(32) DEFAULT '' COMMENT '出入库单编号，系统按规则生成：入库RK+8位序号数字，出库CK+8位序号数字',
  `io_type` tinyint(4) unsigned DEFAULT '0' COMMENT '出入库类型，0入库，1出库，2暂存入库，3暂存出库',
  `io_subtype` tinyint(4) unsigned DEFAULT '0' COMMENT '出入库方式，1采购入库，2常规入库，3订单入库，4其它入库，5常规出库，6订单出库，7报损出库，8其它出库，9调拨入库，10调拨出库，11盘点入库，12扫码归还出库，13扫码归还入库，16销售出库，17盘亏出库',
  `em_id` int(11) unsigned DEFAULT '0' COMMENT '经办人，员工序号',
  `em_name` char(32) DEFAULT '' COMMENT '经办人，员工姓名',
  `io_assign_uid` int(11) unsigned DEFAULT '0' COMMENT '指派给用户序号',
  `io_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `wa_no` char(32) DEFAULT '' COMMENT '仓库编号',
  `wa_name` char(32) DEFAULT '' COMMENT '仓库名称',
  `pu_no` char(32) DEFAULT '' COMMENT '采购单编号',
  `tr_no` char(32) DEFAULT '' COMMENT '运输单编号',
  `io_transfer` varchar(255) DEFAULT '' COMMENT '交货人或收货人',
  `io_fromto` varchar(120) DEFAULT '' COMMENT '来源去向',
  `io_status` tinyint(4) unsigned DEFAULT '0' COMMENT '出入库单状态 0新建 1已取消 2关闭 3 待审核，4，待发货 5:方案核对',
  `io_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `io_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `io_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `io_entrusttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '委托日期',
  `io_storagetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入库或出库日期',
  `io_closetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结案时间',
  `io_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `io_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `io_sample_status` int(1) unsigned DEFAULT '1' COMMENT '1未生成样本结算2已生成',
  `io_goodstype` tinyint(4) unsigned DEFAULT '1' COMMENT '出入库货物类型 1.样本，2.耗材，3.药品',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '订单ID 0为耗材出入库',
  PRIMARY KEY (`io_id`),
  KEY `wa_id` (`wa_id`),
  KEY `io_no` (`io_no`),
  KEY `tr_no` (`tr_no`),
  KEY `to_id` (`to_id`),
  KEY `io_storagetime` (`io_storagetime`),
  KEY `io_status` (`io_status`)
) ENGINE=InnoDB AUTO_INCREMENT=841731 DEFAULT CHARSET=utf8 COMMENT='出入库单表';

-- ----------------------------
-- Table structure for iostorage_detail
-- ----------------------------
DROP TABLE IF EXISTS `iostorage_detail`;
CREATE TABLE `iostorage_detail` (
  `id_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '出入库明细序号',
  `io_id` int(11) unsigned DEFAULT '0' COMMENT '出入库单序号',
  `sw_id` int(11) DEFAULT '0' COMMENT '子仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(255) DEFAULT '' COMMENT '存货名称',
  `sto_batch` char(128) DEFAULT '' COMMENT '批号',
  `id_quantity` smallint(6) DEFAULT '0' COMMENT '数量，入库数字是正数，出库数字是负数',
  `id_order_quantity` smallint(6) DEFAULT '0' COMMENT '订单数量',
  `id_adjust_quantity` smallint(6) DEFAULT '0' COMMENT '调整数量',
  `id_location` char(32) DEFAULT '' COMMENT '货物存放位置',
  `conditions` varchar(255) DEFAULT NULL COMMENT '条件区间',
  `id_remark` char(128) DEFAULT '' COMMENT '备注',
  `id_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `id_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `id_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `sto_counting` varchar(255) DEFAULT NULL COMMENT '最小单位',
  `id_sto_numbers` text COMMENT '批量录入明细',
  `id_pickup_status` tinyint(4) DEFAULT '0' COMMENT '状态 0-待捡查 1-已捡查',
  `ur_uid` int(11) DEFAULT '0' COMMENT '捡药人ID',
  `username` varchar(50) DEFAULT '' COMMENT '捡药人姓名',
  `gd_series_number` longtext COMMENT '存货序列号',
  `id_stock_detail` longtext COMMENT '存货编号',
  PRIMARY KEY (`id_id`),
  KEY `io_id` (`io_id`),
  KEY `sto_id` (`sto_id`),
  KEY `sw_id` (`sw_id`),
  KEY `id_visible` (`id_visible`),
  KEY `io_id_sto_id` (`id_visible`,`io_id`,`sto_id`,`id_quantity`)
) ENGINE=InnoDB AUTO_INCREMENT=8815749 DEFAULT CHARSET=utf8 COMMENT='出入库明细表';

-- ----------------------------
-- Table structure for jzt_air_offer
-- ----------------------------
DROP TABLE IF EXISTS `jzt_air_offer`;
CREATE TABLE `jzt_air_offer` (
  `jao_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '零担报价自增id',
  `start_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '开始城市ID',
  `start_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开始城市名称',
  `stop_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '目标城市ID',
  `stop_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '目标城市名称',
  `jao_pick_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提货费/单',
  `jao_min_freight_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最小运费/单',
  `jao_freight_100_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小于100kg运费/kg',
  `jao_freight_100_300_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '100-300kg之前运费/kg',
  `jao_freight_300_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '大于100kg运费/kg',
  `jao_min_urgent_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加急最小运费/单',
  `jao_urgent_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加急运费/kg',
  `jao_min_delivery_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低派送费/单',
  `jao_delivery_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '派送费/kg',
  `jao_urgent_delivery_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '加急派送费/单',
  `jao_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1删除',
  `jao_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `jao_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `jao_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jao_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jao_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `jao_lastupd_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jao_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`jao_id`),
  KEY `idx_start_region_id` (`start_region_id`),
  KEY `idx_stop_region_id` (`stop_region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8 COMMENT='九州通空运报价';

-- ----------------------------
-- Table structure for jzt_box_offer
-- ----------------------------
DROP TABLE IF EXISTS `jzt_box_offer`;
CREATE TABLE `jzt_box_offer` (
  `jbo_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `temp_id` int(11) NOT NULL DEFAULT '0' COMMENT '温区id ',
  `jbo_temp_zone` varchar(100) NOT NULL DEFAULT '' COMMENT '温度描述',
  `jbo_ext_size` varchar(100) NOT NULL DEFAULT '' COMMENT '保温箱外径尺寸-长*宽*高cm',
  `jbo_ext_vol` varchar(100) NOT NULL DEFAULT '' COMMENT '保温箱外体积',
  `jbo_freight_size` varchar(100) NOT NULL DEFAULT '' COMMENT '保温箱可装载尺寸-长*宽*高cm',
  `jbo_freight_vol` varchar(100) NOT NULL DEFAULT '' COMMENT '保温箱可装载体积，不含冰箱体积',
  `jbo_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保温箱重量（含冰盒）kg',
  `jbo_category` varchar(100) NOT NULL DEFAULT '' COMMENT '冰盒种类和数量',
  `jbo_unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价（包含保温箱和冰盒）元/箱',
  `jbo_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1删除',
  `jbo_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `jbo_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `jbo_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jbo_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jbo_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `jbo_lastupd_username` char(32) DEFAULT '' COMMENT '更新人姓名',
  `jbo_lastupdtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`jbo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='九州通冷冻包装箱报价';

-- ----------------------------
-- Table structure for jzt_car_convert
-- ----------------------------
DROP TABLE IF EXISTS `jzt_car_convert`;
CREATE TABLE `jzt_car_convert` (
  `jcc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `jcc_temp_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '温控类型 1常温2温控',
  `jcc_length` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '车长（米）',
  `jcc_volume` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '体积（方）',
  `jcc_load` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '载重',
  `jcc_torches` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '总托数',
  `jcc_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `jcc_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1删除',
  `jcc_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `jcc_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jcc_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jcc_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `jcc_lastupd_username` char(32) DEFAULT '' COMMENT '更新人姓名',
  `jcc_lastupdtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`jcc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='九州通车辆装载换算表';

-- ----------------------------
-- Table structure for jzt_car_offer
-- ----------------------------
DROP TABLE IF EXISTS `jzt_car_offer`;
CREATE TABLE `jzt_car_offer` (
  `jco_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '零担报价自增id',
  `jco_temp_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '温控类型 1常温,2控温',
  `start_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '开始城市ID',
  `start_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开始城市名称',
  `stop_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '目标城市ID',
  `stop_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '目标城市名称',
  `jco_offer42` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '车厢长度4.2m',
  `jco_offer72` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '车厢长度7.2m',
  `jco_offer86` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '车厢长度8.6m',
  `jco_offer96` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '车厢长度9.6m',
  `jco_offer125` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '车厢长度12.5m',
  `jco_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1删除',
  `jco_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `jco_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `jco_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jco_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jco_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `jco_lastupd_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jco_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`jco_id`),
  KEY `idx_start_region_id` (`start_region_id`),
  KEY `idx_stop_region_id` (`stop_region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 COMMENT='九州通整车报价';

-- ----------------------------
-- Table structure for jzt_scattered_offer
-- ----------------------------
DROP TABLE IF EXISTS `jzt_scattered_offer`;
CREATE TABLE `jzt_scattered_offer` (
  `jso_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '零担报价自增id',
  `jso_temp_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '温控类型 1常温,2控温',
  `start_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '开始城市ID',
  `start_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '开始城市名称',
  `stop_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '目标城市ID',
  `stop_region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '目标城市名称',
  `jso_pick_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提货费/单',
  `jso_delivery_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '送货费/单',
  `jso_unit_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费/公斤',
  `jso_minimum_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低运费',
  `jso_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1删除',
  `jso_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `jso_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `jso_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jso_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `jso_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `jso_lastupd_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `jso_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`jso_id`),
  KEY `idx_start_region_id` (`start_region_id`),
  KEY `idx_stop_region_id` (`stop_region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COMMENT='九州通零担报价';

-- ----------------------------
-- Table structure for maintenance_settings
-- ----------------------------
DROP TABLE IF EXISTS `maintenance_settings`;
CREATE TABLE `maintenance_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `start_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `duration_minute` int(11) NOT NULL DEFAULT '60',
  `connection_id` int(11) NOT NULL,
  `recurrence` int(11) NOT NULL DEFAULT '0',
  `weeks_frequency` int(11) NOT NULL DEFAULT '1',
  `weeks_day_of_week` varchar(100) NOT NULL DEFAULT '[1]',
  `months_mode` int(11) NOT NULL DEFAULT '0',
  `months_days_start` int(11) NOT NULL DEFAULT '1',
  `months_days_frequency` int(11) NOT NULL DEFAULT '1',
  `months_weeks_start` int(11) NOT NULL DEFAULT '0',
  `months_weeks_day_of_week` int(11) NOT NULL DEFAULT '1',
  `months_weeks_frequency` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for marketing
-- ----------------------------
DROP TABLE IF EXISTS `marketing`;
CREATE TABLE `marketing` (
  `mg_id` int(10) NOT NULL AUTO_INCREMENT,
  `mg_title` varchar(512) NOT NULL COMMENT '活动标题',
  `uid` int(10) NOT NULL COMMENT '负责人',
  `mg_join_number` int(5) DEFAULT '0' COMMENT '参加人数',
  `mg_cost` decimal(10,2) DEFAULT '0.00' COMMENT '活动费用',
  `mg_activity_type` tinyint(2) DEFAULT NULL COMMENT '活动类型 参考globaltype activity_type',
  `mg_activity_status` tinyint(2) DEFAULT NULL COMMENT '活动状态参考 globaltype activity_status',
  `mg_start_time` int(10) DEFAULT '0' COMMENT '开始时间',
  `mg_end_time` int(10) DEFAULT '0' COMMENT '结束时间',
  `mg_brief` text COMMENT '简介',
  `mg_summary` text COMMENT '总结',
  `at_id` varchar(128) DEFAULT NULL COMMENT '附件',
  `mg_status` tinyint(2) DEFAULT '1' COMMENT '1正常2删除',
  `mg_city` varchar(256) DEFAULT NULL COMMENT '城市',
  `mg_address` varchar(512) DEFAULT NULL COMMENT '地址',
  `mg_createtime` int(10) DEFAULT '0',
  `mg_lastupdtime` int(10) DEFAULT '0',
  PRIMARY KEY (`mg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='营销活动';

-- ----------------------------
-- Table structure for marking_drug
-- ----------------------------
DROP TABLE IF EXISTS `marking_drug`;
CREATE TABLE `marking_drug` (
  `ma_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '贴标订单药品序号',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货ID',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `sto_name` varchar(100) DEFAULT NULL COMMENT '临床试验药品',
  `cp_id` int(11) DEFAULT NULL COMMENT '项目id',
  `cp_no` varchar(100) DEFAULT NULL COMMENT '项目编号',
  `ma_temperature` varchar(30) DEFAULT NULL COMMENT '存储温度',
  `ma_marking_temperature` varchar(30) DEFAULT NULL COMMENT '贴标温度',
  `ma_num` int(11) DEFAULT NULL COMMENT '待贴标药品量',
  `ma_size` varchar(30) DEFAULT NULL COMMENT '外观尺寸',
  `ma_before_batch` varchar(128) DEFAULT NULL COMMENT '药品批号(二次包装前)',
  `ma_after_batch` varchar(128) DEFAULT NULL COMMENT '药品批号(二次包装后)',
  `ma_before_expiretime` varchar(30) DEFAULT NULL COMMENT '有效期(二次包装前)',
  `ma_after_expiretime` varchar(30) DEFAULT NULL COMMENT '有效期(二次包装后)',
  `ma_before_volume` varchar(30) DEFAULT NULL COMMENT '包装规格(二次包装前)',
  `ma_after_volume` varchar(30) DEFAULT NULL COMMENT '包装规格(二次包装后)',
  `ma_visible` tinyint(2) DEFAULT '0' COMMENT '0:正常 1:删除',
  `ma_createtime` int(11) DEFAULT NULL COMMENT '创建日期',
  `mo_id` int(11) DEFAULT NULL COMMENT '贴标订单ID',
  PRIMARY KEY (`ma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=utf8mb4 COMMENT='贴标订单药品表';

-- ----------------------------
-- Table structure for marking_order
-- ----------------------------
DROP TABLE IF EXISTS `marking_order`;
CREATE TABLE `marking_order` (
  `mo_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '贴标订单ID',
  `mo_no` varchar(30) DEFAULT NULL COMMENT '贴标单号',
  `cu_id` int(11) DEFAULT NULL COMMENT '委托客户序号',
  `cu_name` varchar(32) DEFAULT NULL COMMENT '委托客户名称',
  `cu_person` varchar(30) DEFAULT NULL COMMENT '委托联系人',
  `cu_tel` varchar(50) DEFAULT NULL COMMENT '委托人手机',
  `em_uid` int(11) DEFAULT NULL COMMENT '销售人ID',
  `em_username` varchar(30) DEFAULT NULL COMMENT '销售人员姓名',
  `marking_user_id` int(11) DEFAULT NULL COMMENT '贴标负责人ID',
  `marking_user_name` varchar(30) DEFAULT NULL COMMENT '贴标负责人姓名',
  `marking_plan_time` int(11) DEFAULT NULL COMMENT '计划贴标时间',
  `marking_begin_time` int(11) DEFAULT NULL COMMENT '贴标开始时间',
  `marking_stop_time` int(11) DEFAULT NULL COMMENT '贴标完成时间',
  `mo_status` int(11) DEFAULT '1' COMMENT '1:未开始 2:贴标中 3:贴标结束 4:已取消',
  `settle_status` int(11) DEFAULT '2' COMMENT '1:已结算  2:未结算',
  `settle_time` int(11) DEFAULT NULL COMMENT '结算时间',
  `settle_uid` int(11) DEFAULT NULL COMMENT '结算人id',
  `settle_username` varchar(30) DEFAULT NULL COMMENT '结算人姓名',
  `design_label` int(11) DEFAULT NULL COMMENT '设计标签 1:需要  2:不需要',
  `design_paper` int(11) DEFAULT NULL COMMENT '设计纸盒  1:需要 2:不需要',
  `design_signature` int(11) DEFAULT NULL COMMENT '设计封口签 1:需要 2:不需要',
  `back_up` varchar(50) DEFAULT NULL COMMENT '领料备份比',
  `sample_capacity` varchar(30) DEFAULT NULL COMMENT '每批样本留取量',
  `labelling` longtext COMMENT '贴标流程',
  `tear_sign_num` varchar(30) DEFAULT NULL COMMENT '撕签数量',
  `internal_sign_num` varchar(30) DEFAULT NULL COMMENT '贴内瓶签数量',
  `locket_sign_num` varchar(30) DEFAULT NULL COMMENT '贴小盒签数量',
  `large_sign_num` varchar(30) DEFAULT NULL COMMENT '贴大盒签数量',
  `heal_sign_num` varchar(30) DEFAULT NULL COMMENT '贴封口签数量',
  `group_record` int(11) DEFAULT NULL COMMENT '批记录 1:需要 2不需要',
  `remark` longtext COMMENT '备注',
  `mo_create_uid` int(11) DEFAULT NULL COMMENT '创建人ID',
  `mo_create_name` varchar(30) DEFAULT NULL COMMENT '创建人姓名',
  `mo_createtime` int(11) DEFAULT NULL COMMENT '订单创建时间',
  `mo_lastupdtime` int(11) DEFAULT NULL COMMENT '订单修改时间',
  `mo_visible` int(11) DEFAULT '1' COMMENT '1：正常 2:删除',
  PRIMARY KEY (`mo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for material_lend
-- ----------------------------
DROP TABLE IF EXISTS `material_lend`;
CREATE TABLE `material_lend` (
  `ml_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ml_user` int(10) unsigned NOT NULL COMMENT '责任人',
  `ml_customer` int(10) unsigned NOT NULL COMMENT '外借客户',
  `ml_type` int(1) unsigned NOT NULL COMMENT '外借类型1订单外借2仓储外借',
  `ml_cause` varchar(255) NOT NULL COMMENT '外借原因',
  `ml_createtime` int(10) NOT NULL COMMENT '创建时间',
  `ml_creator` int(10) NOT NULL COMMENT '创建人',
  PRIMARY KEY (`ml_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='耗材外借表';

-- ----------------------------
-- Table structure for metadata
-- ----------------------------
DROP TABLE IF EXISTS `metadata`;
CREATE TABLE `metadata` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for micro_customer
-- ----------------------------
DROP TABLE IF EXISTS `micro_customer`;
CREATE TABLE `micro_customer` (
  `mc_id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '客户类型0默认1微型客户',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `cu_name` varchar(255) NOT NULL COMMENT '客户名称',
  `mc_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态1正常2删除',
  `mc_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `mc_create_username` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '创建人姓名',
  `mc_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `mc_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `mc_lastupd_username` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '更新人姓名',
  `mc_lastupdtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`mc_id`) USING BTREE,
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='微型客户';

-- ----------------------------
-- Table structure for micro_customer_history
-- ----------------------------
DROP TABLE IF EXISTS `micro_customer_history`;
CREATE TABLE `micro_customer_history` (
  `mch_id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_id` int(11) NOT NULL COMMENT '微型客户id',
  `mc_type` tinyint(2) NOT NULL COMMENT '客户类型0默认1微型客户',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `cu_name` varchar(255) NOT NULL COMMENT '客户名称',
  `em_id` int(11) NOT NULL COMMENT '业务员id 对应customer表',
  `em_name` varchar(255) NOT NULL COMMENT '业务员姓名',
  `emc_id` int(11) NOT NULL COMMENT '结算专员id',
  `emc_name` varchar(255) NOT NULL COMMENT '结算专员姓名',
  PRIMARY KEY (`mch_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for mididata_email
-- ----------------------------
DROP TABLE IF EXISTS `mididata_email`;
CREATE TABLE `mididata_email` (
  `me_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `title` varchar(255) NOT NULL COMMENT '邮件标题',
  `content` longtext NOT NULL COMMENT '邮件正文内容',
  `sender` varchar(255) DEFAULT NULL COMMENT '发件人',
  `receiver` varchar(255) DEFAULT NULL COMMENT '收件人',
  `createtime` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`me_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for month_receivable
-- ----------------------------
DROP TABLE IF EXISTS `month_receivable`;
CREATE TABLE `month_receivable` (
  `mr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `mr_month` varchar(12) DEFAULT NULL COMMENT '月份',
  `cu_id` int(10) unsigned NOT NULL COMMENT '客户id',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `ar_name` varchar(30) NOT NULL COMMENT '大区名称',
  `order_num` int(10) unsigned DEFAULT NULL COMMENT '订单数量',
  `order_pack_num` int(10) unsigned DEFAULT NULL COMMENT '订单货物件数',
  `order_pack_weight` decimal(10,2) unsigned DEFAULT NULL COMMENT '订单货物重量',
  `order_sett_amount` decimal(20,2) DEFAULT NULL COMMENT '物流结算额',
  `storage_sett_amount` decimal(20,2) DEFAULT NULL COMMENT '仓储结算额',
  `other_sett_amount` decimal(20,2) DEFAULT NULL COMMENT '其他结算额',
  `sample_sett_amount` decimal(20,2) DEFAULT NULL COMMENT '样本结算额',
  `total_sett_amount` decimal(20,2) DEFAULT NULL COMMENT '结算总额',
  `checked_bill_amount` decimal(20,2) DEFAULT NULL COMMENT '已对账额',
  `make_bill_amount` decimal(20,2) DEFAULT NULL COMMENT '已开票额',
  `charge_amount` decimal(20,2) DEFAULT NULL COMMENT '已收款额',
  `receivable_amount` decimal(20,2) DEFAULT NULL COMMENT '应收金额',
  `mr_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mr_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`mr_id`),
  KEY `mr_month` (`mr_month`),
  KEY `cu_id` (`cu_id`),
  KEY `ar_name` (`ar_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1924697 DEFAULT CHARSET=utf8mb4 COMMENT='月度应收统计表';

-- ----------------------------
-- Table structure for month_receivable_record
-- ----------------------------
DROP TABLE IF EXISTS `month_receivable_record`;
CREATE TABLE `month_receivable_record` (
  `mrr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ur_uid` int(10) unsigned DEFAULT NULL COMMENT '记录操作人ID',
  `username` char(32) DEFAULT NULL COMMENT '记录操作人姓名',
  `mrr_type` tinyint(1) DEFAULT NULL COMMENT '统计类型 1 定时 2 手动',
  `mrr_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `mrr_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`mrr_id`),
  KEY `mrr_type` (`mrr_type`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='月度应收统计记录表';

-- ----------------------------
-- Table structure for monthly_statement
-- ----------------------------
DROP TABLE IF EXISTS `monthly_statement`;
CREATE TABLE `monthly_statement` (
  `ms_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '对账单序号',
  `ms_no` char(20) DEFAULT NULL COMMENT '对账单编号',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户序号',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '委托客户名称',
  `ms_cmonth` char(20) DEFAULT '' COMMENT '结算月',
  `ms_ajustmentfee` decimal(10,2) DEFAULT '0.00' COMMENT '调整费用',
  `ms_totalfee` decimal(12,4) DEFAULT '0.0000' COMMENT '汇总费用',
  `ms_rbstatus` int(1) NOT NULL DEFAULT '0' COMMENT '对账单状态 0已计提1已对账2已取消3已开票',
  `rb_id` int(11) unsigned DEFAULT '0' COMMENT '实开发票id',
  `at_id` int(10) NOT NULL DEFAULT '0' COMMENT '对账单附件id',
  `ms_assign_uid` int(11) unsigned DEFAULT NULL COMMENT '指派用户id',
  `ms_assign_username` char(32) DEFAULT '' COMMENT '指派的用户名',
  `ms_remark` longtext COMMENT '备注',
  `ms_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `ms_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `ms_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `ms_closetime` int(10) NOT NULL DEFAULT '0' COMMENT '对账单关闭时间',
  `ms_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ms_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `ms_rate` decimal(10,3) DEFAULT '0.000' COMMENT '税率',
  `ms_totalfee_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '获取不含税金额状态 0 未获取 1 已获取',
  `ms_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '对账单状态： 0未刷新税率 1已刷新税率',
  `ms_rec_url` varchar(512) DEFAULT NULL COMMENT '在线对账url',
  `ms_reconciliant` varchar(20) DEFAULT NULL COMMENT '对账人',
  `ms_confirm_state` tinyint(1) DEFAULT '0' COMMENT '在线对账客户确认状态： 0待确认 1已确认',
  `ms_confirm_time` int(10) DEFAULT NULL COMMENT '账单确认时间',
  `ms_confirm_person` varchar(32) DEFAULT NULL COMMENT '账单确认人',
  `ms_confirm_phone` varchar(11) DEFAULT NULL COMMENT '确认人电话',
  `ms_confirm_email` varchar(32) DEFAULT NULL COMMENT '确认人邮箱',
  `ms_confirm_remarks` varchar(1024) DEFAULT NULL COMMENT '在线对账客户备注',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  `ms_fee_type` int(4) DEFAULT '100' COMMENT '费用类型，详见配置文件global_type_config.php ',
  PRIMARY KEY (`ms_id`),
  KEY `cu_id` (`cu_id`),
  KEY `rb_id` (`rb_id`),
  KEY `ms_no` (`ms_no`),
  KEY `at_id` (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24728 DEFAULT CHARSET=utf8 COMMENT='对账单表';

-- ----------------------------
-- Table structure for new_customer_order
-- ----------------------------
DROP TABLE IF EXISTS `new_customer_order`;
CREATE TABLE `new_customer_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='新客户订单表';

-- ----------------------------
-- Table structure for night_transfer
-- ----------------------------
DROP TABLE IF EXISTS `night_transfer`;
CREATE TABLE `night_transfer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `transfer_no` char(13) NOT NULL COMMENT '调拨单号',
  `work_date` date NOT NULL COMMENT '工作日期',
  `city_id` int(10) unsigned NOT NULL COMMENT '城市',
  `city_name` varchar(32) NOT NULL COMMENT '城市名称',
  `storage_site_id` int(10) unsigned NOT NULL COMMENT '暂存站点id',
  `storage_site_name` varchar(32) NOT NULL COMMENT '暂存站点名称',
  `destination_site_id` int(10) unsigned NOT NULL COMMENT '目的站点id',
  `destination_site_name` varchar(32) NOT NULL COMMENT '目的站点名称',
  `order_num` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '运单数量',
  `box_num` smallint(4) unsigned NOT NULL DEFAULT '0' COMMENT '箱数',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态， 1拣货中，2拣货完成，3已发车，4已收货',
  `destination_op_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '目的地组长id',
  `destination_op_uname` varchar(20) NOT NULL DEFAULT '' COMMENT '目的地组长',
  `start_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发车人id',
  `start_uname` varchar(20) NOT NULL DEFAULT '' COMMENT '发车人',
  `receipt_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收货人id',
  `receipt_uname` varchar(20) NOT NULL DEFAULT '' COMMENT '收货人',
  `visible` tinyint(1) unsigned DEFAULT '1' COMMENT '1正常，0删除',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `create_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建人id',
  `create_uname` varchar(20) NOT NULL DEFAULT '' COMMENT '创建人',
  PRIMARY KEY (`id`),
  KEY `idx_tno_id` (`transfer_no`),
  KEY `idx_date_id` (`work_date`),
  KEY `idx_city_id` (`city_id`),
  KEY `idx_st_id` (`storage_site_id`),
  KEY `idx_dest_id` (`destination_site_id`),
  KEY `idx_status_id` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='夜班调拨单';

-- ----------------------------
-- Table structure for night_transfer_detail
-- ----------------------------
DROP TABLE IF EXISTS `night_transfer_detail`;
CREATE TABLE `night_transfer_detail` (
  `inc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增序号',
  `transfer_id` int(11) unsigned NOT NULL COMMENT '调拨单序号',
  `to_id` int(11) unsigned NOT NULL COMMENT '调拨单序号',
  `ow_id` int(11) unsigned NOT NULL COMMENT '工作单序号',
  `is_sorting` int(11) NOT NULL DEFAULT '1' COMMENT '1未分拣，2已分检',
  PRIMARY KEY (`inc_id`),
  UNIQUE KEY `idx_unique_index` (`transfer_id`,`to_id`,`ow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COMMENT='夜班调拨单详情';

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(155) DEFAULT NULL COMMENT '通知标题',
  `content` varchar(355) DEFAULT NULL COMMENT '通知内容',
  `create_time` varchar(30) DEFAULT NULL COMMENT '发送时间',
  `status` tinyint(2) DEFAULT NULL COMMENT '通知状态 1:草稿 2:已发送',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='通知管理表';

-- ----------------------------
-- Table structure for notice_read
-- ----------------------------
DROP TABLE IF EXISTS `notice_read`;
CREATE TABLE `notice_read` (
  `nr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `n_id` int(11) DEFAULT NULL COMMENT '文章id',
  PRIMARY KEY (`nr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='通知阅读表';

-- ----------------------------
-- Table structure for notification_settings
-- ----------------------------
DROP TABLE IF EXISTS `notification_settings`;
CREATE TABLE `notification_settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_when_system_error` tinyint(1) NOT NULL DEFAULT '0',
  `email_when_alert_notification` tinyint(1) NOT NULL DEFAULT '0',
  `email_smtp_server_host` varchar(255) NOT NULL DEFAULT '',
  `email_smtp_server_port` int(11) NOT NULL DEFAULT '587',
  `email_secure_connection` tinyint(1) NOT NULL DEFAULT '1',
  `email_smtp_require_login` tinyint(1) NOT NULL DEFAULT '0',
  `email_smtp_username` varchar(255) NOT NULL DEFAULT '',
  `email_smtp_password` varchar(255) NOT NULL DEFAULT '',
  `email_smtp_from_email` varchar(255) NOT NULL DEFAULT '',
  `snmp_when_alert_notification` tinyint(1) NOT NULL DEFAULT '0',
  `snmp_target_host` varchar(255) NOT NULL DEFAULT '',
  `snmp_target_port` int(11) NOT NULL DEFAULT '162',
  `snmp_community_string` varchar(255) NOT NULL DEFAULT '',
  `sms_when_alert_notification` tinyint(1) NOT NULL DEFAULT '0',
  `sms_service_provider` int(11) NOT NULL DEFAULT '1',
  `sms_provider_1_api_key` varchar(255) NOT NULL DEFAULT '',
  `sms_provider_2_account_sid` varchar(255) NOT NULL DEFAULT '',
  `sms_provider_2_auth_token` varchar(255) NOT NULL DEFAULT '',
  `sms_provider_2_use_phone_number` tinyint(1) NOT NULL DEFAULT '1',
  `sms_provider_2_phone_number` varchar(255) NOT NULL DEFAULT '',
  `sms_provider_2_messaging_service_sid` varchar(255) NOT NULL DEFAULT '',
  `sms_provider_0_api_url` varchar(255) NOT NULL DEFAULT '',
  `sms_provider_0_request_method` varchar(255) NOT NULL DEFAULT 'POST',
  `sms_provider_0_key_value` varchar(255) NOT NULL DEFAULT '',
  `sms_provider_0_content_key` varchar(255) NOT NULL DEFAULT '',
  `sms_provider_0_recipient_key` varchar(255) NOT NULL DEFAULT '',
  `slack_when_alert_notification` tinyint(1) NOT NULL DEFAULT '0',
  `slack_web_hook` varchar(255) NOT NULL DEFAULT '',
  `slack_channel` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `save_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_notifications_save_time` (`save_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for number_rules
-- ----------------------------
DROP TABLE IF EXISTS `number_rules`;
CREATE TABLE `number_rules` (
  `nr_id` int(3) NOT NULL AUTO_INCREMENT COMMENT '编号规则ID   主键',
  `rg_id` int(11) NOT NULL COMMENT '城市ID',
  `rg_name` varchar(32) NOT NULL COMMENT '城市名称',
  `nr_number` varchar(3) DEFAULT NULL COMMENT '城市编号',
  PRIMARY KEY (`nr_id`),
  UNIQUE KEY `nr_number` (`nr_number`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='仓库城市编号表';

-- ----------------------------
-- Table structure for office_current
-- ----------------------------
DROP TABLE IF EXISTS `office_current`;
CREATE TABLE `office_current` (
  `oc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `so_id` int(11) unsigned DEFAULT '0' COMMENT '办事处id',
  `oc_amount` decimal(10,2) DEFAULT '0.00' COMMENT '期初余额',
  `oc_month` char(20) DEFAULT NULL COMMENT '结转月份',
  `oc_time` int(10) unsigned DEFAULT '0' COMMENT '结转月份',
  `oc_imprest` decimal(10,2) DEFAULT '0.00' COMMENT '结转月份 备用金',
  `oc_freight` decimal(10,2) DEFAULT '0.00' COMMENT '结转月份 代收运费',
  `oc_other` decimal(10,2) DEFAULT '0.00' COMMENT '结转月份 其他收入',
  `oc_invoice` decimal(10,2) DEFAULT '0.00' COMMENT '开票支出',
  `oc_wait_invoice` decimal(10,2) DEFAULT '0.00' COMMENT '待开票支出',
  `oc_receipt` decimal(10,2) DEFAULT '0.00' COMMENT '收据支出',
  `oc_expenses` decimal(10,2) DEFAULT '0.00' COMMENT '结转月份 总支出',
  `oc_endbalance` decimal(10,2) DEFAULT NULL COMMENT '期末余额',
  `oc_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `oc_visible` tinyint(2) DEFAULT '1' COMMENT '结转状态 1 待结转 2已结转',
  PRIMARY KEY (`oc_id`),
  KEY `so_id` (`so_id`)
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8 COMMENT='期初余额表';

-- ----------------------------
-- Table structure for office_expenses
-- ----------------------------
DROP TABLE IF EXISTS `office_expenses`;
CREATE TABLE `office_expenses` (
  `oe_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '支出id',
  `oe_no` varchar(32) DEFAULT NULL COMMENT '支出编号 ',
  `so_id` int(11) unsigned DEFAULT '0' COMMENT '办事处id',
  `oe_time` int(10) unsigned DEFAULT '0' COMMENT '支出时间',
  `oe_account1` int(11) unsigned DEFAULT '0' COMMENT '一级科目id',
  `oe_account2` int(11) unsigned DEFAULT '0' COMMENT '二级科目id',
  `oe_declaration_amount` decimal(10,2) DEFAULT '0.00' COMMENT '申报金额',
  `oe_declaration_uid` int(10) DEFAULT NULL COMMENT '申报人id',
  `oe_declaration_username` char(32) DEFAULT NULL COMMENT '"申请人"',
  `oe_declaration_department` char(128) DEFAULT NULL COMMENT '申报部门',
  `oe_pay_type` tinyint(1) unsigned DEFAULT '1' COMMENT '支付类型',
  `oe_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `oe_bill` tinyint(1) unsigned DEFAULT '1' COMMENT '票据',
  `oe_audit_uid` char(32) DEFAULT '' COMMENT '审核人id',
  `oe_audit_username` char(32) DEFAULT NULL COMMENT '"审核人"',
  `oe_audit_amount` decimal(10,2) DEFAULT '0.00' COMMENT '审核金额',
  `ur_uid` int(10) DEFAULT NULL COMMENT '创建人id',
  `username` varchar(32) DEFAULT NULL COMMENT '创建人姓名',
  `oe_audit_time` int(10) unsigned DEFAULT '0' COMMENT '审核时间',
  `oe_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `oe_updatetime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `oe_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 0--(已删除) 1--待审核，2--已审核 ,3--已结转',
  PRIMARY KEY (`oe_id`),
  KEY `so_id` (`so_id`),
  KEY `oe_account1` (`oe_account1`),
  KEY `oe_account2` (`oe_account2`),
  KEY `oe_declaration_uid` (`oe_declaration_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=48938 DEFAULT CHARSET=utf8 COMMENT='办事处支出表';

-- ----------------------------
-- Table structure for office_income
-- ----------------------------
DROP TABLE IF EXISTS `office_income`;
CREATE TABLE `office_income` (
  `oi_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '收入id',
  `so_id` int(11) unsigned DEFAULT '0' COMMENT '办事处id',
  `oi_type` tinyint(1) unsigned DEFAULT '1' COMMENT '收入类型',
  `oi_remark` varchar(1024) DEFAULT NULL COMMENT '收入备注',
  `oi_amount` decimal(10,2) DEFAULT '0.00' COMMENT '收入金额',
  `oi_time` int(10) unsigned DEFAULT '0' COMMENT '收款时间',
  `oi_create_uid` int(10) DEFAULT NULL COMMENT '申请人',
  `oi_create_name` char(32) DEFAULT NULL COMMENT '申请人姓名',
  `oe_audit_uid` char(32) DEFAULT '' COMMENT '审核人id',
  `oe_audit_time` int(10) unsigned DEFAULT '0' COMMENT '审核时间',
  `oe_audit_amount` decimal(10,2) DEFAULT '0.00' COMMENT '审核金额',
  `oi_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `oi_updatetime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `oi_visible` tinyint(1) unsigned DEFAULT '2' COMMENT '状态  0--（已删除） 2--已审核 ,3--已结转',
  PRIMARY KEY (`oi_id`),
  KEY `so_id` (`so_id`),
  KEY `oe_audit_uid` (`oe_audit_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8 COMMENT='办事处收入表';

-- ----------------------------
-- Table structure for office_log
-- ----------------------------
DROP TABLE IF EXISTS `office_log`;
CREATE TABLE `office_log` (
  `ol_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '备注序号',
  `ol_type` char(8) DEFAULT '' COMMENT '备注类型，如：1收入 2支出',
  `ol_subtype` char(16) DEFAULT NULL COMMENT '操作编号 ',
  `ol_identifier` int(11) unsigned DEFAULT '0' COMMENT '备注标识，如：支出或收入序号',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `username` char(32) DEFAULT '' COMMENT '操作人',
  `ol_status` tinyint(4) unsigned DEFAULT '0' COMMENT '备注状态 0正常，1删除',
  `ol_remark` varchar(1024) DEFAULT NULL COMMENT '备注内容',
  `ol_server_type` int(10) DEFAULT NULL COMMENT '平台类型',
  `ol_createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`ol_id`),
  KEY `ol_type` (`ol_type`),
  KEY `ol_identifier` (`ol_identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=95733 DEFAULT CHARSET=utf8 COMMENT='办事处日志表';

-- ----------------------------
-- Table structure for oms_attachment_send
-- ----------------------------
DROP TABLE IF EXISTS `oms_attachment_send`;
CREATE TABLE `oms_attachment_send` (
  `oas_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `to_id` int(11) NOT NULL COMMENT '订单ID',
  `to_customer_no` varchar(128) NOT NULL COMMENT '客户单号',
  `at_ids` varchar(200) NOT NULL COMMENT '已推送附件ID',
  `send_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0表示未推送，1表示已推送',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`oas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='衫互恒瑞温度数据推送记录';

-- ----------------------------
-- Table structure for oms_customer_remark_log
-- ----------------------------
DROP TABLE IF EXISTS `oms_customer_remark_log`;
CREATE TABLE `oms_customer_remark_log` (
  `rl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '备注序号',
  `rl_type` char(8) DEFAULT '' COMMENT '备注类型',
  `rl_subtype` char(16) DEFAULT '' COMMENT '操作类型',
  `rl_identifier` int(11) unsigned DEFAULT '0' COMMENT '备注标识',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `username` char(32) DEFAULT '' COMMENT '操作人',
  `rl_status` tinyint(4) unsigned DEFAULT '0' COMMENT '备注状态 0正常，1删除',
  `rl_remark` longtext COMMENT '备注内容',
  `rl_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `rl_server_type` tinyint(2) DEFAULT '1' COMMENT '操作端口 1 电脑操作  2 m3操作 3 服务号  4 操作号',
  `rl_region_id` int(11) DEFAULT '0' COMMENT '操作城市id',
  PRIMARY KEY (`rl_id`),
  KEY `rl_identifier` (`rl_identifier`),
  KEY `rl_server_type` (`rl_server_type`),
  KEY `rl_type` (`rl_type`),
  KEY `rl_subtype` (`rl_subtype`),
  KEY `rl_createtime` (`rl_createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3072 DEFAULT CHARSET=utf8 COMMENT='客户相关日志表';

-- ----------------------------
-- Table structure for oms_drug_handover_sheet_config
-- ----------------------------
DROP TABLE IF EXISTS `oms_drug_handover_sheet_config`;
CREATE TABLE `oms_drug_handover_sheet_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `cu_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户id',
  `cu_name` varchar(150) NOT NULL DEFAULT '' COMMENT '客户名称',
  `cp_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '项目id',
  `cp_name` varchar(150) NOT NULL DEFAULT '' COMMENT '项目编号',
  `template_class` varchar(50) NOT NULL DEFAULT '' COMMENT '模版实现类',
  `state` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态:0可用 1不可用',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `create_uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建人用户id',
  `create_username` varchar(100) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `update_uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新人用户id',
  `update_username` varchar(100) NOT NULL DEFAULT '' COMMENT '更新人名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='药品交接单配置表';

-- ----------------------------
-- Table structure for oms_logistics
-- ----------------------------
DROP TABLE IF EXISTS `oms_logistics`;
CREATE TABLE `oms_logistics` (
  `ol_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '物流信息序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `ol_pickup_num` tinyint(4) unsigned DEFAULT '0' COMMENT '取件次数',
  `ol_pickup_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约取件时间',
  `ol_pickup_time` int(10) unsigned DEFAULT '0' COMMENT '取件时间',
  `ol_pickup_person` varchar(1024) DEFAULT NULL COMMENT '取件人，以逗号分隔，具有操作员标识的用户',
  `ol_pickup_name` varchar(1024) DEFAULT NULL COMMENT '取件人 用逗号间隔',
  `ol_goods_quantity` int(10) DEFAULT '0' COMMENT '货物件数',
  `ol_goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克）',
  `ol_delivery_num` tinyint(4) unsigned DEFAULT '0' COMMENT '派件次数',
  `ol_delivery_time` int(10) unsigned DEFAULT '0' COMMENT '派件时间',
  `ol_delivery_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约派件时间',
  `ol_delivery_person` varchar(1024) DEFAULT NULL COMMENT '派件人，以逗号分隔，具有操作员标识的用户',
  `ol_delivery_name` varchar(1024) DEFAULT NULL COMMENT '派件人，用逗号分隔',
  `ol_sign_name` varchar(180) DEFAULT '' COMMENT '签收人',
  `ol_pack_time` int(10) unsigned DEFAULT '0' COMMENT '方案准备时间',
  `ol_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ol_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `ol_remark` longtext COMMENT '取派备注',
  `ol_nsso_no` tinyint(2) DEFAULT NULL COMMENT 'nsso配置ID',
  `ol_payer` varchar(255) DEFAULT NULL COMMENT '他人付款--付款人',
  `ol_contact_information` char(50) DEFAULT NULL COMMENT '他人付款--联系方式',
  `ol_document` char(5) DEFAULT NULL COMMENT '随货文件 0-否 1-是',
  `ol_collection_remark` varchar(255) DEFAULT NULL COMMENT '代收原因',
  `ol_pickup_quantity` varchar(255) DEFAULT NULL COMMENT '实取数量',
  `ol_delivery_quantity` varchar(255) DEFAULT NULL COMMENT '实派数量',
  `ol_whether_consistent` int(10) DEFAULT NULL COMMENT '取派是否一致 0-否 1-是',
  `ol_pickup_planend` int(10) DEFAULT '0' COMMENT '预约取件截止时间',
  `ol_delivery_planend` int(11) DEFAULT '0' COMMENT '预约派件截止时间',
  `ol_pickup_planfw` int(2) DEFAULT '0' COMMENT '预约取件范围',
  `ol_delivery_planfw` int(2) DEFAULT '0' COMMENT '预约派件范围',
  `ol_become_time` int(10) unsigned DEFAULT NULL COMMENT '采血时间',
  `ol_static_class` int(11) unsigned DEFAULT NULL COMMENT '客户部门',
  `ol_pack_timeshow` int(10) DEFAULT '0' COMMENT '方案准备时间展示',
  `ol_upload` tinyint(1) DEFAULT '0' COMMENT '交接单据上传配置 0:未上传，1:已上传',
  `ol_hospital` int(10) DEFAULT NULL COMMENT '医院ID',
  `ol_start_hospital` int(10) DEFAULT NULL COMMENT '发件医院ID',
  `ol_tostatus` int(10) DEFAULT '0' COMMENT '时效监控状态: 0:未确认，1:已确认',
  `ol_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `ol_auto_box_type` varchar(255) DEFAULT NULL COMMENT '计划箱型',
  PRIMARY KEY (`ol_id`),
  KEY `to_id` (`to_id`),
  KEY `ol_pickup_time` (`ol_pickup_time`),
  KEY `ol_delivery_time` (`ol_delivery_time`),
  KEY `ol_auto_lastupdtime` (`ol_auto_lastupdtime`)
) ENGINE=InnoDB AUTO_INCREMENT=360122 DEFAULT CHARSET=utf8 COMMENT='运输订单物流信息表';

-- ----------------------------
-- Table structure for oms_logistics_copy1
-- ----------------------------
DROP TABLE IF EXISTS `oms_logistics_copy1`;
CREATE TABLE `oms_logistics_copy1` (
  `ol_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '物流信息序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `ol_pickup_num` tinyint(4) unsigned DEFAULT '0' COMMENT '取件次数',
  `ol_pickup_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约取件时间',
  `ol_pickup_time` int(10) unsigned DEFAULT '0' COMMENT '取件时间',
  `ol_pickup_person` varchar(1024) DEFAULT NULL COMMENT '取件人，以逗号分隔，具有操作员标识的用户',
  `ol_pickup_name` varchar(1024) DEFAULT NULL COMMENT '取件人 用逗号间隔',
  `ol_goods_quantity` int(10) DEFAULT '0' COMMENT '货物件数',
  `ol_goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克）',
  `ol_delivery_num` tinyint(4) unsigned DEFAULT '0' COMMENT '派件次数',
  `ol_delivery_time` int(10) unsigned DEFAULT '0' COMMENT '派件时间',
  `ol_delivery_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约派件时间',
  `ol_delivery_person` varchar(1024) DEFAULT NULL COMMENT '派件人，以逗号分隔，具有操作员标识的用户',
  `ol_delivery_name` varchar(1024) DEFAULT NULL COMMENT '派件人，用逗号分隔',
  `ol_sign_name` char(32) DEFAULT '' COMMENT '签收人',
  `ol_pack_time` int(10) unsigned DEFAULT '0' COMMENT '方案准备时间',
  `ol_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ol_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `ol_remark` longtext COMMENT '取派备注',
  `ol_nsso_no` tinyint(2) DEFAULT NULL COMMENT 'nsso配置ID',
  `ol_payer` varchar(255) DEFAULT NULL COMMENT '他人付款--付款人',
  `ol_contact_information` char(50) DEFAULT NULL COMMENT '他人付款--联系方式',
  `ol_document` char(5) DEFAULT NULL COMMENT '随货文件 0-否 1-是',
  `ol_collection_remark` varchar(255) DEFAULT NULL COMMENT '代收原因',
  `ol_pickup_quantity` varchar(255) DEFAULT NULL COMMENT '实取数量',
  `ol_delivery_quantity` varchar(255) DEFAULT NULL COMMENT '实派数量',
  `ol_whether_consistent` int(10) DEFAULT NULL COMMENT '取派是否一致 0-否 1-是',
  `ol_pickup_planend` int(10) DEFAULT '0' COMMENT '预约取件截止时间',
  `ol_delivery_planend` int(11) DEFAULT '0' COMMENT '预约派件截止时间',
  `ol_pickup_planfw` int(2) DEFAULT '0' COMMENT '预约取件范围',
  `ol_delivery_planfw` int(2) DEFAULT '0' COMMENT '预约派件范围',
  `ol_become_time` int(10) unsigned DEFAULT NULL COMMENT '采血时间',
  `ol_static_class` int(11) unsigned DEFAULT NULL COMMENT '客户部门',
  `ol_pack_timeshow` int(10) DEFAULT '0' COMMENT '方案准备时间展示',
  `ol_upload` tinyint(1) DEFAULT '0' COMMENT '交接单据上传配置 0:未上传，1:已上传',
  `ol_hospital` int(10) DEFAULT NULL COMMENT '医院ID',
  `ol_start_hospital` int(10) DEFAULT NULL COMMENT '发件医院ID',
  `ol_tostatus` int(10) DEFAULT '0' COMMENT '时效监控状态: 0:未确认，1:已确认',
  `ol_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  PRIMARY KEY (`ol_id`),
  KEY `to_id` (`to_id`),
  KEY `ol_pickup_time` (`ol_pickup_time`),
  KEY `ol_delivery_time` (`ol_delivery_time`),
  KEY `ol_auto_lastupdtime` (`ol_auto_lastupdtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输订单物流信息表';

-- ----------------------------
-- Table structure for oms_medidata_order_email
-- ----------------------------
DROP TABLE IF EXISTS `oms_medidata_order_email`;
CREATE TABLE `oms_medidata_order_email` (
  `moe_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL,
  `moe_email_date` int(10) NOT NULL,
  `moe_email_id` int(11) NOT NULL,
  `moe_email_title` varchar(200) NOT NULL,
  `moe_email_sender` varchar(100) NOT NULL,
  `moe_email_receiver` varchar(100) NOT NULL,
  `moe_parse_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '解析状态(-1解析失败;0未解析;1解析成功)',
  `moe_need_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否符合解析需要(-2参数缺失;-1不符合;0未解析;1符合)',
  `moe_create_status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '创建状态(-1创建失败;0未创建;1创建成功)',
  `moe_content` text NOT NULL COMMENT '解析后原始的邮件内容',
  `moe_parse_content` text NOT NULL COMMENT '解析获取所需的邮件信息',
  `moe_fail_reason` varchar(200) DEFAULT NULL,
  `moe_create_time` int(10) NOT NULL,
  PRIMARY KEY (`moe_id`),
  KEY `index_email_date` (`moe_email_date`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oms_order
-- ----------------------------
DROP TABLE IF EXISTS `oms_order`;
CREATE TABLE `oms_order` (
  `to_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单序号',
  `to_no` char(32) DEFAULT '' COMMENT '纸质运单编号',
  `to_customer_no` char(128) DEFAULT '' COMMENT '客户单号，客户内部单号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '委托客户序号',
  `cu_no` char(32) DEFAULT NULL COMMENT '委托客户编号',
  `co_id` int(11) unsigned DEFAULT NULL COMMENT '委托人序号',
  `cp_id` int(11) unsigned DEFAULT NULL COMMENT '项目序号',
  `cp_no` char(128) DEFAULT NULL COMMENT '项目编号',
  `to_taketime` int(11) unsigned DEFAULT '0' COMMENT '接单时间',
  `to_type` tinyint(4) unsigned DEFAULT '0' COMMENT '订单类型，0标准运输，1耗材调拨 ，2山东齐鲁订单',
  `to_goodstype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '货物类型（1=血样，2=样本，3=药品）',
  `to_important` tinyint(4) unsigned DEFAULT '0' COMMENT '重要程序，0普通，1重要',
  `to_timelimit` tinyint(4) unsigned DEFAULT '0' COMMENT '运送时限，0：12小时，1：24小时，2：36小时，3：48小时，4：72小时',
  `to_temperature` tinyint(4) unsigned DEFAULT '0' COMMENT '运输温度，1 CW0-30，2 HW15-25，3 HW18-30，4 LB2-8，5 GB-20，6 YD-150',
  `to_temperature_name` varchar(30) DEFAULT NULL COMMENT '运输温度记录',
  `to_thermometer` tinyint(4) unsigned DEFAULT '0' COMMENT '温度计，1无温度计，2生生温度计，3客户温度计，4客户和生生温度计',
  `to_hygrometer` tinyint(4) DEFAULT '0' COMMENT '湿度计，1无湿度计，2生生湿度计，3客户湿度计，4客户和生生湿度计',
  `to_insure` tinyint(4) unsigned DEFAULT '0' COMMENT '是否投保，0否，1是',
  `to_insure_value` decimal(20,2) DEFAULT '0.00' COMMENT '声明价值',
  `to_getcash` tinyint(4) unsigned DEFAULT '0' COMMENT '付款方式，0月结，1发货方现金，2收货方现金',
  `to_invoice` tinyint(4) unsigned DEFAULT '0' COMMENT '是否开票，0否，1是',
  `to_assign_uid` int(11) unsigned DEFAULT '0' COMMENT '指派给用户序号',
  `to_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发件所在地区ID',
  `start_region_name` char(128) DEFAULT NULL COMMENT '发件地区名',
  `start_cu_id` int(11) DEFAULT NULL,
  `start_cu_name` varchar(400) DEFAULT NULL COMMENT '发件客户',
  `start_co_name` varchar(300) DEFAULT NULL COMMENT '发件客户',
  `start_mobile_phone` varchar(180) DEFAULT NULL COMMENT '发件联系手机',
  `start_address` varchar(800) DEFAULT NULL COMMENT '发件联系地址',
  `start_itude` varchar(255) DEFAULT NULL COMMENT '收件地址经纬度',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '收件所在地区ID',
  `stop_region_name` char(128) DEFAULT NULL COMMENT '收件地区名',
  `stop_cu_id` int(11) DEFAULT NULL,
  `stop_cu_name` varchar(400) DEFAULT NULL COMMENT '收件客户',
  `stop_co_name` varchar(300) DEFAULT NULL COMMENT '收件联系人',
  `stop_mobile_phone` varchar(180) DEFAULT NULL COMMENT '收件联系手机',
  `stop_address` varchar(800) DEFAULT NULL COMMENT '收件联系地址',
  `stop_itude` varchar(255) DEFAULT NULL COMMENT '收件地址经纬度',
  `to_status` tinyint(4) unsigned DEFAULT '0' COMMENT '运输单状态 0新建 1已审核 2已取件 3已发货 4已提货 5已派件 6已反馈 7已取消 8已关闭 9 删除',
  `to_performance_status` char(4) DEFAULT '0000' COMMENT '绩效状态，0000异常投诉索赔奖励',
  `to_settlement_status` tinyint(4) unsigned DEFAULT '0' COMMENT '结算状态，0未结算，1已结算',
  `to_invoice_status` tinyint(4) unsigned DEFAULT '0' COMMENT '开票状态，0未开票，1已开票',
  `to_goods_status` tinyint(4) unsigned DEFAULT '0' COMMENT '货物状态，0货物完好，1货物破损，2货物丢失，3货物超温，4货物延时',
  `to_outbox_status` tinyint(4) unsigned DEFAULT '0' COMMENT '取件结存状态，0未结存，1已结存',
  `to_inbox_status` tinyint(4) unsigned DEFAULT '0' COMMENT '派件结存状态，0未结存，1已结存',
  `to_sign_status` tinyint(4) unsigned DEFAULT '0' COMMENT '签收单据附件状态，0未上传，1已上传',
  `to_temprecord_status` tinyint(4) unsigned DEFAULT '0' COMMENT '温度数据附件状态，0未上传，1已上传',
  `to_email` text COMMENT '联系邮箱',
  `to_remark` longtext COMMENT '客户备注',
  `to_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `to_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `to_closetime` int(10) unsigned DEFAULT '0' COMMENT '结案时间',
  `to_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `to_outbox_out_no` char(32) DEFAULT '' COMMENT '取件结存出库单号',
  `to_outbox_in_no` char(32) DEFAULT '' COMMENT '取件结存入库单号',
  `to_inbox_out_no` char(32) DEFAULT '' COMMENT '派件结存出库单号',
  `to_inbox_in_no` char(32) DEFAULT '' COMMENT '派件结存入库单号',
  `to_nocheck` tinyint(4) unsigned DEFAULT '0' COMMENT '是否不需要审核 1-是 0-否',
  `to_fileurl` varchar(255) DEFAULT NULL COMMENT '太美api附件链接',
  `to_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源',
  `changebox` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否完成换箱',
  `to_site_id` int(11) DEFAULT NULL COMMENT '科文斯项目siteId',
  `to_check_status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '客户审核状态（0=未审核，1=一审，2=二审，5=终审）',
  `to_template` tinyint(1) NOT NULL DEFAULT '1' COMMENT '济南脐血库消息推送状态 0-未推送 1-已推送',
  `to_tags` varchar(150) DEFAULT NULL COMMENT '订单标签',
  `cp_tags` varchar(150) DEFAULT NULL COMMENT '项目标签',
  `to_receipt` int(1) unsigned DEFAULT NULL COMMENT '签收类型: 1-本人签收，2-他人代收',
  `to_trequirement` int(1) DEFAULT '0' COMMENT '运输要求 0正常 2专人 3专车',
  `to_temporary` tinyint(1) DEFAULT '0' COMMENT '暂存货类型 0 未暂存  1 已暂存',
  `to_aging_remark` varchar(1024) DEFAULT NULL COMMENT '时效备注',
  `child_start_region_id` int(11) DEFAULT NULL COMMENT '出发城市子级id',
  `child_start_region_name` varchar(255) DEFAULT NULL COMMENT '出发城市子级名称',
  `child_stop_region_id` int(11) DEFAULT NULL COMMENT '到达城市子级id',
  `child_stop_region_name` varchar(255) DEFAULT NULL COMMENT '到达城市子级名称',
  `to_gatt_status` int(4) DEFAULT '0' COMMENT '校准证书状态',
  `oinvennum` varchar(25) DEFAULT NULL COMMENT '暂存编号',
  `to_hygrometer_range` varchar(255) DEFAULT NULL COMMENT '湿度区间',
  `contact_name` varchar(30) DEFAULT NULL COMMENT '委托人姓名',
  `contact_tel` varchar(30) DEFAULT NULL COMMENT '委托人手机号',
  `to_pid` int(11) DEFAULT NULL COMMENT '主单id',
  `to_attributes` int(4) NOT NULL DEFAULT '1' COMMENT '1.普通订单 2.主单 3.子单',
  `to_category` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1正常订单，2仓库发药',
  `colorcar_true` int(2) DEFAULT '0' COMMENT '是否冷藏车派送 0否 1是',
  `to_kpi` tinyint(1) DEFAULT '1' COMMENT 'KPI 1是 2否',
  `to_review_status` int(4) NOT NULL COMMENT '订单复核 1.未复核 2.已复核',
  `to_abnormal_charge_type` tinyint(1) DEFAULT '1' COMMENT '异常收费 1 无异常收费 2 异常收费',
  `bi_id` int(10) unsigned DEFAULT NULL COMMENT '开票客户id',
  `bi_name` varchar(100) DEFAULT NULL COMMENT '开票客户抬头',
  `to_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `to_identify` int(4) DEFAULT '0' COMMENT '0普通订单 1臻和合单 2泰琨合单 3九州通合单',
  `transport_type` tinyint(3) unsigned DEFAULT '0' COMMENT '运输类型 0=常规运输  1=临床发运 2=营销样品  3=其他',
  `cod_amount` decimal(20,2) DEFAULT NULL COMMENT '到付金额',
  `cod_way` tinyint(1) DEFAULT NULL COMMENT '到付方式',
  `outsource` int(11) DEFAULT '3' COMMENT '迈迪朗杰外包类型  全外包   4\n取发外包 5\n提派外包 6\n发提派外包 7',
  `to_is_lable` int(1) DEFAULT '1',
  `to_nucleic_acid` tinyint(2) DEFAULT '0' COMMENT '核酸服务 0无需检测，1 人员核酸，2外包装核酸，3药品核酸，4人员抗体检测',
  `order_check_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '订单审核状态 1待审核 2审核通过',
  `to_business_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0正常订单 2仓库发药',
  PRIMARY KEY (`to_id`),
  KEY `to_no` (`to_no`),
  KEY `to_assign_uid` (`to_assign_uid`),
  KEY `to_create_uid` (`to_create_uid`),
  KEY `to_customer_no` (`to_customer_no`),
  KEY `start_region_id` (`start_region_id`),
  KEY `stop_region_id` (`stop_region_id`),
  KEY `to_status` (`to_status`),
  KEY `to_type` (`to_type`),
  KEY `to_temperature` (`to_temperature`),
  KEY `cu_id` (`cu_id`),
  KEY `index_to_pid` (`to_pid`),
  KEY `cp_id_index` (`cp_id`),
  KEY `to_auto_lastupdtime` (`to_auto_lastupdtime`),
  KEY `idx_nuc_acid` (`to_nucleic_acid`)
) ENGINE=InnoDB AUTO_INCREMENT=1676827 DEFAULT CHARSET=utf8 COMMENT='运输订单表';

-- ----------------------------
-- Table structure for oms_order_attached
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_attached`;
CREATE TABLE `oms_order_attached` (
  `oa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` int(10) unsigned DEFAULT NULL COMMENT '订单id',
  `audit_tag` varchar(10) DEFAULT NULL COMMENT '审核标志',
  `close_tag` varchar(10) DEFAULT NULL COMMENT '关闭标志',
  `logistics` varchar(255) DEFAULT NULL COMMENT '物流',
  `other_item` varchar(1000) DEFAULT NULL COMMENT '其他事项',
  `cargo_info` varchar(255) DEFAULT NULL COMMENT '随货资料',
  `oa_createtime` int(10) unsigned DEFAULT NULL,
  `oa_updatetime` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`oa_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=750 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oms_order_box
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_box`;
CREATE TABLE `oms_order_box` (
  `ob_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL,
  `ob_type` tinyint(4) NOT NULL,
  `ob_sto_id` int(11) NOT NULL,
  `ob_sto_name` varchar(20) NOT NULL,
  `ob_sto_size` varchar(20) NOT NULL,
  `ob_sto_number` int(11) NOT NULL,
  `ob_createtime` int(10) NOT NULL,
  PRIMARY KEY (`ob_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1202 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oms_order_email
-- ----------------------------
DROP TABLE IF EXISTS `oms_order_email`;
CREATE TABLE `oms_order_email` (
  `oe_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `oe_email` varchar(255) NOT NULL DEFAULT '' COMMENT '反馈邮箱    ,号拼接',
  `oe_email_desc` text NOT NULL COMMENT '其他说明',
  `oe_contact_name` varchar(30) NOT NULL DEFAULT '' COMMENT '紧急联系人姓名',
  `oe_contact_phone` varchar(30) NOT NULL DEFAULT '' COMMENT '紧急联系人手机号',
  `oe_createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `oe_updatetime` int(10) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`oe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6106 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oms_qa_source
-- ----------------------------
DROP TABLE IF EXISTS `oms_qa_source`;
CREATE TABLE `oms_qa_source` (
  `q_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '问题id',
  `qs_source` tinyint(4) NOT NULL DEFAULT '0' COMMENT '来源 1为oms 2为客户端 3为微信',
  `qs_create_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `qs_create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  KEY `idx_q_source_id` (`q_id`,`qs_source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='问题来源表';

-- ----------------------------
-- Table structure for oms_receive_order_email
-- ----------------------------
DROP TABLE IF EXISTS `oms_receive_order_email`;
CREATE TABLE `oms_receive_order_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `receiver_message_id` varchar(150) NOT NULL COMMENT '邮件标识',
  `title` varchar(200) DEFAULT '' COMMENT '邮件标题',
  `content` longtext COMMENT '邮件内容',
  `attach` longtext COMMENT '邮件附件',
  `sender` varchar(100) DEFAULT '' COMMENT '邮件发送人',
  `receiver` varchar(100) DEFAULT '' COMMENT '邮件接收人',
  `cc_person_list` varchar(300) DEFAULT '' COMMENT '邮件抄送人',
  `send_time` datetime DEFAULT NULL COMMENT '邮件发送时间',
  `fetch_original_content` longtext COMMENT '抓取到的原始邮件内容',
  `fetch_time` datetime DEFAULT NULL COMMENT '邮件抓取时间',
  `parse_email_status` tinyint(3) DEFAULT '-1' COMMENT '-1待解析 0解析中 1解析成功 2解析失败 3不需要解析',
  `create_order_status` tinyint(3) DEFAULT '-1' COMMENT '-1待创建订单 0创建订单中 1创建订单成功 2创建订单失败',
  `order_ids` varchar(100) DEFAULT '' COMMENT '订单号，如果有多个就用,号隔开',
  `create_order_fail_reason` varchar(100) DEFAULT '' COMMENT '创建订单失败原因',
  `is_order_email` tinyint(1) DEFAULT '0' COMMENT '是否订单邮件，0否 1是',
  `create_order_fail_type` tinyint(3) DEFAULT '0' COMMENT '创建订单失败类型',
  `email_template` varchar(50) DEFAULT '' COMMENT '邮件模板',
  `processing_status` int(4) DEFAULT '1' COMMENT '客服处理状态 1.未处理 2.待确认 3.已处理 4.临时件 5.调拨包装',
  `check_repeat_email_key` varchar(35) DEFAULT '' COMMENT '检查重复邮件key',
  `fetch_strategy` varchar(30) DEFAULT 'actionFetchEmailData' COMMENT '抓取策略',
  `email_no` int(11) DEFAULT '0' COMMENT '邮件编号',
  `mailbox_account` varchar(100) DEFAULT '' COMMENT '邮箱账号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `receiver_message_id` (`receiver_message_id`),
  KEY `parse_email_status` (`parse_email_status`),
  KEY `create_order_status` (`create_order_status`),
  KEY `send_time` (`send_time`)
) ENGINE=InnoDB AUTO_INCREMENT=506834 DEFAULT CHARSET=utf8 COMMENT='邮件订单表';

-- ----------------------------
-- Table structure for oms_transport_time
-- ----------------------------
DROP TABLE IF EXISTS `oms_transport_time`;
CREATE TABLE `oms_transport_time` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `start_region_id` int(11) NOT NULL,
  `start_region_name` varchar(20) NOT NULL,
  `stop_region_id` int(11) NOT NULL,
  `stop_region_name` varchar(20) NOT NULL,
  `to_timelimit_id` tinyint(4) NOT NULL,
  `to_timelimit` varchar(20) NOT NULL,
  `createtime` int(10) NOT NULL,
  `updatetime` int(10) NOT NULL,
  `is_visible` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=343 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log` (
  `ol_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志序号',
  `type` char(8) DEFAULT NULL COMMENT '备注类型，如：100采购单、101入库单 102 订单 103-调渡单',
  `subtype` char(16) DEFAULT NULL COMMENT '操作类型，如：100001指派、100002备注、100003生成采购单',
  `ol_identifier` int(11) unsigned DEFAULT '0' COMMENT '备注标识，如：项目id',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `ol_username` char(32) DEFAULT '' COMMENT '操作人',
  `ol_status` tinyint(4) unsigned DEFAULT '0' COMMENT '备注状态 0正常，1删除',
  `ol_remark` longtext COMMENT '备注内容',
  `ol_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ol_server_type` tinyint(2) DEFAULT '1' COMMENT '操作端口 1 电脑操作  2 m3操作 3 服务号  4 操作号',
  `ol_type` char(8) DEFAULT '' COMMENT '备注类型，如：1客户项目',
  PRIMARY KEY (`ol_id`),
  KEY `ol_identifier` (`ol_identifier`),
  KEY `ol_server_type` (`ol_server_type`),
  KEY `ol_type` (`ol_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2894 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Table structure for operation
-- ----------------------------
DROP TABLE IF EXISTS `operation`;
CREATE TABLE `operation` (
  `opn_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作ID',
  `to_id` int(11) NOT NULL COMMENT '订单序号',
  `to_no` char(32) DEFAULT NULL COMMENT '运单编号',
  `opn_type` tinyint(2) DEFAULT NULL COMMENT '操作类型 1 取件 2 派件 3 发货 4 提货',
  `opn_region_id` int(11) DEFAULT NULL COMMENT '操作城市ID',
  `opn_region_name` varchar(20) DEFAULT NULL COMMENT '操作城市名称',
  `opn_date` int(11) DEFAULT NULL COMMENT '操作时间',
  `opn_opfee` decimal(10,2) DEFAULT '0.00' COMMENT '取派转操作费用',
  `opn_fahuofee` decimal(10,2) DEFAULT '0.00' COMMENT '发货费',
  `opn_tihuofee` decimal(10,2) DEFAULT '0.00' COMMENT '提货费',
  `opn_carfee` decimal(10,2) DEFAULT '0.00' COMMENT '停车费',
  `opn_dryicefee` decimal(10,2) DEFAULT '0.00' COMMENT '干冰费',
  `opn_tollfee` decimal(10,2) DEFAULT '0.00' COMMENT '路桥费',
  `opn_remark` varchar(1024) DEFAULT NULL COMMENT '操作备注',
  `opn_status` int(2) DEFAULT '0' COMMENT '状态 0未录1已录入2已审3已批准4已复核5已支付',
  `od_id` int(10) DEFAULT NULL COMMENT '取派件存order_logistics ID 提发货存dispatch ID',
  `opn_visible` tinyint(2) DEFAULT '1' COMMENT '状态1 正常 0 删除',
  `opn_othfee` decimal(10,2) DEFAULT '0.00' COMMENT '其他费',
  `opn_totalfee` decimal(10,2) DEFAULT '0.00' COMMENT '汇总费',
  `opn_zucarfee` decimal(10,2) DEFAULT '0.00' COMMENT '租车费',
  `opn_longdisfee` decimal(10,2) DEFAULT '0.00' COMMENT '远距离费',
  `opn_bigboxfee` decimal(10,2) DEFAULT '0.00' COMMENT '大箱补贴',
  `opn_person` int(11) DEFAULT NULL COMMENT '付费责任人',
  `opn_paymentday` int(11) DEFAULT NULL COMMENT '支付日期',
  `opn_opt_type` tinyint(2) DEFAULT '0' COMMENT '结算方式（付费方式）',
  `opn_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `opn_pay_type` tinyint(2) DEFAULT '1' COMMENT '垫付状态  1 非垫付 2 垫付',
  `opn_pay_name` varchar(255) DEFAULT NULL COMMENT '垫付人姓名',
  `opn_reason` varchar(1024) DEFAULT NULL COMMENT '审核不通过原因',
  `opn_check_state` tinyint(2) DEFAULT '1' COMMENT '检查状态 1.未检查 2.已检查',
  `opn_inspect` varchar(255) DEFAULT NULL COMMENT '检查人',
  `opn_hidden` int(2) NOT NULL DEFAULT '0' COMMENT '0显示 1隐藏',
  `opn_source` int(4) NOT NULL DEFAULT '1' COMMENT '录入来源 1 oms后台 2.app',
  `opn_app_status` int(4) NOT NULL DEFAULT '0' COMMENT 'app端录入审核状态 0 未录入 1已录入 2 已通过 3 未通过',
  PRIMARY KEY (`opn_id`),
  KEY `opn_type` (`opn_type`),
  KEY `to_id` (`to_id`),
  KEY `opn_status` (`opn_status`),
  KEY `idx_create_time` (`opn_createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=901203 DEFAULT CHARSET=utf8 COMMENT='操作表';

-- ----------------------------
-- Table structure for operator_type
-- ----------------------------
DROP TABLE IF EXISTS `operator_type`;
CREATE TABLE `operator_type` (
  `opt_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(5) NOT NULL COMMENT '用户ID',
  `ymmid` char(32) DEFAULT NULL COMMENT '运满满账号',
  `opt_type` int(2) DEFAULT '1' COMMENT '外协费用结算类型 0 日结  1 周节 2 运满满',
  PRIMARY KEY (`opt_id`),
  KEY `opt_id` (`opt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=581 DEFAULT CHARSET=utf8 COMMENT='外协结算类型表';

-- ----------------------------
-- Table structure for opn_operator
-- ----------------------------
DROP TABLE IF EXISTS `opn_operator`;
CREATE TABLE `opn_operator` (
  `opnop_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '操作人附表ID',
  `opn_id` int(11) DEFAULT NULL COMMENT '操作ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID ',
  `username` varchar(32) DEFAULT NULL COMMENT '操作人姓名',
  `opnop_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 正常 0删除',
  PRIMARY KEY (`opnop_id`),
  KEY `opn_id` (`opn_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1078048 DEFAULT CHARSET=utf8 COMMENT='操作人表';

-- ----------------------------
-- Table structure for opn_opr
-- ----------------------------
DROP TABLE IF EXISTS `opn_opr`;
CREATE TABLE `opn_opr` (
  `opn_id` int(10) unsigned NOT NULL,
  `test1` int(10) unsigned NOT NULL COMMENT '操作人数量',
  UNIQUE KEY `opn_id` (`opn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单操作明细操作人次表';

-- ----------------------------
-- Table structure for order_accident
-- ----------------------------
DROP TABLE IF EXISTS `order_accident`;
CREATE TABLE `order_accident` (
  `oa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '事件序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `oa_type` tinyint(4) unsigned DEFAULT '0' COMMENT '事件类型，0异常，1投诉，2索赔，3奖励',
  `oa_status` tinyint(4) unsigned DEFAULT '0' COMMENT '处理进度，1待处理，2处理中，3已解决',
  `oa_desc` varchar(1024) DEFAULT NULL COMMENT '事件描述',
  `oa_solution` varchar(1024) DEFAULT NULL COMMENT '解决方案',
  `oa_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `oa_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `oa_create_uid` int(10) NOT NULL,
  PRIMARY KEY (`oa_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100505 DEFAULT CHARSET=utf8 COMMENT='运输订单事故表';

-- ----------------------------
-- Table structure for order_accident_related
-- ----------------------------
DROP TABLE IF EXISTS `order_accident_related`;
CREATE TABLE `order_accident_related` (
  `oar_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `oa_id` int(11) unsigned DEFAULT '0' COMMENT '事件序号',
  `em_id` int(11) unsigned DEFAULT '0' COMMENT '员工序号为user表id',
  `em_name` char(32) DEFAULT NULL COMMENT '员工姓名为user表username',
  `oar_score` int(4) DEFAULT '0' COMMENT '积分，奖励积分为正数，其他积分为负数',
  `oar_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `oar_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `oar_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '关联状态 1正常 0删除',
  PRIMARY KEY (`oar_id`),
  KEY `to_id_oa_id` (`to_id`,`oa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100054 DEFAULT CHARSET=utf8 COMMENT='运输订单事故关联人员表';

-- ----------------------------
-- Table structure for order_achievements
-- ----------------------------
DROP TABLE IF EXISTS `order_achievements`;
CREATE TABLE `order_achievements` (
  `oa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '绩效id',
  `to_id` int(11) NOT NULL COMMENT '关联订单id',
  `ur_uid` int(11) NOT NULL COMMENT '绩效人id',
  `username` varchar(255) NOT NULL COMMENT '绩效人',
  `oa_type` int(4) NOT NULL DEFAULT '0' COMMENT '绩效类型0.取件 1.发货 2.提货 3.派件 4.专人 5.专车 6.方案调拨',
  `oa_visible` int(2) NOT NULL DEFAULT '1' COMMENT '是否删除 1.正常 2.删除',
  `oa_money` float(11,2) NOT NULL COMMENT '绩效金额',
  `oa_region_id` int(11) NOT NULL COMMENT '操作所属城市id',
  `oa_region_name` varchar(255) NOT NULL COMMENT '操作所属城市名称',
  `oa_carea_id` int(11) NOT NULL COMMENT '操作大区id',
  `oa_carea_name` varchar(255) NOT NULL COMMENT '操作大区名称',
  `oa_time` int(11) NOT NULL COMMENT '操作时间',
  `region_id` int(11) NOT NULL COMMENT '操作城市',
  `region_name` varchar(255) NOT NULL COMMENT '操作城市名称',
  `oa_box` varchar(255) DEFAULT NULL COMMENT '操作箱型',
  `oa_carr` varchar(255) DEFAULT NULL COMMENT '修改类型',
  PRIMARY KEY (`oa_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12955 DEFAULT CHARSET=utf8 COMMENT='物流操作绩效表';

-- ----------------------------
-- Table structure for order_cbox
-- ----------------------------
DROP TABLE IF EXISTS `order_cbox`;
CREATE TABLE `order_cbox` (
  `cb_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL COMMENT '订单id',
  `cuser_id` int(11) NOT NULL COMMENT '操作人id',
  `cusername` varchar(255) NOT NULL COMMENT '操作人姓名',
  `suser_id` int(11) NOT NULL COMMENT '确认人id',
  `susername` varchar(255) NOT NULL COMMENT '确认人姓名',
  `cb_time` varchar(255) NOT NULL COMMENT '换箱时间',
  `cb_bezhu` varchar(255) DEFAULT NULL COMMENT '换箱备注',
  PRIMARY KEY (`cb_id`),
  KEY `to_id` (`to_id`),
  KEY `cuser_id` (`cuser_id`),
  KEY `suser_id` (`suser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='订单换箱记录表';

-- ----------------------------
-- Table structure for order_customer_durg
-- ----------------------------
DROP TABLE IF EXISTS `order_customer_durg`;
CREATE TABLE `order_customer_durg` (
  `ocd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `to_id` int(11) DEFAULT NULL COMMENT '订单id',
  `durg_name` varchar(128) DEFAULT NULL COMMENT '客户货物名称',
  `durg_name_abbr` varchar(128) DEFAULT NULL COMMENT '客户货物名称缩写',
  `durg_packing` varchar(255) DEFAULT NULL COMMENT '规格',
  `durg_number` int(11) DEFAULT NULL COMMENT '数量',
  `durg_id` int(11) NOT NULL DEFAULT '0' COMMENT '货物ID',
  PRIMARY KEY (`ocd_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1074 DEFAULT CHARSET=utf8mb4 COMMENT='订单客户货物';

-- ----------------------------
-- Table structure for order_dispatch
-- ----------------------------
DROP TABLE IF EXISTS `order_dispatch`;
CREATE TABLE `order_dispatch` (
  `od_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输订单调度序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `od_batch` smallint(6) unsigned DEFAULT '1' COMMENT '运输单批次',
  `ol_goods_quantity` int(10) DEFAULT '0' COMMENT '货物件数',
  `ol_goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克）',
  `di_id` int(11) unsigned DEFAULT '0' COMMENT '调度单序号',
  `od_visible` int(1) NOT NULL DEFAULT '1' COMMENT '链接状态: 0删除1正常',
  `od_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `od_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`od_id`),
  KEY `to_id` (`to_id`),
  KEY `di_id` (`di_id`),
  KEY `od_visible` (`od_visible`)
) ENGINE=InnoDB AUTO_INCREMENT=337991 DEFAULT CHARSET=utf8 COMMENT='运输订单调度表';

-- ----------------------------
-- Table structure for order_feedback
-- ----------------------------
DROP TABLE IF EXISTS `order_feedback`;
CREATE TABLE `order_feedback` (
  `of_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '反馈序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户序号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `co_name` char(32) DEFAULT '' COMMENT '联系人',
  `of_type` tinyint(4) unsigned DEFAULT '0' COMMENT '反馈渠道，0短信，1邮件，2微信，3电话',
  `of_way` char(255) DEFAULT '' COMMENT '联系方式，如手机号码、邮箱',
  `of_tplname` char(32) DEFAULT '' COMMENT '通知模板名称',
  `of_content` longtext COMMENT '通知内容',
  `at_id` varchar(255) NOT NULL DEFAULT '' COMMENT '附件',
  `of_createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `of_lastupdtime` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `of_state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送状态 1-已发送 0-未发送',
  PRIMARY KEY (`of_id`),
  KEY `to_id` (`to_id`),
  KEY `of_state` (`of_state`)
) ENGINE=InnoDB AUTO_INCREMENT=282394 DEFAULT CHARSET=utf8 COMMENT='运输订单反馈表';

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `og_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `og_no` varchar(20) DEFAULT '' COMMENT '货物编号',
  `og_name` varchar(100) NOT NULL DEFAULT '' COMMENT '货物名称',
  `og_type` varchar(30) DEFAULT '' COMMENT '包装类型',
  `og_quantity` int(10) DEFAULT '0' COMMENT '数量',
  `og_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克）',
  `og_long` decimal(10,2) DEFAULT NULL COMMENT '长（厘米）',
  `og_width` decimal(10,2) DEFAULT NULL COMMENT '宽（厘米）',
  `og_height` decimal(10,2) DEFAULT NULL COMMENT '高（厘米）',
  `og_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `og_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `og_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `cg_id` int(11) DEFAULT '0' COMMENT '客户货物尺寸序号',
  `goods_long_num` varchar(30) DEFAULT NULL COMMENT '产品长代码',
  `goods_size` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `goods_unit` varchar(50) DEFAULT NULL COMMENT '单位',
  `base_unit_num` varchar(30) DEFAULT NULL COMMENT '基本单位数量',
  `og_source` int(11) DEFAULT '1' COMMENT '订单货物来源，1：默认来源，2：app与oms添加货物来源',
  `sto_batch` varchar(128) DEFAULT '' COMMENT '批号',
  `expiration_date` int(11) DEFAULT '0' COMMENT '失效日期',
  PRIMARY KEY (`og_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106340 DEFAULT CHARSET=utf8 COMMENT='运输订单货物表';

-- ----------------------------
-- Table structure for order_goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_goods_detail`;
CREATE TABLE `order_goods_detail` (
  `ogd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `to_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `og_id` int(11) DEFAULT NULL COMMENT '运输订单货物表ID',
  `ogd_detail` varchar(50) DEFAULT NULL COMMENT '库存明细编号',
  `ogd_createtime` int(11) DEFAULT NULL COMMENT '详情创建时间',
  `ogd_lastupdtime` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `ogd_visible` tinyint(4) DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  PRIMARY KEY (`ogd_id`),
  KEY `og_id` (`og_id`)
) ENGINE=InnoDB AUTO_INCREMENT=466 DEFAULT CHARSET=utf8mb4 COMMENT='运输订单货物编号明细表';

-- ----------------------------
-- Table structure for order_grade
-- ----------------------------
DROP TABLE IF EXISTS `order_grade`;
CREATE TABLE `order_grade` (
  `ogr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户等级序号',
  `to_id` int(11) unsigned NOT NULL COMMENT '运输单序号',
  `ogr_important` char(12) DEFAULT NULL COMMENT '订单重要性',
  `ogr_grade` tinyint(4) DEFAULT NULL COMMENT '订单重要等级',
  `ogr_create_username` char(32) DEFAULT NULL COMMENT '创建人',
  `ogr_create_uid` int(11) DEFAULT NULL COMMENT '创建人ID',
  `ogr_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `to_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源',
  PRIMARY KEY (`ogr_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=362 DEFAULT CHARSET=utf8 COMMENT='订单重要性等级表';

-- ----------------------------
-- Table structure for order_group
-- ----------------------------
DROP TABLE IF EXISTS `order_group`;
CREATE TABLE `order_group` (
  `og_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `og_name` varchar(25) NOT NULL COMMENT '分组名称',
  `og_region` text NOT NULL COMMENT '管辖城市',
  `og_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否存在 1.存在 0删除',
  PRIMARY KEY (`og_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='订单分组';

-- ----------------------------
-- Table structure for order_information
-- ----------------------------
DROP TABLE IF EXISTS `order_information`;
CREATE TABLE `order_information` (
  `oi_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单信息序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `oi_patient_number` varchar(66) DEFAULT NULL COMMENT '患者编号',
  `oi_drug_number` varchar(66) DEFAULT NULL COMMENT '药品编号',
  `oi_drug_info` varchar(255) DEFAULT NULL COMMENT '药品信息',
  `oi_status` tinyint(1) DEFAULT NULL COMMENT '修改状态 1:展示 0:不展示',
  `oi_fhtime` int(11) DEFAULT NULL COMMENT '运营调拨单发货时间',
  PRIMARY KEY (`oi_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4574 DEFAULT CHARSET=utf8 COMMENT='订单物流信息表';

-- ----------------------------
-- Table structure for order_information_copy1
-- ----------------------------
DROP TABLE IF EXISTS `order_information_copy1`;
CREATE TABLE `order_information_copy1` (
  `oi_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单信息序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `oi_patient_number` varchar(66) DEFAULT NULL COMMENT '患者编号',
  `oi_drug_number` varchar(66) DEFAULT NULL COMMENT '药品编号',
  `oi_drug_info` varchar(255) DEFAULT NULL COMMENT '药品信息',
  `oi_status` tinyint(1) DEFAULT NULL COMMENT '修改状态 1:展示 0:不展示',
  `oi_fhtime` int(11) DEFAULT NULL COMMENT '运营调拨单发货时间',
  PRIMARY KEY (`oi_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1431 DEFAULT CHARSET=utf8 COMMENT='订单物流信息表';

-- ----------------------------
-- Table structure for order_iostorage
-- ----------------------------
DROP TABLE IF EXISTS `order_iostorage`;
CREATE TABLE `order_iostorage` (
  `oi_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单出入库序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `oi_instorage_id` int(11) unsigned DEFAULT '0' COMMENT '入库单序号',
  `oi_instorage_no` char(32) DEFAULT '' COMMENT '入库单编号',
  `oi_outstorage_id` int(11) unsigned DEFAULT '0' COMMENT '出库单序号',
  `oi_outstorage_no` char(32) DEFAULT '' COMMENT '出库单编号',
  `oi_tempinstorage_id` int(11) unsigned DEFAULT '0' COMMENT '暂存入库单序号',
  `oi_tempinstorage_no` char(32) DEFAULT '' COMMENT '暂存入库单编号',
  `oi_tempoutstorage_id` int(11) unsigned DEFAULT '0' COMMENT '暂存出库单序号',
  `oi_tempoutstorage_no` char(32) DEFAULT '' COMMENT '暂存出库单编号',
  `oi_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `oi_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`oi_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输订单出入库表';

-- ----------------------------
-- Table structure for order_iostorage_real
-- ----------------------------
DROP TABLE IF EXISTS `order_iostorage_real`;
CREATE TABLE `order_iostorage_real` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL COMMENT '运单ID',
  `io_id` int(11) NOT NULL COMMENT '出库ID',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=571 DEFAULT CHARSET=utf8 COMMENT='运输订单出库表';

-- ----------------------------
-- Table structure for order_logistics
-- ----------------------------
DROP TABLE IF EXISTS `order_logistics`;
CREATE TABLE `order_logistics` (
  `ol_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '物流信息序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `ol_pickup_num` tinyint(4) unsigned DEFAULT '0' COMMENT '取件次数',
  `ol_pickup_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约取件时间',
  `ol_pickup_time` int(10) unsigned DEFAULT '0' COMMENT '取件时间',
  `ol_pickup_person` varchar(1024) DEFAULT NULL COMMENT '取件人，以逗号分隔，具有操作员标识的用户',
  `ol_pickup_name` varchar(1024) DEFAULT NULL COMMENT '取件人 用逗号间隔',
  `ol_goods_quantity` int(10) DEFAULT '0' COMMENT '货物件数',
  `ol_goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克）',
  `ol_delivery_num` tinyint(4) unsigned DEFAULT '0' COMMENT '派件次数',
  `ol_delivery_time` int(10) unsigned DEFAULT '0' COMMENT '派件时间',
  `ol_delivery_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约派件时间',
  `ol_delivery_person` varchar(1024) DEFAULT NULL COMMENT '派件人，以逗号分隔，具有操作员标识的用户',
  `ol_delivery_name` varchar(1024) DEFAULT NULL COMMENT '派件人，用逗号分隔',
  `ol_sign_name` varchar(180) DEFAULT '' COMMENT '签收人',
  `ol_pack_time` int(10) unsigned DEFAULT '0' COMMENT '方案准备时间',
  `ol_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ol_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `ol_remark` longtext COMMENT '取派备注',
  `ol_nsso_no` tinyint(2) DEFAULT NULL COMMENT 'nsso配置ID',
  `ol_payer` varchar(255) DEFAULT NULL COMMENT '他人付款--付款人',
  `ol_contact_information` char(50) DEFAULT NULL COMMENT '他人付款--联系方式',
  `ol_document` char(5) DEFAULT NULL COMMENT '随货文件 0-否 1-是',
  `ol_collection_remark` varchar(255) DEFAULT NULL COMMENT '代收原因',
  `ol_pickup_quantity` varchar(255) DEFAULT NULL COMMENT '实取数量',
  `ol_delivery_quantity` varchar(255) DEFAULT NULL COMMENT '实派数量',
  `ol_whether_consistent` int(10) DEFAULT NULL COMMENT '取派是否一致 0-否 1-是',
  `ol_pickup_planend` int(10) DEFAULT '0' COMMENT '预约取件截止时间',
  `ol_delivery_planend` int(11) DEFAULT '0' COMMENT '预约派件截止时间',
  `ol_pickup_planfw` int(2) DEFAULT '0' COMMENT '预约取件范围',
  `ol_delivery_planfw` int(2) DEFAULT '0' COMMENT '预约派件范围',
  `ol_become_time` int(10) unsigned DEFAULT NULL COMMENT '采血时间',
  `ol_static_class` int(11) unsigned DEFAULT NULL COMMENT '客户部门',
  `ol_pack_timeshow` int(10) DEFAULT '0' COMMENT '方案准备时间展示',
  `ol_upload` tinyint(1) DEFAULT '0' COMMENT '交接单据上传配置 0:未上传，1:已上传',
  `ol_hospital` int(10) DEFAULT NULL COMMENT '医院ID',
  `ol_start_hospital` int(10) DEFAULT NULL COMMENT '发件医院ID',
  `ol_tostatus` int(10) DEFAULT '0' COMMENT '时效监控状态: 0:未确认，1:已确认',
  `ol_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `ol_unsigned` tinyint(1) DEFAULT '1' COMMENT '签收单据是否签字，0未签字，1已签字',
  `ol_unsigned_status` tinyint(1) DEFAULT '0' COMMENT '签收单据未签字处理状态，0待处理，1已处理',
  `ol_pickup_time_limit` tinyint(1) DEFAULT '0' COMMENT '预取时间限制 1不能晚， 2不能早，3不能早不能晚',
  `ol_delivery_time_limit` tinyint(1) DEFAULT '0' COMMENT '预派时间限制 1不能晚， 2不能早，3不能早不能晚',
  `ol_auto_box_type` varchar(255) DEFAULT NULL COMMENT '计划箱型',
  PRIMARY KEY (`ol_id`),
  KEY `to_id` (`to_id`),
  KEY `ol_pickup_time` (`ol_pickup_time`),
  KEY `ol_delivery_time` (`ol_delivery_time`),
  KEY `ol_auto_lastupdtime` (`ol_auto_lastupdtime`),
  KEY `ol_pickup_planbegin` (`ol_pickup_planbegin`)
) ENGINE=InnoDB AUTO_INCREMENT=360122 DEFAULT CHARSET=utf8 COMMENT='运输订单物流信息表';

-- ----------------------------
-- Table structure for order_logistics_tmscar_warning
-- ----------------------------
DROP TABLE IF EXISTS `order_logistics_tmscar_warning`;
CREATE TABLE `order_logistics_tmscar_warning` (
  `oltw_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '专车订单预警序号',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单序号',
  `oltw_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '预警状态 0/未延迟 1/预计延迟 2/实际延迟 3/预计,实际延迟',
  `oltw_pickup_distance` int(11) NOT NULL DEFAULT '0' COMMENT '取件剩余距离',
  `oltw_pickup_distance_time` int(11) NOT NULL DEFAULT '0' COMMENT '取件剩余距离需要时间',
  `oltw_pickup_time` int(11) NOT NULL DEFAULT '0' COMMENT '取件预计延迟时间',
  `oltw_delivery_distance` int(11) NOT NULL DEFAULT '0' COMMENT '派件剩余距离',
  `oltw_delivery_distance_time` int(11) NOT NULL DEFAULT '0' COMMENT '派件剩余距离需要时间',
  `oltw_delivery_time` int(11) NOT NULL DEFAULT '0' COMMENT '派件预计延迟时间',
  `oltw_warning_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否预警 1/0',
  PRIMARY KEY (`oltw_id`),
  UNIQUE KEY `uniq_to_id` (`to_id`) USING BTREE COMMENT '订单预警一对一'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='专车订单预警信息';

-- ----------------------------
-- Table structure for order_material
-- ----------------------------
DROP TABLE IF EXISTS `order_material`;
CREATE TABLE `order_material` (
  `om_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单包装耗材序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `wa_no` char(32) DEFAULT '' COMMENT '仓库编号',
  `wa_name` char(32) DEFAULT '' COMMENT '仓库名称',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(32) DEFAULT '' COMMENT '存货名称',
  `id_stock_detail` varchar(1024) DEFAULT '' COMMENT '存货明细编号',
  `gd_series_number` varchar(32) DEFAULT NULL COMMENT '温度计序列号',
  `open_temperature` varchar(6) DEFAULT NULL COMMENT '温度计开启温度',
  `clos_temperature` varchar(6) DEFAULT NULL COMMENT '温度计关闭温度',
  `om_quantity` int(10) DEFAULT '0' COMMENT '数量',
  `om_weight` decimal(10,2) DEFAULT '0.00' COMMENT '重量（千克）',
  `ol_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ol_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `start_temperature` varchar(55) DEFAULT NULL COMMENT '取件温度',
  `stop_temperature` varchar(55) DEFAULT NULL COMMENT '派件温度',
  `ga_indate` int(11) NOT NULL DEFAULT '0' COMMENT '校准证书有效期',
  `stt_id` int(11) DEFAULT NULL COMMENT '存货类型序号',
  PRIMARY KEY (`om_id`),
  KEY `to_id` (`to_id`),
  KEY `sto_id` (`sto_id`),
  KEY `gd_series_number` (`gd_series_number`),
  KEY `visible` (`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=475444 DEFAULT CHARSET=utf8 COMMENT='运输单包装耗材表';

-- ----------------------------
-- Table structure for order_material_copy1
-- ----------------------------
DROP TABLE IF EXISTS `order_material_copy1`;
CREATE TABLE `order_material_copy1` (
  `om_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单包装耗材序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `wa_no` char(32) DEFAULT '' COMMENT '仓库编号',
  `wa_name` char(32) DEFAULT '' COMMENT '仓库名称',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(32) DEFAULT '' COMMENT '存货名称',
  `id_stock_detail` varchar(1024) DEFAULT '' COMMENT '存货明细编号',
  `gd_series_number` varchar(32) DEFAULT NULL COMMENT '温度计序列号',
  `open_temperature` varchar(6) DEFAULT NULL COMMENT '温度计开启温度',
  `clos_temperature` varchar(6) DEFAULT NULL COMMENT '温度计关闭温度',
  `om_quantity` int(10) DEFAULT '0' COMMENT '数量',
  `om_weight` decimal(10,2) DEFAULT '0.00' COMMENT '重量（千克）',
  `ol_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ol_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `start_temperature` varchar(55) DEFAULT NULL COMMENT '取件温度',
  `stop_temperature` varchar(55) DEFAULT NULL COMMENT '派件温度',
  `ga_indate` int(11) NOT NULL DEFAULT '0' COMMENT '校准证书有效期',
  `stt_id` int(11) DEFAULT NULL COMMENT '存货类型序号',
  PRIMARY KEY (`om_id`),
  KEY `to_id` (`to_id`),
  KEY `sto_id` (`sto_id`),
  KEY `gd_series_number` (`gd_series_number`),
  KEY `visible` (`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=467210 DEFAULT CHARSET=utf8 COMMENT='运输单包装耗材表';

-- ----------------------------
-- Table structure for order_material_old
-- ----------------------------
DROP TABLE IF EXISTS `order_material_old`;
CREATE TABLE `order_material_old` (
  `om_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单包装耗材序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `wa_no` char(32) DEFAULT '' COMMENT '仓库编号',
  `wa_name` char(32) DEFAULT '' COMMENT '仓库名称',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(32) DEFAULT '' COMMENT '存货名称',
  `id_stock_detail` varchar(1024) DEFAULT '' COMMENT '存货明细编号',
  `om_quantity` int(10) DEFAULT '0' COMMENT '数量',
  `om_weight` decimal(10,2) DEFAULT '0.00' COMMENT '重量（千克）',
  `ol_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ol_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  PRIMARY KEY (`om_id`),
  KEY `to_id` (`to_id`),
  KEY `sto_id` (`sto_id`),
  KEY `visible` (`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=528328 DEFAULT CHARSET=utf8 COMMENT='运输单包装耗材表';

-- ----------------------------
-- Table structure for order_material_plan
-- ----------------------------
DROP TABLE IF EXISTS `order_material_plan`;
CREATE TABLE `order_material_plan` (
  `omp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '计划包装序号',
  `omp_to_id` int(11) NOT NULL COMMENT '运单序号',
  `omp_sto_id` int(11) NOT NULL COMMENT '存货序号',
  `omp_sto_name` varchar(32) DEFAULT NULL COMMENT '存货名称',
  `omp_quantity` int(5) NOT NULL COMMENT '数量',
  `omp_type` int(1) NOT NULL DEFAULT '1' COMMENT '结算类型：1未确认 2计划包装 3实际包装',
  `omp_status` int(1) NOT NULL DEFAULT '1' COMMENT '结算状态：1未结算 2已结算',
  `omp_visible` int(1) NOT NULL DEFAULT '1' COMMENT '1无效2有效',
  `omp_createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `plan_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '方案类型：0人工计算 1系统计算',
  `omp_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '计划箱型创建人用户id',
  `omp_plan_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '方案类型：0人工计算 1系统计算',
  PRIMARY KEY (`omp_id`),
  KEY `omp_to_id` (`omp_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4731 DEFAULT CHARSET=utf8 COMMENT='订单计划包装';

-- ----------------------------
-- Table structure for order_settlement
-- ----------------------------
DROP TABLE IF EXISTS `order_settlement`;
CREATE TABLE `order_settlement` (
  `os_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '结算序号',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运输单序号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户序号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `os_insurate` decimal(10,3) DEFAULT '0.000' COMMENT '保价费率',
  `os_firstfee` decimal(10,2) DEFAULT '0.00' COMMENT '首重费',
  `os_plusfee` decimal(10,2) DEFAULT '0.00' COMMENT '续重费',
  `os_packfee` decimal(10,2) DEFAULT '0.00' COMMENT '包装费',
  `os_icefee` decimal(10,2) DEFAULT '0.00' COMMENT '制冷费',
  `os_insufee` decimal(10,2) DEFAULT '0.00' COMMENT '保险费',
  `os_changefee` decimal(10,2) DEFAULT '0.00' COMMENT '中转费',
  `os_tempfee` decimal(10,2) DEFAULT '0.00' COMMENT '温度计费用',
  `os_otherfee` decimal(10,2) DEFAULT '0.00' COMMENT '其他费',
  `os_otherfee_detail` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '其他费（不包括特殊费）',
  `os_totalfee` decimal(12,4) DEFAULT '0.0000' COMMENT '折后合计费用(折扣后费用合计)',
  `os_total` decimal(12,4) DEFAULT '0.0000' COMMENT '合计费用(折扣前费用合计)',
  `os_cpid` int(11) DEFAULT '0' COMMENT '项目ID',
  `rb_id` int(11) DEFAULT NULL,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `os_remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `os_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `os_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `os_tax` decimal(10,2) DEFAULT '0.00' COMMENT '税金',
  `os_income` decimal(12,4) DEFAULT '0.0000' COMMENT '不含税金额',
  `os_tot` decimal(10,2) DEFAULT '0.00' COMMENT '报价总额',
  `os_boxs` varchar(64) DEFAULT NULL COMMENT '订单结算箱型',
  `os_weight` double(6,2) DEFAULT '0.00' COMMENT '订单结算重量',
  `os_modes` tinyint(1) NOT NULL DEFAULT '0' COMMENT '结算方式 0 手动结算 1自动结算',
  `os_carry_down_status` tinyint(1) DEFAULT '1' COMMENT '结转状态 1未结转 2 已结转',
  `os_taxrate` decimal(10,2) DEFAULT NULL COMMENT '结算税率',
  `os_discount_rate` decimal(10,2) DEFAULT '1.00' COMMENT '折扣率',
  `os_month` varchar(255) DEFAULT NULL COMMENT '结算单月份',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  `os_total_quantity` int(11) unsigned DEFAULT '0' COMMENT '订单结算箱数',
  `os_single_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '订单结算运费单价',
  `cu_segment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '业务板块',
  PRIMARY KEY (`os_id`,`to_id`),
  KEY `to_id` (`to_id`),
  KEY `os_cpid` (`os_cpid`),
  KEY `ms_id` (`ms_id`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8558157 DEFAULT CHARSET=utf8 COMMENT='运输订单费用结算表';

-- ----------------------------
-- Table structure for order_settlement_boxs
-- ----------------------------
DROP TABLE IF EXISTS `order_settlement_boxs`;
CREATE TABLE `order_settlement_boxs` (
  `osb_id` int(255) NOT NULL AUTO_INCREMENT,
  `to_id` int(15) NOT NULL DEFAULT '0' COMMENT '订单id',
  `sto_id` int(15) NOT NULL DEFAULT '0' COMMENT '包装箱id',
  `osb_quantity` int(10) NOT NULL DEFAULT '0' COMMENT '结算数量',
  `sto_no` varchar(32) DEFAULT NULL COMMENT '包装箱编号',
  `sto_name` varchar(64) DEFAULT NULL COMMENT '包装箱名称',
  `osb_visible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '结算包装状态 1 正常 2删除',
  `osb_createtime` int(10) DEFAULT NULL,
  `osb_weight` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算包装重量',
  PRIMARY KEY (`osb_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8986 DEFAULT CHARSET=utf8mb4 COMMENT='订单结算耗材表';

-- ----------------------------
-- Table structure for order_settlement_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_settlement_detail`;
CREATE TABLE `order_settlement_detail` (
  `osd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单结算详情id',
  `os_id` int(11) unsigned NOT NULL COMMENT '订单结算id',
  `durg_name_abbr` varchar(128) DEFAULT NULL COMMENT '客户货物名称缩写',
  `os_insufee` decimal(10,2) DEFAULT '0.00' COMMENT '保险费',
  `durg_number` int(11) DEFAULT NULL COMMENT '数量',
  `osd_province` varchar(128) DEFAULT NULL COMMENT '省',
  `osd_city` varchar(128) DEFAULT NULL COMMENT '市',
  `osd_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `osd_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`osd_id`),
  KEY `os_id` (`os_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8 COMMENT='订单结算货物详情表';

-- ----------------------------
-- Table structure for order_settlement_discount
-- ----------------------------
DROP TABLE IF EXISTS `order_settlement_discount`;
CREATE TABLE `order_settlement_discount` (
  `osd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '折扣统计id',
  `dc_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '折扣表id(discount_config)',
  `dcd_id` int(11) NOT NULL DEFAULT '0' COMMENT '折扣详情id(discount_config_detail)',
  `os_month` varchar(12) NOT NULL DEFAULT '0' COMMENT '结算单月份',
  `os_total_sum` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '累计结算金额',
  `discount_rate` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '折扣率',
  `os_order_count` int(11) NOT NULL DEFAULT '0' COMMENT '订单数量',
  `osd_remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `osd_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `osd_create_uid` int(10) NOT NULL DEFAULT '0' COMMENT '创建人',
  `osd_lastupd_uid` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `osd_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `osd_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`osd_id`),
  KEY `idx_dc_id` (`dc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='订单折扣统计表';

-- ----------------------------
-- Table structure for order_settlement_discount_change
-- ----------------------------
DROP TABLE IF EXISTS `order_settlement_discount_change`;
CREATE TABLE `order_settlement_discount_change` (
  `osdc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单折扣统计变更id',
  `osd_id` int(11) NOT NULL DEFAULT '0' COMMENT '折扣统计id',
  `dc_id` int(11) NOT NULL DEFAULT '0' COMMENT '折扣id',
  `ex_dcd_id` int(11) NOT NULL DEFAULT '0' COMMENT '更新前 折扣规则id',
  `ex_discount_rate` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '更新前 折扣率',
  `new_dcd_id` int(11) NOT NULL DEFAULT '0' COMMENT '更新后 折扣规则id',
  `new_discount_rate` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '更新后 折扣率',
  `change_massage` varchar(1024) NOT NULL DEFAULT '' COMMENT '申请原因',
  `osdc_at_id` varchar(255) NOT NULL DEFAULT '' COMMENT '附件id',
  `osdc_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `osdc_create_uid` int(10) NOT NULL DEFAULT '0' COMMENT '创建人',
  `osdc_create_username` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '创建人姓名',
  `osdc_lastupd_uid` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `osdc_lastupd_username` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '更新人姓名',
  `osdc_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `osdc_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`osdc_id`),
  KEY `idx_osd_id` (`osd_id`),
  KEY `idx_dc_id` (`dc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COMMENT='订单折扣统计变更表';

-- ----------------------------
-- Table structure for order_settlement_hot
-- ----------------------------
DROP TABLE IF EXISTS `order_settlement_hot`;
CREATE TABLE `order_settlement_hot` (
  `os_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '结算序号',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运输单序号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户序号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `os_insurate` decimal(10,3) DEFAULT '0.000' COMMENT '保价费率',
  `os_firstfee` decimal(10,2) DEFAULT '0.00' COMMENT '首重费',
  `os_plusfee` decimal(10,2) DEFAULT '0.00' COMMENT '续重费',
  `os_packfee` decimal(10,2) DEFAULT '0.00' COMMENT '包装费',
  `os_icefee` decimal(10,2) DEFAULT '0.00' COMMENT '制冷费',
  `os_insufee` decimal(10,2) DEFAULT '0.00' COMMENT '保险费',
  `os_changefee` decimal(10,2) DEFAULT '0.00' COMMENT '中转费',
  `os_tempfee` decimal(10,2) DEFAULT '0.00' COMMENT '温度计费用',
  `os_otherfee` decimal(10,2) DEFAULT '0.00' COMMENT '其他费',
  `os_otherfee_detail` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '其他费（不包括特殊费）',
  `os_totalfee` decimal(12,4) DEFAULT '0.0000' COMMENT '折后合计费用(折扣后费用合计)',
  `os_total` decimal(12,4) DEFAULT '0.0000' COMMENT '合计费用(折扣前费用合计)',
  `os_cpid` int(11) DEFAULT '0' COMMENT '项目ID',
  `rb_id` int(11) DEFAULT NULL,
  `ms_id` int(11) NOT NULL DEFAULT '0' COMMENT '结算ID',
  `os_remark` varchar(1024) NOT NULL DEFAULT '' COMMENT '备注',
  `os_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `os_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `os_tax` decimal(10,2) DEFAULT '0.00' COMMENT '税金',
  `os_income` decimal(12,4) DEFAULT '0.0000' COMMENT '不含税金额',
  `os_tot` decimal(10,2) DEFAULT '0.00' COMMENT '报价总额',
  `os_boxs` varchar(64) DEFAULT NULL COMMENT '订单结算箱型',
  `os_weight` double(6,2) DEFAULT '0.00' COMMENT '订单结算重量',
  `os_modes` tinyint(1) NOT NULL DEFAULT '0' COMMENT '结算方式 0 手动结算 1自动结算',
  `os_carry_down_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '结转状态 1未结转 2 已结转',
  `os_taxrate` decimal(10,2) DEFAULT NULL COMMENT '结算税率',
  `os_discount_rate` decimal(10,2) DEFAULT '1.00' COMMENT '折扣率',
  `os_month` varchar(12) DEFAULT NULL COMMENT '结算单月份',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  `os_total_quantity` int(11) unsigned DEFAULT '0' COMMENT '订单结算箱数',
  `os_single_price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '订单结算运费单价',
  `cu_segment` tinyint(4) NOT NULL DEFAULT '0' COMMENT '业务板块',
  PRIMARY KEY (`os_id`,`to_id`) USING BTREE,
  KEY `os_cpid` (`os_cpid`),
  KEY `ms_id` (`ms_id`),
  KEY `cu_id` (`cu_id`),
  KEY `os_month` (`os_month`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8558157 DEFAULT CHARSET=utf8 COMMENT='运输订单费用结算表热数据表';

-- ----------------------------
-- Table structure for order_settlement_jzt_detil
-- ----------------------------
DROP TABLE IF EXISTS `order_settlement_jzt_detil`;
CREATE TABLE `order_settlement_jzt_detil` (
  `osj_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '九州通结算明细自增id',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运输单序号',
  `os_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单结算id',
  `osj_volume` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '体积',
  `osj_weight` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `osj_offer_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '报价类型 1零担报价 2 整车报价 3航空报价',
  `osj_offer_id` int(11) NOT NULL DEFAULT '0' COMMENT '九州通报价ID',
  `osj_unit_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费(单价)/公斤',
  `osj_minimum_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低运费',
  `osj_yun_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `osj_pick_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '提货费/单',
  `osj_delivery_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '送货费/单',
  `osj_other_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '其他费用（冷冻箱/加急）',
  `osj_warm_area` varchar(255) CHARACTER SET utf8mb4 NOT NULL COMMENT '温区',
  `osj_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `osj_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`osj_id`),
  KEY `idx_os_id` (`os_id`) USING BTREE,
  KEY `idx_to_id` (`to_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=783 DEFAULT CHARSET=utf8 COMMENT='九州通结算明细';

-- ----------------------------
-- Table structure for order_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `order_snapshot`;
CREATE TABLE `order_snapshot` (
  `osn_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '快照序号',
  `osn_type` char(8) DEFAULT '' COMMENT '快照类型，如：001客户、002供应商、003订单、004采购单、005出库单 006-项目',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '快照标识，如：订单序号等',
  `to_temperature` tinyint(4) unsigned DEFAULT '0' COMMENT '运输温度，1 CW0-30，2 HW15-25，3 HW18-30，4 LB2-8，5 GB-20，6 YD-150',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户序号',
  `cp_id` smallint(6) unsigned DEFAULT '0' COMMENT '项目id',
  `stop_address` char(128) DEFAULT NULL COMMENT '收件联系地址',
  `osn_create_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `osn_filesize` int(11) unsigned DEFAULT '0' COMMENT '快照文件大小，单位：KB',
  `osn_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '快照状态 1正常，0删除',
  `osn_filename` char(255) DEFAULT '' COMMENT '快照文件名',
  `osn_filepath` varchar(1024) DEFAULT '' COMMENT '快照文件路径',
  `osn_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `to_source` tinyint(1) unsigned DEFAULT '2' COMMENT '快照来源 1--oms 2--oms客户系统 3--微信服务号',
  `cp_no` char(255) DEFAULT '' COMMENT '项目编号',
  `cpid` int(11) unsigned DEFAULT '0' COMMENT '是否是复制订单',
  PRIMARY KEY (`osn_id`),
  KEY `idx_osn_type` (`osn_type`),
  KEY `idx_osn_create_uid` (`osn_create_uid`),
  KEY `idx_to_id` (`to_id`),
  KEY `idx_cu_cp_id` (`cu_id`,`cp_id`),
  KEY `idx_osn_createtime` (`osn_createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='下单快照表';

-- ----------------------------
-- Table structure for order_special
-- ----------------------------
DROP TABLE IF EXISTS `order_special`;
CREATE TABLE `order_special` (
  `osp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '特殊费用关联id',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '运输单序号',
  `sc_id` int(11) NOT NULL DEFAULT '0' COMMENT '配置id special_config表id',
  `sc_no` int(20) NOT NULL DEFAULT '0' COMMENT '特殊费用编号',
  `sc_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收费名称',
  `sc_explain` varchar(2000) NOT NULL DEFAULT '' COMMENT '收费说明',
  `sc_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `osp_number` decimal(20,2) unsigned NOT NULL DEFAULT '1.00' COMMENT '计费数量',
  `sc_units` varchar(20) NOT NULL DEFAULT '' COMMENT '单位',
  `osp_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `osp_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `osp_remark` varchar(255) DEFAULT NULL,
  `osp_create_uid` int(10) NOT NULL DEFAULT '0' COMMENT '创建人',
  `osp_create_username` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '创建用户姓名',
  `osp_lastupd_uid` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `osp_lastupd_username` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后更新用户姓名',
  `osp_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `osp_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`osp_id`),
  KEY `idx_to_id` (`to_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14445 DEFAULT CHARSET=utf8mb4 COMMENT='特殊费用关联表';

-- ----------------------------
-- Table structure for order_special_settlement
-- ----------------------------
DROP TABLE IF EXISTS `order_special_settlement`;
CREATE TABLE `order_special_settlement` (
  `oss_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '特殊费用结算主键',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `os_id` int(11) NOT NULL DEFAULT '0' COMMENT '结算id',
  `oss_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '结算费用类型 1企业配置 2客户配置',
  `csc_id` tinyint(11) NOT NULL DEFAULT '0' COMMENT '客户费用配置主键',
  `sc_no` int(20) NOT NULL DEFAULT '0' COMMENT '特殊费用编号',
  `oss_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算单价',
  `oss_number` int(20) NOT NULL DEFAULT '0' COMMENT '结算数量',
  `oss_total` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算总价',
  `oss_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '特殊费用结算状态 默认0',
  `oss_show` varchar(255) NOT NULL DEFAULT '' COMMENT '说明',
  `created_username` char(32) NOT NULL DEFAULT '' COMMENT '创建人名称',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `update_uid` int(11) NOT NULL DEFAULT '0' COMMENT '修改人',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`oss_id`),
  KEY `idx_to_id` (`to_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=847 DEFAULT CHARSET=utf8mb4 COMMENT='订单特殊费用结算表';

-- ----------------------------
-- Table structure for order_temperature_record
-- ----------------------------
DROP TABLE IF EXISTS `order_temperature_record`;
CREATE TABLE `order_temperature_record` (
  `otr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单温度记录表',
  `to_id` int(11) DEFAULT NULL COMMENT '订单id',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `id_stock_detail` int(11) DEFAULT NULL COMMENT '存货编号',
  `gd_series_number` varchar(255) DEFAULT NULL COMMENT '温度计序列号',
  `to_temperature` varchar(255) DEFAULT NULL COMMENT '订单温度范围',
  `ur_uid` int(11) DEFAULT NULL COMMENT '操作人id',
  `username` varchar(255) DEFAULT NULL COMMENT '操作人姓名',
  `to_status` varchar(255) DEFAULT NULL COMMENT '订单状态',
  `otr_temperature` varchar(255) DEFAULT NULL COMMENT '记录温度',
  `otr_isoverheat` int(10) DEFAULT NULL COMMENT '是否超温 0：正常 1：超温 ',
  `otr_time` int(11) DEFAULT NULL COMMENT '温度记录时间',
  `otr_visible` tinyint(255) DEFAULT '1' COMMENT '温度记录 1:显示 0：删除',
  `otr_region_id` int(11) DEFAULT NULL COMMENT '温度检查城市id',
  `otr_region_name` varchar(50) DEFAULT NULL COMMENT '温度检查城市名字',
  `otr_status` int(2) NOT NULL DEFAULT '0' COMMENT '检查记录是否确认  0未确认 1已确认',
  PRIMARY KEY (`otr_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for order_thermometer
-- ----------------------------
DROP TABLE IF EXISTS `order_thermometer`;
CREATE TABLE `order_thermometer` (
  `oth_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单温度上传记录id',
  `tro_id` int(11) DEFAULT NULL COMMENT '订单id',
  `tm_id` varchar(255) DEFAULT NULL COMMENT '温度计id',
  `is_not` tinyint(255) DEFAULT NULL COMMENT '是否删除  0 删除   1 正常',
  `at_id` int(11) DEFAULT NULL COMMENT '附件id',
  PRIMARY KEY (`oth_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56875 DEFAULT CHARSET=utf8 COMMENT='订单温度数据上传验证表';

-- ----------------------------
-- Table structure for order_twelve_update
-- ----------------------------
DROP TABLE IF EXISTS `order_twelve_update`;
CREATE TABLE `order_twelve_update` (
  `ou_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `to_id` int(11) NOT NULL COMMENT '订单id',
  `to_no` char(32) DEFAULT NULL COMMENT '订单号',
  `ou_status` tinyint(1) DEFAULT '0' COMMENT '0：未处理 1：已上传 2：已处理',
  `ou_content` text COMMENT '变更内容',
  `ou_createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `ou_updatetime` int(10) DEFAULT NULL COMMENT '变更时间',
  `ou_handler_id` int(11) DEFAULT NULL COMMENT '处理人ID',
  `ou_handler_name` varchar(20) DEFAULT NULL COMMENT '处理人',
  PRIMARY KEY (`ou_id`),
  KEY `index_to_no` (`to_no`),
  KEY `index_to_no_ou_status` (`to_no`,`ou_status`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for order_worksheet
-- ----------------------------
DROP TABLE IF EXISTS `order_worksheet`;
CREATE TABLE `order_worksheet` (
  `ow_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作单表id 自增',
  `to_id` int(10) NOT NULL COMMENT '订单id',
  `region_name` char(32) NOT NULL COMMENT '城市名称',
  `ow_type` int(2) NOT NULL COMMENT '操作类型 1 取件 2 发货 3 派件 4 提货并派件 5 提货并发货',
  `ow_adderss` varchar(255) NOT NULL COMMENT '工作单地址',
  `ow_remark` varchar(1024) DEFAULT NULL COMMENT '工作单备注',
  `ow_lastup_uid` int(10) DEFAULT NULL COMMENT '最后更新人',
  `ow_lastup_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `op_uid` varchar(50) DEFAULT NULL COMMENT '操作员id',
  `dr_uid` int(10) DEFAULT NULL COMMENT '主管uid',
  `region_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '工作单城市',
  `ow_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '工作单状态 1 已完成 2待执行',
  `ow_date` varchar(32) DEFAULT NULL COMMENT '工作单日期',
  `ow_create_uid` int(10) DEFAULT NULL COMMENT '创建人id',
  `ow_create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `ow_create_username` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `transfer_region_name` varchar(100) DEFAULT NULL COMMENT '中转城市名',
  `transfer_region_id` int(10) DEFAULT NULL COMMENT '中转城市id',
  `child_region_id` int(10) DEFAULT NULL COMMENT '地区id',
  `child_region_name` varchar(255) DEFAULT NULL COMMENT '地区名称',
  `ow_tobeconfirmed` int(10) NOT NULL DEFAULT '0' COMMENT '0：已确认 1:待确认',
  `di_id` int(11) DEFAULT NULL COMMENT '调度id',
  `ow_cbox` int(2) NOT NULL DEFAULT '1' COMMENT '提发工作单是否换箱 1未换，2已换',
  `ow_print` int(2) NOT NULL DEFAULT '0' COMMENT '0未打印，1 已打印',
  `ow_tops_id` int(4) DEFAULT NULL COMMENT '站点id',
  `ow_tops_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `ow_cart_pd` int(4) DEFAULT '0' COMMENT 'cart备案判断 0普通  1.取件类型 2取派类型',
  `ow_night_work` tinyint(1) DEFAULT '0' COMMENT '是否为夜班工作单',
  `ow_recheck` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否复核 0未复核，1已复核',
  `ow_cart_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0,普通订单 1.单采单人同城 2.单采单人非同城  3.单采专车 4.回输专人非同城 5.回输专车',
  `owr_no` varchar(20) NOT NULL DEFAULT '' COMMENT '工作单排线编号',
  `next_op_uid` varchar(100) NOT NULL DEFAULT '' COMMENT '联动指派人',
  `fulfil_task_username` varchar(100) NOT NULL DEFAULT '' COMMENT '完成任务人',
  `route_text` varchar(70) DEFAULT '' COMMENT '调度路由',
  `route_station` varchar(30) DEFAULT '' COMMENT '调度路由站点',
  `di_remark` varchar(200) DEFAULT '' COMMENT '调度备注',
  `ow_pid` int(11) DEFAULT NULL COMMENT '父级工作单id',
  PRIMARY KEY (`ow_id`),
  KEY `to_id` (`to_id`),
  KEY `region_id` (`region_id`),
  KEY `ow_type` (`ow_type`),
  KEY `ow_status` (`ow_status`),
  KEY `op_uid` (`op_uid`),
  KEY `ow_date` (`ow_date`),
  KEY `ow_lastup_time` (`ow_lastup_time`),
  KEY `idx_create_uid` (`ow_create_uid`),
  KEY `idx_create_time` (`ow_create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=485281 DEFAULT CHARSET=utf8 COMMENT='订单工作单表';

-- ----------------------------
-- Table structure for order_worksheet_handover
-- ----------------------------
DROP TABLE IF EXISTS `order_worksheet_handover`;
CREATE TABLE `order_worksheet_handover` (
  `owh_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工作单交接ID',
  `owh_create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `owh_status` tinyint(4) DEFAULT '1' COMMENT '1：未交接，2：已交接，3：拒绝交接，4：取消交接，5：工作单完成自动取消交接',
  `handover_uid` int(11) DEFAULT NULL COMMENT '交接人ID',
  `handover_username` varchar(50) DEFAULT NULL COMMENT '交接人名称',
  `to_handover_uid` int(11) DEFAULT NULL COMMENT '被交接人ID',
  `to_handover_username` varchar(50) DEFAULT NULL COMMENT '被交接人姓名',
  `ow_id` int(11) DEFAULT NULL COMMENT '工作单ID',
  `owh_lastup_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`owh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8mb4 COMMENT='交接工作单表';

-- ----------------------------
-- Table structure for order_worksheet_route
-- ----------------------------
DROP TABLE IF EXISTS `order_worksheet_route`;
CREATE TABLE `order_worksheet_route` (
  `owr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作单排线序号',
  `owr_no` varchar(20) NOT NULL DEFAULT '' COMMENT '工作单排线编号',
  `ow_city_id` int(11) NOT NULL DEFAULT '0' COMMENT '工作城市序号',
  `ow_city` varchar(20) NOT NULL DEFAULT '' COMMENT '工作城市',
  `ow_date` int(11) NOT NULL DEFAULT '0' COMMENT '工作时间',
  `ur_uid` varchar(64) NOT NULL DEFAULT '' COMMENT '工作用户序号',
  `ur_username` text NOT NULL COMMENT '工作用户',
  `dr_uid` int(11) NOT NULL COMMENT '工作单操作主管序号',
  `dr_username` varchar(32) NOT NULL COMMENT '工作单操作主管',
  `car_id` int(11) NOT NULL DEFAULT '0' COMMENT '车量序号',
  `car_number` varchar(20) NOT NULL DEFAULT '' COMMENT '车牌号',
  `owr_count` int(11) NOT NULL DEFAULT '0' COMMENT '工作单数量',
  `owr_begintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '工作开始时间',
  `owr_endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '工作结束时间',
  `owr_counttime` int(11) NOT NULL DEFAULT '0' COMMENT '工作时长 m',
  `owr_address_count` int(11) NOT NULL DEFAULT '0' COMMENT '工作站点总数 ',
  `owr_space_count` int(11) NOT NULL DEFAULT '0' COMMENT '工作总距离 m',
  `owr_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '工作排线创建时间',
  `owr_updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '工作排线最后修改时间',
  `owr_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '工作单排线状态 1/正常 0/废弃',
  PRIMARY KEY (`owr_id`),
  UNIQUE KEY `idx_owr_no` (`owr_no`) USING BTREE COMMENT '线路编号唯一'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='工作单排线';

-- ----------------------------
-- Table structure for order_worksheet_route_info
-- ----------------------------
DROP TABLE IF EXISTS `order_worksheet_route_info`;
CREATE TABLE `order_worksheet_route_info` (
  `owri_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '工作单排线站点序号',
  `owr_id` int(11) NOT NULL DEFAULT '0' COMMENT '工作单线路序号',
  `owr_no` varchar(20) NOT NULL DEFAULT '' COMMENT '工作单线路编号',
  `owri_address_id` int(11) NOT NULL DEFAULT '0' COMMENT '工作单站点序号',
  `owri_address_name` varchar(64) NOT NULL DEFAULT '' COMMENT '工作单地址名称',
  `owri_address` varchar(128) NOT NULL DEFAULT '' COMMENT '工作单信息地址',
  `owri_address_long` char(20) NOT NULL DEFAULT '' COMMENT '地址经度',
  `owri_address_lat` char(20) NOT NULL DEFAULT '' COMMENT '地址维度',
  `ow_type` int(11) NOT NULL DEFAULT '0' COMMENT '工作单类型',
  `ow_count` int(11) NOT NULL DEFAULT '0' COMMENT '工作单数量',
  `owri_plan_begintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计到达时间开始',
  `owri_plan_endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '预计到达时间截止',
  `owri_delivery_begintime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '实际到达时间开始',
  `owri_delivery_endtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '实际到达时间截止',
  `ow_goods` text NOT NULL COMMENT '工作单商品',
  `owri_ow_id` char(20) NOT NULL COMMENT '工作单序号拆分 ',
  `ow_id` int(11) NOT NULL COMMENT '工作单序号',
  `owri_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `owri_updatetime` int(11) NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `owri_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '工作单排线状态 1/正常 0/废弃',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '运单序号',
  `to_no` char(32) NOT NULL DEFAULT '' COMMENT '运单编号',
  `ow_city` varchar(20) NOT NULL COMMENT '工作城市',
  `ow_date` int(11) NOT NULL COMMENT '工作时间',
  PRIMARY KEY (`owri_id`),
  UNIQUE KEY `idx_search_owri_ow_id` (`owri_ow_id`),
  KEY `idx_search_owr_id` (`owr_id`,`owri_address_id`,`ow_type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COMMENT='工作单排线信息';

-- ----------------------------
-- Table structure for other_settlement
-- ----------------------------
DROP TABLE IF EXISTS `other_settlement`;
CREATE TABLE `other_settlement` (
  `ots_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '其他费用id',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '仓储序号id',
  `ots_name` char(255) DEFAULT '' COMMENT '其他费用名称',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户id',
  `cu_name` char(50) NOT NULL DEFAULT '' COMMENT '客户名称',
  `ots_cmonth` char(20) NOT NULL DEFAULT '0' COMMENT '结算月',
  `ots_feetype` int(1) NOT NULL DEFAULT '5' COMMENT '1证件代办费 2仓储管理费 3设备耗材费 4劳务支出费 5其它',
  `ots_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `ots_totalfee` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '费用总额',
  `ms_id` int(11) unsigned DEFAULT '0' COMMENT '对账单序号',
  `ots_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ots_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `ots_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `ots_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `ots_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ots_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `ots_tax` decimal(10,2) DEFAULT '0.00' COMMENT '税金',
  `ots_income` decimal(12,4) DEFAULT '0.0000' COMMENT '不含税金额',
  `ots_tot` decimal(10,2) DEFAULT '0.00' COMMENT '报价总额',
  `to_no` varchar(32) DEFAULT NULL COMMENT '运单编号',
  `ots_amount` decimal(12,2) DEFAULT '0.00' COMMENT '运单结算金额',
  `ots_start_time` int(10) DEFAULT NULL COMMENT '起始时间',
  `ots_end_time` int(10) DEFAULT NULL COMMENT '截至时间',
  `ots_carry_down_status` tinyint(1) DEFAULT '1' COMMENT '结转状态 1 未结转 2 已结转',
  `ots_taxrate` decimal(10,4) DEFAULT NULL COMMENT '税率',
  `bi_name` varchar(30) DEFAULT NULL COMMENT '开票客户名称',
  `sto_no` char(255) DEFAULT NULL COMMENT '存货编号',
  `sto_batch` char(255) DEFAULT NULL COMMENT '货物批号',
  `ots_quantity` int(20) DEFAULT NULL COMMENT '当期库存',
  `sto_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `bi_id` int(11) unsigned DEFAULT NULL COMMENT '开票客户ID',
  `stt_id` int(2) DEFAULT NULL COMMENT '设备类型',
  `ots_relation_id` int(11) unsigned DEFAULT '0' COMMENT '与其他系统关联id',
  `to_id` int(11) unsigned DEFAULT NULL COMMENT '运输单序号',
  `ots_cubage` varchar(10) DEFAULT NULL COMMENT '当期容量',
  `cp_id` int(10) DEFAULT NULL COMMENT '项目ID',
  `cp_name` varchar(255) DEFAULT NULL COMMENT '项目名称',
  `ots_relation_no` varchar(32) DEFAULT NULL COMMENT '其他系统关联no',
  `relation_month` char(20) NOT NULL DEFAULT '0' COMMENT '所属月份/折扣月份',
  `ots_num` int(10) DEFAULT '0' COMMENT '数量',
  `ots_stt_id` int(1) NOT NULL DEFAULT '0' COMMENT '资产类型',
  PRIMARY KEY (`ots_id`),
  KEY `sto_id` (`sto_id`),
  KEY `cu_id` (`cu_id`),
  KEY `ms_id` (`ms_id`),
  KEY `type` (`ots_feetype`),
  KEY `ots_relation_id` (`ots_relation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185086 DEFAULT CHARSET=utf8 COMMENT='其它费用表';

-- ----------------------------
-- Table structure for other_settlement_copy
-- ----------------------------
DROP TABLE IF EXISTS `other_settlement_copy`;
CREATE TABLE `other_settlement_copy` (
  `ots_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '其他费用id',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '仓储序号id',
  `ots_name` char(255) DEFAULT '' COMMENT '其他费用名称',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户id',
  `cu_name` char(50) NOT NULL DEFAULT '' COMMENT '客户名称',
  `ots_cmonth` char(20) NOT NULL DEFAULT '0' COMMENT '结算月',
  `ots_feetype` int(1) NOT NULL DEFAULT '5' COMMENT '1证件代办费 2仓储管理费 3设备耗材费 4劳务支出费 5其它',
  `ots_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `ots_totalfee` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT '费用总额',
  `ms_id` int(11) unsigned DEFAULT '0' COMMENT '对账单序号',
  `ots_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ots_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `ots_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `ots_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `ots_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ots_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `ots_tax` decimal(10,2) DEFAULT '0.00' COMMENT '税金',
  `ots_income` decimal(12,4) DEFAULT '0.0000' COMMENT '不含税金额',
  `ots_tot` decimal(10,2) DEFAULT '0.00' COMMENT '报价总额',
  PRIMARY KEY (`ots_id`),
  KEY `sto_id` (`sto_id`),
  KEY `cu_id` (`cu_id`),
  KEY `ms_id` (`ms_id`),
  KEY `type` (`ots_feetype`)
) ENGINE=InnoDB AUTO_INCREMENT=143171 DEFAULT CHARSET=utf8 COMMENT='其它费用表';

-- ----------------------------
-- Table structure for other_settlement_feeverify
-- ----------------------------
DROP TABLE IF EXISTS `other_settlement_feeverify`;
CREATE TABLE `other_settlement_feeverify` (
  `osfv_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '验证结算详情id',
  `ots_id` int(11) unsigned NOT NULL COMMENT '其他费用id',
  `osfv_accommodationfee` decimal(12,2) DEFAULT '0.00' COMMENT '住宿费',
  `osfv_labor_cost` decimal(12,2) DEFAULT '0.00' COMMENT '人工费',
  `osfv_reportfee` decimal(12,2) DEFAULT '0.00' COMMENT '报告费',
  `osfv_programfee` decimal(12,2) DEFAULT '0.00' COMMENT '方案费',
  `osfv_transportationfee` decimal(12,2) DEFAULT '0.00' COMMENT '交通费',
  `osfv_other_cost` decimal(12,2) DEFAULT '0.00' COMMENT '其他费用',
  `osfv_thermometer_cost` decimal(12,2) DEFAULT '0.00' COMMENT '温度计费用',
  `osfv_third_party_cost` decimal(12,2) DEFAULT '0.00' COMMENT '第三方检测费',
  `osfv_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `osfv_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`osfv_id`),
  UNIQUE KEY `ots_id` (`ots_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COMMENT='验证结算费用详情表';

-- ----------------------------
-- Table structure for p_department
-- ----------------------------
DROP TABLE IF EXISTS `p_department`;
CREATE TABLE `p_department` (
  `department_id` int(11) NOT NULL COMMENT '部门id',
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `parentid` int(11) DEFAULT NULL COMMENT '父级id',
  `order` int(30) DEFAULT NULL COMMENT '排序',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业微信部门表';

-- ----------------------------
-- Table structure for packing
-- ----------------------------
DROP TABLE IF EXISTS `packing`;
CREATE TABLE `packing` (
  `pk_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `sto_id` int(11) unsigned NOT NULL COMMENT '存货序号',
  `pk_abroad_l` decimal(10,2) DEFAULT NULL COMMENT '外径-长',
  `pk_abroad_w` decimal(10,2) DEFAULT NULL COMMENT '外径-宽',
  `pk_abroad_h` decimal(10,2) DEFAULT NULL COMMENT '外径-高',
  `pk_inner_l` decimal(10,2) DEFAULT NULL COMMENT '内径-长',
  `pk_inner_w` decimal(10,2) DEFAULT NULL COMMENT '内径-宽',
  `pk_inner_h` decimal(10,2) DEFAULT NULL COMMENT '内径-高',
  `pk_weight` decimal(10,2) DEFAULT NULL COMMENT '重量kg',
  `pk_status` tinyint(4) unsigned DEFAULT '1' COMMENT '状态 1正常，2删除',
  `pk_borrow_remark` varchar(1024) DEFAULT NULL COMMENT '借用备注',
  `pk_offer_remark` varchar(1024) DEFAULT NULL COMMENT '报价备注',
  `pk_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `pk_createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `pk_lastupdtime` int(10) DEFAULT '0' COMMENT '最后更新时间',
  `sto_no` varchar(255) DEFAULT NULL COMMENT '存货编号',
  `sto_name` varchar(255) DEFAULT NULL COMMENT '存货名称',
  PRIMARY KEY (`pk_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='包装箱';

-- ----------------------------
-- Table structure for packing_box_relation
-- ----------------------------
DROP TABLE IF EXISTS `packing_box_relation`;
CREATE TABLE `packing_box_relation` (
  `pb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pb_sto_id` int(11) unsigned DEFAULT NULL COMMENT '耗材表id',
  `pb_ice_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '冰排名称',
  `pb_ga_id` int(11) DEFAULT NULL COMMENT '附件表id',
  `pb_create_time` int(11) NOT NULL COMMENT '关联时间',
  `pb_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型（1、包装箱，2、冷库，3、温度计探头）',
  PRIMARY KEY (`pb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8mb4 COMMENT='包装箱验证报告关联数据';

-- ----------------------------
-- Table structure for packing_box_relation_copy
-- ----------------------------
DROP TABLE IF EXISTS `packing_box_relation_copy`;
CREATE TABLE `packing_box_relation_copy` (
  `pb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pb_sto_id` int(11) unsigned DEFAULT NULL COMMENT '耗材表id',
  `pb_ice_name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '冰排名称',
  `pb_ga_id` int(11) DEFAULT NULL COMMENT '附件表id',
  `pb_create_time` int(11) NOT NULL COMMENT '关联时间',
  `pb_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型（1、包装箱，2、冷库，3、温度计探头）',
  PRIMARY KEY (`pb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb4 COMMENT='包装箱验证报告关联数据';

-- ----------------------------
-- Table structure for packing_cost
-- ----------------------------
DROP TABLE IF EXISTS `packing_cost`;
CREATE TABLE `packing_cost` (
  `pc_id` int(10) NOT NULL AUTO_INCREMENT,
  `pk_id` int(10) NOT NULL COMMENT '包装箱id',
  `cq_id` int(10) NOT NULL COMMENT '报价关联配置id',
  `pc_price` decimal(10,2) DEFAULT NULL COMMENT '包装费',
  `pc_ice_price` decimal(10,2) DEFAULT NULL COMMENT '制冷费',
  `pc_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常，2删除',
  `pc_createtime` int(10) DEFAULT NULL,
  `pc_lastupdtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`pc_id`),
  KEY `pk_id` (`pk_id`),
  KEY `cq_id` (`cq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COMMENT='包装箱费用';

-- ----------------------------
-- Table structure for packing_scheme
-- ----------------------------
DROP TABLE IF EXISTS `packing_scheme`;
CREATE TABLE `packing_scheme` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `ps_name` varchar(256) NOT NULL COMMENT '包装方案名称',
  `pk_id` int(11) NOT NULL COMMENT '包装箱id',
  `temp_id` int(11) NOT NULL COMMENT '温度id',
  `ps_charging_weight` decimal(10,2) DEFAULT NULL COMMENT '标准计费重量',
  `ps_inner_l` decimal(10,2) DEFAULT NULL COMMENT '载货内径长',
  `ps_inner_w` decimal(10,2) DEFAULT NULL COMMENT '载货内径宽',
  `ps_inner_h` decimal(10,2) DEFAULT NULL COMMENT '载货内径高',
  `ps_agent_weight` decimal(10,2) DEFAULT NULL COMMENT '制冷剂重量',
  `ps_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ps_status` tinyint(4) DEFAULT '1' COMMENT '状态 1正常，2删除',
  `ps_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `ps_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COMMENT='包装箱方案';

-- ----------------------------
-- Table structure for packing_scheme_pks
-- ----------------------------
DROP TABLE IF EXISTS `packing_scheme_pks`;
CREATE TABLE `packing_scheme_pks` (
  `psp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ps_id` int(11) unsigned NOT NULL COMMENT '包装箱方案id',
  `psp_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `psp_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `sto_id` int(11) unsigned NOT NULL COMMENT '存货序号',
  `sto_name` varchar(255) DEFAULT NULL COMMENT '存货名称',
  PRIMARY KEY (`psp_id`),
  KEY `ps_id` (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COMMENT='包装箱方案下包装箱表';

-- ----------------------------
-- Table structure for packing_scheme_temps
-- ----------------------------
DROP TABLE IF EXISTS `packing_scheme_temps`;
CREATE TABLE `packing_scheme_temps` (
  `pst_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ps_id` int(11) unsigned NOT NULL COMMENT '包装箱方案id',
  `config_id` int(11) unsigned NOT NULL COMMENT 'config配置对应键',
  `pst_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pst_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `temp_remark` varchar(255) DEFAULT NULL COMMENT '温区名称',
  `bts_id` int(11) unsigned NOT NULL COMMENT '温区方案ID',
  `bts_name` varchar(255) DEFAULT NULL COMMENT '温区方案名称',
  `pst_status` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '温区方案状态 1正常 2失效',
  PRIMARY KEY (`pst_id`),
  KEY `ps_id` (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COMMENT='包装箱方案下温度表';

-- ----------------------------
-- Table structure for packing_temp_change_history
-- ----------------------------
DROP TABLE IF EXISTS `packing_temp_change_history`;
CREATE TABLE `packing_temp_change_history` (
  `ptch_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `ptch_old_ps_id` int(11) DEFAULT NULL COMMENT '原 包装箱方案id',
  `ptch_old_temp_id` int(11) DEFAULT NULL COMMENT '原 温度id',
  `ptch_new_ps_id` int(11) DEFAULT NULL COMMENT '新 包装箱方案id',
  `ptch_new_temp_id` int(11) DEFAULT NULL COMMENT '新 温度id',
  `sto_id` int(11) DEFAULT NULL COMMENT '包装箱id',
  `bts_id` int(11) DEFAULT NULL COMMENT '温区方案id',
  `ptch_status` tinyint(4) DEFAULT '1' COMMENT '修改状态 1未修改 2已修改',
  `sto_name` varchar(256) DEFAULT NULL COMMENT '包装箱名称',
  `bts_name` varchar(256) DEFAULT NULL COMMENT '温区方案名称',
  `ptch_old_ps_name` varchar(256) DEFAULT NULL COMMENT '原 包装方案名称',
  `ptch_new_ps_name` varchar(256) DEFAULT NULL COMMENT '新 包装方案名称',
  `ptch_old_temp_remark` varchar(256) DEFAULT NULL COMMENT '原 温度范围名称',
  `ptch_new_temp_remark` varchar(256) DEFAULT NULL COMMENT '新 温度范围名称',
  `ptch_createtime` int(11) DEFAULT '0' COMMENT '创建时间',
  `ptch_lastupdtime` int(11) DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`ptch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=885 DEFAULT CHARSET=utf8 COMMENT='包装箱方案历史数据处理表';

-- ----------------------------
-- Table structure for pay_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_log`;
CREATE TABLE `pay_log` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL COMMENT '运单id',
  `temp_id` int(11) NOT NULL COMMENT '委托订单id',
  `bi_id` int(11) NOT NULL DEFAULT '0' COMMENT '发票id',
  `bia_id` int(11) NOT NULL DEFAULT '0' COMMENT '发票地址id',
  `bi_billtype` int(11) NOT NULL DEFAULT '0' COMMENT '发票类型',
  `to_invoice` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否开票',
  `bia_email` varchar(64) NOT NULL DEFAULT '' COMMENT '电子发票邮箱',
  `bia_note` varchar(64) NOT NULL DEFAULT '' COMMENT '电子发票短信',
  `send_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '寄送类型',
  `p_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付方式  5 微信  6支付宝',
  `p_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付状态',
  `p_number` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支付金额',
  `p_createtime` int(10) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `transaction_id` varchar(64) NOT NULL COMMENT '支付流水号',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for payment_apply
-- ----------------------------
DROP TABLE IF EXISTS `payment_apply`;
CREATE TABLE `payment_apply` (
  `pa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '退款申请id',
  `pa_no` char(32) NOT NULL DEFAULT '0' COMMENT '付款编号',
  `to_id` int(11) unsigned DEFAULT NULL COMMENT '运输单序号',
  `pa_apply_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付款申请时间',
  `pa_type` tinyint(4) unsigned DEFAULT '0' COMMENT '付款类型 ，1小程序退款',
  `user_account` varchar(255) DEFAULT NULL COMMENT '付款用户,付款类型=1：open_id',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `pa_method` tinyint(4) unsigned DEFAULT '0' COMMENT '付款方式 ，1微信原路退回',
  `br_id` int(11) NOT NULL DEFAULT '0' COMMENT '收款id',
  `br_no` char(32) NOT NULL DEFAULT '0' COMMENT '收款编号',
  `pa_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '付款金额',
  `pa_status` tinyint(2) DEFAULT '1' COMMENT '付款审核状态 1 待确认 2审核中 3待付款 4已付款 5 审核拒绝 6付款失败 ',
  `balance_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未清账 1已清账',
  `pa_pay_date` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '付款时间',
  `pa_payer_id` int(10) DEFAULT NULL COMMENT '付款人id',
  `pa_payer_name` char(32) DEFAULT '' COMMENT '付款人姓名',
  `pa_abstract` varchar(512) DEFAULT NULL COMMENT '摘要',
  `pa_remark` varchar(512) DEFAULT NULL COMMENT '备注',
  `pa_create_uid` int(10) NOT NULL COMMENT '创建人',
  `pa_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `pa_createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `pa_lastupd_uid` int(10) NOT NULL COMMENT '最后更新人',
  `pa_lastupd_username` char(32) DEFAULT '' COMMENT '更新人姓名',
  `pa_lastupdtime` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `sp_no` char(32) DEFAULT '' COMMENT '企业微信支付申请审批编号',
  `pa_real_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '泛微审批后实际退款金额',
  `sp_id` int(11) unsigned DEFAULT NULL COMMENT '企业微信支付申请审批id',
  `neg_br_id` int(11) NOT NULL DEFAULT '0' COMMENT '负数收款id（退款成功后创建的负数的付款记录id）',
  `neg_br_no` char(32) NOT NULL DEFAULT '0' COMMENT '负数收款编号',
  PRIMARY KEY (`pa_id`),
  KEY `cu_id` (`cu_id`),
  KEY `pa_no` (`pa_no`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='付款申请表';

-- ----------------------------
-- Table structure for person_material
-- ----------------------------
DROP TABLE IF EXISTS `person_material`;
CREATE TABLE `person_material` (
  `pm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '个人应还耗材ID',
  `ur_uid` int(11) DEFAULT NULL COMMENT '用户id',
  `pm_username` varchar(128) DEFAULT NULL COMMENT '用户名称',
  `pm_rolename` varchar(128) DEFAULT NULL COMMENT '用户角色',
  `pm_createtime` int(11) DEFAULT NULL COMMENT '日期',
  `sto_id` int(11) DEFAULT NULL COMMENT '耗材id',
  `sto_name` varchar(255) DEFAULT NULL COMMENT '耗材名称',
  `pm_material_detail` text COMMENT '应还耗材详情',
  PRIMARY KEY (`pm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7171 DEFAULT CHARSET=utf8 COMMENT='个人应还耗材记录表';

-- ----------------------------
-- Table structure for perwarehouse
-- ----------------------------
DROP TABLE IF EXISTS `perwarehouse`;
CREATE TABLE `perwarehouse` (
  `pw_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '个人仓ID ',
  `ur_uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `sto_id` int(10) unsigned NOT NULL COMMENT '存货ID',
  `stt_id` int(11) DEFAULT NULL COMMENT '存货类型序号',
  `gd_series_number` varchar(155) DEFAULT NULL COMMENT '存货序列号',
  `pw_state` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '库存状态  1 库存 2 已还',
  `pw_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '入库类型 1 领用入库  2 提货入库  3 调拨入库',
  `to_id` int(11) unsigned DEFAULT NULL COMMENT '运单ID（用于和耗材绑定时确认耗材使用）、调拨ID（用户关联耗材调拨）',
  `pw_createtime` int(12) NOT NULL COMMENT '创建时间',
  `pw_lastupdtime` int(12) DEFAULT NULL COMMENT '最后更新时间',
  `pw_spare_toid` int(11) DEFAULT NULL COMMENT '耗材解绑备用订单id',
  `gd_id` int(11) DEFAULT '0' COMMENT '物资id',
  `username` varchar(35) DEFAULT NULL COMMENT '用户姓名',
  `pw_to_type` int(11) NOT NULL DEFAULT '1' COMMENT '1：正常运输订单，2：运营调拨单',
  PRIMARY KEY (`pw_id`),
  KEY `pwid` (`pw_id`),
  KEY `uid` (`ur_uid`),
  KEY `toid` (`to_id`),
  KEY `stoid` (`sto_id`),
  KEY `gd_id` (`gd_id`),
  KEY `gd_series_number` (`gd_series_number`)
) ENGINE=InnoDB AUTO_INCREMENT=700044 DEFAULT CHARSET=utf8 COMMENT='个人虚拟仓';

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `po_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '职位序号',
  `po_name` char(32) DEFAULT '' COMMENT '职位名称',
  `po_remark` varchar(1024) DEFAULT NULL COMMENT '职位描述',
  `po_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `po_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`po_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位表';

-- ----------------------------
-- Table structure for procurement_approval
-- ----------------------------
DROP TABLE IF EXISTS `procurement_approval`;
CREATE TABLE `procurement_approval` (
  `sp_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `sp_no` varchar(150) DEFAULT NULL COMMENT '审批编号',
  `sp_name` varchar(30) DEFAULT NULL COMMENT '审批申请类型名称',
  `sp_status` int(11) DEFAULT NULL COMMENT '申请单状态：1-审批中；2-已通过；3-已驳回；4-已撤销；6-通过后撤销；7-已删除；10-已支付',
  `apply_time` int(11) DEFAULT NULL COMMENT '审批申请提交时间',
  `apply_uid` varchar(30) DEFAULT NULL COMMENT '申请人id',
  `apply_partyid` int(11) DEFAULT NULL COMMENT '申请人所在部门id',
  `notifyer_uid` text COMMENT '节点抄送人userid',
  `sp_record` text COMMENT '审批流程信息',
  `apply_data` text COMMENT '审批申请数据',
  `sp_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `sp_updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  `arrival_status` int(11) DEFAULT '0' COMMENT '到货状态 0:未到货 1:部分到货 2:已到货',
  `capital_status` int(11) DEFAULT '1' COMMENT '是否创建采购单  1:未创建 2:已创建',
  `sp_type` varchar(30) DEFAULT NULL COMMENT '采购类型',
  `apply_reason` varchar(255) NOT NULL DEFAULT '' COMMENT ' 申请理由',
  `expected_arrival_time` int(11) NOT NULL DEFAULT '0' COMMENT '期望到货时间',
  `apply_company` varchar(255) NOT NULL DEFAULT '' COMMENT '采购申请公司',
  `supplier` varchar(50) NOT NULL DEFAULT '' COMMENT '供应商',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '采购申请名称',
  `goods_model` varchar(255) NOT NULL DEFAULT '' COMMENT '规格型号',
  `goods_price` varchar(20) NOT NULL DEFAULT '0' COMMENT '商品单价',
  `goods_num` mediumint(9) NOT NULL DEFAULT '0' COMMENT '申请商品数量',
  `goods_total_amount` varchar(20) NOT NULL DEFAULT '' COMMENT '商品总金额',
  `apply_remark` text COMMENT '申请备注',
  `handler_uid` int(11) NOT NULL DEFAULT '0' COMMENT '经办人用户id',
  `handler_name` varchar(50) NOT NULL DEFAULT '0' COMMENT '经办人名称',
  `apply_department_no` varchar(50) NOT NULL DEFAULT '' COMMENT '申请部门编号',
  `apply_department_name` varchar(50) NOT NULL DEFAULT '' COMMENT '部门名称',
  `applyer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '申请人名称',
  `applyer_uid` int(11) NOT NULL DEFAULT '0' COMMENT '申请人用户id',
  `goods_type` varchar(255) NOT NULL DEFAULT '' COMMENT '物资类型',
  `goods_category` varchar(255) NOT NULL DEFAULT '' COMMENT '物资分类',
  `sp_identifier` varchar(100) NOT NULL DEFAULT '' COMMENT '记录标识符(前期为微信审批单id，现为泛微的表单id)',
  `applicant_emid` int(11) NOT NULL DEFAULT '0' COMMENT '申请人的员工id（employee）',
  `handler_emid` int(11) NOT NULL DEFAULT '0' COMMENT '经办人员工id（employee）',
  `apply_company_id` int(11) NOT NULL DEFAULT '0' COMMENT '申请人所在公司Id',
  `apply_company_no` varchar(64) NOT NULL DEFAULT '' COMMENT '申请人所在公司编号',
  PRIMARY KEY (`sp_id`),
  UNIQUE KEY `sp_no` (`sp_no`),
  KEY `idx_handler_uid` (`handler_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1016 DEFAULT CHARSET=utf8mb4 COMMENT='采购审批单';

-- ----------------------------
-- Table structure for project_destination
-- ----------------------------
DROP TABLE IF EXISTS `project_destination`;
CREATE TABLE `project_destination` (
  `pd_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '目的地id',
  `cp_id` int(11) NOT NULL COMMENT '项目id',
  `pd_address` varchar(255) DEFAULT NULL COMMENT '目的地址',
  `pd_consignee` char(32) DEFAULT NULL COMMENT '收货联系人',
  `pd_consignee_tell` char(32) DEFAULT NULL COMMENT '收货联系电话',
  `pd_rename` char(32) DEFAULT NULL COMMENT '中心缩写',
  `region_id` int(12) NOT NULL COMMENT '城市id',
  `region_name` varchar(32) DEFAULT NULL COMMENT '城市名称',
  `longitude` char(15) DEFAULT NULL COMMENT '经度坐标',
  `latitude` char(15) DEFAULT NULL COMMENT '纬度坐标',
  `pd_visible` tinyint(2) DEFAULT '1' COMMENT '状态 1正常 2删除',
  `pd_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `pd_updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`pd_id`),
  KEY `cp_id` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='项目目的地配置表';

-- ----------------------------
-- Table structure for project_hospital
-- ----------------------------
DROP TABLE IF EXISTS `project_hospital`;
CREATE TABLE `project_hospital` (
  `ph_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_id` int(11) DEFAULT NULL,
  `cp_id` int(11) DEFAULT NULL,
  `ph_createtime` int(10) DEFAULT NULL,
  `ph_lastupdtime` int(10) DEFAULT NULL,
  `ph_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态 1-正常  2-删除',
  PRIMARY KEY (`ph_id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for project_nsso_conf
-- ----------------------------
DROP TABLE IF EXISTS `project_nsso_conf`;
CREATE TABLE `project_nsso_conf` (
  `pnc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '项目配置id',
  `cp_id` int(12) NOT NULL COMMENT '项目id',
  `pnc_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '配置类型 1 温度要求 2温度计要求',
  `conf_id` varchar(128) NOT NULL COMMENT '配置详情id（对应温度计，温度计选项配置文件）',
  `pnc_rename` varchar(255) NOT NULL COMMENT '配置缩写',
  `pnc_visible` tinyint(2) DEFAULT '1' COMMENT '状态 1 正常 2 删除',
  `pnc_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `pnc_check` int(2) NOT NULL DEFAULT '0' COMMENT '货物类型是否审核 0不 1 审核',
  `link_pnc_id` int(10) DEFAULT NULL COMMENT '关联配置',
  `pnc_hide_address` tinyint(3) unsigned DEFAULT '0' COMMENT '0不隐藏 1隐藏',
  PRIMARY KEY (`pnc_id`),
  KEY `cp_id` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2098 DEFAULT CHARSET=utf8 COMMENT='项目特殊配置表';

-- ----------------------------
-- Table structure for project_site
-- ----------------------------
DROP TABLE IF EXISTS `project_site`;
CREATE TABLE `project_site` (
  `ps_id` int(12) unsigned NOT NULL AUTO_INCREMENT COMMENT '项目医院信息表',
  `cp_id` int(15) NOT NULL COMMENT '项目id',
  `ps_no` varchar(255) NOT NULL COMMENT 'site编号',
  `ps_name` varchar(255) DEFAULT NULL COMMENT 'site名称',
  `ps_address` varchar(255) DEFAULT NULL COMMENT 'site详细地址',
  `ps_consignor` varchar(255) DEFAULT NULL COMMENT '发货联系人（研究者）',
  `ps_consignor_tell` varchar(255) DEFAULT NULL COMMENT '发货联系电话',
  `LCT` char(32) DEFAULT NULL COMMENT '最晚呼入时间',
  `LPT` char(32) DEFAULT NULL COMMENT '最晚取件时间',
  `ps_timeliness` int(5) DEFAULT NULL COMMENT '项目site实效',
  `region_id` int(12) DEFAULT NULL COMMENT '城市id',
  `region_name` varchar(255) DEFAULT NULL COMMENT '城市名称',
  `longitude` char(15) DEFAULT NULL COMMENT '经度坐标',
  `latitude` char(15) DEFAULT NULL COMMENT 'w纬度坐标',
  `ps_visible` tinyint(2) DEFAULT '1' COMMENT '状态 1 正常 2 停用',
  `ps_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `ps_updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`ps_id`),
  KEY `cp_id` (`cp_id`),
  KEY `psno` (`ps_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='项目医院表';

-- ----------------------------
-- Table structure for purchase
-- ----------------------------
DROP TABLE IF EXISTS `purchase`;
CREATE TABLE `purchase` (
  `pu_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '采购单序号',
  `pu_no` char(32) DEFAULT '' COMMENT '采购单编号，系统按规则生成：CG+8位序号数字',
  `pu_type` tinyint(4) unsigned DEFAULT '0' COMMENT '采购类型，0运输耗材，1办公用品，2其它采购',
  `pu_apply` char(32) DEFAULT '' COMMENT '需求人',
  `pu_purpose` char(32) DEFAULT '' COMMENT '采购用途',
  `pu_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '期望采购时间',
  `em_id` int(11) unsigned DEFAULT '0' COMMENT '经办人，员工序号',
  `em_name` char(32) DEFAULT '' COMMENT '经办人，员工姓名',
  `pu_assign_uid` int(11) unsigned DEFAULT '0' COMMENT '指派给用户序号',
  `pu_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `su_id` int(11) unsigned DEFAULT '0' COMMENT '供应商序号',
  `su_name` char(32) DEFAULT '' COMMENT '供应商名称',
  `co_name` char(32) DEFAULT '' COMMENT '联系人',
  `co_contact_tel` char(16) DEFAULT '' COMMENT '联系电话',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '所在地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `co_address` char(128) DEFAULT '' COMMENT '联系地址',
  `pu_status` tinyint(4) unsigned DEFAULT '0' COMMENT '采购单状态 0新建 1已审核 2已取消 3关闭',
  `pu_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `pu_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `pu_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `pu_closetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结案时间',
  `pu_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pu_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `pu_approval` varchar(255) DEFAULT NULL COMMENT '采购审批单号',
  `pu_status_uid` int(11) DEFAULT NULL COMMENT '审核人id',
  `pu_status_usernanme` varchar(255) DEFAULT NULL COMMENT '审核人姓名',
  `pu_status_time` int(11) DEFAULT NULL COMMENT '采购审核时间',
  `pu_supplier_id` varchar(255) DEFAULT NULL COMMENT '供应商下单人序号',
  `pu_supplier_name` varchar(255) DEFAULT NULL COMMENT '供应商下单人姓名',
  `pu_supplier_time` int(11) DEFAULT NULL COMMENT '采购审核时间',
  `pu_arrival_time` int(11) DEFAULT NULL COMMENT '到货日期',
  `pu_bill_time` int(11) DEFAULT NULL COMMENT '报账日期',
  `pu_bill_no` varchar(255) DEFAULT NULL COMMENT '发票号',
  `pu_bill_money` decimal(10,2) DEFAULT '0.00' COMMENT '总金额',
  PRIMARY KEY (`pu_id`),
  UNIQUE KEY `pu_no` (`pu_no`),
  KEY `su_id` (`su_id`)
) ENGINE=InnoDB AUTO_INCREMENT=337 DEFAULT CHARSET=utf8 COMMENT='采购单表';

-- ----------------------------
-- Table structure for purchase_attachment
-- ----------------------------
DROP TABLE IF EXISTS `purchase_attachment`;
CREATE TABLE `purchase_attachment` (
  `pa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pa_subtype` varchar(32) DEFAULT NULL COMMENT '附件子类型，如：001001客户证件、001002客户文件、002001供应商证件',
  `pa_identifier` varchar(32) DEFAULT NULL COMMENT '采购单序号',
  `pa_create_uid` int(11) DEFAULT NULL COMMENT '创建人id',
  `pa_create_username` varchar(32) DEFAULT NULL COMMENT '创建人姓名',
  `pa_filesize` int(11) DEFAULT NULL COMMENT '附件文件大小，单位：KB',
  `pa_visible` tinyint(2) DEFAULT '1' COMMENT '附件状态 1正常，0删除',
  `pa_filename` varchar(255) DEFAULT NULL COMMENT '附件文件名',
  `pa_filepath` varchar(1024) DEFAULT NULL COMMENT '附件文件路径',
  `pa_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`pa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='采购单附件表';

-- ----------------------------
-- Table structure for purchase_detail
-- ----------------------------
DROP TABLE IF EXISTS `purchase_detail`;
CREATE TABLE `purchase_detail` (
  `pd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '采购明细序号',
  `pu_id` int(11) unsigned DEFAULT '0' COMMENT '采购单序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(32) DEFAULT '' COMMENT '存货名称',
  `sto_volume` char(16) DEFAULT '' COMMENT '规格/容量',
  `sto_size` char(16) DEFAULT '' COMMENT '外观尺寸',
  `pd_unit` char(16) DEFAULT '' COMMENT '单位',
  `pd_quantity` int(11) DEFAULT NULL COMMENT '数量',
  `pd_price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `pd_amount` decimal(10,2) DEFAULT '0.00' COMMENT '金额',
  `pd_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `pd_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pd_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `pd_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `pd_status` tinyint(2) unsigned DEFAULT '1' COMMENT '到货状态  1未到货，2未到全，3已到货',
  `pd_quantum` int(11) DEFAULT NULL COMMENT '已到数量',
  PRIMARY KEY (`pd_id`),
  KEY `pu_id` (`pu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=442 DEFAULT CHARSET=utf8 COMMENT='采购明细表';

-- ----------------------------
-- Table structure for purchase_quoted_price
-- ----------------------------
DROP TABLE IF EXISTS `purchase_quoted_price`;
CREATE TABLE `purchase_quoted_price` (
  `pqp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '采购报价ID',
  `pd_id` int(11) unsigned NOT NULL COMMENT '采购详情序号',
  `pqp_arrival_quantity` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '本次到货数量',
  `pqp_arrival_time` int(10) NOT NULL COMMENT '本次到货时间',
  `pqp_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '报账金额',
  `pqp_time` int(10) NOT NULL COMMENT '报账时间',
  `pqp_commit_finance` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否提交财务: (1-未提交, 2-已提交)',
  `pqp_invoice_type` tinyint(2) NOT NULL DEFAULT '-1' COMMENT '发票类型: (0-增值税普通发票, 1-增值税专用发票, 2-增值税电子普通发票)',
  `pqp_invoice_tax_rate` decimal(10,4) NOT NULL COMMENT '发票税率',
  `pqp_invoice_number` char(64) NOT NULL DEFAULT '' COMMENT '发票号码',
  `pqp_invoice_amount` decimal(10,2) NOT NULL COMMENT '发票金额',
  `pqp_tax_amount` decimal(10,2) NOT NULL COMMENT '税额',
  `pqp_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pqp_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`pqp_id`),
  KEY `idx_pd_id` (`pd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='采购报价信息表';

-- ----------------------------
-- Table structure for push_task
-- ----------------------------
DROP TABLE IF EXISTS `push_task`;
CREATE TABLE `push_task` (
  `ps_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) DEFAULT NULL COMMENT '订单id',
  `deviceId` varchar(50) DEFAULT NULL COMMENT '设备号',
  `ps_status` tinyint(1) DEFAULT '0' COMMENT '状态 0：开始 1：结束',
  `ps_createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `ps_lastupdtime` int(10) DEFAULT NULL COMMENT '更新时间',
  `ps_customer_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ps_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for qc_abnormal
-- ----------------------------
DROP TABLE IF EXISTS `qc_abnormal`;
CREATE TABLE `qc_abnormal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `yc_no` varchar(25) NOT NULL COMMENT '异常编号',
  `cu_id` int(11) DEFAULT NULL COMMENT '委托客户id',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '委托客户名称',
  `to_no` varchar(20) DEFAULT NULL COMMENT '运输单号',
  `io_no` varchar(32) DEFAULT NULL COMMENT '出入库单号',
  `gd_id` varchar(150) DEFAULT NULL COMMENT '温度计id(多个以逗号隔开)',
  `one_ab` varchar(255) DEFAULT NULL COMMENT '异常分类',
  `two_ab` varchar(255) DEFAULT NULL COMMENT '二级分类',
  `thr_ab` varchar(255) DEFAULT NULL COMMENT '三级分类',
  `city_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '事故城市ID',
  `accident_city` varchar(255) DEFAULT NULL COMMENT '事故城市',
  `kpi` tinyint(1) unsigned NOT NULL DEFAULT '2' COMMENT '是否KPI 0否，1是， 2,待确认',
  `responsibility` tinyint(1) unsigned DEFAULT NULL COMMENT '责任部门 1运营 2 营销 3 样本库',
  `second_responsibility` varchar(50) NOT NULL DEFAULT '0' COMMENT '二级责任部门',
  `respon_info` text COMMENT '责任部门确认描述',
  `type` tinyint(1) unsigned zerofill NOT NULL DEFAULT '1' COMMENT '状态 1新增 2已调查 3已确认 4已驳回 5已关闭',
  `description` text COMMENT '描述',
  `up_id` varchar(255) DEFAULT NULL COMMENT '文件ID',
  `qc_create_uid` varchar(255) DEFAULT NULL COMMENT '用户UID',
  `qc_create_username` varchar(255) DEFAULT NULL COMMENT '上传用户',
  `entry_time` varchar(255) DEFAULT NULL COMMENT '录入时间',
  `qc_investigation` text COMMENT '异常调查',
  `qc_yc_reason` text COMMENT '异常原因',
  `happen_time` varchar(25) DEFAULT NULL COMMENT '发生时间',
  `qc_reason` tinyint(1) DEFAULT NULL COMMENT '原因分类 1 内部, 2 客观, 3 客户',
  `reject` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '驳回次数',
  `data_is_up` tinyint(1) unsigned DEFAULT '0' COMMENT '数据是否上传 0否 1是 2否',
  `data_info` text COMMENT '异常数据原因描述',
  `quality_info` text CHARACTER SET utf8 COMMENT '质量中心确认信息',
  `yc_visible` tinyint(1) DEFAULT '1' COMMENT '转态 1正常 0删除',
  `gd_series_number` varchar(350) DEFAULT NULL COMMENT '温度计序列号(多个以逗号隔开)',
  `to_id` int(11) DEFAULT '0' COMMENT '运输单序号',
  `io_id` int(11) DEFAULT NULL COMMENT '出入库单序号',
  `respon_type` tinyint(1) DEFAULT NULL COMMENT '1已确认 2已驳回',
  `quality_type` tinyint(1) DEFAULT '0' COMMENT '质量中心确认状态',
  `yc_complainant` text COMMENT '投诉人信息',
  `yc_effective` tinyint(1) DEFAULT NULL COMMENT '投诉有效性 1有效 2无效',
  `yc_duty_name` varchar(255) DEFAULT NULL COMMENT '责任人姓名',
  `yc_duty_uid` int(11) DEFAULT NULL COMMENT '责任人UID',
  `yc_handle` int(11) DEFAULT NULL COMMENT '处理方式 1营销反馈客户2客户报告3偏差',
  `yc_proposal` text COMMENT '处理建议',
  `yc_feedback` text COMMENT '客户反馈',
  `yc_satisfied` tinyint(1) DEFAULT '0' COMMENT '投诉处理是否满意 1满意 2不满意',
  `yc_timely` tinyint(1) DEFAULT '0' COMMENT '营销反馈是否及时 1 及时 2不及时',
  `yc_inform_status` tinyint(1) DEFAULT NULL COMMENT '通知委托方状态 1 是 2 否',
  `yc_amount_penalty` decimal(12,2) DEFAULT NULL COMMENT '罚款金额',
  `emp_id` int(11) DEFAULT NULL COMMENT '项目人员用户id',
  `emp_name` varchar(255) DEFAULT NULL COMMENT '项目人员姓名',
  `em_id` int(11) DEFAULT NULL COMMENT '销售人员用户id',
  `em_name` varchar(255) DEFAULT NULL COMMENT '销售人员姓名',
  `qc_vf_id` int(11) DEFAULT '0' COMMENT '验证项目id',
  `qc_vf_abnormal` tinyint(1) DEFAULT '1' COMMENT '是否是验证项目异常(1、否，2、是)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `yc_no` (`yc_no`),
  KEY `idx_create_time` (`entry_time`(191)),
  KEY `idx_cu_id` (`cu_id`),
  KEY `idx_to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8mb4 COMMENT='质控异常投诉表';

-- ----------------------------
-- Table structure for qc_abnormal_attachment
-- ----------------------------
DROP TABLE IF EXISTS `qc_abnormal_attachment`;
CREATE TABLE `qc_abnormal_attachment` (
  `qa_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `qc_id` int(11) NOT NULL,
  `at_id` int(11) NOT NULL,
  `qa_createtime` int(10) NOT NULL,
  `qa_visible` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`qa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for qc_capa
-- ----------------------------
DROP TABLE IF EXISTS `qc_capa`;
CREATE TABLE `qc_capa` (
  `zl_id` int(10) NOT NULL AUTO_INCREMENT,
  `zl_no` varchar(30) DEFAULT NULL COMMENT 'capa编号',
  `zl_status` tinyint(1) DEFAULT NULL COMMENT '状态 1 已完成 2未完成 3 关闭',
  `dm_id` int(11) DEFAULT NULL COMMENT '偏差ID',
  `up_id` varchar(255) DEFAULT NULL COMMENT '文件ID',
  `zl_entry_time` varchar(255) DEFAULT NULL COMMENT '录入时间',
  `zl_uid` int(11) DEFAULT NULL COMMENT '编制人ID',
  `zl_username` varchar(255) DEFAULT NULL COMMENT '编制人',
  `zl_completion_time` int(10) DEFAULT NULL COMMENT '实际完成时间',
  PRIMARY KEY (`zl_id`),
  UNIQUE KEY `zl_no` (`zl_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qc_kpi
-- ----------------------------
DROP TABLE IF EXISTS `qc_kpi`;
CREATE TABLE `qc_kpi` (
  `kp_id` int(11) NOT NULL AUTO_INCREMENT,
  `yc_id` int(11) DEFAULT NULL COMMENT '异常编号',
  `yc_no` varchar(25) DEFAULT NULL COMMENT '异常编号',
  `cl_id` int(1) DEFAULT NULL COMMENT '投诉id',
  `cl_no` varchar(25) DEFAULT NULL COMMENT '投诉编号',
  `cl_type` int(1) DEFAULT NULL COMMENT '投诉类型 ',
  `to_id` int(11) DEFAULT NULL COMMENT '运输单序号',
  `to_no` int(11) DEFAULT NULL COMMENT '运输单号',
  `io_id` int(11) DEFAULT NULL COMMENT '出入库单序号',
  `io_no` varchar(32) DEFAULT NULL COMMENT '出入库单号',
  `kp_status` int(1) DEFAULT NULL COMMENT '状态:1新增 2已调查 3已确认 4已驳回 5已反馈 6已关闭',
  `kp_type` int(1) DEFAULT NULL COMMENT '类型 1温度 2丢破 3出入库 4投诉',
  `one_ab` int(1) DEFAULT NULL COMMENT '一级分类',
  `two_ab` int(1) DEFAULT NULL COMMENT '二级分类',
  `thr_ab` int(1) DEFAULT NULL COMMENT '三级分类',
  `kp_is_kpi` tinyint(1) DEFAULT '1' COMMENT '是否kpi 0待确定 1是 2否',
  `kp_visible` tinyint(1) DEFAULT '1' COMMENT 'kpi 1正常 0删除',
  `kp_entry_time` varchar(25) DEFAULT NULL COMMENT '录入时间',
  PRIMARY KEY (`kp_id`),
  KEY `yc_id` (`yc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for qc_upload
-- ----------------------------
DROP TABLE IF EXISTS `qc_upload`;
CREATE TABLE `qc_upload` (
  `up_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '附件ID',
  `up_identifier` varchar(25) NOT NULL COMMENT '附件编号 如:异常、投诉',
  `up_type` varchar(8) DEFAULT NULL COMMENT '附件类型',
  `up_create_username` varchar(32) DEFAULT NULL COMMENT '上传用户',
  `up_filesize` int(11) DEFAULT NULL COMMENT '附件大小',
  `up_visible` tinyint(1) DEFAULT '1' COMMENT '附件状态 1正常 0删除',
  `up_filename` varchar(255) DEFAULT NULL COMMENT '附件文件名',
  `up_filepath` varchar(255) NOT NULL COMMENT '附件文件路径',
  `up_createtime` int(10) DEFAULT NULL COMMENT '附件创建时间',
  `up_subtype` char(16) DEFAULT '' COMMENT '附件子类型',
  `up_create_uid` int(11) DEFAULT '0' COMMENT '用户UID',
  PRIMARY KEY (`up_id`)
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8 COMMENT='质控异常上传文件表';

-- ----------------------------
-- Table structure for qms_aduit
-- ----------------------------
DROP TABLE IF EXISTS `qms_aduit`;
CREATE TABLE `qms_aduit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `audit_info` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for qms_aduit_management
-- ----------------------------
DROP TABLE IF EXISTS `qms_aduit_management`;
CREATE TABLE `qms_aduit_management` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `audit_number` varchar(30) NOT NULL DEFAULT '0' COMMENT '审计编号',
  `audit_customer` varchar(100) NOT NULL DEFAULT '0' COMMENT '公司名称',
  `audit_applicant` varchar(100) NOT NULL DEFAULT '0' COMMENT '申请人',
  `audit_application_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '申请时间',
  `audit_seller` varchar(255) NOT NULL DEFAULT '0' COMMENT '销售',
  `audit_type` varchar(100) NOT NULL DEFAULT '0' COMMENT '审计类型',
  `audit_important` varchar(100) NOT NULL DEFAULT '0' COMMENT '重要程度',
  `audit_localtion` varchar(100) NOT NULL DEFAULT '0' COMMENT '审计地点',
  `audit_start_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审计开始时间',
  `audit_end_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审计结束时间',
  `audit_people_count` varchar(50) NOT NULL DEFAULT '0' COMMENT '来访人数',
  `audit_visit_area` varchar(100) NOT NULL DEFAULT '0' COMMENT '参观区域',
  `audit_scort_level` varchar(100) NOT NULL DEFAULT '0' COMMENT '生生陪护人员登记',
  `audit_direction` varchar(100) NOT NULL DEFAULT '0' COMMENT '审计方向',
  `audit_is_project` varchar(100) NOT NULL DEFAULT '0' COMMENT '是否立项',
  `audit_focus` varchar(100) NOT NULL DEFAULT '0' COMMENT '审计关注点',
  `audit_is_food` varchar(20) NOT NULL DEFAULT '0' COMMENT '是否就餐',
  `audit_is_fruits` varchar(20) NOT NULL DEFAULT '0' COMMENT '水果点心',
  `audit_company_introduce` varchar(100) NOT NULL DEFAULT '0' COMMENT '公司介绍',
  `audit_special_require` varchar(100) NOT NULL DEFAULT '0' COMMENT '特殊需要',
  `audit_file` varchar(1000) NOT NULL DEFAULT '0' COMMENT '附件地址',
  `audit_create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `audit_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审计状态（1正常，2取消，3关闭）',
  `audit_progess` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审计进度',
  `audit_method` varchar(20) NOT NULL DEFAULT '0' COMMENT '审计方式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for qms_attachment
-- ----------------------------
DROP TABLE IF EXISTS `qms_attachment`;
CREATE TABLE `qms_attachment` (
  `qat_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附加ID',
  `qat_type` int(11) NOT NULL COMMENT '附件类型，如：101验证管理',
  `qat_subtype` int(11) NOT NULL COMMENT '附件子类型,如101001 验证订单附件',
  `qat_identifier` int(11) NOT NULL COMMENT '附件标识ID',
  `qat_create_uid` int(11) NOT NULL COMMENT '附件创建者uid',
  `qat_create_username` varchar(20) NOT NULL COMMENT '附件创建者名称',
  `qat_filesize` int(11) NOT NULL COMMENT '附件文件大小，单位：KB',
  `qat_filename` varchar(100) NOT NULL COMMENT '附件文件名',
  `qat_filepath` varchar(255) NOT NULL COMMENT '附件文件路径',
  `qat_createtime` int(10) NOT NULL COMMENT '附件创建时间',
  `qat_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '附件状态 1正常，0删除',
  PRIMARY KEY (`qat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4 COMMENT='qms附件表';

-- ----------------------------
-- Table structure for qms_audit_config
-- ----------------------------
DROP TABLE IF EXISTS `qms_audit_config`;
CREATE TABLE `qms_audit_config` (
  `ac_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ac_fa_id` int(11) unsigned DEFAULT NULL COMMENT '父级id',
  `ac_type` tinyint(2) NOT NULL COMMENT '1=>一级类型配置；2=>二级类型配置',
  `ac_name` varchar(50) NOT NULL,
  `ac_creator_id` int(11) NOT NULL,
  `ac_creator_name` varchar(20) NOT NULL,
  `ac_createtime` int(10) NOT NULL,
  `ac_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=>禁用；1=>启用',
  `ac_visible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=>删除；1=>正常',
  PRIMARY KEY (`ac_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COMMENT='不合格项类型';

-- ----------------------------
-- Table structure for qms_exception_config
-- ----------------------------
DROP TABLE IF EXISTS `qms_exception_config`;
CREATE TABLE `qms_exception_config` (
  `ec_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ec_type` tinyint(2) NOT NULL COMMENT '1=>异常分类配置；2=>异常原因配置',
  `ec_name` varchar(50) NOT NULL,
  `ec_creator_id` int(11) NOT NULL,
  `ec_creator_name` varchar(20) NOT NULL,
  `ec_createtime` int(10) NOT NULL,
  `ec_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=>禁用；1=>启用',
  `ec_visible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '0=>删除；1=>正常',
  PRIMARY KEY (`ec_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for qms_qc_warehouse
-- ----------------------------
DROP TABLE IF EXISTS `qms_qc_warehouse`;
CREATE TABLE `qms_qc_warehouse` (
  `qw_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `qw_no` varchar(20) NOT NULL COMMENT '异常编号',
  `qw_wa_no` varchar(30) NOT NULL COMMENT '仓库编号',
  `qw_wa_id` int(11) NOT NULL COMMENT '仓库ID',
  `qw_wa_name` varchar(30) NOT NULL COMMENT '仓库名称',
  `qw_type` tinyint(4) NOT NULL COMMENT '异常类型',
  `qw_month` int(10) NOT NULL COMMENT '异常月份',
  `qw_description` text NOT NULL COMMENT '描述',
  `qw_research` text NOT NULL COMMENT '调查',
  `qw_reason` text NOT NULL COMMENT '调查原因',
  `qw_region_id` int(11) NOT NULL COMMENT '事故城市ID',
  `qw_region_name` varchar(20) NOT NULL COMMENT '事故城市名称',
  `qw_reason_type` tinyint(4) NOT NULL COMMENT '原因分类',
  `qw_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '异常状态(1=>新增；2=>已调查)',
  `qw_creator_id` int(11) NOT NULL COMMENT '录入人',
  `qw_creator_name` varchar(20) NOT NULL COMMENT '录入人姓名',
  `qw_createtime` int(10) NOT NULL COMMENT '创建时间',
  `qw_visible` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`qw_id`),
  UNIQUE KEY `unique_qw_no` (`qw_no`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='仓储温度异常';

-- ----------------------------
-- Table structure for qms_quality_aduit
-- ----------------------------
DROP TABLE IF EXISTS `qms_quality_aduit`;
CREATE TABLE `qms_quality_aduit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `audit_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '泛微申请id',
  `audit_sslogistic_grade` varchar(30) NOT NULL DEFAULT '1' COMMENT '生生参会人员等级',
  `audit_quality_leading` varchar(20) NOT NULL DEFAULT '0' COMMENT '质量主导人员',
  `audit_quality_partake` varchar(200) NOT NULL DEFAULT '0' COMMENT '质量参与人员',
  `audit_apply_qualified` varchar(100) NOT NULL DEFAULT '1' COMMENT '申请是否合格(1、是，2、否)',
  `audit_unqualified_reason` varchar(200) NOT NULL DEFAULT '0' COMMENT '申请不合格原因',
  `audit_people_count` varchar(10) NOT NULL DEFAULT '0' COMMENT '客户来访人数',
  `audit_progess` tinyint(4) NOT NULL DEFAULT '1' COMMENT '审计进度',
  `audit_report` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否出具审计报告',
  `audit_report_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '审计时间',
  `audit_start_times` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审计开始时间',
  `audit_end_times` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '审计结束时间',
  `audit_reply_customer_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '客户要求回复时间',
  `audit_rectification_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '整改计划回复日期',
  `audit_rectification_finish_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '整改计划完成日期',
  `audit_rectification_real_finish_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '整改计划实际完成日期',
  `audit_quality_summary` text NOT NULL COMMENT '质量人员总结',
  `audit_create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `audit_update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `audit_id` (`audit_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for qms_quality_audit
-- ----------------------------
DROP TABLE IF EXISTS `qms_quality_audit`;
CREATE TABLE `qms_quality_audit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `audit_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '泛微申请id',
  `audit_sslogistic_grade` tinyint(4) DEFAULT '1' COMMENT '生生参会人员等级',
  `audit_quality_leading` varchar(20) DEFAULT '0' COMMENT '质量主导人员',
  `audit_quality_partake` varchar(20) DEFAULT '0' COMMENT '质量参与人员',
  `audit_apply_qualified` tinyint(4) DEFAULT '1' COMMENT '申请是否合格(1、是，2、否)',
  `audit_unqualified_reason` varchar(200) DEFAULT '0' COMMENT '申请不合格原因',
  `audit_people_count` varchar(10) DEFAULT '0' COMMENT '客户来访人数',
  `audit_progess` tinyint(4) DEFAULT '0' COMMENT '审计进度',
  `audit_report` tinyint(4) DEFAULT '0' COMMENT '是否出具审计报告',
  `audit_report_time` date DEFAULT '0000-00-00' COMMENT '审计时间',
  `audit_start_times` date DEFAULT '0000-00-00' COMMENT '审计开始时间',
  `audit_end_times` date DEFAULT '0000-00-00' COMMENT '审计结束时间',
  `audit_reply_customer_time` date DEFAULT '0000-00-00' COMMENT '客户要求回复时间',
  `audit_rectification_time` date DEFAULT '0000-00-00' COMMENT '整改计划回复日期',
  `audit_rectification_finish_time` date DEFAULT '0000-00-00' COMMENT '整改计划完成日期',
  `audit_rectification_real_finish_time` date DEFAULT '0000-00-00' COMMENT '整改计划实际完成日期',
  `audit_quality_summary` varchar(100) DEFAULT '0' COMMENT '质量人员总结',
  `autit_files` varchar(255) DEFAULT '0',
  `audit_create_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `audit_update_time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='审计信息';

-- ----------------------------
-- Table structure for qms_series_abnormal_file
-- ----------------------------
DROP TABLE IF EXISTS `qms_series_abnormal_file`;
CREATE TABLE `qms_series_abnormal_file` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `gd_id` int(11) DEFAULT NULL COMMENT '物资明细表id',
  `att_id` int(11) NOT NULL COMMENT '附件id',
  `abnormal_cause` varchar(255) DEFAULT NULL COMMENT '异常原因',
  `factory_number` varchar(50) DEFAULT NULL COMMENT '出厂编号',
  `model` varchar(20) DEFAULT NULL COMMENT '温度计型号（文件）',
  `manufacturer` varchar(20) DEFAULT NULL COMMENT '制造厂',
  `calibration_date` varchar(30) DEFAULT NULL COMMENT '校准日期',
  `status` tinyint(4) DEFAULT '2' COMMENT '状态（1、正常，2、删除）',
  `up_name` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人名称',
  `up_uid` int(11) DEFAULT NULL COMMENT '修改人id',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL COMMENT '修改时间',
  `handle_name` varchar(50) DEFAULT NULL COMMENT '异常文件处理人',
  `handle_status` tinyint(4) DEFAULT '2' COMMENT '异常文件处理状态(1、已处理，2未处理)',
  `handle_time` int(11) DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`),
  KEY `idx_att_id` (`att_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1474 DEFAULT CHARSET=utf8mb4 COMMENT='温度探头校准异常文件';

-- ----------------------------
-- Table structure for qms_unqualified_book
-- ----------------------------
DROP TABLE IF EXISTS `qms_unqualified_book`;
CREATE TABLE `qms_unqualified_book` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `audit_id` int(11) NOT NULL DEFAULT '0' COMMENT '审计id',
  `number` varchar(20) NOT NULL DEFAULT '0' COMMENT '序号',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '来源',
  `level` varchar(20) NOT NULL COMMENT '级别',
  `one_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '类型',
  `two_type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '二级类型',
  `person_lible` varchar(20) NOT NULL DEFAULT '0' COMMENT '责任人',
  `person_part` varchar(20) NOT NULL DEFAULT '0' COMMENT '责任部门',
  `quality_follwer` varchar(30) NOT NULL DEFAULT '0' COMMENT '质量跟进人员',
  `require_finish_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '要求完成时间',
  `real_finish_time` date NOT NULL DEFAULT '0000-00-00' COMMENT '实际完成时间',
  `is_delay` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否延期',
  `edit_proess` varchar(100) NOT NULL DEFAULT '0' COMMENT '完成进度',
  `unqualified_descri` text NOT NULL COMMENT '不合格项描述',
  `method` text NOT NULL COMMENT '整改方法',
  `remark` text NOT NULL COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态1正常2删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for qms_verify_attachment
-- ----------------------------
DROP TABLE IF EXISTS `qms_verify_attachment`;
CREATE TABLE `qms_verify_attachment` (
  `qva_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `qvo_id` int(11) NOT NULL,
  `qat_id` int(11) NOT NULL,
  `qva_createtime` int(10) NOT NULL,
  `qva_visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`qva_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COMMENT='验证订单管理附件表';

-- ----------------------------
-- Table structure for qms_verify_cost
-- ----------------------------
DROP TABLE IF EXISTS `qms_verify_cost`;
CREATE TABLE `qms_verify_cost` (
  `qvc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `qvc_type` tinyint(1) NOT NULL COMMENT '类型:1=>母单费运；2=>子单费运',
  `qvc_identifier` int(11) NOT NULL COMMENT '项目ID',
  `qvc_accommodation` decimal(10,2) NOT NULL COMMENT '住宿费',
  `qvc_labor` decimal(10,2) NOT NULL COMMENT '人工成本',
  `qvc_report` decimal(10,2) NOT NULL COMMENT '报告费',
  `qvc_program` decimal(10,2) NOT NULL COMMENT '方案费',
  `qvc_transportation` decimal(10,2) NOT NULL COMMENT '交通费',
  `qvc_thermometer` decimal(10,2) NOT NULL COMMENT '温度计费',
  `qvc_detection` decimal(10,2) NOT NULL COMMENT '第三方检测费',
  `qvc_else` decimal(10,2) NOT NULL COMMENT '其他费运',
  `qvc_total` decimal(10,2) NOT NULL,
  `qvc_createtime` int(10) NOT NULL,
  `qvc_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：0=>删除；1=>正常',
  PRIMARY KEY (`qvc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COMMENT='验证成本表';

-- ----------------------------
-- Table structure for qms_verify_order
-- ----------------------------
DROP TABLE IF EXISTS `qms_verify_order`;
CREATE TABLE `qms_verify_order` (
  `qvo_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '验证订单ID',
  `qvo_no` varchar(30) NOT NULL COMMENT '验证订单编号',
  `cu_id` int(11) NOT NULL COMMENT '委托客户ID',
  `cu_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '委托客户名称',
  `qvo_project_name` varchar(30) DEFAULT NULL,
  `qvo_leader_id` int(11) NOT NULL COMMENT '验证负责人ID',
  `qvo_leader_name` varchar(10) NOT NULL COMMENT '验证负责人',
  `qvo_qap_name` varchar(20) NOT NULL COMMENT '客户QA对接人',
  `qvo_lctp_name` varchar(20) NOT NULL DEFAULT '' COMMENT '客户物流对接人',
  `qvo_creator_id` int(11) NOT NULL COMMENT '订单创建者ID',
  `qvo_creator_name` varchar(20) NOT NULL COMMENT '订单创建者名称',
  `qvo_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '订单进度(1=>未执行，2=>执行中，3=>已完成，0=>已取消)',
  `qvo_clearing_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '结算状态(1=>未结算；2=>已结算，3=>部分结算)',
  `qvo_createtime` int(10) NOT NULL COMMENT '创建时间',
  `qvo_visible` tinyint(1) NOT NULL DEFAULT '1',
  `qvo_description` varchar(300) NOT NULL DEFAULT '0' COMMENT '取消原因',
  `qvo_abnormal_status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '异常状态(1、正常，2、异常)',
  PRIMARY KEY (`qvo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COMMENT='验证订单表';

-- ----------------------------
-- Table structure for qms_verify_task
-- ----------------------------
DROP TABLE IF EXISTS `qms_verify_task`;
CREATE TABLE `qms_verify_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `gd_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '物资id',
  `sto_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存id',
  `pb_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '包装箱关联表id',
  `ga_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '物资附件表id',
  `verify_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派的验证人员id',
  `verify_user_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '指派验证人员名',
  `verify_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生成任务时间',
  `verify_assign_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派时间',
  `verify_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证完成时间',
  `verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证月份',
  `verify_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '验证状态(1、待指派，2、待验证，3、验证中，4、验证完成)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=407 DEFAULT CHARSET=utf8mb4 COMMENT='温控设备验证任务表';

-- ----------------------------
-- Table structure for qms_verify_task_copy
-- ----------------------------
DROP TABLE IF EXISTS `qms_verify_task_copy`;
CREATE TABLE `qms_verify_task_copy` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `gd_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '物资id',
  `sto_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '库存id',
  `pb_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '包装箱关联表id',
  `ga_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '物资附件表id',
  `verify_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派的验证人员id',
  `verify_user_name` varchar(100) NOT NULL DEFAULT '0' COMMENT '指派验证人员名',
  `verify_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '生成任务时间',
  `verify_assign_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '指派时间',
  `verify_end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证完成时间',
  `verify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证月份',
  `verify_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '验证状态(1、待指派，2、待验证，3、验证中，4、验证完成)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COMMENT='温控设备验证任务表';

-- ----------------------------
-- Table structure for quality_log
-- ----------------------------
DROP TABLE IF EXISTS `quality_log`;
CREATE TABLE `quality_log` (
  `ql_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '备注序号',
  `ql_type` char(8) DEFAULT '' COMMENT '备注类型，如：101异常 102理赔 103投诉',
  `ql_subtype` char(16) DEFAULT '' COMMENT '操作类型，如：1创建 2调查',
  `ql_identifier` varchar(20) DEFAULT NULL COMMENT '备注标识，如：异常编号Id、投诉编号Id等',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `username` char(32) DEFAULT '' COMMENT '操作人',
  `ql_status` tinyint(4) unsigned DEFAULT '0' COMMENT '备注状态 0正常，1删除',
  `ql_remark` varchar(1024) DEFAULT NULL COMMENT '备注内容',
  `ql_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ql_server_type` tinyint(2) DEFAULT '1' COMMENT '操作类型 1 电脑操作 2 手机操作',
  PRIMARY KEY (`ql_id`),
  KEY `ql_identifier` (`ql_identifier`),
  KEY `ql_type` (`ql_type`),
  KEY `ql_subtype` (`ql_subtype`),
  KEY `ql_server_type` (`ql_server_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3172 DEFAULT CHARSET=utf8 COMMENT='质控异常备注记录表';

-- ----------------------------
-- Table structure for quotation
-- ----------------------------
DROP TABLE IF EXISTS `quotation`;
CREATE TABLE `quotation` (
  `qt_id` int(10) NOT NULL AUTO_INCREMENT,
  `qt_number` varchar(256) NOT NULL COMMENT '编号',
  `qt_type` tinyint(1) DEFAULT NULL COMMENT '报价类型 1城市明细  2城市分类 3首续箱',
  `qt_create_uid` int(10) NOT NULL COMMENT '创建人',
  `qt_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `qt_createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `qt_lastupdtime` int(10) DEFAULT '0' COMMENT '最后更新时间',
  `qt_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1正常2删除',
  `qt_standard` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0非标准报价 1标准报价',
  PRIMARY KEY (`qt_id`),
  KEY `qt_create_uid` (`qt_create_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=736 DEFAULT CHARSET=utf8 COMMENT='报价单';

-- ----------------------------
-- Table structure for quotation_settlement_config
-- ----------------------------
DROP TABLE IF EXISTS `quotation_settlement_config`;
CREATE TABLE `quotation_settlement_config` (
  `qsc_id` int(10) NOT NULL AUTO_INCREMENT,
  `cq_id` int(10) NOT NULL COMMENT 'customer_quotation cq_id',
  `start_region_id` int(11) NOT NULL COMMENT '出港城市id',
  `start_region_name` varchar(255) NOT NULL COMMENT '出港城市',
  `range_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '出港范围 1出港城市以内 2 出港城市以外',
  `city_type` tinyint(3) NOT NULL DEFAULT '1' COMMENT '1同城2异地',
  `start_co_name` char(128) DEFAULT NULL COMMENT '发件人',
  `qsc_status` tinyint(3) DEFAULT '1' COMMENT '1正常2删除',
  `qsc_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `qsc_create_uid` int(10) NOT NULL COMMENT '创建人',
  `qsc_create_username` char(32) DEFAULT '' COMMENT '创建人姓名',
  `qsc_createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qsc_lastupd_uid` int(10) NOT NULL COMMENT '最后更新人',
  `qsc_lastupd_username` char(32) DEFAULT '' COMMENT '更新人姓名',
  `qsc_lastupdtime` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `to_category` varchar(50) NOT NULL DEFAULT '' COMMENT '订单类型 1 正常订单 2仓库发药 3 验证订单',
  PRIMARY KEY (`qsc_id`),
  KEY `cq_id` (`cq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COMMENT='报价结算配置表';

-- ----------------------------
-- Table structure for quotation_settlement_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `quotation_settlement_config_detail`;
CREATE TABLE `quotation_settlement_config_detail` (
  `qscd_id` int(10) NOT NULL AUTO_INCREMENT,
  `qsc_id` int(10) NOT NULL COMMENT 'quotation_settlement_config qsc_id',
  `fee_type` tinyint(3) NOT NULL COMMENT '配置类型1，包装费；2，制冷费，3续重费',
  `fee_status` tinyint(1) DEFAULT '2' COMMENT '订单类型 1 收费 2不收费',
  `qscd_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，2删除',
  `qscd_createtime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `qscd_lastupdtime` datetime DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `sto_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '不收费箱型，逗号隔开',
  `sto_names` varchar(2000) NOT NULL,
  PRIMARY KEY (`qscd_id`),
  KEY `qsc_id` (`qsc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=318 DEFAULT CHARSET=utf8 COMMENT='报价结算配置明细表';

-- ----------------------------
-- Table structure for realbill
-- ----------------------------
DROP TABLE IF EXISTS `realbill`;
CREATE TABLE `realbill` (
  `rb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '实开id',
  `cu_id` int(11) DEFAULT '0' COMMENT '客户id',
  `bd_id` int(11) DEFAULT '0' COMMENT '明细id 主要是支出类型的id',
  `bi_id` int(11) unsigned DEFAULT '0' COMMENT '开票信息id',
  `rb_billtype` int(11) NOT NULL COMMENT '0 增值税普通发票 1增增值税专用发票 2 增值税电子普通发票',
  `rb_billname` char(255) DEFAULT '' COMMENT '开票名称',
  `rb_billamount` decimal(10,2) DEFAULT '0.00' COMMENT '开票金额',
  `rb_billdate` int(10) DEFAULT '0' COMMENT '开票日期',
  `rb_drawer_id` int(10) DEFAULT NULL COMMENT '开票人id',
  `rb_drawer` varchar(32) DEFAULT NULL COMMENT '开票人 即为 经办人',
  `rb_assign_uid` int(10) DEFAULT NULL COMMENT '指派id',
  `rb_assign_username` char(30) DEFAULT '0' COMMENT '开票指派人',
  `rb_billnumber` char(64) DEFAULT '' COMMENT '发票号码',
  `rb_sendstatus` tinyint(3) DEFAULT '0' COMMENT '0未寄送 1已寄送 2已签收',
  `rb_contact` varchar(1024) DEFAULT '' COMMENT '收件人信息',
  `rb_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `balance_status` tinyint(1) DEFAULT '0' COMMENT '开票状态 0已计提 1已销账 2已开票 3已作废',
  `rb_returndate` int(10) DEFAULT NULL COMMENT '还款日期',
  `rb_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `rb_phone` char(32) DEFAULT NULL COMMENT '收件人电话',
  `rb_recipients` varchar(32) DEFAULT NULL COMMENT '发票收件人',
  `rb_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `rb_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `rb_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `rb_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `rb_rate` decimal(10,4) DEFAULT NULL COMMENT '税率',
  `rb_type` tinyint(2) DEFAULT NULL COMMENT '服务类型 1 运费 2 货运代理费 3 仓储费',
  `rb_express` tinyint(1) DEFAULT NULL COMMENT '快递',
  `rb_express_no` varchar(30) DEFAULT NULL COMMENT '快递单号',
  `sms_time` varchar(255) DEFAULT NULL COMMENT '最后一次催款时间',
  `rb_mail` varchar(255) DEFAULT NULL COMMENT '电子发票寄送邮箱',
  `rb_unset_status` tinyint(1) DEFAULT '0' COMMENT '部分销账状态 0正常状态 1部分销账',
  `br_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '预开票状态 0正常开票1预开票',
  PRIMARY KEY (`rb_id`),
  KEY `bi_id` (`bi_id`),
  KEY `rb_assign_id` (`rb_assign_uid`),
  KEY `rb_drawer_id` (`rb_drawer_id`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=122040 DEFAULT CHARSET=utf8 COMMENT='实开发票表';

-- ----------------------------
-- Table structure for realbill_copy
-- ----------------------------
DROP TABLE IF EXISTS `realbill_copy`;
CREATE TABLE `realbill_copy` (
  `rb_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '实开id',
  `cu_id` int(11) DEFAULT '0' COMMENT '客户id',
  `bd_id` int(11) DEFAULT '0' COMMENT '明细id 主要是支出类型的id',
  `bi_id` int(11) unsigned DEFAULT '0' COMMENT '开票信息id',
  `rb_billtype` int(11) NOT NULL COMMENT '0 普票 1增票',
  `rb_billname` char(128) DEFAULT '' COMMENT '开票名称',
  `rb_billamount` decimal(10,2) DEFAULT '0.00' COMMENT '开票金额',
  `rb_billdate` int(10) DEFAULT '0' COMMENT '开票日期',
  `rb_drawer_id` int(10) DEFAULT NULL COMMENT '开票人id',
  `rb_drawer` varchar(32) DEFAULT NULL COMMENT '开票人 即为 经办人',
  `rb_assign_uid` int(10) DEFAULT NULL COMMENT '指派id',
  `rb_assign_username` char(30) DEFAULT '0' COMMENT '开票指派人',
  `rb_billnumber` char(64) DEFAULT '' COMMENT '发票号码',
  `rb_sendstatus` tinyint(3) DEFAULT NULL COMMENT '1未寄送 2已寄送 3已签收',
  `rb_contact` varchar(1024) DEFAULT '' COMMENT '收件人信息',
  `rb_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `balance_status` tinyint(1) DEFAULT '0' COMMENT '开票状态 0已计提 1已销账 2已开票 3已作废',
  `rb_returndate` int(10) DEFAULT NULL COMMENT '还款日期',
  `rb_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `rb_phone` char(32) DEFAULT NULL COMMENT '收件人电话',
  `rb_recipients` varchar(32) DEFAULT NULL COMMENT '发票收件人',
  `rb_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `rb_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `rb_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `rb_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `rb_rate` decimal(10,4) DEFAULT NULL COMMENT '税率',
  `rb_type` tinyint(2) DEFAULT NULL COMMENT '服务类型 1 运费 2 货运代理费 3 仓储费',
  `rb_express` tinyint(1) DEFAULT NULL COMMENT '快递',
  `rb_express_no` varchar(30) DEFAULT NULL COMMENT '快递单号',
  PRIMARY KEY (`rb_id`),
  KEY `bi_id` (`bi_id`),
  KEY `rb_assign_id` (`rb_assign_uid`),
  KEY `rb_drawer_id` (`rb_drawer_id`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118153 DEFAULT CHARSET=utf8 COMMENT='实开发票表';

-- ----------------------------
-- Table structure for receivable
-- ----------------------------
DROP TABLE IF EXISTS `receivable`;
CREATE TABLE `receivable` (
  `re_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cu_id` int(10) unsigned NOT NULL COMMENT '客户id',
  `cu_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `re_month` varchar(12) DEFAULT NULL COMMENT '月份',
  `re_initial_amount` decimal(20,2) DEFAULT '0.00' COMMENT '期初金额',
  `re_settlement_amount` decimal(20,2) DEFAULT '0.00' COMMENT '结算收入',
  `re_adjustment_amount` decimal(20,2) DEFAULT '0.00' COMMENT '调整收入',
  `re_gathering_amount` decimal(20,2) DEFAULT '0.00' COMMENT '回款金额',
  `re_ending_amount` decimal(20,2) DEFAULT '0.00' COMMENT '期末余额',
  `re_create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `cdr_id` int(10) DEFAULT NULL COMMENT '结转ID',
  `gathering_cdr_id` int(10) DEFAULT NULL COMMENT '回款结转ID',
  `ur_uid` int(10) unsigned DEFAULT NULL,
  `username` char(32) DEFAULT NULL,
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  PRIMARY KEY (`re_id`),
  KEY `re_month` (`re_month`)
) ENGINE=InnoDB AUTO_INCREMENT=3487 DEFAULT CHARSET=utf8mb4 COMMENT='财务应收统计表';

-- ----------------------------
-- Table structure for receivable_carryover
-- ----------------------------
DROP TABLE IF EXISTS `receivable_carryover`;
CREATE TABLE `receivable_carryover` (
  `rc_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '结转ID',
  `bi_id` int(11) NOT NULL COMMENT '发票id',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '发票抬头（客户名称）',
  `rc_initial_balance` decimal(10,2) DEFAULT '0.00' COMMENT '期初金额',
  `rc_ending_balbance` decimal(10,2) DEFAULT '0.00' COMMENT '期末余额',
  `rc_month` char(16) DEFAULT NULL COMMENT '结转月份',
  `rc_time` int(11) DEFAULT NULL COMMENT '结转时间',
  `rc_cash_amount` decimal(10,2) DEFAULT '0.00' COMMENT '现金收款金额',
  `rc_bank_amount` decimal(10,2) DEFAULT '0.00' COMMENT '银行收款金额',
  `rc_rest_amount` decimal(10,2) DEFAULT '0.00' COMMENT '其他收款金额',
  `rc_goldentax_amount` decimal(10,2) DEFAULT '0.00' COMMENT '金税开票金额',
  `rc_beforehand_amount` decimal(10,2) DEFAULT '0.00' COMMENT '冲预开票金额',
  `rc_nobill_amount` decimal(10,2) DEFAULT '0.00' COMMENT '不开票金额',
  `rc_electronic_amount` decimal(10,2) DEFAULT '0.00' COMMENT '电子开票金额',
  `rc_visible` tinyint(2) DEFAULT '2' COMMENT '结转状态 1 已结转 2 反结转',
  `rc_updatetime` int(11) DEFAULT NULL COMMENT '修改时间',
  `rc_type` tinyint(2) DEFAULT '2' COMMENT '期初状态 1 有期初 2 无期初',
  `rc_ICBC` decimal(10,2) DEFAULT '0.00' COMMENT '工行回款',
  `rc_CMBC` decimal(10,2) DEFAULT '0.00' COMMENT '招行回款',
  `rc_cash` decimal(10,2) DEFAULT '0.00' COMMENT '现金回款',
  `rc_foreign` decimal(10,2) DEFAULT '0.00' COMMENT '外币收入',
  `rc_wechat` decimal(10,2) DEFAULT '0.00' COMMENT '微信收款',
  `rc_alipay` decimal(10,2) DEFAULT '0.00' COMMENT '支付宝回款',
  `rc_badbank` decimal(10,2) DEFAULT '0.00' COMMENT '坏账',
  `rc_exchange` decimal(10,2) DEFAULT '0.00' COMMENT '汇兑损益',
  `rc_nocloseout` decimal(10,2) DEFAULT '0.00' COMMENT '未清账金额',
  `rc_bill_adjustment` decimal(10,2) DEFAULT '0.00' COMMENT '开票调整',
  `rc_financial_adjustment` decimal(10,2) DEFAULT '0.00' COMMENT '财务调整',
  `rc_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`rc_id`),
  KEY `bi_id` (`bi_id`),
  KEY `rc_month` (`rc_month`)
) ENGINE=InnoDB AUTO_INCREMENT=37540 DEFAULT CHARSET=utf8 COMMENT='应收账款表';

-- ----------------------------
-- Table structure for receivable_detail
-- ----------------------------
DROP TABLE IF EXISTS `receivable_detail`;
CREATE TABLE `receivable_detail` (
  `rd_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `rd_month` varchar(12) DEFAULT NULL COMMENT '月份',
  `rd_type` tinyint(4) unsigned DEFAULT '1' COMMENT '明细类型:1结算 2调整',
  `rd_order_amount` decimal(20,2) DEFAULT '0.00' COMMENT '物流结算(调整)收入',
  `rd_sample_amount` decimal(20,2) DEFAULT '0.00' COMMENT '样本结算(调整)收入',
  `rd_medicine_amount` decimal(20,2) DEFAULT '0.00' COMMENT '药品结算(调整)收入',
  `rd_other_amount` decimal(20,2) DEFAULT '0.00' COMMENT '其他结算(调整)收入',
  `rd_papers_fee` decimal(20,2) DEFAULT '0.00' COMMENT '证件代办费(调整)',
  `rd_consumables_fee` decimal(20,2) DEFAULT '0.00' COMMENT '设备耗材费(调整)',
  `rd_labor_fee` decimal(20,2) DEFAULT '0.00' COMMENT '劳务支出费(调整)',
  `rd_freecharge_fee` decimal(20,2) DEFAULT '0.00' COMMENT '免单理赔费(调整)',
  `rd_discount_fee` decimal(20,2) DEFAULT '0.00' COMMENT '折扣调整费(调整)',
  `rd_label_fee` decimal(20,2) DEFAULT '0.00' COMMENT '贴标费用(调整)',
  `rd_verify_fee` decimal(20,2) DEFAULT '0.00' COMMENT '验证费用(调整)',
  `rd_destruction_fee` decimal(20,2) DEFAULT '0.00' COMMENT '销毁费用(调整)',
  `rd_other_fee` decimal(20,2) DEFAULT '0.00' COMMENT '其他费用(调整)',
  `re_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '应收报表ID',
  `ur_uid` int(10) unsigned DEFAULT NULL COMMENT '操作人ID',
  `username` char(32) DEFAULT '' COMMENT '操作人',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) NOT NULL COMMENT '开票客户名称',
  `cdr_id` int(10) DEFAULT NULL COMMENT '结转ID',
  `rd_create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `rd_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`rd_id`),
  KEY `rd_month` (`rd_month`),
  KEY `rd_type` (`rd_type`),
  KEY `bi_id` (`bi_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应收明细统计表';

-- ----------------------------
-- Table structure for receivable_month_detail
-- ----------------------------
DROP TABLE IF EXISTS `receivable_month_detail`;
CREATE TABLE `receivable_month_detail` (
  `rmd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '应收明细ID',
  `rmd_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci DEFAULT NULL COMMENT '应收月份',
  `rmd_order` decimal(20,2) DEFAULT '0.00' COMMENT '物流收入',
  `rmd_drug` decimal(20,2) DEFAULT '0.00' COMMENT '药品仓储收入',
  `rmd_sample` decimal(20,2) DEFAULT '0.00' COMMENT '样本收入',
  `rmd_other` decimal(20,2) DEFAULT '0.00' COMMENT '其他收入',
  `rmd_other_detail` text COMMENT '其他收入明细',
  `rmd_ai_order` decimal(20,2) DEFAULT '0.00' COMMENT '物流调整收入',
  `rmd_ai_drug` decimal(20,2) DEFAULT '0.00' COMMENT '药品调整收入',
  `rmd_ai_sample` decimal(20,2) DEFAULT NULL COMMENT '样本调整收入',
  `rmd_ai_other` decimal(20,2) DEFAULT NULL COMMENT '其他调整收入',
  `rmd_ai_other_detail` text COMMENT '其他调整收入明细',
  `rmd_gathering` decimal(20,2) DEFAULT NULL COMMENT '回款金额',
  PRIMARY KEY (`rmd_id`),
  KEY `month` (`rmd_month`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应收-月度汇总明细';

-- ----------------------------
-- Table structure for receivable_month_summary
-- ----------------------------
DROP TABLE IF EXISTS `receivable_month_summary`;
CREATE TABLE `receivable_month_summary` (
  `rms_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '月度应收汇总ID',
  `rms_month` varchar(255) NOT NULL COMMENT '月份',
  `rms_initial_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '期初金额',
  `rms_settlement_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '结算收入',
  `rms_adjustment_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '调整收入',
  `rms_gathering_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '回款金额',
  `rms_ending_amount` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '期末金额',
  `rms_update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `rms_settlement_cdr_id` int(11) DEFAULT NULL COMMENT '收入确认ID',
  `rms_gathering_cdr_id` int(11) DEFAULT NULL COMMENT '回款确认ID',
  PRIMARY KEY (`rms_id`),
  KEY `month` (`rms_month`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='应收-月度汇总表';

-- ----------------------------
-- Table structure for recipients_check
-- ----------------------------
DROP TABLE IF EXISTS `recipients_check`;
CREATE TABLE `recipients_check` (
  `ruc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `to_id` int(11) NOT NULL COMMENT '订单id',
  `to_no` char(32) DEFAULT '' COMMENT '订单号',
  `ruc_status` tinyint(1) DEFAULT '1' COMMENT '校验状态 1:校验通过， 2:校验未通过',
  `ruc_person` varchar(10) DEFAULT '' COMMENT '校验人',
  PRIMARY KEY (`ruc_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COMMENT='收件单位地址检验';

-- ----------------------------
-- Table structure for recipients_unit
-- ----------------------------
DROP TABLE IF EXISTS `recipients_unit`;
CREATE TABLE `recipients_unit` (
  `ru_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '收件单位地址ID',
  `recipients_unit` varchar(100) DEFAULT NULL COMMENT '收件客户名称',
  `recipients_address` varchar(255) DEFAULT NULL COMMENT '收件客户地址',
  `recipients_unit_keyword` varchar(100) DEFAULT NULL COMMENT '收件客户名称关键字',
  `recipients_address_keyword` varchar(255) DEFAULT NULL COMMENT '收件客户地址关键字',
  `re_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1正常，0删除',
  `recipients_city_name` varchar(50) DEFAULT NULL COMMENT '收件城市',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '委托客户序号',
  PRIMARY KEY (`ru_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COMMENT='收件单位地址关键字配置';

-- ----------------------------
-- Table structure for recover_drug
-- ----------------------------
DROP TABLE IF EXISTS `recover_drug`;
CREATE TABLE `recover_drug` (
  `rd_id` int(11) NOT NULL AUTO_INCREMENT,
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `hw_id` int(11) DEFAULT NULL COMMENT '货位id (无编号药品默认为1，不存储货位)',
  `rd_quantity` int(11) unsigned DEFAULT NULL COMMENT '数量',
  `rd_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `rd_updatetime` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`rd_id`),
  UNIQUE KEY `uni_sto_id_db_id_hw_id` (`sto_id`,`db_id`,`hw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COMMENT='药品回收表';

-- ----------------------------
-- Table structure for recover_drug_detail
-- ----------------------------
DROP TABLE IF EXISTS `recover_drug_detail`;
CREATE TABLE `recover_drug_detail` (
  `rdd_id` int(11) NOT NULL AUTO_INCREMENT,
  `hw_id` int(11) DEFAULT NULL COMMENT '货位id',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `id_stock_detail` varchar(32) DEFAULT NULL COMMENT '明细编号',
  `state` int(11) DEFAULT '0' COMMENT '状态  0:正常  1:已出库',
  `rdd_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `rdd_updatetime` int(11) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`rdd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=279 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for refund_log
-- ----------------------------
DROP TABLE IF EXISTS `refund_log`;
CREATE TABLE `refund_log` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '退款id',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '运单id',
  `temp_id` int(11) NOT NULL DEFAULT '0' COMMENT '委托订单id',
  `r_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款方式  5 微信  6支付宝',
  `r_totel_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单支付金额',
  `r_refund_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '申请退款金额',
  `r_settlement_refund_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '结算退款金额',
  `r_trade_no` varchar(128) NOT NULL DEFAULT '' COMMENT '支付单号',
  `r_refund_no` varchar(128) NOT NULL DEFAULT '' COMMENT '退款单号',
  `r_examine_id` varchar(64) NOT NULL DEFAULT '' COMMENT '退款泛微审批单号',
  `r_examine_ee_id` varchar(64) NOT NULL DEFAULT '' COMMENT '退款泛微审批异步id',
  `r_transaction_id` varchar(64) NOT NULL DEFAULT '0' COMMENT '订单支付流水号',
  `r_refund_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信退款流水号',
  `r_refund_time` int(11) NOT NULL DEFAULT '0' COMMENT '退款时间',
  `r_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '记录生成时间',
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for remark_log
-- ----------------------------
DROP TABLE IF EXISTS `remark_log`;
CREATE TABLE `remark_log` (
  `rl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '备注序号',
  `rl_type` char(8) DEFAULT '' COMMENT '备注类型，如：100采购单、101入库单 102 订单 103-调渡单',
  `rl_subtype` char(16) DEFAULT '' COMMENT '操作类型，如：100001指派、100002备注、100003生成采购单',
  `rl_identifier` int(11) unsigned DEFAULT '0' COMMENT '备注标识，如：采购单序号、入库单序号等',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `username` char(32) DEFAULT '' COMMENT '操作人',
  `rl_status` tinyint(4) unsigned DEFAULT '0' COMMENT '备注状态 0正常，1删除',
  `rl_remark` longtext COMMENT '备注内容',
  `rl_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `rl_server_type` tinyint(2) DEFAULT '1' COMMENT '操作端口 1 电脑操作  2 m3操作 3 服务号  4 操作号',
  `rl_region_id` int(11) DEFAULT '0' COMMENT '操作城市id',
  PRIMARY KEY (`rl_id`),
  KEY `rl_identifier` (`rl_identifier`),
  KEY `rl_server_type` (`rl_server_type`),
  KEY `rl_type` (`rl_type`),
  KEY `rl_subtype` (`rl_subtype`),
  KEY `rl_createtime` (`rl_createtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4726614 DEFAULT CHARSET=utf8 COMMENT='备注记录表';

-- ----------------------------
-- Table structure for remark_log_copy1
-- ----------------------------
DROP TABLE IF EXISTS `remark_log_copy1`;
CREATE TABLE `remark_log_copy1` (
  `rl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '备注序号',
  `rl_type` char(8) DEFAULT '' COMMENT '备注类型，如：100采购单、101入库单 102 订单 103-调渡单',
  `rl_subtype` char(16) DEFAULT '' COMMENT '操作类型，如：100001指派、100002备注、100003生成采购单',
  `rl_identifier` int(11) unsigned DEFAULT '0' COMMENT '备注标识，如：采购单序号、入库单序号等',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `username` char(32) DEFAULT '' COMMENT '操作人',
  `rl_status` tinyint(4) unsigned DEFAULT '0' COMMENT '备注状态 0正常，1删除',
  `rl_remark` longtext COMMENT '备注内容',
  `rl_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `rl_server_type` tinyint(2) DEFAULT '1' COMMENT '操作端口 1 电脑操作  2 m3操作 3 服务号  4 操作号',
  `rl_region_id` int(11) DEFAULT '0' COMMENT '操作城市id',
  PRIMARY KEY (`rl_id`),
  KEY `rl_identifier` (`rl_identifier`),
  KEY `rl_server_type` (`rl_server_type`),
  KEY `rl_type` (`rl_type`),
  KEY `rl_subtype` (`rl_subtype`),
  KEY `rl_createtime` (`rl_createtime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='备注记录表';

-- ----------------------------
-- Table structure for replication_error_histories
-- ----------------------------
DROP TABLE IF EXISTS `replication_error_histories`;
CREATE TABLE `replication_error_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `error` text NOT NULL,
  `replication_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `error_type` varchar(255) NOT NULL,
  `error_no` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_replication_error_histories_on_replication_id` (`replication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for replication_states
-- ----------------------------
DROP TABLE IF EXISTS `replication_states`;
CREATE TABLE `replication_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL,
  `replication_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_or_end` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_replication_states_on_created_at` (`created_at`),
  KEY `idx_replication_states_on_replication_id` (`replication_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for replications
-- ----------------------------
DROP TABLE IF EXISTS `replications`;
CREATE TABLE `replications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `master_log_file` varchar(255) NOT NULL,
  `master_log_pos` int(10) unsigned NOT NULL,
  `slave_sql_running` varchar(255) NOT NULL,
  `master_host` varchar(255) NOT NULL,
  `master_user` varchar(255) NOT NULL,
  `master_port` int(10) unsigned NOT NULL,
  `connect_retry` int(10) unsigned NOT NULL,
  `relay_log_file` varchar(255) NOT NULL,
  `relay_log_pos` int(10) unsigned NOT NULL,
  `relay_master_log_file` varchar(255) NOT NULL,
  `replicate_do_db` varchar(255) NOT NULL,
  `replicate_ignore_db` varchar(255) NOT NULL,
  `replicate_do_table` varchar(255) NOT NULL,
  `replicate_ignore_table` varchar(255) NOT NULL,
  `replicate_wild_do_table` varchar(255) NOT NULL,
  `replicate_wild_ignore_table` varchar(255) NOT NULL,
  `last_errno` int(10) unsigned NOT NULL,
  `last_error` varchar(255) NOT NULL,
  `skip_counter` int(10) unsigned NOT NULL,
  `exec_master_log_pos` int(10) unsigned NOT NULL,
  `relay_log_space` int(10) unsigned NOT NULL,
  `until_condition` varchar(255) NOT NULL,
  `until_log_file` varchar(255) NOT NULL,
  `until_log_pos` int(10) unsigned NOT NULL,
  `master_ssl_allowed` varchar(255) NOT NULL,
  `master_ssl_ca_file` varchar(255) NOT NULL,
  `master_ssl_ca_path` varchar(255) NOT NULL,
  `master_ssl_cert` varchar(255) NOT NULL,
  `master_ssl_cipher` varchar(255) NOT NULL,
  `master_ssl_key` varchar(255) NOT NULL,
  `seconds_behind_master` int(10) unsigned NOT NULL,
  `master_ssl_verify_server_cert` varchar(255) NOT NULL,
  `last_io_errno` int(10) unsigned NOT NULL,
  `last_io_error` varchar(255) NOT NULL,
  `last_sql_errno` int(10) unsigned NOT NULL,
  `last_sql_error` varchar(255) NOT NULL,
  `slave_io_state` varchar(255) NOT NULL,
  `slave_io_running` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_replications_on_connection_id_and_created_at` (`connection_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for report_management
-- ----------------------------
DROP TABLE IF EXISTS `report_management`;
CREATE TABLE `report_management` (
  `rm_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `rm_no` varchar(255) DEFAULT NULL COMMENT '报告编号',
  `em_id` int(11) DEFAULT NULL COMMENT '申请人id',
  `em_name` varchar(255) DEFAULT NULL COMMENT '申请人',
  `rm_status` tinyint(1) DEFAULT NULL COMMENT '报告状态 1已完成 2未完成',
  `rm_time` int(10) DEFAULT NULL COMMENT '要求时限',
  `yc_id` int(11) DEFAULT NULL COMMENT '异常id',
  `yc_no` varchar(255) DEFAULT NULL COMMENT '异常编号',
  `rm_uid` int(11) DEFAULT NULL COMMENT '编制人id',
  `rm_username` varchar(255) DEFAULT NULL COMMENT '编制人',
  `rm_completion_time` int(10) DEFAULT NULL COMMENT '实际完成时间',
  `up_id` varchar(255) DEFAULT NULL COMMENT '异常文件id',
  `rm_create_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `rm_create_username` varchar(255) DEFAULT NULL COMMENT '添加人',
  `rm_create_uid` int(11) DEFAULT NULL COMMENT '添加人id',
  `rm_lastupdatime` int(10) DEFAULT NULL COMMENT '最后修改时间',
  `rm_visible` tinyint(1) DEFAULT '1' COMMENT '状态 1正常 0删除',
  `yc_type` int(1) DEFAULT NULL COMMENT '类型1异常 2投诉',
  `rm_remarks` text COMMENT '备注',
  PRIMARY KEY (`rm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='报告管理';

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(100) DEFAULT NULL COMMENT '单号',
  `creat_time` varchar(20) DEFAULT NULL COMMENT '时间',
  `item` varchar(50) DEFAULT NULL COMMENT '事项',
  `price` varchar(30) DEFAULT NULL COMMENT '金额',
  `type` int(5) DEFAULT NULL COMMENT '类型 1:惩罚 2:奖励',
  `c_id` int(11) DEFAULT NULL COMMENT '外协人员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COMMENT='惩罚信息表';

-- ----------------------------
-- Table structure for risk_outsource
-- ----------------------------
DROP TABLE IF EXISTS `risk_outsource`;
CREATE TABLE `risk_outsource` (
  `risk_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `risk_no` varchar(13) NOT NULL COMMENT '异常编号',
  `risk_user_id` int(11) NOT NULL COMMENT '外协id 关联contact表co_id',
  `to_id` int(11) NOT NULL COMMENT '运单id',
  `risk_type` int(11) NOT NULL COMMENT '异常类型',
  `risk_remark` varchar(255) DEFAULT '' COMMENT '异常备注',
  `risk_city_id` int(11) DEFAULT '0' COMMENT '事故城市id',
  `risk_city_name` varchar(20) DEFAULT '' COMMENT '事故城市',
  `risk_create_time` int(11) DEFAULT '0' COMMENT '录入时间',
  `risk_create_uid` int(11) DEFAULT '0' COMMENT '录入人Id',
  `risk_create_uname` varchar(15) DEFAULT '' COMMENT '录入人',
  `risk_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1正常，0作废',
  PRIMARY KEY (`risk_id`),
  KEY `idx_type` (`risk_type`),
  KEY `idx_city_id` (`risk_city_id`),
  KEY `idx_create_time` (`risk_create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COMMENT='外协异常';

-- ----------------------------
-- Table structure for risk_outsource_type
-- ----------------------------
DROP TABLE IF EXISTS `risk_outsource_type`;
CREATE TABLE `risk_outsource_type` (
  `rt_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `rt_name` varchar(35) NOT NULL COMMENT '异常类型名称',
  `rt_create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `rt_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  PRIMARY KEY (`rt_id`),
  KEY `idx_type_name` (`rt_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='外协异常类型';

-- ----------------------------
-- Table structure for role_ip_ranges
-- ----------------------------
DROP TABLE IF EXISTS `role_ip_ranges`;
CREATE TABLE `role_ip_ranges` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `mask_bit` int(11) DEFAULT NULL,
  `ipv` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_ip_ranges_on_role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `access_configurations` tinyint(1) NOT NULL DEFAULT '0',
  `export_chart` tinyint(1) NOT NULL DEFAULT '0',
  `edit_instance_variables` tinyint(1) NOT NULL DEFAULT '0',
  `alert_close_open` tinyint(1) NOT NULL DEFAULT '0',
  `alert_add_remarks` tinyint(1) NOT NULL DEFAULT '0',
  `alert_assign_members` tinyint(1) NOT NULL DEFAULT '0',
  `alert_policy_edit` tinyint(1) NOT NULL DEFAULT '0',
  `alert_event_handler_edit` tinyint(1) NOT NULL DEFAULT '0',
  `end_process` tinyint(1) NOT NULL DEFAULT '0',
  `config_instances` tinyint(1) NOT NULL DEFAULT '0',
  `config_general_setting` tinyint(1) NOT NULL DEFAULT '0',
  `config_privilege` tinyint(1) NOT NULL DEFAULT '0',
  `config_user_profile` tinyint(1) NOT NULL DEFAULT '0',
  `config_self_profile` tinyint(1) NOT NULL DEFAULT '0',
  `all_groups_access` tinyint(1) NOT NULL DEFAULT '0',
  `config_data_purge` tinyint(1) NOT NULL DEFAULT '0',
  `config_data_repository` tinyint(1) NOT NULL DEFAULT '0',
  `retrieve_log` tinyint(1) NOT NULL DEFAULT '0',
  `config_activate_and_license` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route` (
  `ro_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '路由序号',
  `ro_name` char(32) DEFAULT '' COMMENT '路由名称',
  `su_id` int(11) unsigned DEFAULT '0' COMMENT '供应商序号',
  `rt_id` smallint(6) unsigned DEFAULT '0' COMMENT '路由类型序号',
  `ro_status` tinyint(4) unsigned DEFAULT '0' COMMENT '路由状态 0正常 1停运',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '出港地区ID',
  `start_region_name` char(128) DEFAULT NULL COMMENT '出港地区名',
  `start_ts_id` int(11) unsigned DEFAULT '0' COMMENT '出港站点序号',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '到港地区ID',
  `stop_region_name` char(128) DEFAULT NULL COMMENT '到港地区名',
  `stop_ts_id` int(11) unsigned DEFAULT '0' COMMENT '到港站点序号',
  `ro_start_time` char(32) DEFAULT '' COMMENT '出港发货时间',
  `ro_stop_time` char(32) DEFAULT '' COMMENT '到港提货时间',
  `ro_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ro_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ro_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `ro_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `ro_type` tinyint(2) DEFAULT '1' COMMENT '路由审核状态1待审核 2已审核',
  `child_start_region_id` int(11) DEFAULT NULL COMMENT '出发子地区id',
  `child_start_region_name` varchar(255) DEFAULT NULL COMMENT '出发子地区名',
  `child_stop_region_id` int(11) DEFAULT NULL COMMENT '到达子地区id',
  `child_stop_region_name` varchar(255) DEFAULT NULL COMMENT '到达子地区名',
  `use_count` int(11) DEFAULT '0' COMMENT '使用次数',
  `transport_price` float(7,3) DEFAULT '0.000' COMMENT '运输价格',
  `transport_time` int(11) DEFAULT '0' COMMENT '运输耗时',
  `lastupdtime` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '自动更新最后一次修改时间',
  `transport_distance` varchar(50) DEFAULT '0' COMMENT '运输里程，单位公里',
  PRIMARY KEY (`ro_id`),
  KEY `su_id` (`su_id`),
  KEY `ro_name` (`ro_name`),
  KEY `rt_id` (`rt_id`),
  KEY `start_region_id` (`start_region_id`),
  KEY `stop_region_id` (`stop_region_id`),
  KEY `start_ts_id` (`start_ts_id`),
  KEY `stop_ts_id` (`stop_ts_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107762 DEFAULT CHARSET=utf8 COMMENT='路由表';

-- ----------------------------
-- Table structure for route_history_use_count
-- ----------------------------
DROP TABLE IF EXISTS `route_history_use_count`;
CREATE TABLE `route_history_use_count` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ro_id` int(11) DEFAULT '0' COMMENT '路由id',
  `key` varchar(50) NOT NULL COMMENT 'key名称',
  `key_type` int(11) DEFAULT '1' COMMENT 'key类型，1表示（路由id+出发城市+到达城市+运输时限+运输温度+订单标签+运输要求）',
  `use_count` int(11) DEFAULT '0' COMMENT '使用次数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=546 DEFAULT CHARSET=utf8 COMMENT='路由历史使用次数';

-- ----------------------------
-- Table structure for route_select_data
-- ----------------------------
DROP TABLE IF EXISTS `route_select_data`;
CREATE TABLE `route_select_data` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `to_id` int(11) DEFAULT '0' COMMENT '运单id',
  `recommend_ro_id` int(11) DEFAULT '0' COMMENT '推荐路由id',
  `recommend_ro_reason` varchar(100) DEFAULT '' COMMENT '推荐路由原因',
  `recommend_ro_version` varchar(50) DEFAULT '' COMMENT '推荐路由版本',
  `select_ro_id` int(11) DEFAULT '0' COMMENT '选择路由id',
  `select_user_name` varchar(50) DEFAULT '' COMMENT '选择人姓名',
  `select_user_id` int(11) DEFAULT '0' COMMENT '选择人用户id',
  `select_ro_use_time` varchar(50) DEFAULT '' COMMENT '选择路由耗时',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `recommend_ro_record` varchar(1000) DEFAULT '' COMMENT '路由推荐记录',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3425 DEFAULT CHARSET=utf8 COMMENT='路由选择数据表';

-- ----------------------------
-- Table structure for route_type
-- ----------------------------
DROP TABLE IF EXISTS `route_type`;
CREATE TABLE `route_type` (
  `rt_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '路由类型序号',
  `rt_name` char(32) DEFAULT '' COMMENT '路由类型名称',
  `rt_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`rt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='路由类型表';

-- ----------------------------
-- Table structure for sample_offer
-- ----------------------------
DROP TABLE IF EXISTS `sample_offer`;
CREATE TABLE `sample_offer` (
  `so_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '样本报价自增id',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '委托客户id',
  `cu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '委托客户名称',
  `so_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '报价（支）',
  `so_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1删除',
  `so_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `so_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `so_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `so_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `so_lastupdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`so_id`),
  KEY `idx_cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='样本仓储报价';

-- ----------------------------
-- Table structure for sample_settlement
-- ----------------------------
DROP TABLE IF EXISTS `sample_settlement`;
CREATE TABLE `sample_settlement` (
  `ss_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '结算序号',
  `ss_name` varchar(88) DEFAULT NULL COMMENT '结算名称',
  `ss_cmonth` int(6) DEFAULT NULL COMMENT '结算月',
  `io_id` int(11) DEFAULT NULL COMMENT '出入库id',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `create_uid` int(10) unsigned DEFAULT NULL COMMENT '创建人ID',
  `create_username` varchar(128) DEFAULT NULL COMMENT '创建人',
  `cu_id` int(11) unsigned DEFAULT '0' COMMENT '客户序号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `ss_cpid` int(11) DEFAULT '0' COMMENT '项目ID',
  `ms_id` int(11) DEFAULT '0' COMMENT '对账单ID',
  `rb_id` int(11) DEFAULT '0' COMMENT '实开发票ID',
  `ss_quantity` smallint(6) DEFAULT NULL COMMENT '结算数量',
  `ss_type` smallint(1) DEFAULT NULL COMMENT '结算类型 0入库结算1出库结算',
  `ss_cycle` smallint(5) DEFAULT NULL COMMENT '结算周期 按月单位',
  `ss_price` decimal(10,2) DEFAULT '0.00' COMMENT '单价',
  `ss_boxnums` int(5) unsigned DEFAULT '0' COMMENT '盒数',
  `ss_totalfee` decimal(10,2) DEFAULT '0.00' COMMENT '合计费用',
  `ss_remark` varchar(1024) DEFAULT '' COMMENT '备注',
  `ss_paymenttype` int(1) unsigned DEFAULT '1' COMMENT '样本结算支付类型 1-预付费 2-后付费',
  `ss_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ss_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `ss_tax` decimal(10,2) DEFAULT '0.00' COMMENT '税金',
  `ss_taxrate` decimal(10,4) DEFAULT '0.0000' COMMENT '税率',
  `ss_income` decimal(10,2) DEFAULT '0.00' COMMENT '不含税收入',
  `ss_tot` decimal(10,2) DEFAULT '0.00' COMMENT '报价汇总，用于获取未税金额',
  `ss_expiretime` int(10) DEFAULT NULL COMMENT '结算到期时间',
  `ss_pid` int(11) DEFAULT NULL COMMENT '到期结算ID',
  `ss_status` int(1) DEFAULT '1' COMMENT '状态:1未到期2到期已生成新结算单',
  `ss_visible` int(1) DEFAULT '1' COMMENT '状态 1正常，2删除',
  `ss_starttime` int(10) unsigned DEFAULT NULL COMMENT '结算周期开始时间',
  `ss_endtime` int(10) unsigned DEFAULT NULL COMMENT '结算周期结束时间',
  `ss_iotime` int(10) unsigned DEFAULT NULL COMMENT '出入库时间',
  `ss_carry_down_status` tinyint(1) DEFAULT '1' COMMENT '结转状态 1 未结转 2 已结转',
  `bi_id` int(11) DEFAULT NULL COMMENT '开票客户ID',
  `bi_name` varchar(255) DEFAULT NULL COMMENT '开票客户名称',
  `io_no` varchar(32) DEFAULT NULL COMMENT '出入库单号',
  `io_storagetime` int(10) DEFAULT NULL COMMENT '出入库日期-时间戳',
  `sto_no` varchar(32) DEFAULT NULL COMMENT '样本编号',
  `sto_name` varchar(255) DEFAULT NULL COMMENT '样本名称',
  `tr_no` char(32) DEFAULT NULL COMMENT '运输单号',
  PRIMARY KEY (`ss_id`),
  KEY `ms_id` (`ms_id`),
  KEY `ss_cpid` (`ss_cpid`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11279 DEFAULT CHARSET=utf8 COMMENT='仓储样本结算表';

-- ----------------------------
-- Table structure for seat_management
-- ----------------------------
DROP TABLE IF EXISTS `seat_management`;
CREATE TABLE `seat_management` (
  `se_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `se_uid` int(11) NOT NULL COMMENT '用户id',
  `se_username` varchar(50) NOT NULL COMMENT '用户姓名',
  `se_pid` varchar(100) NOT NULL COMMENT '坐席编号',
  `se_visible` int(2) NOT NULL DEFAULT '1' COMMENT '1.正常 2 删除',
  `se_creattime` int(11) NOT NULL COMMENT '创建时间',
  `se_area` varchar(100) NOT NULL COMMENT '坐席分组',
  PRIMARY KEY (`se_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for settlement_rate
-- ----------------------------
DROP TABLE IF EXISTS `settlement_rate`;
CREATE TABLE `settlement_rate` (
  `sr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '结算税率表主键id',
  `ots_feetype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '结算类型，详细见配置',
  `ots_feetype_name` varchar(255) NOT NULL DEFAULT '' COMMENT '结算类型名称',
  `rate` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '税率',
  `com_id` varchar(255) NOT NULL DEFAULT '' COMMENT '开票主体 多个之间逗号拼接',
  `com_name` varchar(500) NOT NULL DEFAULT '' COMMENT '开票主体名称，逗号拼接',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='结算税率管理';

-- ----------------------------
-- Table structure for settlement_receivable_statistics
-- ----------------------------
DROP TABLE IF EXISTS `settlement_receivable_statistics`;
CREATE TABLE `settlement_receivable_statistics` (
  `srs_id` int(11) NOT NULL AUTO_INCREMENT,
  `cu_id` int(20) NOT NULL COMMENT '客户ID',
  `srs_not_invoiced_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已对账未开票金额',
  `srs_invoiced_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已开票未清账金额',
  `srs_not_settle_up_amount` decimal(20,2) DEFAULT '0.00' COMMENT '未清账金额',
  `srs_receivable_amount` decimal(20,2) DEFAULT '0.00' COMMENT '实际应收金额',
  `srs_balbance` decimal(20,2) DEFAULT '0.00' COMMENT '客户余额',
  `srs_visible` int(2) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 删除',
  `srs_createdate` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建及更新时间',
  `srs_not_reconciliation_amount` decimal(20,2) DEFAULT '0.00' COMMENT '已结算未对账金额',
  PRIMARY KEY (`srs_id`),
  KEY `srs_receivable_amount` (`srs_receivable_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=146495 DEFAULT CHARSET=utf8mb4 COMMENT='结算应收统计表';

-- ----------------------------
-- Table structure for settlement_relation
-- ----------------------------
DROP TABLE IF EXISTS `settlement_relation`;
CREATE TABLE `settlement_relation` (
  `sr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '结算关联自增id',
  `sr_join_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '绑定结算id',
  `sr_join_type` int(1) NOT NULL DEFAULT '1' COMMENT '结算费绑定类型1:order',
  `qt_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '报价单qt_id',
  `cf_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '客户报价id',
  `bco_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市分类基础报价id',
  `osd_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '折扣id',
  `sr_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sr_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`sr_id`),
  KEY `idx_sr_join_id` (`sr_join_id`),
  KEY `idx_osd_id` (`osd_id`),
  KEY `idx_qt_id` (`qt_id`),
  KEY `idx_cf_id` (`cf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305755 DEFAULT CHARSET=utf8 COMMENT='订单结算关联表';

-- ----------------------------
-- Table structure for sheet1
-- ----------------------------
DROP TABLE IF EXISTS `sheet1`;
CREATE TABLE `sheet1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(255) DEFAULT NULL COMMENT '工号',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `idnum` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `zzdate` varchar(255) DEFAULT NULL COMMENT '转正日期',
  `workdi` varchar(255) DEFAULT NULL COMMENT '工作地',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=597 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for short_link
-- ----------------------------
DROP TABLE IF EXISTS `short_link`;
CREATE TABLE `short_link` (
  `id` int(32) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `code` varchar(255) NOT NULL COMMENT 'code',
  `long_url` varchar(255) NOT NULL COMMENT '长链接',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0正常 1过期',
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 正常 2 删除',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '过期时间',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='短链接';

-- ----------------------------
-- Table structure for sign_bill
-- ----------------------------
DROP TABLE IF EXISTS `sign_bill`;
CREATE TABLE `sign_bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `to_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `status` tinyint(2) DEFAULT NULL COMMENT '状态 2:已返回 3:已接收 4:已签收 5:已删除 6:已超时',
  PRIMARY KEY (`id`),
  KEY `to_id_index` (`to_id`),
  KEY `status_index` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='签单返回管理表';

-- ----------------------------
-- Table structure for signature_temp
-- ----------------------------
DROP TABLE IF EXISTS `signature_temp`;
CREATE TABLE `signature_temp` (
  `st_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '附件序号',
  `at_id` int(11) DEFAULT NULL COMMENT 'attachment表at_id',
  `st_type` varchar(8) DEFAULT NULL COMMENT '附件类型，如：001客户、002供应商、003订单、004采购单、005出库单 006-项目',
  `st_subtype` varchar(16) DEFAULT NULL COMMENT '附件子类型，如：001001客户证件、001002客户文件、002001供应商证件',
  `st_identifier` varchar(11) DEFAULT NULL COMMENT '附件标识，如：客户序号、订单序号等',
  `st_filename` varchar(255) DEFAULT NULL COMMENT '附件文件名',
  `st_filepath` varchar(1024) DEFAULT NULL COMMENT '附件文件路径',
  `st_filesize` int(11) DEFAULT NULL COMMENT '附件文件大小，单位：KB',
  `st_visible` tinyint(1) DEFAULT NULL COMMENT '附件状态 1正常，0删除',
  `st_signtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '签章日期',
  PRIMARY KEY (`st_id`),
  UNIQUE KEY `at_id` (`at_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76687 DEFAULT CHARSET=utf8 COMMENT='签章附件表';

-- ----------------------------
-- Table structure for signbill_log
-- ----------------------------
DROP TABLE IF EXISTS `signbill_log`;
CREATE TABLE `signbill_log` (
  `sl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `s_id` int(11) DEFAULT NULL COMMENT '签单ID',
  `u_id` int(11) DEFAULT NULL COMMENT '操作人ID',
  `u_name` varchar(30) DEFAULT NULL COMMENT '操作人姓名',
  `type` int(11) DEFAULT NULL COMMENT '操作类型 1:接收 2:已返回状态接收 3:签收 4：删除',
  `create_time` varchar(15) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COMMENT='签单返回日志表';

-- ----------------------------
-- Table structure for sms_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_log`;
CREATE TABLE `sms_log` (
  `sl_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '短信日志序号',
  `sl_phonenum` char(16) DEFAULT '' COMMENT '手机号码',
  `sl_op` char(16) DEFAULT '' COMMENT '操作类型',
  `sl_identifier` int(10) NOT NULL DEFAULT '0' COMMENT '关联ID',
  `sl_content` varchar(512) DEFAULT '' COMMENT '短信内容',
  `sl_ipadr` char(32) DEFAULT '0' COMMENT '客户端IP',
  `sendtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间',
  `senduser` int(10) NOT NULL COMMENT '发送人',
  `sl_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1=发送成功，2=发送失败）',
  `sl_months` varchar(255) DEFAULT NULL COMMENT '催款月份',
  PRIMARY KEY (`sl_id`),
  KEY `sl_phonenum` (`sl_phonenum`),
  KEY `sendtime` (`sendtime`),
  KEY `sl_identifier` (`sl_identifier`),
  KEY `senduser` (`senduser`)
) ENGINE=InnoDB AUTO_INCREMENT=9129 DEFAULT CHARSET=utf8 COMMENT='短信发送日志';

-- ----------------------------
-- Table structure for special_config
-- ----------------------------
DROP TABLE IF EXISTS `special_config`;
CREATE TABLE `special_config` (
  `sc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '特殊费用id',
  `sc_no` int(20) NOT NULL DEFAULT '0' COMMENT '特殊费用编号',
  `sc_name` varchar(50) NOT NULL DEFAULT '' COMMENT '特殊费用名称',
  `sc_fee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '特殊费用单价',
  `sc_units` varchar(20) NOT NULL DEFAULT '' COMMENT '单位',
  `sc_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `sc_create_uid` int(10) NOT NULL DEFAULT '0' COMMENT '创建人',
  `sc_create_username` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '创建用户姓名',
  `sc_lastupd_uid` int(10) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `sc_lastupd_username` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后更新用户姓名',
  `sc_createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `sc_lastupdtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  PRIMARY KEY (`sc_id`),
  UNIQUE KEY `uniq_sc_no` (`sc_no`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COMMENT='特殊费用配置';

-- ----------------------------
-- Table structure for special_fee
-- ----------------------------
DROP TABLE IF EXISTS `special_fee`;
CREATE TABLE `special_fee` (
  `sf_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sf_message` varchar(1024) NOT NULL COMMENT '费用项',
  `sf_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2停用',
  PRIMARY KEY (`sf_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='公共特约费用表';

-- ----------------------------
-- Table structure for sscc_attach
-- ----------------------------
DROP TABLE IF EXISTS `sscc_attach`;
CREATE TABLE `sscc_attach` (
  `att_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `att_tname` varchar(20) DEFAULT NULL COMMENT '附件的表名称',
  `att_orid` int(10) unsigned NOT NULL COMMENT '表ID',
  `att_filetype` varchar(20) NOT NULL COMMENT '文件类型',
  `att_filename` varchar(100) NOT NULL COMMENT '文件名称',
  `att_uploadpath` varchar(100) NOT NULL COMMENT '存储路径',
  `att_user` varchar(20) NOT NULL,
  `att_indate` datetime NOT NULL,
  `att_update` datetime NOT NULL,
  `att_flag` varchar(1) NOT NULL,
  PRIMARY KEY (`att_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105472 DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Table structure for sscc_drug
-- ----------------------------
DROP TABLE IF EXISTS `sscc_drug`;
CREATE TABLE `sscc_drug` (
  `dr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dr_name` varchar(50) DEFAULT NULL COMMENT '药品名称',
  `dr_nickname` varchar(50) DEFAULT NULL COMMENT '药品别名',
  `dr_batchnumber` varchar(50) DEFAULT NULL COMMENT '批号',
  `dr_format` varchar(50) DEFAULT NULL COMMENT '规格',
  `dr_countunit` varchar(20) DEFAULT NULL COMMENT '计量单位',
  `dr_countnote` varchar(128) DEFAULT NULL COMMENT '计量解释',
  `dr_overplus` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '剩余数量',
  `dr_deadline` date DEFAULT NULL COMMENT '有效期',
  `dr_tempneed` varchar(20) DEFAULT NULL COMMENT '保存条件',
  `dr_isnum` tinyint(1) NOT NULL COMMENT '药品编号',
  `dr_crid` int(10) unsigned DEFAULT NULL COMMENT '委托方',
  `dr_user` varchar(20) NOT NULL DEFAULT 'admin',
  `dr_note` varchar(1024) DEFAULT NULL,
  `dr_indate` datetime NOT NULL,
  `dr_update` datetime NOT NULL,
  `dr_flag` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`dr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=646 DEFAULT CHARSET=utf8 COMMENT='药品表';

-- ----------------------------
-- Table structure for sscc_employee
-- ----------------------------
DROP TABLE IF EXISTS `sscc_employee`;
CREATE TABLE `sscc_employee` (
  `em_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `em_name` varchar(20) DEFAULT NULL,
  `em_email` varchar(30) DEFAULT NULL,
  `em_mobile` varchar(30) DEFAULT NULL COMMENT '手机',
  `em_tel` varchar(30) DEFAULT NULL COMMENT '办公电话',
  `em_dob` date DEFAULT NULL COMMENT '出生日期',
  `em_entrydate` date DEFAULT NULL COMMENT '入职日期',
  `em_gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `em_nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `em_degree` varchar(10) DEFAULT NULL COMMENT '学历',
  `em_certnum` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `em_certadd` varchar(50) DEFAULT NULL COMMENT '户籍地址',
  `em_status` varchar(10) NOT NULL DEFAULT '正常',
  `em_note` varchar(1024) DEFAULT NULL COMMENT '备注',
  `em_user` varchar(20) NOT NULL DEFAULT 'admin',
  `em_indate` datetime DEFAULT NULL,
  `em_update` datetime DEFAULT NULL,
  `em_flag` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`em_id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Table structure for sscc_operation
-- ----------------------------
DROP TABLE IF EXISTS `sscc_operation`;
CREATE TABLE `sscc_operation` (
  `opn_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `opn_orid` int(10) unsigned NOT NULL COMMENT '订单ID',
  `opn_type` varchar(10) DEFAULT NULL COMMENT '操作类型',
  `opn_routetype` varchar(20) DEFAULT NULL COMMENT '路由类型',
  `opn_routeinfo` varchar(100) DEFAULT NULL COMMENT '路由信息',
  `opn_routefee` double DEFAULT '0' COMMENT '路由费用',
  `opn_fromcity` varchar(20) DEFAULT NULL COMMENT '出发港',
  `opn_fromdate` date DEFAULT NULL COMMENT '出港日期',
  `opn_fromwho2` varchar(20) DEFAULT NULL COMMENT '出发操作类型',
  `opn_fromwho` varchar(20) DEFAULT NULL COMMENT '出发操作人',
  `opn_operatefee` double DEFAULT '0' COMMENT '操作费用',
  `opn_supplyfee` double DEFAULT '0' COMMENT '耗材费',
  `opn_tocity` varchar(20) DEFAULT NULL COMMENT '到达港',
  `opn_todate` date DEFAULT NULL COMMENT '到港日期',
  `opn_note` varchar(1024) DEFAULT NULL COMMENT '备注',
  `opn_user` varchar(20) NOT NULL DEFAULT 'admin',
  `opn_indate` datetime NOT NULL,
  `opn_update` datetime NOT NULL,
  `opn_flag` varchar(1) NOT NULL DEFAULT '1',
  `who11` varchar(64) DEFAULT NULL COMMENT 'who员工外协',
  `who12` varchar(64) DEFAULT NULL COMMENT 'who名字',
  `who21` varchar(64) DEFAULT NULL COMMENT 'who2员工外协',
  `who22` varchar(64) DEFAULT NULL COMMENT 'who2名字',
  `remark` varchar(1024) DEFAULT NULL COMMENT '取转派拼接的备注',
  `who13` varchar(32) DEFAULT NULL COMMENT 'who的ID',
  `who23` varchar(32) DEFAULT NULL COMMENT 'who2的',
  `whoid` varchar(32) DEFAULT NULL COMMENT '两个ID拼接',
  `whoname` varchar(1024) DEFAULT NULL COMMENT '链接名字',
  PRIMARY KEY (`opn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=175422 DEFAULT CHARSET=utf8 COMMENT='路由中转表';

-- ----------------------------
-- Table structure for sscc_order
-- ----------------------------
DROP TABLE IF EXISTS `sscc_order`;
CREATE TABLE `sscc_order` (
  `or_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `or_num` varchar(10) DEFAULT NULL COMMENT '生生单号',
  `or_pname` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `or_count` int(10) DEFAULT NULL COMMENT '件数',
  `or_weight` int(10) DEFAULT NULL COMMENT '重量',
  `or_boxnote` varchar(50) DEFAULT NULL COMMENT '包装耗材记录',
  `or_fromdate` date DEFAULT NULL COMMENT '取件日期',
  `or_fromtime` varchar(5) DEFAULT NULL COMMENT '取件时间',
  `or_fneedtime` varchar(5) DEFAULT NULL COMMENT '要求取件时间',
  `or_fromcity` varchar(10) DEFAULT NULL COMMENT '发运城市',
  `or_fromfirm` varchar(50) DEFAULT NULL COMMENT '发运单位',
  `or_fromadd` varchar(50) DEFAULT NULL COMMENT '发运地址',
  `or_fromwho` varchar(20) DEFAULT NULL COMMENT '发货人',
  `or_frominfo` varchar(50) DEFAULT NULL COMMENT '发货联系信息',
  `or_tocity` varchar(10) DEFAULT NULL COMMENT '收件城市',
  `or_tofirm` varchar(50) DEFAULT NULL COMMENT '收件单位',
  `or_toadd` varchar(50) DEFAULT NULL COMMENT '收件地址',
  `or_towho` varchar(20) DEFAULT NULL COMMENT '收件人',
  `or_toinfo` varchar(50) DEFAULT NULL COMMENT '收件联系信息',
  `or_tneeddate` date DEFAULT NULL COMMENT '要求派送日期',
  `or_tneedtime` varchar(20) DEFAULT NULL COMMENT '要求派送时间',
  `or_signdate` date DEFAULT NULL COMMENT '签收日期',
  `or_signname` varchar(20) DEFAULT NULL COMMENT '签收人',
  `or_signtime` varchar(5) DEFAULT NULL COMMENT '签收时间',
  `or_goodstatus` varchar(10) DEFAULT NULL COMMENT '运输状态',
  `or_orderstatus` varchar(10) DEFAULT NULL COMMENT '货物状态',
  `or_tempneed` varchar(10) DEFAULT NULL COMMENT '温度要求',
  `or_temprecord` varchar(10) NOT NULL COMMENT '温度记录',
  `or_insuneed` varchar(5) DEFAULT NULL COMMENT '是否投保',
  `or_getcash` varchar(1) NOT NULL DEFAULT '0' COMMENT '收现金0不收S发件方收R收件方收',
  `or_usercity` varchar(50) DEFAULT NULL COMMENT '操作城市',
  `or_crid` int(10) unsigned DEFAULT NULL COMMENT '客户ID',
  `or_note` varchar(1024) DEFAULT NULL COMMENT '备注',
  `or_user` varchar(20) NOT NULL DEFAULT 'admin',
  `or_indate` datetime NOT NULL,
  `or_update` datetime NOT NULL,
  `or_flag` varchar(1) NOT NULL DEFAULT '1',
  `tempneed` varchar(10) DEFAULT NULL COMMENT '临时温度',
  `temprecord` varchar(10) DEFAULT NULL COMMENT '临时温度计',
  PRIMARY KEY (`or_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89349 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sscc_ordercount
-- ----------------------------
DROP TABLE IF EXISTS `sscc_ordercount`;
CREATE TABLE `sscc_ordercount` (
  `oc_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `oc_orid` int(10) unsigned NOT NULL COMMENT '订单ID',
  `oc_crid` int(10) unsigned NOT NULL COMMENT '客户ID',
  `oc_pname` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `oc_cmonth` varchar(6) DEFAULT '190001' COMMENT '结算月份',
  `oc_count` int(10) DEFAULT '0' COMMENT '件数',
  `oc_weight` int(10) DEFAULT '0' COMMENT '重量',
  `oc_firstfee` double DEFAULT '0' COMMENT '首重费用',
  `oc_plusfee` double DEFAULT '0' COMMENT '续重费用',
  `oc_tranfee` double DEFAULT '0' COMMENT '运输费用',
  `oc_packfee` double DEFAULT '0' COMMENT '包装费用',
  `oc_icefee` double DEFAULT '0' COMMENT '制冷剂费用',
  `oc_changefee` double DEFAULT '0',
  `oc_goodvalue` double DEFAULT '0',
  `oc_insurate` double DEFAULT '0',
  `oc_insufee` double DEFAULT '0',
  `oc_otherfee` double DEFAULT '0',
  `oc_totalfee` double DEFAULT '0',
  `oc_note` varchar(200) DEFAULT NULL,
  `oc_user` varchar(20) NOT NULL DEFAULT 'admin',
  `oc_billstatus` varchar(10) DEFAULT NULL,
  `oc_indate` datetime NOT NULL,
  `oc_update` datetime NOT NULL,
  `oc_flag` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`oc_id`),
  UNIQUE KEY `oc_orid` (`oc_orid`)
) ENGINE=InnoDB AUTO_INCREMENT=83455 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sscc_sample
-- ----------------------------
DROP TABLE IF EXISTS `sscc_sample`;
CREATE TABLE `sscc_sample` (
  `sa_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sa_name` varchar(50) DEFAULT NULL COMMENT '样本名称',
  `sa_nickname` varchar(50) DEFAULT NULL COMMENT '样本别名',
  `sa_format` varchar(50) DEFAULT NULL COMMENT '规格尺寸',
  `sa_countunit` varchar(20) DEFAULT NULL COMMENT '计量单位',
  `sa_countnote` varchar(128) DEFAULT NULL COMMENT '计量解释',
  `sa_overplus` int(10) unsigned DEFAULT '0' COMMENT '剩余数量',
  `sa_tempneed` varchar(20) DEFAULT NULL COMMENT '保存条件',
  `sa_crid` int(10) unsigned DEFAULT NULL COMMENT '委托方',
  `sa_user` varchar(20) NOT NULL DEFAULT 'admin',
  `sa_note` varchar(1024) DEFAULT NULL,
  `sa_indate` datetime NOT NULL,
  `sa_update` datetime NOT NULL,
  `sa_flag` varchar(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='样本表';

-- ----------------------------
-- Table structure for station_city
-- ----------------------------
DROP TABLE IF EXISTS `station_city`;
CREATE TABLE `station_city` (
  `stc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '站点城市匹配主键id',
  `station` varchar(255) NOT NULL DEFAULT '' COMMENT '站点',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '地区id',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1删除',
  `created_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建者id',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`stc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2267 DEFAULT CHARSET=utf8mb4 COMMENT='站点城市关系表';

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock` (
  `sto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '存货序号',
  `stt_id` smallint(6) unsigned DEFAULT '0' COMMENT '存货类型序号',
  `sto_brandid` int(1) unsigned DEFAULT '1' COMMENT '1没选品牌2鼎为',
  `sto_no` char(255) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(255) DEFAULT '' COMMENT '存货名称',
  `sto_scientificname` char(32) DEFAULT '' COMMENT '存货学名',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户序号',
  `cu_no` char(32) DEFAULT '' COMMENT '客户编号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `sto_volume` char(128) DEFAULT '' COMMENT '规格/容量',
  `sto_counting` char(32) DEFAULT '' COMMENT '计数说明',
  `sto_weight` decimal(10,2) DEFAULT NULL COMMENT '计费重量',
  `sto_size` char(16) DEFAULT '' COMMENT '外观尺寸',
  `sto_temperature` char(16) DEFAULT '' COMMENT '温度要求',
  `sto_conditions` varchar(255) DEFAULT NULL COMMENT '保存条件',
  `sto_batch` varchar(500) NOT NULL DEFAULT '' COMMENT '批号',
  `sto_expiretime` varchar(255) DEFAULT NULL COMMENT '有效期',
  `sto_security` int(10) DEFAULT NULL COMMENT '安全有效期',
  `sto_has_identifier` tinyint(4) unsigned DEFAULT '0' COMMENT '有无编号 0否，1有',
  `sto_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `sto_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sto_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `sto_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `cp_id` longtext COMMENT '项目id',
  `sto_number` int(10) DEFAULT NULL COMMENT '安全库存',
  `sto_maxpush` int(1) DEFAULT NULL COMMENT '库存报警最大推送次数',
  `to_temperature` int(4) DEFAULT '0' COMMENT '运输温度',
  `preservation_condition` varchar(255) DEFAULT NULL COMMENT '保存条件',
  `sto_cwvisible` int(4) DEFAULT '2' COMMENT '1.需要确认 2.不需要确认',
  `sto_binding` int(4) DEFAULT '1' COMMENT '能否绑定 1否  2能',
  `sto_department_id` char(20) NOT NULL DEFAULT '' COMMENT '部门id',
  `stt_category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '冗余stock_type表中的stt_category,便于查询',
  `is_use_out_inventory` tinyint(4) NOT NULL DEFAULT '1' COMMENT '领用是否入库',
  `is_arrival_in_inventory` tinyint(4) NOT NULL DEFAULT '1' COMMENT '领用是否入库',
  PRIMARY KEY (`sto_id`),
  UNIQUE KEY `sto_no` (`sto_no`),
  KEY `stt_id` (`stt_id`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=212679 DEFAULT CHARSET=utf8 COMMENT='存货表';

-- ----------------------------
-- Table structure for stock_copy
-- ----------------------------
DROP TABLE IF EXISTS `stock_copy`;
CREATE TABLE `stock_copy` (
  `sto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '存货序号',
  `stt_id` smallint(6) unsigned DEFAULT '0' COMMENT '存货类型序号',
  `sto_no` char(255) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(255) DEFAULT '' COMMENT '存货名称',
  `sto_scientificname` char(32) DEFAULT '' COMMENT '存货学名',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户序号',
  `cu_no` char(32) DEFAULT '' COMMENT '客户编号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `sto_volume` char(128) DEFAULT '' COMMENT '规格/容量',
  `sto_counting` char(32) DEFAULT '' COMMENT '计数说明',
  `sto_weight` char(16) DEFAULT '' COMMENT '计费重量',
  `sto_size` char(16) DEFAULT '' COMMENT '外观尺寸',
  `sto_temperature` char(16) DEFAULT '' COMMENT '温度要求',
  `sto_batch` char(128) DEFAULT '' COMMENT '批号',
  `sto_expiretime` date DEFAULT '0000-00-00' COMMENT '有效期',
  `sto_has_identifier` tinyint(4) unsigned DEFAULT '0' COMMENT '有无编号 0否，1有',
  `sto_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `sto_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sto_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `sto_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `cp_id` int(10) unsigned DEFAULT NULL COMMENT '客户项目ID',
  PRIMARY KEY (`sto_id`),
  UNIQUE KEY `sto_no` (`sto_no`),
  KEY `stt_id` (`stt_id`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202408 DEFAULT CHARSET=utf8 COMMENT='存货表';

-- ----------------------------
-- Table structure for stock_copy1
-- ----------------------------
DROP TABLE IF EXISTS `stock_copy1`;
CREATE TABLE `stock_copy1` (
  `sto_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '存货序号',
  `stt_id` smallint(6) unsigned DEFAULT '0' COMMENT '存货类型序号',
  `sto_brandid` int(1) unsigned DEFAULT '1' COMMENT '1没选品牌2鼎为',
  `sto_no` char(255) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(255) DEFAULT '' COMMENT '存货名称',
  `sto_scientificname` char(32) DEFAULT '' COMMENT '存货学名',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户序号',
  `cu_no` char(32) DEFAULT '' COMMENT '客户编号',
  `cu_name` char(32) DEFAULT '' COMMENT '客户名称',
  `sto_volume` char(128) DEFAULT '' COMMENT '规格/容量',
  `sto_counting` char(32) DEFAULT '' COMMENT '计数说明',
  `sto_weight` decimal(10,2) DEFAULT NULL COMMENT '计费重量',
  `sto_size` char(16) DEFAULT '' COMMENT '外观尺寸',
  `sto_temperature` char(16) DEFAULT '' COMMENT '温度要求',
  `sto_conditions` varchar(255) DEFAULT NULL COMMENT '保存条件',
  `sto_batch` char(128) DEFAULT '' COMMENT '批号',
  `sto_expiretime` varchar(255) DEFAULT NULL COMMENT '有效期',
  `sto_security` int(10) DEFAULT NULL COMMENT '安全有效期',
  `sto_has_identifier` tinyint(4) unsigned DEFAULT '0' COMMENT '有无编号 0否，1有',
  `sto_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `sto_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sto_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `sto_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `cp_id` longtext COMMENT '项目id',
  `sto_number` int(10) DEFAULT NULL COMMENT '安全库存',
  `sto_maxpush` int(1) DEFAULT NULL COMMENT '库存报警最大推送次数',
  `to_temperature` int(4) DEFAULT '0' COMMENT '运输温度',
  `preservation_condition` varchar(255) DEFAULT NULL COMMENT '保存条件',
  PRIMARY KEY (`sto_id`),
  UNIQUE KEY `sto_no` (`sto_no`),
  KEY `stt_id` (`stt_id`),
  KEY `cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=211268 DEFAULT CHARSET=utf8 COMMENT='存货表';

-- ----------------------------
-- Table structure for stock_extend
-- ----------------------------
DROP TABLE IF EXISTS `stock_extend`;
CREATE TABLE `stock_extend` (
  `sext_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '存货扩展ID',
  `sto_id` int(10) NOT NULL COMMENT '关联存货ID',
  `sext_status` char(32) DEFAULT NULL COMMENT '存货状态 1 =>''Closed'',2 =>''Cancel'',''3''=>''Pending''',
  `sext_category` char(32) DEFAULT NULL COMMENT '存货分类  1=>''In-house'',2=>''Commercial'',3=>''Test artical'' ,4=>''others''',
  `sext_check` char(255) DEFAULT NULL COMMENT '存货检项',
  `sext_manufacturer` char(64) DEFAULT NULL COMMENT '货物生成商',
  `sext_maxnumber` int(10) DEFAULT NULL,
  `sext_minnumber` int(10) DEFAULT NULL COMMENT '安全库存',
  `sext_specification` varchar(1024) DEFAULT NULL COMMENT '相关质量标准',
  `sext_testmethods` varchar(1024) DEFAULT NULL COMMENT '相关分析方法',
  `sext_owner` varchar(64) DEFAULT NULL COMMENT '技术负责人',
  `sext_catalog_no` char(32) DEFAULT NULL COMMENT '客户货号',
  PRIMARY KEY (`sext_id`),
  UNIQUE KEY `存货ID` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5300 DEFAULT CHARSET=utf8 COMMENT='存货扩展表';

-- ----------------------------
-- Table structure for stock_type
-- ----------------------------
DROP TABLE IF EXISTS `stock_type`;
CREATE TABLE `stock_type` (
  `stt_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '存货类型序号',
  `stt_no` char(32) DEFAULT '' COMMENT '存货类型编号',
  `stt_name` char(32) DEFAULT '' COMMENT '存货类型名称',
  `stt_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `stt_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `stt_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `stt_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `stt_type` int(4) NOT NULL DEFAULT '1' COMMENT '存货分类 1.药品 2.耗材 3.设备',
  `stt_category` tinyint(4) NOT NULL DEFAULT '0' COMMENT '货存类目（一级分类）：1，电子设备；2，库存商品；3，运输工具；4，低值易耗品',
  `stt_service_life` float(10,1) DEFAULT NULL COMMENT '使用年限',
  PRIMARY KEY (`stt_id`),
  UNIQUE KEY `stt_no` (`stt_no`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COMMENT='存货类型表';

-- ----------------------------
-- Table structure for stock_type_copy
-- ----------------------------
DROP TABLE IF EXISTS `stock_type_copy`;
CREATE TABLE `stock_type_copy` (
  `stt_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '存货类型序号',
  `stt_no` char(32) DEFAULT '' COMMENT '存货类型编号',
  `stt_name` char(32) DEFAULT '' COMMENT '存货类型名称',
  `stt_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `stt_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `stt_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `stt_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `stt_type` int(4) NOT NULL DEFAULT '1' COMMENT '存货分类 1.药品 2.耗材 3.设备',
  PRIMARY KEY (`stt_id`),
  UNIQUE KEY `stt_no` (`stt_no`),
  KEY `idx_stt_type` (`stt_type`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='存货类型表';

-- ----------------------------
-- Table structure for sub_office
-- ----------------------------
DROP TABLE IF EXISTS `sub_office`;
CREATE TABLE `sub_office` (
  `so_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '办事处id',
  `so_no` varchar(32) DEFAULT NULL COMMENT '办事处编号',
  `so_name` char(32) DEFAULT '' COMMENT '办事处名称',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '城市ID',
  `region_name` char(128) DEFAULT NULL COMMENT '城市',
  `so_address` varchar(128) DEFAULT '' COMMENT '详细地址',
  `so_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 ，0--停用,1--正常',
  `so_uid` int(11) DEFAULT NULL COMMENT '用户id（办事处财务人员）',
  `so_username` char(32) DEFAULT NULL COMMENT '办事处负责人',
  `so_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `so_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`so_id`),
  KEY `uid` (`so_uid`),
  KEY `so_name` (`so_name`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 COMMENT='办事处表';

-- ----------------------------
-- Table structure for subwarehouse
-- ----------------------------
DROP TABLE IF EXISTS `subwarehouse`;
CREATE TABLE `subwarehouse` (
  `sw_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '子仓库序号',
  `wa_id` char(255) NOT NULL DEFAULT '' COMMENT '主仓仓库序号',
  `sw_no` char(255) NOT NULL DEFAULT '' COMMENT '子仓库编号',
  `sw_name` varchar(1024) DEFAULT NULL COMMENT '子仓库名',
  `sw_temperature` char(5) DEFAULT '' COMMENT '仓储温度： 看配置文件 ',
  `sw_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `sw_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `sw_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `sw_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `sw_pid` int(10) NOT NULL COMMENT '父级ID',
  `sw_size` varchar(64) DEFAULT NULL COMMENT '仓库尺寸',
  `sw_tier` int(2) NOT NULL DEFAULT '1' COMMENT '1 子仓库 2  货架  3  货位',
  `sw_capacity` float(6,4) DEFAULT NULL COMMENT '库位容量 单位立方米',
  `sw_type` int(1) NOT NULL COMMENT '子仓类型 1 耗材仓  2药品仓 5样本仓',
  `tp_type` int(2) NOT NULL DEFAULT '0' COMMENT '是否上传温度数据 0不开启 1开启',
  `sw_address` varchar(255) DEFAULT NULL COMMENT '仓库详细地址',
  `sw_lat` varchar(15) DEFAULT NULL COMMENT '百度坐标',
  `sw_lng` varchar(15) DEFAULT NULL COMMENT '百度坐标',
  `em_id` int(11) DEFAULT NULL COMMENT '仓管员ID',
  `sw_telephone` varchar(30) DEFAULT NULL COMMENT '仓管员电话',
  `em_name` varchar(30) DEFAULT NULL COMMENT '仓管员',
  `sw_spec` varchar(50) DEFAULT NULL COMMENT '子仓规格',
  `sw_cubage` varchar(50) DEFAULT NULL COMMENT '子仓容积',
  `sw_drug_type` int(11) DEFAULT NULL COMMENT '子仓类型(药品仓) 1:库位盒 2:托盘 3:客户包装',
  `temperature_change_log_id` int(10) NOT NULL COMMENT '温度修改记录id',
  `temperature_change_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '温度修改状态:-1=质量确认不通过,0=待质量确认,1=已确认',
  PRIMARY KEY (`sw_id`),
  UNIQUE KEY `sw_no` (`sw_no`),
  KEY `wa_id` (`wa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25839 DEFAULT CHARSET=utf8 COMMENT='子仓库表';

-- ----------------------------
-- Table structure for subwarehouse_attachment
-- ----------------------------
DROP TABLE IF EXISTS `subwarehouse_attachment`;
CREATE TABLE `subwarehouse_attachment` (
  `sa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sa_time` varchar(25) NOT NULL COMMENT '温度时间',
  `sw_id` int(11) NOT NULL COMMENT '仓库id',
  `sa_visible` int(2) NOT NULL DEFAULT '1' COMMENT '状态 1.正常0.删除',
  `sa_create` int(11) NOT NULL COMMENT '上传时间',
  `sa_end_time` varchar(25) NOT NULL COMMENT '结束日期',
  `sa_note` varchar(255) NOT NULL COMMENT '文件备注',
  PRIMARY KEY (`sa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=310 DEFAULT CHARSET=utf8 COMMENT='仓库温度数据表';

-- ----------------------------
-- Table structure for subwarehouse_yiliu_rubik
-- ----------------------------
DROP TABLE IF EXISTS `subwarehouse_yiliu_rubik`;
CREATE TABLE `subwarehouse_yiliu_rubik` (
  `sw_id` int(11) NOT NULL COMMENT '子仓序号',
  `rub_id` int(11) NOT NULL COMMENT '魔方序号',
  UNIQUE KEY `idx_unique_key` (`sw_id`,`rub_id`),
  KEY `sw_id` (`sw_id`),
  KEY `rub_id` (`rub_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='子仓易流魔方关联表';

-- ----------------------------
-- Table structure for success_pdf
-- ----------------------------
DROP TABLE IF EXISTS `success_pdf`;
CREATE TABLE `success_pdf` (
  `succ_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `at_id` int(11) DEFAULT NULL COMMENT '附件id',
  `to_id` int(11) DEFAULT NULL COMMENT '订单id',
  `success_time` int(10) DEFAULT NULL COMMENT '上传时间',
  PRIMARY KEY (`succ_id`),
  KEY `count` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=771654 DEFAULT CHARSET=utf8 COMMENT='上传成功pdf表';

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `su_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '供应商序号',
  `su_type` tinyint(4) unsigned DEFAULT '0' COMMENT '供应商类型 1外协 2一般供应商 3承运商',
  `su_name` char(32) DEFAULT '' COMMENT '供应商名称',
  `su_tel` char(32) DEFAULT '' COMMENT '公司电话',
  `su_fax` char(32) DEFAULT '' COMMENT '公司传真',
  `su_bank_deposit` varchar(128) DEFAULT NULL COMMENT '开户银行',
  `su_bank_account` varchar(255) DEFAULT NULL COMMENT '账户名称',
  `su_bank_number` varchar(128) DEFAULT NULL COMMENT '银行账号',
  `com_compnay_id` int(11) DEFAULT NULL COMMENT '开票公司',
  `su_invoice_type` tinyint(4) DEFAULT NULL COMMENT '发票类型',
  `su_tax_rate` int(11) DEFAULT NULL COMMENT '税率',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '所在地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `su_add` char(128) DEFAULT '' COMMENT '供应商地址',
  `st_id` smallint(6) unsigned DEFAULT '0' COMMENT '供货类型',
  `su_status` tinyint(4) unsigned DEFAULT '0' COMMENT '供应商状态 0启用，1禁用',
  `su_settlement_type` tinyint(4) DEFAULT NULL COMMENT '供应商结算方式 1 现结  2月结',
  `su_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `su_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `su_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `su_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `su_subsidiary_company` varchar(100) DEFAULT NULL COMMENT '分子公司',
  `su_uptax` float(11,2) DEFAULT NULL COMMENT '含税单价',
  `su_person` varchar(30) DEFAULT NULL COMMENT '联系人',
  `su_telephone` varchar(30) DEFAULT NULL COMMENT '联系方式',
  `su_grade` varchar(50) DEFAULT NULL COMMENT '等级',
  PRIMARY KEY (`su_id`)
) ENGINE=InnoDB AUTO_INCREMENT=300304 DEFAULT CHARSET=utf8 COMMENT='供应商表';

-- ----------------------------
-- Table structure for supplier_detail
-- ----------------------------
DROP TABLE IF EXISTS `supplier_detail`;
CREATE TABLE `supplier_detail` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `s_id` int(11) DEFAULT NULL COMMENT '供货商id',
  `sp_name` varchar(50) DEFAULT NULL COMMENT '物资名称',
  `sp_volume` varchar(50) DEFAULT NULL COMMENT '规格/型号',
  `sp_unit` varchar(50) DEFAULT NULL COMMENT '单位',
  `sp_uptax` float(11,2) DEFAULT NULL COMMENT '含税单价',
  `sp_visible` tinyint(2) DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `sp_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `sp_lastupdtime` int(11) DEFAULT NULL COMMENT '最后一次修改时间',
  PRIMARY KEY (`sp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COMMENT='供应商物料明细表';

-- ----------------------------
-- Table structure for supplier_month_settlement_detail
-- ----------------------------
DROP TABLE IF EXISTS `supplier_month_settlement_detail`;
CREATE TABLE `supplier_month_settlement_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `bill_id` int(11) NOT NULL DEFAULT '0' COMMENT '账单id',
  `carrier_id` int(11) NOT NULL DEFAULT '0' COMMENT '承运商id',
  `carrier_name` varchar(100) NOT NULL DEFAULT '' COMMENT '承运商名称',
  `cost_month` varchar(20) NOT NULL DEFAULT '0' COMMENT '成本发生月份',
  `detail_date` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `deliver_goods` varchar(60) NOT NULL DEFAULT '' COMMENT '发货信息',
  `arrival` varchar(60) NOT NULL DEFAULT '' COMMENT '到货信息',
  `deliver_city` varchar(60) DEFAULT '' COMMENT '发货城市',
  `arrival_city` varchar(60) DEFAULT '' COMMENT '到货城市',
  `deliver_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '发货地区id',
  `arrival_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '提货地区id',
  `shipment_no` varchar(30) NOT NULL DEFAULT '' COMMENT '发货单号',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `piece_no` int(11) NOT NULL DEFAULT '0' COMMENT '件数',
  `routing_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '路由类型',
  `oper_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '操作类型（已废弃）',
  `cost_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '成本类型',
  `cic_id` int(11) NOT NULL DEFAULT '0' COMMENT '费用项配置id',
  `cost_item` varchar(60) DEFAULT '' COMMENT '费用项目',
  `sh_transport_no` varchar(255) NOT NULL DEFAULT '' COMMENT '生生运单号',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `rate` decimal(18,2) NOT NULL DEFAULT '0.00' COMMENT '税率',
  `is_delete` tinyint(2) NOT NULL DEFAULT '0' COMMENT '删除状态 0正常 1已删除',
  `create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_cn` (`carrier_name`),
  KEY `idx_cost_month` (`cost_month`),
  KEY `idx_bill_id` (`bill_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38917 DEFAULT CHARSET=utf8mb4 COMMENT='供应商月结明细表';

-- ----------------------------
-- Table structure for supplier_monthly_settlement
-- ----------------------------
DROP TABLE IF EXISTS `supplier_monthly_settlement`;
CREATE TABLE `supplier_monthly_settlement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `supplier_name` varchar(50) DEFAULT NULL COMMENT '供应商名称',
  `supplier_createtime` int(30) DEFAULT NULL COMMENT '供应商创建时间',
  `bill_collection_username` varchar(50) DEFAULT NULL COMMENT '账单收集操作人',
  `bill_collection_status` int(11) DEFAULT '0' COMMENT '账单收集状态  0:未确认  1:已确认',
  `bill_collection_createtime` int(30) DEFAULT NULL COMMENT '账单收集创建时间',
  `bill_check_username` varchar(50) DEFAULT NULL COMMENT '账单核对操作人',
  `bill_check_status` int(11) DEFAULT '0' COMMENT '账单核对状态  0:未确认  1:已确认',
  `bill_check_creatime` int(30) DEFAULT NULL COMMENT '账单核对创建时间',
  `notification_invoice_username` varchar(50) DEFAULT NULL COMMENT '通知开票操作人',
  `notification_invoice_status` int(11) DEFAULT '0' COMMENT '通知开票状态  0:未确认 1:已确认',
  `notification_invoice_createtime` int(30) DEFAULT NULL COMMENT '通知开票创建时间',
  `application_money_username` varchar(50) DEFAULT NULL COMMENT '申请款项操作人',
  `application_money_status` int(11) DEFAULT '0' COMMENT '申请款项状态 0:未确认  1:已确认',
  `application_money_createtime` int(30) DEFAULT NULL COMMENT '申请款项创建时间',
  `receipt_invoice_username` varchar(50) DEFAULT NULL COMMENT '收到发票操作人',
  `receipt_invoice_status` int(11) DEFAULT '0' COMMENT '收到发票状态  0:未确认 1:已确认',
  `receipt_invoice_createtime` int(30) DEFAULT NULL COMMENT '收到发票创建时间',
  `amount` varchar(50) DEFAULT NULL COMMENT '报销单据交予出纳/金额',
  `amount_money_status` int(11) DEFAULT '0' COMMENT '是否填写报销金额  0:未确认 1:已确认',
  `amount_username` varchar(30) DEFAULT NULL COMMENT '报销单据交予出纳/金额 操作人',
  `amount_status` int(11) DEFAULT '0' COMMENT '报销单据交予出纳/金额状态  0:未确认 1:已确认',
  `amount_createtime` int(30) DEFAULT NULL COMMENT '报销单据交予出纳/金额创建时间',
  `payment_atid` varchar(50) DEFAULT NULL COMMENT '付款图片',
  `payment_username` varchar(100) DEFAULT NULL COMMENT '付款完成操作人',
  `payment_status` int(11) DEFAULT '0' COMMENT '付款完成状态  0:未确认 1:已确认',
  `payment_createtime` int(30) DEFAULT NULL COMMENT '付款完成创建时间',
  `visible` int(30) DEFAULT '0' COMMENT '是否删除 0:未删除  1:已删除',
  `depreciation_amount` varchar(50) DEFAULT '' COMMENT '当月金额',
  `number_cases` int(11) DEFAULT '0' COMMENT '当月发货件数',
  `poll` int(11) DEFAULT '0' COMMENT '当月发货票数',
  `weight` int(11) DEFAULT '0' COMMENT '当月发货重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3424 DEFAULT CHARSET=utf8mb4 COMMENT='月结供应商';

-- ----------------------------
-- Table structure for supplier_type
-- ----------------------------
DROP TABLE IF EXISTS `supplier_type`;
CREATE TABLE `supplier_type` (
  `st_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '供货类型序号',
  `st_name` char(32) DEFAULT '' COMMENT '供货类型名称',
  `st_createtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='供货类型表';

-- ----------------------------
-- Table structure for suppliers_contract
-- ----------------------------
DROP TABLE IF EXISTS `suppliers_contract`;
CREATE TABLE `suppliers_contract` (
  `sc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '合同序号',
  `scqt_id` int(11) NOT NULL COMMENT '合同类型',
  `sc_name` varchar(64) NOT NULL COMMENT '合同名称',
  `sc_no` varchar(32) NOT NULL COMMENT '合同编号',
  `sc_a_corporate_name` varchar(128) NOT NULL COMMENT '甲方公司名称',
  `sc_b_corporate_name` varchar(128) NOT NULL COMMENT '乙方公司名称',
  `sc_begin_time` int(11) NOT NULL COMMENT '开始时间',
  `sc_end_time` int(11) NOT NULL COMMENT '结束时间',
  `sc_amount` int(11) NOT NULL COMMENT '合同金额',
  `sc_sign_time` int(11) NOT NULL COMMENT '签订时间',
  `sc_status` tinyint(1) NOT NULL COMMENT '状态 1正常 0删除 2已过期 ',
  `sc_uid` int(11) NOT NULL COMMENT '创建人',
  `sc_username` varchar(64) NOT NULL COMMENT '创建人名称',
  `sc_upload` varchar(255) NOT NULL COMMENT '合同附件',
  `sc_pid` text NOT NULL COMMENT '旧合同序号',
  `sc_create_time` int(11) NOT NULL COMMENT '创建时间',
  `sc_update_time` int(11) NOT NULL COMMENT '最后修改时间',
  `sc_upload_name` varchar(128) NOT NULL COMMENT '附件名称',
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for suppliers_contract_qualifications_type
-- ----------------------------
DROP TABLE IF EXISTS `suppliers_contract_qualifications_type`;
CREATE TABLE `suppliers_contract_qualifications_type` (
  `scqt_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '合同资质类型序号',
  `scqt_type` tinyint(2) NOT NULL COMMENT '类型类别',
  `scqt_name` varchar(64) NOT NULL COMMENT '合同资质子分类',
  `scqt_uid` int(11) NOT NULL COMMENT '创建人',
  `scqt_username` varchar(64) NOT NULL COMMENT '创建人名称',
  `scqt_status` tinyint(1) NOT NULL COMMENT '合同资质类型状态 1正常 0废弃',
  `scqt_create_time` int(11) NOT NULL COMMENT '创建时间',
  `scqt_update_time` int(11) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`scqt_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for suppliers_qualifications
-- ----------------------------
DROP TABLE IF EXISTS `suppliers_qualifications`;
CREATE TABLE `suppliers_qualifications` (
  `sq_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '资质序号',
  `scqt_id` int(11) NOT NULL COMMENT '资质类型',
  `sq_corporate_name` varchar(128) NOT NULL COMMENT '公司名称',
  `sq_begin_time` int(11) NOT NULL COMMENT '开始时间',
  `sq_end_time` int(11) NOT NULL COMMENT '结束时间',
  `sq_years` int(11) NOT NULL COMMENT '年限',
  `sq_status` tinyint(1) NOT NULL COMMENT '状态 1正常 0删除 2已过期',
  `sq_uid` int(11) NOT NULL COMMENT '创建人',
  `sq_username` varchar(64) NOT NULL COMMENT '创建人名称',
  `sq_upload` varchar(255) NOT NULL COMMENT '附件',
  `sq_upload_name` varchar(128) NOT NULL COMMENT '附件上传名称',
  `sq_create_time` int(11) NOT NULL COMMENT '创建时间',
  `sq_update_time` int(11) NOT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`sq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for system_group
-- ----------------------------
DROP TABLE IF EXISTS `system_group`;
CREATE TABLE `system_group` (
  `sg_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组序号',
  `sg_name` char(32) DEFAULT '' COMMENT '组名',
  `sg_desc` varchar(512) DEFAULT '' COMMENT '简单描述',
  `sg_type` tinyint(2) DEFAULT '1' COMMENT '岗位类型 1 员工 2 客户',
  PRIMARY KEY (`sg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COMMENT='系统用户组或角色';

-- ----------------------------
-- Table structure for system_group_priv
-- ----------------------------
DROP TABLE IF EXISTS `system_group_priv`;
CREATE TABLE `system_group_priv` (
  `sgp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组权限序号',
  `sg_id` int(11) unsigned DEFAULT '0' COMMENT '用户组编号',
  `sp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sgp_id`),
  KEY `sg_id` (`sg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2410725 DEFAULT CHARSET=utf8 COMMENT='系统用户组或角色权限';

-- ----------------------------
-- Table structure for system_group_priv_copy1
-- ----------------------------
DROP TABLE IF EXISTS `system_group_priv_copy1`;
CREATE TABLE `system_group_priv_copy1` (
  `sgp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组权限序号',
  `sg_id` int(11) unsigned DEFAULT '0' COMMENT '用户组编号',
  `sp_id` smallint(6) unsigned DEFAULT '0' COMMENT '权限编号',
  PRIMARY KEY (`sgp_id`),
  KEY `sg_id` (`sg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=253429 DEFAULT CHARSET=utf8 COMMENT='系统用户组或角色权限';

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log` (
  `sl_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志序号',
  `sl_module` char(32) DEFAULT '' COMMENT '模块',
  `sl_controller` char(32) DEFAULT '' COMMENT '控制器',
  `sl_action` char(32) DEFAULT '' COMMENT '动作',
  `conid` int(10) NOT NULL DEFAULT '0' COMMENT '相关id',
  `sl_request_url` varchar(512) DEFAULT '' COMMENT '请求地址',
  `sl_uid` int(11) unsigned DEFAULT '0' COMMENT '操作UID',
  `username` char(32) DEFAULT '' COMMENT '真实姓名',
  `sl_ip` char(32) DEFAULT '' COMMENT '操作IP',
  `sl_content` varchar(1024) DEFAULT NULL COMMENT '内容',
  `sl_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`sl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='系统操作日志';

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu` (
  `sm_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单序号',
  `sm_label` char(32) DEFAULT '' COMMENT '菜单标签',
  `sm_parent_id` int(11) DEFAULT NULL,
  `sm_has_child` tinyint(4) unsigned DEFAULT '0' COMMENT '有无子节点（0：无，1：有）',
  `sm_request_url_domain` varchar(200) DEFAULT '' COMMENT '请求地址域名',
  `sm_request_url` varchar(512) DEFAULT '' COMMENT '请求地址',
  `sm_icon` char(32) DEFAULT '' COMMENT 'icon名称',
  `sort_by` tinyint(4) unsigned DEFAULT '0' COMMENT '排序方式，降序',
  `is_show_sidebar` tinyint(4) unsigned DEFAULT '0' COMMENT '是否在菜单栏显示（0：不显示，1：显示）',
  `is_show_index` tinyint(4) unsigned DEFAULT '0' COMMENT '是否在首页显示（0：不显示，1：显示）',
  `is_target` tinyint(4) unsigned DEFAULT '0' COMMENT '是否弹出新窗口，0：不弹出，1：弹出',
  `sm_status` tinyint(4) unsigned DEFAULT '0' COMMENT '状态（0：正常，1：关闭）',
  `sm_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sm_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `app_id` varchar(50) NOT NULL DEFAULT '' COMMENT '应用app_id',
  PRIMARY KEY (`sm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=618 DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Table structure for system_menu_copy1
-- ----------------------------
DROP TABLE IF EXISTS `system_menu_copy1`;
CREATE TABLE `system_menu_copy1` (
  `sm_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单序号',
  `sm_label` char(32) DEFAULT '' COMMENT '菜单标签',
  `sm_parent_id` tinyint(4) unsigned DEFAULT '0' COMMENT '上一层父节点（根节点为0）',
  `sm_has_child` tinyint(4) unsigned DEFAULT '0' COMMENT '有无子节点（0：无，1：有）',
  `sm_request_url` varchar(512) DEFAULT '' COMMENT '请求地址',
  `sm_icon` char(32) DEFAULT '' COMMENT 'icon名称',
  `sort_by` tinyint(4) unsigned DEFAULT '0' COMMENT '排序方式，降序',
  `is_show_sidebar` tinyint(4) unsigned DEFAULT '0' COMMENT '是否在菜单栏显示（0：不显示，1：显示）',
  `is_show_index` tinyint(4) unsigned DEFAULT '0' COMMENT '是否在首页显示（0：不显示，1：显示）',
  `is_target` tinyint(4) unsigned DEFAULT '0' COMMENT '是否弹出新窗口，0：不弹出，1：弹出',
  `sm_status` tinyint(4) unsigned DEFAULT '0' COMMENT '状态（0：正常，1：关闭）',
  `sm_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sm_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`sm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8 COMMENT='系统菜单';

-- ----------------------------
-- Table structure for system_performances
-- ----------------------------
DROP TABLE IF EXISTS `system_performances`;
CREATE TABLE `system_performances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_cpu` bigint(20) NOT NULL,
  `free_cpu` double NOT NULL,
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total_mem` bigint(20) NOT NULL,
  `free_mem` bigint(20) NOT NULL,
  `total_swap` bigint(20) NOT NULL,
  `free_swap` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_system_performances_on_connection_id_and_created_at` (`connection_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for system_priv
-- ----------------------------
DROP TABLE IF EXISTS `system_priv`;
CREATE TABLE `system_priv` (
  `sp_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限序号',
  `sp_label` char(32) DEFAULT '' COMMENT '权限名称',
  `sm_id` smallint(6) unsigned DEFAULT '0' COMMENT '菜单编号',
  `sp_request_url_domain` varchar(200) DEFAULT '' COMMENT '请求地址域名',
  `sp_module` char(32) DEFAULT '' COMMENT '模块',
  `sp_controller` char(32) DEFAULT '' COMMENT '控制器',
  `sp_action` varchar(100) DEFAULT NULL COMMENT '动作',
  `sp_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sp_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `app_id` varchar(50) NOT NULL DEFAULT '' COMMENT '应用app_id',
  PRIMARY KEY (`sp_id`),
  KEY `sm_id` (`sm_id`),
  KEY `idx_action_indexes` (`sp_controller`,`sp_action`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3006 DEFAULT CHARSET=utf8 COMMENT='系统权限';

-- ----------------------------
-- Table structure for system_priv_copy1
-- ----------------------------
DROP TABLE IF EXISTS `system_priv_copy1`;
CREATE TABLE `system_priv_copy1` (
  `sp_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限序号',
  `sp_label` char(32) DEFAULT '' COMMENT '权限名称',
  `sm_id` smallint(6) unsigned DEFAULT '0' COMMENT '菜单编号',
  `sp_module` char(32) DEFAULT '' COMMENT '模块',
  `sp_controller` char(32) DEFAULT '' COMMENT '控制器',
  `sp_action` char(32) DEFAULT '' COMMENT '动作',
  `sp_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `sp_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`sp_id`),
  KEY `sm_id` (`sm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=934 DEFAULT CHARSET=utf8 COMMENT='系统权限';

-- ----------------------------
-- Table structure for system_rate
-- ----------------------------
DROP TABLE IF EXISTS `system_rate`;
CREATE TABLE `system_rate` (
  `sr_id` int(2) NOT NULL AUTO_INCREMENT,
  `sr_rate` decimal(18,2) NOT NULL COMMENT '税率',
  PRIMARY KEY (`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='税率表';

-- ----------------------------
-- Table structure for system_region
-- ----------------------------
DROP TABLE IF EXISTS `system_region`;
CREATE TABLE `system_region` (
  `region_id` int(11) unsigned NOT NULL COMMENT '地区ID',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '该地区的父节点',
  `region_name` varchar(128) DEFAULT NULL COMMENT '地区名',
  `region_sn` varchar(32) DEFAULT NULL COMMENT '地区编码/拼音/英文',
  `sortid` tinyint(1) NOT NULL DEFAULT '99',
  `region_status` int(2) DEFAULT '0' COMMENT '0显示 1不显示',
  `region_visible` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 删除',
  `region_level` tinyint(1) DEFAULT NULL COMMENT '1 省级 2 市级 3 县级',
  `region_charge_type` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 远郊',
  `city_category_id` tinyint(3) NOT NULL DEFAULT '0' COMMENT '城市类别 参考bms_quotation_config.php',
  PRIMARY KEY (`region_id`),
  KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区列表-系统数据';

-- ----------------------------
-- Table structure for system_region_back20211209
-- ----------------------------
DROP TABLE IF EXISTS `system_region_back20211209`;
CREATE TABLE `system_region_back20211209` (
  `region_id` int(11) unsigned NOT NULL COMMENT '地区ID',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '该地区的父节点',
  `region_name` varchar(128) DEFAULT NULL COMMENT '地区名',
  `region_sn` varchar(32) DEFAULT NULL COMMENT '地区编码/拼音/英文',
  `sortid` tinyint(1) NOT NULL DEFAULT '99',
  `region_status` int(2) DEFAULT '0' COMMENT '0显示 1不显示',
  PRIMARY KEY (`region_id`),
  KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区列表-系统数据';

-- ----------------------------
-- Table structure for system_region_copy1
-- ----------------------------
DROP TABLE IF EXISTS `system_region_copy1`;
CREATE TABLE `system_region_copy1` (
  `region_id` int(11) unsigned NOT NULL COMMENT '地区ID',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '该地区的父节点',
  `region_name` varchar(128) DEFAULT NULL COMMENT '地区名',
  `region_sn` varchar(32) DEFAULT NULL COMMENT '地区编码/拼音/英文',
  `sortid` tinyint(1) NOT NULL DEFAULT '99',
  `region_status` int(2) DEFAULT '0' COMMENT '0显示 1不显示',
  `region_visible` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 删除',
  `region_level` tinyint(1) DEFAULT NULL COMMENT '1 省级 2 市级 3 县级',
  `region_charge_type` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 远郊',
  PRIMARY KEY (`region_id`),
  KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区列表-系统数据';

-- ----------------------------
-- Table structure for system_region_copy2
-- ----------------------------
DROP TABLE IF EXISTS `system_region_copy2`;
CREATE TABLE `system_region_copy2` (
  `region_id` int(11) unsigned NOT NULL COMMENT '地区ID',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '该地区的父节点',
  `region_name` varchar(128) DEFAULT NULL COMMENT '地区名',
  `region_sn` varchar(32) DEFAULT NULL COMMENT '地区编码/拼音/英文',
  `sortid` tinyint(1) NOT NULL DEFAULT '99',
  `region_status` int(2) DEFAULT '0' COMMENT '0显示 1不显示',
  `region_visible` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 删除',
  `region_level` tinyint(1) DEFAULT NULL COMMENT '1 省级 2 市级 3 县级',
  `region_charge_type` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 远郊',
  PRIMARY KEY (`region_id`),
  KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区列表-系统数据';

-- ----------------------------
-- Table structure for system_region_copy20220119
-- ----------------------------
DROP TABLE IF EXISTS `system_region_copy20220119`;
CREATE TABLE `system_region_copy20220119` (
  `region_id` int(11) unsigned NOT NULL COMMENT '地区ID',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '该地区的父节点',
  `region_name` varchar(128) DEFAULT NULL COMMENT '地区名',
  `region_sn` varchar(32) DEFAULT NULL COMMENT '地区编码/拼音/英文',
  `sortid` tinyint(1) NOT NULL DEFAULT '99',
  `region_status` int(2) DEFAULT '0' COMMENT '0显示 1不显示',
  `region_visible` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 删除',
  `region_level` tinyint(1) DEFAULT NULL COMMENT '1 省级 2 市级 3 县级',
  `region_charge_type` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 远郊',
  PRIMARY KEY (`region_id`),
  KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区列表-系统数据';

-- ----------------------------
-- Table structure for system_region_copy3
-- ----------------------------
DROP TABLE IF EXISTS `system_region_copy3`;
CREATE TABLE `system_region_copy3` (
  `region_id` int(11) unsigned NOT NULL COMMENT '地区ID',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '该地区的父节点',
  `region_name` varchar(128) DEFAULT NULL COMMENT '地区名',
  `region_sn` varchar(32) DEFAULT NULL COMMENT '地区编码/拼音/英文',
  `sortid` tinyint(1) NOT NULL DEFAULT '99',
  `region_status` int(2) DEFAULT '0' COMMENT '0显示 1不显示',
  `region_visible` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 删除',
  `region_level` tinyint(1) DEFAULT NULL COMMENT '1 省级 2 市级 3 县级',
  `region_charge_type` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 远郊',
  PRIMARY KEY (`region_id`),
  KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区列表-系统数据';

-- ----------------------------
-- Table structure for system_region_jwd
-- ----------------------------
DROP TABLE IF EXISTS `system_region_jwd`;
CREATE TABLE `system_region_jwd` (
  `srj_Id` int(20) NOT NULL AUTO_INCREMENT COMMENT '地区Id',
  `srj_region_id` varchar(50) NOT NULL COMMENT '地区编码',
  `srj_name` varchar(20) NOT NULL COMMENT '地区名',
  `srj_level` tinyint(4) DEFAULT '-1' COMMENT '地区级别（1:省份province,2:市city,3:区县district,4:街道street）',
  `srj_citycode` varchar(50) DEFAULT NULL COMMENT '城市编码',
  `srj_center` varchar(50) DEFAULT NULL COMMENT '城市中心点（即：经纬度坐标）',
  `srj_parentId` int(20) DEFAULT '-1' COMMENT '地区父节点',
  PRIMARY KEY (`srj_Id`),
  KEY `srj_name` (`srj_name`),
  KEY `srj_region_id` (`srj_region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3260 DEFAULT CHARSET=utf8 COMMENT='地区码表';

-- ----------------------------
-- Table structure for system_region_test
-- ----------------------------
DROP TABLE IF EXISTS `system_region_test`;
CREATE TABLE `system_region_test` (
  `region_id` int(11) unsigned NOT NULL COMMENT '地区ID',
  `parent_id` int(11) unsigned DEFAULT '0' COMMENT '该地区的父节点',
  `region_name` varchar(128) DEFAULT NULL COMMENT '地区名',
  `region_sn` varchar(32) DEFAULT NULL COMMENT '地区编码/拼音/英文',
  `sortid` tinyint(1) NOT NULL DEFAULT '99',
  `region_status` int(2) DEFAULT '0' COMMENT '0显示 1不显示',
  `region_visible` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 删除',
  `region_level` tinyint(1) DEFAULT NULL COMMENT '1 省级 2 市级 3 县级',
  `region_charge_type` tinyint(1) DEFAULT '1' COMMENT '1 正常 2 远郊',
  PRIMARY KEY (`region_id`),
  KEY `region_name` (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地区列表-系统数据';

-- ----------------------------
-- Table structure for system_service
-- ----------------------------
DROP TABLE IF EXISTS `system_service`;
CREATE TABLE `system_service` (
  `ss_id` int(2) NOT NULL AUTO_INCREMENT,
  `ss_name` varchar(100) NOT NULL COMMENT '服务名称',
  `ss_brevity_code` varchar(100) NOT NULL DEFAULT '' COMMENT '服务简码',
  `ss_code` varchar(50) NOT NULL DEFAULT '' COMMENT '服务编码',
  `ss_meter_unit` varchar(20) NOT NULL DEFAULT '' COMMENT '计量单位',
  `ss_specifications_model` varchar(50) NOT NULL DEFAULT '' COMMENT '规格型号',
  `ss_price` varchar(30) NOT NULL DEFAULT '' COMMENT '单价',
  `ss_num` varchar(20) NOT NULL DEFAULT '' COMMENT '单价',
  `ss_duty_free_type` tinyint(1) unsigned NOT NULL DEFAULT '4' COMMENT '免税类型 0出口退税 1出口免税和其他免税优惠政策 2不征增值税 3普通零税率 4正常退税',
  `ss_is_discounts` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用优惠政策 0未使用 1使用',
  `ss_discounts_type` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否使用优惠政策 0未使用 1使用',
  `sr_id` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '税率id',
  `ss_status` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '状态 0禁用 1正常',
  `ss_sort_code` varchar(10) NOT NULL DEFAULT '' COMMENT '编码',
  PRIMARY KEY (`ss_id`),
  KEY `sr_id` (`sr_id`),
  KEY `ss_code` (`ss_code`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='服务表';

-- ----------------------------
-- Table structure for system_service_rate
-- ----------------------------
DROP TABLE IF EXISTS `system_service_rate`;
CREATE TABLE `system_service_rate` (
  `ssr_id` int(2) NOT NULL AUTO_INCREMENT,
  `ss_id` int(2) NOT NULL COMMENT '服务id',
  `sr_id` int(2) NOT NULL COMMENT '税率id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '服务状态: 0禁用 1正常',
  PRIMARY KEY (`ssr_id`),
  UNIQUE KEY `service` (`ss_id`,`sr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='服务税率绑定表';

-- ----------------------------
-- Table structure for system_user_group
-- ----------------------------
DROP TABLE IF EXISTS `system_user_group`;
CREATE TABLE `system_user_group` (
  `sug_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户分组序号',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `sg_id` int(11) unsigned DEFAULT '0' COMMENT '用户组ID',
  PRIMARY KEY (`sug_id`),
  KEY `ur_uid` (`ur_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=18500 DEFAULT CHARSET=utf8 COMMENT='用户分组';

-- ----------------------------
-- Table structure for system_workday
-- ----------------------------
DROP TABLE IF EXISTS `system_workday`;
CREATE TABLE `system_workday` (
  `day_id` int(11) NOT NULL AUTO_INCREMENT,
  `day_day` int(11) DEFAULT NULL COMMENT '时间  年月日',
  `day_type` int(4) DEFAULT '0' COMMENT '类型  0.工作日 1周末休息 2节假日  ',
  PRIMARY KEY (`day_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1096 DEFAULT CHARSET=utf8mb4 COMMENT='系统节假日数据';

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(10) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(30) NOT NULL COMMENT '标签名',
  `tag_type` tinyint(2) NOT NULL COMMENT '标签类型（1=客户项目）',
  `tag_visible` tinyint(1) NOT NULL COMMENT '标签状态（0=删除，1=正常）',
  `tag_createtime` int(10) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`tag_id`),
  KEY `tag_type` (`tag_type`),
  KEY `tag_visible` (`tag_visible`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Table structure for take_stock_analysis
-- ----------------------------
DROP TABLE IF EXISTS `take_stock_analysis`;
CREATE TABLE `take_stock_analysis` (
  `tsa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存序号',
  `check_id` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '盘点ID',
  `top_wa_name` varchar(1024) DEFAULT NULL COMMENT '一级市仓名称',
  `top_wa_no` char(255) NOT NULL DEFAULT '' COMMENT '一级市仓编号',
  `top_wa_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级市仓ID',
  `tsa_system_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '系统库存数量',
  `tsa_check_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '盘点库存数量',
  `tsa_surplus_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '盘盈库存数量',
  `tsa_surplus_detail` longtext COMMENT '盘盈明细编号',
  `tsa_loss_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '盘亏库存数量',
  `tsa_loss_detail` longtext COMMENT '盘亏明细编号',
  `tsa_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tsa_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`tsa_id`),
  KEY `idx_check_id_top_wa_id` (`check_id`,`top_wa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2519 DEFAULT CHARSET=utf8 COMMENT='盘点数据分析表';

-- ----------------------------
-- Table structure for take_stock_analysis_all
-- ----------------------------
DROP TABLE IF EXISTS `take_stock_analysis_all`;
CREATE TABLE `take_stock_analysis_all` (
  `tsaa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存序号',
  `check_id` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '盘点ID',
  `tsaa_system_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '系统库存数量',
  `tsaa_check_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '盘点库存数量',
  `tsaa_surplus_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '盘盈库存数量',
  `tsaa_surplus_detail` longtext COMMENT '盘盈明细编号',
  `tsaa_loss_quantity` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '盘亏库存数量',
  `tsaa_loss_detail` longtext COMMENT '盘亏明细编号',
  `tsaa_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tsaa_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`tsaa_id`),
  KEY `idx_check_id` (`check_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='全国盘点数据分析表';

-- ----------------------------
-- Table structure for take_stock_inventory
-- ----------------------------
DROP TABLE IF EXISTS `take_stock_inventory`;
CREATE TABLE `take_stock_inventory` (
  `tsi_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存序号',
  `check_id` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '盘点ID',
  `top_wa_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级市仓ID',
  `wa_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `tsi_quantity` smallint(6) NOT NULL DEFAULT '0' COMMENT '库存数量',
  `tsi_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tsi_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`tsi_id`),
  UNIQUE KEY `uni_check_id_sto_id_wa_id` (`check_id`,`sto_id`,`wa_id`),
  KEY `idx_wa_id` (`wa_id`),
  KEY `idx_sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31162 DEFAULT CHARSET=utf8 COMMENT='盘点结束后库存备份表';

-- ----------------------------
-- Table structure for take_stock_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `take_stock_inventory_detail`;
CREATE TABLE `take_stock_inventory_detail` (
  `tsid_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存详细序号',
  `check_id` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT '盘点ID',
  `top_wa_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '一级市仓ID',
  `wa_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `gd_series_number` varchar(32) DEFAULT NULL COMMENT '序列号',
  `tsid_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '盘点时间',
  `tsid_user` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '盘点人',
  `tsid_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT ' ''状态 0-库存中 1-已出库''',
  PRIMARY KEY (`tsid_id`),
  KEY `idx_wa_id` (`sto_id`),
  KEY `idx_sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=573109 DEFAULT CHARSET=utf8 COMMENT='盘点结束后库存备份明细表';

-- ----------------------------
-- Table structure for temp_error_log
-- ----------------------------
DROP TABLE IF EXISTS `temp_error_log`;
CREATE TABLE `temp_error_log` (
  `error_id` int(11) NOT NULL AUTO_INCREMENT,
  `error_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '错误类型',
  `error_content` varchar(255) NOT NULL DEFAULT '' COMMENT '错误内容',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `gd_series_number` varchar(255) NOT NULL DEFAULT '' COMMENT '温度计编号',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`error_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1037 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for temperature
-- ----------------------------
DROP TABLE IF EXISTS `temperature`;
CREATE TABLE `temperature` (
  `temp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `config_id` int(11) DEFAULT NULL COMMENT 'config配置对应键',
  `min_temp` float(8,2) DEFAULT NULL COMMENT '最低温度',
  `max_temp` float(8,2) DEFAULT NULL COMMENT '最高温度',
  `temp_remark` varchar(255) DEFAULT NULL COMMENT '温度备注',
  `temp_siren_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '营销特殊温度监控状态 1 不监控 2 监控',
  `intermission` varchar(15) NOT NULL COMMENT '温度缩写',
  `min_warning_temp` varchar(255) DEFAULT NULL COMMENT '最低预警温度',
  `max_warning_temp` varchar(255) DEFAULT NULL COMMENT '最高预警温度',
  `car_min_warning_temp` varchar(10) DEFAULT NULL COMMENT '冷藏车最低预警温度',
  `car_max_warning_temp` varchar(10) DEFAULT NULL COMMENT '冷藏车最高预警温度',
  `app_min_temp` varchar(10) NOT NULL DEFAULT '' COMMENT 'app检查低温度',
  `app_max_temp` varchar(10) NOT NULL DEFAULT '' COMMENT 'app检查高温度',
  `temp_timeliness` int(11) NOT NULL DEFAULT '0' COMMENT '温度时效',
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='温度范围配置表';

-- ----------------------------
-- Table structure for temperature_pdf
-- ----------------------------
DROP TABLE IF EXISTS `temperature_pdf`;
CREATE TABLE `temperature_pdf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to_id` int(10) DEFAULT NULL COMMENT '运单ID',
  `atid` int(10) unsigned NOT NULL COMMENT '文件ID',
  `tp_info` varchar(120) NOT NULL COMMENT '异常信息',
  `creat_time` int(10) DEFAULT NULL,
  `handle_status` tinyint(1) DEFAULT '2' COMMENT '处理状态(1、已处理，2、未处理)',
  `handle_create_time` int(11) unsigned DEFAULT NULL COMMENT '处理时间',
  `handle_name` varchar(30) DEFAULT NULL COMMENT '处理人',
  `handle_uid` int(11) DEFAULT NULL COMMENT '处理人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24709 DEFAULT CHARSET=utf8 COMMENT='订单温度数据异常文件表';

-- ----------------------------
-- Table structure for temperature_pdf_handle
-- ----------------------------
DROP TABLE IF EXISTS `temperature_pdf_handle`;
CREATE TABLE `temperature_pdf_handle` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `tm_id` int(11) DEFAULT NULL COMMENT '订单温度数据异常文件表id',
  `handle_status` tinyint(1) DEFAULT NULL COMMENT '处理状态(1、已处理，2、未处理)',
  `handle_create_time` int(11) unsigned DEFAULT NULL COMMENT '处理时间',
  `handle_name` varchar(30) DEFAULT NULL COMMENT '处理人',
  `handle_uid` int(11) DEFAULT NULL COMMENT '处理人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='异常温度数据文件处理关联表';

-- ----------------------------
-- Table structure for temperature_range
-- ----------------------------
DROP TABLE IF EXISTS `temperature_range`;
CREATE TABLE `temperature_range` (
  `tr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id 温度范围id',
  `tr_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '配置类型 1 运输温度 2 仓储温度',
  `temp_id` int(3) NOT NULL COMMENT '配置id',
  `tr_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '温度范围',
  `min_temp` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '最低温度',
  `max_temp` varchar(255) NOT NULL COMMENT '最高温度',
  `tr_remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `tr_visible` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 停用',
  PRIMARY KEY (`tr_id`),
  UNIQUE KEY `tr_type-temp_id-tr_visible` (`tr_type`,`temp_id`,`tr_visible`),
  KEY `tr_type` (`tr_type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='温度范围表';

-- ----------------------------
-- Table structure for temperature_templete
-- ----------------------------
DROP TABLE IF EXISTS `temperature_templete`;
CREATE TABLE `temperature_templete` (
  `tt_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `temp_id` int(4) unsigned DEFAULT NULL COMMENT '温度表配置表对应主键',
  `tt_model` char(128) DEFAULT NULL COMMENT '温度计型号',
  `at_id` int(11) unsigned DEFAULT NULL COMMENT '文件id',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户ID',
  `tt_status` int(1) unsigned DEFAULT '1' COMMENT '温度计模板状态 0-删除，1-正常',
  `start_time` int(10) unsigned DEFAULT '0' COMMENT '开始使用时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for templete_message
-- ----------------------------
DROP TABLE IF EXISTS `templete_message`;
CREATE TABLE `templete_message` (
  `tm_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `openid` varchar(128) NOT NULL COMMENT 'openid',
  `ur_uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '订单ID',
  `tm_type` int(2) unsigned DEFAULT '1' COMMENT '模板消息类型 1.下单成功提醒 2.审核提醒 3.取消提醒 4.派件提醒 5.下单成功提示(恒瑞非专利)',
  `content` varchar(1024) DEFAULT NULL COMMENT '模板消息内容',
  `tm_url` varchar(1024) DEFAULT NULL COMMENT 'url跳转链接',
  `status` int(1) unsigned DEFAULT '0' COMMENT '推送状态 0.未推送 1.已推送',
  `op_time` int(10) unsigned DEFAULT '0' COMMENT '记录订单操作时间(取消、审核、下单等)',
  `tm_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tm_updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`tm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10106 DEFAULT CHARSET=utf8 COMMENT='模板消息推送表';

-- ----------------------------
-- Table structure for temporary_order
-- ----------------------------
DROP TABLE IF EXISTS `temporary_order`;
CREATE TABLE `temporary_order` (
  `to_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单序号',
  `payment_company` varchar(255) DEFAULT NULL COMMENT '付款单位',
  `create_user` varchar(255) DEFAULT NULL COMMENT '下单人',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `emp_ur_uid` int(10) unsigned DEFAULT '0' COMMENT '销售人员id',
  `emp_username` char(32) DEFAULT NULL COMMENT '销售人员姓名',
  `to_goodstype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '货物类型（1=血样，2=样本，3=药品）',
  `to_important` tinyint(4) unsigned DEFAULT '0' COMMENT '重要程序，0普通，1重要',
  `to_timelimit` tinyint(4) unsigned DEFAULT '0' COMMENT '运送时限',
  `to_temperature` tinyint(4) unsigned DEFAULT '0' COMMENT '运输温度',
  `to_temperature_name` varchar(30) DEFAULT NULL COMMENT '运输温度名称',
  `to_thermometer` tinyint(4) unsigned DEFAULT '0' COMMENT '温度计，1无温度计，2生生温度计，3客户温度计，4客户和生生温度计',
  `to_hygrometer` tinyint(4) DEFAULT '1' COMMENT '湿度计，1无湿度计，2生生湿度计，3客户湿度计，4客户和生生湿度计',
  `to_insure` tinyint(4) unsigned DEFAULT '0' COMMENT '是否投保，0否，1是',
  `to_insure_value` decimal(10,2) DEFAULT '0.00' COMMENT '声明价值',
  `to_getcash` tinyint(4) unsigned DEFAULT '0' COMMENT '付款方式，0月结，1发货方现金，2收货方现金',
  `to_invoice` tinyint(4) unsigned DEFAULT '0' COMMENT '是否开票，0否，1是',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发件所在地区ID',
  `start_region_name` char(128) DEFAULT NULL COMMENT '发件地区名',
  `start_cu_id` int(11) DEFAULT NULL,
  `start_cu_name` char(32) DEFAULT NULL COMMENT '发件客户',
  `start_co_name` char(32) DEFAULT NULL COMMENT '发件人',
  `start_mobile_phone` char(32) DEFAULT NULL COMMENT '发件联系手机',
  `start_address` char(128) DEFAULT NULL COMMENT '发件联系地址',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '收件所在地区ID',
  `stop_region_name` char(128) DEFAULT NULL COMMENT '收件地区名',
  `stop_cu_id` int(11) DEFAULT NULL,
  `stop_cu_name` char(32) DEFAULT NULL COMMENT '收件客户',
  `stop_co_name` char(32) DEFAULT NULL COMMENT '收件联系人',
  `stop_mobile_phone` char(32) DEFAULT NULL COMMENT '收件联系手机',
  `stop_address` char(128) DEFAULT NULL COMMENT '收件联系地址',
  `to_status` tinyint(4) unsigned DEFAULT '1' COMMENT '匿名订单状态 1新建 2已下单 3已取消',
  `to_remark` varchar(1024) DEFAULT NULL COMMENT '客户备注',
  `to_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `to_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `to_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `to_email` varchar(128) DEFAULT '' COMMENT '反馈邮箱',
  `to_source` tinyint(4) DEFAULT '1' COMMENT '订单来源',
  `to_trequirement` int(1) unsigned DEFAULT '0' COMMENT '运输要求',
  `ol_pickup_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约取件时间',
  `ol_delivery_planbegin` int(10) unsigned DEFAULT '0' COMMENT '预约派件时间',
  `ol_pickup_planend` int(10) DEFAULT '0' COMMENT '预约取件截止时间',
  `ol_delivery_planend` int(11) DEFAULT '0' COMMENT '预约派件截止时间',
  `ol_pickup_planfw` int(2) NOT NULL DEFAULT '0' COMMENT '预约取件范围',
  `ol_delivery_planfw` int(2) NOT NULL DEFAULT '0' COMMENT '预约派件范围',
  `to_hygrometer_range` varchar(10) DEFAULT NULL COMMENT '湿度区间',
  `to_quote` decimal(10,2) DEFAULT '0.00' COMMENT '报价',
  `to_quote_time` int(10) DEFAULT '0' COMMENT '报价时间',
  `bia_id` int(11) DEFAULT '0' COMMENT '发票地址id',
  `bi_id` int(11) DEFAULT '0' COMMENT '发票id',
  `p_status` tinyint(1) DEFAULT '0' COMMENT '支付状态',
  `bi_billtype` tinyint(1) DEFAULT '0' COMMENT '开票类型',
  `bia_email` varchar(64) DEFAULT '' COMMENT '邮箱',
  `bia_note` varchar(64) DEFAULT '' COMMENT '短信',
  `to_order_goods` varchar(255) DEFAULT '' COMMENT '货物数量',
  `send_type` tinyint(3) unsigned DEFAULT '0' COMMENT '1圆通 2顺丰 6京东物流 3邮箱 4短信 5邮箱和短信',
  `bi_remark` varchar(200) NOT NULL DEFAULT '' COMMENT '发票备注',
  PRIMARY KEY (`to_id`),
  KEY `to_create_uid` (`to_create_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=723 DEFAULT CHARSET=utf8 COMMENT='临时订单表';

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for test_region
-- ----------------------------
DROP TABLE IF EXISTS `test_region`;
CREATE TABLE `test_region` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for tms_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tms_attachment`;
CREATE TABLE `tms_attachment` (
  `tat_id` int(11) NOT NULL AUTO_INCREMENT,
  `tat_type` int(6) NOT NULL COMMENT '文件分类',
  `tat_subtype` int(11) NOT NULL COMMENT '文件子分类',
  `tat_identifier` int(11) NOT NULL COMMENT '文件标识',
  `tat_filename` varchar(255) NOT NULL COMMENT '文件名称',
  `tat_filepath` varchar(1024) NOT NULL COMMENT '文件路径',
  `tat_visible` int(4) DEFAULT '1' COMMENT '文件状态 1.正常 2删除',
  `tat_createtime` int(11) NOT NULL COMMENT '上传时间',
  `tat_createuid` int(11) NOT NULL COMMENT '上传人',
  `tat_createname` varchar(255) NOT NULL COMMENT '上传人名称',
  `tat_filesize` int(11) unsigned DEFAULT '0' COMMENT '附件文件大小，单位：KB',
  PRIMARY KEY (`tat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=594 DEFAULT CHARSET=utf8mb4 COMMENT='tms独立文件列表';

-- ----------------------------
-- Table structure for tms_auto_open_thermometer
-- ----------------------------
DROP TABLE IF EXISTS `tms_auto_open_thermometer`;
CREATE TABLE `tms_auto_open_thermometer` (
  `aot_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动开机温度计信息ID',
  `to_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `gd_series_number` varchar(30) DEFAULT NULL COMMENT '温度计序列编号',
  `dw_push_time` int(11) DEFAULT NULL COMMENT '向鼎为请求下发时间',
  `open_time` int(11) DEFAULT NULL COMMENT '开启时间',
  `aot_status` int(11) DEFAULT '0' COMMENT '开启状态，0，未请求，1，未开启，2：已开启，',
  `ur_uid` int(11) DEFAULT NULL COMMENT '开启人ID',
  `username` varchar(30) DEFAULT NULL COMMENT '开启人姓名',
  `open_temperature` varchar(6) DEFAULT NULL COMMENT '开启温度',
  `manual_open` varchar(255) DEFAULT '1' COMMENT '手动开启1自动，2手动',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `aot_order_status` int(11) DEFAULT '1' COMMENT '1未取件，2已取件',
  `aot_timeout_push` tinyint(4) DEFAULT '1' COMMENT '企业微信推送消息1:未推送，2已推送',
  PRIMARY KEY (`aot_id`),
  KEY `to_id` (`to_id`),
  KEY `gd_series_number` (`gd_series_number`),
  KEY `aot_status` (`aot_status`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_car_check
-- ----------------------------
DROP TABLE IF EXISTS `tms_car_check`;
CREATE TABLE `tms_car_check` (
  `cc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `car_id` int(11) DEFAULT NULL COMMENT '车辆ID',
  `cc_hygienism` int(11) DEFAULT NULL COMMENT '外观/内饰    1:合格  2:不合格',
  `cc_performance` int(11) DEFAULT NULL COMMENT '仪表盘/灯光/轮胎   1:合格 2:不合格',
  `cc_secure` int(11) DEFAULT NULL COMMENT '灭火器/三脚架   1:合格  2:不合格',
  `cc_uid` int(11) DEFAULT NULL COMMENT '检查人ID',
  `cc_username` varchar(30) DEFAULT NULL COMMENT '检查人姓名',
  `cc_create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `cc_visible` tinyint(1) DEFAULT '1' COMMENT '1：显示，2：删除',
  `cc_coworkeruids` varchar(100) DEFAULT '' COMMENT '同乘人id',
  `cc_coworkernames` varchar(100) DEFAULT '' COMMENT '同乘人名字',
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=373 DEFAULT CHARSET=utf8mb4 COMMENT='车辆检查表';

-- ----------------------------
-- Table structure for tms_carea_group
-- ----------------------------
DROP TABLE IF EXISTS `tms_carea_group`;
CREATE TABLE `tms_carea_group` (
  `tcg_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tcg_region_idlist` text COMMENT '城市id列表',
  `tcg_region_namelist` text COMMENT '城市名称列表',
  `tcg_name` varchar(255) NOT NULL DEFAULT '' COMMENT '区域名称',
  `tcg_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 异常',
  PRIMARY KEY (`tcg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='订单区域分组';

-- ----------------------------
-- Table structure for tms_carea_group_detail
-- ----------------------------
DROP TABLE IF EXISTS `tms_carea_group_detail`;
CREATE TABLE `tms_carea_group_detail` (
  `tcgd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tcgd_level` int(4) NOT NULL DEFAULT '1' COMMENT '分组等级 1 低  2 中 3高 ',
  `tcg_id` int(11) NOT NULL DEFAULT '0' COMMENT '区域id',
  `tcgd_status` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2 删除',
  `tcgd_dr_uid` int(11) NOT NULL DEFAULT '0' COMMENT '组长id',
  `tcgd_dr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '组长',
  `tcgd_uidlist` text COMMENT '组员id',
  `tcgd_uidname` text COMMENT '组员',
  PRIMARY KEY (`tcgd_id`),
  KEY `idx_tcg_id` (`tcg_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='区域分组明细';

-- ----------------------------
-- Table structure for tms_cart_operation
-- ----------------------------
DROP TABLE IF EXISTS `tms_cart_operation`;
CREATE TABLE `tms_cart_operation` (
  `tco_id` int(11) NOT NULL AUTO_INCREMENT,
  `tco_uid` int(11) NOT NULL COMMENT '操作人id',
  `tco_name` varchar(100) NOT NULL COMMENT '操作人',
  `tco_status` int(4) DEFAULT '1' COMMENT '状态1空闲 2订单运输中',
  `tco_to_id` int(11) DEFAULT NULL COMMENT '关联订单号',
  `tco_visible` int(4) DEFAULT '1' COMMENT '操作员状态 1 正常 2删除',
  `tco_region_id` text COMMENT '管辖城市id',
  `tco_region_name` text COMMENT '管辖城市',
  PRIMARY KEY (`tco_id`),
  KEY `tco_to_id` (`tco_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_cart_operation_config
-- ----------------------------
DROP TABLE IF EXISTS `tms_cart_operation_config`;
CREATE TABLE `tms_cart_operation_config` (
  `tcc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tcc_name` varchar(100) NOT NULL COMMENT '配置名称',
  `tcc_type` int(4) NOT NULL COMMENT '1.单采单人同城 2.单采单人非同城  3.单采专车 4.回输专人非同城 5.回输专车',
  `tcc_sort` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`tcc_id`),
  KEY `tcc_type` (`tcc_type`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_cart_operation_record
-- ----------------------------
DROP TABLE IF EXISTS `tms_cart_operation_record`;
CREATE TABLE `tms_cart_operation_record` (
  `tcor_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'cart操作记录id',
  `tcc_id` int(11) NOT NULL DEFAULT '0' COMMENT 'tms_cart_operation_config 关联ID',
  `tcc_name` varchar(50) NOT NULL DEFAULT '' COMMENT 'tms_cart_operation_config 名称冗余',
  `to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `tcor_time` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `tcor_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tcc_sort` int(11) NOT NULL DEFAULT '0' COMMENT 'tms_cart_operation_config 名称冗余',
  PRIMARY KEY (`tcor_id`),
  KEY `idx_to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1205 DEFAULT CHARSET=utf8mb4 COMMENT='cart操作记录表';

-- ----------------------------
-- Table structure for tms_cart_operation_record_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tms_cart_operation_record_copy1`;
CREATE TABLE `tms_cart_operation_record_copy1` (
  `tcor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'cart操作记录id',
  `tcc_id` int(11) DEFAULT NULL COMMENT 'tms_cart_operation_config 关联ID',
  `tcc_name` varchar(50) DEFAULT NULL COMMENT 'tms_cart_operation_config 名称冗余',
  `to_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `tcor_time` int(11) DEFAULT NULL COMMENT '操作时间',
  `ur_uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `username` varchar(30) DEFAULT NULL COMMENT '操作人姓名',
  `tcor_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `tcc_sort` int(11) DEFAULT NULL COMMENT 'tms_cart_operation_config 名称冗余',
  PRIMARY KEY (`tcor_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8mb4 COMMENT='cart操作记录表';

-- ----------------------------
-- Table structure for tms_cart_plan
-- ----------------------------
DROP TABLE IF EXISTS `tms_cart_plan`;
CREATE TABLE `tms_cart_plan` (
  `tcp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tcp_to_id` int(11) NOT NULL COMMENT '关联订单信息',
  `tcp_type` int(4) NOT NULL COMMENT '类型 1.专车 2.专人同城 3.专人非同城 去往  4.专人非同城发货',
  `tcp_travel_model` int(4) NOT NULL COMMENT '出行方式 1.生生车辆 2.外租车 3.铁路 4.航空 5.公路',
  `tcp_travel_message` varchar(100) NOT NULL COMMENT '车牌号或航班号或车次',
  `tcp_travel_starttime` int(11) DEFAULT NULL COMMENT '出发时间',
  `tcp_travel_stoptime` int(11) DEFAULT NULL COMMENT '到达时间',
  PRIMARY KEY (`tcp_id`),
  KEY `tcp_to_id` (`tcp_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COMMENT='cart订单车辆安排';

-- ----------------------------
-- Table structure for tms_change_box
-- ----------------------------
DROP TABLE IF EXISTS `tms_change_box`;
CREATE TABLE `tms_change_box` (
  `tms_cb_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '换箱列表主键ID',
  `tms_cb_create_time` int(11) NOT NULL COMMENT '生成时间',
  `tms_cb_to_id` int(11) DEFAULT NULL COMMENT '运输单ID',
  `tms_cb_type` int(11) DEFAULT NULL COMMENT '1：时效换箱 2：添加干冰 3： 中转换箱 4：暂存换箱',
  `tms_cb_ow_id` int(11) DEFAULT NULL COMMENT '工作单ID',
  `tms_cb_ow_type` varchar(11) DEFAULT NULL COMMENT '工作单类型操作类型 1 取件 2 发货 3 派件 4 提货并派件 5 提货并发货 6取派,7提货,8取存,9提存,10存货,11取发,12方案调拨',
  `tms_cb_ow_region_name` varchar(50) DEFAULT NULL COMMENT '工作单城市',
  `tms_cb_cb_uid` int(11) DEFAULT NULL COMMENT '换箱人id',
  `tms_cb_cb_name` varchar(50) DEFAULT NULL COMMENT '换箱人名字',
  `tms_cb_cb_time` int(11) DEFAULT NULL COMMENT '换箱时间',
  `tms_cb_cp_uid` int(11) DEFAULT NULL COMMENT '复核人ID',
  `tms_cb_cp_name` varchar(50) DEFAULT NULL COMMENT '复核人名字',
  `tms_cb_cp_time` int(11) DEFAULT NULL COMMENT '复核时间',
  `tms_cb_status` tinyint(3) DEFAULT NULL COMMENT '换箱状态，1：未换箱，2：未复核(已换箱) 3：已复核',
  `tms_cb_skip_name` varchar(50) DEFAULT NULL COMMENT '跳过换箱人',
  `tms_cb_skip_uid` int(11) DEFAULT NULL COMMENT '跳过换箱人id',
  `tms_cb_skip_time` int(11) DEFAULT NULL COMMENT '跳过换箱时间',
  `tms_cb_skip_reason` varchar(255) DEFAULT NULL COMMENT '跳过换箱理由',
  PRIMARY KEY (`tms_cb_id`),
  KEY `tms_cb_to_id` (`tms_cb_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=859 DEFAULT CHARSET=utf8mb4 COMMENT='换箱操作记录表';

-- ----------------------------
-- Table structure for tms_customer_user
-- ----------------------------
DROP TABLE IF EXISTS `tms_customer_user`;
CREATE TABLE `tms_customer_user` (
  `tcu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cu_name` varchar(255) NOT NULL DEFAULT '' COMMENT '客户名称',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `tcu_uidlist` text COMMENT '组员id',
  `tcu_uname` text COMMENT '组员名称',
  `tcu_status` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  PRIMARY KEY (`tcu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='物流客户负责人';

-- ----------------------------
-- Table structure for tms_ddd_data
-- ----------------------------
DROP TABLE IF EXISTS `tms_ddd_data`;
CREATE TABLE `tms_ddd_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ow_id` int(11) DEFAULT NULL COMMENT '工作单id',
  `type` int(4) DEFAULT NULL COMMENT '类型1.修改 2.新增 3.取消',
  `create_time` int(11) DEFAULT NULL COMMENT '记录创建时间',
  `is_handle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处理 1/0',
  PRIMARY KEY (`id`),
  KEY `ow_id` (`ow_id`),
  KEY `search_time` (`is_handle`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COMMENT='懂调度';

-- ----------------------------
-- Table structure for tms_ddd_push_log
-- ----------------------------
DROP TABLE IF EXISTS `tms_ddd_push_log`;
CREATE TABLE `tms_ddd_push_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '推送订单号',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '推送状态 1/待推送 2/成功 3/删除废弃 4/失败',
  `order_id` int(11) NOT NULL COMMENT 'tms订单号',
  `work_id` int(11) NOT NULL COMMENT '工作单单号',
  `work_type` int(2) NOT NULL COMMENT '工作单状态 同步工作单',
  `text` text NOT NULL COMMENT '推送内容',
  `push_time` int(11) NOT NULL COMMENT '推送时间（状态为2,4时记录）',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `search_time_status` (`status`,`create_time`),
  KEY `search_order` (`order_id`),
  KEY `search_work` (`work_id`,`work_type`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COMMENT='订单推送（讯轻）';

-- ----------------------------
-- Table structure for tms_dn_information
-- ----------------------------
DROP TABLE IF EXISTS `tms_dn_information`;
CREATE TABLE `tms_dn_information` (
  `dn_id` int(11) NOT NULL AUTO_INCREMENT,
  `to_id` int(11) NOT NULL COMMENT '订单id',
  `dn_temperature` varchar(50) DEFAULT NULL COMMENT '温区',
  `dn_no` varchar(255) DEFAULT NULL COMMENT 'dn号',
  `dn_yunshu_type` varchar(255) DEFAULT NULL COMMENT '运输方式',
  `dn_goods_address` varchar(255) DEFAULT NULL COMMENT '提货方式',
  `dn_order_type` varchar(30) DEFAULT NULL COMMENT '订单类型',
  `dn_product_line` varchar(100) DEFAULT NULL COMMENT 'product_line',
  `dn_stop_province` varchar(50) DEFAULT NULL COMMENT '目的地省份',
  `dn_stop_city` varchar(50) DEFAULT NULL COMMENT '目的地城市',
  `dn_stop_address` varchar(255) DEFAULT NULL COMMENT '目的地地址',
  `dn_stop_co_name` varchar(255) DEFAULT NULL COMMENT '联系人',
  `dn_stop_mobile_phone` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `dn_customer_type` varchar(255) DEFAULT NULL COMMENT '客户类型',
  `dn_order_time` int(11) DEFAULT NULL COMMENT 'dn建表时间',
  `dn_num` int(3) DEFAULT NULL COMMENT '件数',
  PRIMARY KEY (`dn_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1965 DEFAULT CHARSET=utf8mb4 COMMENT='订单dn信息表';

-- ----------------------------
-- Table structure for tms_drive_record
-- ----------------------------
DROP TABLE IF EXISTS `tms_drive_record`;
CREATE TABLE `tms_drive_record` (
  `tms_dr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '行车记录主键ID',
  `tms_dr_car_id` int(11) DEFAULT NULL COMMENT '车辆ID',
  `tms_dr_car_record` varchar(200) DEFAULT NULL COMMENT '行车记录',
  `tms_dr_recordtime` int(11) DEFAULT NULL COMMENT '记录时间',
  `tms_dr_start_mileage` decimal(10,2) DEFAULT NULL COMMENT '起始里程，保留小数点两位数字',
  `tms_dr_stop_mileage` decimal(10,2) DEFAULT NULL COMMENT '结束里程，保留小数点两位数字',
  `tms_dr_refuel_money` decimal(10,2) DEFAULT NULL COMMENT '加油金额，保留小数点两位数字',
  `tms_dr_ur_uid` int(11) DEFAULT NULL COMMENT '记录人ID',
  `tms_dr_username` varchar(32) DEFAULT NULL COMMENT '记录人员姓名',
  `tms_dr_start_time` int(11) DEFAULT NULL COMMENT '开始用车时间',
  `tms_dr_stop_time` int(11) DEFAULT NULL COMMENT '结束用车时间',
  `tms_dr_is_over` int(11) DEFAULT '1' COMMENT '是否结束用车，1：正常用车，2：结束用车',
  `tms_dr_visible` tinyint(1) DEFAULT '1' COMMENT '1：显示，2：删除',
  `tms_dr_coworkeruids` varchar(100) DEFAULT '' COMMENT '同乘人id',
  `tms_dr_coworkernames` varchar(100) DEFAULT '' COMMENT '同乘人姓名',
  `tms_dr_abnormal` tinyint(2) DEFAULT '2' COMMENT '异常是否处理 0:未处理 1:处理',
  `tms_dr_abnormal_feedback` varchar(100) DEFAULT NULL COMMENT '处理结果',
  PRIMARY KEY (`tms_dr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=366 DEFAULT CHARSET=utf8mb4 COMMENT='行车记录表';

-- ----------------------------
-- Table structure for tms_drive_record_copy
-- ----------------------------
DROP TABLE IF EXISTS `tms_drive_record_copy`;
CREATE TABLE `tms_drive_record_copy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dr_id` int(11) NOT NULL COMMENT '行车记录主键ID',
  `tms_dr_car_id` int(11) DEFAULT NULL COMMENT '车辆ID',
  `tms_dr_car_record` varchar(200) DEFAULT NULL COMMENT '行车记录',
  `tms_dr_recordtime` int(11) DEFAULT NULL COMMENT '记录时间',
  `tms_dr_start_mileage` decimal(10,2) DEFAULT NULL COMMENT '起始里程，保留小数点两位数字',
  `tms_dr_stop_mileage` decimal(10,2) DEFAULT NULL COMMENT '结束里程，保留小数点两位数字',
  `tms_dr_refuel_money` decimal(10,2) DEFAULT NULL COMMENT '加油金额，保留小数点两位数字',
  `tms_dr_ur_uid` int(11) DEFAULT NULL COMMENT '记录人ID',
  `tms_dr_username` varchar(32) DEFAULT NULL COMMENT '记录人员姓名',
  `tms_dr_start_time` int(11) DEFAULT NULL COMMENT '开始用车时间',
  `tms_dr_stop_time` int(11) DEFAULT NULL COMMENT '结束用车时间',
  `tms_dr_is_over` int(11) DEFAULT '1' COMMENT '是否结束用车，1：正常用车，2：结束用车',
  `tms_dr_visible` tinyint(1) DEFAULT '1' COMMENT '1：显示，2：删除',
  `tms_dr_coworkeruids` varchar(100) DEFAULT '' COMMENT '同乘人id',
  `tms_dr_coworkernames` varchar(100) DEFAULT '' COMMENT '同乘人姓名',
  `tms_dr_abnormal` tinyint(2) DEFAULT '2' COMMENT '异常是否处理 0:未处理 1:处理',
  `tms_dr_abnormal_feedback` varchar(100) DEFAULT NULL COMMENT '处理结果',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=361 DEFAULT CHARSET=utf8mb4 COMMENT='行车记录表';

-- ----------------------------
-- Table structure for tms_dtp_delovery_code
-- ----------------------------
DROP TABLE IF EXISTS `tms_dtp_delovery_code`;
CREATE TABLE `tms_dtp_delovery_code` (
  `tddc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'dtp发送验证码记录表',
  `to_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `tddc_code` char(6) DEFAULT NULL COMMENT '验证码',
  `visible` tinyint(1) DEFAULT '1' COMMENT '0删除,1正常',
  `tddc_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `phone` char(11) DEFAULT NULL COMMENT '发送手机号',
  PRIMARY KEY (`tddc_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_dw_data
-- ----------------------------
DROP TABLE IF EXISTS `tms_dw_data`;
CREATE TABLE `tms_dw_data` (
  `tms_dwd_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwd_deviceid` varchar(255) DEFAULT NULL COMMENT '温度计编号',
  `tms_dwd_temp` varchar(50) DEFAULT NULL COMMENT '温度',
  `tms_dwd_humi` varchar(50) DEFAULT NULL COMMENT '湿度',
  `tms_dwd_sbtime` int(11) DEFAULT NULL COMMENT '获取温度时间',
  `tms_dwd_location` varchar(255) DEFAULT NULL COMMENT '地理坐标',
  `tms_dwd_desc` varchar(255) DEFAULT NULL COMMENT '位置描述',
  `tms_dwd_vol` varchar(50) DEFAULT NULL COMMENT '电量',
  `tms_dwd_status` int(4) DEFAULT '1' COMMENT '状态 1未推送 2已推送',
  `tms_dwd_tstime` int(11) DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`tms_dwd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6789566 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为温度计数据获取';

-- ----------------------------
-- Table structure for tms_dw_hddata
-- ----------------------------
DROP TABLE IF EXISTS `tms_dw_hddata`;
CREATE TABLE `tms_dw_hddata` (
  `tms_dwd_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwd_deviceid` varchar(255) DEFAULT NULL COMMENT '温度计编号',
  `tms_dwd_temp` varchar(50) DEFAULT NULL COMMENT '温度',
  `tms_dwd_humi` varchar(50) DEFAULT NULL COMMENT '湿度',
  `tms_dwd_sbtime` int(11) DEFAULT NULL COMMENT '获取温度时间',
  `tms_dwd_location` varchar(255) DEFAULT NULL COMMENT '地理坐标',
  `tms_dwd_desc` varchar(255) DEFAULT NULL COMMENT '位置描述',
  `tms_dwd_vol` varchar(50) DEFAULT NULL COMMENT '电量',
  `tms_dwd_status` int(4) DEFAULT '1' COMMENT '状态 1未推送 2已推送',
  `tms_dwd_tstime` int(11) DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`tms_dwd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为温度计数据获取';

-- ----------------------------
-- Table structure for tms_dw_sydata
-- ----------------------------
DROP TABLE IF EXISTS `tms_dw_sydata`;
CREATE TABLE `tms_dw_sydata` (
  `tms_dwd_syid` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwd_sydeviceid` varchar(30) NOT NULL COMMENT '温度计编号',
  `tms_dwd_sytemp` varchar(50) NOT NULL COMMENT '温度数据',
  `tms_dwd_sysbtime` int(11) NOT NULL COMMENT '设备获取时间',
  `tms_dwd_sylocation` varchar(100) DEFAULT NULL COMMENT '坐标信息（原）',
  `tms_dwd_sylocation_desc` varchar(100) DEFAULT NULL COMMENT '位置描述',
  `tms_dwd_sybdlocation` varchar(100) DEFAULT NULL COMMENT '坐标信息（转百度后）',
  `tms_dwd_sytoid` int(11) DEFAULT NULL COMMENT '关联订单id',
  `tms_dwd_sytono` varchar(50) DEFAULT NULL COMMENT '订单号',
  `tms_dwd_sytocusto` varchar(50) DEFAULT NULL COMMENT '客户单号',
  `tms_dwd_systatus` int(4) DEFAULT '1' COMMENT '推送状态 1未推送 2已推送',
  `tms_dwd_sypushtime` int(11) DEFAULT NULL COMMENT '推送时间',
  PRIMARY KEY (`tms_dwd_syid`),
  KEY `tms_dwd_sytoid` (`tms_dwd_sytoid`),
  KEY `tms_dwd_sydeviceid` (`tms_dwd_sydeviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COMMENT='上药温度计推送数据';

-- ----------------------------
-- Table structure for tms_dw_temperature_pdf
-- ----------------------------
DROP TABLE IF EXISTS `tms_dw_temperature_pdf`;
CREATE TABLE `tms_dw_temperature_pdf` (
  `tpg_id` int(11) NOT NULL AUTO_INCREMENT,
  `tpg_to_id` int(11) NOT NULL COMMENT '订单id',
  `tpg_to_no` varchar(50) NOT NULL COMMENT '订单编号',
  `tpg_gdnumber` varchar(50) NOT NULL COMMENT '温度计编号',
  `tpg_createtime` int(11) NOT NULL COMMENT '记录创建时间',
  `tpg_status` int(4) DEFAULT '1' COMMENT '1.未获取  2.已获取 ',
  `tpg_dw_filename` text COMMENT '文件名称',
  `tpg_dw_filepath` text COMMENT '文件路径',
  `tpg_dw_startregion` varchar(50) DEFAULT NULL COMMENT '模板出发城市',
  `tpg_dw_stopregion` varchar(50) DEFAULT NULL COMMENT '模板到达城市',
  `tpg_dw_projectnum` varchar(255) DEFAULT NULL COMMENT '模板项目号',
  `tpg_dw_datacount` int(11) DEFAULT NULL COMMENT '温度计点数',
  `tpg_dw_maxtemp` varchar(25) DEFAULT NULL COMMENT '最高温度',
  `tpg_dw_mintemp` varchar(25) DEFAULT NULL COMMENT '最低温度',
  `tpg_dw_report` varchar(50) DEFAULT NULL COMMENT '上报间隔',
  `tpg_dw_read` varchar(50) DEFAULT NULL COMMENT '记录间隔',
  `tpg_dw_starttime` varchar(25) DEFAULT NULL COMMENT '开始时间(毫秒)',
  `tpg_dw_endtime` varchar(25) DEFAULT NULL COMMENT '结束时间(毫秒)',
  `tpg_dw_highttemp` varchar(25) DEFAULT NULL COMMENT '温度上限',
  `tpg_dw_lowtemp` varchar(25) DEFAULT NULL COMMENT '温度下限',
  `tpg_bind_status` tinyint(1) DEFAULT '1' COMMENT '绑定状态 1.默认 2.绑定成功 3.绑定异常',
  PRIMARY KEY (`tpg_id`),
  KEY `tpg_to_id` (`tpg_to_id`),
  KEY `tpg_gdnumber` (`tpg_gdnumber`),
  KEY `idx_create_time` (`tpg_createtime`),
  KEY `idx_status` (`tpg_bind_status`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为温度报告表';

-- ----------------------------
-- Table structure for tms_dw_warning_config
-- ----------------------------
DROP TABLE IF EXISTS `tms_dw_warning_config`;
CREATE TABLE `tms_dw_warning_config` (
  `tms_dw_wcid` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dw_wc_cuid` int(11) NOT NULL COMMENT '客户id',
  `tms_dw_wc_cuname` varchar(255) NOT NULL COMMENT '客户名称',
  `tms_dw_wc_key` varchar(255) NOT NULL COMMENT '企业微信群key',
  `tms_dw_wc_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常  2删除',
  PRIMARY KEY (`tms_dw_wcid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_dwt_distribution_results
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_distribution_results`;
CREATE TABLE `tms_dwt_distribution_results` (
  `tms_dwt_dr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_dr_deviceid` varchar(255) NOT NULL COMMENT '温度计序列号',
  `tms_dwt_dr_time` int(11) NOT NULL COMMENT '推送时间',
  `tms_dwt_dr_type` int(4) DEFAULT NULL COMMENT '下发类型',
  `tms_dwt_dr_result` int(11) DEFAULT NULL COMMENT '下发结果',
  `tms_dwt_dr_params` longtext COMMENT '下发参数',
  `tms_dwt_dr_createtime` int(11) NOT NULL COMMENT '记录创建时间',
  `tms_dwt_dr_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  PRIMARY KEY (`tms_dwt_dr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为下发结果推送';

-- ----------------------------
-- Table structure for tms_dwt_flight_mode
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_flight_mode`;
CREATE TABLE `tms_dwt_flight_mode` (
  `tms_dwt_fm_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_fm_deviceid` varchar(255) NOT NULL COMMENT '鼎为编号',
  `tms_dwt_fm_time` int(11) NOT NULL COMMENT '鼎为推送时间',
  `tms_dwt_fm_status` varchar(25) DEFAULT NULL COMMENT '飞行状态 1正常 2即将进入发下模式 3飞行模式中',
  `tms_dwt_fm_status_time` int(11) DEFAULT '0' COMMENT '飞行状态时间',
  `tms_dwt_fm_createtime` int(11) NOT NULL COMMENT '记录添加时间',
  `tms_dwt_fm_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1.正常 2删除',
  PRIMARY KEY (`tms_dwt_fm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为推送飞行模式记录';

-- ----------------------------
-- Table structure for tms_dwt_off_line
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_off_line`;
CREATE TABLE `tms_dwt_off_line` (
  `tms_dwt_ol_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_ol_deviceid` varchar(255) NOT NULL COMMENT '温度计序列号',
  `tms_dwt_ol_time` int(11) NOT NULL COMMENT '推送时间',
  `tms_dwt_ol_createtime` int(11) NOT NULL COMMENT '记录创建时间',
  `tms_dwt_ol_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `tms_dwt_ol_lastreporttime` int(11) DEFAULT NULL COMMENT '设备最后上报时间',
  `tms_dwt_ol_vol` int(4) DEFAULT '0' COMMENT '电量',
  `tms_dwt_ol_signal` int(4) DEFAULT '0' COMMENT '信号强度',
  `tms_dwt_ol_lnglat` varchar(255) DEFAULT NULL COMMENT '位置坐标',
  `tms_dwt_ol_desc` varchar(255) DEFAULT NULL COMMENT '位置描述',
  `tms_dwt_ol_wcstatus` int(4) DEFAULT '1' COMMENT '离线推送 1.未推送 2已推送',
  PRIMARY KEY (`tms_dwt_ol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为离线推送';

-- ----------------------------
-- Table structure for tms_dwt_offline_remark
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_offline_remark`;
CREATE TABLE `tms_dwt_offline_remark` (
  `tms_dwt_olr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_ol_id` int(11) NOT NULL COMMENT '离线记录id',
  `tms_dwt_olr_remark` text COMMENT '备注内容',
  `tms_dwt_olr_createuid` int(11) NOT NULL COMMENT '备注创建人id',
  `tms_dwt_olr_createname` varchar(255) NOT NULL COMMENT '备注创建人',
  `tms_dwt_olr_createtime` int(11) NOT NULL COMMENT '创建时间',
  `tms_dwt_olr_visible` int(4) DEFAULT '1' COMMENT '状态 1正常  2.删除',
  PRIMARY KEY (`tms_dwt_olr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为离线推送备注表';

-- ----------------------------
-- Table structure for tms_dwt_power_off
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_power_off`;
CREATE TABLE `tms_dwt_power_off` (
  `tms_dwt_pof_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_pof_deviceid` varchar(255) NOT NULL COMMENT '温度计序列号',
  `tms_dwt_pof_time` int(11) NOT NULL COMMENT '推送时间',
  `tms_dwt_pof_unbindtime` int(11) DEFAULT NULL COMMENT '关机时间',
  `tms_dwt_pof_bindtime` int(11) DEFAULT NULL COMMENT '开机时间',
  `tms_dwt_pof_unbindtype` int(4) DEFAULT NULL COMMENT '关机类型',
  `tms_dwt_pof_lnglat` varchar(255) DEFAULT NULL COMMENT '坐标',
  `tms_dwt_pof_desc` varchar(255) DEFAULT NULL COMMENT '位置描述',
  `tms_dwt_pof_createtime` int(11) NOT NULL COMMENT '记录创建时间',
  `tms_dwt_pof_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1.正常 2.删除',
  PRIMARY KEY (`tms_dwt_pof_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为关机推送表';

-- ----------------------------
-- Table structure for tms_dwt_power_on
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_power_on`;
CREATE TABLE `tms_dwt_power_on` (
  `tms_dwt_pon_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_pon_deviceid` varchar(255) NOT NULL COMMENT '温度计编号',
  `tms_dwt_pon_bindtime` int(11) DEFAULT NULL COMMENT '开机时间',
  `tms_dwt_pon_lnglat` varchar(255) DEFAULT NULL COMMENT '温度计坐标点',
  `tms_dwt_pon_desc` varchar(255) DEFAULT NULL COMMENT '位置描述',
  `tms_dwt_pon_time` int(11) NOT NULL COMMENT '数据推送时间',
  `tms_dwt_pon_createtime` int(11) NOT NULL COMMENT '记录创建时间',
  `tms_dwt_pon_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  PRIMARY KEY (`tms_dwt_pon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为推送开机日志';

-- ----------------------------
-- Table structure for tms_dwt_quantity_electricity
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_quantity_electricity`;
CREATE TABLE `tms_dwt_quantity_electricity` (
  `tms_dwt_qe_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_qe_deviceid` varchar(255) NOT NULL COMMENT '温度计序列号',
  `tms_dwt_qe_time` int(11) NOT NULL COMMENT '电量数据推送时间',
  `tms_dwt_qe_val` varchar(255) DEFAULT NULL COMMENT '电量值',
  `tms_dwt_qe_val_time` int(11) DEFAULT NULL COMMENT '获取设备电量时间',
  `tms_dwt_qe_createtime` int(11) NOT NULL COMMENT '记录创建时间',
  `tms_dwt_qe_visible` int(11) NOT NULL DEFAULT '1' COMMENT '状态  1正常 2删除',
  `tms_dwt_qe_wcstatus` int(4) DEFAULT '1' COMMENT '微信消息推送状态 1未推送 2已推送',
  PRIMARY KEY (`tms_dwt_qe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为推送电量数据表';

-- ----------------------------
-- Table structure for tms_dwt_remark
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_remark`;
CREATE TABLE `tms_dwt_remark` (
  `tdr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `tdr_to_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联订单id',
  `tdr_to_no` varchar(30) NOT NULL DEFAULT '' COMMENT '订单编号',
  `tdr_gdnumber` varchar(30) NOT NULL DEFAULT '' COMMENT '温度计编号',
  `tdr_type` int(4) NOT NULL DEFAULT '6' COMMENT '1.预警 2.报警 3.电量 4.离线 5 app检查 6.其他',
  `tdr_remark` text COMMENT '备注内容',
  `tdr_create_name` varchar(25) NOT NULL DEFAULT '' COMMENT '创建人',
  `tdr_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `create_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '删除时间',
  `tdr_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tdr_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2 删除',
  PRIMARY KEY (`tdr_id`),
  KEY `idx_tdr_to_id` (`tdr_to_id`) USING BTREE COMMENT '订单id',
  KEY `idx_tdr_gdnumber` (`tdr_gdnumber`) USING BTREE COMMENT '温度计编号'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为异常备注';

-- ----------------------------
-- Table structure for tms_dwt_th_alarm
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_th_alarm`;
CREATE TABLE `tms_dwt_th_alarm` (
  `tms_dwt_tha_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_tha_deviceid` varchar(255) NOT NULL COMMENT '温度计编号',
  `tms_dwt_tha_time` int(11) NOT NULL COMMENT '鼎为推送时间',
  `tms_dwt_tha_val` varchar(255) DEFAULT NULL COMMENT '温度和湿度',
  `tms_dwt_tha_alarmstatus` varchar(255) DEFAULT NULL COMMENT '温度状态',
  `tms_dwt_tha_sbtime` int(11) DEFAULT NULL COMMENT '设备上报时间',
  `tms_dwt_tha_probestatus` varchar(255) DEFAULT NULL COMMENT '探头状态',
  `tms_dwt_tha_lnglat` varchar(255) DEFAULT NULL COMMENT '设备位置信息',
  `tms_dwt_tha_desc` varchar(255) DEFAULT NULL COMMENT '设备位置描述',
  `tms_dwt_tha_createtime` int(11) NOT NULL COMMENT '记录创建时间',
  `tms_dwt_tha_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `tms_dwt_tha_wcstatus` int(4) DEFAULT '1' COMMENT '微信消息推送 1.未推送 2.已推送',
  PRIMARY KEY (`tms_dwt_tha_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为超温报警';

-- ----------------------------
-- Table structure for tms_dwt_th_warning
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_th_warning`;
CREATE TABLE `tms_dwt_th_warning` (
  `tms_dwt_thw_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_thw_deviceid` varchar(255) NOT NULL COMMENT '温度计编号',
  `tms_dwt_thw_time` int(11) NOT NULL COMMENT '鼎为推送时间',
  `tms_dwt_thw_type` int(4) DEFAULT NULL COMMENT '预警类型',
  `tms_dwt_thw_sbtime` int(11) DEFAULT NULL COMMENT '设备采集时间',
  `tms_dwt_thw_val` varchar(255) DEFAULT NULL COMMENT '温度湿度值',
  `tms_dwt_thw_sbstatus` int(4) DEFAULT NULL COMMENT '报警类型',
  `tms_dwt_thw_lnglat` varchar(255) DEFAULT NULL COMMENT '位置信息',
  `tms_dwt_thw_desc` varchar(255) DEFAULT NULL COMMENT '位置描述',
  `tms_dwt_thw_createtime` int(11) NOT NULL COMMENT '记录创建时间',
  `tms_dwt_thw_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常  2删除',
  `tms_dwt_thw_wcstatus` int(4) DEFAULT '1' COMMENT '微信推送 1.未推送  2.已推送',
  PRIMARY KEY (`tms_dwt_thw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为预警推送';

-- ----------------------------
-- Table structure for tms_dwt_wcmessage_log
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_wcmessage_log`;
CREATE TABLE `tms_dwt_wcmessage_log` (
  `tms_dwt_wl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_wl_deviceid` varchar(255) NOT NULL COMMENT '温度计序列号',
  `tms_dwt_wl_to_id` int(11) NOT NULL COMMENT '关联订单id',
  `tms_dwt_wl_to_no` varchar(80) DEFAULT NULL COMMENT '订单编号',
  `tms_dwt_wl_cu_id` int(11) DEFAULT NULL COMMENT '客户id',
  `tms_dwt_wl_cu_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `tms_dwt_wl_temp_name` varchar(255) DEFAULT NULL COMMENT '温度区间',
  `tms_dwt_wl_hygrometer_range` varchar(255) DEFAULT NULL COMMENT '湿度区间',
  `tms_dwt_wl_remark` varchar(255) DEFAULT NULL COMMENT '推送内容',
  `tms_dwt_wl_type` int(4) NOT NULL COMMENT '推送类型 1.预警 2.报警  3.电量  4.离线，5APP检查',
  `tms_dwt_wl_time` int(11) DEFAULT NULL COMMENT '推送时间',
  `tms_dwt_wl_visible` int(4) DEFAULT '1' COMMENT '状态 1.正常 2.删除',
  `tms_dwt_wl_carea_id` int(11) NOT NULL DEFAULT '0' COMMENT '大区id',
  `tms_dwt_wl_carea_name` varchar(255) NOT NULL DEFAULT '' COMMENT '大区名称',
  `tms_dwt_wl_uids` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人id',
  `tms_dwt_wl_unames` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人名称',
  PRIMARY KEY (`tms_dwt_wl_id`),
  KEY `idx_tms_dwt_wl_deviceid` (`tms_dwt_wl_deviceid`) USING BTREE COMMENT '设备号',
  KEY `idx_tms_dwt_wl_to_id` (`tms_dwt_wl_to_id`) USING BTREE COMMENT '订单id'
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为推送日志表';

-- ----------------------------
-- Table structure for tms_dwt_wcml_remark
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwt_wcml_remark`;
CREATE TABLE `tms_dwt_wcml_remark` (
  `tms_dwt_wlr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_dwt_wl_id` int(11) NOT NULL COMMENT '鼎为推送消息id',
  `tms_dwt_wlr_remark` text COMMENT '鼎为推送消息备注内容',
  `tms_dwt_wlr_createuid` int(11) NOT NULL COMMENT '创建人id',
  `tms_dwt_wlr_createname` varchar(255) NOT NULL COMMENT '创建人',
  `tms_dwt_wlr_createtime` int(11) NOT NULL COMMENT '创建时间',
  `tms_dwt_wlr_visible` int(11) NOT NULL DEFAULT '1' COMMENT '状态 1.正常 2.删除',
  PRIMARY KEY (`tms_dwt_wlr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为推送日志备注表';

-- ----------------------------
-- Table structure for tms_dwyc
-- ----------------------------
DROP TABLE IF EXISTS `tms_dwyc`;
CREATE TABLE `tms_dwyc` (
  `tms_dwyc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tms_dwyc_toid` int(11) NOT NULL COMMENT '异常订单id',
  `tms_dwyc_tono` varchar(255) NOT NULL COMMENT '异常订单编号',
  `tms_dwyc_gdseries_number` varchar(255) NOT NULL COMMENT '异常鼎为温度计编号',
  `tms_dwyc_remark` text COMMENT '异常备注',
  `tms_dwyc_createtime` int(11) NOT NULL COMMENT '备注添加时间',
  `tms_dwyc_type` int(4) NOT NULL DEFAULT '1' COMMENT '异常类型 1.异常  2.关机',
  PRIMARY KEY (`tms_dwyc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_epidemic_area
-- ----------------------------
DROP TABLE IF EXISTS `tms_epidemic_area`;
CREATE TABLE `tms_epidemic_area` (
  `ea_id` int(11) NOT NULL AUTO_INCREMENT,
  `ea_region_name` varchar(100) NOT NULL COMMENT '城市名称',
  `ea_region_id` int(11) NOT NULL COMMENT '城市id',
  `ea_visible` int(4) NOT NULL COMMENT '状态 1.正常  2.删除',
  `ea_status` int(4) NOT NULL COMMENT '风险等级 1.中风险 2.高风险',
  PRIMARY KEY (`ea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8mb4 COMMENT='疫情风险地区表';

-- ----------------------------
-- Table structure for tms_epidemic_area_remark
-- ----------------------------
DROP TABLE IF EXISTS `tms_epidemic_area_remark`;
CREATE TABLE `tms_epidemic_area_remark` (
  `ear_id` int(11) NOT NULL AUTO_INCREMENT,
  `ear_createuid` int(11) NOT NULL COMMENT '创建人id',
  `ear_createname` varchar(100) NOT NULL COMMENT '创建人',
  `ear_createtime` int(11) NOT NULL COMMENT '创建时间',
  `ear_remark` text COMMENT '日志内容',
  PRIMARY KEY (`ear_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_exception_handling
-- ----------------------------
DROP TABLE IF EXISTS `tms_exception_handling`;
CREATE TABLE `tms_exception_handling` (
  `tms_ehp_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_ehp_grade` int(11) NOT NULL COMMENT '异常等级',
  `tms_ehp_type` varchar(255) NOT NULL COMMENT '异常类型',
  `tms_ehp_summary` varchar(255) DEFAULT NULL COMMENT '异常概述',
  `tms_ehp_solution` text NOT NULL COMMENT '异常解决方案',
  `tms_ehp_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态： 1.正常 2.删除',
  `tms_ehp_createtime` int(11) NOT NULL COMMENT '创建时间',
  `tms_ehp_createuid` int(11) NOT NULL COMMENT '异常处理流程创建人id',
  `tms_ehp_createname` varchar(255) NOT NULL COMMENT '异常处理流程创建人',
  `tms_ehp_lasttime` int(11) NOT NULL COMMENT '最后修改时间',
  `tms_ehp_lastuid` int(11) NOT NULL COMMENT '最后修改人id',
  `tms_ehp_lastname` varchar(255) NOT NULL COMMENT '最后修改人',
  PRIMARY KEY (`tms_ehp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_fahuo_receipt_detail
-- ----------------------------
DROP TABLE IF EXISTS `tms_fahuo_receipt_detail`;
CREATE TABLE `tms_fahuo_receipt_detail` (
  `frd_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `fr_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发货记录id',
  `to_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '订单id',
  `to_no` varchar(50) NOT NULL DEFAULT '' COMMENT '订单编号',
  `di_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '调度单号',
  `di_no` varchar(50) NOT NULL DEFAULT '' COMMENT '调度单号',
  `frd_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1 正常 2删除',
  PRIMARY KEY (`frd_id`),
  KEY `idx_to_id` (`to_id`),
  KEY `idx_fr_id` (`fr_id`),
  KEY `idx_di_id` (`di_id`)
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=utf8mb4 COMMENT='发货记录明细';

-- ----------------------------
-- Table structure for tms_fahuo_receipt_no
-- ----------------------------
DROP TABLE IF EXISTS `tms_fahuo_receipt_no`;
CREATE TABLE `tms_fahuo_receipt_no` (
  `fr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `fr_receipt_no` varchar(50) DEFAULT '' COMMENT '发货单号',
  `fr_uid` int(11) DEFAULT NULL COMMENT '发货人ID',
  `fr_username` varchar(50) DEFAULT NULL COMMENT '发货人名字',
  `fr_fahuo_time` int(11) DEFAULT NULL COMMENT '发货时间',
  `fr_fahuo_station` varchar(30) DEFAULT NULL COMMENT '发货站点',
  `to_nos` varchar(800) DEFAULT NULL,
  `di_ids` varchar(800) DEFAULT NULL,
  `fr_create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `fr_lastupd_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `fr_create_uid` int(11) DEFAULT NULL COMMENT '创建人ID',
  `fr_create_username` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `sup_name` varchar(80) DEFAULT NULL COMMENT '供应商名称',
  `su_id` int(11) DEFAULT NULL COMMENT '供应商ID',
  `ro_id` int(11) DEFAULT NULL COMMENT '路由ID',
  `ro_name` varchar(50) DEFAULT NULL COMMENT '路由名称',
  `rt_id` int(11) DEFAULT NULL COMMENT '路由类型',
  PRIMARY KEY (`fr_id`),
  KEY `fr_create_uid` (`fr_create_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=539 DEFAULT CHARSET=utf8mb4 COMMENT='月结发货费单号填写';

-- ----------------------------
-- Table structure for tms_generatekill_attachment
-- ----------------------------
DROP TABLE IF EXISTS `tms_generatekill_attachment`;
CREATE TABLE `tms_generatekill_attachment` (
  `tga_id` int(11) NOT NULL AUTO_INCREMENT,
  `tga_to_id` int(11) NOT NULL COMMENT '订单id',
  `tga_file_name` varchar(255) NOT NULL COMMENT '文件名称',
  `tga_file_filepath` varchar(1024) NOT NULL COMMENT '文件路径',
  `tga_visible` int(4) NOT NULL DEFAULT '1' COMMENT '文件状态  1.正常  2删除',
  `tga_signature_status` int(11) NOT NULL DEFAULT '1' COMMENT '签章状态  1未签章 2已签章',
  `tga_createtime` int(11) NOT NULL COMMENT '创建时间',
  `tga_ow_id` int(11) NOT NULL COMMENT '工作单ID',
  PRIMARY KEY (`tga_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_group_remark_log
-- ----------------------------
DROP TABLE IF EXISTS `tms_group_remark_log`;
CREATE TABLE `tms_group_remark_log` (
  `tgr_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tgr_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '日志操作人id',
  `tgr_create_name` varchar(100) NOT NULL DEFAULT '' COMMENT '操作人',
  `tgr_remark` text,
  `tgr_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tgr_subtype` int(11) NOT NULL DEFAULT '0' COMMENT '日志类型',
  `tgr_identifier` int(11) NOT NULL DEFAULT '0' COMMENT '关联分组id',
  `tgr_type` int(11) NOT NULL DEFAULT '0' COMMENT '日志大类',
  `tgr_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  PRIMARY KEY (`tgr_id`),
  KEY `idx_tgr_identifier` (`tgr_identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8mb4 COMMENT='客服分组日志';

-- ----------------------------
-- Table structure for tms_jpush_record
-- ----------------------------
DROP TABLE IF EXISTS `tms_jpush_record`;
CREATE TABLE `tms_jpush_record` (
  `jr_id` int(11) NOT NULL AUTO_INCREMENT,
  `jr_create_time` int(11) DEFAULT NULL COMMENT '推送创建时间',
  `jr_status` int(11) DEFAULT NULL COMMENT '推送状态',
  `msg_id` varchar(50) DEFAULT NULL COMMENT '推送消息ID',
  `alias` varchar(50) DEFAULT NULL COMMENT '用别名来标识一个用户',
  `registration_id` varchar(50) DEFAULT NULL COMMENT '设备标识',
  `ur_uid` int(11) DEFAULT NULL COMMENT '推送人用户ID',
  `jr_is_read` tinyint(4) DEFAULT '0' COMMENT '0未看，1已看',
  `jr_read_time` int(11) DEFAULT '0' COMMENT '已看时间',
  `jr_jpush_msg` varchar(1000) DEFAULT NULL COMMENT '提示消息',
  `jr_jpush_show_msg` varchar(500) DEFAULT NULL COMMENT '消息展示信息',
  `jr_type` int(11) DEFAULT '0' COMMENT '消息类型',
  PRIMARY KEY (`jr_id`),
  KEY `alias` (`alias`),
  KEY `ur_uid` (`ur_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=600 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_jpush_user
-- ----------------------------
DROP TABLE IF EXISTS `tms_jpush_user`;
CREATE TABLE `tms_jpush_user` (
  `jp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '极光推送服务表',
  `ur_uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `registration_id` varchar(100) DEFAULT NULL COMMENT '客户端集成极光推送的ID',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `jp_visible` tinyint(3) DEFAULT '1' COMMENT '0删除，1正常',
  `lastupd_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `ur_account` varchar(30) DEFAULT NULL COMMENT '账号信息，用于设置极光别名alias',
  PRIMARY KEY (`jp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_lj_inventory
-- ----------------------------
DROP TABLE IF EXISTS `tms_lj_inventory`;
CREATE TABLE `tms_lj_inventory` (
  `tms_ljinv_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '盘点id',
  `tms_ljinv_name` varchar(255) DEFAULT NULL COMMENT '盘点名称',
  `tms_ljinv_start_time` int(11) NOT NULL DEFAULT '0' COMMENT '盘点开始时间',
  `tms_ljinv_end_time` int(11) DEFAULT '0' COMMENT '盘点结束时间',
  `tms_ljinv_create_uid` int(11) NOT NULL COMMENT '盘点创建人',
  `tms_ljinv_create_name` varchar(255) NOT NULL COMMENT '盘点创建人',
  `tms_ljinv_status` int(11) NOT NULL DEFAULT '0' COMMENT '盘点状态 0开始  1暂停  2 结束',
  PRIMARY KEY (`tms_ljinv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_lj_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `tms_lj_inventory_detail`;
CREATE TABLE `tms_lj_inventory_detail` (
  `tms_ljinvd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '盘点明细id',
  `tms_ljinvd_tono` varchar(255) NOT NULL COMMENT '盘点订单编号',
  `tms_ljinvd_status` int(4) DEFAULT '0' COMMENT '盘点状态 0正常  1.有单无货 2.状态异常 3.有货无单',
  `tms_ljinv_id` int(11) NOT NULL COMMENT '盘点id',
  `tms_ljinvd_to_status` int(11) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`tms_ljinvd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_logistics_node
-- ----------------------------
DROP TABLE IF EXISTS `tms_logistics_node`;
CREATE TABLE `tms_logistics_node` (
  `tn_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `to_id` int(11) unsigned NOT NULL COMMENT '运输单序号',
  `tn_status` tinyint(1) DEFAULT '0' COMMENT '最新调度单状态 4:待发货 0:已发货',
  `start_region_id` int(11) DEFAULT '0' COMMENT '出港城市id',
  `stop_region_id` int(11) DEFAULT '0' COMMENT '入港城市id',
  `start_trans_time` int(10) DEFAULT '0' COMMENT '出港时间',
  `stop_trans_time` int(10) DEFAULT '0' COMMENT '入港时间',
  PRIMARY KEY (`tn_id`),
  UNIQUE KEY `idx_unique_index` (`to_id`),
  KEY `idx_status` (`tn_status`),
  KEY `idx_start_id` (`start_region_id`),
  KEY `idx_stop_id` (`stop_region_id`),
  KEY `idx_start_time` (`start_trans_time`),
  KEY `idx_stop_time` (`stop_trans_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3474 DEFAULT CHARSET=utf8mb4 COMMENT='订单物流最新调度信息';

-- ----------------------------
-- Table structure for tms_logistics_remark
-- ----------------------------
DROP TABLE IF EXISTS `tms_logistics_remark`;
CREATE TABLE `tms_logistics_remark` (
  `lr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `lr_to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `lr_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作城市id',
  `lr_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作城市',
  `lr_opn_date` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `lr_log` text COMMENT '操作备注',
  `lr_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '操作时间',
  `lr_opn_user` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人',
  `lr_createname` varchar(25) NOT NULL DEFAULT '' COMMENT '记录创建人',
  `lr_createuid` int(11) NOT NULL DEFAULT '0' COMMENT '记录创建人id',
  `lr_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1 正常  2删除',
  `lr_source` int(4) NOT NULL DEFAULT '1' COMMENT '操作平台 1 oms  2 app',
  `lr_type` int(4) NOT NULL DEFAULT '1' COMMENT '操作类型  1 确认  2 取件 3 发货 4 提货 5 派件 ',
  PRIMARY KEY (`lr_id`),
  KEY `idx_lr_to_id` (`lr_to_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1520 DEFAULT CHARSET=utf8mb4 COMMENT='物流节点日志';

-- ----------------------------
-- Table structure for tms_material_plan_config
-- ----------------------------
DROP TABLE IF EXISTS `tms_material_plan_config`;
CREATE TABLE `tms_material_plan_config` (
  `omc_id` int(11) NOT NULL AUTO_INCREMENT,
  `omc_tem_name` varchar(50) DEFAULT NULL COMMENT '温度区间',
  `omc_tem_id` int(11) DEFAULT NULL COMMENT '温度id',
  `omc_regionname_list` text COMMENT '城市列表',
  `omc_regionid_list` text COMMENT '城市列表id',
  `omc_start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `omc_stop_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `omc_remark` text COMMENT '备注',
  `omc_type` int(4) DEFAULT '1' COMMENT '类型 1普通配置 2特殊配置',
  `omc_visible` int(4) DEFAULT '1' COMMENT '状态 1正常 2.删除',
  `omc_createname` varchar(50) DEFAULT NULL COMMENT '创建人',
  `omc_createuid` int(11) DEFAULT NULL COMMENT '创建人id',
  `omc_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `omc_lastuptime` int(11) DEFAULT NULL COMMENT '最后修改时间',
  `omc_lastupname` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `omc_lastupuid` int(11) DEFAULT NULL COMMENT '最后修改人id',
  PRIMARY KEY (`omc_id`),
  KEY `omc_id` (`omc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COMMENT='计划箱型配置';

-- ----------------------------
-- Table structure for tms_material_plan_config_detail
-- ----------------------------
DROP TABLE IF EXISTS `tms_material_plan_config_detail`;
CREATE TABLE `tms_material_plan_config_detail` (
  `omcd_id` int(11) NOT NULL AUTO_INCREMENT,
  `omc_id` int(11) DEFAULT NULL,
  `omcd_sto_id` int(11) DEFAULT NULL COMMENT '存货id',
  `omcd_sto_name` varchar(255) DEFAULT NULL COMMENT '存货名称',
  `omcd_visible` int(4) DEFAULT '1' COMMENT '状态 1正常 2删除',
  PRIMARY KEY (`omcd_id`),
  KEY `omc_id` (`omc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1146 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_material_plan_recommend
-- ----------------------------
DROP TABLE IF EXISTS `tms_material_plan_recommend`;
CREATE TABLE `tms_material_plan_recommend` (
  `tms_mpr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tms_mpr_to_id` int(11) NOT NULL COMMENT '关联订单to_id',
  `tms_mpr_result` json DEFAULT NULL COMMENT '计划箱型内容',
  `tms_mpr_post` json DEFAULT NULL COMMENT '请求参数',
  `tms_mpr_visible` int(2) NOT NULL DEFAULT '1' COMMENT '1正常 2删除',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '删除时间',
  PRIMARY KEY (`tms_mpr_id`),
  KEY `idx_tms_mpr_to_id` (`tms_mpr_to_id`) USING BTREE COMMENT '订单id'
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COMMENT='计划箱型推荐记录';

-- ----------------------------
-- Table structure for tms_merge_order_check
-- ----------------------------
DROP TABLE IF EXISTS `tms_merge_order_check`;
CREATE TABLE `tms_merge_order_check` (
  `tmoc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '合单符合id',
  `tmoc_to_no` varchar(10) DEFAULT NULL COMMENT '运输单号',
  `tmoc_to_id` int(11) DEFAULT NULL COMMENT '运输单ID',
  `tmoc_operation_uid` int(11) DEFAULT NULL COMMENT '操作员ID',
  `tmoc_operation_name` varchar(25) DEFAULT '' COMMENT '操作员名字',
  `tmoc_check_uid` int(11) DEFAULT NULL COMMENT '复核人ID',
  `tmoc_check_name` varchar(25) DEFAULT '' COMMENT '复核人名字',
  `tmoc_check_time` int(11) DEFAULT NULL COMMENT '符合时间',
  `tmoc_ispass` int(11) DEFAULT NULL COMMENT '1:通过，2：不通过',
  `tmoc_remark` varchar(255) DEFAULT '' COMMENT '备注',
  `tmoc_quantity` varchar(10) DEFAULT '' COMMENT '确认发货数量',
  PRIMARY KEY (`tmoc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COMMENT='合单检查复核表';

-- ----------------------------
-- Table structure for tms_mf_noshipadd
-- ----------------------------
DROP TABLE IF EXISTS `tms_mf_noshipadd`;
CREATE TABLE `tms_mf_noshipadd` (
  `tms_mf_noshipid` int(11) NOT NULL AUTO_INCREMENT,
  `tms_mf_supplier` varchar(255) NOT NULL COMMENT '供应商名称',
  `tms_mf_suid` int(11) NOT NULL COMMENT '供应商id',
  `tms_mf_total` float(10,2) NOT NULL COMMENT '总金额',
  `tms_mf_start_time` int(11) NOT NULL COMMENT '发货开始时间',
  `tms_mf_stop_time` int(11) NOT NULL COMMENT '发货结束时间',
  `tms_mf_stop_region` varchar(100) NOT NULL COMMENT '到货城市',
  `tms_mf_stop_rgid` int(11) NOT NULL COMMENT '到货城市id',
  `tms_mf_createtime` int(11) DEFAULT NULL COMMENT '导入时间',
  `tms_mf_createname` varchar(255) DEFAULT NULL COMMENT '导入人',
  `tms_mf_createuid` int(11) DEFAULT NULL COMMENT '导入人id',
  `tms_mf_createday` varchar(25) DEFAULT NULL COMMENT '导入天',
  PRIMARY KEY (`tms_mf_noshipid`),
  KEY `tms_mf_stop_rgid` (`tms_mf_stop_rgid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_mf_shipnoadd
-- ----------------------------
DROP TABLE IF EXISTS `tms_mf_shipnoadd`;
CREATE TABLE `tms_mf_shipnoadd` (
  `tms_mf_shipid` int(11) NOT NULL AUTO_INCREMENT,
  `tms_mf_shipno` varchar(100) NOT NULL COMMENT '发货单号',
  `tms_mf_total` float(10,2) NOT NULL COMMENT '金额',
  `tms_mf_createuid` int(11) DEFAULT NULL COMMENT '导入人id',
  `tms_mf_createname` varchar(255) DEFAULT NULL COMMENT '导入人',
  `tms_mf_createtime` int(11) DEFAULT NULL COMMENT '导入时间',
  `tms_mf_createday` varchar(50) DEFAULT NULL COMMENT '导入天',
  `tms_mf_carriers_name` varchar(255) DEFAULT NULL COMMENT '物流承运商',
  `tms_mf_send_month` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`tms_mf_shipid`),
  KEY `tms_mf_shipno` (`tms_mf_shipno`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_notfilled_spfee_record
-- ----------------------------
DROP TABLE IF EXISTS `tms_notfilled_spfee_record`;
CREATE TABLE `tms_notfilled_spfee_record` (
  `nsr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '未审批记录ID',
  `nsr_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  `nsr_lastupdtime` int(11) DEFAULT NULL COMMENT '最后一次修改时间',
  `ur_uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `nsr_split_data` text COMMENT '提交json数据打包',
  `nsr_visible` tinyint(1) DEFAULT '1' COMMENT '1:正常，0删除',
  PRIMARY KEY (`nsr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_nucleic_acid
-- ----------------------------
DROP TABLE IF EXISTS `tms_nucleic_acid`;
CREATE TABLE `tms_nucleic_acid` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `to_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `type` tinyint(1) NOT NULL COMMENT '服务类型，1:人员核酸, 4:人员抗体',
  `operation_type` tinyint(1) NOT NULL COMMENT '操作类型， 1:取件人员, 2:派件人员',
  `time_limit` tinyint(1) NOT NULL COMMENT '订单核酸时效 1:48H，2:72H，3:7天',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1:未指派，2:待完成，3:已完成',
  `operator_uid` varchar(120) DEFAULT '' COMMENT '操作',
  `operator_username` varchar(220) DEFAULT '' COMMENT '操作人名',
  `assign_uid` int(11) DEFAULT '0' COMMENT '指派人id',
  `assign_username` varchar(8) DEFAULT '' COMMENT '指派人',
  `assign_time` int(10) DEFAULT '0' COMMENT '指派时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `sampling_time` int(10) DEFAULT '0' COMMENT '核酸最早采样时间',
  `natr_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作员核酸报告，关联tms_nucleic_acid_testing_report表',
  `visible` tinyint(1) DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  PRIMARY KEY (`id`),
  KEY `idx_to_id` (`to_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=783 DEFAULT CHARSET=utf8mb4 COMMENT='核酸检测服务';

-- ----------------------------
-- Table structure for tms_nucleic_acid_base
-- ----------------------------
DROP TABLE IF EXISTS `tms_nucleic_acid_base`;
CREATE TABLE `tms_nucleic_acid_base` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `to_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `nucleic_acid_pick` tinyint(1) NOT NULL DEFAULT '0' COMMENT '人员核酸取件时效 1:48H，2:72H，3:7天',
  `nucleic_acid_delivery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '人员核酸派件时效 1:48H，2:72H，3:7天',
  `antibody_pick` tinyint(1) NOT NULL DEFAULT '0' COMMENT '人员抗体取件时效 1:48H，2:72H，3:7天',
  `antibody_delivery` tinyint(1) NOT NULL DEFAULT '0' COMMENT '人员抗体派件时效 1:48H，2:72H，3:7天',
  `drug` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '药品核酸，1:存在, 0:不存在',
  `package` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '外包装核酸，1:存在, 0:不存在',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '核酸城市',
  `city_name` char(32) NOT NULL DEFAULT '' COMMENT '核酸城市',
  `point` tinyint(3) unsigned DEFAULT '0' COMMENT '点位， 药品点位为默认种类，外包装默认1',
  `is_drug` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有药品信息， 1有，0没有',
  `source_data` varchar(500) DEFAULT '' COMMENT '接口返回的核酸原数据(不包括药品)',
  `update_time` int(10) NOT NULL COMMENT '更新时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `visible` tinyint(1) DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_to_id` (`to_id`),
  KEY `idx_city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='订单核酸基础数据(外包装、药品)';

-- ----------------------------
-- Table structure for tms_nucleic_acid_goods
-- ----------------------------
DROP TABLE IF EXISTS `tms_nucleic_acid_goods`;
CREATE TABLE `tms_nucleic_acid_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `to_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `work_date` date NOT NULL DEFAULT '0000-00-00' COMMENT '工作日期',
  `type` tinyint(1) unsigned NOT NULL COMMENT '服务类型，2:生生外包装, 3:药品, 5:外包装/药品',
  `op_type` tinyint(1) unsigned NOT NULL COMMENT '操作类型，1:取件, 2:派件, 3:中转',
  `city_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '工作单城市',
  `city_name` char(32) NOT NULL COMMENT '城市名称',
  `work_status` tinyint(1) unsigned DEFAULT '1' COMMENT '工作单状态，1:未指派，2:待完成，3:已完成',
  `detect_status` tinyint(1) unsigned DEFAULT '1' COMMENT '检测状态，1:未检测，2:已检测，3:报告已上传',
  `point` tinyint(3) unsigned DEFAULT '0' COMMENT '点位， 药品点位为默认种类，外包装默认1',
  `is_drug` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有药品， 1有，0没有',
  `dr_uid` int(11) DEFAULT '0' COMMENT '指派组长',
  `dr_username` varchar(20) DEFAULT '' COMMENT '指派组长',
  `operator_uid` varchar(120) DEFAULT '' COMMENT '指派操作人',
  `operator_username` varchar(220) DEFAULT '' COMMENT '指派操作人',
  `assign_uid` int(11) DEFAULT '0' COMMENT '指派人id',
  `assign_username` varchar(8) DEFAULT '' COMMENT '指派人',
  `assign_time` int(10) DEFAULT '0' COMMENT '指派时间',
  `detect_time` int(10) DEFAULT '0' COMMENT '检测时间',
  `finish_time` int(10) DEFAULT '0' COMMENT '完成时间',
  `create_time` int(10) NOT NULL COMMENT '创建时间',
  `visible` tinyint(1) DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  PRIMARY KEY (`id`),
  KEY `idx_to_id` (`to_id`),
  KEY `idx_date` (`work_date`),
  KEY `idx_dr_uid` (`dr_uid`),
  KEY `idx_det_time` (`detect_time`),
  KEY `idx_city_id` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='药品外包装核酸检测服务';

-- ----------------------------
-- Table structure for tms_nucleic_acid_testing_report
-- ----------------------------
DROP TABLE IF EXISTS `tms_nucleic_acid_testing_report`;
CREATE TABLE `tms_nucleic_acid_testing_report` (
  `tms_natr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '核酸检测ID',
  `tms_natr_time` int(11) NOT NULL DEFAULT '0' COMMENT '核算检测时间',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '检测人员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '检测人员名字',
  `tms_natr_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tms_natr_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:阴性，2阳性',
  `tms_natr_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:核算检测报告，4是抗体检测报告',
  `tat_ids` varchar(50) NOT NULL DEFAULT '0' COMMENT 'TMS_ATT表里的附件ID',
  PRIMARY KEY (`tms_natr_id`),
  KEY `idx_ur_uid` (`ur_uid`),
  KEY `idx_tat_id` (`tat_ids`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8mb4 COMMENT='核酸检测报告表';

-- ----------------------------
-- Table structure for tms_nucleic_acid_user
-- ----------------------------
DROP TABLE IF EXISTS `tms_nucleic_acid_user`;
CREATE TABLE `tms_nucleic_acid_user` (
  `tncu_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '操作员名字',
  `sg_names` varchar(200) NOT NULL DEFAULT '' COMMENT '操作权限ID',
  `em_mobile_phone` char(16) NOT NULL DEFAULT '0' COMMENT '操作人手机号',
  `tncu_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `tncu_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1正常，0删除',
  `tncu_lastup_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `sg_ids` varchar(50) NOT NULL COMMENT '操作权限ID',
  `ur_region_reach` text NOT NULL COMMENT '操作城市',
  `carea_ids` varchar(50) NOT NULL COMMENT '大区ID',
  PRIMARY KEY (`tncu_id`),
  KEY `idx_uid` (`ur_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='核酸检测人员信息表';

-- ----------------------------
-- Table structure for tms_operation_site
-- ----------------------------
DROP TABLE IF EXISTS `tms_operation_site`;
CREATE TABLE `tms_operation_site` (
  `tops_id` int(11) NOT NULL AUTO_INCREMENT,
  `tops_region_id` int(11) NOT NULL COMMENT '站点城市',
  `tops_name` varchar(255) NOT NULL COMMENT '站点名称',
  `tops_region_name` varchar(255) NOT NULL COMMENT '城市名称',
  `tops_points` longtext COMMENT '站点坐标点',
  `tops_address` varchar(255) NOT NULL COMMENT '站点地址',
  `tops_lat` varchar(255) DEFAULT NULL COMMENT '站点坐标',
  `tops_lng` varchar(255) DEFAULT NULL COMMENT '站点坐标',
  `tops_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `tops_order_opuid` varchar(255) NOT NULL COMMENT '签单负责人uid',
  `tops_order_opname` varchar(255) NOT NULL COMMENT '签单负责人名称',
  `tops_project_opuid` varchar(255) NOT NULL COMMENT '签单订单接收人uid',
  `tops_project_opname` varchar(255) NOT NULL COMMENT '签单订单接收人名称',
  `tops_nucleic_acid` varchar(50) NOT NULL COMMENT '物表核酸检测（1生生外包装 2药品外包装）',
  `tops_carea_id` int(11) NOT NULL COMMENT '大区ID',
  `tops_carea_name` varchar(50) NOT NULL COMMENT '大区名称',
  `tops_province_region_id` int(11) NOT NULL COMMENT '省级id',
  `tops_province_region_name` varchar(50) NOT NULL COMMENT '省级名称',
  `tops_type` int(4) NOT NULL COMMENT '站点类型',
  `tops_number` varchar(50) NOT NULL COMMENT '站点编号',
  PRIMARY KEY (`tops_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_operation_site_user
-- ----------------------------
DROP TABLE IF EXISTS `tms_operation_site_user`;
CREATE TABLE `tms_operation_site_user` (
  `topsu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tops_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作站点id',
  `topsu_phone` varchar(50) NOT NULL COMMENT '手机号',
  `topsu_principal_opuid` int(11) NOT NULL COMMENT '站点负责人uid',
  `topsu_principal_opname` varchar(50) NOT NULL COMMENT '站点负责人名称',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `topsu_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `deleted_at` int(11) NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`topsu_id`),
  KEY `tops_id` (`tops_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COMMENT='操作站点附属表';

-- ----------------------------
-- Table structure for tms_order_grade
-- ----------------------------
DROP TABLE IF EXISTS `tms_order_grade`;
CREATE TABLE `tms_order_grade` (
  `ogr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户等级序号',
  `to_id` int(11) unsigned NOT NULL COMMENT '运输单序号',
  `ogr_cu_important` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户重要性',
  `ogr_cu_grade` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户重要等级',
  `ogr_order_important` tinyint(4) NOT NULL DEFAULT '0' COMMENT '订单重要性',
  `ogr_order_grade` varchar(50) NOT NULL DEFAULT '0' COMMENT '订单重要性等级',
  `ogr_create_username` char(32) NOT NULL DEFAULT '' COMMENT '创建人',
  `ogr_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人ID',
  `ogr_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `to_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源',
  PRIMARY KEY (`ogr_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2735 DEFAULT CHARSET=utf8 COMMENT='订单重要性等级表';

-- ----------------------------
-- Table structure for tms_order_information
-- ----------------------------
DROP TABLE IF EXISTS `tms_order_information`;
CREATE TABLE `tms_order_information` (
  `ti_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单信息序号',
  `to_id` int(11) unsigned NOT NULL COMMENT '运输单序号',
  `ti_visible` tinyint(1) DEFAULT '1' COMMENT '修改状态 1:展示 0:不展示',
  `ti_dispatching_no` varchar(12) DEFAULT '' COMMENT '诺合诺德配货单号',
  `ti_purpose` varchar(25) DEFAULT '' COMMENT '申请目的',
  `sto_batch` varchar(20) DEFAULT '' COMMENT '批号',
  `expiration_date` int(11) DEFAULT '0' COMMENT '失效日期',
  `daqu` int(3) DEFAULT NULL COMMENT '订单大区',
  `ti_thermometer_open_time` int(11) NOT NULL DEFAULT '0' COMMENT '温度计开启时间',
  `worksheet_flag` tinyint(1) DEFAULT '1' COMMENT '1:待标记， 2:取消待标记',
  `ti_checkol_quantity` varchar(255) NOT NULL DEFAULT '' COMMENT '校验货物数量 ',
  `importance` varchar(3) DEFAULT '' COMMENT '重要性',
  `level` tinyint(1) DEFAULT '0' COMMENT '级别',
  `order_group_id` int(10) DEFAULT '0' COMMENT '订单分组id',
  `order_project_member` varchar(200) DEFAULT '' COMMENT '项目组员',
  `principal_uid` int(10) DEFAULT '0' COMMENT '负责人id',
  `principal_name` varchar(10) DEFAULT '0' COMMENT '负责人',
  `temporary_region_name` varchar(50) NOT NULL DEFAULT '' COMMENT '暂存城市',
  `temporary_region_id` int(11) NOT NULL DEFAULT '0' COMMENT '暂存城市id',
  PRIMARY KEY (`ti_id`),
  UNIQUE KEY `idx_unique_index` (`to_id`),
  KEY `idx_dis_no` (`ti_dispatching_no`)
) ENGINE=InnoDB AUTO_INCREMENT=143994 DEFAULT CHARSET=utf8mb4 COMMENT='订单物流信息附加表';

-- ----------------------------
-- Table structure for tms_performance
-- ----------------------------
DROP TABLE IF EXISTS `tms_performance`;
CREATE TABLE `tms_performance` (
  `per_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '绩效序号',
  `carea_id` int(11) unsigned DEFAULT '0' COMMENT '大区序号',
  `ur_id` int(11) unsigned NOT NULL COMMENT '员工id',
  `ur_name` varchar(32) DEFAULT '' COMMENT '员工姓名',
  `ur_group` tinyint(1) DEFAULT '13' COMMENT '员工角色 13 运营操作专员 30运营操作组长 25运营操作主管',
  `ur_region_id` text COMMENT '员工管辖区域id',
  `ur_region_text` text COMMENT '员工管辖区域',
  `ur_work_city_id` varchar(50) DEFAULT NULL COMMENT '员工工作城市id',
  `ur_work_city_text` varchar(50) DEFAULT NULL COMMENT '员工工作城市',
  `per_level` tinyint(1) DEFAULT '3' COMMENT '岗位级别 1 金牌,2 银牌,3 铜牌',
  `per_manage_money` decimal(8,2) DEFAULT '0.00' COMMENT '管理津贴',
  `per_skill_money` decimal(8,2) DEFAULT '0.00' COMMENT '技能津贴',
  `per_car_money` decimal(8,2) DEFAULT '0.00' COMMENT '车管津贴',
  `per_service_money` decimal(8,2) DEFAULT '0.00' COMMENT '增值服务',
  `per_norm_money` decimal(8,2) DEFAULT '0.00' COMMENT '规范操作',
  `per_reward_money` decimal(8,2) DEFAULT '0.00' COMMENT '本月奖励',
  `per_person_money` decimal(8,2) DEFAULT '0.00' COMMENT '计件制绩效',
  `per_month` char(8) NOT NULL COMMENT '月份',
  `per_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `per_state` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0-无效 1-有效',
  `em_mobile_phone` char(11) DEFAULT '' COMMENT '操作员手机号',
  PRIMARY KEY (`per_id`),
  KEY `u_id` (`ur_id`),
  KEY `u_name` (`ur_name`),
  KEY `per_month` (`per_month`),
  KEY `carea_id` (`carea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8mb4 COMMENT='员工操作绩效表';

-- ----------------------------
-- Table structure for tms_project
-- ----------------------------
DROP TABLE IF EXISTS `tms_project`;
CREATE TABLE `tms_project` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cp_id` int(11) unsigned NOT NULL COMMENT '项目id',
  `create_uid` int(11) DEFAULT '0' COMMENT '创建人',
  `create_user` varchar(15) DEFAULT '' COMMENT '创建人名称',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  PRIMARY KEY (`id`),
  KEY `idx_cp_id` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='物流系统-项目配置';

-- ----------------------------
-- Table structure for tms_route_recommend
-- ----------------------------
DROP TABLE IF EXISTS `tms_route_recommend`;
CREATE TABLE `tms_route_recommend` (
  `tms_rr_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tms_rr_result` json DEFAULT NULL COMMENT '计划箱型内容',
  `tms_rr_post` json DEFAULT NULL COMMENT '请求参数',
  `tms_rr_visible` int(2) NOT NULL DEFAULT '1' COMMENT '1正常 2删除',
  `tms_rr_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`tms_rr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COMMENT='路由推荐记录';

-- ----------------------------
-- Table structure for tms_sdeduction
-- ----------------------------
DROP TABLE IF EXISTS `tms_sdeduction`;
CREATE TABLE `tms_sdeduction` (
  `tms_sde_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '扣款id',
  `tms_sde_time` date NOT NULL COMMENT '扣款日期',
  `tms_sde_tono` varchar(255) NOT NULL COMMENT '扣款单号',
  `tms_sde_ghname` varchar(255) NOT NULL COMMENT '供应商名称',
  `tms_sde_money` float(11,2) NOT NULL COMMENT '扣款金额',
  `tms_sde_reason` varchar(255) NOT NULL COMMENT '扣款原因',
  `tms_sde_status` int(4) NOT NULL DEFAULT '1' COMMENT '是否扣款 1.是 2.否',
  `tms_sde_visible` int(4) NOT NULL DEFAULT '1' COMMENT '1.正常 2.删除',
  `tms_sde_type` int(4) NOT NULL DEFAULT '0' COMMENT '扣款类型 1 服务投诉 2 时效延迟 3 车辆不符合标准 4 超温 5 错发 6 其他',
  PRIMARY KEY (`tms_sde_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='供应商扣款表';

-- ----------------------------
-- Table structure for tms_send_check
-- ----------------------------
DROP TABLE IF EXISTS `tms_send_check`;
CREATE TABLE `tms_send_check` (
  `tms_sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_sc_to_id` int(11) NOT NULL COMMENT '订单id',
  `tms_sc_createtime` int(11) DEFAULT NULL COMMENT '复核时间',
  `tms_sc_createuid` int(11) DEFAULT NULL COMMENT '复核人',
  `tms_sc_createname` varchar(255) DEFAULT NULL COMMENT '复核人',
  PRIMARY KEY (`tms_sc_id`),
  KEY `tms_sc_to_id` (`tms_sc_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='派件复核记录表';

-- ----------------------------
-- Table structure for tms_send_check_remark
-- ----------------------------
DROP TABLE IF EXISTS `tms_send_check_remark`;
CREATE TABLE `tms_send_check_remark` (
  `tms_scr_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_scr_to_id` int(11) NOT NULL COMMENT '订单编号',
  `tms_scr_remark` text COMMENT '备注内容',
  `tms_scr_visible` int(4) DEFAULT NULL COMMENT '状态  1正常 2删除',
  `tms_scr_createtime` int(11) DEFAULT NULL COMMENT '备注时间',
  `tms_scr_createuid` int(11) DEFAULT NULL COMMENT '备注人id',
  `tms_scr_createname` varchar(255) DEFAULT NULL COMMENT '备注人',
  PRIMARY KEY (`tms_scr_id`),
  KEY `tms_scr_to_id` (`tms_scr_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='派件复核备注表';

-- ----------------------------
-- Table structure for tms_sign_bill
-- ----------------------------
DROP TABLE IF EXISTS `tms_sign_bill`;
CREATE TABLE `tms_sign_bill` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `to_id` int(11) unsigned NOT NULL COMMENT '订单id',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `waybill_no` varchar(16) DEFAULT '' COMMENT '快递单号',
  `dispatcher` varchar(15) NOT NULL COMMENT '签单返回人（派件员）',
  `dispatcher_uid` int(11) NOT NULL COMMENT '签单返回人id（派件员）',
  `sign_manager` varchar(15) DEFAULT '' COMMENT '签单负责人',
  `sign_manager_uid` int(11) DEFAULT '0' COMMENT '签单负责人uid',
  `order_receiver` varchar(15) DEFAULT '' COMMENT '订单接收人',
  `order_receiver_uid` int(11) DEFAULT '0' COMMENT '订单接收人uid',
  `order_receiver_mobile` char(11) DEFAULT '' COMMENT '订单接收人手机号',
  `order_receiver_addr` varchar(50) DEFAULT '' COMMENT '订单接收人地址',
  `project_manager` varchar(15) DEFAULT '' COMMENT '项目负责人',
  `project_manager_uid` int(11) DEFAULT '0' COMMENT '项目负责人uid',
  `attrs` varchar(300) DEFAULT '' COMMENT '单据附件ids',
  `reason` varchar(150) DEFAULT '' COMMENT '原因',
  `transfer_type` tinyint(1) DEFAULT '0' COMMENT '流转方式， 1快递回退，2重新寄回，3签单无需寄回，4当面移交',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `receive_time` int(10) DEFAULT '0' COMMENT '客户接收时间',
  `visible` tinyint(1) DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  `sign_manager_mobile` char(11) DEFAULT NULL COMMENT '签单负责人电话',
  `sign_manager_addr` varchar(50) DEFAULT NULL COMMENT '签单负责人地址',
  PRIMARY KEY (`id`),
  KEY `idx_to_id` (`to_id`),
  KEY `idx_type_id` (`transfer_type`),
  KEY `idx_uid_id` (`dispatcher_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=314 DEFAULT CHARSET=utf8mb4 COMMENT='签单返回管理';

-- ----------------------------
-- Table structure for tms_sign_bill_log
-- ----------------------------
DROP TABLE IF EXISTS `tms_sign_bill_log`;
CREATE TABLE `tms_sign_bill_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sign_id` int(11) unsigned NOT NULL COMMENT '关联tms_sign_bill表id',
  `status` tinyint(2) DEFAULT '1' COMMENT '状态',
  `create_uid` int(11) DEFAULT '0' COMMENT '创建人',
  `create_username` varchar(15) DEFAULT '' COMMENT '创建人名称',
  `create_time` int(10) DEFAULT '0' COMMENT '创建时间',
  `remark` varchar(150) DEFAULT '' COMMENT '备注',
  `platform` tinyint(1) DEFAULT '1' COMMENT '操作平台 1 oms系统, 2 操作端APP',
  PRIMARY KEY (`id`),
  KEY `idx_sign_id` (`sign_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1134 DEFAULT CHARSET=utf8mb4 COMMENT='签单返回管理日志';

-- ----------------------------
-- Table structure for tms_sign_project_type
-- ----------------------------
DROP TABLE IF EXISTS `tms_sign_project_type`;
CREATE TABLE `tms_sign_project_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cp_id` int(11) unsigned NOT NULL COMMENT '项目id',
  `type_id` int(11) unsigned NOT NULL COMMENT '签单类型id 关联tms_sign_type表id',
  `tat_id` int(11) DEFAULT '0' COMMENT '附件id 关联tms_attachment表',
  `create_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  PRIMARY KEY (`id`),
  KEY `idx_at_id` (`tat_id`),
  KEY `idx_cp_id` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COMMENT='项目签单类型配置表';

-- ----------------------------
-- Table structure for tms_sign_type
-- ----------------------------
DROP TABLE IF EXISTS `tms_sign_type`;
CREATE TABLE `tms_sign_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(25) NOT NULL COMMENT '类型名称',
  `type` char(3) DEFAULT '301' COMMENT '订单项目配置类型 默认301',
  `subtype` int(6) unsigned NOT NULL COMMENT '订单项目配置类型子类型，如：301001',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否正常 1正常，0已删除',
  PRIMARY KEY (`id`),
  KEY `idx_type_id` (`subtype`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COMMENT='签单类型';

-- ----------------------------
-- Table structure for tms_sterilize_record
-- ----------------------------
DROP TABLE IF EXISTS `tms_sterilize_record`;
CREATE TABLE `tms_sterilize_record` (
  `tsr_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '消杀记录ID',
  `to_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `ow_id` int(11) DEFAULT NULL COMMENT '工作单ID',
  `tsr_sterilize_mode` varchar(30) DEFAULT NULL COMMENT '消毒方式',
  `trs_sterilize_time` int(11) DEFAULT NULL COMMENT '消毒时间',
  `ur_uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `username` varchar(50) DEFAULT NULL COMMENT '操作人名字',
  `trs_create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `trs_visible` int(11) DEFAULT '1' COMMENT '0删除，1展示',
  PRIMARY KEY (`tsr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2073 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_supplier
-- ----------------------------
DROP TABLE IF EXISTS `tms_supplier`;
CREATE TABLE `tms_supplier` (
  `tms_sup_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `tms_sup_name` varchar(255) NOT NULL COMMENT '物流供应商名称',
  `tms_sup_region_name` varchar(255) NOT NULL COMMENT '供应商城市',
  `tms_sup_region_id` int(11) NOT NULL COMMENT '供应商城市id',
  `tms_sup_type` int(11) NOT NULL DEFAULT '1' COMMENT '供应商类型 1一般供应商 2.承运商',
  `tms_sup_supply_type` int(11) NOT NULL DEFAULT '1' COMMENT '供货类型 1.航空 2.铁路 3.陆运',
  `tms_sup_contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `tms_sup_phone` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `tms_sup_address` varchar(255) NOT NULL COMMENT '地址',
  `tms_sup_monjs` int(11) NOT NULL DEFAULT '1' COMMENT '是否月结 1是 2否',
  `tms_sup_remark` varchar(255) DEFAULT NULL COMMENT '供应商备注',
  `tms_sup_fax` varchar(255) DEFAULT NULL COMMENT '传真',
  `tms_sup_visible` int(11) NOT NULL DEFAULT '1' COMMENT '状态1.正常 2.删除',
  `company` int(5) DEFAULT '0' COMMENT '所属公司',
  `poll` int(11) DEFAULT '0' COMMENT '当月发货票数',
  `weight` int(11) DEFAULT '0' COMMENT '当月发货重量',
  `tms_sup_taxrate` int(4) DEFAULT NULL COMMENT '发票税率类型 1.1% 2.6% 3.9%',
  `tms_sup_invoicetype` int(4) DEFAULT NULL COMMENT '发票类型  1.增值税专用发票 2.增值税普通发票',
  `tms_sup_payee_name` varchar(255) DEFAULT '' COMMENT '收款人名称',
  `tms_sup_bank_name` varchar(255) DEFAULT '' COMMENT '开户银行名称',
  `tms_sup_bank_account` varchar(255) DEFAULT '' COMMENT '银行账号',
  `tms_sup_main_id` int(11) NOT NULL COMMENT '主体id',
  `tms_res_name` varchar(50) NOT NULL COMMENT '负责人',
  `tms_res_phone` varchar(20) NOT NULL COMMENT '负责人电话',
  `tms_delt_name` varchar(50) NOT NULL COMMENT '对账人',
  `tms_delt_phone` varchar(20) NOT NULL COMMENT '对账人电话',
  `tms_duijie_name` varchar(50) NOT NULL COMMENT '业务对接人',
  `tms_duijie_phone` varchar(50) NOT NULL COMMENT '业务对接人电话',
  `tms_sup_advance` int(4) NOT NULL DEFAULT '2' COMMENT '是否预付款 1是 2否',
  PRIMARY KEY (`tms_sup_id`),
  KEY `sup_main_id` (`tms_sup_main_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1198 DEFAULT CHARSET=utf8mb4 COMMENT='物流供应商信息';

-- ----------------------------
-- Table structure for tms_supplier_business
-- ----------------------------
DROP TABLE IF EXISTS `tms_supplier_business`;
CREATE TABLE `tms_supplier_business` (
  `tms_sb_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业务供应商id',
  `tms_sb_name` varchar(255) NOT NULL COMMENT '供应商名称',
  `tms_sb_region_name` varchar(255) NOT NULL COMMENT '业务供应商城市名',
  `tms_sb_region_id` int(11) NOT NULL COMMENT '业务供应商城市id',
  `tms_sb_visible` int(11) NOT NULL DEFAULT '1' COMMENT '状态 1.正常 2.删除',
  PRIMARY KEY (`tms_sb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COMMENT='业务供应商表';

-- ----------------------------
-- Table structure for tms_supplier_business_det
-- ----------------------------
DROP TABLE IF EXISTS `tms_supplier_business_det`;
CREATE TABLE `tms_supplier_business_det` (
  `tms_sbd_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商业务详情',
  `tms_sb_id` int(11) NOT NULL COMMENT '业务供应商id',
  `tms_sbd_stime` int(11) NOT NULL COMMENT '业务开始时间',
  `tms_sbd_etime` int(11) NOT NULL COMMENT '业务结束时间',
  `tms_sbd_pnum` int(11) NOT NULL DEFAULT '0' COMMENT '票数',
  `tms_sbd_qnum` int(11) NOT NULL DEFAULT '0' COMMENT '件数',
  `tms_sbd_weight` float(11,2) NOT NULL DEFAULT '0.00' COMMENT '重量',
  `tms_sbd_total` float(11,2) NOT NULL COMMENT '费用合计',
  `tms_sbd_visible` int(11) NOT NULL DEFAULT '1' COMMENT '状态 1.正常 2.删除',
  PRIMARY KEY (`tms_sbd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='供应商业务详情表';

-- ----------------------------
-- Table structure for tms_supplier_main
-- ----------------------------
DROP TABLE IF EXISTS `tms_supplier_main`;
CREATE TABLE `tms_supplier_main` (
  `sup_main_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sup_main_name` varchar(255) NOT NULL COMMENT '供应商主体名称',
  `sup_bank_account` varchar(255) NOT NULL COMMENT '银行账号',
  `sup_bank_name` varchar(255) NOT NULL COMMENT '开户银行名称',
  `sup_payee_name` varchar(255) NOT NULL COMMENT '收款人名称',
  `sup_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0正常 1禁用',
  `sup_creater_id` int(50) NOT NULL DEFAULT '0' COMMENT '创建人id',
  `sup_create_time` int(11) NOT NULL COMMENT '创建时间',
  `sup_creater_name` varchar(50) NOT NULL DEFAULT '' COMMENT '创建人姓名',
  PRIMARY KEY (`sup_main_id`) USING BTREE,
  KEY `name` (`sup_main_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COMMENT='物流供应商主体信息';

-- ----------------------------
-- Table structure for tms_tdw_data
-- ----------------------------
DROP TABLE IF EXISTS `tms_tdw_data`;
CREATE TABLE `tms_tdw_data` (
  `tms_td_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_td_to_id` int(11) DEFAULT NULL COMMENT '订单id',
  `tms_td_to_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `tms_td_series_number` varchar(255) DEFAULT NULL COMMENT '温度计序列号',
  `tms_td_start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `tms_td_stop_time` int(11) DEFAULT NULL COMMENT '停止时间',
  `tms_td_visible` int(4) DEFAULT '1' COMMENT '状态 1正常 2删除',
  PRIMARY KEY (`tms_td_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为需要推送数据的温度计关联关系';

-- ----------------------------
-- Table structure for tms_tdw_hddata
-- ----------------------------
DROP TABLE IF EXISTS `tms_tdw_hddata`;
CREATE TABLE `tms_tdw_hddata` (
  `tms_td_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_td_to_id` int(11) DEFAULT NULL COMMENT '订单id',
  `tms_td_to_no` varchar(50) DEFAULT NULL COMMENT '订单编号',
  `tms_td_series_number` varchar(255) DEFAULT NULL COMMENT '温度计序列号',
  `tms_td_start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `tms_td_stop_time` int(11) DEFAULT NULL COMMENT '停止时间',
  `tms_td_visible` int(4) DEFAULT '1' COMMENT '状态 1正常 2删除',
  PRIMARY KEY (`tms_td_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='鼎为需要推送数据的温度计关联关系';

-- ----------------------------
-- Table structure for tms_tdw_sydata
-- ----------------------------
DROP TABLE IF EXISTS `tms_tdw_sydata`;
CREATE TABLE `tms_tdw_sydata` (
  `syid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `sy_to_id` int(11) NOT NULL COMMENT '订单id',
  `sy_gd_series_number` varchar(25) NOT NULL COMMENT '温度计编号',
  `sy_start_time` int(11) DEFAULT NULL COMMENT '开始时间',
  `sy_stop_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `sy_status` int(2) DEFAULT '1' COMMENT '状态 1推送  2停止',
  PRIMARY KEY (`syid`),
  KEY `sy_to_id` (`sy_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='上药绑定关系表';

-- ----------------------------
-- Table structure for tms_together_work_person
-- ----------------------------
DROP TABLE IF EXISTS `tms_together_work_person`;
CREATE TABLE `tms_together_work_person` (
  `twp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `twp_ur_uids` varchar(300) NOT NULL DEFAULT '' COMMENT '操作人员ID',
  `twp_usernames` varchar(300) NOT NULL DEFAULT '' COMMENT '操作人员信息',
  `twp_createtime` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `twp_lastupdtime` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `twp_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0删除，1正常数据',
  PRIMARY KEY (`twp_id`),
  KEY `idx_ur_uid` (`ur_uid`) USING BTREE COMMENT '操作人员ID',
  KEY `idx_twp_createtime` (`twp_createtime`) USING BTREE COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8mb4 COMMENT='同行人表';

-- ----------------------------
-- Table structure for tms_transport_car
-- ----------------------------
DROP TABLE IF EXISTS `tms_transport_car`;
CREATE TABLE `tms_transport_car` (
  `tms_tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_tc_to_id` int(11) NOT NULL COMMENT '订单to_id',
  `tms_tc_car_id` int(11) NOT NULL COMMENT '车辆id',
  `tms_tc_car_number` varchar(32) NOT NULL COMMENT '车牌号',
  `tms_tc_create_uid` int(11) NOT NULL COMMENT '车辆绑定人id',
  `tms_tc_create_username` varchar(255) NOT NULL COMMENT '车辆绑定人',
  `tms_tc_visible` int(11) NOT NULL DEFAULT '1' COMMENT '绑定状态  1正常  2解绑',
  `tms_tc_create_time` int(11) NOT NULL COMMENT '车辆绑定时间',
  `tms_tc_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1冷藏车，2专车',
  PRIMARY KEY (`tms_tc_id`),
  KEY `idx_tms_tc_to_id` (`tms_tc_to_id`) USING BTREE COMMENT '运单车辆关联标识'
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tms_user_classification
-- ----------------------------
DROP TABLE IF EXISTS `tms_user_classification`;
CREATE TABLE `tms_user_classification` (
  `tuc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tcu_ur_uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `tcu_username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名称',
  `tcu_type` int(4) NOT NULL DEFAULT '1' COMMENT '用户类型 1 订单专员  2 项目专员',
  `tcu_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1.正常 2.删除 ',
  PRIMARY KEY (`tuc_id`),
  KEY `idx_tcu_username` (`tcu_username`) USING BTREE,
  KEY `idx_tcu_type` (`tcu_type`) USING BTREE,
  KEY `idx_tcu_visible` (`tcu_visible`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户分类';

-- ----------------------------
-- Table structure for tms_xm_information
-- ----------------------------
DROP TABLE IF EXISTS `tms_xm_information`;
CREATE TABLE `tms_xm_information` (
  `txm_id` int(11) NOT NULL AUTO_INCREMENT,
  `txm_to_id` int(11) NOT NULL COMMENT '订单id',
  `txm_volume` varchar(255) NOT NULL COMMENT '体积',
  `txm_weight` varchar(255) NOT NULL COMMENT '重量',
  `txm_gd_number` varchar(100) NOT NULL COMMENT '温度计编号',
  `txm_car_info` varchar(1000) DEFAULT NULL COMMENT '车牌号',
  `txm_filght_number` varchar(30) DEFAULT NULL COMMENT '航班号',
  `txm_num` int(3) DEFAULT NULL COMMENT '箱数',
  `txm_warm_area` varchar(255) DEFAULT NULL COMMENT '温区',
  PRIMARY KEY (`txm_id`) USING BTREE,
  KEY `txm_to_id` (`txm_to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1098 DEFAULT CHARSET=utf8mb4 COMMENT='西门子订单附属信息';

-- ----------------------------
-- Table structure for tms_yanjia
-- ----------------------------
DROP TABLE IF EXISTS `tms_yanjia`;
CREATE TABLE `tms_yanjia` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `to_id` int(11) NOT NULL COMMENT '订单序列号',
  `di_id` int(11) NOT NULL COMMENT '调度id',
  `status` tinyint(1) DEFAULT '1' COMMENT '1未下发，2已下发，3已收货，4已撤回',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `issued_time` int(11) DEFAULT '0' COMMENT '下发时间',
  `visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态: 0删除 1正常',
  `lock` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态: 1正常 2已锁',
  `created_at` datetime DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_index` (`di_id`),
  KEY `idx_to_id` (`to_id`),
  KEY `idx_create_time` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COMMENT='宴嘉专线下发记录';

-- ----------------------------
-- Table structure for tms_ydg_replacelog
-- ----------------------------
DROP TABLE IF EXISTS `tms_ydg_replacelog`;
CREATE TABLE `tms_ydg_replacelog` (
  `yrl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `ylr_to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  `ylr_gd_number` varchar(100) NOT NULL DEFAULT '' COMMENT '液氮罐编号',
  `ylr_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态1 正常 2解绑',
  `ylr_expire_time` int(11) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `ylr_push_time` int(11) NOT NULL DEFAULT '0' COMMENT '推送时间',
  `ylr_push_status` int(4) NOT NULL DEFAULT '1' COMMENT '推送状态 1未推送 2 已推送',
  `created_at` datetime NOT NULL COMMENT '创建时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  `deleted_at` datetime NOT NULL COMMENT '删除时间',
  PRIMARY KEY (`yrl_id`),
  KEY `idx_ylr_to_id` (`ylr_to_id`) USING BTREE COMMENT '订单id',
  KEY `idx_ylr_gd_number` (`ylr_gd_number`) USING BTREE COMMENT '液氮罐编号',
  KEY `idx_ylr_push_status` (`ylr_push_status`) USING BTREE COMMENT '推送状态'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='液氮罐更换记录表';

-- ----------------------------
-- Table structure for tms_ylt
-- ----------------------------
DROP TABLE IF EXISTS `tms_ylt`;
CREATE TABLE `tms_ylt` (
  `tms_ylt_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_ylt_car_number` varchar(30) NOT NULL COMMENT '车牌号',
  `tms_ylt_gps_time` int(11) NOT NULL COMMENT 'gps定位时间',
  `tms_ylt_temperature` varchar(255) DEFAULT NULL COMMENT '温度信息',
  `tms_ylt_humidity` varchar(255) DEFAULT NULL COMMENT '湿度信息',
  `tms_ylt_location` varchar(255) DEFAULT NULL COMMENT '车辆经纬度信息',
  `tms_ylt_location_desc` varchar(255) DEFAULT NULL COMMENT '车辆位置描述',
  `tms_ylt_visible` int(4) DEFAULT '1' COMMENT '状态 1正常 2删除',
  `tms_ylt_wcstatus` int(4) DEFAULT '1' COMMENT '微信消息推送状态 1.未推送 2.已推送',
  `tms_ylt_createtime` int(11) DEFAULT NULL COMMENT '记录创建时间',
  PRIMARY KEY (`tms_ylt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8mb4 COMMENT='易联车辆推送数据';

-- ----------------------------
-- Table structure for tms_ylt_wcmessage_log
-- ----------------------------
DROP TABLE IF EXISTS `tms_ylt_wcmessage_log`;
CREATE TABLE `tms_ylt_wcmessage_log` (
  `tms_ylt_wl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tms_ylt_wl_car_number` varchar(30) NOT NULL COMMENT '车牌号',
  `tms_ylt_wl_to_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `tms_ylt_wl_to_no` varchar(255) DEFAULT NULL COMMENT '订单编号',
  `tms_ylt_wl_time` int(11) DEFAULT NULL COMMENT '推送时间',
  `tms_ylt_wl_visible` int(4) NOT NULL DEFAULT '1' COMMENT '状态 1正常 2删除',
  `tms_ylt_wl_remark` varchar(255) DEFAULT NULL COMMENT '推送内容',
  PRIMARY KEY (`tms_ylt_wl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transactions
-- ----------------------------
DROP TABLE IF EXISTS `transactions`;
CREATE TABLE `transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` varchar(255) NOT NULL DEFAULT '0',
  `deadlock_id` int(11) NOT NULL DEFAULT '0',
  `transaction_active_time` int(11) NOT NULL DEFAULT '0',
  `tables_in_use` int(11) NOT NULL DEFAULT '0',
  `tables_locked` int(11) NOT NULL DEFAULT '0',
  `row_locks` int(11) NOT NULL DEFAULT '0',
  `thread_id` int(11) NOT NULL DEFAULT '0',
  `host` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `query` text NOT NULL,
  `db` varchar(255) NOT NULL DEFAULT '',
  `table` varchar(255) NOT NULL DEFAULT '',
  `success` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_transactions_on_deadlock_id_and_created_at` (`deadlock_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for transfer
-- ----------------------------
DROP TABLE IF EXISTS `transfer`;
CREATE TABLE `transfer` (
  `tr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `tr_no` varchar(30) DEFAULT NULL COMMENT '移库单号',
  `tr_type` int(1) NOT NULL DEFAULT '1' COMMENT '移库状态：1=待捡药，2=已关闭，3=已取消，4=待记出库台账，5=待入库，6=待记入库台账，7=待复核，8=复核未通过，9=待移库\r\n（移库状态   1新建   2已移入  3已取消）(旧)',
  `out_swid` int(10) unsigned DEFAULT NULL COMMENT '移出仓库',
  `in_swid` int(10) unsigned DEFAULT NULL COMMENT '移入仓库',
  `wa_uid` int(10) unsigned DEFAULT NULL COMMENT '移入仓管员',
  `create_uid` int(10) unsigned DEFAULT NULL COMMENT '创建人',
  `tr_createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `tr_lastuptime` int(10) DEFAULT NULL COMMENT '最后一次修改时间',
  `tr_remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `tr_storagetime` int(11) DEFAULT NULL COMMENT '移库时间',
  PRIMARY KEY (`tr_id`),
  KEY `out_swid` (`out_swid`),
  KEY `in_swid` (`in_swid`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8 COMMENT='移库表';

-- ----------------------------
-- Table structure for transfer_detail
-- ----------------------------
DROP TABLE IF EXISTS `transfer_detail`;
CREATE TABLE `transfer_detail` (
  `td_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '明细序号',
  `tr_id` int(11) unsigned DEFAULT NULL COMMENT '移库单序号',
  `sto_id` int(11) unsigned DEFAULT NULL COMMENT '存货序号',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `sto_no` varchar(255) DEFAULT '' COMMENT '存货编号',
  `sto_name` varchar(255) DEFAULT '' COMMENT '存货名称',
  `sto_batch` varchar(255) DEFAULT '' COMMENT '批号',
  `id_stock_detail` longtext COMMENT '存货明细编号',
  `id_quantity` smallint(6) unsigned DEFAULT '0' COMMENT '数量',
  `sto_has_identifier` int(1) unsigned DEFAULT NULL COMMENT '有无编号',
  `conditions` varchar(255) DEFAULT NULL COMMENT '条件区间',
  `id_sto_numbers` text COMMENT '批量录入明细',
  `sw_id_out` int(11) DEFAULT NULL COMMENT '移出货位',
  `sw_id_in` int(11) DEFAULT NULL COMMENT '移入货位',
  `version_num` varchar(50) DEFAULT 'v1.0.0' COMMENT '版本号',
  `yp_io_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '明细状态：1=待捡药，2=已关闭，3=已取消，4=待记出库台账，5=待入库，6=待记入库台账，7=待复核，8=复核未通过，9=待移库',
  `stand_book_id` int(11) DEFAULT NULL COMMENT '电子台账id',
  `review_reason` tinyint(4) DEFAULT '0' COMMENT '1：药品清点错误 2：台账数据不一致',
  PRIMARY KEY (`td_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=686 DEFAULT CHARSET=utf8 COMMENT='移库明细表';

-- ----------------------------
-- Table structure for transport_order
-- ----------------------------
DROP TABLE IF EXISTS `transport_order`;
CREATE TABLE `transport_order` (
  `to_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单序号',
  `to_no` char(32) DEFAULT '' COMMENT '纸质运单编号',
  `to_customer_no` char(128) DEFAULT '' COMMENT '客户单号，客户内部单号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '委托客户序号',
  `cu_no` char(32) CHARACTER SET utf16 DEFAULT NULL COMMENT '委托客户编号',
  `co_id` int(11) unsigned DEFAULT NULL COMMENT '委托人序号',
  `cp_id` int(11) unsigned DEFAULT NULL COMMENT '项目序号',
  `cp_no` char(128) DEFAULT NULL COMMENT '项目编号',
  `to_taketime` int(11) unsigned DEFAULT '0' COMMENT '接单时间',
  `to_type` tinyint(4) unsigned DEFAULT '0' COMMENT '订单类型，0标准运输，1耗材调拨 ，2山东齐鲁订单',
  `to_goodstype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '货物类型（1=血样，2=样本，3=药品）',
  `to_important` tinyint(4) unsigned DEFAULT '0' COMMENT '重要程序，0普通，1重要',
  `to_timelimit` tinyint(4) unsigned DEFAULT '0' COMMENT '运送时限，0：12小时，1：24小时，2：36小时，3：48小时，4：72小时',
  `to_temperature` tinyint(4) unsigned DEFAULT '0' COMMENT '运输温度，1 CW0-30，2 HW15-25，3 HW18-30，4 LB2-8，5 GB-20，6 YD-150',
  `to_temperature_name` varchar(30) DEFAULT NULL COMMENT '运输温度记录',
  `to_thermometer` tinyint(4) unsigned DEFAULT '0' COMMENT '温度计，1无温度计，2生生温度计，3客户温度计，4客户和生生温度计',
  `to_hygrometer` tinyint(4) DEFAULT '0' COMMENT '湿度计，1无湿度计，2生生湿度计，3客户湿度计，4客户和生生湿度计',
  `to_insure` tinyint(4) unsigned DEFAULT '0' COMMENT '是否投保，0否，1是',
  `to_insure_value` decimal(20,2) DEFAULT '0.00' COMMENT '声明价值',
  `to_getcash` tinyint(4) unsigned DEFAULT '0' COMMENT '付款方式，0月结，1发货方现金，2收货方现金',
  `to_invoice` tinyint(4) unsigned DEFAULT '0' COMMENT '是否开票，0否，1是',
  `to_assign_uid` int(11) unsigned DEFAULT '0' COMMENT '指派给用户序号',
  `to_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发件所在地区ID',
  `start_region_name` char(128) DEFAULT NULL COMMENT '发件地区名',
  `start_cu_id` int(11) DEFAULT NULL,
  `start_cu_name` varchar(400) DEFAULT NULL COMMENT '发件客户',
  `start_co_name` varchar(300) DEFAULT NULL COMMENT '发件客户',
  `start_mobile_phone` varchar(180) DEFAULT NULL COMMENT '发件联系手机',
  `start_address` varchar(800) DEFAULT NULL COMMENT '发件联系地址',
  `start_itude` varchar(255) DEFAULT NULL COMMENT '收件地址经纬度',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '收件所在地区ID',
  `stop_region_name` char(128) DEFAULT NULL COMMENT '收件地区名',
  `stop_cu_id` int(11) DEFAULT NULL,
  `stop_cu_name` varchar(400) DEFAULT NULL COMMENT '收件客户',
  `stop_co_name` varchar(300) DEFAULT NULL COMMENT '收件联系人',
  `stop_mobile_phone` varchar(180) DEFAULT NULL COMMENT '收件联系手机',
  `stop_address` varchar(800) DEFAULT NULL COMMENT '收件联系地址',
  `stop_itude` varchar(255) DEFAULT NULL COMMENT '收件地址经纬度',
  `to_status` tinyint(4) unsigned DEFAULT '0' COMMENT '运输单状态 0新建 1已审核 2已取件 3已发货 4已提货 5已派件 6已反馈 7已取消 8已关闭 9 删除',
  `to_performance_status` char(4) DEFAULT '0000' COMMENT '绩效状态，0000异常投诉索赔奖励',
  `to_settlement_status` tinyint(4) unsigned DEFAULT '0' COMMENT '结算状态，0未结算，1已结算',
  `to_invoice_status` tinyint(4) unsigned DEFAULT '0' COMMENT '开票状态，0未开票，1已开票',
  `to_goods_status` tinyint(4) unsigned DEFAULT '0' COMMENT '货物状态，0货物完好，1货物破损，2货物丢失，3货物超温，4货物延时',
  `to_outbox_status` tinyint(4) unsigned DEFAULT '0' COMMENT '取件结存状态，0未结存，1已结存',
  `to_inbox_status` tinyint(4) unsigned DEFAULT '0' COMMENT '派件结存状态，0未结存，1已结存',
  `to_sign_status` tinyint(4) unsigned DEFAULT '0' COMMENT '签收单据附件状态，0未上传，1已上传',
  `to_temprecord_status` tinyint(4) unsigned DEFAULT '0' COMMENT '温度数据附件状态，0未上传，1已上传',
  `to_email` text COMMENT '联系邮箱',
  `to_remark` longtext COMMENT '客户备注',
  `to_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `to_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `to_closetime` int(10) unsigned DEFAULT '0' COMMENT '结案时间',
  `to_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `to_outbox_out_no` char(32) DEFAULT '' COMMENT '取件结存出库单号',
  `to_outbox_in_no` char(32) DEFAULT '' COMMENT '取件结存入库单号',
  `to_inbox_out_no` char(32) DEFAULT '' COMMENT '派件结存出库单号',
  `to_inbox_in_no` char(32) DEFAULT '' COMMENT '派件结存入库单号',
  `to_nocheck` tinyint(4) unsigned DEFAULT '0' COMMENT '是否不需要审核 1-是 0-否',
  `to_fileurl` varchar(255) DEFAULT NULL COMMENT '太美api附件链接',
  `to_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源',
  `changebox` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否完成换箱',
  `to_site_id` int(11) DEFAULT NULL COMMENT '科文斯项目siteId',
  `to_check_status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '客户审核状态（0=未审核，1=一审，2=二审，5=终审）',
  `to_template` tinyint(1) NOT NULL DEFAULT '1' COMMENT '济南脐血库消息推送状态 0-未推送 1-已推送',
  `to_tags` varchar(150) DEFAULT NULL COMMENT '订单标签',
  `cp_tags` varchar(150) DEFAULT NULL COMMENT '项目标签',
  `to_receipt` int(1) unsigned DEFAULT NULL COMMENT '签收类型: 1-本人签收，2-他人代收',
  `to_trequirement` int(1) DEFAULT '0' COMMENT '运输要求 0正常 2专人 3专车',
  `to_temporary` tinyint(1) DEFAULT '0' COMMENT '暂存货类型 0 未暂存  1 已暂存',
  `to_aging_remark` varchar(1024) DEFAULT NULL COMMENT '时效备注',
  `child_start_region_id` int(11) DEFAULT NULL COMMENT '出发城市子级id',
  `child_start_region_name` varchar(255) DEFAULT NULL COMMENT '出发城市子级名称',
  `child_stop_region_id` int(11) DEFAULT NULL COMMENT '到达城市子级id',
  `child_stop_region_name` varchar(255) DEFAULT NULL COMMENT '到达城市子级名称',
  `to_gatt_status` int(4) DEFAULT '0' COMMENT '校准证书状态',
  `oinvennum` varchar(25) DEFAULT NULL COMMENT '暂存编号',
  `to_hygrometer_range` varchar(255) DEFAULT NULL COMMENT '湿度区间',
  `contact_name` varchar(30) DEFAULT NULL COMMENT '委托人姓名',
  `contact_tel` varchar(30) DEFAULT NULL COMMENT '委托人手机号',
  `to_pid` int(11) DEFAULT NULL COMMENT '主单id',
  `to_attributes` int(4) NOT NULL DEFAULT '1' COMMENT '1.普通订单 2.主单 3.子单',
  `to_category` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1正常订单，2仓库发药',
  `colorcar_true` int(2) DEFAULT '0' COMMENT '是否冷藏车派送 0否 1是',
  `to_kpi` tinyint(1) DEFAULT '1' COMMENT 'KPI 1是 2否',
  `to_review_status` int(4) NOT NULL COMMENT '订单复核 1.未复核 2.已复核',
  `to_abnormal_charge_type` tinyint(1) DEFAULT '1' COMMENT '异常收费 1 无异常收费 2 异常收费',
  `bi_id` int(10) unsigned DEFAULT NULL COMMENT '开票客户id',
  `bi_name` varchar(100) DEFAULT NULL COMMENT '开票客户抬头',
  `to_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  `to_identify` int(4) NOT NULL DEFAULT '0' COMMENT '0普通订单 1臻和合单 2泰琨合单 3九州通合单',
  `transport_type` tinyint(3) unsigned DEFAULT '0' COMMENT '运输类型 0=常规运输  1=临床发运 2=营销样品  3=其他',
  `cod_amount` decimal(20,2) DEFAULT NULL COMMENT '到付金额',
  `cod_way` tinyint(1) unsigned DEFAULT NULL COMMENT '到付方式',
  `outsource` int(4) DEFAULT '3' COMMENT '迈迪朗杰外包类型  3全包    1.取件  2派件 ',
  `to_is_lable` tinyint(1) DEFAULT NULL COMMENT '是否贴标 1=不贴标 2=贴标',
  `to_nucleic_acid` tinyint(2) DEFAULT '0' COMMENT '核酸服务 0无需检测，1 人员核酸，2外包装核酸，3药品核酸，4人员抗体检测',
  `order_check_status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '订单审核状态 1待审核 2审核通过',
  `to_business_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0正常订单 2仓库发药',
  PRIMARY KEY (`to_id`),
  UNIQUE KEY `oinvennum` (`oinvennum`),
  KEY `to_no` (`to_no`),
  KEY `to_assign_uid` (`to_assign_uid`),
  KEY `to_create_uid` (`to_create_uid`),
  KEY `to_customer_no` (`to_customer_no`),
  KEY `start_region_id` (`start_region_id`),
  KEY `stop_region_id` (`stop_region_id`),
  KEY `to_status` (`to_status`),
  KEY `to_type` (`to_type`),
  KEY `to_temperature` (`to_temperature`),
  KEY `cu_id` (`cu_id`),
  KEY `index_to_pid` (`to_pid`),
  KEY `cp_id_index` (`cp_id`),
  KEY `to_auto_lastupdtime` (`to_auto_lastupdtime`),
  KEY `idx_create_time` (`to_createtime`),
  KEY `idx_nuc_acid` (`to_nucleic_acid`)
) ENGINE=InnoDB AUTO_INCREMENT=1676827 DEFAULT CHARSET=utf8 COMMENT='运输订单表';

-- ----------------------------
-- Table structure for transport_order_abnormal
-- ----------------------------
DROP TABLE IF EXISTS `transport_order_abnormal`;
CREATE TABLE `transport_order_abnormal` (
  `toa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '异常主键id',
  `tos_id` int(11) DEFAULT NULL COMMENT '子订单id',
  `toa_type` tinyint(4) NOT NULL COMMENT '0：订单确认，1：订单指派2：取件收取血样，3：物流重装，4：血样运输到库，5订单取消',
  `toa_time` int(11) DEFAULT NULL COMMENT '异常时间',
  `toa_data` varchar(1500) DEFAULT NULL COMMENT '异常请求数据',
  `toa_status` tinyint(4) DEFAULT NULL COMMENT '1:请求成功  2：待请求',
  `toa_change_time` int(11) DEFAULT NULL COMMENT '最后修改时间',
  `toa_return_result` varchar(200) DEFAULT NULL COMMENT '返回结果',
  PRIMARY KEY (`toa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=574 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transport_order_copy1
-- ----------------------------
DROP TABLE IF EXISTS `transport_order_copy1`;
CREATE TABLE `transport_order_copy1` (
  `to_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单序号',
  `to_no` char(32) DEFAULT '' COMMENT '纸质运单编号',
  `to_customer_no` char(128) DEFAULT '' COMMENT '客户单号，客户内部单号',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '委托客户序号',
  `cu_no` char(32) DEFAULT NULL COMMENT '委托客户编号',
  `co_id` int(11) unsigned DEFAULT NULL COMMENT '委托人序号',
  `cp_id` int(11) unsigned DEFAULT NULL COMMENT '项目序号',
  `cp_no` char(128) DEFAULT NULL COMMENT '项目编号',
  `to_taketime` int(11) unsigned DEFAULT '0' COMMENT '接单时间',
  `to_type` tinyint(4) unsigned DEFAULT '0' COMMENT '订单类型，0标准运输，1耗材调拨 ，2山东齐鲁订单',
  `to_goodstype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '货物类型（1=血样，2=样本，3=药品）',
  `to_important` tinyint(4) unsigned DEFAULT '0' COMMENT '重要程序，0普通，1重要',
  `to_timelimit` tinyint(4) unsigned DEFAULT '0' COMMENT '运送时限，0：12小时，1：24小时，2：36小时，3：48小时，4：72小时',
  `to_temperature` tinyint(4) unsigned DEFAULT '0' COMMENT '运输温度，1 CW0-30，2 HW15-25，3 HW18-30，4 LB2-8，5 GB-20，6 YD-150',
  `to_temperature_name` varchar(30) DEFAULT NULL COMMENT '运输温度记录',
  `to_thermometer` tinyint(4) unsigned DEFAULT '0' COMMENT '温度计，1无温度计，2生生温度计，3客户温度计，4客户和生生温度计',
  `to_hygrometer` tinyint(4) DEFAULT '0' COMMENT '湿度计，1无湿度计，2生生湿度计，3客户湿度计，4客户和生生湿度计',
  `to_insure` tinyint(4) unsigned DEFAULT '0' COMMENT '是否投保，0否，1是',
  `to_insure_value` decimal(20,2) DEFAULT '0.00' COMMENT '声明价值',
  `to_getcash` tinyint(4) unsigned DEFAULT '0' COMMENT '付款方式，0月结，1发货方现金，2收货方现金',
  `to_invoice` tinyint(4) unsigned DEFAULT '0' COMMENT '是否开票，0否，1是',
  `to_assign_uid` int(11) unsigned DEFAULT '0' COMMENT '指派给用户序号',
  `to_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发件所在地区ID',
  `start_region_name` char(128) DEFAULT NULL COMMENT '发件地区名',
  `start_cu_id` int(11) DEFAULT NULL,
  `start_cu_name` char(128) DEFAULT NULL COMMENT '发件客户',
  `start_co_name` char(128) DEFAULT NULL COMMENT '发件客户',
  `start_mobile_phone` char(64) DEFAULT NULL COMMENT '发件联系手机',
  `start_address` char(128) DEFAULT NULL COMMENT '发件联系地址',
  `start_itude` varchar(255) DEFAULT NULL COMMENT '收件地址经纬度',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '收件所在地区ID',
  `stop_region_name` char(128) DEFAULT NULL COMMENT '收件地区名',
  `stop_cu_id` int(11) DEFAULT NULL,
  `stop_cu_name` char(128) DEFAULT NULL COMMENT '收件客户',
  `stop_co_name` char(128) DEFAULT NULL COMMENT '收件联系人',
  `stop_mobile_phone` char(64) DEFAULT NULL COMMENT '收件联系手机',
  `stop_address` char(128) DEFAULT NULL COMMENT '收件联系地址',
  `stop_itude` varchar(255) DEFAULT NULL COMMENT '收件地址经纬度',
  `to_status` tinyint(4) unsigned DEFAULT '0' COMMENT '运输单状态 0新建 1已审核 2已取件 3已发货 4已提货 5已派件 6已反馈 7已取消 8已关闭 9 删除',
  `to_performance_status` char(4) DEFAULT '0000' COMMENT '绩效状态，0000异常投诉索赔奖励',
  `to_settlement_status` tinyint(4) unsigned DEFAULT '0' COMMENT '结算状态，0未结算，1已结算',
  `to_invoice_status` tinyint(4) unsigned DEFAULT '0' COMMENT '开票状态，0未开票，1已开票',
  `to_goods_status` tinyint(4) unsigned DEFAULT '0' COMMENT '货物状态，0货物完好，1货物破损，2货物丢失，3货物超温，4货物延时',
  `to_outbox_status` tinyint(4) unsigned DEFAULT '0' COMMENT '取件结存状态，0未结存，1已结存',
  `to_inbox_status` tinyint(4) unsigned DEFAULT '0' COMMENT '派件结存状态，0未结存，1已结存',
  `to_sign_status` tinyint(4) unsigned DEFAULT '0' COMMENT '签收单据附件状态，0未上传，1已上传',
  `to_temprecord_status` tinyint(4) unsigned DEFAULT '0' COMMENT '温度数据附件状态，0未上传，1已上传',
  `to_email` char(70) DEFAULT NULL COMMENT '联系邮箱',
  `to_remark` longtext COMMENT '客户备注',
  `to_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `to_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `to_closetime` int(10) unsigned DEFAULT '0' COMMENT '结案时间',
  `to_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `to_outbox_out_no` char(32) DEFAULT '' COMMENT '取件结存出库单号',
  `to_outbox_in_no` char(32) DEFAULT '' COMMENT '取件结存入库单号',
  `to_inbox_out_no` char(32) DEFAULT '' COMMENT '派件结存出库单号',
  `to_inbox_in_no` char(32) DEFAULT '' COMMENT '派件结存入库单号',
  `to_nocheck` tinyint(4) unsigned DEFAULT '0' COMMENT '是否不需要审核 1-是 0-否',
  `to_fileurl` varchar(255) DEFAULT NULL COMMENT '太美api附件链接',
  `to_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源',
  `changebox` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否完成换箱',
  `to_site_id` int(11) DEFAULT NULL COMMENT '科文斯项目siteId',
  `to_check_status` tinyint(1) NOT NULL DEFAULT '5' COMMENT '客户审核状态（0=未审核，1=一审，2=二审，5=终审）',
  `to_template` tinyint(1) NOT NULL DEFAULT '1' COMMENT '济南脐血库消息推送状态 0-未推送 1-已推送',
  `to_tags` varchar(150) DEFAULT NULL COMMENT '订单标签',
  `cp_tags` varchar(150) DEFAULT NULL COMMENT '项目标签',
  `to_receipt` int(1) unsigned DEFAULT NULL COMMENT '签收类型: 1-本人签收，2-他人代收',
  `to_trequirement` int(1) DEFAULT '0' COMMENT '运输要求 0正常 2专人 3专车',
  `to_temporary` tinyint(1) DEFAULT '0' COMMENT '暂存货类型 0 未暂存  1 已暂存',
  `to_aging_remark` varchar(1024) DEFAULT NULL COMMENT '时效备注',
  `child_start_region_id` int(11) DEFAULT NULL COMMENT '出发城市子级id',
  `child_start_region_name` varchar(255) DEFAULT NULL COMMENT '出发城市子级名称',
  `child_stop_region_id` int(11) DEFAULT NULL COMMENT '到达城市子级id',
  `child_stop_region_name` varchar(255) DEFAULT NULL COMMENT '到达城市子级名称',
  `to_gatt_status` int(4) DEFAULT '0' COMMENT '校准证书状态',
  `oinvennum` varchar(25) DEFAULT NULL COMMENT '暂存编号',
  `to_hygrometer_range` varchar(255) DEFAULT NULL COMMENT '湿度区间',
  `contact_name` varchar(30) DEFAULT NULL COMMENT '委托人姓名',
  `contact_tel` varchar(30) DEFAULT NULL COMMENT '委托人手机号',
  `to_pid` int(11) DEFAULT NULL COMMENT '主单id',
  `to_attributes` int(4) NOT NULL DEFAULT '1' COMMENT '1.普通订单 2.主单 3.子单',
  `to_category` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1正常订单，2仓库发药',
  `colorcar_true` int(2) DEFAULT '0' COMMENT '是否冷藏车派送 0否 1是',
  `to_kpi` tinyint(1) DEFAULT '1' COMMENT 'KPI 1是 2否',
  `to_review_status` int(4) NOT NULL COMMENT '订单复核 1.未复核 2.已复核',
  `to_abnormal_charge_type` tinyint(1) DEFAULT '1' COMMENT '异常收费 1 无异常收费 2 异常收费',
  `bi_id` int(10) unsigned DEFAULT NULL COMMENT '开票客户id',
  `bi_name` varchar(100) DEFAULT NULL COMMENT '开票客户抬头',
  `to_auto_lastupdtime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '自动更新最后一次修改时间',
  PRIMARY KEY (`to_id`),
  KEY `to_no` (`to_no`),
  KEY `to_assign_uid` (`to_assign_uid`),
  KEY `to_create_uid` (`to_create_uid`),
  KEY `to_customer_no` (`to_customer_no`),
  KEY `start_region_id` (`start_region_id`),
  KEY `stop_region_id` (`stop_region_id`),
  KEY `to_status` (`to_status`),
  KEY `to_type` (`to_type`),
  KEY `to_temperature` (`to_temperature`),
  KEY `cu_id` (`cu_id`),
  KEY `keywords` (`start_cu_name`,`start_co_name`,`start_mobile_phone`,`stop_cu_name`,`stop_co_name`,`stop_mobile_phone`),
  KEY `index_to_pid` (`to_pid`),
  KEY `cp_id_index` (`cp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=352542 DEFAULT CHARSET=utf8 COMMENT='运输订单表';

-- ----------------------------
-- Table structure for transport_order_nephew
-- ----------------------------
DROP TABLE IF EXISTS `transport_order_nephew`;
CREATE TABLE `transport_order_nephew` (
  `tos_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `to_id` int(11) NOT NULL COMMENT '订单号id 主表',
  `become_time` int(10) DEFAULT NULL COMMENT '采血时间',
  `signing_time` int(10) DEFAULT NULL COMMENT '签收时间',
  `created_time` int(10) DEFAULT NULL COMMENT '创建时间',
  `third_no` varchar(30) DEFAULT NULL COMMENT '三方编号',
  `confirm_time` int(10) DEFAULT NULL COMMENT '确认时间',
  `transfer_time` int(10) unsigned DEFAULT NULL COMMENT '派送时间',
  `smb_files` tinyint(1) DEFAULT NULL COMMENT '血清学母血 1:有 2：没有 ',
  `namb_files` tinyint(1) DEFAULT NULL COMMENT '核酸母血',
  `crc_files` tinyint(1) DEFAULT NULL COMMENT '脐带血接收确认单/接收确认单 ',
  `cbb_files` tinyint(1) DEFAULT NULL COMMENT '脐血独有的 ：脐血血袋（脐血）',
  `pwhq_files` tinyint(1) DEFAULT NULL COMMENT '孕妇健康调查表',
  `ic_files` tinyint(1) DEFAULT NULL COMMENT '脐血知情同意书/协议书',
  `csb_files` tinyint(1) DEFAULT NULL COMMENT '脐带独有的：脐带储运瓶（脐带）',
  `hq_files` tinyint(1) DEFAULT NULL COMMENT '脐带独有的:健康调查表',
  `cic_files` tinyint(1) DEFAULT NULL COMMENT '脐带独有的:脐带知情同意书/协议书',
  `status` tinyint(1) DEFAULT '0' COMMENT '0：待确认 1：确认 2：取消 3：确认未指派 4：确认已指派',
  `remark` varchar(150) DEFAULT NULL COMMENT '备注',
  `temperature` float(4,1) DEFAULT NULL,
  `other_files` varchar(400) DEFAULT NULL,
  `blood_type` tinyint(1) DEFAULT NULL COMMENT '血类型 1：脐血，2：脐带，3：母血',
  `deleted` tinyint(2) DEFAULT NULL COMMENT '取消次数',
  PRIMARY KEY (`tos_id`),
  UNIQUE KEY `to_id_thind_delete` (`to_id`,`third_no`,`deleted`),
  KEY `to_id_index` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=737 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for transport_stations
-- ----------------------------
DROP TABLE IF EXISTS `transport_stations`;
CREATE TABLE `transport_stations` (
  `ts_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '站点序号',
  `ts_no` char(32) DEFAULT '' COMMENT '站点编号',
  `ts_name` char(32) DEFAULT '' COMMENT '站点名称',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '地区ID',
  `region_name` char(128) DEFAULT NULL COMMENT '地区名',
  `ts_delivery_tel` char(128) DEFAULT '' COMMENT '出港发货电话',
  `ts_take_tel` char(128) DEFAULT '' COMMENT '到港提货电话',
  `ts_status` tinyint(4) unsigned DEFAULT '0' COMMENT '站点状态 0正常，1关闭',
  `ts_add` char(128) DEFAULT '' COMMENT '站点地址',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '最后修改人用户序号',
  `username` char(32) DEFAULT '' COMMENT '最后修改人用户姓名',
  `ts_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ts_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ts_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `ts_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  `child_region_id` int(10) DEFAULT NULL COMMENT '子地区id',
  `child_region_name` varchar(255) DEFAULT NULL COMMENT '子地区名',
  `longitude_coordinate` varchar(30) DEFAULT '' COMMENT '经度坐标',
  `latitude_coordinate` varchar(30) DEFAULT '' COMMENT '纬度坐标',
  `detail_address` varchar(100) DEFAULT '' COMMENT '详细地址',
  `standard_station_name` varchar(50) DEFAULT '' COMMENT '标准站名',
  `create_user_id` int(11) DEFAULT '0' COMMENT '创建人用户id',
  `create_user_name` varchar(30) DEFAULT '' COMMENT '创建人用户名称',
  `last_delivery_time` varchar(10) DEFAULT '00:00' COMMENT '最晚交货时间',
  PRIMARY KEY (`ts_id`),
  KEY `ts_name` (`ts_name`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1742 DEFAULT CHARSET=utf8 COMMENT='运输站点';

-- ----------------------------
-- Table structure for transportation_cost
-- ----------------------------
DROP TABLE IF EXISTS `transportation_cost`;
CREATE TABLE `transportation_cost` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `to_id` int(11) NOT NULL COMMENT '订单id',
  `tc_createtime` int(11) NOT NULL,
  `bus_shippingcost` decimal(10,2) DEFAULT '0.00' COMMENT '大巴发货费',
  `hr_shippingcost` decimal(10,2) DEFAULT '0.00' COMMENT '高铁发货费',
  `db_shippingcost` decimal(10,2) DEFAULT '0.00' COMMENT '德邦发货费',
  `luqiao_fee` decimal(10,2) DEFAULT '0.00' COMMENT '路桥费',
  `parking_fee` decimal(10,2) DEFAULT '0.00' COMMENT '停车费',
  `other_fee` decimal(10,2) DEFAULT '0.00' COMMENT '其他费用',
  `user_id` int(11) NOT NULL COMMENT '填写人id',
  `user_name` varchar(255) NOT NULL COMMENT '填写人名',
  `tc_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `tc_visible` int(1) NOT NULL DEFAULT '0' COMMENT '状态 0 正常  1  删除',
  PRIMARY KEY (`tc_id`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='脐血订单运输成本表';

-- ----------------------------
-- Table structure for up_down_states
-- ----------------------------
DROP TABLE IF EXISTS `up_down_states`;
CREATE TABLE `up_down_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` tinyint(1) NOT NULL DEFAULT '1',
  `connection_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_or_end` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_up_down_states_on_connection_id_and_created_at` (`connection_id`,`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for uppickuptime
-- ----------------------------
DROP TABLE IF EXISTS `uppickuptime`;
CREATE TABLE `uppickuptime` (
  `to_id` int(255) DEFAULT NULL,
  `pickuptime` datetime DEFAULT NULL,
  `time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for uptoid
-- ----------------------------
DROP TABLE IF EXISTS `uptoid`;
CREATE TABLE `uptoid` (
  `to_id` int(11) DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  UNIQUE KEY `toid` (`to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='20190124更新订单uid数据临时表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ur_uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户序号',
  `ur_account` char(32) DEFAULT '' COMMENT '用户名称',
  `co_id` int(11) DEFAULT NULL COMMENT '不用此字段关联contact联系人，请用联系人表里的co_uid关联查询',
  `username` char(32) DEFAULT '' COMMENT '真实姓名，是员工或联系人姓名的复制，方便界面显示，在修改员工或联系人姓名时同步',
  `ur_type` tinyint(4) unsigned DEFAULT '0' COMMENT '用户类型，5员工  1外协  2一般供应商  3 承运商  4客户',
  `ur_identifier` int(11) unsigned DEFAULT '0' COMMENT '员工序号、客户供应商序号等',
  `ur_status` tinyint(4) unsigned DEFAULT '0' COMMENT '用户状态 0正常，1锁定',
  `ur_passwd` char(32) DEFAULT '' COMMENT '密码',
  `ur_token` varchar(50) DEFAULT '' COMMENT '登录验证令牌',
  `is_assign` tinyint(4) unsigned DEFAULT '0' COMMENT '是否指派 0否 1是',
  `is_operator` tinyint(4) unsigned DEFAULT '0' COMMENT '是否操作员 0否 1是',
  `ur_region_reach` text COMMENT '用户管辖地区，region_id以逗号分隔',
  `ur_remark` varchar(1024) DEFAULT NULL COMMENT '用户备注',
  `ur_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ur_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  `is_reset` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要重置密码（1=是，0=否）',
  `pass_number` tinyint(1) NOT NULL DEFAULT '0' COMMENT '密码输入错误次数',
  `last_passtime` int(10) DEFAULT NULL COMMENT '最后修改密码的时间',
  `last_logintime` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `api_token` varchar(32) DEFAULT NULL COMMENT 'app登录token',
  `api_logintime` int(11) DEFAULT NULL COMMENT 'app最后登录时间',
  `last_cu_id` int(10) DEFAULT '0' COMMENT '最后切换的客户id',
  `last_co_id` int(10) DEFAULT '0' COMMENT '最后切换的联系人id',
  `ur_audittype` tinyint(2) unsigned DEFAULT '0' COMMENT '审核类型 0--免审核 1--新增审核，2--锁定审核',
  `mini_openid` varchar(32) DEFAULT '' COMMENT '微信小程序openid',
  `unionid` varchar(32) DEFAULT '' COMMENT '微信unionid',
  `mini_avatar` varchar(255) DEFAULT '' COMMENT '微信头像',
  PRIMARY KEY (`ur_uid`),
  UNIQUE KEY `ur_account` (`ur_account`,`ur_type`),
  KEY `ur_type` (`ur_type`),
  KEY `ur_identifier` (`ur_identifier`),
  KEY `ur_token` (`ur_token`)
) ENGINE=InnoDB AUTO_INCREMENT=11674 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Table structure for user_connection_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_connection_groups`;
CREATE TABLE `user_connection_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `connection_group_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_connection_groups_on_connection_group_id` (`connection_group_id`),
  KEY `idx_user_connection_groups_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_customer_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `user_customer_role_relation`;
CREATE TABLE `user_customer_role_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `customer_name` varchar(200) NOT NULL COMMENT '客户名称',
  `sg_id` int(11) NOT NULL COMMENT '角色id',
  `sg_name` varchar(100) NOT NULL COMMENT '角色名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `create_operator` varchar(50) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `update_operator` varchar(50) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_id` (`customer_id`,`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=6542 DEFAULT CHARSET=utf8 COMMENT='用户客户角色关系表';

-- ----------------------------
-- Table structure for user_filter_profiles
-- ----------------------------
DROP TABLE IF EXISTS `user_filter_profiles`;
CREATE TABLE `user_filter_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_name` varchar(255) NOT NULL,
  `filter_data` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_filter_profiles_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_pass
-- ----------------------------
DROP TABLE IF EXISTS `user_pass`;
CREATE TABLE `user_pass` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `ur_uid` int(10) NOT NULL COMMENT '用户ID',
  `passwd` char(32) NOT NULL COMMENT '历史密码',
  `createtime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ur_uid` (`ur_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1971 DEFAULT CHARSET=utf8 COMMENT='用户历史密码表';

-- ----------------------------
-- Table structure for user_preferences
-- ----------------------------
DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `process_list` int(11) DEFAULT '5',
  `deadlock` int(11) DEFAULT '5',
  `dashboard_filter_shown` varchar(255) DEFAULT '["status_bar", "cpu_usage_percentage", "memory_usage_percentage", "connections_total", "query_rate", "db_sizes_total", "statement_rw", "network_io"]',
  `dashboard_filter_sort_by` varchar(255) DEFAULT 'severity',
  `dashboard_filter_group` int(11) DEFAULT '0',
  `dashboard_custom_order` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_preferences_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_property
-- ----------------------------
DROP TABLE IF EXISTS `user_property`;
CREATE TABLE `user_property` (
  `up_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '查询序号',
  `ur_uid` int(11) unsigned DEFAULT '0' COMMENT '用户UID',
  `up_type` tinyint(4) unsigned DEFAULT '0' COMMENT '属性类型，0我的查询，1',
  `up_title` char(255) DEFAULT '' COMMENT '标题',
  `up_content` text COMMENT '内容',
  `up_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `up_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`up_id`),
  KEY `ur_uid` (`ur_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='用户属性';

-- ----------------------------
-- Table structure for user_sessions
-- ----------------------------
DROP TABLE IF EXISTS `user_sessions`;
CREATE TABLE `user_sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_session_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_user_sessions_on_user_session_id` (`user_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user_signature
-- ----------------------------
DROP TABLE IF EXISTS `user_signature`;
CREATE TABLE `user_signature` (
  `us_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '签名序列号',
  `em_id` int(10) DEFAULT NULL COMMENT '员工序号',
  `us_username` char(32) DEFAULT NULL COMMENT '姓名',
  `at_id` int(10) DEFAULT NULL COMMENT '附件表at_id',
  `us_createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `us_status` int(1) DEFAULT '1' COMMENT '状态(0=>删除，1=>正常)',
  `us_identity` tinyint(1) DEFAULT '1' COMMENT '审核身份(1=>校准人；2=>审核人；3=>批准人)',
  PRIMARY KEY (`us_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COMMENT='用户签名配置表';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `login_name` varchar(255) DEFAULT NULL,
  `auth_method` varchar(255) DEFAULT 'internal',
  `country_code` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT '3',
  `tutorial1` int(11) DEFAULT '0',
  `tutorial2` int(11) DEFAULT '0',
  `tutorial3` int(11) DEFAULT '0',
  `country_code_iso2` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en',
  `should_show_trial_expired_bar` tinyint(1) NOT NULL DEFAULT '1',
  `should_show_activate_tokens_popover` tinyint(1) NOT NULL DEFAULT '1',
  `read_time` timestamp NOT NULL DEFAULT '1970-01-02 00:00:00',
  `should_show_launch_promotion_bar` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_users_on_email` (`email`),
  KEY `idx_users_on_login_name` (`login_name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for verification
-- ----------------------------
DROP TABLE IF EXISTS `verification`;
CREATE TABLE `verification` (
  `vf_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '验证id',
  `vf_no` varchar(25) DEFAULT NULL COMMENT '验证编号',
  `vf_vtime` int(10) DEFAULT NULL COMMENT '验证时间',
  `vf_status` tinyint(1) DEFAULT NULL COMMENT '验证类型',
  `vf_lctp_name` varchar(32) DEFAULT NULL COMMENT '客户物流对接人',
  `vf_qap_name` varchar(32) DEFAULT NULL COMMENT '客户QA对接人',
  `vf_leader_id` int(6) DEFAULT NULL COMMENT '验证负责人id',
  `vf_leader_name` varchar(32) DEFAULT NULL COMMENT '验证负责人',
  `vf_executor_id` int(6) DEFAULT NULL COMMENT '验证执行人id',
  `vf_executor_name` varchar(32) DEFAULT NULL COMMENT '验证执行人',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货序号',
  `sto_name` varchar(32) DEFAULT NULL COMMENT '存货名称（箱型）',
  `cu_id` int(11) DEFAULT NULL COMMENT '客户序号',
  `cu_name` char(32) DEFAULT NULL COMMENT '客户编号',
  `to_temperature` int(6) DEFAULT NULL COMMENT '温度',
  `start_region_id` int(11) DEFAULT NULL COMMENT '出发所在地区ID',
  `start_region_name` varchar(128) DEFAULT NULL COMMENT '出发地区名',
  `stop_region_id` int(11) DEFAULT NULL COMMENT '目的所在地区ID',
  `stop_region_name` varchar(128) DEFAULT NULL COMMENT '目的地区名',
  `start_cu_name` varchar(128) DEFAULT NULL COMMENT '发件客户',
  `stop_cu_name` varchar(128) DEFAULT NULL COMMENT '收件客户',
  `vf_type` tinyint(1) DEFAULT '1' COMMENT '验证进度 1 未执行 2 已执行 3 验证结束 4 报告已完成',
  `vf_remarks` text COMMENT '备注',
  `vf_delete_validation` text COMMENT '删除验证原因',
  `vf_create_uid` int(11) DEFAULT '0' COMMENT '创建用户序号',
  `vf_create_username` varchar(32) DEFAULT NULL COMMENT '创建用户姓名',
  `vf_createtime` int(10) DEFAULT '0' COMMENT '创建时间',
  `vf_lastupdtime` int(10) DEFAULT '0' COMMENT '最后一次修改时间',
  `vf_visible` tinyint(1) DEFAULT '1' COMMENT '验证单状态 1正常 0删除',
  `qvo_id` int(11) NOT NULL,
  `to_no` varchar(20) NOT NULL,
  `vf_clearing_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '结算状态(1=>未结算；2=>已结算)',
  `vf_clearing_price` decimal(10,2) DEFAULT NULL COMMENT '结算金额',
  `vf_clearing_note` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `vf_related_no` varchar(255) DEFAULT NULL COMMENT '关联验证编号',
  `vf_related_id` varchar(255) DEFAULT NULL COMMENT '关联验证ID',
  `vf_route_city` text COMMENT '验证城市路由',
  `vf_abnormal_status` tinyint(1) DEFAULT '1' COMMENT '是否是异常1、正常，2、异常',
  PRIMARY KEY (`vf_id`),
  UNIQUE KEY `vf_no` (`vf_no`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8mb4 COMMENT='验证管理表';

-- ----------------------------
-- Table structure for verify_code
-- ----------------------------
DROP TABLE IF EXISTS `verify_code`;
CREATE TABLE `verify_code` (
  `vc_id` bigint(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `vc_phonenum` char(16) DEFAULT '' COMMENT '手机号码',
  `vc_op` char(16) DEFAULT '' COMMENT '操作类型',
  `vc_code` char(8) DEFAULT '' COMMENT '发送的验证码',
  `vc_ttl` smallint(6) DEFAULT '0' COMMENT '验证码有效期，单位分钟',
  `vc_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `vc_state` tinyint(4) DEFAULT '0' COMMENT '发送状态 默认0失败 1成功',
  `is_used` tinyint(4) DEFAULT '0' COMMENT '1已使用 0未使用',
  `vc_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`vc_id`),
  KEY `vc_createtime` (`vc_createtime`),
  KEY `phonenum_op` (`vc_phonenum`,`vc_op`,`vc_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信验证码表';

-- ----------------------------
-- Table structure for version_information
-- ----------------------------
DROP TABLE IF EXISTS `version_information`;
CREATE TABLE `version_information` (
  `vi_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'APP版本信息表',
  `vi_version_name` varchar(255) DEFAULT NULL COMMENT '版本名称',
  `vi_version_code` int(11) DEFAULT NULL COMMENT '版本代号',
  `vi_release_note` varchar(2555) DEFAULT NULL COMMENT '版本更新详情，更新了什么功能',
  `vi_download_url` varchar(255) DEFAULT NULL COMMENT '版本下载地址',
  `vi_isforce` tinyint(4) unsigned DEFAULT '0' COMMENT '是否强制更新 0：不强制 ，1：强制',
  `vi_server_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '操作端:1=物流,2=药品',
  PRIMARY KEY (`vi_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `wa_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '仓库序号',
  `wa_no` char(32) DEFAULT '' COMMENT '仓库编号',
  `wa_name` char(32) DEFAULT '' COMMENT '仓库名称',
  `region_id` int(11) unsigned DEFAULT '0' COMMENT '所在地区ID',
  `em_id` int(11) unsigned DEFAULT '0' COMMENT '员工序号',
  `wa_contact_tel` char(16) DEFAULT '' COMMENT '联系电话',
  `wa_address` char(128) DEFAULT '' COMMENT '仓库地址',
  `wa_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `wa_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `wa_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `wa_visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1正常，0删除',
  PRIMARY KEY (`wa_id`),
  UNIQUE KEY `wa_no` (`wa_no`),
  KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1373 DEFAULT CHARSET=utf8 COMMENT='仓库表';

-- ----------------------------
-- Table structure for warehouse_thermometer
-- ----------------------------
DROP TABLE IF EXISTS `warehouse_thermometer`;
CREATE TABLE `warehouse_thermometer` (
  `stog_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sw_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '仓库id',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货id',
  `gd_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货明细表ID',
  `start_using_at` int(11) NOT NULL DEFAULT '0' COMMENT '启用日期',
  `end_using_at` int(11) NOT NULL DEFAULT '0' COMMENT '停用日期',
  `stog_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1未使用 2使用中 3停用',
  `create_at` int(11) NOT NULL DEFAULT '0' COMMENT '绑定时间',
  `is_del` tinyint(1) NOT NULL DEFAULT '2' COMMENT '是否删除 1是 2否',
  `del_at` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `remark` varchar(200) NOT NULL COMMENT '仓库温度计探头绑定备注',
  PRIMARY KEY (`stog_id`),
  KEY `sw_id` (`sw_id`),
  KEY `sto_id` (`sto_id`),
  KEY `gd_id` (`gd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='仓库温度计探头绑定表';

-- ----------------------------
-- Table structure for warse_offer
-- ----------------------------
DROP TABLE IF EXISTS `warse_offer`;
CREATE TABLE `warse_offer` (
  `wo_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '药品报价自增id',
  `cu_id` int(11) NOT NULL DEFAULT '0' COMMENT '委托客户id',
  `cu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '委托客户名称',
  `wo_box_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '库位盒报价（个）',
  `wo_space_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '货位（立方）',
  `wo_tray_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '托盘报价（个）',
  `wo_package_offer` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '客户包装（立方）',
  `wo_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0正常1删除',
  `wo_remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `wo_create_uid` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `wo_lastupd_uid` int(11) NOT NULL DEFAULT '0' COMMENT '最后更新人',
  `wo_createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `wo_lastupdtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`wo_id`),
  KEY `idx_cu_id` (`cu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='药品仓储报价';

-- ----------------------------
-- Table structure for we_chat
-- ----------------------------
DROP TABLE IF EXISTS `we_chat`;
CREATE TABLE `we_chat` (
  `wu_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(128) NOT NULL,
  `uid` int(11) unsigned NOT NULL COMMENT 'oms用户id',
  `wu_visible` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '绑定状态 1-已绑定 2-未绑定 3-待审核',
  `wu_createtime` varchar(11) NOT NULL,
  `wu_username` varchar(50) NOT NULL COMMENT '姓名',
  `wu_phone` varchar(11) NOT NULL DEFAULT '0' COMMENT '手机号码',
  `wu_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '"1"--服务号绑定 , "2"--操作号绑定(绑定来源)',
  `wu_bind_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '绑定状态 1--正常，2--解绑  (用于保留和区分单人多次绑定和解绑操作)',
  PRIMARY KEY (`wu_id`),
  KEY `openid` (`openid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5078 DEFAULT CHARSET=utf8 COMMENT='微信账号绑定表';

-- ----------------------------
-- Table structure for we_chat_copying
-- ----------------------------
DROP TABLE IF EXISTS `we_chat_copying`;
CREATE TABLE `we_chat_copying` (
  `wp_id` int(10) NOT NULL AUTO_INCREMENT,
  `wp_co_id` int(10) NOT NULL COMMENT '联系人id',
  `wp_to_co_id` int(10) NOT NULL COMMENT '抄送的联系人id',
  `wp_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1 正常 2 删除',
  `wp_createtime` int(10) DEFAULT NULL,
  `wp_lastupdtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`wp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=latin1 COMMENT='微信抄送';

-- ----------------------------
-- Table structure for wechat_params
-- ----------------------------
DROP TABLE IF EXISTS `wechat_params`;
CREATE TABLE `wechat_params` (
  `wp_id` int(2) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `wp_name` varchar(32) DEFAULT NULL COMMENT 'access_token、jssdk名称',
  `wp_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '1-服务号，2-操作号',
  `wp_code` varchar(512) DEFAULT NULL COMMENT 'access_token、jssdk凭据（1.5小时刷新一次）',
  `expires_in` int(11) unsigned NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`wp_id`),
  KEY `name` (`wp_name`),
  KEY `type` (`wp_type`)
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wms_customer_yp_stock_day_report
-- ----------------------------
DROP TABLE IF EXISTS `wms_customer_yp_stock_day_report`;
CREATE TABLE `wms_customer_yp_stock_day_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_day` varchar(15) NOT NULL COMMENT '报告日期',
  `cu_name` varchar(100) NOT NULL COMMENT '客户名称',
  `total_stock_accuracy_rate` decimal(10,2) DEFAULT '0.00' COMMENT '总库存准确率',
  `goods_location_stock_accuracy_rate` decimal(10,2) DEFAULT '0.00' COMMENT '货位库存准确率',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `cu_id` int(11) unsigned DEFAULT NULL COMMENT '客户id',
  `created_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1561 DEFAULT CHARSET=utf8mb4 COMMENT='客户药品库存日报表';

-- ----------------------------
-- Table structure for wms_dryice_customer
-- ----------------------------
DROP TABLE IF EXISTS `wms_dryice_customer`;
CREATE TABLE `wms_dryice_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cu_id` int(11) DEFAULT NULL COMMENT '客户id',
  `cu_name` varchar(50) DEFAULT NULL COMMENT '客户姓名',
  `remark_log` longtext COMMENT '备注',
  `visible` int(11) DEFAULT '1' COMMENT '1:正常  0:删除',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wms_dryice_procurement
-- ----------------------------
DROP TABLE IF EXISTS `wms_dryice_procurement`;
CREATE TABLE `wms_dryice_procurement` (
  `wms_dip_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `dp_id` int(11) NOT NULL DEFAULT '0' COMMENT '主表ID',
  `wms_dip_resdate` int(11) DEFAULT '0' COMMENT '登记日期',
  `wms_dip_supplier` varchar(255) DEFAULT NULL COMMENT '供货商名称',
  `wms_dip_supplydate` int(11) DEFAULT '0' COMMENT '供货年月',
  `wms_dip_region_name` varchar(255) DEFAULT NULL COMMENT '供货城市',
  `wms_dip_region_id` int(11) DEFAULT '0' COMMENT '供货城市id',
  `wms_dip_uptax` float(11,2) DEFAULT '0.00' COMMENT '含税单价',
  `wms_dip_num` int(11) DEFAULT '0' COMMENT '数量',
  `wms_dip_total` float(11,2) DEFAULT '0.00' COMMENT '合计',
  `wms_dip_reamount` float(11,2) DEFAULT NULL COMMENT '报销金额',
  `wms_dip_inamount` float(11,2) DEFAULT '0.00' COMMENT '发票金额',
  `wms_dip_inno` varchar(255) DEFAULT NULL COMMENT '发票号',
  `wms_dip_indate` int(11) DEFAULT '0' COMMENT '发票日期',
  `wms_dip_at_id` varchar(128) DEFAULT NULL COMMENT '附件id',
  `wms_dip_visible` int(4) DEFAULT '1' COMMENT '状态 1.正常 2.删除',
  `wms_dip_subsidiary_company` varchar(100) DEFAULT NULL COMMENT '分子公司',
  `wms_dis_reamount_status` tinyint(5) DEFAULT '0' COMMENT '报销金额状态 0:未确认 1:已确认',
  `wms_dip_type` int(11) DEFAULT '1' COMMENT '1:正常采购  2:调拨采购',
  `wms_dip_allocate_city_id` int(11) DEFAULT NULL COMMENT '调拨城市id',
  `wms_dip_allocate_city_name` varchar(50) DEFAULT NULL COMMENT '调拨城市',
  `wms_dip_createtime` int(15) DEFAULT NULL COMMENT '创建时间',
  `wms_dip_ur_uid` int(11) DEFAULT NULL COMMENT '创建人ID',
  `wms_dip_username` varchar(30) DEFAULT NULL COMMENT '创建人',
  `wms_dip_quantity` int(11) DEFAULT NULL COMMENT '调拨采购数量',
  PRIMARY KEY (`wms_dip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=508 DEFAULT CHARSET=utf8mb4 COMMENT='干冰采购统计表';

-- ----------------------------
-- Table structure for wms_dryice_recycle
-- ----------------------------
DROP TABLE IF EXISTS `wms_dryice_recycle`;
CREATE TABLE `wms_dryice_recycle` (
  `wms_dr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '干冰回收ID',
  `wms_dr_region_id` int(11) DEFAULT NULL COMMENT '回收干冰城市ID',
  `wms_dr_region_name` varchar(32) DEFAULT NULL COMMENT '回收城市名字',
  `carea_id` int(11) NOT NULL COMMENT '大区id',
  `carea_name` varchar(30) NOT NULL COMMENT '大区名称',
  `wms_dr_time` int(11) DEFAULT NULL COMMENT '回收时间',
  `wms_dr_quantity` decimal(10,2) DEFAULT '0.00' COMMENT '干冰回收数量,单位KG',
  `wms_dr_ur_uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `wms_dr_ur_name` varchar(32) DEFAULT NULL COMMENT '操作人姓名',
  `wms_dr_visible` int(11) DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `wms_dr_createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`wms_dr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4 COMMENT='干冰回收表';

-- ----------------------------
-- Table structure for wms_hc_extend
-- ----------------------------
DROP TABLE IF EXISTS `wms_hc_extend`;
CREATE TABLE `wms_hc_extend` (
  `whe_id` int(11) NOT NULL AUTO_INCREMENT,
  `whe_sto_id` int(11) NOT NULL COMMENT '耗材ID',
  `whe_max_frequency` int(11) NOT NULL DEFAULT '0' COMMENT '温度计最大使用次数',
  `whe_max_usetime` float(11,2) NOT NULL COMMENT '温度使用年限',
  `whe_visible` int(4) NOT NULL DEFAULT '1' COMMENT '是否删除 1否 2是',
  PRIMARY KEY (`whe_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wms_inventory_check_abnormal
-- ----------------------------
DROP TABLE IF EXISTS `wms_inventory_check_abnormal`;
CREATE TABLE `wms_inventory_check_abnormal` (
  `wica_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `wica_ur_uid` int(11) DEFAULT NULL COMMENT '盘点人ID',
  `wica_username` varchar(55) DEFAULT NULL COMMENT '盘点人姓名',
  `wica_check_id` int(11) DEFAULT NULL COMMENT '盘点ID',
  `gd_series_number` varchar(255) DEFAULT NULL COMMENT '耗材编号',
  `wica_createtime` int(11) DEFAULT NULL COMMENT '盘点时间',
  `wica_wa_name` varchar(55) DEFAULT NULL COMMENT '仓库名称',
  `wica_wa_id` int(11) DEFAULT NULL COMMENT '盘点仓库ID',
  `sto_id` int(11) DEFAULT NULL COMMENT '存货编号',
  `wica_type` int(11) DEFAULT NULL COMMENT '1:耗材编号重复，2：耗材无库存记录',
  `wica_msg` varchar(255) DEFAULT NULL COMMENT '错误提示信息',
  PRIMARY KEY (`wica_id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COMMENT='盘点异常上报表';

-- ----------------------------
-- Table structure for wms_lock_resson
-- ----------------------------
DROP TABLE IF EXISTS `wms_lock_resson`;
CREATE TABLE `wms_lock_resson` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `in_id` int(11) NOT NULL COMMENT '库存表id',
  `wa_id` int(11) NOT NULL DEFAULT '0' COMMENT '货位id',
  `wa_no` varchar(60) NOT NULL DEFAULT '0' COMMENT '货位编号',
  `sto_id` int(11) NOT NULL DEFAULT '0' COMMENT '存货id',
  `db_id` int(11) NOT NULL DEFAULT '0' COMMENT '批号id',
  `sto_no` varchar(50) NOT NULL DEFAULT '0' COMMENT '存货编号',
  `db_no` varchar(50) NOT NULL DEFAULT '0' COMMENT '批号编号',
  `sto_name` varchar(60) NOT NULL COMMENT '存货名称',
  `in_locknum` int(11) NOT NULL DEFAULT '0' COMMENT '锁定数量',
  `lock_reason` int(11) NOT NULL COMMENT '锁定原因:1自动锁定-下单锁定 2：自动锁定-过期锁定\r\n3：自动锁定-出库单锁定 4：人工锁定-留样锁定5：人工锁定-隔离锁定 6：人工锁定-待销毁锁定 7;人工锁定-返回药锁定 8:人工锁定-其他锁定',
  `created_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_show` int(5) NOT NULL DEFAULT '1' COMMENT '是否展示 默认1展示 0不展示',
  `lock_remark` varchar(100) NOT NULL COMMENT '人工锁定备注',
  `sto_has_identifier` int(4) NOT NULL DEFAULT '0' COMMENT '是否有编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wms_order_material
-- ----------------------------
DROP TABLE IF EXISTS `wms_order_material`;
CREATE TABLE `wms_order_material` (
  `om_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单包装耗材序号',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '运输单序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `wa_no` char(32) DEFAULT '' COMMENT '仓库编号',
  `wa_name` char(32) DEFAULT '' COMMENT '仓库名称',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `stt_id` int(11) DEFAULT NULL COMMENT '存货类型序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(32) DEFAULT '' COMMENT '存货名称',
  `gd_series_number` varchar(32) DEFAULT NULL COMMENT '温度计序列号',
  `om_quantity` int(10) DEFAULT '0' COMMENT '数量',
  `om_weight` decimal(10,2) DEFAULT '0.00' COMMENT '重量（千克）',
  `ol_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `ol_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `visible` tinyint(1) unsigned DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `gd_id` int(11) DEFAULT '0' COMMENT '物资id',
  PRIMARY KEY (`om_id`),
  KEY `to_id` (`to_id`),
  KEY `sto_id` (`sto_id`),
  KEY `visible` (`visible`),
  KEY `gd_id` (`gd_id`)
) ENGINE=InnoDB AUTO_INCREMENT=135397 DEFAULT CHARSET=utf8 COMMENT='运输单包装耗材表';

-- ----------------------------
-- Table structure for wms_prevent_duplicate
-- ----------------------------
DROP TABLE IF EXISTS `wms_prevent_duplicate`;
CREATE TABLE `wms_prevent_duplicate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `action_key` varchar(50) NOT NULL COMMENT '操作key',
  `action_desc` varchar(200) DEFAULT '' COMMENT '操作备注',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `action_key` (`action_key`)
) ENGINE=InnoDB AUTO_INCREMENT=1015 DEFAULT CHARSET=utf8 COMMENT='仓储防止重复表';

-- ----------------------------
-- Table structure for wms_supplier_remark_log
-- ----------------------------
DROP TABLE IF EXISTS `wms_supplier_remark_log`;
CREATE TABLE `wms_supplier_remark_log` (
  `wms_supre_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '供应商修改日志',
  `wms_su_id` int(11) DEFAULT NULL COMMENT '供应商id',
  `wms_supre_log` text NOT NULL COMMENT '日志',
  `wms_supre_create_uid` int(11) NOT NULL COMMENT '日志创建人',
  `wms_supre_create_name` varchar(255) NOT NULL COMMENT '日志创建人信息',
  `wms_supre_create_time` int(11) NOT NULL COMMENT '日志时间',
  `wms_supre_type` varchar(255) NOT NULL COMMENT '日志类型',
  `wms_supre_visible` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0 正常  1删除',
  PRIMARY KEY (`wms_supre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wms_sw_management
-- ----------------------------
DROP TABLE IF EXISTS `wms_sw_management`;
CREATE TABLE `wms_sw_management` (
  `wms_swman_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '仓库管理员表主键',
  `wms_sw_id` int(11) NOT NULL COMMENT '仓库id',
  `wms_swman_uid` int(11) NOT NULL COMMENT '管理员用户id',
  `wms_swman_username` varchar(255) NOT NULL COMMENT '管理员用户名称',
  `wms_swman_status` int(4) NOT NULL DEFAULT '1' COMMENT '状态  1.正常  2.删除 ',
  PRIMARY KEY (`wms_swman_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wms_transport_order
-- ----------------------------
DROP TABLE IF EXISTS `wms_transport_order`;
CREATE TABLE `wms_transport_order` (
  `to_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '运输单序号',
  `to_no` char(32) DEFAULT '' COMMENT '纸质运单编号',
  `start_region_id` int(11) unsigned DEFAULT '0' COMMENT '发件所在地区ID',
  `start_region_name` char(128) DEFAULT NULL COMMENT '发件地区名',
  `start_co_name` char(128) DEFAULT NULL COMMENT '发件客户',
  `start_mobile_phone` char(64) DEFAULT NULL COMMENT '发件联系手机',
  `start_address` char(128) DEFAULT NULL COMMENT '发件联系地址',
  `stop_region_id` int(11) unsigned DEFAULT '0' COMMENT '收件所在地区ID',
  `stop_region_name` char(128) DEFAULT NULL COMMENT '收件地区名',
  `stop_co_name` char(128) DEFAULT NULL COMMENT '收件联系人',
  `stop_mobile_phone` char(64) DEFAULT NULL COMMENT '收件联系手机',
  `stop_address` char(128) DEFAULT NULL COMMENT '收件联系地址',
  `to_status` tinyint(4) unsigned DEFAULT '0' COMMENT '运输单状态 0新建 1已审核 2已取件 3已发货 4已提货 5已派件 6已反馈 7已取消 8已关闭 9删除',
  `to_remark` longtext COMMENT '耗材明细',
  `to_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `to_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `to_createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `to_lastupdtime` int(10) unsigned DEFAULT '0' COMMENT '最后一次修改时间',
  `to_source` tinyint(4) NOT NULL DEFAULT '1' COMMENT '订单来源',
  `child_start_region_id` int(11) DEFAULT NULL COMMENT '出发城市子级id',
  `child_start_region_name` varchar(255) DEFAULT NULL COMMENT '出发城市子级名称',
  `child_stop_region_id` int(11) DEFAULT NULL COMMENT '到达城市子级id',
  `child_stop_region_name` varchar(255) DEFAULT NULL COMMENT '到达城市子级名称',
  `ol_goods_quantity` int(10) DEFAULT '0' COMMENT '货物件数',
  `ol_goods_weight` decimal(10,2) DEFAULT '0.00' COMMENT '货物重量（千克）',
  `ol_delivery_time` int(10) DEFAULT '0' COMMENT '派件时间',
  `ol_delivery_person` varchar(1024) DEFAULT NULL COMMENT '派件人，以逗号分隔，具有操作员标识的用户',
  `ol_delivery_name` varchar(1024) DEFAULT NULL COMMENT '派件人，用逗号分隔',
  `ol_remark` longtext COMMENT '其他备注',
  `ol_pickup_time` int(10) DEFAULT '0' COMMENT '取件时间',
  `ol_pickup_person` varchar(1024) DEFAULT NULL COMMENT '取件人，以逗号分隔，具有操作员标识的用户',
  `ol_pickup_name` varchar(1024) DEFAULT NULL COMMENT '取件人 用逗号间隔',
  `oi_fhtime` int(11) DEFAULT '0' COMMENT '运营调拨单发货时间',
  `ol_pickup_planbegin` int(11) DEFAULT '0' COMMENT '计划取件时间',
  `di_type` varchar(255) DEFAULT NULL COMMENT '发货路由',
  `ol_delivery_type` varchar(255) DEFAULT NULL COMMENT '到货方式',
  `ol_delivery_planbegin` int(11) DEFAULT NULL COMMENT '计划派件时间',
  `start_sw_name` varchar(255) DEFAULT NULL COMMENT '发货仓库名称',
  `start_sw_id` int(11) DEFAULT '0' COMMENT '发货仓库id',
  `stop_sw_name` varchar(255) DEFAULT NULL COMMENT '收货仓库名称',
  `stop_sw_id` int(11) DEFAULT '0' COMMENT '收货仓库id',
  `special_line_status` tinyint(4) DEFAULT '0' COMMENT '专线下发状态  0 未下发 1已下发 2已撤回',
  PRIMARY KEY (`to_id`),
  KEY `to_no` (`to_no`),
  KEY `to_create_uid` (`to_create_uid`),
  KEY `start_region_id` (`start_region_id`),
  KEY `stop_region_id` (`stop_region_id`),
  KEY `to_status` (`to_status`),
  KEY `to_source` (`to_source`),
  KEY `cp_id_index` (`to_create_uid`)
) ENGINE=InnoDB AUTO_INCREMENT=632592 DEFAULT CHARSET=utf8 COMMENT='运输订单表';

-- ----------------------------
-- Table structure for wms_warehouse_position_view
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse_position_view`;
CREATE TABLE `wms_warehouse_position_view` (
  `vid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `view_city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `view_city_name` varchar(50) NOT NULL DEFAULT '' COMMENT '城市名称',
  `view_warehouse_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '仓库类型：1仓库 2库房 3货架',
  `view_name` varchar(100) NOT NULL DEFAULT '' COMMENT '视图名称',
  `view_data` longtext NOT NULL COMMENT '视图数据',
  `view_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父亲级视图id',
  `view_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '视图状态：0不可用 1可用',
  `view_createtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `view_createuser` int(11) NOT NULL DEFAULT '0' COMMENT '添加人',
  `view_updatetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `view_updateuser` int(11) NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓储位置视图';

-- ----------------------------
-- Table structure for wms_warehouse_position_view_copy1
-- ----------------------------
DROP TABLE IF EXISTS `wms_warehouse_position_view_copy1`;
CREATE TABLE `wms_warehouse_position_view_copy1` (
  `vid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `view_city_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `view_city_name` varchar(50) NOT NULL DEFAULT '' COMMENT '城市名称',
  `view_warehouse_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '仓库类型：1仓库 2库房 3货架',
  `view_name` varchar(100) NOT NULL DEFAULT '' COMMENT '视图名称',
  `view_data` longtext NOT NULL COMMENT '视图数据',
  `view_parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父亲级视图id',
  `view_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '视图状态：0不可用 1可用',
  `view_createtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `view_createuser` int(11) NOT NULL DEFAULT '0' COMMENT '添加人',
  `view_updatetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `view_updateuser` int(11) NOT NULL DEFAULT '0' COMMENT '更新人',
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='仓储位置视图';

-- ----------------------------
-- Table structure for wms_yb_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_yb_inventory`;
CREATE TABLE `wms_yb_inventory` (
  `in_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '存货货位id   sw_id ',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `in_quantity` smallint(6) DEFAULT '0' COMMENT '库存数量',
  `in_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `in_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `in_status` tinyint(1) unsigned DEFAULT '0' COMMENT '库存状态 0--正常 2--锁定',
  `in_locknum` int(10) unsigned DEFAULT '0' COMMENT '库存锁定数量',
  `locking` int(10) NOT NULL DEFAULT '0' COMMENT '后台库存锁定数量',
  PRIMARY KEY (`in_id`),
  UNIQUE KEY `wa_id_sto_id` (`wa_id`,`sto_id`),
  KEY `wa_id` (`wa_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024997 DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Table structure for wms_yb_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_yb_inventory_detail`;
CREATE TABLE `wms_yb_inventory_detail` (
  `id_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存详细序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `id_stock_detail` char(32) DEFAULT '' COMMENT '存货明细编号',
  `in_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `in_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-库存中 1-已出库',
  `in_lockstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态 0-正常 1-已锁定',
  PRIMARY KEY (`id_id`),
  KEY `id_stock_detail` (`id_stock_detail`),
  KEY `wa_id` (`wa_id`),
  KEY `sto_id` (`sto_id`),
  KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=1433155 DEFAULT CHARSET=utf8 COMMENT='库存详细表';

-- ----------------------------
-- Table structure for wms_yb_iostorage
-- ----------------------------
DROP TABLE IF EXISTS `wms_yb_iostorage`;
CREATE TABLE `wms_yb_iostorage` (
  `io_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '出入库单序号',
  `io_no` char(32) DEFAULT '' COMMENT '出入库单编号，系统按规则生成：入库RK+8位序号数字，出库CK+8位序号数字',
  `io_type` tinyint(4) unsigned DEFAULT '0' COMMENT '出入库类型，0入库，1出库，2暂存入库，3暂存出库',
  `io_subtype` tinyint(4) unsigned DEFAULT '0' COMMENT '出入库方式，1采购入库，2常规入库，3订单入库，4其它入库，5常规出库，6订单出库，7报损出库，8其它出库，9调拨入库，10调拨出库，11盘点入库，12扫码归还出库，13扫码归还入库，16销售出库，17盘亏出库',
  `em_id` int(11) unsigned DEFAULT '0' COMMENT '经办人，员工序号',
  `em_name` char(32) DEFAULT '' COMMENT '经办人，员工姓名',
  `io_assign_uid` int(11) unsigned DEFAULT '0' COMMENT '指派给用户序号',
  `io_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `wa_no` char(32) DEFAULT '' COMMENT '仓库编号',
  `wa_name` char(32) DEFAULT '' COMMENT '仓库名称',
  `pu_no` char(32) DEFAULT '' COMMENT '采购单编号',
  `tr_no` char(32) DEFAULT '' COMMENT '运输单编号',
  `io_transfer` varchar(255) DEFAULT '' COMMENT '交货人或收货人',
  `io_fromto` varchar(120) DEFAULT '' COMMENT '来源去向',
  `io_status` tinyint(4) unsigned DEFAULT '0' COMMENT '出入库单状态 0新建 1已取消 2关闭 3 待审核，4，待发货 5:方案核对',
  `io_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `io_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `io_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `io_entrusttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '委托日期',
  `io_storagetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入库或出库日期',
  `io_closetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结案时间',
  `io_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `io_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `io_sample_status` int(1) unsigned DEFAULT '1' COMMENT '1未生成样本结算2已生成',
  `io_goodstype` tinyint(4) unsigned DEFAULT '1' COMMENT '出入库货物类型 1.样本，2.耗材，3.药品',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '订单ID 0为耗材出入库',
  PRIMARY KEY (`io_id`),
  KEY `wa_id` (`wa_id`),
  KEY `io_no` (`io_no`),
  KEY `io_storagetime` (`io_storagetime`),
  KEY `tr_no` (`tr_no`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=833436 DEFAULT CHARSET=utf8 COMMENT='出入库单表';

-- ----------------------------
-- Table structure for wms_yb_iostorage_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_yb_iostorage_detail`;
CREATE TABLE `wms_yb_iostorage_detail` (
  `id_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '出入库明细序号',
  `io_id` int(11) unsigned DEFAULT '0' COMMENT '出入库单序号',
  `sw_id` int(11) DEFAULT '0' COMMENT '子仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(255) DEFAULT '' COMMENT '存货名称',
  `sto_batch` char(128) DEFAULT '' COMMENT '批号',
  `id_stock_detail` longtext COMMENT '存货明细编号',
  `id_quantity` smallint(6) DEFAULT '0' COMMENT '数量，入库数字是正数，出库数字是负数',
  `id_order_quantity` smallint(6) DEFAULT '0' COMMENT '订单数量',
  `id_adjust_quantity` smallint(6) DEFAULT '0' COMMENT '调整数量',
  `id_location` char(32) DEFAULT '' COMMENT '货物存放位置',
  `conditions` varchar(255) DEFAULT NULL COMMENT '条件区间',
  `id_remark` char(128) DEFAULT '' COMMENT '备注',
  `id_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `id_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `id_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `sto_counting` varchar(255) DEFAULT NULL COMMENT '最小单位',
  `id_packing_quantity` varchar(255) DEFAULT '0' COMMENT '包装数量',
  `id_packing_unit` varchar(255) DEFAULT '' COMMENT '包装单位',
  `id_sto_numbers` text COMMENT '批量录入明细',
  `id_pickup_status` tinyint(4) DEFAULT '0' COMMENT '状态 0-待捡查 1-已捡查',
  `ur_uid` int(11) DEFAULT '0' COMMENT '捡药人ID',
  `username` varchar(50) DEFAULT '' COMMENT '捡药人姓名',
  PRIMARY KEY (`id_id`),
  KEY `io_id` (`io_id`),
  KEY `sto_id` (`sto_id`),
  KEY `id_stock_detail` (`id_stock_detail`(255)),
  KEY `sw_id` (`sw_id`),
  KEY `id_visible` (`id_visible`),
  KEY `io_id_sto_id` (`id_visible`,`io_id`,`sto_id`,`id_quantity`)
) ENGINE=InnoDB AUTO_INCREMENT=8806748 DEFAULT CHARSET=utf8 COMMENT='出入库明细表';

-- ----------------------------
-- Table structure for wms_yb_transfer
-- ----------------------------
DROP TABLE IF EXISTS `wms_yb_transfer`;
CREATE TABLE `wms_yb_transfer` (
  `tr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '序号',
  `tr_no` varchar(30) DEFAULT NULL COMMENT '移库单号',
  `tr_type` int(1) NOT NULL DEFAULT '1' COMMENT '移库状态   1新建   2已移入  3已取消',
  `out_swid` int(10) unsigned DEFAULT NULL COMMENT '移出仓库',
  `in_swid` int(10) unsigned DEFAULT NULL COMMENT '移入仓库',
  `wa_uid` int(10) unsigned DEFAULT NULL COMMENT '移入仓管员',
  `create_uid` int(10) unsigned DEFAULT NULL COMMENT '创建人',
  `tr_createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `tr_lastuptime` int(10) DEFAULT NULL COMMENT '最后一次修改时间',
  `tr_remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `tr_storagetime` int(11) DEFAULT NULL COMMENT '移库时间',
  `transfer_out` int(11) DEFAULT NULL COMMENT '移出仓库日期',
  `transfer_in` int(11) DEFAULT NULL COMMENT '移入仓库日期',
  `thermometer` varchar(50) DEFAULT NULL COMMENT '温度计编号',
  PRIMARY KEY (`tr_id`),
  KEY `out_swid` (`out_swid`),
  KEY `in_swid` (`in_swid`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COMMENT='移库表';

-- ----------------------------
-- Table structure for wms_yb_transfer_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_yb_transfer_detail`;
CREATE TABLE `wms_yb_transfer_detail` (
  `td_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '明细序号',
  `tr_id` int(11) unsigned DEFAULT NULL COMMENT '移库单序号',
  `sto_id` int(11) unsigned DEFAULT NULL COMMENT '存货序号',
  `sto_no` varchar(255) DEFAULT '' COMMENT '存货编号',
  `sto_name` varchar(255) DEFAULT '' COMMENT '存货名称',
  `sto_batch` varchar(255) DEFAULT '' COMMENT '批号',
  `id_stock_detail` longtext COMMENT '存货明细编号',
  `id_quantity` smallint(6) unsigned DEFAULT '0' COMMENT '数量',
  `sto_has_identifier` int(1) unsigned DEFAULT NULL COMMENT '有无编号',
  `conditions` varchar(255) DEFAULT NULL COMMENT '条件区间',
  `id_sto_numbers` text COMMENT '批量录入明细',
  `sw_id_out` int(11) DEFAULT NULL COMMENT '移出货位',
  `sw_id_in` int(11) DEFAULT NULL COMMENT '移入货位',
  `spec_num` varchar(30) DEFAULT NULL COMMENT '包装数量',
  `unit` varchar(30) DEFAULT NULL COMMENT '单位',
  PRIMARY KEY (`td_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8 COMMENT='移库明细表';

-- ----------------------------
-- Table structure for wms_yp_disinfector
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_disinfector`;
CREATE TABLE `wms_yp_disinfector` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `di_id_id` int(11) NOT NULL COMMENT '出库单明细id',
  `di_io_id` int(11) NOT NULL COMMENT '药品处理单io_id',
  `di_disinfection_time` int(11) NOT NULL COMMENT '消杀日期',
  `di_cp_no` varchar(100) NOT NULL COMMENT '项目编号',
  `di_stock_name` varchar(100) NOT NULL COMMENT '药品名称',
  `di_sto_batch` varchar(60) NOT NULL COMMENT '药品批号名称',
  `di_sto_counting` varchar(125) NOT NULL COMMENT '规格/容量',
  `di_to_temperature` char(16) NOT NULL COMMENT '温度要求',
  `di_to_no` char(32) NOT NULL COMMENT '运单号',
  `di_packages_num` varchar(100) NOT NULL COMMENT '包材套数',
  `disinfectant_name` varchar(100) NOT NULL COMMENT '消毒剂名称',
  `disinfectant_address` varchar(100) NOT NULL COMMENT '消毒地点',
  `disinfector_name` varchar(50) NOT NULL COMMENT '消毒人',
  `review_disinfector_name` varchar(50) NOT NULL COMMENT '复核人',
  `di_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '消杀状态默认1已消杀  2消杀完成复核',
  `review_disinfector_time` int(11) NOT NULL COMMENT '消杀复核时间',
  `di_is_show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否展示默认1展示',
  `disinfector_name_uid` int(10) NOT NULL DEFAULT '0' COMMENT '消毒人uid',
  `review_disinfector_name_uid` int(10) NOT NULL COMMENT '复核人uid',
  `di_id_quantity` int(10) NOT NULL COMMENT '药品数量',
  `di_sto_id` int(11) NOT NULL COMMENT '药品id',
  `di_db_id` int(11) NOT NULL COMMENT '药品批号id',
  `di_to_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for wms_yp_inventory
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_inventory`;
CREATE TABLE `wms_yp_inventory` (
  `in_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '存货货位id   sw_id ',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `in_quantity` smallint(6) DEFAULT '0' COMMENT '库存数量',
  `in_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `in_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `in_status` tinyint(1) unsigned DEFAULT '0' COMMENT '库存状态 0--正常 2--锁定',
  `in_locknum` int(10) unsigned DEFAULT '0' COMMENT '库存锁定数量',
  `locking` int(10) NOT NULL DEFAULT '0' COMMENT '后台库存锁定数量',
  PRIMARY KEY (`in_id`),
  UNIQUE KEY `uni_sto_id_db_id_wa_id` (`sto_id`,`db_id`,`wa_id`),
  KEY `wa_id` (`wa_id`),
  KEY `sto_id` (`sto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1029979 DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Table structure for wms_yp_inventory_change_detail_log
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_inventory_change_detail_log`;
CREATE TABLE `wms_yp_inventory_change_detail_log` (
  `icdl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '药品库存变动明细药品序列号详情表',
  `icl_id` int(11) unsigned NOT NULL COMMENT '库存变动记录表ID',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `id_stock_detail` char(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '存货明细编号',
  `icdl_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`icdl_id`),
  KEY `idx_icl_id` (`icl_id`),
  KEY `idx_sto_id_db_id_id_stock_detail` (`sto_id`,`db_id`,`id_stock_detail`)
) ENGINE=InnoDB AUTO_INCREMENT=103219804 DEFAULT CHARSET=utf8mb4 COMMENT='药品库存变动明细药品序列号详情表';

-- ----------------------------
-- Table structure for wms_yp_inventory_change_log
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_inventory_change_log`;
CREATE TABLE `wms_yp_inventory_change_log` (
  `icl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存变动记录表ID',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `sto_has_identifier` tinyint(2) unsigned DEFAULT '0' COMMENT '有无编号:( 0-否，1-有)',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库货位id',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `icl_change_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '变动类型: (1-入库, 2-新建订单加锁, 3-修改订单解锁, 4-修改订单加锁, 5-出库, 6-后台过期加锁, 7-后台过期解锁, 8-取消订单, 9-移库出库, 10-移库入库)',
  `icl_change_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '变动数量',
  `in_quantity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前可用库存数量',
  `in_locknum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前下单库存锁定数量',
  `locking` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当前后台过期锁定数量',
  `icl_source_id` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '来源单号，对应变动类型',
  `icl_remark` varchar(200) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `icl_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`icl_id`),
  KEY `idx_icl_source_id_sto_has_identifier` (`icl_source_id`,`sto_has_identifier`),
  KEY `idx_sto_id_db_id` (`sto_id`,`db_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9622 DEFAULT CHARSET=utf8mb4 COMMENT='药品库存变动明细表';

-- ----------------------------
-- Table structure for wms_yp_inventory_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_inventory_detail`;
CREATE TABLE `wms_yp_inventory_detail` (
  `id_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '库存详细序号',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `id_stock_detail` char(32) DEFAULT '' COMMENT '存货明细编号',
  `in_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `in_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0-库存中 1-已出库',
  `in_lockstatus` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '锁定状态:0=正常,1=订单锁,2=过期锁,3=出库单锁,4=人工锁',
  `lock_reason` varchar(160) NOT NULL DEFAULT '' COMMENT '锁定原因',
  PRIMARY KEY (`id_id`),
  KEY `id_stock_detail` (`id_stock_detail`),
  KEY `wa_id` (`wa_id`),
  KEY `sto_id` (`sto_id`),
  KEY `state` (`state`)
) ENGINE=InnoDB AUTO_INCREMENT=4751844 DEFAULT CHARSET=utf8 COMMENT='库存详细表';

-- ----------------------------
-- Table structure for wms_yp_inventory_lock_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_inventory_lock_detail`;
CREATE TABLE `wms_yp_inventory_lock_detail` (
  `ild_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '锁定库存详情序号ID',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `ild_lock_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '锁定数量',
  `sto_has_identifier` tinyint(2) unsigned DEFAULT '0' COMMENT '有无编号:( 0-否，1-有)',
  `ild_lock_detail` longtext NOT NULL COMMENT '锁定存货明细编号',
  `ild_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '锁定类型: (1-下单锁定)',
  `ild_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:(1-已锁定, 2-已生成出库单, 3-已取消, 4-已出库)',
  `ild_source_id` varchar(50) NOT NULL COMMENT '来源单号，对应锁定类型',
  `ild_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ild_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`ild_id`),
  KEY `idx_sto_id` (`sto_id`),
  KEY `idx_ild_source_id` (`ild_source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3362 DEFAULT CHARSET=utf8 COMMENT='药品库存锁定详情表';

-- ----------------------------
-- Table structure for wms_yp_inventory_pre_lock
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_inventory_pre_lock`;
CREATE TABLE `wms_yp_inventory_pre_lock` (
  `ipl_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '药品总库存预锁表ID',
  `sto_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '存货序号',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `ipl_lock_num` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '预锁定数量',
  `ipl_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '预锁类型: (1-下单预锁定)',
  `ipl_state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态:(1-已预定, 2-已完成锁定, 3-已取消)',
  `ipl_source_id` varchar(50) NOT NULL COMMENT '来源单号，对应预锁定类型',
  `ipl_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ipl_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  PRIMARY KEY (`ipl_id`),
  KEY `idx_sto_id` (`sto_id`),
  KEY `idx_ild_source_id` (`ipl_source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=833 DEFAULT CHARSET=utf8 COMMENT='药品总库存预锁定表';

-- ----------------------------
-- Table structure for wms_yp_iostorage
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_iostorage`;
CREATE TABLE `wms_yp_iostorage` (
  `io_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '出入库单序号',
  `io_no` char(32) DEFAULT '' COMMENT '出入库单编号，系统按规则生成：入库RK+8位序号数字，出库CK+8位序号数字',
  `io_type` tinyint(4) unsigned DEFAULT '0' COMMENT '出入库类型，0入库，1出库，2暂存入库，3暂存出库',
  `io_subtype` tinyint(4) unsigned DEFAULT '0' COMMENT '出入库方式，1采购入库，2常规入库，3订单入库，4其它入库，5常规出库，6订单出库，7报损出库，8其它出库，9调拨入库，10调拨出库，11盘点入库，12扫码归还出库，13扫码归还入库，16销售出库，17盘亏出库',
  `em_id` int(11) unsigned DEFAULT '0' COMMENT '经办人，员工序号',
  `em_name` char(32) DEFAULT '' COMMENT '经办人，员工姓名',
  `io_assign_uid` int(11) unsigned DEFAULT '0' COMMENT '指派给用户序号',
  `io_assign_username` char(32) DEFAULT '' COMMENT '指派给用户姓名',
  `wa_id` int(11) unsigned DEFAULT '0' COMMENT '仓库序号',
  `wa_no` char(32) DEFAULT '' COMMENT '仓库编号',
  `wa_name` char(32) DEFAULT '' COMMENT '仓库名称',
  `pu_no` char(32) DEFAULT '' COMMENT '采购单编号',
  `tr_no` char(32) DEFAULT '' COMMENT '运输单编号',
  `io_transfer` varchar(255) DEFAULT '' COMMENT '交货人或收货人',
  `io_receive_time` int(11) DEFAULT NULL COMMENT '收货日期',
  `io_fromto` varchar(400) DEFAULT '' COMMENT '来源去向',
  `io_status` tinyint(4) DEFAULT '0' COMMENT '出入库单状态 0新建 1已取消 2关闭 3 待审核，4，待发货 5:方案核对',
  `io_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `io_create_uid` int(11) unsigned DEFAULT '0' COMMENT '创建用户序号',
  `io_create_username` char(32) DEFAULT '' COMMENT '创建用户姓名',
  `io_entrusttime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '委托日期(计划出库、到货日期)',
  `io_storagetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '入库或出库日期',
  `io_closetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '结案时间',
  `io_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `io_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `io_sample_status` int(1) unsigned DEFAULT '1' COMMENT '1未生成样本结算2已生成',
  `io_goodstype` tinyint(4) unsigned DEFAULT '1' COMMENT '出入库货物类型 1.样本，2.耗材，3.药品',
  `to_id` int(11) unsigned DEFAULT '0' COMMENT '订单ID 0为耗材出入库',
  `mo_id` int(11) DEFAULT '0' COMMENT '贴标订单ID',
  `mo_no` varchar(30) DEFAULT NULL COMMENT '贴标订单编号',
  `is_revocer_drug` int(11) DEFAULT '0' COMMENT '是否为回收药  1:是  0:否',
  `cu_id` int(11) DEFAULT NULL COMMENT '客户id',
  `cu_name` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `cu_no` varchar(50) DEFAULT NULL COMMENT '客户单号',
  `io_shipper` varchar(255) DEFAULT '' COMMENT '承运方',
  `io_plan_storagetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '计划入库或出库日期',
  `file_name` varchar(200) NOT NULL COMMENT '待准备文件名称',
  `is_kill` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否消杀默认0否 1是',
  PRIMARY KEY (`io_id`),
  KEY `wa_id` (`wa_id`),
  KEY `io_no` (`io_no`),
  KEY `io_storagetime` (`io_storagetime`),
  KEY `tr_no` (`tr_no`),
  KEY `to_id` (`to_id`)
) ENGINE=InnoDB AUTO_INCREMENT=836398 DEFAULT CHARSET=utf8 COMMENT='出入库单表';

-- ----------------------------
-- Table structure for wms_yp_iostorage_before
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_iostorage_before`;
CREATE TABLE `wms_yp_iostorage_before` (
  `before_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `io_id` int(11) NOT NULL COMMENT '出入库单id',
  `shipper` tinyint(4) NOT NULL COMMENT '承运方:1=三方运输,2=生生运输',
  `ss_track_no` varchar(100) DEFAULT NULL COMMENT '生生快递单号',
  `pack_num` int(10) NOT NULL COMMENT '包装件数',
  `box_info` text NOT NULL COMMENT '包装箱信息',
  `user_id` int(10) NOT NULL COMMENT '检查人',
  `username` varchar(55) DEFAULT NULL COMMENT '检查人名',
  `createtime` int(11) DEFAULT NULL COMMENT '检查时间',
  PRIMARY KEY (`before_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COMMENT='出入库前检查';

-- ----------------------------
-- Table structure for wms_yp_iostorage_detail
-- ----------------------------
DROP TABLE IF EXISTS `wms_yp_iostorage_detail`;
CREATE TABLE `wms_yp_iostorage_detail` (
  `id_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '出入库明细序号',
  `io_id` int(11) unsigned DEFAULT '0' COMMENT '出入库单序号',
  `w_sw_id` int(11) DEFAULT '0' COMMENT '子仓库ID',
  `sw_id` int(11) DEFAULT '0' COMMENT '子仓库货位序号',
  `sto_id` int(11) unsigned DEFAULT '0' COMMENT '存货序号',
  `sto_no` char(32) DEFAULT '' COMMENT '存货编号',
  `sto_name` char(255) DEFAULT '' COMMENT '存货名称',
  `sto_batch` char(128) DEFAULT '' COMMENT '批号',
  `db_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '批次号ID',
  `cp_no` text COMMENT '项目编号',
  `id_stock_detail` longtext COMMENT '存货明细编号',
  `id_quantity` int(10) DEFAULT '0' COMMENT '数量，入库数字是正数，出库数字是负数',
  `id_order_quantity` smallint(6) DEFAULT '0' COMMENT '订单数量',
  `id_adjust_quantity` smallint(6) DEFAULT '0' COMMENT '调整数量',
  `id_location` char(32) DEFAULT '' COMMENT '货物存放位置',
  `conditions` varchar(255) DEFAULT NULL COMMENT '条件区间',
  `id_remark` char(128) DEFAULT '' COMMENT '备注',
  `id_createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `id_lastupdtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次修改时间',
  `id_visible` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 1-显示 0-删除',
  `sto_counting` varchar(255) DEFAULT NULL COMMENT '最小单位',
  `id_sto_numbers` text COMMENT '批量录入明细',
  `id_pickup_status` tinyint(4) DEFAULT '0' COMMENT '状态 0-待捡查 1-已捡查',
  `ur_uid` int(11) DEFAULT '0' COMMENT '捡药人ID',
  `username` varchar(50) DEFAULT '' COMMENT '捡药人姓名',
  `version_num` varchar(50) DEFAULT 'v1.0.0',
  `yp_io_status` tinyint(4) DEFAULT '0' COMMENT '0:待捡药 1：已取消  2：待记台账 3：待复核  4：复核未通过  5：待发货  6：已关闭',
  `stand_book_id` int(11) DEFAULT NULL COMMENT '电子台账id',
  `review_reason` varchar(11) NOT NULL COMMENT '1：单据错误 2：实际捡药错误 3：台账数据不一致',
  `review_check_reason` varchar(11) DEFAULT NULL COMMENT '清点复核未通过原因:1=单据错误,2=清点错误,3=台账不符,4=货位错误',
  `review_check_remark` varchar(255) DEFAULT NULL COMMENT '清点复核备注',
  `review_check_username` varchar(55) DEFAULT NULL COMMENT '清点复核人',
  `check_username` varchar(255) DEFAULT NULL COMMENT '清点人',
  `check_time` int(11) DEFAULT NULL COMMENT '清点时间',
  `pass_reason` varchar(10) NOT NULL COMMENT '质量放行未通过原因:1=单据错误,2=清点错误,3=台账不符,4=货位错误',
  `pass_remark` varchar(255) DEFAULT NULL COMMENT '质量放行备注',
  `pass_username` varchar(55) DEFAULT NULL COMMENT '质量放行操作人',
  `pass_time` int(11) DEFAULT NULL COMMENT '质量放行时间',
  PRIMARY KEY (`id_id`),
  KEY `io_id` (`io_id`),
  KEY `sto_id` (`sto_id`),
  KEY `id_stock_detail` (`id_stock_detail`(255)),
  KEY `sw_id` (`sw_id`),
  KEY `id_visible` (`id_visible`),
  KEY `io_id_sto_id` (`id_visible`,`io_id`,`sto_id`,`id_quantity`)
) ENGINE=InnoDB AUTO_INCREMENT=8815444 DEFAULT CHARSET=utf8 COMMENT='出入库明细表';

-- ----------------------------
-- Table structure for work_map
-- ----------------------------
DROP TABLE IF EXISTS `work_map`;
CREATE TABLE `work_map` (
  `wmp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `wmp_region_id` int(11) NOT NULL COMMENT '城市id',
  `wmp_region_name` varchar(255) NOT NULL COMMENT '城市名称',
  `wmp_opuid` varchar(255) DEFAULT NULL COMMENT '组员',
  `wmp_opname` varchar(255) DEFAULT NULL COMMENT '组员名称',
  `wmp_druid` int(11) NOT NULL COMMENT '组长',
  `wmp_drname` varchar(255) NOT NULL COMMENT '组长名称',
  `wmp_points` longtext COMMENT '电子围栏坐标点',
  `wmp_visible` int(2) DEFAULT '0' COMMENT '0显示，1删除',
  `wmp_name` varchar(255) NOT NULL COMMENT '组名',
  `wmp_status` int(2) NOT NULL DEFAULT '0' COMMENT '0开启 1停用',
  `wmp_tops_id` int(11) DEFAULT NULL COMMENT '站点id',
  `wmp_tops_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `wmp_no` varchar(10) DEFAULT NULL COMMENT '站点编号',
  `wmp_ts_id` varchar(255) NOT NULL DEFAULT '' COMMENT '发货站点id',
  `wmp_ts_name` text COMMENT '发货站点名称',
  `wmp_type` int(4) NOT NULL DEFAULT '1' COMMENT '排班类型 1 白班 2 夜班 3 提发',
  PRIMARY KEY (`wmp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for work_order
-- ----------------------------
DROP TABLE IF EXISTS `work_order`;
CREATE TABLE `work_order` (
  `w_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工单序号',
  `to_id` int(11) DEFAULT NULL COMMENT '运单id',
  `work_order_type` int(11) DEFAULT NULL COMMENT '工单类型 1:温度异常 2:运输时效 3:运输要求 4:其他',
  `work_desc` varchar(255) DEFAULT NULL COMMENT '工单描述',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `create_time` varchar(30) DEFAULT NULL COMMENT '最新创建时间',
  `status` tinyint(2) DEFAULT '2' COMMENT '1:已反馈,2:未反馈：3：已关闭',
  `is_colse` tinyint(2) DEFAULT '2' COMMENT '工单是否关闭 1:关闭,2:未关闭',
  `work_time` int(11) NOT NULL DEFAULT '0' COMMENT '执行日期',
  `w_assign_uids` varchar(255) DEFAULT NULL COMMENT '指派人id',
  `w_assign_names` varchar(255) DEFAULT NULL COMMENT '指派人',
  `w_assign_ouids` varchar(255) DEFAULT NULL COMMENT '指派操作人id',
  `w_assign_onames` varchar(255) DEFAULT NULL COMMENT '指派操作人',
  `w_lastfeedback` text COMMENT '最新反馈内容',
  `w_lastup_time` int(11) DEFAULT NULL COMMENT '最新操作时间',
  `w_lastup_type` int(4) DEFAULT NULL COMMENT '最新操作类型 1创建 2反馈 3指派 4关闭',
  `create_uname` varchar(100) DEFAULT NULL COMMENT '创建人',
  `create_uid` int(11) DEFAULT NULL COMMENT '创建人id',
  `close_uname` varchar(100) DEFAULT NULL COMMENT '关闭人',
  `close_uid` int(11) DEFAULT NULL COMMENT '关闭人id',
  PRIMARY KEY (`w_id`),
  KEY `idx_to_id` (`to_id`),
  KEY `idx_is_close` (`is_colse`),
  KEY `idx_create_uid` (`create_uid`),
  KEY `idx_close_uid` (`close_uid`),
  KEY `idx_create_time` (`create_time`),
  KEY `idx_work_time` (`work_time`),
  KEY `idx_work_order_type` (`work_order_type`),
  KEY `idx_w_assign_uids` (`w_assign_uids`(191)),
  KEY `idx_w_assign_ouids` (`w_assign_ouids`(191)),
  KEY `idx_status` (`status`),
  KEY `idx_w_lastup_time` (`w_lastup_time`)
) ENGINE=InnoDB AUTO_INCREMENT=898 DEFAULT CHARSET=utf8mb4 COMMENT='工单表';

-- ----------------------------
-- Table structure for work_order_assign
-- ----------------------------
DROP TABLE IF EXISTS `work_order_assign`;
CREATE TABLE `work_order_assign` (
  `wk_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工单指派序号',
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `u_name` varchar(30) DEFAULT NULL COMMENT '操作人',
  `assign_name` varchar(30) DEFAULT NULL COMMENT '被指派人',
  `w_id` int(11) DEFAULT NULL COMMENT '工单id',
  `assign_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`wk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=947 DEFAULT CHARSET=utf8mb4 COMMENT='工单指派表';

-- ----------------------------
-- Table structure for work_order_log
-- ----------------------------
DROP TABLE IF EXISTS `work_order_log`;
CREATE TABLE `work_order_log` (
  `wl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '工单日志序号',
  `w_id` int(11) DEFAULT NULL COMMENT '工单id',
  `new_time` varchar(30) DEFAULT NULL COMMENT '操作时间',
  `ur_uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `ol_username` varchar(32) DEFAULT NULL COMMENT '操作人',
  `type` tinyint(2) DEFAULT NULL COMMENT '1:创建工单 2:反馈 3:指派 4:关闭',
  `record` varchar(100) DEFAULT NULL COMMENT '记录',
  `feedback_record` varchar(200) DEFAULT NULL COMMENT '反馈记录',
  PRIMARY KEY (`wl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1054 DEFAULT CHARSET=utf8mb4 COMMENT='工单操作日志表';

-- ----------------------------
-- Table structure for work_record
-- ----------------------------
DROP TABLE IF EXISTS `work_record`;
CREATE TABLE `work_record` (
  `wr_id` int(10) NOT NULL AUTO_INCREMENT,
  `cu_id` int(10) NOT NULL COMMENT '客户id',
  `uid` int(10) NOT NULL COMMENT '责任人 用户id',
  `wr_time` int(10) DEFAULT '0' COMMENT '工作日期',
  `wr_type` tinyint(2) DEFAULT NULL COMMENT '工作类型 参考globaltype work_type',
  `wr_customer_source` tinyint(2) DEFAULT NULL COMMENT '客户来源 参考globaltype customer_source',
  `wr_customer_status` tinyint(2) DEFAULT NULL COMMENT '客户状态 参考globaltype customer_status',
  `wr_content` text COMMENT '工作内容',
  `wr_remark` varchar(1024) DEFAULT NULL COMMENT '备注',
  `wr_status` tinyint(2) DEFAULT '1' COMMENT '1正常2删除',
  `wr_createtime` int(10) DEFAULT NULL,
  `wr_lastupdtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`wr_id`),
  KEY `cu_id` (`cu_id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='工作记录';

-- ----------------------------
-- Table structure for workday
-- ----------------------------
DROP TABLE IF EXISTS `workday`;
CREATE TABLE `workday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间戳',
  `date_format` date NOT NULL COMMENT '日期',
  `workday` int(10) NOT NULL COMMENT '工作日',
  `weekend` int(10) NOT NULL COMMENT '周末',
  `holiday` int(10) NOT NULL COMMENT '假日',
  `extra` int(10) NOT NULL COMMENT '周末调班',
  `wage` int(10) NOT NULL COMMENT '节假日加班薪资',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2922 DEFAULT CHARSET=utf8mb4 COMMENT='工作日表';

-- ----------------------------
-- Table structure for xxl-job-stu
-- ----------------------------
DROP TABLE IF EXISTS `xxl-job-stu`;
CREATE TABLE `xxl-job-stu` (
  `name` varchar(64) DEFAULT NULL,
  `course` varchar(32) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for xxljobstu
-- ----------------------------
DROP TABLE IF EXISTS `xxljobstu`;
CREATE TABLE `xxljobstu` (
  `name` varchar(64) DEFAULT NULL,
  `course` varchar(32) DEFAULT NULL,
  `score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for yiliu_cold_sign
-- ----------------------------
DROP TABLE IF EXISTS `yiliu_cold_sign`;
CREATE TABLE `yiliu_cold_sign` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `gateway_code` varchar(25) DEFAULT NULL COMMENT '魔方编码',
  `code` varchar(25) NOT NULL COMMENT '冷签编码',
  `name` varchar(30) DEFAULT '' COMMENT '冷签名称',
  `time` datetime DEFAULT NULL COMMENT '采集时间',
  `on_of` tinyint(1) unsigned DEFAULT '0' COMMENT '0 正常 1.关机 2 开机',
  `elec` tinyint(3) NOT NULL COMMENT '标签电量百分比 0-100',
  `temp` decimal(5,2) NOT NULL COMMENT '温度数据',
  `hum` decimal(4,1) NOT NULL COMMENT '湿度数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_key` (`gateway_code`,`code`),
  KEY `gateway_code` (`gateway_code`),
  KEY `code` (`code`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='冷签数据';

-- ----------------------------
-- Table structure for yiliu_cold_sign_record
-- ----------------------------
DROP TABLE IF EXISTS `yiliu_cold_sign_record`;
CREATE TABLE `yiliu_cold_sign_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `code` varchar(25) NOT NULL COMMENT '冷签编码',
  `name` varchar(30) DEFAULT '' COMMENT '冷签名称',
  `time` datetime DEFAULT NULL COMMENT '采集时间',
  `elec` tinyint(3) NOT NULL COMMENT '标签电量百分比 0-100',
  `temp` decimal(5,2) NOT NULL COMMENT '温度数据',
  `hum` decimal(4,1) NOT NULL COMMENT '湿度数据',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_key` (`code`,`time`),
  KEY `time` (`time`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=65472 DEFAULT CHARSET=utf8mb4 COMMENT='冷签数据记录';

-- ----------------------------
-- Table structure for yiliu_rubik
-- ----------------------------
DROP TABLE IF EXISTS `yiliu_rubik`;
CREATE TABLE `yiliu_rubik` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `gateway_code` varchar(25) DEFAULT NULL COMMENT '魔方编码',
  `gateway_name` varchar(30) DEFAULT NULL COMMENT '魔方名称',
  `gps_time` datetime DEFAULT NULL COMMENT '定位时间',
  `speed` int(11) unsigned DEFAULT '0' COMMENT '速度',
  `odometer` int(11) DEFAULT '0' COMMENT '里程',
  `lat` decimal(9,6) DEFAULT '0.000000' COMMENT '纬度',
  `lon` decimal(9,6) DEFAULT '0.000000' COMMENT '经度',
  `direction` int(11) DEFAULT '0' COMMENT '车头方向',
  `status` varchar(200) DEFAULT '' COMMENT '状态描述',
  `place_name` varchar(170) DEFAULT '' COMMENT '位置',
  `provice` varchar(50) DEFAULT '' COMMENT '省',
  `city` varchar(50) DEFAULT '' COMMENT '市',
  `district` varchar(50) DEFAULT '' COMMENT '区',
  `road_name` varchar(150) DEFAULT '' COMMENT '路名信息',
  PRIMARY KEY (`id`),
  UNIQUE KEY `gateway_code` (`gateway_code`),
  KEY `gps_time` (`gps_time`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='魔方数据';

-- ----------------------------
-- Table structure for yp_inventory_balance
-- ----------------------------
DROP TABLE IF EXISTS `yp_inventory_balance`;
CREATE TABLE `yp_inventory_balance` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cu_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `cu_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `capacity` varchar(50) DEFAULT NULL COMMENT '总立方数',
  `total` varchar(50) DEFAULT NULL COMMENT '总库存',
  `createtime` varchar(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`b_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4693 DEFAULT CHARSET=utf8mb4 COMMENT='药品库存结余';

-- ----------------------------
-- Table structure for yp_inventory_detail_balance
-- ----------------------------
DROP TABLE IF EXISTS `yp_inventory_detail_balance`;
CREATE TABLE `yp_inventory_detail_balance` (
  `ba_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sto_id` int(11) NOT NULL COMMENT '存货ID',
  `sto_no` varchar(50) DEFAULT NULL COMMENT '存货编号',
  `sto_name` varchar(100) DEFAULT NULL COMMENT '存货名称',
  `cu_id` int(11) DEFAULT NULL COMMENT '客户ID',
  `cu_name` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `total` int(11) DEFAULT NULL COMMENT '总库存',
  `capacity` varchar(255) DEFAULT NULL COMMENT '总立方数',
  `sto_expiretime` varchar(50) DEFAULT NULL COMMENT '有效期',
  `createtime` varchar(11) DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`ba_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53188 DEFAULT CHARSET=utf8mb4 COMMENT='药品明细库存结余';

-- ----------------------------
-- Table structure for yp_stand_book
-- ----------------------------
DROP TABLE IF EXISTS `yp_stand_book`;
CREATE TABLE `yp_stand_book` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `warehousing_type` tinyint(4) DEFAULT '0' COMMENT '入库类型: 0=入库, 1=出库, 2=移库出库, 3=移库入库',
  `num` int(11) DEFAULT NULL COMMENT '出入库数量',
  `note_name` varchar(50) DEFAULT '' COMMENT '记录人',
  `review_name` varchar(50) DEFAULT '' COMMENT '复核人',
  `review_time` int(10) DEFAULT NULL COMMENT '复核时间',
  `yp_in_no` char(32) DEFAULT '' COMMENT '出入库单号',
  `yp_wa_id` int(10) DEFAULT NULL COMMENT '货位ID',
  `status` tinyint(4) DEFAULT '0' COMMENT '台账状态 0:待复核 1:已复核 2：复核未通过  3：已作废  4：已取消 5：已关闭',
  `create_time` int(10) DEFAULT NULL COMMENT '记录人创建时间',
  `drug_name` varchar(100) DEFAULT '' COMMENT '药品名称',
  `drug_db_id` varchar(50) DEFAULT NULL COMMENT '药品批号',
  `drug_expiretime` varchar(50) DEFAULT '' COMMENT '药品有效期',
  `drug_count` varchar(50) DEFAULT '' COMMENT '计数单位',
  `review_reason` int(5) DEFAULT NULL COMMENT '复核未通过原因1：单据错误 2：实际捡药错误 3：台账数据不一致 4:入库货位错误',
  `review_reason_remark` varchar(200) DEFAULT '' COMMENT '复核未通过备注',
  `is_show` int(255) DEFAULT '1' COMMENT '是否展示 0不展示 1展示',
  `update_reason` varchar(200) DEFAULT '' COMMENT '修改出入库数量原因',
  `to_void_reason` varchar(200) DEFAULT '' COMMENT '作废台账原因',
  `lastupdate_time` int(10) DEFAULT NULL COMMENT '最后操作时间',
  `drug_sto_id` varchar(40) DEFAULT '' COMMENT '药品存货编号',
  `drug_sto_customer` varchar(150) DEFAULT '' COMMENT '药品存货客户',
  `drug_customer_id` int(10) DEFAULT NULL COMMENT '药品存货客户id',
  `drug_balance` int(10) DEFAULT NULL COMMENT '药品结存',
  `yp_wa_name` varchar(50) DEFAULT NULL COMMENT '货位名称',
  `yp_iostorage_detail_id` int(11) DEFAULT NULL COMMENT '出入库明细表id',
  `drug_db_name` varchar(50) DEFAULT NULL COMMENT '药品批号名称',
  `transfer_detail_id` int(11) DEFAULT NULL COMMENT '移库单明细id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `iostorage_detail_id` (`yp_iostorage_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1686 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- View structure for iosto
-- ----------------------------
DROP VIEW IF EXISTS `iosto`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY INVOKER VIEW `iosto` AS select concat(`id`.`io_id`,'-',`id`.`sto_id`) AS `iosto`,`id`.`io_id` AS `io_id`,`id`.`sto_id` AS `sto_id`,`id`.`sto_no` AS `sto_no`,`id`.`sto_name` AS `sto_name`,sum(`id`.`id_quantity`) AS `sumnum` from `iostorage_detail` `id` FORCE INDEX (`io_id_sto_id`) where (`id`.`id_visible` = 1) group by `id`.`io_id`,`id`.`sto_id`;

-- ----------------------------
-- Procedure structure for sp1_mytest
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp1_mytest`;
delimiter ;;
CREATE PROCEDURE `sp1_mytest`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp2_mytest
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp2_mytest`;
delimiter ;;
CREATE PROCEDURE `sp2_mytest`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp3_mytest
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp3_mytest`;
delimiter ;;
CREATE PROCEDURE `sp3_mytest`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp4_mytest
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp4_mytest`;
delimiter ;;
CREATE PROCEDURE `sp4_mytest`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_myte
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_myte`;
delimiter ;;
CREATE PROCEDURE `sp_myte`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_mytes
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_mytes`;
delimiter ;;
CREATE PROCEDURE `sp_mytes`()

;;
delimiter ;

-- ----------------------------
-- Procedure structure for sp_mytest
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_mytest`;
delimiter ;;
CREATE PROCEDURE `sp_mytest`()

;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
