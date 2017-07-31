reinforce_dream_of_the_book_of_darkness_lua = class ({})
LinkLuaModifier("reinforce_modifier_dream_of_the_book_of_darkness_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("reinforce_modifier_dream_of_the_book_of_darkness_2_lua", LUA_MODIFIER_MOTION_NONE)

function reinforce_dream_of_the_book_of_darkness_lua:OnSpellStart()
	local c = self:GetCaster()
	local duration = self:GetChannelTime()

	c:AddNewModifier(c, self, "reinforce_modifier_dream_of_the_book_of_darkness_lua", {duration = duration})

	local target = self:GetCursorTarget()
	local dream_time = self:GetSpecialValueFor("dream_time")


	--target:AddNewModifier(c, self, "reinforce_modifier_dream_of_the_book_of_darkness_2_lua", {duration = dream_time})
end

function reinforce_dream_of_the_book_of_darkness_lua:OnChannelFinish(value)
	print("XYI")
	local target = self:GetCursorTarget()
	local modifier = target:FindModifierByName("reinforce_modifier_dream_of_the_book_of_darkness_2_lua")
	if value == true and modifier ~= nil then 
		modifier:Destroy()
	end
end
