---@meta
---`openmw.core` defines functions and types that are available in both local and global scripts.
---local core = require('openmw.core')

---@module 'util'

---@class core
---The revision of OpenMW Lua API.
---It is an integer that is incremented every time the API is changed. See the actual value at the top of the page.
---@field API_REVISION number
---{#ContentFiles}: functions working with the list of currently loaded content files.
---@field contentFiles ContentFiles
---A read-only list of all @{#FactionRecord}s in the world database.
---@field factions FactionRecord[]
---{#Magic}: spells and spell effects
---@field magic Magic
---{#Sound}: Sounds and Speech
---@field sound Sound
---{#Stats}: stats
---@field stats Stats
local core = {}

---@param contentFile string
---@param index number
---@return string
function core.getFormId(contentFile, index) end
---@param setting string Setting name
---@return any
function core.getGMST(setting) end
---@return number
function core.getGameTime() end
---@return number
function core.getGameTimeScale() end
---@return number
function core.getRealTime() end
---@return number
function core.getSimulationTime() end
---@return number
function core.getSimulationTimeScale() end
---@return boolean
function core.isWorldPaused() end
---@param context string l10n context; recommended to use the name of the mod.<br>               This must match the <ContextName> directory in the VFS which stores the localisation files.
---@param fallbackLocale string The source locale containing the default messages<br>                              If omitted defaults to "en".
---@return function
function core.l10n(context, fallbackLocale) end
function core.quit() end
---@param eventName string
---@param eventData any
function core.sendGlobalEvent(eventName, eventData) end
---@class ContentFiles
---The current load order (list of content file names).
---@field list string[]
---Functions working with the list of currently loaded content files.
local ContentFiles = {}

---@param contentFile string
---@return boolean
function ContentFiles.has(contentFile) end
---@param contentFile string
---@return number
function ContentFiles.indexOf(contentFile) end
---@class Magic
---Possible @{#MagicEffectId} values
---@field EFFECT_TYPE MagicEffectId
---Possible @{#EnchantmentType} values
---@field ENCHANTMENT_TYPE EnchantmentType
---Possible @{#SpellRange} values
---@field RANGE SpellRange
---Possible @{#SpellType} values
---@field SPELL_TYPE SpellType
---Map from @{#MagicEffectId} to @{#MagicEffect}
----- Print all harmful effects for _, effect in pairs(core.magic.effects) do     if effect.harmful then         print(effect.name)     end end
---@field effects table<any, MagicEffect>
---List of all @{#Enchantment}s.
---local enchantment = core.magic.enchantments['marara's boon']  -- get by id
---@field enchantments Enchantment[]
---List of all @{#Spell}s.
---local spell = core.magic.spells['thunder fist']  -- get by id
---@field spells Spell[]
local Magic = {}

---@class Sound
---List of all @{#SoundRecord}s.
---local sound = core.sound.sounds['Ashstorm']  -- get by id
---@field sounds SoundRecord[]
local Sound = {}

---@return boolean
function Sound.isEnabled() end
---@param object GameObject Object on which we want to check an animated voiceover (optional)
---@return boolean
function Sound.isSayActive(object) end
---@param fileName string Path to sound file in VFS
---@param object GameObject Object on which we want to check sound
---@return boolean
function Sound.isSoundFilePlaying(fileName, object) end
---@param soundId string ID of Sound record to check
---@param object GameObject Object on which we want to check sound
---@return boolean
function Sound.isSoundPlaying(soundId, object) end
---@param soundId string ID of Sound record to play
---@param object GameObject Object to which we attach the sound
---@param options table An optional table with additional optional arguments. Can contain:<br><br>  * `timeOffset` - a floating point number >= 0, to some time (in second) from beginning of sound file (default: 0);<br>  * `volume` - a floating point number >= 0, to set a sound volume (default: 1);<br>  * `pitch` - a floating point number >= 0, to set a sound pitch (default: 1);<br>  * `loop` - a boolean, to set if sound should be repeated when it ends (default: false);
function Sound.playSound3d(soundId, object, options) end
---@param fileName string Path to sound file in VFS
---@param object GameObject Object to which we attach the sound
---@param options table An optional table with additional optional arguments. Can contain:<br><br>  * `timeOffset` - a floating point number >= 0, to some time (in second) from beginning of sound file (default: 0);<br>  * `volume` - a floating point number >= 0, to set a sound volume (default: 1);<br>  * `pitch` - a floating point number >= 0, to set a sound pitch (default: 1);<br>  * `loop` - a boolean, to set if sound should be repeated when it ends (default: false);
function Sound.playSoundFile3d(fileName, object, options) end
---@param fileName string Path to sound file in VFS
---@param object GameObject Object on which we want to play an animated voiceover (optional)
---@param text string Subtitle text (optional)
function Sound.say(fileName, object, text) end
---@param fileName string Path to sound file in VFS
---@param object GameObject Object on which we want to stop an animated voiceover (optional)
function Sound.stopSay(fileName, object) end
---@param soundId string ID of Sound record to stop
---@param object GameObject Object on which we want to stop sound
function Sound.stopSound3d(soundId, object) end
---@param fileName string Path to sound file in VFS
---@param object GameObject Object on which we want to stop sound
function Sound.stopSoundFile3d(fileName, object) end
---@class Stats
---{#Attribute} functions
---@field Attribute Attribute
---{#Skill} functions
---@field Skill Skill
local Stats = {}

---@class ActiveEffect
---Optional attribute ID
---@field affectedAttribute string
---Optional skill ID
---@field affectedSkill string
---Effect id string
---@field id string
---current magnitude of the effect. Will be set to 0 when effect is removed or expires.
---@field magnitude number
---@field magnitudeBase number
---@field magnitudeModifier number
---Localized name of the effect
---@field name string
local ActiveEffect = {}

---@class ActiveSpell
---The caster object, or nil if the spell has no defined caster
---@field caster GameObject
---The active effects (@{#ActiveSpellEffect}) of this spell.
---@field effects ActiveSpellEffect[]
---Record id of the spell or item used to cast the spell
---@field id string
---The enchanted item used to cast the spell, or nil if the spell was not cast from an enchanted item. Note that if the spell was cast for a single-use enchantment such as a scroll, this will be nil.
---@field item GameObject
---The spell or item display name
---@field name string
local ActiveSpell = {}

---@class ActiveSpellEffect
---Optional attribute ID
---@field affectedAttribute string
---Optional skill ID
---@field affectedSkill string
---Total duration in seconds of this spell effect, should not be confused with remaining duration. Or nil if the effect is not temporary.
---@field duration number
---Remaining duration in seconds of this spell effect, or nil if the effect is not temporary.
---@field durationLeft number
---Magic effect id
---@field id string
---The magnitude of the effect in the current frame. This will be a new random number between minMagnitude and maxMagnitude every frame. Or nil if the effect has no magnitude.
---@field magnitudeThisFrame number
---The maximum magnitude of this effect, or nil if the effect has no magnitude.
---@field maxMagnitude number
---The minimum magnitude of this effect, or nil if the effect has no magnitude.
---@field minMagnitude number
---Localized name of the effect
---@field name string
local ActiveSpellEffect = {}

---@class Attribute
---A read-only list of all @{#AttributeRecord}s in the world database.
---@field records AttributeRecord[]
---`core.stats.Attribute`
local Attribute = {}

---@param recordId string
---@return AttributeRecord
function Attribute.record(recordId) end
---@class AttributeRecord
---Human-readable description
---@field description string
---VFS path to the icon
---@field icon string
---Record id
---@field id string
---Human-readable name
---@field name string
local AttributeRecord = {}

---@class Cell
---Index of the cell by X (only for exteriors).
---@field gridX number
---Index of the cell by Y (only for exteriors).
---@field gridY number
---True if in this cell sky should be rendered.
---@field hasSky boolean
---True if the cell contains water.
---@field hasWater boolean
---Whether the cell is an exterior cell. "Exterior" means grid of cells where the player can seamless walk from one cell to another without teleports. QuasiExterior (interior with sky) is not an exterior.
---@field isExterior boolean
---(DEPRECATED, use `hasTag("QuasiExterior")`) Whether the cell is a quasi exterior (like interior but with the sky and the wheather).
---@field isQuasiExterior boolean
---Name of the cell (can be empty string).
---@field name string
---Region of the cell.
---@field region string
---Id of the world space.
---@field worldSpaceId string
---A cell of the game world.
local Cell = {}

---@param type any (optional) object type (see {openmw.types#types})
---@return ObjectList
function Cell:getAll(type) end
---@param tag string One of "QuasiExterior", "NoSleep".
---@return boolean
function Cell:hasTag(tag) end
---@param object GameObject
---@return boolean
function Cell:isInSameSpace(object) end
---@class Enchantment
---If set, the casting cost should be computer rather than reading the cost field
---@field autocalcFlag number
---Charge capacity. Should not be confused with current charge.
---@field charge number
---@field cost number
---The effects (@{#MagicEffectWithParams}) of the enchantment
---@field effects MagicEffectWithParams[]
---Enchantment id
---@field id string
---{#EnchantmentType}
---@field type number
----- Getting the enchantment of an arbitrary item, if it has one local function getRecord(item)     if item.type and item.type.record then         return item.type.record(item)     end     return nil end local function getEnchantment(item)     local record = getRecord(item)     if record and record.enchant then         return core.magic.enchantments[record.enchant]     end     return nil end
local Enchantment = {}

---@class EnchantmentType
---Enchantment is cast on strike, if there is enough charge.
---@field CastOnStrike number
---Enchantment is cast when used, if there is enough charge.
---@field CastOnUse number
---Enchantment can be cast once, destroying the enchanted item.
---@field CastOnce number
---Enchantment is always active when equipped.
---@field ConstantEffect number
---`core.magic.ENCHANTMENT_TYPE`
local EnchantmentType = {}

---@class FactionRank
---Attributes values required to get this rank.
---@field attributeValues number[]
---Reaction of faction members if player is in this faction.
---@field factionReaction number
---Secondary skill value required to get this rank.
---@field favouredSkillValue number
---Faction name Rank display name
---@field name string
---Primary skill value required to get this rank.
---@field primarySkillValue number
---Faction rank data record
local FactionRank = {}

---@class FactionRecord
---A read-only list containing IDs of attributes to advance ranks in the faction.
---@field attributes string[]
---Faction id
---@field id string
---Faction name
---@field name string
---A read-only list containing data for all ranks in the faction, in order.
---@field ranks FactionRank[]
---A read-only map containing reactions of other factions to this faction.
---@field reactions table<any, number>
---A read-only list containing IDs of skills to advance ranks in the faction.
---@field skills string[]
---Faction data record
local FactionRecord = {}

---@class GameObject
---The cell where the object currently is. During loading a game and for objects in an inventory or a container `cell` is nil.
---@field cell Cell
---Lower cased file name of the content file that defines this object; nil for dynamically created objects.
---@field contentFile string
---Count (>1 means a stack of objects).
---@field count number
---Whether the object is enabled or disabled. Global scripts can set the value. Items in containers or inventories can't be disabled.
---@field enabled boolean
---Global Variable associated with this object(read only).
---@field globalVariable string
---A unique id of this object (not record id), can be used as a key in a table.
---@field id string
---Faction who owns the object (nil if missing). Global and self scripts can set the value.
---@field ownerFactionId string
---Rank required to be allowed to pick up the object. Global and self scripts can set the value.
---@field ownerFactionRank number
---NPC who owns the object (nil if missing). Global and self scripts can set the value.
---@field ownerRecordId string
---Container or actor that contains (or has in inventory) this object. It is nil if the object is in a cell.
---@field parentContainer GameObject
---Object position.
---@field position Vector3
---Returns record ID of the object in lowercase.
---@field recordId string
---Object rotation.
---@field rotation Transform
---Object scale.
---@field scale number
---The object original position
---@field startingPosition Vector3
---The object original rotation
---@field startingRotation Transform
---Type of the object (one of the tables from the package @{openmw.types#types}).
---@field type any
---Any object that exists in the game world and has a specific location.
---Player, actors, items, and statics are game objects.
local GameObject = {}

---@param actor GameObject The actor who activates the object
function GameObject:activateBy(actor) end
---@param scriptPath string Path to the script in OpenMW virtual filesystem.
---@param initData table (optional) Initialization data to be passed to onInit. If missed then Lua initialization data from content files will be used (if exists for this script).
function GameObject:addScript(scriptPath, initData) end
---@return Box
function GameObject:getBoundingBox() end
---@param scriptPath string Path to the script in OpenMW virtual filesystem.
---@return boolean
function GameObject:hasScript(scriptPath) end
---@return boolean
function GameObject:isValid() end
---@param dest any {#Inventory} or {#GameObject}
function GameObject:moveInto(dest) end
---@param count number (optional) the number of items to remove (if not specified then the whole stack)
function GameObject:remove(count) end
---@param scriptPath string Path to the script in OpenMW virtual filesystem.
function GameObject:removeScript(scriptPath) end
---@param eventName string
---@param eventData any
function GameObject:sendEvent(eventName, eventData) end
---@param scale number Scale desired in game.
function GameObject:setScale(scale) end
---@param count number The number of items to return.
function GameObject:split(count) end
---@param cellOrName any A cell to define the destination worldspace; can be either #Cell, or cell name, or an empty string (empty string means the default exterior worldspace).<br>If the worldspace has multiple cells (i.e. an exterior), the destination cell is calculated using `position`.
---@param position Vector3 New position.
---@param options TeleportOptions (optional) Either table {#TeleportOptions} or {openmw.util#Transform} rotation.
function GameObject:teleport(cellOrName, position, options) end
---@class Inventory
---Inventory of a player/NPC or a content of a container.
local Inventory = {}

---@param recordId string
---@return number
function Inventory:countOf(recordId) end
---@param recordId string
---@return GameObject
function Inventory:find(recordId) end
---@param recordId string
---@return ObjectList
function Inventory:findAll(recordId) end
---@param type any (optional) items type (see {openmw.types#types})
---@return ObjectList
function Inventory:getAll(type) end
---@return boolean
function Inventory:isResolved() end
function Inventory:resolve() end
---@class MagicEffect
---@field baseCost number
---@field color Color
---@field harmful boolean
---Effect Icon Path
---@field icon string
---Effect ID
---@field id string
---Localized name of the effect
---@field name string
---Skill ID that is this effect's school
---@field school string
local MagicEffect = {}

---@class MagicEffectId
---"absorbattribute"
---@field AbsorbAttribute number
---"absorbfatigue"
---@field AbsorbFatigue number
---"absorbhealth"
---@field AbsorbHealth number
---"absorbmagicka"
---@field AbsorbMagicka number
---"absorbskill"
---@field AbsorbSkill number
---"almsiviintervention"
---@field AlmsiviIntervention number
---"blind"
---@field Blind number
---"boundbattleaxe"
---@field BoundBattleAxe number
---"boundboots"
---@field BoundBoots number
---"boundcuirass"
---@field BoundCuirass number
---"bounddagger"
---@field BoundDagger number
---"boundgloves"
---@field BoundGloves number
---"boundhelm"
---@field BoundHelm number
---"boundlongbow"
---@field BoundLongbow number
---"boundlongsword"
---@field BoundLongsword number
---"boundmace"
---@field BoundMace number
---"boundshield"
---@field BoundShield number
---"boundspear"
---@field BoundSpear number
---"burden"
---@field Burden number
---"calmcreature"
---@field CalmCreature number
---"calmhumanoid"
---@field CalmHumanoid number
---"chameleon"
---@field Chameleon number
---"charm"
---@field Charm number
---"commandcreature"
---@field CommandCreature number
---"commandhumanoid"
---@field CommandHumanoid number
---"corprus"
---@field Corprus number
---"cureblightdisease"
---@field CureBlightDisease number
---"curecommondisease"
---@field CureCommonDisease number
---"curecorprusdisease"
---@field CureCorprusDisease number
---"cureparalyzation"
---@field CureParalyzation number
---"curepoison"
---@field CurePoison number
---"damageattribute"
---@field DamageAttribute number
---"damagefatigue"
---@field DamageFatigue number
---"damagehealth"
---@field DamageHealth number
---"damagemagicka"
---@field DamageMagicka number
---"damageskill"
---@field DamageSkill number
---"demoralizecreature"
---@field DemoralizeCreature number
---"demoralizehumanoid"
---@field DemoralizeHumanoid number
---"detectanimal"
---@field DetectAnimal number
---"detectenchantment"
---@field DetectEnchantment number
---"detectkey"
---@field DetectKey number
---"disintegratearmor"
---@field DisintegrateArmor number
---"disintegrateweapon"
---@field DisintegrateWeapon number
---"dispel"
---@field Dispel number
---"divineintervention"
---@field DivineIntervention number
---"drainattribute"
---@field DrainAttribute number
---"drainfatigue"
---@field DrainFatigue number
---"drainhealth"
---@field DrainHealth number
---"drainmagicka"
---@field DrainMagicka number
---"drainskill"
---@field DrainSkill number
---"extraspell"
---@field ExtraSpell number
---"feather"
---@field Feather number
---"firedamage"
---@field FireDamage number
---"fireshield"
---@field FireShield number
---"fortifyattack"
---@field FortifyAttack number
---"fortifyattribute"
---@field FortifyAttribute number
---"fortifyfatigue"
---@field FortifyFatigue number
---"fortifyhealth"
---@field FortifyHealth number
---"fortifymagicka"
---@field FortifyMagicka number
---"fortifymaximummagicka"
---@field FortifyMaximumMagicka number
---"fortifyskill"
---@field FortifySkill number
---"frenzycreature"
---@field FrenzyCreature number
---"frenzyhumanoid"
---@field FrenzyHumanoid number
---"frostdamage"
---@field FrostDamage number
---"frostshield"
---@field FrostShield number
---"invisibility"
---@field Invisibility number
---"jump"
---@field Jump number
---"levitate"
---@field Levitate number
---"light"
---@field Light number
---"lightningshield"
---@field LightningShield number
---"lock"
---@field Lock number
---"mark"
---@field Mark number
---"nighteye"
---@field NightEye number
---"open"
---@field Open number
---"paralyze"
---@field Paralyze number
---"poison"
---@field Poison number
---"rallycreature"
---@field RallyCreature number
---"rallyhumanoid"
---@field RallyHumanoid number
---"recall"
---@field Recall number
---"reflect"
---@field Reflect number
---"removecurse"
---@field RemoveCurse number
---"resistblightdisease"
---@field ResistBlightDisease number
---"resistcommondisease"
---@field ResistCommonDisease number
---"resistcorprusdisease"
---@field ResistCorprusDisease number
---"resistfire"
---@field ResistFire number
---"resistfrost"
---@field ResistFrost number
---"resistmagicka"
---@field ResistMagicka number
---"resistnormalweapons"
---@field ResistNormalWeapons number
---"resistparalysis"
---@field ResistParalysis number
---"resistpoison"
---@field ResistPoison number
---"resistshock"
---@field ResistShock number
---"restoreattribute"
---@field RestoreAttribute number
---"restorefatigue"
---@field RestoreFatigue number
---"restorehealth"
---@field RestoreHealth number
---"restoremagicka"
---@field RestoreMagicka number
---"restoreskill"
---@field RestoreSkill number
---"sanctuary"
---@field Sanctuary number
---"shield"
---@field Shield number
---"shockdamage"
---@field ShockDamage number
---"silence"
---@field Silence number
---"slowfall"
---@field SlowFall number
---"soultrap"
---@field Soultrap number
---"sound"
---@field Sound number
---"spellabsorption"
---@field SpellAbsorption number
---"stuntedmagicka"
---@field StuntedMagicka number
---"summonancestralghost"
---@field SummonAncestralGhost number
---"summonbear"
---@field SummonBear number
---"summonbonelord"
---@field SummonBonelord number
---"summonbonewalker"
---@field SummonBonewalker number
---"summonbonewolf"
---@field SummonBonewolf number
---"summoncenturionsphere"
---@field SummonCenturionSphere number
---"summonclannfear"
---@field SummonClannfear number
---"summoncreature04"
---@field SummonCreature04 number
---"summoncreature05"
---@field SummonCreature05 number
---"summondaedroth"
---@field SummonDaedroth number
---"summondremora"
---@field SummonDremora number
---"summonfabricant"
---@field SummonFabricant number
---"summonflameatronach"
---@field SummonFlameAtronach number
---"summonfrostatronach"
---@field SummonFrostAtronach number
---"summongoldensaint"
---@field SummonGoldenSaint number
---"summongreaterbonewalker"
---@field SummonGreaterBonewalker number
---"summonhunger"
---@field SummonHunger number
---"summonscamp"
---@field SummonScamp number
---"summonskeletalminion"
---@field SummonSkeletalMinion number
---"summonstormatronach"
---@field SummonStormAtronach number
---"summonwingedtwilight"
---@field SummonWingedTwilight number
---"summonwolf"
---@field SummonWolf number
---"sundamage"
---@field SunDamage number
---"swiftswim"
---@field SwiftSwim number
---"telekinesis"
---@field Telekinesis number
---"turnundead"
---@field TurnUndead number
---"vampirism"
---@field Vampirism number
---"waterbreathing"
---@field WaterBreathing number
---"waterwalking"
---@field WaterWalking number
---"weaknesstoblightdisease"
---@field WeaknessToBlightDisease number
---"weaknesstocommondisease"
---@field WeaknessToCommonDisease number
---"weaknesstocorprusdisease"
---@field WeaknessToCorprusDisease number
---"weaknesstofire"
---@field WeaknessToFire number
---"weaknesstofrost"
---@field WeaknessToFrost number
---"weaknesstomagicka"
---@field WeaknessToMagicka number
---"weaknesstonormalweapons"
---@field WeaknessToNormalWeapons number
---"weaknesstopoison"
---@field WeaknessToPoison number
---"weaknesstoshock"
---@field WeaknessToShock number
---`core.magic.EFFECT_TYPE`
local MagicEffectId = {}

---@class MagicEffectWithParams
---Optional attribute ID
---@field affectedAttribute string
---Optional skill ID
---@field affectedSkill string
---@field area number
---@field duration number
---{#MagicEffect}
---@field effect MagicEffect
---@field magnitudeMax number
---@field magnitudeMin number
---@field range number
local MagicEffectWithParams = {}

---@class MagicSchoolData
local MagicSchoolData = {}

---@class ObjectList
---List of GameObjects.
---Implements [iterables#List](iterables.html#List) of #GameObject
local ObjectList = {}

---@class Skill
---A read-only list of all @{#SkillRecord}s in the world database.
---@field records SkillRecord[]
---`core.stats.Skill`
local Skill = {}

---@param recordId string
---@return SkillRecord
function Skill.record(recordId) end
---@class SkillRecord
---The id of the skill's governing attribute
---@field attribute string
---Human-readable description
---@field description string
---VFS path to the icon
---@field icon string
---Record id
---@field id string
---Human-readable name
---@field name string
---Optional magic school
---@field school MagicSchoolData
local SkillRecord = {}

---@class SoundRecord
---Normalized path to sound file in VFS
---@field fileName string
---Sound id
---@field id string
---Raw maximal range value, from 0 to 255
---@field maxRange number
---Raw minimal range value, from 0 to 255
---@field minRange number
---Raw sound volume, from 0 to 255
---@field volume number
local SoundRecord = {}

---@class Spell
---@field cost number
---The effects (@{#MagicEffectWithParams}) of the spell
---@field effects MagicEffectWithParams[]
---Spell id
---@field id string
---Spell name
---@field name string
---{#SpellType}
---@field type number
local Spell = {}

---@class SpellRange
---Applied on self
---@field Self number
---Ranged spell
---@field Target number
---On touch
---@field Touch number
---`core.magic.RANGE`
local SpellRange = {}

---@class SpellType
---Innate ability, always in effect
---@field Ability number
---Blight disease
---@field Blight number
---Curse
---@field Curse number
---Common disease
---@field Disease number
---Power, can be used once a day
---@field Power number
---Normal spell, must be cast and costs mana
---@field Spell number
---`core.magic.SPELL_TYPE`
local SpellType = {}

---@class TeleportOptions
---If true, adjust destination position to the ground.
---@field onGround boolean
---New rotation; if missing, then the current rotation is used.
---@field rotation Transform
---Either table with options or @{openmw.util#Vector3} rotation.
local TeleportOptions = {}

return core
