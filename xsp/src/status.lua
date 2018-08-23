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
		nextStatus={"gear"},
		execTime=60
	},
	gear={
		name="gear",
		point=nil,
		nextStatus={"tangle","victoryRGB","noRevive"},
		execTime=300
	},
	tangle={
		name="tangle",
		point=nil,
		nextStatus={"victoryRGB","noRevive"},
		execTime=300
	},
	victoryRGB={
		name="victoryRGB",
		point=nil,
		nextStatus={"victory"},
		execTime=10
	},
	victory={
		name="victory",
		point=nil,
		nextStatus={"saleRune","confirmReward"},
		execTime=10
	},
	confirmReward={
		name="confirmReward",
		point=nil,
		nextStatus={"again"},
		execTime=10
	},
	saleRune={
		name="saleRune",
		point=nil,
		nextStatus={"again","confirmSaleRune"},
		execTime=10
	},
	confirmSaleRune={
		name="confirmSaleRune",
		point=nil,
		nextStatus={"again"},
		execTime=10
	},
	again={
		name="again",
		point=nil,
		nextStatus={"gear","openStore"},
		execTime=60
	},
	noRevive={
		name="noRevive",
		point=nil,
		nextStatus={"defeat"},
		execTime=10
	},
	defeat={
		name="defeat",
		point=nil,
		nextStatus={"prepareBattle"},
		execTime=10
	},
	prepareBattle={
		name="prepareBattle",
		point=nil,
		nextStatus={"startFight"},
		execTime=10
	},
	openStore={
		name="openStore",
		point=nil,
		nextStatus={"clickEnerge"},
		execTime=10
	},
	clickEnerge={
		name="clickEnerge",
		point=nil,
		nextStatus={"buyEnerge"},
		execTime=10
	},
	buyEnerge={
		name="buyEnerge",
		point=nil,
		nextStatus={"finishBuyConfirm"},
		execTime=10
	},
	
	finishBuyConfirm={
		name="finishBuyConfirm",
		point=nil,
		nextStatus={"closeStore"},
		execTime=10
	},
	
	closeStore={
		name="closeStore",
		point=nil,
		nextStatus={"again"},
		execTime=10
	},
	
	startList={"startFight","gear"}
--	startList={"littleBoss"}
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
	
	openStore=status.common.openStore,
	clickEnerge=status.common.clickEnerge,
	buyEnerge=status.common.buyEnerge,
	finishBuyConfirm=status.common.finishBuyConfirm,
	closeStore=status.common.closeStore,
	
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
		nextStatus={"confirmReward"},
		execTime=10
	},
	confirmReward=status.common.confirmReward,
	
	again=status.common.again,
	noRevive=status.common.noRevive,
	defeat=status.common.defeat,
	prepareBattle=status.common.prepareBattle,
	
	openStore=status.common.openStore,
	clickEnerge=status.common.clickEnerge,
	buyEnerge=status.common.buyEnerge,
	finishBuyConfirm=status.common.finishBuyConfirm,
	closeStore=status.common.closeStore,
	
	startList=status.common.startList
}

--符文
status[2]={
	startFight=status.common.startFight,
	gear={
		name="gear",
		point=nil,
		nextStatus={"tangle","littleBoss","victoryRGB","noRevive"},
		execTime=100
	},
	tangle={
		name="tangle",
		point=nil,
		nextStatus={"littleBoss","victoryRGB","noRevive"},
		execTime=100
	},
	littleBoss={
		name="littleBoss",
		point=nil,
		nextStatus={"bigBoss","victoryRGB","noRevive"},
		execTime=300
	},
	bigBoss={
		name="bigBoss",
		point=nil,
		nextStatus={"victoryRGB","noRevive"},
		execTime=300
	},
	victoryRGB=status.common.victoryRGB,
	victory={
		name="victory",
		point=nil,
		nextStatus={"keepRune","confirmReward"},
		execTime=10
	},
	confirmReward=status.common.confirmReward,
	keepRune={
		name="keepRune",
		point=nil,
		nextStatus={"again"},
		execTime=10
	},
	again=status.common.again,
	noRevive=status.common.noRevive,
	defeat=status.common.defeat,
	prepareBattle=status.common.prepareBattle,
	
	openStore=status.common.openStore,
	clickEnerge=status.common.clickEnerge,
	buyEnerge=status.common.buyEnerge,
	finishBuyConfirm=status.common.finishBuyConfirm,
	closeStore=status.common.closeStore,
	
	startList=status.common.startList
}

--塔
status[3]={
	startFight=status.common.startFight,
	gear={
		name="gear",
		point=nil,
		nextStatus={"tangle","littleBoss","victoryRGB","defeat"},
		execTime=300
	},
	tangle={
		name="tangle",
		point=nil,
		nextStatus={"littleBoss","victoryRGB","defeat"},
		execTime=300
	},
	littleBoss={
		name="littleBoss",
		point=nil,
		nextStatus={"victoryRGB","defeat"},
		execTime=300
	},
	victoryRGB=status.common.victoryRGB,
	victory={
		name="victory",
		point=nil,
		nextStatus={"confirmReward"},
		execTime=10
	},
	confirmReward={
		name="confirmReward",
		point=nil,
		nextStatus={"nextStage"},
		execTime=10
	},
	nextStage={
		name="nextStage",
		point=nil,
		nextStatus={"startFight"},
		execTime=10
	},
	defeat=status.common.defeat,
	--prepareBattle=status.common.prepareBattle,
	
	openStore=status.common.openStore,
	clickEnerge=status.common.clickEnerge,
	buyEnerge=status.common.buyEnerge,
	finishBuyConfirm=status.common.finishBuyConfirm,
	closeStore=status.common.closeStore,
	
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