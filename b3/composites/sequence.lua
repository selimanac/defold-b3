local class = require("b3.core.middleclass")
local Composite = require("b3.core.composite")
local const = require("b3.const")

local Sequence = class("Sequence", Composite)

function Sequence:onTick(tick)
    for i = 1, #self.children do
        local status = self.children[i]:execute(tick)
        if status ~= const.SUCCESS then
            return status
        end
    end
    return const.SUCCESS
end

return Sequence
