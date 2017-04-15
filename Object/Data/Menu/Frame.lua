local MenuFrame = {}

local x, y = W/2, H/2 - 10
local w, h = 1, 1
local image = "Images/menu_frame.png"

function MenuFrame:new(world)
	local mf = Obj:new({world, x, y}, {w, h})
	
	function mf:init()
		self:setImage(image)
	end
	
	function mf:onPress()
		data.pause()
	end
	
	mf:init()
	
	setmetatable(mf, {__index = self})
	
	return mf
end

setmetatable(MenuFrame, {__index = Obj})

return MenuFrame