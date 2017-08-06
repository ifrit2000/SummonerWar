require("common");
local operation={};
function getOperation(height,width)
  
  
  operation.height=height;
  operation.width=width;
  
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
  operation.saleFiveStarRune=common.clickButton;
  
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
  
  operation.notEnoughEnergy=function(param)
    common.clickButton(param);
    lua_exit();
  end
  
  return operation;
end;