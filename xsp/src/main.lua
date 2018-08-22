require("lib")
require("config")
require("status")
require("battle")
require("action")

--s6 2560 1440
--mini2 2048 1536

--初始化设备信息
function initScript()
	init("0", 1); --以当前应用 Home 键在右边初始化
	local width,height = getScreenSize()
	
	if width==1536 and height==2048 then
		config.width=1536
		config.height=2048
		config.device='mini2'
		config.points=require("points/mini2")
	elseif width==1440 and height==2560 then
		config.width=1440
		config.height=2560
		config.device='s6ep'
		config.points=require("points/s6ep")
	else
		dialog("未知设备")
		return false
	end
	--x,y = catchTouchPoint()
	sysLog("设备信息: ")
	sysLog("    设备名称:"..config.device)
	sysLog("    分辨率:"..height.."*"..width)
	
	config.hudId = createHUD()     --创建一个HUD
	return true
end

--解析UI
function parseUI()
	local ret,result=showUI("ui.json")
	if ret==0 then
		return false
	end
	config.repeatCount=tonumber(result['repeatCount'])
	config.energeCount=tonumber(result['energeCount'])
	config.battleType=tonumber(result['battleType'])
	
	return true
end


function run()
	if initScript()==false then
		return
	end
	if parseUI()==false then
		return
	end

	battle.start()
	
end;

run();