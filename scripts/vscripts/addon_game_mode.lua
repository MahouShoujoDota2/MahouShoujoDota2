LinkLuaModifier("modifier_charges", LUA_MODIFIER_MOTION_NONE);

if CAddonTemplateGameMode == nil then
	CAddonTemplateGameMode = class({})
end

function Precache( context )
	--[[
		Precache things we know we'll use.  Possible file types include (but not limited to):
			PrecacheResource( "model", "*.vmdl", context )
			PrecacheResource( "soundfile", "*.vsndevts", context )
			PrecacheResource( "particle", "*.vpcf", context )
			PrecacheResource( "particle_folder", "particles/folder", context )
	]]
	PrecacheResource("particle", "particles/econ/items/sniper/sniper_charlie/sniper_assassinate_charlie.vpcf", context);
end

-- Create the game mode when we activate
function Activate()
	GameRules.AddonTemplate = CAddonTemplateGameMode()
	GameRules.AddonTemplate:InitGameMode()
end

function CAddonTemplateGameMode:InitGameMode()
	print( "Template addon is loaded." )
	GameRules:GetGameModeEntity():SetThink( "OnThink", self, "GlobalThink", 2 )
	
	-- Events
	ListenToGameEvent("npc_spawned", Dynamic_Wrap( CAddonTemplateGameMode, "Event_Hero_Spawned" ), self);
end

-- Evaluate the state of the game
function CAddonTemplateGameMode:OnThink()
	if GameRules:State_Get() == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
		--print( "Template addon script is running." )
	elseif GameRules:State_Get() >= DOTA_GAMERULES_STATE_POST_GAME then
		return nil
	end
	return 1
end

-- EVENTS
function CAddonTemplateGameMode:Event_Hero_Spawned(eventInfo)
	local hero = EntIndexToHScript(eventInfo.entindex);
	
	if hero ~= nil and hero:IsHero() then
		local children = hero:GetChildren();
		for k,child in pairs(children) do
			if child:GetClassname() == "dota_item_wearable" then
				child:RemoveSelf();
			end
		end
	end
end