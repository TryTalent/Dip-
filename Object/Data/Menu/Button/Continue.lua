local Continue = {}

local x, y = W/2 + 75, H/2 + 45	
local image = "Images/menu_continue.png"

function Continue:new(world)
	local continue = Obj:new({world, x, y}, {BUTTON_WIDTH, BUTTON_WIDTH})
	
	function continue:init()
		self:setImage(image)
	end
	
	function continue:onPress()
		Data.continue()
	end
	
	continue:init()
	
	setmetatable(continue, {__index = self})
	
	return continue
end

return Continue