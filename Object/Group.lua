local Group = {}

function Group:new(event, mode)
	local group = {}
	
	function group:init()
		self.visible = true
		self.mode = mode or "all"
		self.object = {}
		self.group = {}
		self.event = event or {update = false, press = false}
	end
	
	function group:draw(mode, t)
		if self.visible then
			if self.onDraw ~= nil then self:onDraw(mode) end
			if self.mode ~= "group" then
				for i = 1, #self.object do
					self.object[i]:draw(mode, t)
				end
			end
			if self.mode ~= "object" then
				for i = 1, #self.group do
					self.group[i]:draw(mode, t)
				end
			end
		end
	end
	
	function group:update(dt)
		if self.event.update then
			if self.onUpdate ~= nil then self:onUpdate(mode) end
			for i = 1, #self.object do
				if self.mode ~= "group" then
					if self.object[i] ~= nil then
						self.object[i]:update(dt)
						if self.object[i].b:isDestroyed() then
							table.remove(self.object, i)
						end
					end
				end
			end
			if self.mode ~= "object" then
				for i = 1, #self.group do
					self.group[i]:update(dt)
				end
			end
		end
	end
	
	function group:add(t)
		self.object[#self.object+1] = t
	end
	
	function group:addGroup(t)
		self.group[#self.group+1] = t
	end
	
	function group:setVisible(visible)
		self.visible = visible
	end
	
	function group:setMode(mode)
		self.mode = mode
	end
	
	function group:setPressTimer(timer)
		self.pressTimer = timer
		for i = 1, #self.group do
			self.group[i]:setPressTimer(timer)
		end
	end
	
	local timer
	
	function group:onPress(x, y, stop)
		if timer == nil then 
			if self.event.press then
				if self.visible then
					for i = 1, #self.object do
						if self.object[i].visible and not self.object[i].f:isDestroyed() then
							if self.object[i].f:testPoint(x, y) then
								self.object[i]:onPress(x, y)
								if self.pressTimer ~= nil then timer = love.timer.getTime() end
								if stop then return end
							end
						end
					end
					for i = 1, #self.group do
						self.group[i]:onPress(x, y, stop)
					end
				end
			end
		elseif love.timer.getTime() - timer > self.pressTimer then
			timer = nil
		end
	end
	
	group:init()
	
	setmetatable(group, {__index = self})
	
	return group
end

return Group