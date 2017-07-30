reinforce_eins_diabolic_emission_lua = class({})

function reinforce_eins_diabolic_emission_lua:OnSpellStart()
	self.fRadius = 0;
end

function reinforce_eins_diabolic_emission_lua:OnChannelThink(interval)
	self.fRadius = self.fRadius + self:GetSpecialValueFor("radius_increase");
	
	local caster = self:GetCaster();
	
	DebugDrawCircle(caster:GetAbsOrigin(), Vector(12, 35, 71), 0.5, self.fRadius, true, interval);
	
	local enemies = FindUnitsInRadius(caster:GetTeamNumber(), caster:GetAbsOrigin(), nil, self.fRadius, DOTA_UNIT_TARGET_TEAM_ENEMY,
                              DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false);
 
	for _,unit in pairs(enemies) do
		local damageTable = {
			victim = unit,
			attacker = caster,
			damage = self:GetSpecialValueFor("damage"),
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self
		}
		 
		ApplyDamage(damageTable);
	end
end