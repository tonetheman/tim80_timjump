-- title:  game title
-- author: game developer
-- desc:   short description
-- script: lua

current_scene = nil
menu_scene = nil
game_scene = nil
crud_scene = nil

local MenuScene = require("menu")
local GameScene = require("game")
local CrudScene = require("crud")

function update()
	--[[
			if btn(0) then y=y-1 end
	if btn(1) then y=y+1 end
	if btn(2) then x=x-1 end
	if btn(3) then x=x+1 end

	]]
	current_scene:update()
end

function draw()
	current_scene:draw()
end

function init()
	menu_scene = MenuScene.new()
	current_scene = menu_scene
	game_scene = GameScene.new()
	crud_scene = CrudScene.new()
end

init()
function TIC()
	update()
	draw()
end

-- <TILES>
-- 000:0000000000000000000000000006600000066000000000000000000000000000
-- 001:0000000000000000000000000066660000666600000000000000000000000000
-- 002:0000000000000000006666000066660000666600006666000000000000000000
-- 003:0000000000000000066666600666666006666660066666600000000000000000
-- 004:0000000006666660066666600666666006666660066666600666666000000000
-- 005:0000000066666666666666666666666666666666666666666666666600000000
-- 006:6666666666666666666666666666666666666666666666666666666666666666
-- 007:bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb
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

