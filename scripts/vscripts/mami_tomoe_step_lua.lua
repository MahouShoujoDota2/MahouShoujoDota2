mami_tomoe_step_lua = class({})
LinkLuaModifier("mami_tomoe_modifier_step_lua", LUA_MODIFIER_MOTION_NONE)

function mami_tomoe_step_lua:OnSpellStart()
	local caster = self:GetCaster();
	local dur = self:GetSpecialValueFor("duration");
	caster:AddNewModifier(caster, self, "mami_tomoe_modifier_step_lua", { duration = dur} );
	self:StartCooldown(dur * 2);
end

function mami_tomoe_step_lua:OnUpgrade()
	local caster = self:GetCaster();

	local max_count = self:GetSpecialValueFor("max_count");
	local time = self:GetSpecialValueFor("time");

	if self:GetLevel() == 1 then
		caster:AddNewModifier(caster, self, "modifier_charges", {max_count = max_count, start_count = 1, replenish_time = time});
	else 
		local modifier = self:GetCaster():FindModifierByName( "modifier_charges" );
		local char = modifier:GetStackCount();
		modifier:Destroy();
		caster:AddNewModifier(caster, self, "modifier_charges", {max_count = max_count, start_count = char, replenish_time = time});
	end
end

function mami_tomoe_step_lua:IsHiddenWhenStolen()
	return false;
end