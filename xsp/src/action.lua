require("lib")
require("const")
require("config")
require("lib")
action={}

action.clickPointAction={"tangle","victoryRGB","victory","confirmReward","saleRune","confirmSaleRune","keepRune",
	"noRevive","prepareBattle","openStore","clickEnerge","buyEnerge","closeStore","nextStage","synthesis","confirmSynthesis","pureDefeat","rbTalk",
	"owStartFight","owVictory","owDefeat","owSameTeamAgain","owReadyToFight"}
action.emptyAction={"gear","bigBoss","owGear"}

function action.littleBoss()
	if config.battleType~=3 and config.battleType~=4 and config.isClickLittleBoss==false then
		lib.click(1331*config.height/2048,596*config.width/1536)
		config.isClickLittleBoss=true
	end
	
	if (config.battleType==3 or config.battleType==4) and config.isClickLittleBoss==false then
		lib.click(config.height/2,667*config.width/1536)
		config.isClickLittleBoss=true
	end
	return true
end

function action.addRepeatCount(point)
	if lib.clickPoint(point) then
		const.repeatCount=const.repeatCount+1
		config.isClickLittleBoss=false
		return true;
	end
	return false;
end

action.startFight=action.addRepeatCount
action.again=action.addRepeatCount
action.synthesisOk=action.addRepeatCount
action.owConfirmStartFight=action.owConfirmStartFight

function action.finishBuyConfirm(point)
	if lib.clickPoint(point) then
		const.energeCount=const.energeCount+1
		return true;
	end
	return false;
end

function action.defeat(point)
	if config.battleType==3 then
		lockDevice();
		lua_exit();
	else
		return lib.clickPoint(point)
	end
end


function action.init()
	for k,v in pairs(action.clickPointAction) do
		action[v]=lib.clickPoint
	end
	for k,v in pairs(action.emptyAction) do
		action[v]=function()
			return true;
		end
	end
end


return action