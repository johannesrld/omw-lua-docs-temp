---@meta
---`openmw.types` defines functions for specific types of game objects.
---local types = require('openmw.types')

---@module 'core'
---@module 'util'

---@class types
---{#Activator} functions
---@field Activator Activator
---Common @{#Actor} functions for Creature, NPC, and Player.
---@field Actor Actor
---{#Apparatus} functions
---@field Apparatus Apparatus
---{#Armor} functions
---@field Armor Armor
---{#Book} functions
---@field Book Book
---{#Clothing} functions
---@field Clothing Clothing
---{#Container} functions
---@field Container Container
---{#Creature} functions
---@field Creature Creature
---{#Door} functions
---@field Door Door
---Functions for @{#ESM4Activator} objects
---@field ESM4Activator ESM4Activator
---Functions for @{#ESM4Ammunition} objects
---@field ESM4Ammunition ESM4Ammunition
---Functions for @{#ESM4Armor} objects
---@field ESM4Armor ESM4Armor
---Functions for @{#ESM4Book} objects
---@field ESM4Book ESM4Book
---Functions for @{#ESM4Clothing} objects
---@field ESM4Clothing ESM4Clothing
---Functions for @{#ESM4Door} objects
---@field ESM4Door ESM4Door
---Functions for @{#ESM4Flora} objects
---@field ESM4Flora ESM4Flora
---Functions for @{#ESM4Ingredient} objects
---@field ESM4Ingredient ESM4Ingredient
---Functions for @{#ESM4Light} objects
---@field ESM4Light ESM4Light
---Functions for @{#ESM4Miscellaneous} objects
---@field ESM4Miscellaneous ESM4Miscellaneous
---Functions for @{#ESM4MovableStatic} objects
---@field ESM4MovableStatic ESM4MovableStatic
---Functions for @{#ESM4Potion} objects
---@field ESM4Potion ESM4Potion
---Functions for @{#ESM4Static} objects
---@field ESM4Static ESM4Static
---Functions for @{#ESM4Terminal} objects
---@field ESM4Terminal ESM4Terminal
---Functions for @{#ESM4Weapon} objects
---@field ESM4Weapon ESM4Weapon
---{#Ingredient} functions
---@field Ingredient Ingredient
---{#Item} functions (all items that can be placed to an inventory or container)
---@field Item Item
---{#CreatureLevelledList} functions
---@field LevelledCreature CreatureLevelledList
---{#Light} functions
---@field Light Light
---{#Lockable} functions
---@field Lockable Lockable
---{#Lockpick} functions
---@field Lockpick Lockpick
---Functions for @{#Miscellaneous} objects
---@field Miscellaneous Miscellaneous
---{#NPC} functions
---@field NPC NPC
---{#Player} functions
---@field Player Player
---{#Potion} functions
---@field Potion Potion
---{#Probe} functions
---@field Probe Probe
---{#Repair} functions
---@field Repair Repair
---Functions for @{#Static} objects
---@field Static Static
---{#Weapon} functions
---@field Weapon Weapon
local types = {}

---@class Activator
---A read-only list of all @{#ActivatorRecord}s in the world database.
---@field records ActivatorRecord[]
local Activator = {}

---@param activator ActivatorRecord A Lua table with the fields of a ActivatorRecord, with an optional field `template` that accepts a {#ActivatorRecord} as a base.
---@return ActivatorRecord
function Activator.createRecordDraft(activator) end
---@param object GameObject
---@return boolean
function Activator.objectIsInstance(object) end
---@param objectOrRecordId any
---@return ActivatorRecord
function Activator.record(objectOrRecordId) end
---@class Actor
---Available @{#EQUIPMENT_SLOT} values.
---Used in `Actor.equipment(obj)` and `Actor.setEquipment(obj, eqp)`.
---@field EQUIPMENT_SLOT EQUIPMENT_SLOT
---{#STANCE}
---@field STANCE STANCE
---The actor's stats.
---@field stats ActorStats
---Common functions for Creature, NPC, and Player.
local Actor = {}

---@param actor GameObject
---@return ActorActiveEffects
function Actor.activeEffects(actor) end
---@param actor GameObject
---@return ActorActiveSpells
function Actor.activeSpells(actor) end
---@param object GameObject
---@return boolean
function Actor.canMove(object) end
---@param actor GameObject
function Actor.clearSelectedCastable(actor) end
---@param actor GameObject
---@return number
function Actor.getCurrentSpeed(actor) end
---@param actor GameObject
---@return number
function Actor.getEncumbrance(actor) end
---@param actor GameObject
---@param slot number Optional number of the equipment slot
---@return EquipmentTable
---@return GameObject
function Actor.getEquipment(actor, slot) end
---@param actor GameObject
---@return table
function Actor.getPathfindingAgentBounds(actor) end
---@param actor GameObject
---@return number
function Actor.getRunSpeed(actor) end
---@param actor GameObject
---@return any
function Actor.getSelectedEnchantedItem(actor) end
---@param actor GameObject
---@return any
function Actor.getSelectedSpell(actor) end
---@param actor GameObject
---@return number
function Actor.getStance(actor) end
---@param actor GameObject
---@return number
function Actor.getWalkSpeed(actor) end
---@param actor GameObject
---@param item GameObject
---@return boolean
function Actor.hasEquipped(actor, item) end
---@param actor GameObject
---@return Inventory
function Actor.inventory(actor) end
---@param actor GameObject
---@return boolean
function Actor.isDead(actor) end
---@param actor GameObject
---@return boolean
function Actor.isInActorsProcessingRange(actor) end
---@param actor GameObject
---@return boolean
function Actor.isOnGround(actor) end
---@param actor GameObject
---@return boolean
function Actor.isSwimming(actor) end
---@param object GameObject
---@return boolean
function Actor.objectIsInstance(object) end
---@param actor GameObject
---@param equipment EquipmentTable
function Actor.setEquipment(actor, equipment) end
---@param actor GameObject
---@param item GameObject enchanted item
function Actor.setSelectedEnchantedItem(actor, item) end
---@param actor GameObject
---@param spell Spell Spell (can be nil)
function Actor.setSelectedSpell(actor, spell) end
---@param actor GameObject
---@param stance number
function Actor.setStance(actor, stance) end
---@param actor GameObject
---@return ActorSpells
function Actor.spells(actor) end
---@class Apparatus
---{#ApparatusTYPE}
---@field TYPE ApparatusTYPE
---{#Item}
---@field baseType Item
---A read-only list of all @{#ApparatusRecord}s in the world database.
---@field records ApparatusRecord[]
local Apparatus = {}

---@param object GameObject
---@return boolean
function Apparatus.objectIsInstance(object) end
---@param objectOrRecordId any
---@return ApparatusRecord
function Apparatus.record(objectOrRecordId) end
---@class Armor
---{#ArmorTYPE}
---@field TYPE ArmorTYPE
---{#Item}
---@field baseType Item
---A read-only list of all @{#ArmorRecord}s in the world database.
---@field records ArmorRecord[]
local Armor = {}

---@param armor ArmorRecord A Lua table with the fields of a ArmorRecord, with an additional field `template` that accepts a {#ArmorRecord} as a base.
---@return ArmorRecord
function Armor.createRecordDraft(armor) end
---@param object GameObject
---@return boolean
function Armor.objectIsInstance(object) end
---@param objectOrRecordId any
---@return ArmorRecord
function Armor.record(objectOrRecordId) end
---@class Book
---DEPRECATED, use @{openmw.core#Skill}
---@field SKILL BookSKILL
---{#Item}
---@field baseType Item
---A read-only list of all @{#BookRecord}s in the world database.
---@field records BookRecord[]
local Book = {}

---@param book BookRecord A Lua table with the fields of a BookRecord, with an optional field `template` that accepts a {#BookRecord} as a base.
---@return BookRecord
function Book.createRecordDraft(book) end
---@param object GameObject
---@return boolean
function Book.objectIsInstance(object) end
---@param objectOrRecordId any
---@return BookRecord
function Book.record(objectOrRecordId) end
---@class Clothing
---{#ClothingTYPE}
---@field TYPE ClothingTYPE
---{#Item}
---@field baseType Item
---A read-only list of all @{#ClothingRecord}s in the world database.
---@field records ClothingRecord[]
local Clothing = {}

---@param clothing ClothingRecord A Lua table with the fields of a ClothingRecord, with an additional field `template` that accepts a {#ClothingRecord} as a base.
---@return ClothingRecord
function Clothing.createRecordDraft(clothing) end
---@param object GameObject
---@return boolean
function Clothing.objectIsInstance(object) end
---@param objectOrRecordId any
---@return ClothingRecord
function Clothing.record(objectOrRecordId) end
---@class Container
---{#Lockable}
---@field baseType Lockable
---A read-only list of all @{#ContainerRecord}s in the world database.
---@field records ContainerRecord[]
local Container = {}

---@param object GameObject
---@return Inventory
function Container.content(object) end
---@param object GameObject
---@return number
function Container.getCapacity(object) end
---@param object GameObject
---@return number
function Container.getEncumbrance(object) end
---@param object GameObject
---@return Inventory
function Container.inventory(object) end
---@param object GameObject
---@return boolean
function Container.objectIsInstance(object) end
---@param objectOrRecordId any
---@return ContainerRecord
function Container.record(objectOrRecordId) end
---@class Creature
---{#CreatureTYPE}
---@field TYPE CreatureTYPE
---{#Actor}
---@field baseType Actor
---A read-only list of all @{#CreatureRecord}s in the world database.
---@field records CreatureRecord[]
local Creature = {}

---@param object GameObject
---@return boolean
function Creature.objectIsInstance(object) end
---@param objectOrRecordId any
---@return CreatureRecord
function Creature.record(objectOrRecordId) end
---@class CreatureLevelledList
---A read-only list of all @{#CreatureLevelledListRecord}s in the world database.
---@field records CreatureLevelledListRecord[]
local CreatureLevelledList = {}

---@param object GameObject
---@return boolean
function CreatureLevelledList.objectIsInstance(object) end
---@param objectOrRecordId any
---@return CreatureLevelledListRecord
function CreatureLevelledList.record(objectOrRecordId) end
---@class Door
---{#Lockable}
---@field baseType Lockable
---A read-only list of all @{#DoorRecord}s in the world database.
---@field records DoorRecord[]
local Door = {}

---@param object GameObject
---@return Cell
function Door.destCell(object) end
---@param object GameObject
---@return Vector3
function Door.destPosition(object) end
---@param object GameObject
---@return Transform
function Door.destRotation(object) end
---@param object GameObject
---@return boolean
function Door.isTeleport(object) end
---@param object GameObject
---@return boolean
function Door.objectIsInstance(object) end
---@param objectOrRecordId any
---@return DoorRecord
function Door.record(objectOrRecordId) end
---@class ESM4Activator
local ESM4Activator = {}

---@class ESM4Ammunition
local ESM4Ammunition = {}

---@class ESM4Armor
local ESM4Armor = {}

---@class ESM4Book
local ESM4Book = {}

---@class ESM4Clothing
local ESM4Clothing = {}

---@class ESM4Door
---{#Lockable}
---@field baseType Lockable
local ESM4Door = {}

---@param object GameObject
---@return Cell
function ESM4Door.destCell(object) end
---@param object GameObject
---@return Vector3
function ESM4Door.destPosition(object) end
---@param object GameObject
---@return Transform
function ESM4Door.destRotation(object) end
---@param object GameObject
---@return boolean
function ESM4Door.isTeleport(object) end
---@param object GameObject
---@return boolean
function ESM4Door.objectIsInstance(object) end
---@param objectOrRecordId any
---@return ESM4DoorRecord
function ESM4Door.record(objectOrRecordId) end
---@return ESM4DoorRecord[]
function ESM4Door.records() end
---@class ESM4Flora
local ESM4Flora = {}

---@class ESM4Ingredient
local ESM4Ingredient = {}

---@class ESM4Light
local ESM4Light = {}

---@class ESM4Miscellaneous
local ESM4Miscellaneous = {}

---@class ESM4MovableStatic
local ESM4MovableStatic = {}

---@class ESM4Potion
local ESM4Potion = {}

---@class ESM4Static
local ESM4Static = {}

---@class ESM4Terminal
---A read-only list of all @{#ESM4TerminalRecord}s in the world database.
---@field records ESM4TerminalRecord[]
local ESM4Terminal = {}

---@param object GameObject
---@return boolean
function ESM4Terminal.objectIsInstance(object) end
---@param objectOrRecordId any
---@return ESM4TerminalRecord
function ESM4Terminal.record(objectOrRecordId) end
---@class ESM4Weapon
local ESM4Weapon = {}

---@class Ingredient
---{#Item}
---@field baseType Item
---A read-only list of all @{#IngredientRecord}s in the world database.
---@field records IngredientRecord[]
local Ingredient = {}

---@param object GameObject
---@return boolean
function Ingredient.objectIsInstance(object) end
---@param objectOrRecordId any
---@return IngredientRecord
function Ingredient.record(objectOrRecordId) end
---@class Item
---Functions for items that can be placed to an inventory or container
local Item = {}

---@param item GameObject
---@return number
function Item.getEnchantmentCharge(item) end
---@param object GameObject
---@return boolean
function Item.isCarriable(object) end
---@param item GameObject
---@return boolean
function Item.isRestocking(item) end
---@param object GameObject
---@return boolean
function Item.objectIsInstance(object) end
---@param item GameObject
---@param charge number
function Item.setEnchantmentCharge(item, charge) end
---@class Light
---{#Item}
---@field baseType Item
---A read-only list of all @{#LightRecord}s in the world database.
---@field records LightRecord[]
local Light = {}

---@param object GameObject
---@return boolean
function Light.objectIsInstance(object) end
---@param objectOrRecordId any
---@return LightRecord
function Light.record(objectOrRecordId) end
---@class Lockable
local Lockable = {}

---@param object GameObject
---@return MiscellaneousRecord
function Lockable.getKeyRecord(object) end
---@param object GameObject
---@return number
function Lockable.getLockLevel(object) end
---@param object GameObject
---@return Spell
function Lockable.getTrapSpell(object) end
---@param object GameObject
---@return boolean
function Lockable.isLocked(object) end
---@param object GameObject
---@param lockLevel number Level to lock the object at. Optional, if not specified, then 1 will be used, or the previous level if it was locked before.
function Lockable.lock(object, lockLevel) end
---@param object GameObject
---@param miscOrId any {#MiscellaneousRecord} or string misc item id Record ID of the key to use.
function Lockable.setKeyRecord(object, miscOrId) end
---@param object GameObject
---@param spellOrId any {openmw.core#Spell} or string spell id Record ID for the trap to use
function Lockable.setTrapSpell(object, spellOrId) end
---@param object GameObject
function Lockable.unlock(object) end
---@class Lockpick
---{#Item}
---@field baseType Item
---A read-only list of all @{#LockpickRecord}s in the world database.
---@field records LockpickRecord[]
local Lockpick = {}

---@param object GameObject
---@return boolean
function Lockpick.objectIsInstance(object) end
---@param objectOrRecordId any
---@return LockpickRecord
function Lockpick.record(objectOrRecordId) end
---@class Miscellaneous
---{#Item}
---@field baseType Item
---A read-only list of all @{#MiscellaneousRecord}s in the world database.
---@field records MiscellaneousRecord[]
local Miscellaneous = {}

---@param miscellaneous MiscellaneousRecord A Lua table with the fields of a MiscellaneousRecord, with an optional field `template` that accepts a {#MiscellaneousRecord} as a base.
---@return MiscellaneousRecord
function Miscellaneous.createRecordDraft(miscellaneous) end
---@param object GameObject
---@return string
function Miscellaneous.getSoul(object) end
---@param object GameObject
---@return boolean
function Miscellaneous.objectIsInstance(object) end
---@param objectOrRecordId any
---@return MiscellaneousRecord
function Miscellaneous.record(objectOrRecordId) end
---@param object GameObject
---@param soulId string Record ID for the soul of the creature to use
function Miscellaneous.setSoul(object, soulId) end
---@class NPC
---{#Actor}
---@field baseType Actor
---A read-only list of all @{#NpcRecord}s in the world database.
---@field records NpcRecord[]
---@field stats NpcStats
local NPC = {}

---@param actor GameObject NPC object
---@param faction string Faction ID
function NPC.clearExpelled(actor, faction) end
---@param actor GameObject NPC object
---@param faction string Faction ID
function NPC.expell(actor, faction) end
---@param actor GameObject
---@return number
function NPC.getCapacity(actor) end
---@param object GameObject
---@param player GameObject The player that you want to check the disposition for.
---@return number
function NPC.getDisposition(object, player) end
---@param actor GameObject NPC object
---@param faction string Faction ID
---@return number
function NPC.getFactionRank(actor, faction) end
---@param actor GameObject NPC object
---@param faction string Faction ID
---@return number
function NPC.getFactionReputation(actor, faction) end
---@param actor GameObject NPC object
---@return string[]
function NPC.getFactions(actor) end
---@param actor GameObject NPC object
---@param faction string Faction ID
---@return bool
function NPC.isExpelled(actor, faction) end
---@param actor GameObject
---@return boolean
function NPC.isWerewolf(actor) end
---@param actor GameObject NPC object
---@param faction string Faction ID
function NPC.joinFaction(actor, faction) end
---@param actor GameObject NPC object
---@param faction string Faction ID
function NPC.leaveFaction(actor, faction) end
---@param actor GameObject NPC object
---@param faction string Faction ID
---@param value number Rank index (from 1) modifier. If rank reaches 0 for player character, he leaves the faction.
function NPC.modifyFactionRank(actor, faction, value) end
---@param actor GameObject NPC object
---@param faction string Faction ID
---@param value number Reputation modifier value
function NPC.modifyFactionReputation(actor, faction, value) end
---@param object GameObject
---@return boolean
function NPC.objectIsInstance(object) end
---@param objectOrRecordId any
---@return NpcRecord
function NPC.record(objectOrRecordId) end
---@param actor GameObject NPC object
---@param faction string Faction ID
---@param value number Rank index (from 1).
function NPC.setFactionRank(actor, faction, value) end
---@param actor GameObject NPC object
---@param faction string Faction ID
---@param value number Reputation value
function NPC.setFactionReputation(actor, faction, value) end
---@class Player
---Values that can be used with getControlSwitch/setControlSwitch.
---@field CONTROL_SWITCH CONTROL_SWITCH
---{#NPC}
---@field baseType NPC
local Player = {}

---@param player GameObject
---@param key ControlSwitch Control type (see {openmw.types#CONTROL_SWITCH})
---@return boolean
function Player.getControlSwitch(player, key) end
---@param player GameObject
---@return number
function Player.getCrimeLevel(player) end
---@param player GameObject
---@return boolean
function Player.isCharGenFinished(player) end
---@param player GameObject
---@return boolean
function Player.isTeleportingEnabled(player) end
---@param object GameObject
---@return boolean
function Player.objectIsInstance(object) end
---@param player GameObject
---@return PlayerQuest[]
function Player.quests(player) end
---@param player GameObject
---@param key ControlSwitch Control type (see {openmw.types#CONTROL_SWITCH})
---@param value boolean
function Player.setControlSwitch(player, key, value) end
---@param player GameObject
---@param state boolean True to enable teleporting, false to disable.
function Player.setTeleportingEnabled(player, state) end
---@class Potion
---{#Item}
---@field baseType Item
---A read-only list of all @{#PotionRecord}s in the world database.
---@field records PotionRecord[]
local Potion = {}

---@param potion PotionRecord A Lua table with the fields of a PotionRecord, with an optional field `template` that accepts a {#PotionRecord} as a base.
---@return PotionRecord
function Potion.createRecordDraft(potion) end
---@param object GameObject
---@return boolean
function Potion.objectIsInstance(object) end
---@param objectOrRecordId any
---@return PotionRecord
function Potion.record(objectOrRecordId) end
---@class Probe
---{#Item}
---@field baseType Item
---A read-only list of all @{#ProbeRecord}s in the world database.
---@field records ProbeRecord[]
local Probe = {}

---@param object GameObject
---@return boolean
function Probe.objectIsInstance(object) end
---@param objectOrRecordId any
---@return ProbeRecord
function Probe.record(objectOrRecordId) end
---@class Repair
---{#Item}
---@field baseType Item
---A read-only list of all @{#RepairRecord}s in the world database.
---@field records RepairRecord[]
local Repair = {}

---@param object GameObject
---@return boolean
function Repair.objectIsInstance(object) end
---@param objectOrRecordId any
---@return RepairRecord
function Repair.record(objectOrRecordId) end
---@class Static
---A read-only list of all @{#StaticRecord}s in the world database.
---@field records StaticRecord[]
local Static = {}

---@param object GameObject
---@return boolean
function Static.objectIsInstance(object) end
---@param objectOrRecordId any
---@return StaticRecord
function Static.record(objectOrRecordId) end
---@class Weapon
---{#WeaponTYPE}
---@field TYPE WeaponTYPE
---{#Item}
---@field baseType Item
---A read-only list of all @{#WeaponRecord}s in the world database.
---@field records WeaponRecord[]
local Weapon = {}

---@param weapon WeaponRecord A Lua table with the fields of a WeaponRecord, with an optional field `template` that accepts a {#WeaponRecord} as a base.
---@return WeaponRecord
function Weapon.createRecordDraft(weapon) end
---@param object GameObject
---@return boolean
function Weapon.objectIsInstance(object) end
---@param objectOrRecordId any
---@return WeaponRecord
function Weapon.record(objectOrRecordId) end
---@class ActivatorRecord
---Record id
---@field id string
---VFS path to the model
---@field model string
---MWScript on this activator (can be empty)
---@field mwscript string
---Human-readable name
---@field name string
local ActivatorRecord = {}

---@class ActorActiveEffects
---Read-only list of effects currently affecting the actor.
----- print active effects for _, effect in pairs(Actor.activeEffects(self)) do     print('Active Effect: '..effect.id..', attribute='..tostring(effect.affectedAttribute)..', skill='..tostring(effect.affectedSkill)..', magnitude='..tostring(effect.magnitude)) end
local ActorActiveEffects = {}

---@param effectId string effect ID
---@param extraParam string Optional skill or attribute ID
---@return ActiveEffect
function ActorActiveEffects:getEffect(effectId, extraParam) end
---@param value number
---@param effectId string effect ID
---@param extraParam string Optional skill or attribute ID
function ActorActiveEffects:modify(value, effectId, extraParam) end
---@param effectId string effect ID
---@param extraParam string Optional skill or attribute ID
function ActorActiveEffects:remove(effectId, extraParam) end
---@param value number
---@param effectId string effect ID
---@param extraParam string Optional skill or attribute ID
function ActorActiveEffects:set(value, effectId, extraParam) end
---@class ActorActiveSpells
---Read-only list of spells currently affecting the actor.
---Can be iterated over for a list of @{openmw.core#ActiveSpell}
----- print active spells for _, spell in pairs(Actor.activeSpells(self)) do     print('Active Spell: '..tostring(spell)) end
local ActorActiveSpells = {}

---@param recordOrId any record or string record ID of the active spell's source. valid records are {openmw.core#Spell}, {openmw.core#Enchantment}, #IngredientRecord, or #PotionRecord
---@return any
function ActorActiveSpells:isSpellActive(recordOrId) end
---@param spellOrId any {openmw.core#Spell} or string spell id
function ActorActiveSpells:remove(spellOrId) end
---@class ActorSpells
---List of spells with additional functions add/remove/clear (modification are allowed only in global scripts or on self).
----- print available spells local mySpells = types.Actor.spells(self) for _, spell in pairs(mySpells) do print(spell.id) end
local ActorSpells = {}

---@param spellOrId any {openmw.core#Spell} or string spell id
function ActorSpells:add(spellOrId) end
function ActorSpells:clear() end
---@param spellOrId any {openmw.core#Spell} or string spell id
function ActorSpells:remove(spellOrId) end
---@class ActorStats
---@field attributes AttributeStats
---@field dynamic DynamicStats
local ActorStats = {}

---@param actor GameObject
---@return LevelStat
function ActorStats.level(actor) end
---@class ApparatusRecord
---VFS path to the icon
---@field icon string
---The record ID of the apparatus
---@field id string
---VFS path to the model
---@field model string
---MWScript on this apparatus (can be empty)
---@field mwscript string
---The name of the apparatus
---@field name string
---The quality of the apparatus
---@field quality number
---The type of apparatus. See @{#Apparatus.TYPE}
---@field type number
---@field value number
---@field weight number
local ApparatusRecord = {}

---@class ApparatusTYPE
---@field Alembic number
---@field Calcinator number
---@field MortarPestle number
---@field Retort number
---Apparatus.TYPE
local ApparatusTYPE = {}

---@class ArmorRecord
---The base armor rating of this armor
---@field baseArmor number
---The enchantment ID of this armor (can be empty)
---@field enchant string
---@field enchantCapacity number
---@field health number
---VFS path to the icon
---@field icon string
---Record id
---@field id string
---VFS path to the model
---@field model string
---MWScript on this armor (can be empty)
---@field mwscript string
---Human-readable name
---@field name string
---See @{#Armor.TYPE}
---@field type number
---@field value number
---@field weight number
local ArmorRecord = {}

---@class ArmorTYPE
---@field Boots number
---@field Cuirass number
---@field Greaves number
---@field Helmet number
---@field LBracer number
---@field LGauntlet number
---@field LPauldron number
---@field RBracer number
---@field RGauntlet number
---@field RPauldron number
---@field Shield number
---Armor.TYPE
local ArmorTYPE = {}

---@class AttributeStat
---The actor's base attribute value.
---@field base number
---The amount the attribute has been damaged.
---@field damage number
---The actor's current attribute value (read-only.)
---@field modified number
---The attribute's modifier.
---@field modifier number
local AttributeStat = {}

---@class AttributeStats
local AttributeStats = {}

---@param actor GameObject
---@return AttributeStat
function AttributeStats.agility(actor) end
---@param actor GameObject
---@return AttributeStat
function AttributeStats.endurance(actor) end
---@param actor GameObject
---@return AttributeStat
function AttributeStats.intelligence(actor) end
---@param actor GameObject
---@return AttributeStat
function AttributeStats.luck(actor) end
---@param actor GameObject
---@return AttributeStat
function AttributeStats.personality(actor) end
---@param actor GameObject
---@return AttributeStat
function AttributeStats.speed(actor) end
---@param actor GameObject
---@return AttributeStat
function AttributeStats.strength(actor) end
---@param actor GameObject
---@return AttributeStat
function AttributeStats.willpower(actor) end
---@class BookRecord
---The enchantment ID of this book (can be empty)
---@field enchant string
---@field enchantCapacity number
---VFS path to the icon
---@field icon string
---The record ID of the book
---@field id string
---@field isScroll boolean
---VFS path to the model
---@field model string
---MWScript on this book (can be empty)
---@field mwscript string
---Name of the book
---@field name string
---The skill that this book teaches. See @{openmw.core#SKILL}
---@field skill string
---The text content of the book
---@field text string
---@field value number
---@field weight number
local BookRecord = {}

---@class BookSKILL
---"acrobatics"
---@field acrobatics string
---"alchemy"
---@field alchemy string
---"alteration"
---@field alteration string
---"armorer"
---@field armorer string
---"athletics"
---@field athletics string
---"axe"
---@field axe string
---"block"
---@field block string
---"bluntweapon"
---@field bluntWeapon string
---"conjuration"
---@field conjuration string
---"destruction"
---@field destruction string
---"enchant"
---@field enchant string
---"handtohand"
---@field handToHand string
---"heavyarmor"
---@field heavyArmor string
---"illusion"
---@field illusion string
---"lightarmor"
---@field lightArmor string
---"longblade"
---@field longBlade string
---"marksman"
---@field marksman string
---"mediumarmor"
---@field mediumArmor string
---"mercantile"
---@field mercantile string
---"mysticism"
---@field mysticism string
---"restoration"
---@field restoration string
---"security"
---@field security string
---"shortblade"
---@field shortBlade string
---"sneak"
---@field sneak string
---"spear"
---@field spear string
---"speechcraft"
---@field speechcraft string
---"unarmored"
---@field unarmored string
---Book.SKILL
local BookSKILL = {}

---@class CONTROL_SWITCH
---Ability to move
---@field Controls ControlSwitch
---Ability to attack
---@field Fighting ControlSwitch
---Ability to jump
---@field Jumping ControlSwitch
---Ability to change view direction
---@field Looking ControlSwitch
---Ability to use magic
---@field Magic ControlSwitch
---Vanity view if player doesn't touch controls for a long time
---@field VanityMode ControlSwitch
---Ability to toggle 1st/3rd person view
---@field ViewMode ControlSwitch
local CONTROL_SWITCH = {}

---@class ClothingRecord
---The enchantment ID of this clothing (can be empty)
---@field enchant string
---@field enchantCapacity number
---VFS path to the icon
---@field icon string
---Record id
---@field id string
---VFS path to the model
---@field model string
---MWScript on this clothing (can be empty)
---@field mwscript string
---Name of the clothing
---@field name string
---See @{#Clothing.TYPE}
---@field type number
---@field value number
---@field weight number
local ClothingRecord = {}

---@class ClothingTYPE
---@field Amulet number
---@field Belt number
---@field LGlove number
---@field Pants number
---@field RGlove number
---@field Ring number
---@field Robe number
---@field Shirt number
---@field Shoes number
---@field Skirt number
---Clothing.TYPE
local ClothingTYPE = {}

---@class ContainerRecord
---Record id
---@field id string
---VFS path to the model
---@field model string
---MWScript on this container (can be empty)
---@field mwscript string
---Human-readable name
---@field name string
---capacity of this container
---@field weight number
local ContainerRecord = {}

---@class ControlSwitch
---String id of a @{#CONTROL_SWITCH}
local ControlSwitch = {}

---@class CreatureLevelledListRecord
---Calculate from all levels <= player level, not just the closest below player
---@field calculateFromAllLevels boolean
---Chance this list won't spawn anything [0-1]
---@field chanceNone number
---@field creatures LevelledListItem[]
---Record id
---@field id string
local CreatureLevelledListRecord = {}

---@param listRecord CreatureLevelledListRecord The list
---@param MaxLvl number The maximum level to select entries for
---@return string
function CreatureLevelledListRecord.getRandomId(listRecord, MaxLvl) end
---@class CreatureRecord
---Record id of a base creature, which was modified to create this one
---@field baseCreature string
---The base barter gold of the creature
---@field baseGold number
---The record ID of the creature
---@field id string
---VFS path to the creature's model
---@field model string
---@field mwscript string
---@field name string
---The services of the creature, in a table. Value is if the service is provided or not, and they are indexed by: Spells, Spellmaking, Enchanting, Training, Repair, Barter, Weapon, Armor, Clothing, Books, Ingredients, Picks, Probes, Lights, Apparatus, RepairItems, Misc, Potions, MagicItems, Travel.
---@field servicesOffered string[]
---The soul value of the creature record
---@field soulValue number
---The @{#Creature.TYPE} of the creature
---@field type number
local CreatureRecord = {}

---@class CreatureTYPE
---@field Creatures number
---@field Daedra number
---@field Humanoid number
---@field Undead number
---Creature.TYPE
local CreatureTYPE = {}

---@class DoorRecord
---VFS path to the sound of closing
---@field closeSound string
---Record id
---@field id string
---VFS path to the model
---@field model string
---MWScript on this door (can be empty)
---@field mwscript string
---Human-readable name
---@field name string
---VFS path to the sound of opening
---@field openSound string
local DoorRecord = {}

---@class DynamicStat
---@field base number
---@field current number
---@field modifier number
local DynamicStat = {}

---@class DynamicStats
local DynamicStats = {}

---@param actor GameObject
---@return DynamicStat
function DynamicStats.fatigue(actor) end
---@param actor GameObject
---@return DynamicStat
function DynamicStats.health(actor) end
---@param actor GameObject
---@return DynamicStat
function DynamicStats.magicka(actor) end
---@class EQUIPMENT_SLOT
---@field Ammunition number
---@field Amulet number
---@field Belt number
---@field Boots number
---@field CarriedLeft number
---@field CarriedRight number
---@field Cuirass number
---@field Greaves number
---@field Helmet number
---@field LeftGauntlet number
---@field LeftPauldron number
---@field LeftRing number
---@field Pants number
---@field RightGauntlet number
---@field RightPauldron number
---@field RightRing number
---@field Robe number
---@field Shirt number
---@field Skirt number
local EQUIPMENT_SLOT = {}

---@class ESM4DoorRecord
---Record id
---@field id string
---VFS path to the model
---@field model string
---Human-readable name
---@field name string
local ESM4DoorRecord = {}

---@class ESM4TerminalRecord
---Human-readable ID
---@field editorId string
---Record id (Form ID)
---@field id string
---VFS path to the model
---@field model string
---Human-readable name
---@field name string
---Result text of the terminal record
---@field resultText string
---Text body of the terminal record
---@field text string
local ESM4TerminalRecord = {}

---@class EquipmentTable
---Map from values of @{#EQUIPMENT_SLOT} to items @{openmw.core#GameObject}s
local EquipmentTable = {}

---@class IngredientRecord
---The effects (@{#list<openmw.core#MagicEffectWithParams>}) of the ingredient
---@field effects MagicEffectWithParams[]
---VFS path to the icon
---@field icon string
---Record id
---@field id string
---VFS path to the model
---@field model string
---MWScript on this potion (can be empty)
---@field mwscript string
---Human-readable name
---@field name string
---@field value number
---@field weight number
local IngredientRecord = {}

---@class LevelStat
---The actor's current level.
---@field current number
---The NPC's level progress (read-only.)
---@field progress number
local LevelStat = {}

---@class LevelledListItem
---Item id
---@field id string
---The minimum player level at which this item can occur
---@field level number
local LevelledListItem = {}

---@class LightRecord
---@field color number
---@field duration number
---VFS path to the icon
---@field icon string
---Record id
---@field id string
---@field isCarriable boolean
---VFS path to the model
---@field model string
---MWScript on this light (can be empty)
---@field mwscript string
---Human-readable name
---@field name string
---@field radius number
---VFS path to the sound
---@field sound string
---@field value number
---@field weight number
local LightRecord = {}

---@class LockpickRecord
---VFS path to the icon
---@field icon string
---The record ID of the lockpick
---@field id string
---The maximum number of uses of this lockpick
---@field maxCondition number
---VFS path to the model
---@field model string
---MWScript on this lockpick (can be empty)
---@field mwscript string
---The name of the lockpick
---@field name string
---The quality of the lockpick
---@field quality number
---@field value number
---@field weight number
local LockpickRecord = {}

---@class MiscellaneousRecord
---VFS path to the icon
---@field icon string
---The record ID of the miscellaneous item
---@field id string
---@field isKey boolean
---VFS path to the model
---@field model string
---MWScript on this miscellaneous item (can be empty)
---@field mwscript string
---The name of the miscellaneous item
---@field name string
---@field value number
---@field weight number
local MiscellaneousRecord = {}

---@class NpcRecord
---NPC's starting disposition
---@field baseDisposition number
---The base barter gold of the NPC
---@field baseGold number
---Name of the NPC's class (e. g. Acrobat)
---@field class string
---Path to the hair body part model
---@field hair string
---Path to the head body part model
---@field head string
---The record ID of the NPC
---@field id string
---The gender setting of the NPC
---@field isMale bool
---MWScript that is attached to this NPC
---@field mwscript string
---@field name string
---@field race string
---The services of the NPC, in a table. Value is if the service is provided or not, and they are indexed by: Spells, Spellmaking, Enchanting, Training, Repair, Barter, Weapon, Armor, Clothing, Books, Ingredients, Picks, Probes, Lights, Apparatus, RepairItems, Misc, Potions, MagicItems, Travel.
---@field servicesOffered string[]
local NpcRecord = {}

---@class NpcStats
---@field skills SkillStats
local NpcStats = {}

---@class PlayerQuest
---Whether the quest is finished (global and player scripts can change it).
---@field finished bool
---The quest id.
---@field id string
---The quest stage (global and player scripts can change it). Changing the stage starts the quest if it wasn't started.
---@field stage number
---Whether the quest is started.
---@field started bool
local PlayerQuest = {}

---@param stage number Quest stage
---@param actor GameObject (optional) The actor who is the source of the journal entry, it may be used in journal entries with variables such as `%name(The speaker's name)` or `%race(The speaker's race)`.
function PlayerQuest:addJournalEntry(stage, actor) end
---@class PotionRecord
---The effects (@{#list<openmw.core#MagicEffectWithParams>}) of the potion
---@field effects MagicEffectWithParams[]
---VFS path to the icon
---@field icon string
---Record id
---@field id string
---VFS path to the model
---@field model string
---MWScript on this potion (can be empty)
---@field mwscript string
---Human-readable name
---@field name string
---@field value number
---@field weight number
local PotionRecord = {}

---@class ProbeRecord
---VFS path to the icon
---@field icon string
---The record ID of the probe
---@field id string
---The maximum number of uses of this probe
---@field maxCondition number
---VFS path to the model
---@field model string
---MWScript on this probe (can be empty)
---@field mwscript string
---The name of the probe
---@field name string
---The quality of the probe
---@field quality number
---@field value number
---@field weight number
local ProbeRecord = {}

---@class RepairRecord
---VFS path to the icon
---@field icon string
---The record ID of the repair tool
---@field id string
---The maximum number of uses of this repair tool
---@field maxCondition number
---VFS path to the model
---@field model string
---MWScript on this repair tool (can be empty)
---@field mwscript string
---The name of the repair tool
---@field name string
---The quality of the repair tool
---@field quality number
---@field value number
---@field weight number
local RepairRecord = {}

---@class STANCE
---Default stance
---@field Nothing number
---Magic stance
---@field Spell number
---Weapon stance
---@field Weapon number
local STANCE = {}

---@class SkillStat
---The NPC's base skill value.
---@field base number
---The amount the skill has been damaged.
---@field damage number
---The NPC's current skill value (read-only.)
---@field modified number
---The skill's modifier.
---@field modifier number
---[0-1] The NPC's skill progress.
---@field progress number
local SkillStat = {}

---@class SkillStats
local SkillStats = {}

---@param actor GameObject
---@return SkillStat
function SkillStats.acrobatics(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.alchemy(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.alteration(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.armorer(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.athletics(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.axe(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.block(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.bluntweapon(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.conjuration(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.destruction(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.enchant(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.handtohand(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.heavyarmor(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.illusion(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.lightarmor(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.longblade(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.marksman(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.mediumarmor(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.mercantile(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.mysticism(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.restoration(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.security(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.shortblade(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.sneak(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.spear(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.speechcraft(actor) end
---@param actor GameObject
---@return SkillStat
function SkillStats.unarmored(actor) end
---@class StaticRecord
---Record id
---@field id string
---VFS path to the model
---@field model string
local StaticRecord = {}

---@class WeaponRecord
---@field chopMaxDamage number
---@field chopMinDamage number
---@field enchant string
---@field enchantCapacity number
---@field health number
---VFS path to the icon
---@field icon string
---Record id
---@field id string
---@field isMagical boolean
---@field isSilver boolean
---VFS path to the model
---@field model string
---MWScript on this weapon (can be empty)
---@field mwscript string
---Human-readable name
---@field name string
---@field reach number
---@field slashMaxDamage number
---@field slashMinDamage number
---@field speed number
---@field thrustMaxDamage number
---@field thrustMinDamage number
---See @{#Weapon.TYPE}
---@field type number
---@field value number
---@field weight number
local WeaponRecord = {}

---@class WeaponTYPE
---@field Arrow number
---@field AxeOneHand number
---@field AxeTwoHand number
---@field BluntOneHand number
---@field BluntTwoClose number
---@field BluntTwoWide number
---@field Bolt number
---@field LongBladeOneHand number
---@field LongBladeTwoHand number
---@field MarksmanBow number
---@field MarksmanCrossbow number
---@field MarksmanThrown number
---@field ShortBladeOneHand number
---@field SpearTwoWide number
---Weapon.TYPE
local WeaponTYPE = {}

---@class bool
local bool = {}

return types
