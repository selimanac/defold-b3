local class = require("b3.core.middleclass")
local Composite = require("b3.core.composite")
local const = require("b3.const")

local Selector = class("Selector", Composite)

function Selector:onTick(tick)
    for i = 1, #self.children do
        local status = self.children[i]:execute(tick)
        if status ~= const.FAILURE then
            return status
        end
    end
    return const.FAILURE
end

return Selector
