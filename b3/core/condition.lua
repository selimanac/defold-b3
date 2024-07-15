local class = require("b3.core.middleclass")
local BaseNode = require("b3.core.base_node")
local const = require("b3.const")

local Condition = class("Condition", BaseNode)

function Condition:initialize(nodeData)
    Condition.super.initialize(self, nodeData)
    self.category = const.CONDITION
end

function Condition:onTick(tick)
    return const.SUCCESS
end

return Condition
