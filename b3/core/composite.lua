local class = require("b3.core.middleclass")
local BaseNode = require("b3.core.base_node")
local const = require("b3.const")

local Composite = class("Composite", BaseNode)

function Composite:initialize(nodeData)
    Composite.super.initialize(self, nodeData)
    self.category = const.COMPOSITE
    self.children = {}
end

return Composite
