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
	local curStatus=findStatus(status,status.startList)
	if curStatus==nil then
		dialog("初始化状态失败")
		return
	end
	
	--or后面的条件保证最后一次战斗脚本能控制到战斗结束
	while const.repeatCount<config.repeatCount or (const.repeatCount==config.repeatCount and curStatus.name~="victory" and curStatus.name~="noRevive") do
		
		if curStatus.action(curStatus.point) then
			sysLog("执行成功:"..curStatus.name)
			showBattleInfo()
			--执行成功
			statusList=curStatus.nextStatus
			lib.sleep(1.5)
			local tmp=findStatus(status,statusList)
			if tmp~=nil then
				curStatus=tmp
			else
				dialog("程序卡住了,当前状态:"..curStatus.name)
				return
			end
		else
			--未找到点或者失败
			
		end
	end
end

function findStatus(status,statusList)
	local startTime=os.time()
	keepScreen(true)
	while os.time()-startTime<60 do
		local isColorExist
		for k,v in pairs(statusList) do
			sysLog("开始查找:"..v)
			isColorExist=lib.findColor(status[v].point)
			if isColorExist~=-1 then
				--如果存在,设置当前status,跳出循环
				
				sysLog("查找成功:"..v)
				return status[v]
			end
			sysLog("查找失败:"..v)
		end
		--刷新画面
		lib.sleep(1.5)
		keepScreen(false)
		keepScreen(true)
	end
	keepScreen(false)
	return nil
end

function showBattleInfo()
	local message="战斗类型:"..config[config.battleType].."\n".."重复次数:"..const.repeatCount.."/"..config.repeatCount.."\n".."购买体力:"..const.energeCount.."/"..config.energeCount
	lib.showMsg(message)
end


return battle