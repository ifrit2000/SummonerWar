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

function lib.showMsg(message)
  local fontSize=50;
  showHUD(config.hudId,message,fontSize,"0xffff0000","0x00ffffff",3,0,0,500,180);     --变更显示的HUD内容
end





return lib