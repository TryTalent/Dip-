Map = require("Map")
Obj = require("Object/Object")
Group = require("Object/Group")
Data = require("Data")

W, H = love.window.getMode()
MAP_SIZE = 999
BLOCK_WIDTH = W/Map.width
BUTTON_WIDTH = 70

BlockGroup = require("Object/Group/Block")
EdgeGroup = require("Object/Group/Edge")
PlayerGroup = require("Object/Group/Player")
InterfaceGroup = require("Object/Group/Interface/Interface")

love.physics.setMeter(64)
love.graphics.setLineWidth(1)
love.graphics.setBackgroundColor(255, 255, 204)

function love.load()
	world = love.physics.newWorld(0, 20 * 64, true)
	world:setCallbacks(beginContact)
	group = {}
	group.player = PlayerGroup:new(world)
	group.edge = EdgeGroup:new(world)
	group.interface = InterfaceGroup:new()
	group.interface:hide()
	group.block = BlockGroup:new(world)
	Data.load()
end

function love.update(dt)
	local x, y = love.mouse.getPosition()
	local isDown = love.mouse.isDown(1)
	group.interface:update()
	if isDown then group.interface:onPress(x, y, true) end
	if Data.state ~= "play" then return end
	if isDown then group.block:onPress(x, y, true) end
	world:update(dt * Data.dk)
	world:translateOrigin(0, Data.ts * Data.tk)
	group.player:update()
	group.block:update()
	Data.update()
end

function love.draw()
	group.block:draw("fill", "child")
	group.block:draw("fill")
	group.block:draw("line", "child")
	group.block:draw("line")
	group.block.group[4]:draw("text")
	group.player:draw("fill")
	group.player:draw("line")
	group.interface:draw("image")
	group.interface:draw("text")
	-- love.graphics.setColor(0, 0, 0)
	-- local fps = love.timer.getFPS()
	-- local dt = love.timer.getDelta()
	-- local adt = love.timer.getAverageDelta()
	-- local bodys = world:getBodyCount()
	-- love.graphics.print(fps.."\n"..dt.."\n"..adt.."\n"..bodys)
end

function love.mousepressed()
	Data.start()
end