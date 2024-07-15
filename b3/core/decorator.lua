local class = require("b3.core.middleclass")
local BaseNode = require("b3.core.base_node")
local const = require("b3.const")

local Decorator = class("Decorator", BaseNode)

function Decorator:initialize(nodeData)
    Decorator.super.initialize(self, nodeData)

    self.category = const.DECORATOR
    self.child = nil
end

return Decorator
