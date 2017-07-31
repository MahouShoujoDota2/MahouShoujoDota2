reinforce_eins_blutiger_dolch_lua = class ({})
LinkLuaModifier("reinforce_eins_modifier_blutiger_dolch_lua", LUA_MODIFIER_MOTION_NONE)


function reinforce_eins_blutiger_dolch_lua:OnSpellStart()
	local fRadius = self:GetSpecialValueFor("radius");
	local caster = self:GetCaster();

	local enemies = FindUnitsInRadius(caster:GetTeamNumber(), caster:GetAbsOrigin(), nil, fRadius, DOTA_UNIT_TARGET_TEAM_ENEMY,
                              DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false);

	for _,unit in pairs(enemies) do
		unit:AddNewModifier(caster, self, "reinforce_eins_modifier_blutiger_dolch_lua", {})
	end

end

function reinforce_eins_blutiger_dolch_lua:OnChannelFinish()
	--local fRadius = self:GetSpecialValueFor("radius");
	local caster = self:GetCaster();
	local enemies = FindUnitsInRadius(caster:GetTeamNumber(), caster:GetAbsOrigin(), nil, FIND_UNITS_EVERYWHERE, DOTA_UNIT_TARGET_TEAM_ENEMY,
                              DOTA_UNIT_TARGET_HERO, DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false);

	for _,unit in pairs(enemies) do
		local modifier =  unit:FindModifierByName("reinforce_eins_modifier_blutiger_dolch_lua")
		if modifier ~= nil then modifier:Destroy() end
	end

end