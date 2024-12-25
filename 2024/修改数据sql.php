<?


//修改车辆维保类型
update car_repair set cr_type=2,maintain_type=1 where cr_id=12172;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',12172, 0, '系统', 0, 'IT协助修改 将2024年11月30日沪DYT068的车辆维保类型由车辆维修更正为车辆保养  审批单号：ITSJ202412060002', 1733455466, 13, 0);



//修改维保里程
update car_repair set repair_mile=306564,repair_finish_mile=306564 where cr_id=12021;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170008',12021, 0, '系统', 0, 'IT协助修改  2024-11-19系统保养操作录入里程错误，需要修改。原来录入30806KM需要修改为306564KM  审批单号：   
ITSJ202412190003', 1734598396, 13, 0);


//修改冷机时长
update car set cumulative_duration=2366 where ca_id=540;

INSERT INTO `remark_log` (`rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ('170', '170001',540, 0, '系统', 0, 'IT协助修改 修改冷机时数3284 改为2366  审批单号：   
ITSJ202412190003', 1734598396, 13, 0);