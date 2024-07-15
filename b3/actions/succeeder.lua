local class = require("b3.core.middleclass")
local Action = require("b3.core.action")
local const = require("b3.const")

local Succeeder = class("Succeeder", Action)


function Succeeder:onTick(tick)
    return const.SUCCESS
end

return Succeeder
