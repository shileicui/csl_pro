 <?php

 if($transdet['cp_id']=='8548'){
            $otherwork=OrderWorksheet::find()->where(["to_id"=>$post["to_id"],"ow_status"=>1])->asArray()->one();
            if($otherwork){
                $model->ow_cart_pd=3;
                $model->ow_cart_type=$otherwork['ow_cart_type'];
            }else{
                if($transdet['to_trequirement']=='2'){
                    $model->ow_cart_pd=3;
                    if(in_array($transdet['start_region_id'],$citylist)){
                        $model->ow_cart_type=1;
                    }else{
                        $model->ow_cart_type=2;
                    }
                }else if($transdet['to_trequirement']=='3'){
                    $model->ow_cart_pd=3;
                    $model->ow_cart_type=3;
                }
            }

        }else if($transdet['cp_id']=='8595'){
            $otherwork=OrderWorksheet::find()->where(["to_id"=>$post["to_id"],"ow_status"=>1])->asArray()->one();
            if($otherwork){
                $model->ow_cart_pd=3;
                $model->ow_cart_type=$otherwork["ow_cart_type"];
            }else{
                if($transdet['to_trequirement']=='2'){
                    $model->ow_cart_pd=3;
                    $model->ow_cart_type=4;
                }else if($transdet['to_trequirement']=='3'){
                    $model->ow_cart_pd=3;
                    $model->ow_cart_type=5;
                }
            }
        }



        cart ow_cart_type = 1 取tms_cart_operation_config



        tms_cart_operation_plan  记录表  tms_cart_operation_record 操作点亮表




UPDATE tms_cart_operation_record SET tcor_time=1694779800 where  tcor_id = 10673;
UPDATE tms_cart_operation_record SET tcor_time=1694779800 where  tcor_id = 10674;
UPDATE order_logistics SET ol_delivery_time=1694779800 where  to_id = 2649313;



INSERT INTO `remark_log` ( `rl_type`, `rl_subtype`, `rl_identifier`, `ur_uid`, `username`, `rl_status`, `rl_remark`, `rl_createtime`, `rl_server_type`, `rl_region_id`) VALUES ( '102', '102041', 2649313, 0, '系统申请', 0, ' 到达派件单位、签收 节点时间 改为 2023-09-15 20:10 派件时间改为2023-09-15 20:10 审批单号：ITSJ202309150003   ', 1695086626, 1, 0);