---@meta
---`openmw.util` defines utility functions and classes like 3D vectors, that don't depend on the game world.
---local util = require('openmw.util')


---@class util
---Methods for creating #Color values from different formats.
---@field color COLOR
---3D transforms (scale/move/rotate) that can be applied to 3D vectors.
---Several transforms can be combined and applied to a vector using multiplication. Combined transforms apply in reverse order (from right to left).
---local util = require('openmw.util') local trans = util.transform local fromActorSpace = trans.move(actor.position) * trans.rotateZ(actor.rotation:getYaw())  -- rotation is applied first, movement is second local posBehindActor = fromActorSpace * util.vector3(0, -100, 0)  -- equivalent to trans.rotateZ(-actor.rotation:getYaw()) * trans.move(-actor.position) local toActorSpace = fromActorSpace:inverse() local relativeTargetPos = toActorSpace * target.position local deltaAngle = math.atan2(relativeTargetPos.y, relativeTargetPos.x)
---@field transform TRANSFORM
local util = {}

---@param A number First argument (integer).
---@param B number Second argument (integer).
---@return number
function util.bitAnd(A, B) end
---@param A number Argument (integer).
---@return number
function util.bitNot(A) end
---@param A number First argument (integer).
---@param B number Second argument (integer).
---@return number
function util.bitOr(A, B) end
---@param A number First argument (integer).
---@param B number Second argument (integer).
---@return number
function util.bitXor(A, B) end
---@param transform Transform A transformation which encapsulates the boxes center pointer (translation), half sizes (scale), and rotation.
---@return Box
function util.box(transform) end
---@param value number
---@param from number
---@param to number
---@return number
function util.clamp(value, from, to) end
---@param code string Lua code.
---@param table table Environment to run the code in.
---@return function
function util.loadCode(code, table) end
---@param table table Any table.
---@return table
function util.makeReadOnly(table) end
---@param table table Any table.
---@return table
function util.makeStrictReadOnly(table) end
---@param angle number Angle in radians
---@return number
function util.normalizeAngle(angle) end
---@param value number
---@param min number
---@param max number
---@param newMin number
---@param newMax number
---@return number
function util.remap(value, min, max, newMin, newMax) end
---@param value number
---@return number
function util.round(value) end
---@param x number
---@param y number
---@return Vector2
function util.vector2(x, y) end
---@param x number
---@param y number
---@param z number
---@return Vector3
function util.vector3(x, y, z) end
---@param x number
---@param y number
---@param z number
---@param w number
---@return Vector4
function util.vector4(x, y, z, w) end
---@class COLOR
---Methods for creating #Color values from different formats.
local COLOR = {}

---@param hex string A hex color string in RRGGBB format (e. g. "ff0000").
---@return Color
function COLOR.hex(hex) end
---@param r number
---@param g number
---@param b number
---@return Color
function COLOR.rgb(r, g, b) end
---@param r number
---@param g number
---@param b number
---@param a number
---@return Color
function COLOR.rgba(r, g, b, a) end
---@class TRANSFORM
---Empty transform.
---@field identity Transform
local TRANSFORM = {}

---@param offset Vector3
---@return Transform
function TRANSFORM.move(offset) end
---@param angle number
---@param axis Vector3
---@return Transform
function TRANSFORM.rotate(angle, axis) end
---@param angle number
---@return Transform
function TRANSFORM.rotateX(angle) end
---@param angle number
---@return Transform
function TRANSFORM.rotateY(angle) end
---@param angle number
---@return Transform
function TRANSFORM.rotateZ(angle) end
---@param scaleX number
---@param scaleY number
---@param scaleZ number
---@return Transform
function TRANSFORM.scale(scaleX, scaleY, scaleZ) end
---@class Box
---The center of the box
---@field center Vector3
---The half sizes of the box along each axis
---@field halfSize Vector3
---A transformation which encapsulates the boxes center pointer (translation), half sizes (scale), and rotation.
---@field transform Transform
---Table of the 8 vertices which comprise the box, taking rotation into account
---@field vertices table
---Immutable box.
local Box = {}

---@class Color
---Alpha (transparency) component
---@field a number
---Blue component
---@field b number
---Green component
---@field g number
---Red component
---@field r number
---Color in RGBA format.
---All of the component values are in the range [0, 1].
local Color = {}

---@return string
function Color:asHex() end
---@return Vector3
function Color:asRgb() end
---@return Vector4
function Color:asRgba() end
---@class Transform
local Transform = {}

---@param t Transform
---@return Transform
function Transform:__mul(t) end
---@param v Vector3
---@return Vector3
function Transform:apply(v) end
---@return number
---@return number
function Transform:getAnglesXZ() end
---@return number
---@return number
---@return number
function Transform:getAnglesZYX() end
---@return number
function Transform:getPitch() end
---@return number
function Transform:getYaw() end
---@return Transform
function Transform:inverse() end
---@class Vector2
---@field x number
---@field y number
---Immutable 2D vector
---v = util.vector2(3, 4) v.x, v.y       -- 3.0, 4.0 str(v)         -- "(3.0, 4.0)" v:length()     -- 5.0    length v:length2()    -- 25.0   square of the length v:normalize()  -- vector2(3/5, 4/5) v:rotate(radians)    -- rotate counterclockwise (returns rotated vector) v1:dot(v2)     -- dot product (returns a number) v1 * v2        -- dot product v1 + v2        -- vector addition v1 - v2        -- vector subtraction v1 * x         -- multiplication by a number v1 / x         -- division by a number
local Vector2 = {}

---@param v Vector2
---@return Vector2
function Vector2:__add(v) end
---@param k number
---@return Vector2
function Vector2:__div(k) end
---@param k number
---@return Vector2
function Vector2:__mul(k) end
---@param v Vector2
---@return Vector2
function Vector2:__sub(v) end
---@param v Vector2
---@return number
function Vector2:dot(v) end
---@param v Vector2
---@return Vector2
function Vector2:ediv(v) end
---@param v Vector2
---@return Vector2
function Vector2:emul(v) end
---@return number
function Vector2:length() end
---@return number
function Vector2:length2() end
---@return Vector2
---@return number
function Vector2:normalize() end
---@param angle number Angle in radians
---@return Vector2
function Vector2:rotate(angle) end
---@class Vector3
---@field x number
---@field y number
---@field z number
---Immutable 3D vector
---v = util.vector3(3, 4, 5) v.x, v.y, v.z  -- 3.0, 4.0, 5.0 str(v)         -- "(3.0, 4.0, 4.5)" v:length()     -- length v:length2()    -- square of the length v:normalize()  -- normalized vector v1:dot(v2)     -- dot product (returns a number) v1 * v2        -- dot product (returns a number) v1:cross(v2)   -- cross product (returns a vector) v1 ^ v2        -- cross product (returns a vector) v1 + v2        -- vector addition v1 - v2        -- vector subtraction v1 * x         -- multiplication by a number v1 / x         -- division by a number
local Vector3 = {}

---@param v Vector3
---@return Vector3
function Vector3:__add(v) end
---@param k number
---@return Vector3
function Vector3:__div(k) end
---@param k number
---@return Vector3
function Vector3:__mul(k) end
---@param v Vector3
---@return Vector3
function Vector3:__sub(v) end
---@return string
function Vector3:__tostring() end
---@param v Vector3
---@return Vector3
function Vector3:cross(v) end
---@param v Vector3
---@return number
function Vector3:dot(v) end
---@param v Vector3
---@return Vector3
function Vector3:ediv(v) end
---@param v Vector3
---@return Vector3
function Vector3:emul(v) end
---@return number
function Vector3:length() end
---@return number
function Vector3:length2() end
---@return Vector3
---@return number
function Vector3:normalize() end
---@class Vector4
---@field w number
---@field x number
---@field y number
---@field z number
---Immutable 4D vector.
---v = util.vector4(3, 4, 5, 6) v.x, v.y, v.z, v.w  -- 3.0, 4.0, 5.0, 6.0 str(v)         -- "(3.0, 4.0, 5.0, 6.0)" v:length()     -- length v:length2()    -- square of the length v:normalize()  -- normalized vector v1:dot(v2)     -- dot product (returns a number) v1 * v2        -- dot product (returns a number) v1 + v2        -- vector addition v1 - v2        -- vector subtraction v1 * x         -- multiplication by a number v1 / x         -- division by a number
local Vector4 = {}

---@param v Vector4
---@return Vector4
function Vector4:__add(v) end
---@param k number
---@return Vector4
function Vector4:__div(k) end
---@param k number
---@return Vector4
function Vector4:__mul(k) end
---@param v Vector4
---@return Vector4
function Vector4:__sub(v) end
---@return string
function Vector4:__tostring() end
---@param v Vector4
---@return number
function Vector4:dot(v) end
---@param v Vector4
---@return Vector4
function Vector4:ediv(v) end
---@param v Vector4
---@return Vector4
function Vector4:emul(v) end
---@return number
function Vector4:length() end
---@return number
function Vector4:length2() end
---@return Vector4
---@return number
function Vector4:normalize() end
return util
