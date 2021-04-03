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

local function debug(self, node, fnc)
    if self.debug then
        print("-", fnc, ":", node.title , node.name, node.category)
    end
end

---@field protected enterNode function
function Tick:enterNode(node)
    self.nodeCount = self.nodeCount + 1
    table.insert(self.openNodes, node)
    debug(self, node, "enterNode")
end

---@field protected openNode function
function Tick:openNode(node)
    debug(self, node, "openNode")
end

---@field protected tickNode function
function Tick:tickNode(node, result)
    debug(self, node, "tickNode")
end

---@field protected closeNode function
function Tick:closeNode(node)
    --remove last node
    table.remove(self.openNodes, #self.openNodes)

    debug(self, node, "closeNode")
end

---@field protected exitNode function
function Tick:exitNode(node)
    debug(self, node, "exitNode")
end
return Tick
