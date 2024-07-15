local class = require("b3.core.middleclass")
local Decorator = require("b3.core.decorator")
local const = require("b3.const")

local Repeater = class("Repeater", Decorator)

function Repeater:onCreate(properties)
    assert(properties.maxLoop, "maxLoop parameter in maxLoop decorator is an obligatory parameter")
    self.maxLoop = properties.maxLoop or -1
end

function Repeater:onOpen(tick)
    tick.agent:set("i", 0, tick.tree.id, self.id)
end

function Repeater:onTick(tick)
    if not self.child then
        return const.ERROR
    end

    local i = tick.agent:get("i", tick.tree.id, self.id)
    local status = const.SUCCESS

    while self.maxLoop < 0 or i < self.maxLoop do
        status = self.child:execute(tick)
        if status == const.SUCCESS or status == const.FAILURE then
            i = i + 1
        else
            break
        end
    end

    tick.agent:set("i", i, tick.tree.id, self.id)
    return status
end

return Repeater
