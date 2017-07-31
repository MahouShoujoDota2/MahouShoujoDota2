reinforce_modifier_dream_of_the_book_of_darkness_lua = class ({})

function reinforce_modifier_dream_of_the_book_of_darkness_lua:DeclareFunctions()
	return {
		MODIFIER_EVENT_ON_TAKEDAMAGE,
	};
end

function reinforce_modifier_dream_of_the_book_of_darkness_lua:OnTakeDamage(params)

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
			
			--Say(c, "Attacker angle: " .. result_angle, true);
			
			if result_angle <= 90 and result_angle >= -90 then
				c:Heal(params.damage, nil) 
			end
		end
	end
end