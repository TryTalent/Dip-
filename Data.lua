local data = {}

data.state = "load"
data.tk = 1
data.ts = 2
data.dk = 1
local playerWidthDiv2
local translateBorder

function data.load()
	data.state = "load"
	data.tk = 1
	data.ts = 2
	data.dk = 1
	playerWidthDiv2 = group.player.object[1].info.shape[1]
	translateBorder = H - H/3.5
end

function data.update()
	local px, py = group.player.object[1].b:getPosition()
	if group.edge.object[4] ~= nil then 
		local lx, ly = group.edge.object[4].b:getPosition()
		if py > ly then
			group.interface.group[4].travel.now = group.interface.group[4].travel.now + 1
			data.ts = data.ts + 0.001
			data.dk = data.dk + 0.001
			group.edge.object[4].b:destroy()
			table.remove(group.edge.object, 4)
		end
	end
	if py > translateBorder then 
		if data.tk < 2 then data.tk = data.tk + 0.015 else data.tk = 2 end
	else
		if data.tk > 1 then data.tk = data.tk - 0.015 else data.tk = 1 end
	end
	if py + playerWidthDiv2 < 0 then data.stop() end
end

function data.start()
	if data.state == "load" then 
		data.state = "play" 
		group.player:show(love.mouse.getPosition())
	end
end

function data.stop()
	data.state = "stop"
	group.interface.group[4]:reset()
	group.interface:show()
end

function data.pause()
	data.state = "pause"
	group.interface:show()
end

function data.continue()
	if data.state == "pause" then
		data.state = "play"
		group.interface:hide()
	end
end

function data.restart()
	data.state = "load"
	group.interface.group[4]:reset(true)
	love.load()
end

function data.newMapData(a)
	local t = {{}}
	for i = 0, a do
		local n = love.math.random(1, #Map.layers)
		for j = 1, #Map.layers[n].data do
			table.insert(t[#t], Map.layers[n].data[j])
			if #t[#t] == Map.width then t[#t + 1] = {} end
		end
	end
	return t
end

return data