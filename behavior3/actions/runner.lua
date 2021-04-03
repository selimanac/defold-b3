local class = require("behavior3.core.middleclass")
local Action = require("behavior3.core.action")
local const = require("behavior3.const")

local Runner = class("Runner", Action)

function Runner:onTick(tick)
    return const.RUNNING
end

return Runner
