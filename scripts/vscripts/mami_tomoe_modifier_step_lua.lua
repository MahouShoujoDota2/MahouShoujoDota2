mami_tomoe_modifier_step_lua = class({})

function mami_tomoe_modifier_step_lua:DeclareFunctions()
	local funcs = {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
		MODIFIER_PROPERTY_EVASION_CONSTANT,
	}

	return funcs;
end

function mami_tomoe_modifier_step_lua:GetModifierMoveSpeedBonus_Percentage()
	return self:GetAbility():GetSpecialValueFor("speed_bonus");
end

function mami_tomoe_modifier_step_lua:GetModifierEvasion_Constant()
	return 100;
end