parameter={device={}};

function getParam()
  --设备列表
  parameter.device['15362048']='ipadMini2';
  parameter.device['14402560']='g9280';
  
  local width,height = getScreenSize();
  --	parameter
  --初始化参数
  sysLog(width..height);
  local param=parameter[parameter.device[width..height]]()
	param.height=height;
  param.width=width;
  return param;
end

parameter.ipadMini2=function()
  local param={};
  --开始战斗按钮的参数
  param.startFight={0xf8e9ad,"-4|14|0x412702,-6|24|0x412702,-4|31|0xc8bc8c,45|18|0xf0e2a7,51|18|0x412702,61|18|0x412701,72|22|0xe6d8a0,71|37|0xb2a77c,56|7|0xf8e9ad",95,1606,1104,1848,1173};
  
  --自动战斗三角形标志
  param.autoFight={0xffffff,"0|10|0xffffff,0|16|0xffffff,0|25|0xffffff,-1|32|0xffffff",95,428,1414,432,1487};
  
  --右上角聊天标记 用于查找是否boss战斗
  param.notBossFight={0xf1e7d1,"13|-1|0x371c14,21|-1|0xcfc9be,28|-1|0x381d15,39|-1|0xfcf9e8,48|-1|0x3f241a,58|-1|0xe7dfca",95,60,49,136,80}
  
  --右上角聊天标记 用于查找是否boss战斗 是boss
  param.FinalBossFight={0xf4e8d1,"11|-2|0x41251a,20|-2|0xd1cbbf,28|-2|0x44271d,37|-1|0xdcd4be,48|-1|0x472b20",95,58,265,138,308,1024,768};
	
--  param.littleBossFight={0xf1e7d1,"13|-1|0x371c14,21|-1|0xcfc9be,28|-1|0x381d15,39|-1|0xfcf9e8,48|-1|0x3f241a,58|-1|0xe7dfca",95,49,154,157,220,1327,425};
  param.littleBossFight={0xf4e8d1,"11|-2|0x41251a,20|-2|0xd1cbbf,28|-2|0x44271d,37|-1|0xdcd4be,48|-1|0x472b20",95,58,161,135,203,1327,425};
  
  --胜利界面的红黄蓝三个图标 有胜利标志但是没有这个表示出现了宝箱
  param.rgb={0x00a4ef,"27|8|0x48aff3,12|41|0x449cea,535|-11|0xfbd672,512|8|0xf7d067,525|17|0xf6ca63,1022|12|0xdc1344,1050|12|0xed3163,1026|46|0xf95785",95,454,703,1639,854};
  
	--三星地下城时候的rgb
	param.rgbThreeStar={0x00a4ef,"27|8|0x48aff3,12|41|0x449cea,535|-11|0xfbd672,512|8|0xf7d067,525|17|0xf6ca63,1022|12|0xdc1344,1050|12|0xed3163,1026|46|0xf95785",95,454,703,1639,854};
  
  --胜利标志
  param.victory={0xffff35,"-3|43|0xfff8af,50|51|0xffee90,72|91|0xffb603,120|66|0xfdcc12,138|45|0xfffdea,149|12|0xffff43,194|7|0xffff4a,190|61|0xfdd017",95,857,253,1192,417};
  
  --奖励确认按钮 按钮文字 确认
  param.confirm={0xf4e5a9,"2|39|0xf4e5a9,26|-4|0xf4e5a9,59|-2|0xf4e5a9,67|7|0x533810,52|13|0xf4e5a9,85|-3|0xf4e5a9,79|-3|0x533810,75|-3|0xcc9e58",95,836,1038,1215,1341};
  
  --再来一次按钮 
  param.again={0xf8e9ad,"11|0|0xf8e9ad,42|-30|0xf8e9ad,65|-17|0xf8e9ad,59|10|0xf8e9ad,80|14|0xf8e9ad,100|9|0xf8e9ad,117|-11|0xf8e9ad,135|-11|0xf8e9ad,157|-11|0xf8e9ad",95,429,788,676,863};
  
  --左下角齿轮图标，用于判断是否在战斗状态
  param.gear={0xffffff,"23|7|0xffffff,34|31|0xffffff,25|57|0xffffff,0|64|0xffffff,-27|55|0xffffff,-38|33|0xffffff,-30|11|0xffffff",95,38,1403,130,1495};
  
  --出售按钮
  param.sale={0xd0a45b,"9|0|0xf4e5a9,16|0|0x7f5d2a,23|0|0xf4e5a9,7|19|0xf4e5a9,15|19|0xcb9e57,23|21|0xf4e5a9,30|21|0xca9d57,39|21|0xf4e5a9,30|22|0xca9d57",95,655,959,1006,1417};
  
  --保留符文按钮
  param.keepRune={0xf4e5a9,"1|3|0x533810,1|6|0xf4e5a9,1|11|0x533810,1|15|0xf4e5a9,1|17|0x533810,1|21|0xf4e5a9,1|25|0x533810,-1|28|0xf4e5a9,-3|35|0xf4e5a9",95,1038,952,1456,1446};
  
  --失败
  param.defeat={0xffff30,"31|-6|0xffff30,33|9|0xffff37,96|1|0xf3f02e,111|1|0xffff33,125|1|0xffff33,117|21|0xf5f933,96|84|0x86ab34,70|81|0x89ac32,194|85|0x81a630",95,851,209,1205,470};
  
  --不复活 按钮文字 否
  param.noResurgence={0xecdca1,"5|1|0xf8e9ad,11|1|0xf8e9ad,15|-162|0xffffff,13|-162|0xffffff,14|-164|0xffffff,-759|18|0xd61746,-750|18|0xe9285b,-762|37|0xfa5280,43|51|0xf8e9ad",95,519,767,1404,1017};
  
  --能量不足 按钮文字 否
  param.notEnoughEnergyNotBuy={0xf8e9ad,"12|6|0x412702,22|4|0xf8e9ad,28|6|0x412702,-430|-309|0xe2c582,-424|-309|0x482e1f,-419|-309|0xe2c582,21|-232|0xe2c582,29|-240|0xe2c582,30|-204|0xe2c582",95,757,548,1272,949};
  
  --战斗开始时重新发送战斗信息
  param.resendFightInfo={0xf8e9ad,"0|5|0x412702,-1|8|0xf8e9ad,0|12|0x412702,0|16|0xf8e9ad,-293|-270|0xe2c582,-293|-235|0xe2c582,-288|-211|0xe2c582,-289|-207|0x482e1f,-288|-204|0xd9bc7c",95,490,546,864,973};
  
  --战斗结束时重新发送战斗结果
  param.resendFightResult={0xf8e9ad,"1|4|0x412702,1|8|0xf8e9ad,1|13|0x412702,1|16|0xf8e9ad,16|-237|0xe2c582,16|-250|0x482e1f,10|-271|0xe2c582,10|-274|0x4e3423,9|-277|0xe2c582",95,636,553,861,953};
  
	--下一层
  param.nextLevel={0xf8e9ad,"9|0|0xf8e9ad,20|2|0xf8e9ad,27|2|0xf8e9ad,33|1|0xf8e9ad,38|1|0xf8e9ad,39|1|0xf8e9ad,85|22|0xf8e9ad,85|18|0x50360f,86|14|0xf8e9ad",95,458,780,652,864};
  
	--出售5星以上符文
	param.saleFiveStarRune={0xe2c582,"6|4|0x482e1f,5|8|0xe2c582,8|12|0x482e1f,8|17|0xdbbe7e,7|23|0x482e1f,-1|28|0xdcbf7e,-1|32|0x482e1f,3|42|0xe2c582,3|50|0x482e1f", 95, 497, 590, 587, 632};
	
	--购买体力
	param.notEnoughEnergyBuy={0xf8e9ad,"0|4|0x412702,0|9|0xf8e9ad,-1|13|0x412702,412|-201|0xe2c582,412|-207|0x482e1f,412|-214|0xe2c582,142|-306|0x482e1f,141|-312|0xe2c582", 95, 802, 858, 865, 907};
	
	return param;
end

parameter.g9280=function()
  local param={};
  --g开始战斗按钮的参数
  param.startFight={0xf8e9ad,"22|11|0xc7993d,44|11|0xc7973d,91|36|0xc3933a,92|16|0xf8e9ad,93|9|0x412702,64|22|0x412702,67|15|0x412702,65|-2|0xf8e9ad,-2|46|0xa09670",95,2014,1016,2303,1111};
  
  --g自动战斗三角形标志
  param.autoFight={0xffffff,"0|7|0xffffff,0|16|0xffffff,0|25|0xffffff,0|29|0xffffff,0|33|0xffffff,1|36|0xffffff",95,468,1315,477,1378};
  
  --g右上角聊天标记 用于查找是否boss战斗
  param.notBossFight={0x3e2319,"11|0|0xded9ce,17|0|0x3f231a,29|0|0xfffbe5,41|0|0x3f241a,40|-10|0xede4d5,-3|-10|0xe7dfcb,-1|13|0xf1e6cf,17|14|0xece1ca,39|12|0xe9dabe",95,53,27,169,118}
  
  --g右上角聊天标记 用于查找是否boss战斗 是boss
  param.FinalBossFight={0x3e2319,"11|0|0xded9ce,17|0|0x3f231a,29|0|0xfffbe5,41|0|0x3f241a,40|-10|0xede4d5,-3|-10|0xe7dfcb,-1|13|0xf1e6cf,17|14|0xece1ca,39|12|0xe9dabe",95,38,164,206,394};
	
  param.littleBossFight={0x3e2319,"11|0|0xded9ce,17|0|0x3f231a,29|0|0xfffbe5,41|0|0x3f241a,40|-10|0xede4d5,-3|-10|0xe7dfcb,-1|13|0xf1e6cf,17|14|0xece1ca,39|12|0xe9dabe",95,38,164,206,394};
  
  --g胜利界面的红黄蓝三个图标 有胜利标志但是没有这个表示出现了宝箱
  param.rgb={0x3b9bef,"5|-34|0x64bff6,-3|-60|0x62e2f4,669|-47|0xfad36b,646|-28|0xf7ce66,668|3|0xefc15b,1341|-55|0xff407f,1317|-33|0xd61645,1304|2|0xf43d6d",95,590,645,2039,812};
  
  --g胜利标志
  param.victory={0xffff5a,"7|0|0xffff58,211|11|0xffff31,159|3|0xffff44,48|10|0xfefe33,70|26|0xfffd33,77|-1|0xffff53,240|5|0xffff2c,240|17|0xffff2e",95,1132,145,1433,256};
  
  --g奖励确认按钮 按钮文字 确认
  param.confirm={0xf4e5a9,"-1|8|0x533810,0|13|0x533810,0|18|0xf4e5a9,-3|25|0x533810,-2|30|0x533810,2|24|0xf4e5a9,2|31|0xf4e5a9,0|40|0xf4e5a9,-8|46|0xf4e5a9",95,1168,925,1409,1377};
  
  --g再来一次按钮 
  param.again={0xf8e9ad,"8|0|0xf8e9ad,19|-1|0xf8e9ad,34|-1|0xf8e9ad,43|-1|0xf8e9ad,120|21|0xf8e9ad,128|21|0xf8e9ad,137|21|0xf8e9ad,147|21|0xf8e9ad,158|20|0xf8e9ad",95,618,737,902,828};
  
  --g左下角齿轮图标，用于判断是否在战斗状态
  param.gear={0xffffff,"31|11|0xffffff,43|34|0xffffff,33|61|0xffffff,5|73|0xffffff,-24|63|0xffffff,-37|35|0xffffff,-24|10|0xffffff",95,40,1292,147,1398};
  
  --g出售按钮
  param.sale={0xf4e5a9,"8|0|0x916d35,16|-1|0xf4e5a9,24|-1|0xa98243,32|2|0xf4e5a9,7|22|0xca9d57,25|22|0xca9d57,17|22|0xf4e5a9,17|33|0xf4e5a9,15|39|0x533810",95,918,832,1217,1354};
  
  --g保留符文按钮
  param.keepRune={0xf4e5a9,"1|10|0xc39450,1|15|0x533810,1|20|0xf4e5a9,15|15|0x533810,16|11|0xf4e5a9,22|15|0xf4e5a9,25|6|0x533810,27|0|0xf4e5a9,27|-5|0x533810",95,1317,849,1646,1343};
  
  --g失败
  param.defeat={0xffff57,"6|0|0xffff79,0|7|0xffff38,32|-3|0xfefe33,32|8|0xfefe33,38|16|0xfdfd36,24|18|0xfdfe35,110|3|0xffff39,129|3|0xffff3c,150|3|0xffff3d",95,1138,160,1420,249};
  
  --g不复活 按钮文字 否
  param.noResurgence={0xf8e9ad,"15|0|0xf8e9ad,30|1|0xf8e9ad,41|0|0xf8e9ad,49|0|0xf8e9ad,2|-214|0xffffff,11|-218|0xffffff,19|-214|0xffffff,12|-196|0xffffff,9|-180|0xffffff",95,1596,678,1712,986};
  
  --g能量不足 按钮文字 否
  param.notEnoughEnergyNotBuy={0xf2e3a7,"4|-3|0xf8e9ad,-5|-7|0x412702,3|17|0xf8e9ad,17|20|0x412702,-7|-225|0xe2c582,-10|-233|0x482e1f,-9|-237|0xe2c582,-9|-244|0x482e1f,-8|-250|0xe2c582",95,1429,564,1598,947};
  
  --g战斗开始时重新发送战斗信息
  param.resendFightInfo={0xf8e9ad,"-1|3|0x412702,-1|8|0xf8e9ad,-2|13|0x462c06,-2|16|0xf8e9ad,-326|-309|0xe2c582,-313|-302|0x482e1f,99|-279|0xe2c582,99|-271|0x482e1f,99|-262|0xe2c582",95,693,500,1160,922};
  
  --g战斗结束时重新发送战斗结果
  param.resendFightResult={0xf8e9ad,"0|4|0x412702,1|9|0xf8e9ad,1|13|0x462c06,1|16|0xf8e9ad,186|-223|0xe2c582,179|-226|0x482e1f,193|-223|0x482e1f,186|-243|0x482e1f,184|-265|0x482e1f",95,989,567,1286,952};
  
	--g刷塔下一层
  param.nextLevel={0xf8e9ad,"5|2|0xf8e9ad,14|2|0xf8e9ad,28|2|0xf8e9ad,38|2|0xf8e9ad,70|-21|0xf8e9ad,64|-13|0xf8e9ad,63|1|0xf8e9ad,76|-2|0xf8e9ad",95,667,743,872,825};
  
	param.saleFiveStarRune={};
	return param;
end

