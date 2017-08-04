alph_ring_bind_lua = class ({})
LinkLuaModifier("alph_modifier_ring_bind_lua", LUA_MODIFIER_MOTION_NONE);

function alph_ring_bind_lua:OnSpellStart()
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	target:AddNewModifier(caster, self, "alph_modifier_ring_bind_lua", { duration = self:GetSpecialValueFor("duration")})
end