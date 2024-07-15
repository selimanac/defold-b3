local class = require("b3.core.middleclass")
local Action = require("b3.core.action")
local const = require("b3.const")

local Failer = class("Failer", Action)

function Failer:onTick(tick)
    return const.FAILURE
end

return Failer
