fuka_reventon_modifier_strike_lua = class({})

function fuka_reventon_modifier_strike_lua:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_ATTACK_LANDED,
	};
end

function fuka_reventon_modifier_strike_lua:OnAttackLanded(event)
	local c = self:GetParent();
	
	if c == event.attacker then
		local ability = self:GetAbility();
		
		local mana_cost = ability:GetSpecialValueFor("mana_cost");
		
		if c:GetMana() >= mana_cost then
			c:SpendMana(mana_cost, ability);
			
			-- ORB EFFECT MAYBE TODO @Sarir on phone right now, look for Dota IMBA. We have Silencer's, Drow Ranger's, Outworld's orb effect
			
			local damageTable = {
				victim = event.target,
				attacker = c,
				damage = ability:GetSpecialValueFor("damage"),
				damage_type = DAMAGE_TYPE_PHYSICAL,
				ability = ability,
			};
			 
			ApplyDamage(damageTable);
		end
	end
end

function fuka_reventon_modifier_strike_lua:RemoveOnDeath() 
	return false; 
end