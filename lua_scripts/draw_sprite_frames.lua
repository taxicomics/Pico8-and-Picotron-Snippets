function spr_frames(frames,x,y,speed,flip_x_bool,flip_y_bool)
	local nr_of_frames=#frames
	local this_frame=flr((time()*speed)%nr_of_frames)+1
	spr(frames[this_frame],x,y,flip_x_bool,flip_y_bool)
end
