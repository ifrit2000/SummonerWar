require("common");
require("parameter");
require("fight");
require("status");
require("operation");

function parseUI(param)
  local ret,results = showUI("ui.json");
  if ret~=1 then
    return nil;
  end;
  

  local fightType=results["RadioGroup2"];
  
  param.repeatTime=tonumber(results["Edit1"]);
  
  if fightType=="0" then

    return 'dogFood';
  elseif fightType=="1" then
    return 'awake';
  elseif fightType=="2" then
    return 'runes';
  elseif fightType=="3" then
    return 'tower';
	elseif fightType=="4" then
    return 'threeStarChip';
  end;
  
end

function run()
  init("0", 1); --home键在右边
  local param=getParam();
--	sysLog(os.clock());
  local oper=parseUI(param);
  if oper==nil then
    return ;
  end;
	
  local status=initStatus(oper);
	local operation=getOperation(param.height,param.width);
  fight[oper](param,status,operation);
end;
run();
