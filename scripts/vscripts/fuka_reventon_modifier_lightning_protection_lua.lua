fuka_reventon_modifier_lightning_protection_lua = class({})

function fuka_reventon_modifier_lightning_protection_lua:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_TAKEDAMAGE,
	};
end

function fuka_reventon_modifier_lightning_protection_lua:OnTakeDamage(params)

	local c = self:GetParent();

	if params.unit == c then
		if params.damage_type == DAMAGE_TYPE_MAGICAL or params.damage_type == DAMAGE_TYPE_PHYSICAL then
			local ability = self:GetAbility();
			
			local victim_angle = c:GetAnglesAsVector().y;
			local origin_difference = c:GetAbsOrigin() - params.attacker:GetAbsOrigin();
			local origin_difference_radian = math.atan2(origin_difference.y, origin_difference.x);
			origin_difference_radian = origin_difference_radian * 180;
			local attacker_angle = origin_difference_radian / math.pi;
			attacker_angle = attacker_angle + 180.0;
			local result_angle = attacker_angle - victim_angle;
			result_angle = math.abs(result_angle);
			
			if result_angle <= 45 or result_angle >= -45 then
				c:Heal(params.damage, nil);
				
				local ult_modifier = c:FindModifierByName("fuka_reventon_modifier_knuckle_lua");
				
				if ult_modifier ~= nil then
				
					local chance = ult_modifier:GetAbility():GetSpecialValueFor("chance");
					
					local rnd = math.random(0, 100);
					
					if rnd <= chance then
						if origin_difference:Length2D() <= c:GetAttackRange() then
						
							local damageFromHero = c:GetAverageTrueAttackDamage(c);
							
							local fist = c:FindAbilityByName("fuka_reventon_strike_lua");
							
							if fist ~= nil and fist:GetToggleState() then
								damageFromHero = damageFromHero + fist:GetSpecialValueFor("damage");
							end
						
							local damage = damageFromHero * ult_modifier:GetAbility():GetSpecialValueFor("crit_modifier");
							
							local damageTable = {
								victim = params.attacker,
								attacker = c,
								damage = damage,
								damage_type = DAMAGE_TYPE_PHYSICAL
							}
							
							SendOverheadEventMessage(nil, OVERHEAD_ALERT_CRITICAL, params.attacker, damage, nil);
							 
							ApplyDamage(damageTable);
						end
					end
				end
				
				self:GetAbility():EndChannel(true);
			end
		end
	end
end