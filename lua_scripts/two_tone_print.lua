--opt_height is an optional parameter to change the position of the dividing horizontal line
--Keep in mind that this funcion uses CLIP to achieve it's effect. It WILL NOT respect or reset any other CLIPS you might be doing. 

function print_two_tone(text,x,y,color_1,color_2,opt_height)
local height=opt_height or 3
    print(text,x,y,color_1)
    clip(0,0,127,y+height)
    print(text,x,y,color_2)
    clip()
end
