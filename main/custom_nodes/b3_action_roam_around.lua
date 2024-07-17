local class = require("b3.core.middleclass")
local Action = require("b3.core.action")
local const = require("b3.const")

local RoamAround = class("ChasePlayer", Action)


function RoamAround:onCreate(properties)
    pprint(properties)
end

function RoamAround:onTick(tick)
    print('On Test Action')
    pprint(tick.worldBlackboard:get('test_blackboard_value'))

    local test_blackboard_value = tick.worldBlackboard:get('test_blackboard_value')
    tick.worldBlackboard:set('test_blackboard_value', test_blackboard_value + 100)
    return const.SUCCESS
end

return RoamAround
