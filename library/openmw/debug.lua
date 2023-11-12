---@meta
---`openmw.debug` is an interface to the engine debug utils.
---Can be used only by local scripts, that are attached to a player.
---local debug = require('openmw.debug')


---@class Debug
---Navigation mesh rendering mode values
---@field NAV_MESH_RENDER_MODE NAV_MESH_RENDER_MODE
---Rendering mode values
---@field RENDER_MODE RENDER_MODE
local Debug = {}

---@return boolean
function Debug.isAIEnabled() end
---@return boolean
function Debug.isCollisionEnabled() end
---@return boolean
function Debug.isGodMode() end
---@return boolean
function Debug.isMWScriptEnabled() end
function Debug.reloadLua() end
---@param value NAV_MESH_RENDER_MODE
function Debug.setNavMeshRenderMode(value) end
---@param value bool
function Debug.setShaderHotReloadEnabled(value) end
function Debug.toggleAI() end
function Debug.toggleCollision() end
function Debug.toggleGodMode() end
function Debug.toggleMWScript() end
---@param value RENDER_MODE
function Debug.toggleRenderMode(value) end
function Debug.triggerShaderReload() end
---@class NAV_MESH_RENDER_MODE
---@field AreaType number
---@field UpdateFrequency number
---Navigation mesh rendering modes
local NAV_MESH_RENDER_MODE = {}

---@class RENDER_MODE
---@field ActorsPaths number
---@field CollisionDebug number
---@field NavMesh number
---@field Pathgrid number
---@field RecastMesh number
---@field Scene number
---@field Water number
---@field Wireframe number
---Rendering modes
local RENDER_MODE = {}

---@class bool
local bool = {}

return Debug
