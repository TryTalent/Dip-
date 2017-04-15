local Block = {}

local color = {255, 102, 102}
local borderColor = {204,  51,  51}
local recolor = {borderColor, 7, color, 7}

function Block:new(world, x, y)
	local block = Obj:new({world, x, y}, {BLOCK_WIDTH, BLOCK_WIDTH})
	
	function block:onPress()
		self.a:recolor(recolor)
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