local class = require("behavior3.core.middleclass")
local BaseNode = require("behavior3.core.base_node")
local const = require("behavior3.const")

local Decorator = class("Decorator", BaseNode)

function Decorator:initialize(nodeData)
    Decorator.super.initialize(self, nodeData)

    self.category = const.DECORATOR
    self.child = nil
end

return Decorator
