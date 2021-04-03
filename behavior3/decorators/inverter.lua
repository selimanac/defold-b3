local class = require("behavior3.core.middleclass")
local Decorator = require("behavior3.core.decorator")
local const = require("behavior3.const")

local Inverter = class("Inverter", Decorator)

function Inverter:onTick(tick)
    if not self.child then
        return const.ERROR
    end

    local status = self.child:execute(tick)

    if status == const.SUCCESS then
        status = const.FAILURE
    elseif status == const.FAILURE then
        status = const.SUCCESS
    end

    return status
end

return Inverter
