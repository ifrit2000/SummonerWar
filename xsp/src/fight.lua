fight={};

--觉醒
--接受参数为parameter中的table
fight.awake=function(param,status,operation)
  sysLog('觉醒');
  sysLog('战斗：'..param.repeatTime);
  operation.height=param.height;
  operation.width=param.width;
  param.fightDesc="刷精髓";
  
  fight.coreFunction(param,status,operation);
end

--符文
--接受参数为parameter中的table
fight.runes=function(param,status,operation)
  sysLog('符文');
  sysLog('战斗：'..param.repeatTime);
  operation.height=param.height;
  operation.width=param.width;
  param.fightDesc="刷符文";
  fight.coreFunction(param,status,operation);
end

--塔
--接受参数为parameter中的table
fight.tower=function(param,status,operation)
  sysLog('塔');
  sysLog('战斗：'..param.repeatTime);
  param.fightDesc="刷塔";
  fight.coreFunction(param,status,operation);
end

--狗粮
--接受参数为parameter中的table
fight.dogFood=function(param,status,operation)
  sysLog('狗粮');
  sysLog('战斗：'..param.repeatTime);
  param.fightDesc="带狗粮";
  fight.coreFunction(param,status,operation);
end

fight.threeStarChip=function(param,status,operation)
  sysLog('三星碎片');
  sysLog('战斗：'..param.repeatTime);
  param.fightDesc="刷碎片";
  fight.coreFunction(param,status,operation);
end

fight.theAlienLandCaptain=function(param,status,operation)
  sysLog('异界(队长)(未实现)');
  
end

fight.coreFunction=function(param,status,operation)
  local i=0;
  local startTime=os.time();
  local delta=0;
  local timeOut=600;  --单位秒
  
  while i<param.repeatTime and delta<timeOut do
    common.showMsg("战斗类型: "..param.fightDesc.."\n战斗计数: "..tostring(i+1).."/"..tostring(param.repeatTime).."\n购买体力: "..param.isBuy);
    --		common.setStatusListFalse(status.statusList);
    local statusList=common.updateStatusList(param,status.statusList);    
    local trueStatusList={};    
    getTrueStatus(statusList,trueStatusList);
    local listLenth=common.realTableLenth(trueStatusList);    
    sysLog("listLenth"..listLenth);
    if listLenth==0 then --长度为0表示在loading
      common.sleep(1.5);
    else
      -- 有新的状态就重置startTime
      startTime=os.time();
    end;
    for k,v in pairs(trueStatusList) do
      while true do --实现continue的功能
        if listLenth~=1 and (k=='gear' or k=='victory') then
          break;
        end;
        sysLog(k);
        operation[k](param[k]);--			end;
        break;
      end;
			--战斗次数加1
      if k=='again' or k=='nextLevel' then
        i=i+1;
      end;
			--如果是购买体力,那么战斗次数减1
			if k=='notEnoughEnergyBuy' then
				i=i-1;
			end;
    end;--end for k,v in pairs(trueStatusList) 
    delta=os.time()-startTime;
  end;
  if delta>=timeOut then
    common.exit();
  end;
end
