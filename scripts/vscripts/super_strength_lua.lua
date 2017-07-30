super_strength_lua = class({})
LinkLuaModifier("modifier_super_strength_lua", LUA_MODIFIER_MOTION_NONE)

function super_strength_lua:OnSpellStart()
	print("SUPER STRENGTH APPLIED!");
	
	local caster = self:GetCaster();
	
	caster:AddNewModifier(caster, self, "modifier_super_strength_lua", { duration = 8 });
end