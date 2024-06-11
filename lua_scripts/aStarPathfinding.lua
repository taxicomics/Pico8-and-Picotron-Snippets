function get_path(start_node,end_node)	
	--picotron/pico8 specific settings for this function
	local map_scale=16
	local scaled_end_node={x=flr(end_node.x/map_scale),y=flr(end_node.y/map_scale)}
	local scaled_start_node={x=flr(start_node.x/map_scale),y=flr(start_node.y/map_scale)}
	--function overflow vars
	local path_found=false
	local max_iterations=1000
	local current_iterations=0
	--catch invalid paths early
	if not col(scaled_end_node.x,scaled_end_node.y)
		 or not col(scaled_start_node.x,scaled_start_node.y) then
		return {}
	end  
	--GENERAL IDEA
	--each node gets three important values.
	--g is the distance to the start in total steps to get there, so old_node_g+1
	--h is the heuristic distance to the goal
	--f is the total node cost consisting of g+h(=f)
	
	--necessary functions
	local function is_table_empty(t)
		--I'll keep next as an alias to keep this readable,
		--thx though @ablebody
		next(t)
	end
	local function node_to_key(x,y)
		return x..":"..y
	end
	local function table_get(table,element)
		return table[node_to_key(element.x,element.y)]
	end	
	--function to check whether a table contains an element
	local function table_has(table,element)
		return table and table[node_to_key(element.x,element.y)]
	end	
	--function to get the h value(the heuristic distance) and skip the sqr for speed
	local function get_h(node1,node2)
		return abs(node1.x-node2.x)+abs(node1.y-node2.y)
	end
	--get neighbors to check the sorrounding tiles
	local function get_neighbors(node)
		local ret = {}
	    
		local function handle_neighbor(off_x,off_y)
			local pos_x=node.x+off_x
			local pos_y=node.y+off_y
	       
			if not col(pos_x,pos_y) or table_has(closed_list,{x=pos_x,y=pos_y}) then
				return
			end
	        
			local new_node={
			x=pos_x,
			y=pos_y,
			g=node.g+1,
			parent=node,
			}
			new_node.h=get_h(new_node,scaled_end_node)
			new_node.f=new_node.g+new_node.h
			add(ret,new_node)
		end
	   
		handle_neighbor( 0,-1)
		handle_neighbor( 0, 1)
		handle_neighbor(-1, 0)
		handle_neighbor( 1, 0)
		   
		return ret
	end
	--function to get lowest f node
	local function get_lowest_f_node(tree)
	    local current_lowest_f_node = nil
	    local f_best = -1
	    for _, node in pairs(tree) do
	        if node.f < f_best or f_best == -1 then
	            current_lowest_f_node = node
	            f_best = node.f
	        end
	    end
	    return current_lowest_f_node
	end
--list of nodes we have not fully explored/expanded. New ones get added to this
	local open_list={}
	--add the given start_node as the first node to the open list and give it g,h and f
	local node={
	x=scaled_start_node.x,
	y=scaled_start_node.y,
	parent={x=scaled_start_node.x,y=scaled_start_node.y},
	g=0,
	}
	node.h=get_h(node,scaled_end_node)
	node.f=0
	open_list[node_to_key(node.x,node.y)]=node
	--list of already explored nodes. The ones with fully explored neighbors are here.
	local closed_list={}
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--START	
--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
--as long as there are still nodes to explore and no path has been found
	while not is_table_empty(open_list) do
		current_iterations+=1
		if current_iterations>max_iterations then
			break
		end
		--look for node with lowest f on open list
		local current_node=get_lowest_f_node(open_list)
		--if current_node is goal
		if current_node.x==scaled_end_node.x and current_node.y==scaled_end_node.y then
			path_found=true
			break
		end
		--switch it to the closed list
		closed_list[node_to_key(current_node.x,current_node.y)]=current_node
		open_list[node_to_key(current_node.x,current_node.y)]=nil
		--go through it's neighbors
		local neighbors=get_neighbors(current_node)
		for i in all(neighbors) do
				--If it isnt on the open list, add it to the open list. Make the current square 
				--the parent of this square. Record the F, G, and H costs of the square.
				if not table_has(open_list,i) then
					open_list[node_to_key(i.x,i.y)]=i
				else
	--If it is on the open list already, check to see if this path to that
	-- square is better, using G cost as the measure. A lower G cost means that 
	--this is a better path. If so, change the parent of the square to the current 
	--square, and recalculate the G and F scores of the square. If you are keeping your
	-- open list sorted by F score, you may need to resort the list to account for the
	-- change.
					local alt_node=table_get(open_list,i)
					if alt_node.g>i.g then
						open_list[node_to_key(alt_node.x,alt_node.y)]=nil
						open_list[node_to_key(i.x,i.y)]=i
					end
				end
		end--end of the neighbors loop
	end--end of while #open_list>0 loop
	local ret={}
	if path_found then
--	if not is_table_empty(open_list) then
--if there are still elements in the open list a path was found
--now construct a path by going from one node to it's parent etc
		local is_back=false
		local current_node=get_lowest_f_node(open_list)
	    while current_node do
	        -- Add the current node to the path
	        add(ret, {x = current_node.x, y = current_node.y})
	        -- If the current node is the start node, break the loop
	        if current_node.x == scaled_start_node.x and current_node.y == scaled_start_node.y then
	            break
	        end
	        -- Move to the parent of the current node
	        current_node = current_node.parent
	    end	
    end--if path was found
	return ret
end
