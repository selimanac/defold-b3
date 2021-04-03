local class = require("behavior3.core.middleclass")
local Composite = require("behavior3.core.composite")
local const = require("behavior3.const")

local Sequence = class("Sequence", Composite)

function Sequence:onTick(tick)
    print('In seq')
    for i = 1, #self.children do
       
        local status = self.children[i]:execute(tick)
        if status ~= const.SUCCESS then
            return status
        end
    end
    return const.SUCCESS
end

return Sequence