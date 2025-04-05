--fades in when progress is going from 0-1 and out if progress is going 1-0.
function fade(progress)
	for xx=0,15 do
		for yy=0,15 do
			circfill(xx*8+4,yy*8+4,8*(1-progress)+sin((yy)/15),0)
		end
	end
end
