local class = require("behavior3.core.middleclass")
local BaseNode = require("behavior3.core.base_node")
local const = require("behavior3.const")

local Action = class("Action", BaseNode)

function Action:initialize(nodeData)
    Action.super.initialize(self, nodeData)
    self.category = const.ACTION
end

return Action
