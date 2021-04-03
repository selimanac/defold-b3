local class = require("behavior3.core.middleclass")
local Action = require("behavior3.core.action")
local const = require("behavior3.const")

local Succeeder = class("Succeeder", Action)


function Succeeder:onTick(tick)
  
    return const.SUCCESS
end

return Succeeder