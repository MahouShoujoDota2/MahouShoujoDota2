mami_tomoe_modifier_ribbon_lua = class({})

function mami_tomoe_modifier_ribbon_lua:IsDebuff() 
	return true;
end

function mami_tomoe_modifier_ribbon_lua:IsPurgable()
	return true;
end

function mami_tomoe_modifier_ribbon_lua:OnCreated( table )
	if IsServer() then
		self.tick = 0.1;
		self.max_dist = self:GetAbility():GetSpecialValueFor("max_dist");

		self:StartIntervalThink(self.tick);
		self:OnIntervalThink();
	end
end

function mami_tomoe_modifier_ribbon_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_PROVIDES_FOW_POSITION,
	}

	return funcs;
end

function mami_tomoe_modifier_ribbon_lua:GetModifierProvidesFOWVision()
	return 1;
end

function mami_tomoe_modifier_ribbon_lua:OnIntervalThink()
	if IsServer() then
		local caster = self:GetCaster();
		local enemy = self:GetParent();

		local caster_position = caster:GetAbsOrigin();
		local enemy_position = enemy:GetAbsOrigin();

		local dst = caster:GetRangeToUnit(enemy);

		if dst > self.max_dist then
			local debuff = enemy:FindModifierByName( "mami_tomoe_modifier_ribbon_lua" );
			self:GetAbility().target = nil;
			debuff:Destroy();
		end
	end
end