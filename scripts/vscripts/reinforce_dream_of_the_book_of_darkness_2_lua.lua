reinforce_dream_of_the_book_of_darkness_2_lua = class({})

function reinforce_dream_of_the_book_of_darkness_2_lua:OnChannelFinish(value)
	if value == true then 
		local target = self:GetCaster():FindAbilityByName("reinforce_dream_of_the_book_of_darkness_lua").lTarget;
		local modifier = target:FindModifierByName("reinforce_modifier_dream_of_the_book_of_darkness_2_lua")
		target:RemoveNoDraw();
		if modifier ~= nil then
			modifier:Destroy()
		end
	end
end