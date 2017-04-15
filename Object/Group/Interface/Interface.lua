local InterfaceGroup = {}

local StateGroup = require("Object/Group/Interface/State")
local ScoreGroup = require("Object/Group/Interface/Score")
local ButtonGroup = require("Object/Group/Interface/Button")
local InfoGroup = require("Object/Group/Interface/Info")
local FrameGroup = require("Object/Group/Interface/Frame")

local _world = love.physics.newWorld(0, 0, false)
local PRESS_TIMER = 0.1

function InterfaceGroup:new()
	local ig = Group:new({update = true, press = true}, "group")
	
	function ig:init()
		self.group[1] = FrameGroup:new(_world)
		self.group[2] = ButtonGroup:new(_world)
		self.group[3] = StateGroup:new(_world)
		self.group[4] = ScoreGroup:new(_world)
		self.group[5] = InfoGroup:new(_world)
		self:setPressTimer(PRESS_TIMER)
	end
	
	function ig:onDraw()
		love.graphics.setColor(255, 255, 255, 255)
	end
	
	function ig:show()
		for i = 1, 4 do
			for j = 1, #self.group[i].object do
				self.group[i].object[j]:setVisible(true)
			end
			self.group[i]:setVisible(true)
		end
		self.group[2].object[1]:setVisible(false)
		self.group[3]:show()
		self.group[4]:show("best")
	end
	
	function ig:hide()
		for i = 1, #self.group do
			for j = 1, #self.group[i].object do
				self.group[i].object[j]:setVisible(false)
			end
		end
		self.group[2].object[1]:setVisible(true)
		self.group[4]:show("best")
	end
	
	ig:init()
	
	setmetatable(self, {__index = self})
	
	return ig
end

setmetatable(InterfaceGroup, {__index = Group})

return InterfaceGroup