local class = require("behavior3.core.middleclass")
local Action = require("behavior3.core.action")
local const = require("behavior3.const")

local Error = class("Error", Action)

function Error:onTick(tick)
    return const.ERROR
end

return Error
