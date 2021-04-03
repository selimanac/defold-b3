local class = require("behavior3.core.middleclass")
local Decorator = require("behavior3.core.decorator")
local const = require("behavior3.const")

local Limiter = class("Limiter", Decorator)

function Limiter:onCreate(properties)
    assert(properties.maxLoop, "maxLoop parameter in Limiter decorator is an obligatory parameter")
    self.maxLoop = properties.maxLoop
end

function Limiter:onOpen(tick)
    tick.agent:set("i", 0, tick.tree.id, self.id)
end

function Limiter:onTick(tick)
    if not self.child then
        return const.ERROR
    end

    local i = tick.agent:get("i", tick.tree.id, self.id)

    if i < self.maxLoop then
        local status = self.child:execute(tick)

        if status == const.SUCCESS or status == const.FAILURE then
            tick.agent:set("i", i + 1, tick.tree.id, self.id)
        end
        return status
    end
    return const.FAILURE
end

return Limiter
