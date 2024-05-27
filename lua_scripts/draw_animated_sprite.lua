--Draw sprite N at the position X/Y with NFRAMES number of frames at a certain SPEED and maybe FLIP it. 
--flip, speed and even Nframes are optional if the animation has just two frames. 

function spr_anim(n,x,y,nframes,speed,flip_x,flip_y)
    local speed=speed or 1
    local nframes=nframes or 2
    spr(n+(time()*speed)%nframes,x,y,1,1,flip_x,flip_y)
end
