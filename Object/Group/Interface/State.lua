local StateGroup = {}

local x, y = W/2, H/4
local image = {
		"Images/pause.png",
		"Images/try_again.png"
		}

function StateGroup:new(world)
	local sg = Group:new()
	
	function sg:init()
		for i = 1, #image do
			self:add(Obj:new({world, x, y}, {1, 1}))
			self.object[i]:setImage(image[i])
		end
	end
	
	function sg:show()
		if Data.state == "pause" then
			self.object[1]:setVisible(true)
			self.object[2]:setVisible(false)
		else
			self.object[1]:setVisible(false)
			self.object[2]:setVisible(true)
		end
	end
	
	sg:init()
	
	setmetatable(sg, {__index = self})
	
	return sg
end

setmetatable(StateGroup, {__index = Group})

return StateGroup