local Block = {}

local color = {255, 255, 204}
local borderColor = {255, 255, 204}

function Block:new(world, x, y)
	local block = Obj:new({world, x, y}, {BLOCK_WIDTH, BLOCK_WIDTH})
	
	function block:init()
		self.b:setActive(false)
		self:setVisible(false)
	end
	
	block:init()
	
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