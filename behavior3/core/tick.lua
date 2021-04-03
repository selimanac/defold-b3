local class = require("behavior3.core.middleclass")

local Tick = class("Tick")
function Tick:initialize()
    self.tree = nil
    self.debug = nil
    self.agent = nil
    self.worldBlackboard = nil
    self.openNodes = {}
    self.nodeCount = 0
end

---@field protected enterNode function
function Tick:enterNode(node)
    self.nodeCount = self.nodeCount + 1
    table.insert(self.openNodes, node)
    --TODO:call debug here
end

---@field protected openNode function
function Tick:openNode(node)
    --TODO:call debug here
end

---@field protected tickNode function
function Tick:tickNode(node, result)
    --TODO:call debug here
end

---@field protected closeNode function
function Tick:closeNode(node)
    --remove last node
    table.remove(self.openNodes, #self.openNodes)
    --TODO:call debug here
end

---@field protected exitNode function
function Tick:exitNode(node)
    --TODO:call debug here
end
return Tick
