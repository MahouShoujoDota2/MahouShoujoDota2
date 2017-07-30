nanoha_takamachi_test_lua = class({})

function nanoha_takamachi_test_lua:OnToggle()

	local caster = self:GetCaster();
	
	if caster.table == nil then
		caster.table = {};
		
		for i = 0,10,1 do
			caster.table[i] = 0;
		end
	end
	
	if self:GetToggleState() then
	
		for i = 1,4,1 do
			caster.table[i] = caster:GetAbilityByIndex(i):GetLevel();
		end
	
		caster:RemoveAbility("crystal_maiden_crystal_nova");
		caster:RemoveAbility("crystal_maiden_frostbite");
		caster:RemoveAbility("crystal_maiden_freezing_field");
		caster:AddAbility("mami_tomoe_ribbon_lua");
		caster:AddAbility("mami_tomoe_tiro_volley_lua");
		caster:AddAbility("mami_tomoe_tiro_finale_lua");
		
		for i = 1,4,1 do
			caster:GetAbilityByIndex(i):SetLevel(tonumber(caster.table[i+3]));
		end
	else
	
		for i = 1,4,1 do
			caster.table[i+3] = caster:GetAbilityByIndex(i):GetLevel();
		end
	
		caster:RemoveAbility("mami_tomoe_ribbon_lua");
		caster:RemoveAbility("mami_tomoe_tiro_volley_lua");
		caster:RemoveAbility("mami_tomoe_tiro_finale_lua");
		caster:AddAbility("crystal_maiden_crystal_nova");
		caster:AddAbility("crystal_maiden_frostbite");
		caster:AddAbility("crystal_maiden_freezing_field");
		
		for i = 1,4,1 do
			caster:GetAbilityByIndex(i):SetLevel(tonumber(caster.table[i]));
		end
	end
end