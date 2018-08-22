require("config")
require("action")
status={}

function status.getCurStatus(candidateStatus)
	keepScreen(true)
	for k,v in pairs(candidateStatus) do
		local x,y=findColor(v.point)
	end
	keepScreen(false)
end

status.common={
	startFight={
		name="startFight",
		point=nil,
		preStatus={},
		nextStatus={"gear"}
	},
	gear={
		name="gear",
		point=nil,
		preStatus={"startFight"},
		nextStatus={"tangle","victoryRGB","noRevive"}
	},
	tangle={
		name="tangle",
		point=nil,
		preStatus={"gear"},
		nextStatus={"tangle","victoryRGB","noRevive"}
	},
	victoryRGB={
		name="victoryRGB",
		point=nil,
		preStatus={"gear","tangle"},
		nextStatus={"victory"}
	},
	victory={
		name="victory",
		point=nil,
		preStatus={"victoryRGB"},
		nextStatus={"saleRune","confirmReward"}
	},
	confirmReward={
		name="confirmReward",
		point=nil,
		preStatus={"victory"},
		nextStatus={"again"}
	},
	saleRune={
		name="saleRune",
		point=nil,
		preStatus={"victory"},
		nextStatus={"again","confirmSaleRune"}
	},
	confirmSaleRune={
		name="confirmSaleRune",
		point=nil,
		preStatus={"saleRune"},
		nextStatus={"again"}
	},
	again={
		name="again",
		point=nil,
		preStatus={"saleRune","confirmReward","confirmSaleRune"},
		nextStatus={"tangle","victoryRGB","noRevive"}
	},
	noRevive={
		point=nil,
		preStatus={},
		nextStatus={}
	},
	defeat={
		point=nil,
		preStatus={},
		nextStatus={}
	},
	prepareBattle={
		point=nil,
		preStatus={},
		nextStatus={}
	},
	startList={"startFight","gear"}
}



--带狗粮
status[0]={
	startFight=status.common.startFight,
	gear=status.common.gear,
	tangle=status.common.tangle,
	victoryRGB=status.common.victoryRGB,
	victory=status.common.victory,
	confirmReward=status.common.confirmReward,
	saleRune=status.common.saleRune,
	confirmSaleRune=status.common.confirmSaleRune,
	again=status.common.again,
	noRevive=status.common.noRevive,
	defeat=status.common.defeat,
	prepareBattle=status.common.prepareBattle,
	startList=status.common.startList
}

--觉醒
status[1]={
	startFight=status.common.startFight,
	gear=status.common.gear,
	tangle=status.common.tangle,
	victoryRGB=status.common.victoryRGB,
	victory={
		name="victory",
		point=nil,
		preStatus={"victoryRGB"},
		nextStatus={"confirmReward"}
	},
	confirmReward=status.common.confirmReward,
	
	again=status.common.again,
	noRevive=status.common.noRevive,
	defeat=status.common.defeat,
	prepareBattle=status.common.prepareBattle,
	startList=status.common.startList
}


function status.init()
	action.init()
	--初始化point
	for k,v in pairs(status[config.battleType]) do
		v.point=config.points[k]
		v.action=action[k]
		--添加自己到next
		if v.nextStatus~=nil then
			v.nextStatus[#v.nextStatus+1]=v.name
		end
	end
end

return status