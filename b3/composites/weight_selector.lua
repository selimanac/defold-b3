local class = require("b3.core.middleclass")
local Composite = require("b3.core.composite")
local const = require("b3.const")

local WeightSelector = class("WeightSelector", Composite)

function WeightSelector:onOpen(tick)
    tick.agent:set("runningChild", nil, tick.tree.id, self.id)
end

function WeightSelector:onTick(tick)
    if not self.totalWeight then
        local totalWeight = 0

        for i = 1, #self.children do
            local child = self.children[i]
            totalWeight = totalWeight + child.weight
        end

        self.totalWeight = totalWeight
    end

    local childIndex = tick.agent:get("runningChild", tick.tree.id, self.id)

    if not childIndex then
        -- return self.children[childIndex]:execute(tick)
        local randomValue = math.random(1, self.totalWeight)
        local currentWeight = 0

        for i = 1, #self.children do
            local child = self.children[i]
            currentWeight = currentWeight + child.weight
            if currentWeight >= randomValue then
                childIndex = i
                break
            end
        end
    end

    for i = childIndex, #self.children do
        local status = self:executeChild(i, tick)

        if status ~= const.FAILURE then
            return status
        end
    end

    for i = 1, childIndex - 1 do
        local status = self:executeChild(i, tick)

        if status ~= const.FAILURE then
            return status
        end
    end

    return const.FAILURE
end

function WeightSelector:executeChild(index, tick)
    local status = self.children[index]:execute(tick)

    if status == const.RUNNING then
        tick.agent:set("runningChild", index, tick.tree.id, self.id)
    end

    return status
end

return WeightSelector
