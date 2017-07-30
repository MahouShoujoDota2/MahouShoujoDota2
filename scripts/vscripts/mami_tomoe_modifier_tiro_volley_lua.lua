mami_tomoe_modifier_tiro_volley_lua = class({})

function mami_tomoe_modifier_tiro_volley_lua:DeclareFunctions()
	local f = {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
		MODIFIER_EVENT_ON_ORDER,
		MODIFIER_EVENT_ON_UNIT_MOVED
	};

	return f;
end

function mami_tomoe_modifier_tiro_volley_lua:GetModifierAttackSpeedBonus_Constant(params)
	return self:GetAbility():GetSpecialValueFor("attack_speed");
end

function mami_tomoe_modifier_tiro_volley_lua:OnOrder(params)
	if IsServer() and params.unit == self:GetParent() then
		self:Destroy();
	end
end

function mami_tomoe_modifier_tiro_volley_lua:OnUnitMoved(params)
	if IsServer() and params.unit == self:GetParent() then
		self:Destroy();
	end
end