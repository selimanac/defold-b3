local class = require("b3.core.middleclass")
local BaseNode = require("b3.core.base_node")
local const = require("b3.const")

local Action = class("Action", BaseNode)

function Action:initialize(nodeData)
    Action.super.initialize(self, nodeData)
    self.category = const.ACTION
end

return Action
