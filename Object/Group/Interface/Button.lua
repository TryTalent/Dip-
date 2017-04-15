local ButtonGroup = {}

local Button = {
		require("Object/Data/Menu/Button/Show"),
		require("Object/Data/Menu/Button/Restart"),
		require("Object/Data/Menu/Button/Info/Info"),
		require("Object/Data/Menu/Button/Continue"),
		}
		
function ButtonGroup:new(world)
	local button = Group:new({update = true, press = true})
	
	function button:init()
		for i = 1, #Button do
			self:add(Button[i]:new(world))
		end
	end
	
	button:init()
	
	setmetatable(button, {__index = self})
	
	return button
end

setmetatable(ButtonGroup, {__index = Group})

return ButtonGroup