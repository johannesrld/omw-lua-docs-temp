---@meta
---`openmw.ui` controls user interface.
---Can be used only by local scripts, that are attached to a player.
---local ui = require('openmw.ui')

---@module 'core'
---@module 'util'

---@class ui
---Alignment values (left to right, top to bottom)
---@field ALIGNMENT ALIGNMENT
---Predefined colors for console output
---@field CONSOLE_COLOR CONSOLE_COLOR
---Widget types
---@field TYPE TYPE
---Tools for working with layers
---@field layers Layers
local ui = {}

---@param table table
---@return Content
function ui.content(table) end
---@param layout Layout
---@return Element
function ui.create(layout) end
---@param msg string
---@param color Color
function ui.printToConsole(msg, color) end
---@param page SettingsPageOptions
function ui.registerSettingsPage(page) end
---@return Vector2
function ui.screenSize() end
---@param mode string
function ui.setConsoleMode(mode) end
---@param obj GameObject
function ui.setConsoleSelectedObject(obj) end
---@param msg string
function ui.showMessage(msg) end
---@param options TextureResourceOptions
---@return TextureResource
function ui.texture(options) end
function ui.updateAll() end
---@class ALIGNMENT
---@field Center any
---@field End any
---@field Start any
---Alignment values (details depend on the specific property).
---For horizontal alignment the order is left to right, for vertical alignment the order is top to bottom.
local ALIGNMENT = {}

---@class CONSOLE_COLOR
---@field Default Color
---@field Error Color
---@field Info Color
---@field Success Color
---Predefined colors for console output
local CONSOLE_COLOR = {}

---@class Layers
---Layers.
---Implements [iterables#List](iterables.html#List) of #Layer.
---ui.layers.insertAfter('HUD', 'NewLayer', { interactive = true }) local fourthLayer = ui.layers[4] local windowsIndex = ui.layers.indexOf('Windows') for i, layer in ipairs(ui.layers) do   print('layer', i, layer.name, layer.size) end
local Layers = {}

---@param name string Name of the layer
---@return number
---@return nil
function Layers.indexOf(name) end
---@param afterName string Name of the layer after which the new layer will be inserted
---@param name string Name of the new layer
---@param options table Table with a boolean `interactive` field (default is true). Layers with interactive = false will ignore all mouse interactions.
function Layers.insertAfter(afterName, name, options) end
---@param beforeName string Name of the layer before which the new layer will be inserted
---@param name string Name of the new layer
---@param options table Table with a boolean `interactive` field (default is true). Layers with interactive = false will ignore all mouse interactions.
function Layers.insertBefore(beforeName, name, options) end
---@class TYPE
---Automatically wraps around its contents
---@field Container any
---Aligns widgets in a row or column
---@field Flex any
---Displays an image
---@field Image any
---Display text
---@field Text any
---Accepts user text input
---@field TextEdit any
---Base widget type
---@field Widget any
---Can be moved and resized by the user
---@field Window any
---All available widget types
local TYPE = {}

---@class Content
---Content.
---An array-like container, which allows to reference elements by their name. Implements [iterables#List](iterables.html#List) of #Layout and [iterables#Map](iterables.html#Map) of #string to #Layout.
---local content = ui.content {    { name = 'input' }, } -- bad idea! -- content[1].name = 'otherInput' -- do this instead: content.input = { name = 'otherInput' }
local Content = {}

---@param name string
---@return Layout
function Content:__index(name) end
---@param layout Layout
function Content:add(layout) end
---@param layout Layout
---@return number
---@return nil
function Content:indexOf(layout) end
---@param index number
---@param layout Layout
function Content:insert(index, layout) end
---@class Element
---Access or replace the element's layout   Note: Is reset to `nil` on `destroy`
---@field layout Layout
---Element.
---An element of the user interface
local Element = {}

function Element:destroy() end
function Element:update() end
---@class Layer
---Name of the layer
---@field name string
---Size of the layer in pixels
---@field size Vector2
local Layer = {}

---@class Layout
---Optional @{openmw.ui#Content} of children layouts
---@field content Content
---Optional table of event callbacks
---@field events table
---Optional table of external properties
---@field external table
---Optional layout to display in. Only applies for the root widget.   Note: if the #Element isn't attached to anything, it won't be visible!
---@field layer string
---Optional name of the layout. Allows access by name from Content
---@field name string
---Optional table of widget properties
---@field props table
---Optional #Template
---@field template Template
---Type of the widget, one of the values in #TYPE. Must match the type in #Template if both are present
---@field type any
---Arbitrary data for you to use, e. g. when receiving the layout in an event callback
---@field userData any
---Layout
local Layout = {}

---@class MouseEvent
---Mouse button which triggered the event.   Matches the arguments of @{openmw_input#input.isMouseButtonPressed} (`nil` for none, 1 for left, 3 for right).
---@field button number
---Position of the mouse cursor relative to the widget
---@field offset Vector2
---Absolute position of the mouse cursor
---@field position Vector2
---Mouse event, passed as an argument to relevant UI events
local MouseEvent = {}

---@class SettingsPageOptions
---The page's UI, which will be attached to the settings tab. The root widget has to have a fixed size. Set the `size` field in `props`, `relativeSize` is ignored.
---@field element Element
---Name of the page, displayed in the list, used for search
---@field name string
---Additional keywords used in search, not displayed anywhere
---@field searchHints string
---Table with settings page options, passed as an argument to ui.registerSettingsPage
local SettingsPageOptions = {}

---@class Template
---@field content Content
---@field props table
---One of the values in #TYPE, serves as the default value for the #Layout
---@field type any
---Template
local Template = {}

---@class TextureResource
---A texture ready to be used by UI widgets
local TextureResource = {}

---@class TextureResourceOptions
---Offset of this resource in the texture. (0, 0) by default
---@field offset Vector2
---Path to the texture file. Required
---@field path string
---Size of the resource in the texture. (0, 0) by default. 0 means the whole texture size is used.
---@field size Vector2
---Table with arguments passed to ui.texture.
local TextureResourceOptions = {}

return ui
