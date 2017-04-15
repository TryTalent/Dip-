local PlayerGroup = {}

local Player = require("Object/Data/Player")

function PlayerGroup:new(world)
	local pg = Group:new({update = true, press = false})
	
	function pg:init()
		self.object = {}
		self.object[1] = Player:new(world)
	end
	
	function pg:onDraw(mode)
		Player:onDraw(mode)
	end
	
	function pg:show(x, y)
		if y > W/2 then y = W/4 end
		self.object[1].b:setPosition(x, y)
		self.object[1].b:setActive(true)
		self.object[1]:setVisible(true)
	end
	
	pg:init()
	
	setmetatable(pg, {__index = self})
	
	return pg
end

setmetatable(Player, {__index = Group})

return PlayerGroup