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