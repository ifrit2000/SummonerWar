require("config")
lib={}
--点击坐标x,y
function lib.click(x,y)
	touchDown(1, x, y);
	lib.sleep(0.2);
	touchUp(1, x, y);
end;

function lib.sleepRandom(minTime,maxTime)
	mSleep((minTime*1000+(maxTime-minTime)*math.random()*1000));
end

function lib.sleep(second)
	mSleep(second*1000);
end

function lib.findColor(point)
	return findColor(point[1],point[2],point[3],point[4],point[5],point[6])
end

function lib.clickPoint(point)
	local x,y=lib.findColor(point)
	if x~=-1 then
		lib.click(x,y)
		return true;
	end
	return false
end

function lib.showMsg(message,x,y)
  local fontSize=40;
  showHUD(config.hudId,message,fontSize,"0xffff0000","0x00ffffff",0,x/2,y-50,500,60);    
--  showHUD(config.hudId,message,fontSize,"0xffff0000","0x00ffffff",0,x/2,y,500,60);    
end

function lib.fileLog(message)
	fileLogWrite("swLog.log",1,"INFO",message)
end



return lib