local class = require("b3.core.middleclass")
local Composite = require("b3.core.composite")
local const = require("b3.const")

local MemSelector = class("MemSelector", Composite)

function MemSelector:onOpen(tick)
    tick.agent:set("runningChild", 1, tick.tree.id, self.id)
end

function MemSelector:onTick(tick)
    local child = tick.agent:get("runningChild", tick.tree.id, self.id)
    for i = child, #self.children do
        local status = self.children[i]:execute(tick)
        if status ~= const.FAILURE then
            if status == const.RUNNING then
                tick.agent:set("runningChild", i, tick.tree.id, self.id)
            end
            return status
        end
    end
    return const.FAILURE
end

return MemSelector
