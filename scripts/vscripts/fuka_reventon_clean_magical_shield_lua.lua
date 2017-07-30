fuka_reventon_clean_magical_shield_lua = class({})
LinkLuaModifier("fuka_reventon_modifier_clean_magical_shield_lua", LUA_MODIFIER_MOTION_NONE);

function fuka_reventon_clean_magical_shield_lua:OnOwnerSpawned()

	local c = self:GetCaster();

	c:AddNewModifier(c, self, "fuka_reventon_modifier_clean_magical_shield_lua", {});
end

function fuka_reventon_clean_magical_shield_lua:OnUpgrade()
	local c = self:GetCaster();
	
	local modifier = c:FindModifierByName("fuka_reventon_modifier_clean_magical_shield_lua");
	
	if modifier == nil then
		c:AddNewModifier(c, self, "fuka_reventon_modifier_clean_magical_shield_lua", {});
	end
end

function fuka_reventon_clean_magical_shield_lua:IsHiddenWhenStolen()
	return false;
end