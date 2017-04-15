local Info = {}

local x, y = W/2, H/2 - 40
local color = {0, 0, 0}
local text = "version: 1.0\ndeveloper: Oleg Osipov\nsupport:\noleggosipov@gmail.com"

function Info:new(world)
	local info = Obj:new({world, x, y}, {250, 100})
	
	function info:init()
		self:setText(text, 16)
	end
	
	function info:drawShape() end
	
	info:init()
	
	setmetatable(info, {__index = self})
	
	return info
end

function Info:onDraw(mode)
	if mode == "text" then
		love.graphics.setColor(color)
	end
end

setmetatable(Info, {__index = Obj})

return Info