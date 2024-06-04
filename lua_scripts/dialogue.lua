function init_talk()
talk={}
talk_timer=0
--at what speed the text gets
--"typed" 
talk_cd=.01 
--how far the text is advanced
talk_progress=0
end

function new_dialogue(t)
local function split_str(str,length)
local max_length=length or 29
local strings=split(str," ",false)
local result={}
local cur_str=""
	for i in all(strings) do
		if #cur_str+#i<max_length then
			if #cur_str!=0 then
			cur_str=cur_str.." "..i
			else
			cur_str=i
			end
		else
			add(result,cur_str)
			cur_str=i
		end
	end
add(result,cur_str)
return result
end
talk=split_str(t)
end

function do_talk()
--if there is something to be 
--displayed display it
if #talk>0 then
	local length=0
		--actually displaying it
			rectfill(3,95,124,124,2)
			rect(3,95,124,124,13)
			line(124,96,124,124,6)
			line(4,124,124,124,6)
			print(sub(talk[1],1,talk_progress),6,99,7)
			
			if(talk[2]!=nil)print(sub(talk[2],1,max(talk_progress-#talk[1])),6,106,7)
			if(talk[3]!=nil)print(sub(talk[3],1,max(talk_progress-#talk[1]-#talk[2])),6,113,7)
		
			if #talk>0 then
		--if there is pending dialogue
		--display it
			--determine the length of the
			--strings
			length=#talk[1]
			if talk[2]!=nil then
			length+=#talk[2]
			end
			if talk[3]!=nil then
			length+=#talk[3]
			end
			--"type" the text
			if time()>talk_timer and talk_progress<length then
				talk_timer=time()+talk_cd
				talk_progress+=1
				sfx(4)
			end
			--advance the text
			if(talk_progress>=length)print("🅾️",115,119+sin(time()),7)
			if btnp(🅾️) and talk_progress>=length then
			talk_progress=0
			del(talk,talk[1])
			del(talk,talk[1])
			del(talk,talk[1])
			elseif btnp(🅾️) and talk_progress<length and talk_progress>1 then
				talk_progress=length
			end
		end
	end
end
