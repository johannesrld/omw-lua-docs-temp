---@meta
---`openmw.async` contains timers and coroutine utils.
---All functions require the package itself as a first argument.
---local async = require('openmw.async')


---@class async
local async = {}

---@param func function
---@return Callback
function async:callback(func) end
---@param delay number
---@param callback TimerCallback A callback returned by `registerTimerCallback`
---@param arg any An argument for `callback`; can be `nil`.
function async:newGameTimer(delay, callback, arg) end
---@param delay number
---@param callback TimerCallback A callback returned by `registerTimerCallback`
---@param arg any An argument for `callback`; can be `nil`.
function async:newSimulationTimer(delay, callback, arg) end
---@param delay number
---@param func function
function async:newUnsavableGameTimer(delay, func) end
---@param delay number
---@param func function
function async:newUnsavableSimulationTimer(delay, func) end
---@param name string
---@param func function
---@return TimerCallback
function async:registerTimerCallback(name, func) end
---@class Callback
local Callback = {}

---@class TimerCallback
local TimerCallback = {}

return async
