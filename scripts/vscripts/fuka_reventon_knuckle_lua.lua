fuka_reventon_knuckle_lua = class({})
LinkLuaModifier("fuka_reventon_modifier_knuckle_lua", LUA_MODIFIER_MOTION_NONE);

function fuka_reventon_knuckle_lua:OnOwnerSpawned()

	local c = self:GetCaster();

	c:AddNewModifier(c, self, "fuka_reventon_modifier_knuckle_lua", {});
end

function fuka_reventon_knuckle_lua:OnUpgrade()
	local c = self:GetCaster();
	
	local modifier = c:FindModifierByName("fuka_reventon_modifier_knuckle_lua");
	
	if modifier == nil then
		c:AddNewModifier(c, self, "fuka_reventon_modifier_knuckle_lua", {});
	end
end

function fuka_reventon_knuckle_lua:IsHiddenWhenStolen()
	return false;
end