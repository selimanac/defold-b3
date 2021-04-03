local class = require("behavior3.core.middleclass")
local BaseNode = require("behavior3.core.base_node")
local const = require("behavior3.const")

local Condition = class("Condition", BaseNode)

function Condition:initialize(nodeData)
    Condition.super.initialize(self, nodeData)
    self.category = const.CONDITION
end

function Condition:onTick(tick)
    return const.SUCCESS
end

return Condition
