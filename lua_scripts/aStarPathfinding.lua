function get_path(original_start_pos, original_end_pos)	
	--map_scale differs between picotron and pico8
	local map_scale=16
	--the start and end position get switched so that the returned path is in the
	--right order without having to reverse it. 
	local start_pos={x=flr(original_end_pos.x/map_scale),y=flr(original_end_pos.y/map_scale)}
	local end_pos={x=flr(original_start_pos.x/map_scale),y=flr(original_start_pos.y/map_scale)}
	
	local final_node=nil
	--to prevent infinite loops in the case where it's impossible to find a path
	local max_iterations=1000
	
	--can't make a path if the start or end node is in a wall
	if not col(end_pos.x,end_pos.y)
		or not col(start_pos.x,start_pos.y) then
		return {}
	end
	
	--GENERAL IDEA
	--each node gets three important values.
	--g is the distance to the start in total steps to get there, so old_node.g+1
	--h is the heuristic distance to the goal
	--f is the total node cost consisting of g+h(=f)
	
	--declaring these here because they are used in the closures below
	local open_nodes={}
	local closed_nodes={}
	
	--hash coordinate lookup is cleaner than a 2d array
	local function pos_to_key(x,y)
		return x..":"..y
	end
	
	local function node_to_key(node)
		return pos_to_key(node.x,node.y)
	end
	
	--manhattan distance is faster than euclidean distance as a heuristic
	local function get_h(node1,node2)
		return abs(node1.x-node2.x)+abs(node1.y-node2.y)
	end
	
	local function get_neighbors(node)
		local ret = {}
		
		local function handle_neighbor(off_x,off_y)
			local pos_x=node.x+off_x
			local pos_y=node.y+off_y
			
			if not col(pos_x,pos_y) or closed_nodes[pos_to_key(pos_x,pos_y)] then
				return
			end
			
			local new_node={
			x=pos_x,
			y=pos_y,
			g=node.g+1,
			parent=node,
			}
			new_node.h=get_h(new_node,end_pos)
			new_node.f=new_node.g+new_node.h
			add(ret,new_node)
		end
		
		handle_neighbor( 0,-1)
		handle_neighbor( 0, 1)
		handle_neighbor(-1, 0)
		handle_neighbor( 1, 0)
		   
		return ret
	end
	
	local function get_lowest_f_node()
		local current_lowest_f_node = nil
		local f_best = -1
		for _, node in pairs(open_nodes) do
			if node.f < f_best or f_best == -1 then
				current_lowest_f_node = node
				f_best = node.f
			end
		end
		return current_lowest_f_node
	end
	
	--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	--START	
	--XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	
	--start_node will be the first entry for the open list
	local start_node={
	x=start_pos.x,
	y=start_pos.y,
	g=0,
	h=get_h(start_pos,end_pos),
	}
	--g is 0, so f is just h
	start_node.f=start_node.h
	open_nodes[node_to_key(start_node)]=start_node
	
	for _=1,max_iterations do
		--look for node with lowest f on open list
		local current_node=get_lowest_f_node()
		--if there are no open nodes left, then there is no valid path
		if not current_node then
			break
		end
		if current_node.x==end_pos.x and current_node.y==end_pos.y then
			final_node=current_node
			break
		end
		local current_node_key=node_to_key(current_node)
		--any node we visit is guaranteed to have the lowest f value it
		--will ever have
		--so we declare it closed, and never look at it again
		closed_nodes[current_node_key]=current_node
		open_nodes[current_node_key]=nil
		
		for neighbor in all(get_neighbors(current_node)) do
			local neighbor_key = node_to_key(neighbor)
			local original_node = open_nodes[neighbor_key]
			--If we discover a new neighbor that hasn't been seen before, we should add it
			--to the open list.
			--If the old node's g is higher, then the current path takes
			--fewer steps to get to that node, and so should be replaced.
			if not original_node or neighbor.g<original_node.g then
				open_nodes[neighbor_key]=neighbor
			end
		end
	end
	local ret={}
	if final_node then
		local current_node = final_node
		--we can construct a path by going from the end node to its parent,
		--and to the parent of that node, and so on, until we reach the start node,
		--which has no parent.
		while current_node do
			add(ret, {x = current_node.x, y = current_node.y})
			-- Move to the parent of the current node
			current_node = current_node.parent
		end
	end
	return ret
end
