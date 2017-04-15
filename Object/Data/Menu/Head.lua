local Head = {}

local x, y = W/2, H/2 - 98
local color = {255, 255, 255}

function Head:new(world)
	local head = Obj:new({world, x, y}, {100, 100})
	
	function head:drawShape() end
	
	setmetatable(head, {__index = self})
	
	return head
end

function Head:onDraw(mode)
	if mode == "text" then
		love.graphics.setColor(color)
	end
end

setmetatable(Head, {__index = Obj})

return Head