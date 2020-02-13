local MenuScene = {}
function MenuScene.new()
	local self = {}
	function self:enter()
	end
	function self:exit()
	end
	function self:update()
		if btn(0) then
			self:exit()
			current_scene = crud_scene
			crud_scene:enter()
		end
	end
	function self:draw()
		cls(0)
		print("tim jumps")
	end
	return self
end

return MenuScene