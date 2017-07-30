abaddon_night_ball_lua = class({})
LinkLuaModifier("abaddon_modifier_night_ball_lua", LUA_MODIFIER_MOTION_NONE)

function abaddon_night_ball_lua:OnSpellStart()
	local cast_range = self:GetSpecialValueFor("cast_range");
	local stun_duration = self:GetSpecialValueFor("stun_duration");
	local proj_speed = self:GetSpecialValueFor("proj_speed");
	
	print("Night ball casted!");
	
	local caster = self:GetCaster();
	
	local info = {
		Target = self:GetCursorTarget(),
		Source = caster,
		Ability = self,
		EffectName = "particles/units/heroes/hero_sven/sven_spell_storm_bolt.vpcf",
		iMoveSpeed = proj_speed,
		bDodgeable = true,
		bProvidesVision = true,
		iVisionRadius = cast_range,
		iVisionTeamNumber = caster:GetTeamNumber(),
		vSourceLoc = caster:GetAbsOrigin()
	}

	ProjectileManager:CreateTrackingProjectile(info);
end

function abaddon_night_ball_lua:OnProjectileHit( hTarget, vLocation )

	local damage = self:GetSpecialValueFor("damage");

	local damageInfo = {
		victim = hTarget,
		attacker = self:GetCaster(),
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL
	}

	ApplyDamage(damageInfo);
end