mami_tomoe_tiro_finale_lua = class({})

function mami_tomoe_tiro_finale_lua:OnChannelFinish(bInterrupted)
	if not bInterrupted then

		local caster = self:GetCaster();

		local info = 
		{
			Ability = self,
        	--EffectName = "particles/units/heroes/hero_windrunner/windrunner_spell_powershot.vpcf",
			EffectName = "particles/mami_tomoe_tiro_finale.vpcf",
        	vSpawnOrigin = caster:GetAbsOrigin(),
        	fDistance = 1500,
        	fStartRadius = 90,
        	fEndRadius = 90,
        	Source = caster,
        	bHasFrontalCone = false,
        	bReplaceExisting = false,
        	iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        	iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
			bDeleteOnHit = false,
			vVelocity = caster:GetForwardVector() * 4500,
			bProvidesVision = false
		}
		
		ProjectileManager:CreateLinearProjectile(info);
	end
end

function mami_tomoe_tiro_finale_lua:OnProjectileHit( hTarget, vLocation )
	if hTarget ~= nil then

		local caster = self:GetCaster();
		
		local damage = caster:GetAverageTrueAttackDamage(caster) * self:GetSpecialValueFor("crit");
		
		local damageTable = {
			victim = hTarget,
			attacker = caster,
			damage = damage,
			damage_type = DAMAGE_TYPE_PHYSICAL
		}
		
		SendOverheadEventMessage(nil, OVERHEAD_ALERT_CRITICAL, hTarget, damage, nil);
		 
		ApplyDamage(damageTable);
	end
end

function mami_tomoe_tiro_finale_lua:IsHiddenWhenStolen()
	return false;
end