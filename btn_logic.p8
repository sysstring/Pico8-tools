--button logic for one frame btnp and btnr
--joel stenlund
--please note that button table is 1 indexed

function btn_init()
	btns={}
	for i=1,6 do
		add(btns,{
			id=i-1,
			bs=nil,
			ps=nil,
			jp=nil,
			jr=nil,
			upd=function(self)
				self.ps=self.bs
				self.bs=btn(self.id)
				self.jp=self.bs and not self.ps
				self.jr=(not self.bs) and self.ps
				return self.jp
			end		
		},i)
	end--for
end


--[[
	run to collect inputs
	for b in all(btns) do
		b:upd()
	end
]]--
