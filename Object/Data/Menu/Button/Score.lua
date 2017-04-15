local Score = {}

local image = "Images/menu_score.png"
local textColor = {204,  51,  51}

function Score:new(world, x, y)
	local score = Obj:new({world, x, y}, {BUTTON_WIDTH, BUTTON_WIDTH})
	
	function score:init()
		self:setImage(image)
	end
	
	score:init()
	
	setmetatable(score, {__index = self})
	
	return score
end

function Score:onDraw(mode)
	if mode == "text" then
		love.graphics.setColor(textColor)
	end
end

setmetatable(Score, {__index = Obj})

return Score