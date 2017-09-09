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
  local isBuyEnergy=results["CheckBoxGroup1"];
	if isBuyEnergy=="" then
		isBuyEnergy=false;
	elseif isBuyEnergy == "0" then
		isBuyEnergy=true;
	end;
  param.repeatTime=tonumber(results["Edit1"]);
  param.isBuyEnergy=isBuyEnergy;
  if fightType=="0" then
    fightType= 'dogFood';
  elseif fightType=="1" then
    fightType= 'awake';
  elseif fightType=="2" then
    fightType= 'runes';
  elseif fightType=="3" then
    fightType= 'tower';
  elseif fightType=="4" then
    fightType= 'threeStarChip';
  end;
  return fightType,isBuyEnergy;
end

function run()
  init("0", 1); --home键在右边
  local param=getParam();
  --	sysLog(os.clock());
  local oper,isBuyEnergy=parseUI(param);
  if oper==nil then
    return;
  end;
	
  if isBuyEnergy then
    param.isBuy="是";
  else
    param.isBuy="否";
  end;
	
  local status=initStatus(oper,isBuyEnergy);
  local operation=getOperation(param.height,param.width);
  fight[oper](param,status,operation);
	common.exit();
end;
run();
