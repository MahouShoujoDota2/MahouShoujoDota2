alph_modifier_chain_bind_lua = class ({})

function alph_modifier_chain_bind_lua:CheckState()
 local state = {
	 [MODIFIER_STATE_ROOTED] = true,
	 [MODIFIER_STATE_DISARMED] = true --Ещё должен быть сайленс или вроде того
 return state
end

function reinforce_modifier_dream_of_the_book_of_darkness_2_lua:IsStunDebuff()
	return true;
end
