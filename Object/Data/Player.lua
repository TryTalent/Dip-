local Player = {}

local x, y = W/2, H/4
local w = W/Map.width/3
local h = w
local speed = BLOCK_WIDTH * 4
local canMove = false
local color = {255, 102, 102}
local borderColor = {204,  51,  51}

function Player:new(world)
	local player = Obj:new({world, x, y, "dynamic"}, {w, h})
	
	function player:init()
		canMove = false
		self.f:setUserData("player")
		self.b:setActive()
		self:setVisible(false)
	end
	
	function player:onUpdate()
		if canMove then
			vx, vy = self.b:getLinearVelocity()
			if math.abs(vx) < 1 then speed = -speed end
			self.b:setLinearVelocity(speed, vy)
		end	
	end
	
	player:init()
	
	setmetatable(player, {__index = self})
	
	return player
end

function Player:onDraw(mode)
	if mode == "fill" then
		love.graphics.setColor(color)
	elseif mode == "line" then
		love.graphics.setColor(borderColor)
	end
end

function beginContact(a, b)
	if not canMove then
		if a:getUserData() == "player" or b:getUserData() == "player" then canMove = true end
	end
end

setmetatable(Player, {__index = Obj})

return Player