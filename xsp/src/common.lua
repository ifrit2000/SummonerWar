common={};
--点击坐标x,y
common.click=function(x,y)
  touchDown(1, x, y);
  common.sleep(0.2);
  touchUp(1, x, y);
end

--随机睡眠从minTime到maxTime 单位：秒
common.sleepRandom=function(minTime,maxTime)
  mSleep((minTime*1000+(maxTime-minTime)*math.random()*1000));
end

--睡眠 单位：秒
common.sleep=function(second)
   mSleep(second*1000);
end

common.findMultiColorInRegionFuzzy=function(tParam)
  local flag,x,y;
  flag=false;
  keepScreen(true);
  x,y=findMultiColorInRegionFuzzy(tParam[1],tParam[2],tParam[3],tParam[4],tParam[5],tParam[6],tParam[7]);
  keepScreen(false);
  if x>-1 and y>-1 then
    flag=true;
  end;
  return flag,x,y;
end

common.clickButton=function(param)
  local flag,x,y=common.findMultiColorInRegionFuzzy(param);
  if flag==false then
    return flag;
  end;
  common.click(x,y);
  return flag;
end

--检查状态
common.checkStatus=function(param)
  local flag,x,y=common.findMultiColorInRegionFuzzy(param);
  return flag;
end

--更新状态列表
common.updateStatusList=function(param,statusList)
  for k,v in pairs(statusList) do
    statusList[k].status,x,y=common.checkStatus(param[k]);
    if statusList[k].status==true and statusList[k].statusList~=nil then
      statusList[k].statusList=common.updateStatusList(param,statusList[k].statusList);
      if k=='defeat' or k=='victory' or k=='saleFiveStarRune' or k=='gear' or k=='noResurgence' then
--				sysLog('return '..k);
        return statusList;
      end;
    end;
  end;
  return statusList;
end

--设置所有为false
common.setStatusListFalse=function(statusList)
  for k,v in pairs(statusList) do
    statusList[k].status=false;
    if v.statusList~=nil then
      common.setStatusListFalse(v.statusList);
    end;
  end;
end

common.printStatus=function(statusList)
  for k,v in pairs(statusList) do
    sysLog(k..':'..tostring(v.status)..' substatus: '..tostring(statusList[k].statusList));
    if v.status==true and v.statusList~=nil then
      common.printStatus(v.statusList);
    end;
  end;
end

--获取table的真实长度
common.realTableLenth=function(t)
  local i=0;
  for k,v in pairs(t) do
    i=i+1;
  end;
  return i;
end
