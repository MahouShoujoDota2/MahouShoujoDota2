mami_tomoe_tiro_volley_lua = class({})
LinkLuaModifier("mami_tomoe_modifier_tiro_volley_lua", LUA_MODIFIER_MOTION_NONE)

function mami_tomoe_tiro_volley_lua:OnSpellStart()
	local caster = self:GetCaster();
	local duration = self:GetSpecialValueFor("duration");
	caster:AddNewModifier(caster, self, "mami_tomoe_modifier_tiro_volley_lua", {duration = duration} );
	--caster:SetAggroTarget(self:GetCursorTarget());
end

function mami_tomoe_tiro_volley_lua:IsHiddenWhenStolen()
	return false;
end