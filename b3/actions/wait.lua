local class = require("b3.core.middleclass")
local Action = require("b3.core.action")
local const = require("b3.const")

local Wait = class("Wait", Action)

function Wait:onCreate(properties)
    self.endTime = properties.milliseconds or 0
end

function Wait:onOpen(tick)
    local startTime = os.time()

    tick.agent:set("startTime", startTime, tick.tree.id, self.id)
end

function Wait:onTick(tick)
    local currTime = os.time()

    local startTime = tick.agent:get("startTime", tick.tree.id, self.id)

    if currTime - startTime > self.endTime then
        return const.SUCCESS
    end

    return const.RUNNING
end

return Wait
