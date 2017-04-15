local Block = {}

local color = {255, 255, 255}
local borderColor = {255, 153,  51}
local textColor = {204,  51,  51}
local angle = 45
local sk = 0.6

function Block:new(world, x, y)
	local block = Obj:new({world, x, y}, {BLOCK_WIDTH * sk, BLOCK_WIDTH * sk})
	
	function block:init()
		self.b:setAngle(angle * math.pi/180)
		self.b:setActive(false)
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
	elseif mode == "text" then
		love.graphics.setColor(textColor)
	end
end

setmetatable(Block, {__index = Obj})

return Block