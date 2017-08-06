

fight={};

--觉醒
--接受参数为parameter中的table
fight.awake=function(param,status,operation)
  sysLog('觉醒');
  sysLog('战斗：'..param.repeatTime);
  operation.height=param.height;
  operation.width=param.width;
  
  fight.coreFunction(param,status,operation);
end

--符文
--接受参数为parameter中的table
fight.runes=function(param,status,operation)
  sysLog('符文');
  sysLog('战斗：'..param.repeatTime);
  operation.height=param.height;
  operation.width=param.width;
  fight.coreFunction(param,status,operation);
end

--塔
--接受参数为parameter中的table
fight.tower=function(param,status,operation)
  sysLog('塔');
  sysLog('战斗：'..param.repeatTime);
  fight.coreFunction(param,status,operation);
end

--狗粮
--接受参数为parameter中的table
fight.dogFood=function(param,status,operation)
  sysLog('狗粮');
  sysLog('战斗：'..param.repeatTime);
  
  fight.coreFunction(param,status,operation);
end

fight.threeStarChip=function(param,status,operation)
  sysLog('三星碎片');
  sysLog('战斗：'..param.repeatTime);
  
  fight.coreFunction(param,status,operation);
end

fight.coreFunction=function(param,status,operation)
  local i=0;
	
  while i<param.repeatTime do
    
--		common.setStatusListFalse(status.statusList);
    local statusList=common.updateStatusList(param,status.statusList);
 
    local trueStatusList={};

    getTrueStatus(statusList,trueStatusList);

    local listLenth=common.realTableLenth(trueStatusList);

    sysLog(listLenth);
    if listLenth==0 then --长度为0表示在loading
      common.sleep(1.5);
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
      if k=='startFight' then
        i=i+1;
      end;
    end;
  end;
end
