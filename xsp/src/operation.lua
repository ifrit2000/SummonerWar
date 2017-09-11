require("common");
operation={};
--function getOperation(height,width,buyEnergyNum)

operation.setConfigValue=function(height,width,buyEnergyNum)
  operation.height=height;
  operation.width=width;
  operation.buyEnergyNum=buyEnergyNum;
	return operation;
end;

function empty()
end;

operation.startFight=function(param)
  common.clickButton(param);
end

operation.gear=function()
  common.sleep(2);
end

operation.victory=common.clickButton;

operation.autoFight=common.clickButton;

operation.rgb=common.clickButton;

operation.rgbThreeStar=function(param)
  common.clickButton(param);
  common.sleep(2);
  common.click(666,444);
end

operation.confirm=common.clickButton;

operation.sale=common.clickButton;

operation.again=common.clickButton;

operation.resendFightInfo=common.clickButton;

operation.resendFightResult=common.clickButton;

operation.nextLevel=common.clickButton;

operation.keepRune=common.clickButton;
operation.saleFiveStarRune=function(param)
  local yes={0xf8e9ad,"0|2|0x482f09,2|7|0xf8e9ad,2|12|0x412702,409|9|0xf8e9ad,400|9|0x412702,386|12|0xcfa349", 95, 778, 865, 860, 935};
  local flag=common.clickButton(yes);
  while flag==false do
    flag=common.clickButton(yes);
  end;
end;

operation.defeat=empty;

operation.FinalBossFight=function(param)
  sysLog('operation.isClickedFinalBoss:'..tostring(operation.isClickedFinalBoss));
  if operation.isClickedFinalBoss~=true then
    common.click(param[8],param[9]);
    --      sysLog('click final boss: '..operation.height..operation.width);
    operation.isClickedFinalBoss=true;
  end;
end

operation.littleBossFight=function(param)
  sysLog('operation.isClickedLittleBoss:'..tostring(operation.isClickedLittleBoss));
  if operation.isClickedLittleBoss~=true then
    --      sysLog('click little Boss: '..operation.height..operation.width);
    common.click(param[8],param[9]);
    --      common.click(operation.height*0.648,operation.width*0.277);
    operation.isClickedLittleBoss=true;
  end;
end

operation.notBossFight=function()
  operation={isClickedLittleBoss=false};
  operation={isClickedFinalBoss=false};
end

operation.noResurgence=common.clickButton;

operation.notEnoughEnergyNotBuy=function(param)
  common.clickButton(param);
  lua_exit();
end

operation.notEnoughEnergyBuy=function(param)
  -- if operation.buyEnergyNum>0 then
  local energy={0xffcc66,"-32|316|0xdb1b4b,448|9|0xffffff,486|-315|0x3ea5f2,95|-400|0x482e1f,-24|-354|0x482e1f,95|-11|0xe2c582,-11|-186|0xf7ecc2", 95, 422, 660, 593, 812};
  local buy={0xf8e9ad,"0|3|0x412702,0|7|0xf8e9ad,4|-30|0xdeb75d,95|-267|0xf8e9ad,107|-267|0x482e1f,115|-267|0xf8e9ad,612|-477|0xa7163a,190|-472|0x2b7ab7", 95, 791, 877, 854, 919};
  local done={0x412702,"6|-4|0xf8e9ad,-19|-264|0xe2c582,-20|-269|0x482e1f,-16|-272|0xe2c582,-15|-276|0x482e1f,-4|-469|0x295f81,427|-478|0x730e27", 95, 951, 860, 1098, 921};
  local close={0xf8f0cf,"8|-7|0xb98c4a,9|-10|0x412702,10|-14|0xf8f0cf,-14|-163|0xd81847,-518|-160|0xe32253,495|-164|0xd81948,541|-461|0x44b8ff", 95, 971, 1194, 1075, 1245};
  local startTime=os.time();
  local delta=0;
  local timeout=20;
  
  --开始购买
  local flag=common.clickButton(param);
  while flag==false and delta<timeout do
    flag=common.clickButton(param);
    delta=os.time()-startTime;
  end;
  --点体力
  --flag=common.clickButton(energy);
  flag=false;
  while flag==false and delta<timeout do
    flag=common.clickButton(energy);
    delta=os.time()-startTime;
  end;		
  --确认购买
  --flag=common.clickButton(buy);
  flag=false;
  while flag==false and delta<timeout do
    flag=common.clickButton(buy);
    delta=os.time()-startTime;
  end;		--点购买完成
  --flag=common.clickButton(done);
  flag=false;
  while flag==false and delta<timeout do
    flag=common.clickButton(done);
    delta=os.time()-startTime;
  end;
  --点关闭
  --flag=common.clickButton(close);
  flag=false;
  while flag==false and delta<timeout do
    flag=common.clickButton(close);
    delta=os.time()-startTime;
  end;
  -- operation.buyEnergyNum=operation.buyEnergyNum-1;
  if delta>=timeout then
    common.exit();
  end;
  -- else
  --   common.exit();
  -- end; --end buyEnergyNum~=0
end

--  return operation;
--end;