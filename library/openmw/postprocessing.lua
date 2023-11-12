---@meta
---`openmw.postprocessing` is an interface to postprocessing shaders.
---Can be used only by local scripts, that are attached to a player.
---local postprocessing = require('openmw.postprocessing')

---@module 'util'

---@class postprocessing
local postprocessing = {}

---@param name string Name of the shader without its extension
---@return Shader
function postprocessing.load(name) end
---@class Shader
local Shader = {}

function Shader:disable() end
---@param position number optional position to place the shader. If left out the shader will be inserted at the end of the chain.
function Shader:enable(position) end
---@return boolean
function Shader:isEnabled() end
---@param name string Name of uniform
---@param value boolean Value of uniform.
function Shader:setBool(name, value) end
---@param name string Name of uniform
---@param value number Value of uniform.
function Shader:setFloat(name, value) end
---@param name string Name of uniform
---@param array table Contains equal number of #number elements as the uniform array.
function Shader:setFloatArray(name, array) end
---@param name string Name of uniform
---@param value number Value of uniform.
function Shader:setInt(name, value) end
---@param name string Name of uniform
---@param array table Contains equal number of #number elements as the uniform array.
function Shader:setIntArray(name, array) end
---@param name string Name of uniform
---@param value Vector2 Value of uniform.
function Shader:setVector2(name, value) end
---@param name string Name of uniform
---@param array table Contains equal number of {openmw.util#Vector2} elements as the uniform array.
function Shader:setVector2Array(name, array) end
---@param name string Name of uniform
---@param value Vector3 Value of uniform.
function Shader:setVector3(name, value) end
---@param name string Name of uniform
---@param array table Contains equal number of {openmw.util#Vector3} elements as the uniform array.
function Shader:setVector3Array(name, array) end
---@param name string Name of uniform
---@param value Vector4 Value of uniform.
function Shader:setVector4(name, value) end
---@param name string Name of uniform
---@param array table Contains equal number of {openmw.util#Vector4} elements as the uniform array.
function Shader:setVector4Array(name, array) end
return postprocessing
