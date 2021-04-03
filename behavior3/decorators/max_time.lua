local class = require("behavior3.core.middleclass")
local Decorator = require("behavior3.core.decorator")
local const = require("behavior3.const")

local MaxTime = class("MaxTime", Decorator)

function MaxTime:onCreate(properties)
    assert(properties.maxTime, "maxTime parameter in MaxTime decorator is an obligatory parameter")
    self.maxTime = params.maxTime
end

function MaxTime:onOpen(tick)
    local startTime = os.time()
    tick.agent:set("startTime", startTime, tick.tree.id, self.id)
end

function MaxTime:onTick(tick)
    if not self.child then
        return const.ERROR
    end

    local currTime = os.time()
    local startTime = tick.agent:get("startTime", tick.tree.id, self.id)

    if currTime - startTime > self.maxTime then
        return const.FAILURE
    end

    local status = self.child:execute(tick)

    return status
end

return MaxTime
