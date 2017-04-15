local Restart = {}

local x, y = W/2, H/2 + 45	
local image = "Images/menu_restart.png"

function Restart:new(world)
	local restart = Obj:new({world, x, y}, {BUTTON_WIDTH, BUTTON_WIDTH})
	
	function restart:init()
		self:setImage(image)
	end
	
	function restart:onPress()
		Data.restart()
	end
	
	restart:init()
	
	setmetatable(restart, {__index = self})
	
	return restart
end

return Restart