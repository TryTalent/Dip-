local Show = {}

local x, y = W - 70, 70
local image = "Images/menu_show.png"

function Show:new(world)
	local show = Obj:new({world, x, y}, {BUTTON_WIDTH, BUTTON_WIDTH})
	
	function show:init()
		self:setImage(image)
	end
	
	function show:onPress()
		Data.pause()
	end
	
	show:init()
	
	setmetatable(show, {__index = self})
	
	return show
end

return Show