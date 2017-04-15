local InfoGroup = {}

local Head = require("Object/Data/Menu/Head")
local Frame = require("Object/Data/Menu/Frame")

function InfoGroup:new(world)
	local info = Group:new()
	
	function info:init()
		self:add(Frame:new(world))
		self:add(Head:new(world))
	end
	
	function info:setHead(str)
		self.object[2]:setText(string.upper(str), 17)
	end
	
	info:init()
	
	setmetatable(info, {__index = self})
	
	return info
end

setmetatable(InfoGroup, {__index = Group})

return InfoGroup