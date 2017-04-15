local Obj = {}

local Animation = require("Object/Animation")
local fonts = {}

function Obj:new(body, shape)
	local obj = {}
	
	function obj:init()
		if #shape == 2 then
			self.s = love.physics.newRectangleShape(shape[1], shape[2])
			function self:drawShape(mode)
				love.graphics.polygon(mode, self.b:getWorldPoints(self.s:getPoints()))
			end
		elseif #shape == 4 then
			self.s = love.physics.newRectangleShape(shape[1], shape[2], shape[3], shape[4])
			function self:drawShape()
				love.graphics.line(self.b:getWorldPoints(self.s:getPoints()))
			end
		end
		self.b = love.physics.newBody(body[1], body[2], body[3], body[4])
		self.f = love.physics.newFixture(self.b, self.s)
		self.a = Animation:new(self)
		self.c = Group:new({update = true, press = false})
		self.visible = true
		self.info = {body = body, shape = shape}
	end
	
	function obj:update() 
		if self.onUpdate ~= nil then self:onUpdate() end
		self.a:update()
		self.c:update()
	end
	
	function obj:draw(mode, t)
		if self.visible and not self.b:isDestroyed() and t == nil then
			if mode == "text" then
				if self.text ~= nil then
					local x, y = self.b:getPosition()
					love.graphics.draw(self.text.data, x - self.text.w/2, y - self.text.h/2)
				end
			else
				if self.color ~= nil and mode ~= "line" then
					local color = {love.graphics.getColor()}
					love.graphics.setColor(self.color)
					self:drawShape(mode)
					love.graphics.setColor(color)
				else
					self:drawShape(mode)
				end
			end
		end
		if t == "child" then
			self.c:draw(mode)
		end
	end
	
	function obj:setImage(url)
		local x, y = self.b:getPosition()
		self.image = {}
		self.image.data = love.graphics.newImage(url)
		self.image.x = x - self.image.data:getWidth()/2
		self.image.y = y - self.image.data:getHeight()/2
		function self:drawShape()
			love.graphics.draw(self.image.data, self.image.x, self.image.y)
		end
	end
	
	function obj:setText(text, font)
		if fonts[font] == nil then fonts[font] = love.graphics.newFont(font) end
		self.text = {}
		self.text.data = love.graphics.newText(fonts[font], "lol")
		self.text.data:setf(text, self.info.shape[1], "left")
		self.text.w = self.text.data:getWidth()
		self.text.h = self.text.data:getHeight()
	end
	
	function obj:setVisible(visible)
		self.visible = visible
	end
	
	function obj:setColor(color)
		self.color = color
	end
	
	obj:init()
	
	setmetatable(obj, {__index = self})
	
	return obj
end

return Obj