fuka_reventon_lightning_protection_lua = class({})
LinkLuaModifier("fuka_reventon_modifier_lightning_protection_lua", LUA_MODIFIER_MOTION_NONE);

function fuka_reventon_lightning_protection_lua:OnSpellStart()
	local c = self:GetCaster();
	c:AddNewModifier(c, self, "fuka_reventon_modifier_lightning_protection_lua", {});
end

function fuka_reventon_lightning_protection_lua:OnChannelFinish()
	local modifier = self:GetCaster():FindModifierByName("fuka_reventon_modifier_lightning_protection_lua");
	
	if modifier ~= nil then
		modifier:Destroy();
	end
end

function fuka_reventon_lightning_protection_lua:IsHiddenWhenStolen()
	return false;
end