local class = require("b3.core.middleclass")
local Action = require("b3.core.action")
local const = require("b3.const")

local Error = class("Error", Action)

function Error:onTick(tick)
    return const.ERROR
end

return Error
