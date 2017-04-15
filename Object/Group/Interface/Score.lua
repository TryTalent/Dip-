local ScoreGroup = {}

local Score = require("Object/Data/Menu/Button/Score")

function ScoreGroup:new(world)
	local sg = Group:new({update = true, press = true})
	
	function sg:init()
		self.state = "best"
		self.travel = {now = 0, best = 0}
		for i = 0, 2 do
			self:add(Score:new(world, W/2 - 85 + 85 * i, H/2 - 40))
			local evt = self.object[#self.object]
			function evt:onPress() sg:show(self.state) end
		end
		if love.filesystem.exists("score.txt") then
			local f = love.filesystem.newFile("score.txt", "r")
			self.travel.best = f:read()
		end
	end
	
	function sg:onDraw(mode)
		Score:onDraw(mode)
	end
	
	function sg:reset(b)
		if self.travel.now > tonumber(self.travel.best) then
			self.travel.best = self.travel.now
			love.filesystem.remove("score.txt")
			love.filesystem.append("score.txt", self.travel.best)
		end
		if b then self.travel.now = 0 end
	end
	
	function sg:show(state)
		local travel = self.travel[state] or self.travel[self.state]
		self.object[3]:setText(travel%10, 32)
		self.object[2]:setText(math.floor(travel/10)%10, 32)
		self.object[1]:setText(math.floor(travel/100)%10, 32)
		group.interface.group[1]:setHead(state or self.state)
		if self.state == "best" then self.state = "now" else self.state = "best" end
	end
	
	sg:init()
	
	setmetatable(sg, {__index = self})
	
	return sg
end

setmetatable(ScoreGroup, {__index = Group})

return ScoreGroup