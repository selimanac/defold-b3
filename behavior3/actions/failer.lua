local class = require("behavior3.core.middleclass")
local Action = require("behavior3.core.action")
local const = require("behavior3.const")

local Failer = class("Failer", Action)

function Failer:onTick(tick)
    return const.FAILURE
end

return Failer
