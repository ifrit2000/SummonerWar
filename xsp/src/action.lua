require("lib")
require("const")
action={}

action.clickPointAction={"tangle","victoryRGB","victory","confirmReward","saleRune","confirmSaleRune",
	"noRevive","defeat","prepareBattle","openStore","clickEnerge","buyEnerge","closeStore"}
action.emptyAction={"gear"}

function action.addRepeatCount(point)
	if lib.clickPoint(point) then
		const.repeatCount=const.repeatCount+1
		return true;
	end
	return false;
end

action.startFight=action.addRepeatCount
action.again=action.addRepeatCount

function action.finishBuyConfirm(point)
	if lib.clickPoint(point) then
		const.energeCount=const.energeCount+1
		return true;
	end
	return false;
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