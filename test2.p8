pico-8 cartridge // http://www.pico-8.com
version 32
__lua__
--varialbes

function _init()
	plyr = {
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
	
	obj2 = {
		sprite = 1,
		x = 140,
		y = 40,
		w = 8,
		h = 8,
		flipped = false
	}
	
	gravity = 0.3
	friction = 0.4
	
	cam_x = 0
	
	display_height = 128
	display_width = 128
	
	map_start = 0
	map_end = 1024
	
	bullets = {}
end





--bullet init
bulletconstruct = function(x, y)
  local obj = {}
  --an array containing x and y position
  obj.position = {x=x, y=y}

  --the sprite number used to draw the bullet
  obj.sprite = 17

  --define an update function that will be called by the program
  obj.update = function(this)
    --move the bullet to the right
    this.position.y -= 1
  end

  --return the bullet
  return obj
end

-->8
--update and draw
function _update()
	plyr_update()
	plyr_animate()
	
	simple_camera()
	
	plyr_shoot()

	foreach(bullets, function(obj)
 	obj.update(obj)
 end)
 
 
 

end

function _draw()
	cls()
	map(0,0)
	spr(plyr.sprite,plyr.x,plyr.y,1,1,plyr.flipped)

	foreach(bullets, function(obj)
 	spr(obj.sprite, obj.position.x, obj.position.y)
 end)
 
 spr(obj2.sprite,obj2.x,obj2.y,1,1,obj2.flipped)
 
 --print('press z to shoot', 60, 110, 0) 
	if collide_object(plyr, obj2) then
		print('collision!', 60, 110, 0)
	end
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

function collide_object(obj,dest)
	local x1=obj.x
	local y1=obj.y
	local w1=obj.w
	local h1=obj.h
	
	local x2=dest.x
	local y2=dest.y
	local w2=dest.w
	local h2=dest.h
	
	-- case 1
	if x1 < x2 and x2 < x1 + w1
	and y1 < y2 and y2 < y1 + h1 then
		return true
	-- case 2
	elseif x1 < x2 and x2 < x1 + w1
	and y1 < y2 + h2 and y2 + h2 < y1 + h1 then
		return true
	-- case 3
	elseif x1 < x2 + w2 and x2 + w2 < x1 + w1
	and y1 < y2 and y2 < y1 + h1 then
		return true
	-- case 4
	elseif x1 < x2 + w2 and x2 + w2 < x1 + w1
	and y1 < y2 + h2 and y2 + h2 < y1 + h1 then
		return true
	else
		return false
	end
		 
end
-->8
--player functions

function plyr_update()
	--physics
	plyr.dy += gravity
	plyr.dx *= friction
	
	--controls
	if (btn(⬅️)) then
		plyr.dx-=plyr.acc
		plyr.running = true
		plyr.flipped = true
	end
	if (btn(➡️)) then
		plyr.dx+=plyr.acc
		plyr.running = true
		plyr.flipped = false
	end
	
	--check if sliding
	if plyr.running
	and not btn(⬅️) 
	and not btn(➡️)
	and not plyr.falling
	and not plyr.jumping then
		plyr.running=false
		plyr.sliding=true
	end
	
	--jump
	
	if btn(⬆️)
	and plyr.landed then
		plyr.dy-=plyr.jump
		plyr.landed=false
	end
	
	--if (btn(⬇️)) y+=1	
	
	--check collision up and down
	if plyr.dy > 0 then
		plyr.falling = true
		plyr.landed = false
		plyr.jumping = false
		
		plyr.dy = limit_speed(plyr.dy, plyr.max_dy)
		
		if collide_map(plyr, "down", 0) then -- flag 0 = can't pass through down
			plyr.landed = true
			plyr.falling = false
			plyr.dy = 0
			plyr.y -= (plyr.y + plyr.h)%8
		end
	
	elseif plyr.dy < 0 then
		plyr.jumping = true
		if collide_map(plyr, "up", 1) then -- flag 1 = can't pass through up
			plyr.dy = 0
			--plyr.y -= (plyr.y + plyr.h)%8???
		end
	end
	
	--check horizontal collision
	if plyr.dx < 0 then
	
			plyr.dx = limit_speed(plyr.dx, plyr.max_dx)
	
		if collide_map(plyr, "left", 1) then
			plyr.dx = 0
			
		end
	elseif plyr.dx > 0 then
	
		plyr.dx = limit_speed(plyr.dx, plyr.max_dx)

		if collide_map(plyr, "right", 1) then
			plyr.dx = 0
		end
	end
	
	-- stop sliding
	if plyr.sliding then
		if abs(plyr.dx) < .2
		or plyrrunnung then
			plyr.dx = 0
			plyr.sliding = false
		end
	end	
	
	plyr.x += plyr.dx
	plyr.y += plyr.dy
	
	-- limit player to map
	if plyr.x < map_start then
		plyr.x = map_start
	elseif plyr.x > map_end - plyr.w then
		plyr.x = map_end - plyr.h
	end
end

function plyr_animate()
	if plyr.jumping then
		plyr.sprite = 11
	elseif plyr.falling then
		plyr.sprite = 12
	elseif plyr.sliding then
		plyr.sprite = 13
	elseif plyr.running then
		if time() - plyr.animation_step>.1 then
			plyr.animation_step = time()
			plyr.sprite += 1
			if plyr.sprite > 10 then
				plyr.sprite = 5
			end
		end
	else --idle
		if time() - plyr.animation_step>.3 then
			plyr.animation_step = time()
			plyr.sprite += 1
			if plyr.sprite > 4 then
				plyr.sprite = 3
			end
		end
	end	
end

function limit_speed(num, maximum)
	return mid(-maximum, num, maximum)
end
-->8
--shooting functions (press z)

function plyr_shoot()
  if btnp(4, 0) then
    sfx(01)

    rx = plyr.x
    lx = plyr.x

    ry = plyr.y - 5
    ly = plyr.y - 5

    add(bullets, bulletconstruct(rx, ry))
    add(bullets, bulletconstruct(lx, ly))
  end
end




-->8
--camera functions

function simple_camera()
	-- have the camera follow the player
	cam_x = plyr.x - display_width/2 + plyr.w/2
	if cam_x < map_start then
		cam_x = map_start
	end
	if cam_x > map_end - display_width then
		cam_x = map_end - display_width
	end
	camera(cam_x, 0)
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
00006700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00667770000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06758670002860000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
06857570002880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00565800000200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00050000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
00000000000000000000000000000000224444440000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000050000000000000000000042442244000000000000000000000000000d0d0000000000000000000000000000000000000000000000000000000000
000000000006000000050000000000004444242400000000000000000000000000d0ddd0d0d00000000000000000000000000000000000000000000000000000
0000000000575000005750000000000044224444000000000000000000000000000dd8dd0d000000000000000000000000000000000000000000000000000000
00000000567776500005000000050000424244440000000000000000000000000000dd8dd000d000000000000000000000000000000000000000000000000000
0000000000575000000000000000000042442244000000000000000000000000000dd888d80d0000000000000000000000000000000000000000000000000000
000000000006000000000000000000004444442400000000000000000000000000d0dd8688d0d000000000000000000000000000000000000000000000000000
000000000005000000000000000000004444444400000000000000000000000000000dd8688d0000000000000000000000000000000000000000000000000000
00003bb3030b000b30300b0b03300000444444444444424433b33b33000000000000dd8d8668d0d0000000000000000000000000000000000000000000000000
00333bb3bbbb33b3b333b33b323300004424424424244444b33bb3b30000000000000dd8d868880d000000000000000000000000000000000000000000000000
033b2b2bb322333b2322bb3bb223330044244444424444443bbb22bb00000000000000dddd8686800d0000000000000000000000000000000000000000000000
003b224234444444b22222222b2bb3304224442444442224b2444222000000000000000d0dd868dd0d0000000000000000000000000000000000000000000000
003b244444424444222444242222b3304422244444422444222444440000000000000000d0dd8d88d0d000000000000000000000000000000000000000000000
03bb444444444244444444444442b3004244224242244244444442440000000000000000000ddd0d0d0000000000000000000000000000000000000000000000
0bb2444424422224442442444222b30042444244424444424242444400000000000000000000d0d0000000000000000000000000000000000000000000000000
33b24444444444444444444442222333444444444244444244444424000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666602422222222222224244422000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666600224422224422222222224000000000000000000000000000000000000000000000000000000000000000000000000000000000
000dbf30000000000003bff000400000400004404002000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000330000000000000fbb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00fbd00000000000003bd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003bf0000000000000bdd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000f300000000000003f300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000db00000000000000d3b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d3b00000dd300000d3300d6d688888886d6d60000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003fb000000fbb00003fb0006d6d6666666d6d660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0003f000000bf00000fdb00000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000db300003fd000003bd00000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d3f00003bd00000033b0000000006000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000fb000000fd000000dd330000000d6600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003d3b000003f00000333f0000000068600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bbdd3b0003fd00003bbfb3000000066d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555555555555666666666666666666666655555555555555555566666666666666566666666666666655666666600000000000000000000000000000000
566f6675666f6676566f667666666666666f6675566f6676666f6675566666666666666566666666666666666666666600000000000000000000000000000000
56f6676566f6676656f667666666666666f6676556f6676666f66765566666666666666566666666666666666666666600000000000000000000000000000000
5f6676656f6676665f667666666666666f6676655f6676666f667665566666666666666566666666666666666666666600000000000000000000000000000000
56666665666666665666666666666666666666655666666666666665566666666666666566666666666666666666666600000000000000000000000000000000
56666665666666665666666666666666666666655666666666666665566666666666666566666666666666666666666600000000000000000000000000000000
56666665666666665666666666666666666666655666666666666665566666666666666566666666666666666666666600000000000000000000000000000000
55555555666666665666666655555555666666655666666666666665555555555555555566666666666666666666666600000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
66666666666666666666666600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000dbf3000000000000d500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0003300000000000000d500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00fbd000000000000005d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003bf000000000000005d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000f300000000000000dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000db00000000000000dd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d3b00000dd300000d330000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003fb000000fbb00003fb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0003f000000bf00000fdb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000db300003fd000003bd00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000d3f00003bd00000033b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000fb000000fd000000dd33000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
003d3b000003f00000333f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0bbdd3b0003fd00003bbfb3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030000000000000000000000030303030303030000000000000000000101010000000000000000000000000000000001010000000000000000000000
0303030303030303030303030000000000000000000000000000000000000000010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4040404340404040404040404040404040404043404040404040404040404040404040434040404040404040404040404040404340404040404040404040404040404043404040404040404040404040404040434040404040404040404040404040404340404040404040404040404040404043404040404040404040404040
4040404043404041424040404043414040404040434040414240404040434140404040404340404142404040404341404040404043404041424040404043414040404040434040414240404040434140404040404340404142404040404341404040404043404041424040404043414040404040434040414240404040434140
4042434040404040404040434040404040424340404040404040404340404040404243404040404040404043404040404042434040404040404040434040404040424340404040404040404340404040404243404040404040404043404040404042434040404040404040434040404040424340404040404040404340404040
4140404048494043404041404040434041404040484940434040414040404340414040404849404340404140404043404140404048494043404041404040434041404040484940434040414040404340414040404849404340404140404043404140404048494043404041404040434041404040484940434040414040404340
4040404058595a4043404040404042404040404058595a4043404040404042404040404058595a4043404040404042404040404058595a4043404040404042404040404058595a4043404040404042404040404058595a4043404040404042404040404058595a4043404040404042404040404058595a404340404040404240
4040434040404040404040404040404040404340404040404040404040404040404043404040404040404040404040404040434040404040404040404040404040404340404040404040404040404040404043404040404040404040404040404040434040404040404040404040404040404340404040404040404040404040
404040404040404040a340104040404040404040404040404040401040404040404040404040404040404010404040404040404040404040404040104040404040404040404040404040401040404040404040404040404040404010404040404040404040404040404040104040404040404040404040404040401040404040
40404040404040404040404040404040404040404040404040a3404040404040404040404040404040a3404040404040404040404040404040a3404040404040404040404040404040a3404040404040404040404040404040a3404040404040404040404040404040a3404040404040404040404040404040a3404040404040
4040607374a1a240404050515340404040406073746162404040505153404040404060737461624040405051534040404040607374616240404050515340404040406073746162404040505153404040404060737461624040405051534040404040607374616240404050515340404040406073746162404040505153404040
4040714040407240404063646540404040407140404072404040636465404040404071404040724040406364654040404040714040407240404063646540404040407140404072404040636465404040404071404040724040406364654040404040714040407240404063646540404040407140404072404040636465404040
4040714040407140404040404040404040407140404071404040404040404040404071404040714040404040404040404040714040407140404040404040404040407140404071404040404040404040404071404040714040404040404040404040714040407140404040404040404040407140404071404040404040404040
4060a1a24060a1a2404040404040404040606162406061624040404040404040406061624060616240404040404040404060616240606162404040404040404040606162406061624040404040404040406061624060616240404040404040404060616240606162404040404040404040606162406061624040404040404040
4070407240724070408586404040404040704072407240704050534040404040407040724072407040505340404040404070407240724070405053404040404040704072407240704050534040404040407040724072407040505340404040404070407240724070405053404040404040704072407240704050534040404040
8181818181818181818b8a818181818651565156515651565254445251515152515651565156515652544452515151525156515651565156525444525151515251565156515651565254445251515152515651565156515652544452515151525156515651565156525444525151515251565156515651565254445251515152
8989898989898989898989898989898454444444445455544444444444445544544444444454555444444444444455445444444444545554444444444444554454444444445455544444444444445544544444444454555444444444444455445444444444545554444444444444554454444444445455544444444444445544
8383838383838383838383838383838464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464646464
__sfx__
011300001c1501d1001d1501a1001c1501a1501815000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100001000010000100
000a000021040160101e0201c05029050360003b0000000000000000000000000000000001b200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__music__
00 01424344

