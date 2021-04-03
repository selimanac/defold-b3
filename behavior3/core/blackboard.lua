local class = require("behavior3.core.middleclass")

local Blackborad = class("Blackborad")

function Blackborad:initialize()
    self.baseMemory = {}
    self.treeMemory = {}
end

function Blackborad:getTreeMemory_(treeScope)
    if not self.treeMemory[treeScope] then
        self.treeMemory[treeScope] = {}
        self.treeMemory[treeScope].nodeMemory = {}
        self.treeMemory[treeScope].openNodes = {}
        self.traversalDepth = 0
        self.traversalCycle = 0
    end
    return self.treeMemory[treeScope]
end

function Blackborad:getNodeMemory_(treeeMemory, nodeScope)
    local memory = treeeMemory.nodeMemory
    memory[nodeScope] = memory[nodeScope] or {}
    return memory[nodeScope]
end

function Blackborad:getMemory_(treeScope, nodeScope)
    local memory = self.baseMemory
    if treeScope then
        memory = self:getTreeMemory_(treeScope)
        if nodeScope then
            assert(memory, string.format("treeMemory = %s", tostring(memory)))
            memory = self:getNodeMemory_(memory, nodeScope)
        end
    end
    return memory
end

---@param key String  The key to be stored.
---@param value String The value to be stored.
---@param treeScope String The tree id if accessing the tree or node  memory.
---@param nodeScope String  The node id if accessing the node memory.
function Blackborad:set(key, value, treeScope, nodeScope)
    local memory = self:getMemory_(treeScope, nodeScope)
    memory[key] = value
end

---@param key String  The key to be retrieved.
---@param treeScope String  The tree id if accessing the tree or node  memory.
---@param nodeScope String  The node id if accessing the node memory.
---@return Object The value stored or undefined.
function Blackborad:get(key, treeScope, nodeScope)
    local memory = self:getMemory_(treeScope, nodeScope)
    return memory[key]
end

return Blackborad



