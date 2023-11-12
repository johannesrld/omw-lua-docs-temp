---@meta
---`openmw.nearby` provides read-only access to the nearest area of the game world.
---Can be used only from local scripts.
---local nearby = require('openmw.nearby')

---@module 'async'
---@module 'core'
---@module 'util'

---@class nearby
---Collision types that are used in `castRay`.
---Several types can be combined with @{openmw_util#util.bitOr}.
---@field COLLISION_TYPE COLLISION_TYPE
---List of nearby activators.
---@field activators ObjectList
---List of nearby actors.
---@field actors ObjectList
---List of nearby containers.
---@field containers ObjectList
---List of nearby doors.
---@field doors ObjectList
---Everything nearby that is derived from @{openmw.types#Item}.
---@field items ObjectList
---List of nearby players.
---Currently (since multiplayer is not yet implemented) always has one element.
---@field players ObjectList
local nearby = {}

---@param callback Callback The callback to pass the result to (should accept a single argument {openmw.nearby#RayCastingResult}).
---@param from Vector3 Start point of the ray.
---@param to Vector3 End point of the ray.
function nearby.asyncCastRenderingRay(callback, from, to) end
---@param from Vector3 Initial ray position.
---@param to Vector3 Target ray position.
---@param options table An optional table with additional optional arguments. Can contain:<br><br>  * `agentBounds` - a table identifying which navmesh to use, can contain:<br><br>    * `shapeType` - one of {#COLLISION_SHAPE_TYPE} values;<br>    * `halfExtents` - {openmw.util#Vector3} defining agent bounds size;<br>  * `includeFlags` - allowed areas for agent to move, a sum of {#NAVIGATOR_FLAGS} values<br>    (default: {#NAVIGATOR_FLAGS.Walk} + {#NAVIGATOR_FLAGS.Swim} +<br>    {#NAVIGATOR_FLAGS.OpenDoor} + {#NAVIGATOR_FLAGS.UsePathgrid});
---@return Vector3
---@return nil
function nearby.castNavigationRay(from, to, options) end
---@param from Vector3 Start point of the ray.
---@param to Vector3 End point of the ray.
---@param options CastRayOptions An optional table with additional optional arguments
---@return RayCastingResult
function nearby.castRay(from, to, options) end
---@param from Vector3 Start point of the ray.
---@param to Vector3 End point of the ray.
---@return RayCastingResult
function nearby.castRenderingRay(from, to) end
---@param source Vector3 Initial path position.
---@param destination Vector3 Final path position.
---@param options table An optional table with additional optional arguments. Can contain:<br><br>  * `agentBounds` - a table identifying which navmesh to use, can contain:<br><br>    * `shapeType` - one of {#COLLISION_SHAPE_TYPE} values;<br>    * `halfExtents` - {openmw.util#Vector3} defining agent bounds size;<br>  * `includeFlags` - allowed areas for agent to move, a sum of {#NAVIGATOR_FLAGS} values<br>    (default: {#NAVIGATOR_FLAGS.Walk} + {#NAVIGATOR_FLAGS.Swim} +<br>    {#NAVIGATOR_FLAGS.OpenDoor} + {#NAVIGATOR_FLAGS.UsePathgrid});<br>  * `areaCosts` - a table defining relative cost for each type of area, can contain:<br><br>    * `ground` - a floating point number >= 0, used in combination with {#NAVIGATOR_FLAGS.Walk} (default: 1);<br>    * `water` - a floating point number >= 0, used in combination with {#NAVIGATOR_FLAGS.Swim} (default: 1);<br>    * `door` - a floating point number >= 0, used in combination with {#NAVIGATOR_FLAGS.OpenDoor} (default: 2);<br>    * `pathgrid` - a floating point number >= 0, used in combination with {#NAVIGATOR_FLAGS.UsePathgrid}<br>      (default: 1);<br>  * `destinationTolerance` - a floating point number representing maximum allowed distance between destination and a<br>    nearest point on the navigation mesh in addition to agent size (default: 1);
---@return FIND_PATH_STATUS
---@return Vector3[]
function nearby.findPath(source, destination, options) end
---@param position Vector3 Center of the search circle.
---@param maxRadius number Approximate maximum search distance.
---@param options table An optional table with additional optional arguments. Can contain:<br><br>  * `agentBounds` - a table identifying which navmesh to use, can contain:<br><br>    * `shapeType` - one of {#COLLISION_SHAPE_TYPE} values;<br>    * `halfExtents` - {openmw.util#Vector3} defining agent bounds size;<br>  * `includeFlags` - allowed areas for agent to move, a sum of {#NAVIGATOR_FLAGS} values<br>    (default: {#NAVIGATOR_FLAGS.Walk} + {#NAVIGATOR_FLAGS.Swim} +<br>    {#NAVIGATOR_FLAGS.OpenDoor} + {#NAVIGATOR_FLAGS.UsePathgrid});
---@return Vector3
---@return nil
function nearby.findRandomPointAroundCircle(position, maxRadius, options) end
---@param formId string String returned by `core.getFormId`
---@return GameObject
function nearby.getObjectByFormId(formId) end
---@class COLLISION_TYPE
---@field Actor number
---World+Door+Actor+HeightMap+Projectile+Water
---@field AnyPhysical number
---Objects that should collide only with camera
---@field Camera number
---Used by default: World+Door+Actor+HeightMap
---@field Default number
---@field Door number
---@field HeightMap number
---@field Projectile number
---Objects that were not intended to be part of the physics world
---@field VisualOnly number
---@field Water number
---@field World number
local COLLISION_TYPE = {}

---@class COLLISION_SHAPE_TYPE
---Axis-Aligned Bounding Box is used for NPC and symmetric Creatures;
---@field Aabb number
---is used for NPC and symmetric Creatures.
---@field Cylinder number
---is used for Creatures with big difference in width and height;
---@field RotatingBox number
local COLLISION_SHAPE_TYPE = {}

---@class CastRayOptions
---Object types to work with (see @{openmw.nearby#COLLISION_TYPE})
---@field collisionType number
---An object to ignore (specify here the source of the ray)
---@field ignore GameObject
---The radius of the ray (zero by default). If not zero then castRay actually casts a sphere with given radius.  NOTE: currently `ignore` is not supported if `radius>0`.
---@field radius number
---A table of parameters for @{#nearby.castRay}
local CastRayOptions = {}

---@class FIND_PATH_STATUS
---`destination` position is too far from available navigation mesh. The status may appear when navigation mesh is not fully generated or position is outside of covered area;
---@field EndPolygonNotFound number
---Path over navigation mesh from `source` to `destination` does not exist or navigation mesh is not fully generated to provide the path;
---@field FindPathOverPolygonsFailed number
---Couldn't map path over polygons into world coordinates.
---@field FindStraightPathFailed number
---Couldn't initialize required data due to bad input or bad navigation mesh data.
---@field InitNavMeshQueryFailed number
---Found path couldn't be smoothed due to imperfect algorithm implementation or bad navigation mesh data;
---@field MoveAlongSurfaceFailed number
---Provided `agentBounds` don't have corresponding navigation mesh. For interior cells it means an agent with such `agentBounds` is present on the scene. For exterior cells only default `agentBounds` is supported;
---@field NavMeshNotFound number
---Last path point is not a destination but a nearest position among found;
---@field PartialPath number
---`source` position is too far from available navigation mesh. The status may appear when navigation mesh is not fully generated or position is outside of covered area;
---@field StartPolygonNotFound number
---Path is found;
---@field Success number
---adjusted `destination` position is too far from available navigation mesh. The status may appear when navigation mesh is not fully generated or position is outside of covered area;
---@field TargetPolygonNotFound number
local FIND_PATH_STATUS = {}

---@class NAVIGATOR_FLAGS
---allow agent to open doors on the way;
---@field OpenDoor number
---allow agent to swim on the water surface;
---@field Swim number
---allow agent to use predefined pathgrid imported from ESM files.
---@field UsePathgrid number
---allow agent to walk on the ground area;
---@field Walk number
local NAVIGATOR_FLAGS = {}

---@class RayCastingResult
---Is there a collision? (true/false)
---@field hit boolean
---Normal to the surface in the collision point (nil if no collision)
---@field hitNormal Vector3
---The object the ray has collided with (can be nil)
---@field hitObject GameObject
---Position of the collision point (nil if no collision)
---@field hitPos Vector3
---Result of raycasing
local RayCastingResult = {}

return nearby
