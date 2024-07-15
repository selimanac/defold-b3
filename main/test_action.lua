local class = require("b3.core.middleclass")
local Action = require("b3.core.action")
local const = require("b3.const")

local TestAction = class("TestAction", Action)


function TestAction:onCreate(properties)
    pprint(properties)
end

function TestAction:onTick(tick)
    print('On Test Action')
    pprint(tick.worldBlackboard:get('test_blackboard_value'))

    local test_blackboard_value = tick.worldBlackboard:get('test_blackboard_value')
    tick.worldBlackboard:set('test_blackboard_value', test_blackboard_value + 100)
    return const.SUCCESS
end

return TestAction
