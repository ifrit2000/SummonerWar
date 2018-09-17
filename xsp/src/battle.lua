--战斗相关
require("config")
require("status")
require("lib")
require("const")

battle={}

function battle.log()
	sysLog("战斗信息:")
	sysLog("    战斗类型:"..config[config.battleType])
	sysLog("    重复次数:"..config.repeatCount)
	sysLog("    购买体力:"..config.energeCount)
end

function battle.start()
	--判断当前状态
	status.init()
	local status=status[config.battleType]
	
	showBattleInfo()
	--初始化状态
	local curStatus=findStatus(status,status.startList,180)
	sysLog("初始状态:"..curStatus.name)
--local curStatus=findStatus(status,{"openStore"},20)
	if curStatus==nil then
		dialog("初始化状态失败")
		return
	end
	
	--or后面的条件保证最后一次战斗脚本能控制到战斗结束
	while const.repeatCount<config.repeatCount or (const.repeatCount==config.repeatCount and curStatus.name~="victory" and curStatus.name~="noRevive") do
		--判断购买体力
		if curStatus.name=="openStore" and const.energeCount>=config.energeCount then
			
			return
		end
		
		if curStatus.action(curStatus.point) then
			sysLog("执行成功:"..curStatus.name)
			fileLogWrite("swlog",1,"INFO","执行成功:"..curStatus.name)
			showBattleInfo()
			--执行成功
			statusList=curStatus.nextStatus
			lib.sleepRandom(0.8,1.6)
			local tmp=findStatus(status,statusList,curStatus.execTime)
			if tmp~=nil then
				curStatus=tmp
			else
--				dialog("程序卡住了,当前状态:"..curStatus.name)
				return
			end
		else
			--未找到点或者失败
			
		end
	end
end

--status     所有状态列表
--statusList 需要查找的状态列表
--execTime   执行时间,超过这个时间就跳出
function findStatus(status,statusList,execTime)
	local startTime=os.time()
	keepScreen(true)
	while os.time()-startTime<execTime do
		local isColorExist
		for k,v in pairs(statusList) do
			sysLog("开始查找:"..v.." 剩余时间: "..(execTime-(os.time()-startTime)))
			fileLogWrite("swlog",1,"INFO","开始查找:"..v.." 剩余时间: "..(execTime-(os.time()-startTime)))
			isColorExist=lib.findColor(status[v].point)
			if isColorExist~=-1 then
				--如果存在,设置当前status,跳出循环
				
				sysLog("查找成功:"..v)
				fileLogWrite("swlog",1,"INFO","查找成功:"..v)
				return status[v]
			end
			sysLog("查找失败:"..v)
			fileLogWrite("swlog",1,"INFO","查找失败:"..v)
		end
		--刷新画面
		lib.sleepRandom(0.8,1.6)
		keepScreen(false)
		keepScreen(true)
	end
	keepScreen(false)
	return nil
end

function showBattleInfo()
	local message="战斗类型:"..config[config.battleType].."\n".."重复次数:"..const.repeatCount.."/"..config.repeatCount.."/:"..const.defeatCount.."\n".."购买体力:"..const.energeCount.."/"..config.energeCount
	lib.showMsg(message)
end


return battle