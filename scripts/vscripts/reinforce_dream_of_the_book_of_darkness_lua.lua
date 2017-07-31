reinforce_dream_of_the_book_of_darkness_lua = class ({})
LinkLuaModifier("reinforce_modifier_dream_of_the_book_of_darkness_lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("reinforce_modifier_dream_of_the_book_of_darkness_2_lua", LUA_MODIFIER_MOTION_NONE)

function reinforce_dream_of_the_book_of_darkness_lua:OnSpellStart()
	local c = self:GetCaster()
	local duration = self:GetChannelTime()
	
	c:AddNewModifier(c, self, "reinforce_modifier_dream_of_the_book_of_darkness_lua", {duration = duration})

	local target = self:GetCursorTarget()
	local dream_time = self:GetSpecialValueFor("dream_time")
	
	target:AddNewModifier(c, self, "reinforce_modifier_dream_of_the_book_of_darkness_2_lua", {duration = dream_time})
	target:AddNoDraw();
	self.lTarget = target;
	
	local secret_ability = c:FindAbilityByName("reinforce_dream_of_the_book_of_darkness_2_lua");
	
	c:CastAbilityNoTarget(secret_ability, c:GetPlayerOwnerID());
end

function reinforce_dream_of_the_book_of_darkness_lua:OnUpgrade()
	local ability = self:GetCaster():FindAbilityByName("reinforce_dream_of_the_book_of_darkness_2_lua");
	
	--Say(self:GetCaster(), "Ability name: " .. ability:GetAbilityName(), true);
	
	ability:SetActivated(true);
	ability:UpgradeAbility(false);
	
	--Say(self:GetCaster(), "Ability level: " .. ability:GetLevel(), true);
end