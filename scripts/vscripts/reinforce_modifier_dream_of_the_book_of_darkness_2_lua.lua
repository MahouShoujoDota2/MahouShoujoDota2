reinforce_modifier_dream_of_the_book_of_darkness_2_lua = class ({})

function reinforce_modifier_dream_of_the_book_of_darkness_2_lua:CheckState()
 local state = {
 [MODIFIER_STATE_INVULNERABLE] = true,
 [MODIFIER_STATE_NO_HEALTH_BAR] = true,
 [MODIFIER_STATE_OUT_OF_GAME] = true
 }
 return state
end
