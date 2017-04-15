local Info = {}

local x, y = W/2 - 75,H/2 + 45
local image = "Images/menu_info.png"

function Info:new(world)
	local info = Obj:new({world, x, y}, {BUTTON_WIDTH, BUTTON_WIDTH})
	
	function info:init()
		self:setImage(image)
	end
	
	function info:onPress()
		group.interface.group[5]:show()
	end
	
	info:init()
	
	setmetatable(info, {__index = self})
	
	return info
end

return Info