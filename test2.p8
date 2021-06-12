pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
--varialbes

function _init()
	player = {
		sprite = 3,
		x = 64,
		y = 64,
		w = 8,
		h = 8,
		flipped = false,
		dx = 0;
		dy = 0,
		max_dx = 3;
		max_dy = 3;
		acc = 1.5;
		jump = 4;
		animation_step = 0;
		running = false,
		jumping = false,
		falling = false,
		sliding = false,
		landing = false	
	}
	
	gravity = 0.3
	friction = 0.4
end




-->8
--update and draw
function _update()
	player_update()
	player_animate()
end

function _draw()
	cls()
	map(0,0)
	spr(player.sprite,player.x,player.y,1,1,player.flipped)
end
-->8
--collisions

function collide_map(obj,aim,flag)
	--obj = table needs x,y,w,h
	--aim = left,right,up,down
	
	local x=obj.x
	local y=obj.y
	local w=obj.w
	local h=obj.h
	
	local x1=0
	local x2=0
	local y1=0
	local y2=0
	
	if aim == "left" then
		x1=x-1
		x2=x
		y1=y
		y2=y+h-1
	
	elseif aim == "right" then
		x1=x+w
		x2=x+w+1
		y1=y
		y2=y+h-1
	
	elseif aim == "up" then
		x1=x+1
		x2=x+w-1
		y1=y-1
		y2=y
	
	elseif aim == "down" then
		x1=x
		x2=x+w
		y1=y+h
		y2=y+h
	end
	
	--pixels to tiles
	x1/=8
	x2/=8
	y1/=8
	y2/=8
		
	if fget(mget(x1, y1), flag)
	or fget(mget(x1, y2), flag)
	or fget(mget(x2, y1), flag)
	or fget(mget(x2, y2), flag) then
		return true
	else
		return false
	end
	
end
-->8
--player functions

function player_update()
	--physics
	player.dy += gravity
	player.dx *= friction
	
	--controls
	if (btn(⬅️)) then
		player.dx-=player.acc
		player.running = true
		player.flipped = true
	end
	if (btn(➡️)) then
		player.dx+=player.acc
		player.running = true
		player.flipped = false
	end
	
	--check if sliding
	if player.running
	and not btn(⬅️) 
	and not btn(➡️)
	and not player.falling
	and not player.jumping then
		player.running=false
		player.sliding=true
	end
	
	--jump
	
	if btn(⬆️)
	and player.landed then
		player.dy-=player.jump
		player.landed=false
	end
	
	--if (btn(⬇️)) y+=1	
	
	--check collision up and down
	if player.dy > 0 then
		player.falling = true
		player.landed = false
		player.jumping = false
		
		player.dy = limit_speed(player.dy, player.max_dy)
		
		if collide_map(player, "down", 0) then -- flag 0 = can't pass through down
			player.landed = true
			player.falling = false
			player.dy = 0
			player.y -= (player.y + player.h)%8
		end
	
	elseif player.dy < 0 then
		player.jumping = true
		if collide_map(player, "up", 1) then -- flag 1 = can't pass through up
			player.dy = 0
			--player.y -= (player.y + player.h)%8???
		end
	end
	
	--check horizontal collision
	if player.dx < 0 then
	
			player.dx = limit_speed(player.dx, player.max_dx)
	
		if collide_map(player, "left", 1) then
			player.dx = 0
			
		end
	elseif player.dx > 0 then
	
		player.dx = limit_speed(player.dx, player.max_dx)

		if collide_map(player, "right", 1) then
			player.dx = 0
		end
	end
	
	-- stop sliding
	if player.sliding then
		if abs(player.dx) < .2
		or playerrunnung then
			player.dx = 0
			player.sliding = false
		end
	end	
	
	player.x += player.dx
	player.y += player.dy
	
end

function player_animate()
	if player.jumping then
		player.sprite = 11
	elseif player.falling then
		player.sprite = 12
	elseif player.sliding then
		player.sprite = 13
	elseif player.running then
		if time() - player.animation_step>.1 then
			player.animation_step = time()
			player.sprite += 1
			if player.sprite > 10 then
				player.sprite = 5
			end
		end
	else --idle
		if time() - player.animation_step>.3 then
			player.animation_step = time()
			player.sprite += 1
			if player.sprite > 4 then
				player.sprite = 3
			end
		end
	end	
end

function limit_speed(num, maximum)
	return mid(-maximum, num, maximum)
end
__gfx__
00444440004444400044444000444440004444400004444409044444900444440004444490044444090444440004444490444440944444000000000000000000
00ccccc000ccccc000aa999000aa999000aa9990009aa999909aa999099aa999009aa999099aa999909aa999009aa99909aa99909aa999000000000000000000
0cf72f200cf72f2009f72f2009f72f2009f72f20990f72f2000f72f2000f72f2990f72f2000f72f2000f72f2090f72f200f72f200f72f2000000000000000000
0cfffff00cfffff009fffff009fffff009fffff0000fffff000fffff000fffff000fffff000fffff000fffff900fffff00fffff00fffff000000000000000000
000cc00000cccc00f009a00f0009a0000099aa0000999a0000999a0000aa900000aa990000aa990000999a0000999a0000999a000999aaf00000000000000000
00cccc000f0cc0f00ccbbca0009bba000f0bb0f00f0bb0f00f0bb0f00f0bb9f00f0bb0f00f0bb0f00f0bb0f00f0bb0f00f0bb0f0f00bb0000000000000000000
0f0cc0f0000cc000000bc0a00f0b90f0000b90000aab900000ab90000099a000099ba0000099a00000ab9000000b9000000b9000000bb9900000000000000000
00c00c0000c00c0090c00c0a00a0090000a0090000000900000090000000a00000000a000000a0000000900000a900000000a90000000aa90000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
556555d5556555d5556555d5556555d5555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
56555d5556555d5556555d5556555d55555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6555d5556555d5556555d5555555d555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5555555555555d555655555555555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555555555555555555555555550000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd000000000000000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd000000000000000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd000000000000000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd000000000000000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd000000000000000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd000000000000000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd0000000000dd000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd0000000000dd000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd0000000000dd000000d2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd0000000000dd000000d2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd0000000000dd000000d2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd0000000000dd000000d2000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd0000000000dd000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0dd0000000000dd000000dd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030303030300000000000000000000000101010000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040404040404040404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040406061616240404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040407040407240404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4040407040407140404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4060616240606162404040404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4070407140704072405352404040404000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5051535051525352505454525051505200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5454545454545454545454545454545400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5454545454545454545454545454545400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
011300001c1501d1001d1501a1001c1501a1501815000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
__music__
00 01424344

