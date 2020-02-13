

local P = {}
function P.new(x,y)
  local eff = {}
		eff.x = x
		eff.y = y
		eff.sprnum = 0
        eff.count = 0
        eff.jumping = false
        function eff:update()
            if eff.jumping then
                self.count = self.count+1
                
                if self.count>10 and self.count<20 then
                self.sprnum = 1
                elseif self.count>20 and self.count<30 then
                self.sprnum = 2
                elseif self.count>30 and self.count<40 then
                self.sprnum = 3
                elseif self.count>40 and self.count<50 then
                self.sprnum = 4
                elseif self.count >50 and self.count<60 then
                self.sprnum = 5
                elseif self.count >60 and self.count<70 then
                self.sprnum = 6
                elseif self.count>70 and self.count<80 then
                self.sprnum = 5
                elseif self.count>80 and self.count<90 then
                self.sprnum = 4
                elseif self.count>90 and self.count<100 then
                self.sprnum = 3
                elseif self.count>100 and self.count<110 then
                self.sprnum = 2
                elseif self.count>110 and self.count<120 then
                self.sprnum = 1
                elseif self.count > 120 and self.count<130 then
                    self.sprnum = 0
                    self.count = 0
                    self.jumping = false
                end
            else
                self.sprnum = 0
                self.count = 0
            end
		end
		function eff:draw()
		  spr(self.sprnum,self.x,self.y)
		end
		return eff
end

local Baddie = {}
function Baddie.new()
    local boo = {}
    boo.x = 250 -- w = 240 so offscreen a bit
    boo.y = math.random(1,136)
    boo.dead = false
    function boo:update()
        if self.dead then return end

        self.x = self.x-1
        if self.x<-8 then
            self.dead = true
        end
    end
    function boo:draw()
        spr(7,self.x,self.y)
    end
    return boo
end

local CrudScene = {}
function CrudScene.new()
    local boo = {}
    boo.player = P.new(100,50)
    boo.count = 0
    boo.bads = {}
    function boo:enter()
        trace("crud scene has started!")
    end
    function boo:exit()
    end
    function boo:update()
        if btn(0) then -- up
            self.player.y = self.player.y-1
        end
        if btn(1) then -- down
            self.player.y = self.player.y+1
        end
        if btn(4) then -- A
            self.player.jumping = true
        end
        self.player:update()
        self.count = self.count + 1
        if self.count == 60 then
            trace("baddie")
            local b = Baddie.new()
            table.insert(self.bads,#self.bads+1,b)
            self.count = 0
        end
        for id,b in pairs(self.bads) do
            b:update()
            if b.dead then
                table.remove(self.bads,id)
            end
        end
    end
    function boo:draw()
        cls(0)
        for id,b in pairs(self.bads) do
            b:draw()
        end

        self.player:draw()

    end
    return boo
end
return CrudScene

-- <TILES>
-- 000:0000000000000000000000000006600000066000000000000000000000000000
-- 001:0000000000000000000000000066660000666600000000000000000000000000
-- 002:0000000000000000006666000066660000666600006666000000000000000000
-- 003:0000000000000000066666600666666006666660066666600000000000000000
-- 004:0000000006666660066666600666666006666660066666600666666000000000
-- 005:0000000066666666666666666666666666666666666666666666666600000000
-- 006:6666666666666666666666666666666666666666666666666666666666666666
-- 017:f8fffffff8888888f888f888f8888ffff8888888f2222222ff000fffefffffef
-- 018:fff800ff88880ffef8880fee88880fee88880fee2222ffee000ffeeeffffeeee
-- 019:f8fffffff8888888f888f888f8888ffff8888888f2222222ff000fffefffffef
-- 020:fff800ff88880ffef8880fee88880fee88880fee2222ffee000ffeeeffffeeee
-- </TILES>

-- <WAVES>
-- 000:00000000ffffffff00000000ffffffff
-- 001:0123456789abcdeffedcba9876543210
-- 002:0123456789abcdef0123456789abcdef
-- </WAVES>

-- <SFX>
-- 000:000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000304000000000
-- </SFX>

-- <PALETTE>
-- 000:140c1c44243430346d4e4a4e854c30346524d04648757161597dced27d2c8595a16daa2cd2aa996dc2cadad45edeeed6
-- </PALETTE>
