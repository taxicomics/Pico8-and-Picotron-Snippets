--this takes a non string seconds variable and returns a string. So 183 seconds returns "00:03:03"
function sec_to_string(seconds)
  local minutes=flr(seconds/60)
  local hours=flr(minutes/60)
  minutes=minutes%60
  local seconds=flr(seconds%60)
  if seconds<10 then
  	seconds=tostr("0"..seconds)
  end
  if minutes<10 then
  	minutes=tostr("0"..minutes)
  end
  return hours..":"..minutes..":"..seconds
end
