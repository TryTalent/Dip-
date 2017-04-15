local Block = {}

local color = {255, 204, 102}
local borderColor = {255, 153,  51}

function Block:new(world, x, y)
	local block = Obj:new({world, x, y}, {BLOCK_WIDTH, BLOCK_WIDTH})
	
	function block:onPress(x, y)
		self.b:setActive(false)
		self:setVisible(false)	
		self.a:div(4, 4, x, y, -0.75, 2, 13, 0.3, color, borderColor)
	end
	
	setmetatable(block, {__index = self})
	
	return block	
end

function Block:onDraw(mode)
	if mode == "fill" then
		love.graphics.setColor(color)
	elseif mode == "line" then
		love.graphics.setColor(borderColor)
	end
end

setmetatable(Block, {__index = Obj})

return Block