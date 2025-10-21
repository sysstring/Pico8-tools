pico-8 cartridge // http://www.pico-8.com
version 43
__lua__
-- this library allows the user
-- to copy an arbitrary area of
-- screen space into the sprite sheet

function screen_copy(img_x0, img_y0, img_w, img_h, img_ind)
	--starting address of sprite sheet
	tar_addr = 0x0000
	--starting address of screen space
	screen_offset = 0x6000
	
	--width of the picture to be saved
	--divide by two to account for two pixels per byte
	img_w = flr(img_w/2)
	

	--x at top left corner of picture to be saved
	--divide by two to account for two pixels per byte
	img_x0 = flr(img_x0/2)
	
	--y at top left corner of picture to be saved
	--multiply by length of one row to get the offset 
	--for that y coordinate in the address
	img_y0 *= 0x40
	
	--image index to indicate at what position the picture is saved

	--multiply with the width of the image to space images correctly
	img_ind *= img_w
	
	--loop over 0 to the image height
	for y_inc = 0,img_h do
		--the address to store the current row of the image 
		--starts at 0x0 + the current row * the length of a row 
		tar_addr = 0x40 * y_inc
		
		--test moving saved image to the left in spritesheet
		
		--the source address is constructed from the 
		--screen offset + the x0 and y0 coordinates of the picture
		src_addr = tar_addr + screen_offset+img_x0 + img_y0
		
		--copy to the target address, from the source address, a number of pixels equal to the width of the picture
		--img_ind offsets the saved picture
		memcpy(tar_addr+img_ind, src_addr, img_w)
	end
end

--take 
function address_calc(img_x0, img_y0, img_w, img_h,img_offset)


end --address calc
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
