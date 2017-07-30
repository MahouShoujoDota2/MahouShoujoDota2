mami_tomoe_ribbon_lua = class({})
LinkLuaModifier("mami_tomoe_modifier_ribbon_lua", LUA_MODIFIER_MOTION_NONE)

function mami_tomoe_ribbon_lua:OnOwnerSpawned()
	self.target = nil;
end

function mami_tomoe_ribbon_lua:OnSpellStart()
	local enemy = self:GetCursorTarget();
	local caster = self:GetCaster();
	--local debuff_duration = self:GetSpecialValueFor("duration");

	if self.target ~= nil then
		local debuff = self.target:FindModifierByName( "mami_tomoe_modifier_ribbon_lua" );
		if debuff ~= nil then
			debuff:Destroy();
		end
	end

	enemy:AddNewModifier(caster, self, "mami_tomoe_modifier_ribbon_lua", nil );
	self.target = enemy;
end

function mami_tomoe_ribbon_lua:IsHiddenWhenStolen()
	return false;
end