local BlockGroup = {}

local Block = {
		require("Object/Data/Block1"),
		require("Object/Data/Block2"),
		require("Object/Data/Block3"),
		require("Object/Data/Block4")
		}

local CENTER_BLOCK = math.ceil(Map.width/2)

function BlockGroup:new(world)
	local bg = Group:new({update = true, press = true}, "group")
	
	local index, edgeCounter
	
	function bg:init()
		self.group[1] = Group:new({update = true, press = false})
		self.group[2] = Group:new({update = true, press = true})
		self.group[3] = Group:new({update = true, press = true})
		self.group[4] = Group:new()
		for i = 1, #self.group do
			local t = self.group[i]
			function t:onDraw(mode) Block[i]:onDraw(mode) end
		end
		self.mapData = Data.newMapData(MAP_SIZE)
		index = 0
		edgeCounter = 0
		for i = 1, Map.height * 1.5 do self:addLine() end
	end
	
	function bg:onUpdate()
		self:removeLinesAboveTopBorder()
		self:addLinesToFill()
	end
	
	function bg:addLine()
		if index < MAP_SIZE then
			if self.mapData == nil then return end
			local y
			if #self.object == 0 then
				y = index * BLOCK_WIDTH + BLOCK_WIDTH/2 + H/2
			else
				local lx, ly = self.object[#self.object].b:getPosition()
				y = ly + BLOCK_WIDTH
			end
			for i = 0, Map.width - 1 do
				local v = self.mapData[index+1][i+1]
				local x = (i * BLOCK_WIDTH) + BLOCK_WIDTH/2
				self:add(Block[v]:new(world, x, y))
				self.group[v]:add(self.object[#self.object])
				if index % Map.height == 0 and i == CENTER_BLOCK then
					group.edge:newLine(y)
					for j = 0, 2 do 
						self.group[4]:add(Block[4]:new(world, x - BLOCK_WIDTH * j, y))
					end
					local id = #self.group[4].object
					self.group[4].object[id-2]:setText(edgeCounter%10, 28)
					self.group[4].object[id-1]:setText(math.floor(edgeCounter/10)%10, 28)
					self.group[4].object[id]:setText(math.floor(edgeCounter/100)%10, 28)
					edgeCounter = edgeCounter + 1
				end
			end
			index = index + 1
		end
	end
	
	function bg:removeLinesAboveTopBorder()
		if #self.object > 0 then
			local x, y = self.object[1].b:getPosition()
			if y + BLOCK_WIDTH/2 < 0 then
				for i = 1, Map.width do 
					self.object[1].b:destroy()
					table.remove(self.object, 1)
				end
			end
		end
	end
	
	function bg:addLinesToFill()
		if #self.object > 0 then
			local x, y = self.object[#self.object].b:getPosition()
			if y + BLOCK_WIDTH/2 < H + H then
				self:addLine()
			end
		end
	end
	
	bg:init()
	
	setmetatable(bg, {__index = self})
	
	return bg
end

setmetatable(BlockGroup, {__index = Group})

return BlockGroup