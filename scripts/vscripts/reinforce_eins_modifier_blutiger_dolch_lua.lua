reinforce_eins_modifier_blutiger_dolch_lua = class ({})

function reinforce_eins_modifier_blutiger_dolch_lua:DeclareFunctions()
	local func = {MODIFIER_EVENT_ON_UNIT_MOVED}
	return func
end

function reinforce_eins_modifier_blutiger_dolch_lua:OnUnitMoved(event)
	if event.unit == self:GetParent()
	then

		local damageTable = {
				victim = self:GetParent(),
				attacker = self:GetAbility():GetCaster(),
				damage = self:GetAbility():GetSpecialValueFor("damage"),
				damage_type = DAMAGE_TYPE_MAGICAL,
			}
			 
			ApplyDamage(damageTable);
		self:Destroy()
	end
end