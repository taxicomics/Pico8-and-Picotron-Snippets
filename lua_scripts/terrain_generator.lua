function generate_terrain(seed)
if(seed!=nil)srand(seed)
local complexity=11
-- generate a random heightmap
local hmap={}
for x=0,127 do
    hmap[x]={}
    for y=0,127 do
        hmap[x][y]=rnd(complexity)
    end
end

-- smooth the heightmap using a simple average filter
local function smooth()
    local temp={}
    for x=0,127 do
        temp[x]={}
        for y=0,127 do
            local sum=0
            local ct=0
            for dx=-1,1 do
                for dy=-1,1 do
                    local nx=x+dx
                    local ny=y+dy
                    if nx>-1 and nx<128 and ny>-1 and ny<128 then
                        sum+=hmap[nx][ny]
                        ct+=1
                    end
                end
            end
            temp[x][y]=sum/ct
        end
    end
    hmap=temp
end

    -- smooth the heightmap 5 times
    for i=1,4 do
        smooth()
    end

--setting the pixel values
        for x=0,127 do
        for y=0,127 do
            local val=(hmap[x][y])
--write your own logic here!
--this could be substituted 
--with mset() or sth similar
--and take the values into 
--account.ill provide a small
--example
            if val<4.5 then
            --deep water
                sset(x,y,1)
            elseif val<5 then
            --water
                sset(x,y,12)
            elseif val<5.2 then
            --beach
                sset(x,y,9)
            elseif val<6 then
            --grass
                sset(x,y,3)
            elseif val<6.7 then
            --mountain
                sset(x,y,13)
            else
            --snow
                sset(x,y,6)
            end
        end
    end
end
