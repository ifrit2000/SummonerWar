statusBuilder={};

statusBuilder.dogFood=function(status)
  status.statusList.defeat.statusList.noResurgence={status=false};
  status.statusList.defeat.statusList.again={status=false};
  status.statusList.victory.statusList.again={status=false};
  status.statusList.victory.statusList.sale={status=false};
	status.statusList.saleFiveStarRune={status=false};
end;

statusBuilder.awake=function(status)
  status.statusList.gear.statusList.FinalBossFight={status=false};
  status.statusList.gear.statusList.notBossFight={status=false};
	status.statusList.noResurgence={status=false};
  status.statusList.defeat.statusList.again={status=false};
  status.statusList.victory.statusList.again={status=false};
end;

statusBuilder.runes=function(status)
  status.statusList.gear.statusList.FinalBossFight={status=false};
  status.statusList.gear.statusList.littleBossFight={status=false};
	status.statusList.noResurgence={status=false};
	status.statusList.gear.statusList.notBossFight={status=false};
  status.statusList.defeat.statusList.again={status=false};
  status.statusList.victory.statusList.again={status=false};
	status.statusList.victory.statusList.keepRune={status=false};
	
end;

statusBuilder.tower=function(status)
  status.statusList.gear.statusList.FinalBossFight={status=false};
	status.statusList.gear.statusList.notBossFight={status=false};
	status.statusList.victory.statusList.nextLevel={status=false};
end;



initStatus=function(oper)
  local status={};
  --	status.startFight={status=false};
  status.statusList={};
  status.statusList.victory={status=false,statusList={}};
  status.statusList.gear={status=false,statusList={}};	
  status.statusList.defeat={status=false,statusList={}};
  status.statusList.startFight={status=false};
  status.statusList.notEnoughEnergy={status=false};
  status.statusList.resendFightInfo={status=false};
  status.statusList.resendFightResult={status=false};
  
  status.statusList.defeat.statusList={rgb={status=false}};
  status.statusList.victory.statusList={rgb={status=false},confirm={status=false}};
  status.statusList.gear.statusList={autoFight={status=false}};	
	
  statusBuilder[oper](status);
	
  return status;
end



getTrueStatus=function(statusList,trueStatusList)
  
  for k,v in pairs(statusList) do
    if v.status==true then
      trueStatusList[k]=0;
      if v.statusList~=nil then
        getTrueStatus(v.statusList,trueStatusList);
      end;
    end;
  end;
  
end;