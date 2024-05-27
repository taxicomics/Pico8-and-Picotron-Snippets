--This is a basic raycast function.
--It checks whether two points on a map can "see" each other based on the map data. It assumes flag 0 to be the collision layer.
--It returns TRUE if they can see each other or FALSE if they can't. 
function can_see(x1,y1,x2,y2,length)
--x1 and y1 are the point of view,length is the max distance of the two points
    local max_length=length or 1000
    local xvec=0
    local yvec=0
    local len=0
    local ret=true  
    local tx=x1
    local ty=y1
    xvec=x2-x1
    yvec=y2-y1
    len=sqrt(xvec^2+yvec^2)
    if len==0 or len>max_length then
     ret=false
    end
    xvec=(xvec/len)
    yvec=(yvec/len)
    if ret then
        for i=1,len do
        tx+=xvec
        ty+=yvec
            if fget(mget(flr(tx/8),flr(ty/8)),0) then
                ret=false
                break
            end
        end
    end
    return ret
end
