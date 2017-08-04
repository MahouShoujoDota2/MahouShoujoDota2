alph_chain_bind_lua = class ({})
LinkLuaModifier("alph_modifier_chain_bind_lua", LUA_MODIFIER_MOTION_NONE);

function alph_chain_bind_lua:OnSpellStart()
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	target:AddNewModifier(caster, self, "alph_modifier_chain_bind_lua", {duration = self:GetChannelTime()})
end

function alph_chain_bind_lua:OnChannelFinish(value)
	if value == true then 
		local target = self:GetCursorTarget();
		local modifier = target:FindModifierByName("alph_modifier_chain_bind_lua")
		if modifier ~= nil then
			modifier:Destroy()
		end
	end
end