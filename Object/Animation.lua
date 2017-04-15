local Animation = {}

function Animation:new(obj)
	local anim = {}
	local play = {}
	local stop = {}
	
	function anim:update()
		for k, v in pairs(play) do v() end
	end
	
	function anim:rotate(a)
		play.rotate = function()
			obj.b:setAngle(obj.b:getAngle() + a * math.pi/180)
		end
	end
	
	function anim:resize(a)
		play.resize = function()
			local w = obj.info.shape[1] + a
			obj.info.shape = {w, w}
			obj.s = love.physics.newRectangleShape(w, w)
			if w < 0 then 
				self:stop("resize")
				obj:setVisible(false)
				obj.b:setActive(false)
			end
		end
	end
	
	function anim:recolor(t)
		local n = 1
		local cl = t[n*2-1]
		local s = t[n*2]
		obj:setColor(cl)
		play.recolor = function()
			local count = 0
			local nc = {}
			for i = 1, 3 do
				if math.abs(cl[i] - obj.color[i]) >= s then
					if cl[i] < obj.color[i] then nc[i] = obj.color[i] - s else nc[i] = obj.color[i] + s end
				else
					nc[i] = cl[i]
					count = count + 1
				end
			end
			obj:setColor(nc)
			if count == 3 then
				n = n + 1
				if t[n*2-1] ~= nil then
					cl = t[n*2-1]
					s = t[n*2]
				else
					obj.color = nil
					self:stop("recolor")
				end
			end
		end
	end
	
	function anim:div(n, m, mx, my, resize, sizef, rotatef, speedf, color, borderColor)
		local ox, oy = obj.b:getPosition()
		local ow, oh = obj.info.shape[1], obj.info.shape[2]
		local w = ow/n
		local h = oh/m
		function obj.c:onDraw(mode)
			if mode == "fill" then
				love.graphics.setColor(color)
			elseif mode == "line" then
				love.graphics.setColor(borderColor)
			end
		end
		for i = 0, n - 1 do
			for j = 0, m - 1 do
				local x, y = ox - ow/2 + j * w + w/2, oy - oh/2 + i * h + h/2
				local rnd1 = love.math.random(-4, 2)
				local tw, th = w - sizef*rnd1, h - sizef*rnd1
				if tw < 1 then tw = 1 end
				if th < 1 then th = 1 end
				obj.c:add(Obj:new({world, x, y, "dynamic"}, {tw, th}))
				local id = #obj.c.object
				local t = obj.c.object[id]
				t.f:setCategory(1)
				t.f:setMask(1)
				t.b:setAngle(rotatef * rnd1 * (math.pi/180))
				t.b:setGravityScale(0)
				t.b:applyLinearImpulse((x - mx) * speedf, (y - my) * speedf)
				t.a:resize(resize)
				function t:onUpdate()
					if self.info.shape[1] < 0 then
						self.b:destroy()
					end
				end
			end
		end
	end
	
	function anim:stop(name)
		stop[name] = play[name]
		play[name] = nil
	end
	
	function anim:play(name)
		play[name] = stop[name]
	end
	
	setmetatable(anim, {__index = self})
	
	return anim
end

return Animation