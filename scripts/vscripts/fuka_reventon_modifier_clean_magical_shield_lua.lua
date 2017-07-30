fuka_reventon_modifier_clean_magical_shield_lua = class({})

function fuka_reventon_modifier_clean_magical_shield_lua:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_TAKEDAMAGE,
	};
end

function fuka_reventon_modifier_clean_magical_shield_lua:OnTakeDamage(params)

	local c = self:GetParent();

	if params.unit == c then
		if params.damage_type == DAMAGE_TYPE_MAGICAL then
			local ability = self:GetAbility();
			
			local mana_per_damage = ability:GetSpecialValueFor("mana_per_damage");
		
			local need_mana = mana_per_damage * params.damage;
			
			local c_mana = c:GetMana();
			
			if c_mana >= need_mana then -- еякх люмш ме убюрхр, рн янях охяня
				c:SpendMana(need_mana, ability);
				c:Heal(params.damage, nil);
			end
		end
	end
end