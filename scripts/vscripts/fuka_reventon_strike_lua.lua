fuka_reventon_strike_lua = class({})
LinkLuaModifier("fuka_reventon_modifier_strike_lua", LUA_MODIFIER_MOTION_NONE);

function fuka_reventon_strike_lua:OnToggle()
	local c = self:GetCaster();
	
	if self:GetToggleState() then
		c:AddNewModifier(c, self, "fuka_reventon_modifier_strike_lua", {});
	else
		local modifier = c:FindModifierByName("fuka_reventon_modifier_strike_lua");
		
		if modifier ~= nil then
			modifier:Destroy();
		end
	end
end

function fuka_reventon_strike_lua:IsHiddenWhenStolen()
	return false;
end
