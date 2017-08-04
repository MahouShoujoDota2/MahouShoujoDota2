alph_modifier_chain_bind_lua = class ({})

function alph_modifier_chain_bind_lua:CheckState()
 local state = {
	 [MODIFIER_STATE_ROOTED] = true,
	 [MODIFIER_STATE_DISARMED] = true
	}
 return state
end

function alph_modifier_chain_bind_lua:IsStunDebuff()
	return true;
end
