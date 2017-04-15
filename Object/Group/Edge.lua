local EdgeGroup = {}

function EdgeGroup:new(world)
	local eg = Group:new()
	
	function eg:init()
		self:add(Obj:new({world, 0, 0}, {0, 0, 0, BLOCK_WIDTH*999}))
		self:add(Obj:new({world, W, 0}, {0, 0, 0, BLOCK_WIDTH*999}))
	end
	
	function eg:newLine(y)
		self:add(Obj:new({world, 0, y}, {0, 0, W, 0}))
		self.object[#self.object].b:setActive(false)
	end	
	
	eg:init()
	
	setmetatable(eg, {__index = self})
	
	return eg
end

setmetatable(EdgeGroup, {__index = Group})

return EdgeGroup