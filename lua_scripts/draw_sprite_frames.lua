--Picotron variant
function spr_frames(frames,x,y,speed,flip_x_bool,flip_y_bool)
	local nr_of_frames=#frames
	local this_frame=flr((time()*speed)%nr_of_frames)+1
	spr(frames[this_frame],x,y,flip_x_bool,flip_y_bool)
end

--PICO-8 variant
function spr_frames(frames,pos_x,pos_y,speed,x_size,y_size,flip_x_bool,flip_y_bool)
	local nr_of_frames=#frames
	local this_frame=flr((time()*speed)%nr_of_frames)+1
	spr(frames[this_frame],pos_x,pos_y,x_size,y_size,flip_x_bool,flip_y_bool)
end
