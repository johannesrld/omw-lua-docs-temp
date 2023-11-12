---@meta
---`openmw.world` is an interface to the game world for global scripts.
---Can not be used from local scripts.
---local world = require('openmw.world')

---@module 'core'

---@class world
---List of currently active actors.
---@field activeActors ObjectList
---List of all cells
---for i, cell in ipairs(world.cells) do print(cell) end
---@field cells Cell[]
---Functions related to MWScript (see @{#MWScriptFunctions}).
---@field mwscript MWScriptFunctions
---List of players.
---Currently (since multiplayer is not yet implemented) always has one element.
---@field players ObjectList
local world = {}

---@param recordId string Record ID in lowercase
---@param count number (optional, 1 by default) The number of objects in stack
---@return GameObject
function world.createObject(recordId, count) end
---@param record any A record to be registered in the database. Must be one of the supported types.
---@return any
function world.createRecord(record) end
---@param cellName string
---@return Cell
function world.getCellByName(cellName) end
---@param gridX number
---@param gridY number
---@param cellOrName any (optional) other cell or cell name in the same exterior world space
---@return Cell
function world.getExteriorCell(gridX, gridY, cellOrName) end
---@return number
function world.getGameTime() end
---@return number
function world.getGameTimeScale() end
---@param formId string String returned by `core.getFormId`
---@return GameObject
function world.getObjectByFormId(formId) end
---@return table
function world.getPausedTags() end
---@return number
function world.getSimulationTime() end
---@return number
function world.getSimulationTimeScale() end
---@return boolean
function world.isWorldPaused() end
---@param tag string (optional, empty string by default) The game will be paused until `unpause` is called with the same tag.
function world.pause(tag) end
---@param ratio number
function world.setGameTimeScale(ratio) end
---@param scale number
function world.setSimulationTimeScale(scale) end
---@param tag string (optional, empty string by default) Needed to undo `pause` called with this tag.
function world.unpause(tag) end
---@class MWScriptFunctions
---Functions related to MWScript.
local MWScriptFunctions = {}

---@param recordId string
---@param player GameObject (optional) Will be used in multiplayer mode to get the script if there is a separate instance for each player. Currently has no effect.
---@return MWScript
---@return nil
function MWScriptFunctions.getGlobalScript(recordId, player) end
---@param player GameObject (optional) Will be used in multiplayer mode to get the globals if there is a separate instance for each player. Currently has no effect.
---@return MWScriptVariables
function MWScriptFunctions.getGlobalVariables(player) end
---@param object GameObject
---@param player GameObject (optional) Will be used in multiplayer mode to get the script if there is a separate instance for each player. Currently has no effect.
---@return MWScript
---@return nil
function MWScriptFunctions.getLocalScript(object, player) end
---@class MWScript
---The object the script is attached to.
---@field object GameObject
---The player the script refers to.
---@field player GameObject
---Id of the script
---@field recordId string
---Local variables of the script (mutable)
---@field variables MWScriptVariables
---for _, script in ipairs(world.mwscript.getLocalScripts(object)) do   -- print the value of local variable 'something' (0 if there is no such variable)   print(script.variables.something)   -- set the variable 'something' (raises an error if there is no such variable)   script.variables.something = 5 end
local MWScript = {}

---@class MWScriptVariables
local MWScriptVariables = {}

return world
