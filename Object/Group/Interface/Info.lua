local InfoGroup = {}

local Info = require("Object/Data/Menu/Button/Info/Text")
		
function InfoGroup:new(world)
	local info = Group:new()
	
	function info:init()
		self:add(Info:new(world))
		self.object[1]:setVisible(false)
	end
	
	function info:onDraw(mode)
		Info:onDraw(mode)
	end
	
	function info:show()
		if self.object[1].visible then
			group.interface.group[4]:setVisible(true)
			group.interface.group[4]:show("best")
			self.object[1]:setVisible(false)
		else
			group.interface.group[4]:setVisible(false)
			self.object[1]:setVisible(true)
			group.interface.group[1]:setHead("ABOUT")
		end
	end
	
	info:init()
	
	setmetatable(info, {__index = self})
	
	return info
end

setmetatable(InfoGroup, {__index = Group})

return InfoGroup