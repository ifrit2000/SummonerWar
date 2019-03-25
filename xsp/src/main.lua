require("lib")
require("config")
require("status")
require("battle")
require("action")

--s6 2560 1440
--mini2 2048 1536
--mix2 2160 1080
--redMiNote2 1920 1080

--初始化设备信息
function initScript()
	init("0", 1); --以当前应用 Home 键在右边初始化
	local width,height = getScreenSize()
	if width==1536 and height==2048 then
		config.device='mini2'
		config.points=require("points/mini2")
	elseif width==1440 and height==2560 then
		config.device='s6ep'
		config.points=require("points/s6ep")
	elseif width==1080 and height==2160 then
		config.device='mix2'
		config.points=require("points/mix2")
	elseif width==1080 and height==1920 then
		config.device='redMiNote2'
		config.points=require("points/redMiNote2")
	elseif width==1080 and height==2340 then
		config.device='mix3'
		config.points=require("points/mix3")
	else
		dialog("未知设备")
		return false
	end
	config.width=width
	config.height=height
	--x,y = catchTouchPoint()
	sysLog("设备信息: ")
	sysLog("    设备名称:"..config.device)
	sysLog("    分辨率:"..height.."*"..width)
	lib.fileLog("设备名称:"..config.device)
	lib.fileLog("分辨率:"..height.."*"..width)
	
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
	lib.fileLog("开始")
	battle.start()
	lib.fileLog("结束")
	lockDevice();
	lua_exit();
end;

run();