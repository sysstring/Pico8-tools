function collide_objects(obj1,obj2,flag)
--takes two "objects", which must
--contain x,y,w,h,sprt and collide them
--if they have matching flags in
--the chosen direction(from obj1)
	--return face with the facing of the
	--collision from obj1 perspective
	local rtn=0x0
	
			
	--check left collision
			
	--make sure side hitbox
	--doesnt intersect with
	--top or bottom hitbox
	
	if obj2.y<=obj1.y+obj1.h-4
	and obj2.y+obj2.h-1>obj1.y+2 then
	
		
		if obj2.x+obj2.w-1>=obj1.x 
		and obj2.x<=obj1.x then
			if fget(obj1.sprt,flag) and fget(obj2.sprt,flag) then
				
				
				--check left face
				 dbgcll=8
				 --bit 0 = left
				 rtn=rtn|0x1
				 printh("left checked, rtn is: "..rtn)
				 --return rtn
				
				
				
			end--flag check
		end--x check
	end--y check
			
	--check right collision
	
	--make sure side hitbox
	--doesnt intersect with
	--top or bottom hitbox
	
	if obj2.y<=obj1.y+obj1.h-4
	and obj2.y+obj2.h-1>obj1.y+2 then
	
		
		if obj2.x<obj1.x+obj1.w 
		and obj2.x+obj2.w>obj1.x then
			if fget(obj1.sprt,flag) and fget(obj2.sprt,flag) then
				
				--if obj1.x+obj1.w>=obj2.x then
				--check right face
				 dbgclr=8
				 --bit 1 = right
				 rtn=rtn|0x2
				 printh("right checked, rtn is: "..rtn)
				 --return rtn
				--end					
				
				
			end--flag check
		end--x check
	end--y check
	


	
	
	--check up collision

	if obj2.y+obj2.h-1>=obj1.y
	and obj2.y<=obj1.y then

		if obj2.x<obj1.x+obj1.w 
		and obj2.x+obj2.w>obj1.x then
			
			if fget(obj1.sprt,flag) and fget(obj2.sprt,flag) then
				--if obj1.y>=obj2.y+obj2.h-1 then
				--check top face
					dbgclu=8
					--bit 2 = down  
					rtn=rtn|0x4
					printh("up checked, rtn is: "..rtn)
					--return rtn
				--end

				--printh("collided")
				--return rtn
				
			end--flag check
		end--x check
	end--y check
	
	
	--check bot collision
	if obj2.y<=obj1.y+obj1.h-1
	and obj2.y+obj2.h>obj1.y+obj1.h then

		if obj2.x<obj1.x+obj1.w 
		and obj2.x+obj2.w>obj1.x then
			if fget(obj1.sprt,flag) and fget(obj2.sprt,flag) then
				
				--if obj1.y+obj1.h>=obj2.y then
				--check bot face
					dbgcld=8
					--bit 3 = down  
					rtn=rtn|0x8
				 printh("down checked, rtn is: "..rtn)
					--return rtn
				--end

				--return rtn
				
			end--flag check
		end--x check
	end--y check

	--printh("returning: "..rtn)
	return rtn	

	
	--printh("no collision")

	--rtn=0x0
	--return rtn
	
end