reinforce_modifier_dream_of_the_book_of_darkness_2_lua = class ({})

function reinforce_modifier_dream_of_the_book_of_darkness_2_lua:CheckState()
 local state = {
	 [MODIFIER_STATE_INVULNERABLE] = true,
	 [MODIFIER_STATE_NO_HEALTH_BAR] = true,
	 [MODIFIER_STATE_OUT_OF_GAME] = true,
	 [MODIFIER_STATE_STUNNED] = true,
	 [MODIFIER_STATE_INVISIBLE] = true,
	 [MODIFIER_STATE_TRUESIGHT_IMMUNE] = true
 }
 return state
end

function reinforce_modifier_dream_of_the_book_of_darkness_2_lua:IsStunDebuff()
	return true;
end
