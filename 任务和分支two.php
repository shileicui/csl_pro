<?php 



智能排线v1.1
feature_12080_csl_20230321 tms_admin  未上线
http://project.ashsh.com.cn/index.php?m=task&f=view&id=12080

CREATE TABLE `tms_path_planning` (
  `tpp_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `date_time` int(11) NOT NULL DEFAULT '0' COMMENT '日期',
  `region_id` int(11) NOT NULL DEFAULT '0' COMMENT '城市id',
  `region_name` varchar(255) NOT NULL DEFAULT '' COMMENT '城市名称',
  `wmp_id` int(11) NOT NULL DEFAULT '0' COMMENT '分组id',
  `wmp_name` varchar(255) NOT NULL DEFAULT '' COMMENT '站点名称',
  `path_num` int(11) NOT NULL DEFAULT '0' COMMENT '路线数量',
  `tpp_visible` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态  1正常  2删除',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `deleted_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '删除时间',
  PRIMARY KEY (`tpp_id`),
  KEY `idx_region_id` (`region_id`),
  KEY `idx_wmp_idd` (`wmp_id`)
) COMMENT='排序策略';
