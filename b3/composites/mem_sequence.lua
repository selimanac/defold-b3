local class = require("b3.core.middleclass")
local Composite = require("b3.core.composite")
local const = require("b3.const")

local MemSequence = class("MemSequence", Composite)

function MemSequence:onOpen(tick)
    tick.agent:set("runningChild", 1, tick.tree.id, self.id)
end

function MemSequence:onTick(tick)
    local child = tick.agent:get("runningChild", tick.tree.id, self.id)
    for i = child, #self.children do
        local status = self.children[i]:execute(tick)

        if status ~= const.SUCCESS then
            if status == const.RUNNING then
                tick.agent:set("runningChild", i, tick.tree.id, self.id)
            end
            return status
        end
    end
    return const.SUCCESS
end

return MemSequence
