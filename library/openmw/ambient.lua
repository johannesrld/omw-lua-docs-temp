---@meta
---`openmw.ambient` controls background sounds, specific to given player (2D-sounds).
---Can be used only by local scripts, that are attached to a player.
---local ambient = require('openmw.ambient')


---@class ambient
local ambient = {}

---@return boolean
function ambient.isMusicPlaying() end
---@param fileName string Path to sound file in VFS
---@return boolean
function ambient.isSoundFilePlaying(fileName) end
---@param soundId string ID of Sound record to check
---@return boolean
function ambient.isSoundPlaying(soundId) end
---@param soundId string ID of Sound record to play
---@param options table An optional table with additional optional arguments. Can contain:<br><br>  * `timeOffset` - a floating point number >= 0, to some time (in second) from beginning of sound file (default: 0);<br>  * `volume` - a floating point number >= 0, to set a sound volume (default: 1);<br>  * `pitch` - a floating point number >= 0, to set a sound pitch (default: 1);<br>  * `scale` - a boolean, to set if sound pitch should be scaled by simulation time scaling (default: true);<br>  * `loop` - a boolean, to set if sound should be repeated when it ends (default: false);
function ambient.playSound(soundId, options) end
---@param fileName string Path to sound file in VFS
---@param options table An optional table with additional optional arguments. Can contain:<br><br>  * `timeOffset` - a floating point number >= 0, to some time (in second) from beginning of sound file (default: 0);<br>  * `volume` - a floating point number >= 0, to set a sound volume (default: 1);<br>  * `pitch` - a floating point number >= 0, to set a sound pitch (default: 1);<br>  * `scale` - a boolean, to set if sound pitch should be scaled by simulation time scaling (default: true);<br>  * `loop` - a boolean, to set if sound should be repeated when it ends (default: false);
function ambient.playSoundFile(fileName, options) end
function ambient.stopMusic() end
---@param soundId string ID of Sound record to stop
function ambient.stopSound(soundId) end
---@param fileName string Path to sound file in VFS
function ambient.stopSoundFile(fileName) end
---@param fileName string Path to file in VFS
function ambient.streamMusic(fileName) end
return ambient
