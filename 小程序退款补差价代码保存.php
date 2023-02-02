    console/orderController


    /**
     *暂存天数等于三天推送虹桥
     * @csl
     * @2023-01-09
     */
    public function actionPushChargeExpense(){
        set_time_limit(0);
        $res=(new StagingManageService())->pushChargeExpense();
        $this->message($res);
        return;
    }


    services/StagingManageService 221行

       /**
     *暂存天数等于三天推送虹桥
     * @csl
     * @2023-01-09
     */
     public function pushChargeExpense(){
         $day=SystemWorkday::find()->where(["day_day"=>date("Ymd",time())])->asArray()->one();
         if(!$day){
             return "未获取到日期数据";
         }
//         if($day["day_type"]=='1'){
//             return "无需处理";
//         }
         $data=(new Query())
             ->from("tms_staging_record tsr")
             ->where(["tsr.tsr_status"=>2,"tsr.tsr_visible"=>1])
             ->all();
         if(!$data){
             return "暂无数据";
         }
         try {
             $params = [];
             if ($day['day_type'] != '1') {
                 $zc_reason_type=(new TmsStagingRecord())->zc_reason_type;

                 foreach ($data as $k => $v) {
                     if($v["tsr_day_count"] == 3){

                         if($v["tsr_zc_reason_type"]=='0'){
                             $reason='';
                         }else{
                             $reason=','.($v["tsr_zc_reason_type"]=='1'?"生生:":"客户:").$zc_reason_type[$v['tsr_zc_reason']];
                         }

                         $content = '当前暂存时间：3天'.$reason;

                         $params[] = [
                             'to_id'=>$data['to_id'],
                             'type'=>3,
                             'type_name'=>'暂存超过3天',
                             'content'=>$content
                         ];
                     }

                 }
             }

             if($params){
                 $result = (new OmsapiService())->addChargeExpense(['data'=>$params]);

                 if (!isset($result['code']) || $result['code'] != 0) {
                     LogUtil::addLog('info', '小程序退款补差价数据推送失败', '日志', ['params' => $params, 'result'=>$result], 'interface');
                     return "小程序退款补差价数据推送失败";
                 }
             }


             return "修改成功";
         }catch (\Exception $e) {
             return  $e->getMessage();
         }
     }


    services/ChargeService 474

    /**
     * 小程序退货补差价 数据推送处理
     * @param array $data
     * @param $type
     * @return bool
     */
    public function addChargeExpense($data=[],$type){

        $type_arr = [1=>'实际箱型不一致',2=>'特殊收费类型',3=>'暂存超过3天',4=>'退回转寄',5=>'核酸'];
        $content = '';

        if($type == 2){
            $datas = $data['data'];
            $names = ["sc_no"=>"特殊费用编号","sc_explain"=>"收费说明","osp_number"=>"计费数量"];
            foreach ($datas as $datum) {
                foreach ($names as $key =>$name) {
                    $content .= $name.':'.$datum[$key].',';

                }
                $content .= ';';

            }

        }elseif($type == 3){
            $content = '当前暂存时间：'.$data['day'].'天,原因：';

        }elseif($type == 4){
            $content = $data['content'];

        }elseif($type == 5){

        }


        $params = [
            'to_id'=>$data['to_id'],
            'type'=>$type,
            'type_name'=>$type_arr[$type],
            'content'=>$content
        ];

        $result = (new OmsapiService())->addChargeExpense($params);

        if (!isset($result['code']) || $result['code'] != 0) {
            LogUtil::addLog('info', '小程序退款补差价数据推送失败', '日志', ['params' => $params, 'result'=>$result], 'interface');
            return false;
        }
        return true;
    }
