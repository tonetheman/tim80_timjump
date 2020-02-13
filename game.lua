local GameScene = {}
function GameScene.new()
	local self = {}
	self.jumping = false
	self.jumpcounter = 0
    function self:enter() 
        trace("game scene enter")
	end
	function self:exit() end
	function self:update()
		if btn(0) then
			if self.jumpcounter == 0 then
				self.jumping = true
			end
		end 

		if self.jumping then
			self.jumpcounter = self.jumpcounter + 1
		end
	end
	function self:draw() 
		cls(1)
		spr(1,50,50)
	end
	return self
end

return GameScene
