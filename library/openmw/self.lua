---@meta
---`openmw.self` provides full access to the object the script is attached to.
---Can be used only from local scripts. All fields and function of `GameObject` are also available for `openmw.self`.
---local self = require('openmw.self') local types = require('openmw.types') if self.type == types.Player then  -- All fields and functions of `GameObject` are available.     self:sendEvent("something", self.position) end

---@module 'core'

---@class self
---Movement controls (only for actors)
---@field controls ActorControls
---The object the script is attached to (readonly)
---@field object GameObject
---Faction who owns the object or `nil` (mutable).
---@field ownerFactionId string
---Rank required to be allowed to pick up the object (mutable).
---@field ownerFactionRank number
---NPC who owns the object or `nil` (mutable).
---@field ownerRecordId string
local self = {}

---@param v boolean
function self:enableAI(v) end
---@return boolean
function self:isActive() end
---@class ActorControls
---If true - initiate a jump
---@field jump boolean
---+1 - move forward, -1 - move backward
---@field movement number
---Look down (radians); if negative - look up
---@field pitchChange number
---true - run, false - walk
---@field run boolean
---+1 - move right, -1 - move left
---@field sideMovement number
---If true - sneak
---@field sneak boolean
---if 1 - activates the readied weapon/spell. For weapons, keeping at 1 will charge the attack until set to 0.
---@field use number
---Turn right (radians); if negative - turn left
---@field yawChange number
---Allows to view and/or modify controls of an actor.
---All fields are mutable.
local ActorControls = {}

return self
