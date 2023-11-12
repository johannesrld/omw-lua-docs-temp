---@meta
---`openmw.vfs` provides read-only access to data directories via VFS.
---Interface is very similar to "io" library.
---local vfs = require('openmw.vfs')


---@class vfs
local vfs = {}

---@param fileName string Path to file in VFS
---@return boolean
function vfs.fileExists(fileName) end
---@param fileName string Path to file in VFS
---@return function
function vfs.lines(fileName) end
---@param fileName string Path to file in VFS
---@return FileHandle
---@return nil
---@return string
function vfs.open(fileName) end
---@param path string Path prefix
---@return function
function vfs.pathsWithPrefix(path) end
---@param handle any Object to check
---@return string
function vfs.type(handle) end
---@class FileHandle
---VFS path to related file
---@field fileName string
local FileHandle = {}

---@return boolean
---@return nil
---@return string
function FileHandle:close() end
---@return function
function FileHandle:lines() end
---@param ... any Read formats (up to 20 arguments, default value is one "*l"). Can be:<br><br>  * "\*a" (or "*all") - reads the whole file, starting at the current position as #string. On end of file, it returns the empty string.<br>  * "\*l" (or "*line") - reads the next line (skipping the end of line), returning nil on end of file (nil and error message if error occured);<br>  * "\*n" (or "*number") - read a floating point value as #number (nil and error message if error occured);<br>  * number - reads a #string with up to this number of characters, returning nil on end of file (nil and error message if error occured). If number is 0 and end of file is not reached, it reads nothing and returns an empty string;
---@return string
function FileHandle:read(...) end
---@param whence string Seek base (optional, "cur" by default). Can be:<br><br>  * "set" - seek from beginning of file;<br>  * "cur" - seek from current position;<br>  * "end" - seek from end of file (offset needs to be <= 0);
---@param offset number Offset from given base (optional, 0 by default)
---@return number
---@return nil
---@return string
function FileHandle:seek(whence, offset) end
return vfs
