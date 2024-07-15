local class = require("b3.core.middleclass")
local Action = require("b3.core.action")
local const = require("b3.const")

local Runner = class("Runner", Action)

function Runner:onTick(tick)
    return const.RUNNING
end

return Runner
