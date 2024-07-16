![defold-b3](/.github/b3.png?raw=true)

This is a Behavior Tree Runtime library for the Defold Engine based on old [Behavior3](https://github.com/behavior3) framework.

## Installation

You can use this library in your own project by adding this project as a [Defold library dependency](https://defold.com/manuals/libraries/#setting-up-library-dependencies).  
Open your `game.project` file, select  `Project ` and add a  `Dependencies` field:

>https://github.com/selimanac/defold-b3/archive/refs/heads/master.zip 
>https://github.com/selimanac/defold-uuid4/archive/master.zip

## Behavior Tree Editor

https://selimanac.github.io/defold-b3-editor

Source: https://github.com/selimanac/defold-b3-editor-source

## Examples

TODO


## Forum

TODO

## Toss a Coin to Your Witcher
If you find my [Defold Extensions](https://github.com/selimanac) useful for your projects, please consider [supporting](https://github.com/sponsors/selimanac) it.  
I'd love to hear about your projects! Please share your released projects that use my native extensions. It would be very motivating for me.


## Release Notes

### 1.0

Initial release
 
---

# API

- This library uses [middleclass](https://github.com/kikito/middleclass) internally. If you are planning to create custom nodes, you need to be familiar with middleclass.
- It is your responsibility to load JSON data. You may use  [Custom Resources](https://defold.com/manuals/project-settings/#custom-resources) for this purpose..

# Parser

## b3:parse_project(data_table, [customNodeList])

Parse json file exported from [b3 Editor](https://selimanac.github.io/defold-b3-editor) using `Project -> Export -> Project as JSON`

**PARAMETERS**. 

* ```data_table``` (json) - json from b3 Editor 
* ```customNodeList``` (table)[optional]  - custom node class list as table

**RETURNS**

* ```project_data_table``` (table) Multiple tree tables paired by **tree names** set from Editor.

**EXAMPLE**

```lua

    local data, error = sys.load_resource("/path_to/project.json")
    local data_table = {}
    if data then
        data_table = json.decode(data)
    end

    local customNodeList = {
        test_action = require("your.test_action")
    }

    local project_data_table = b3:parse_project(data_table, customNodeList)

```


## b3:parse_tree(data_table, customNodeList)

Parse json file exported from [b3 Editor](https://selimanac.github.io/defold-b3-editor) using `Project -> Export -> Tree as JSON`

**PARAMETERS**

* ```data_table``` (json) - json from b3 Editor 
* ```customNodeList``` (table)[optional]  - custom node class list as table

**RETURNS**

* ```tree_data_table``` (table) Single tree table

**EXAMPLE**

```lua

    local data, error = sys.load_resource("/path_to/tree.json")
    local data_table = {}
    if data then
        data_table = json.decode(data)
    end

    local customNodeList = {
        test_action = require("your.test_action")
    }

    local tree_data_table = b3:parse_tree(data_table, customNodeList)

```

--- 

# BlackBoard

## b3.BlackBoard:new()

Create new Blackboard instance.

**RETURNS**

* ```blackboard_instance``` (table) New blackboard instance

**EXAMPLE**

```lua

    local blackboard = b3.BlackBoard:new()

```

## b3.BlackBoard:set(key, value, [treeScope], [nodeScope])

Set a new key-value pair Blackboard instance.

**PARAMETERS**

* ```key``` (string) - Key for value
* ```value``` (any) - Value for key
* ```treeScope``` (string)[optional] - The tree id if accessing the tree or node  memory.
* ```nodeScope``` (string)[optional] - The node id if accessing the node memory.

**EXAMPLE**

```lua

    local blackboard = b3.BlackBoard:new()
    blackboard:set('blackboard_key', 'blackboard_value')

```

## b3.BlackBoard:get(key, [treeScope], [nodeScope])

Get key-value pair from Blackboard instance.

**PARAMETERS**

* ```key``` (string) - Key for value
* ```treeScope``` (string)[optional] - The tree id if accessing the tree or node  memory.
* ```nodeScope``` (string)[optional] - The node id if accessing the node memory.

**RETURNS**

* ```value``` (any) - Value for key

**EXAMPLE**

```lua

    local blackboard = b3.BlackBoard:new()
    blackboard:set('blackboard_key', 'blackboard_value')
    print(blackboard:get('blackboard_key'))

```

--- 

# Tick

## b3.Tick:new()

Create and get a new Tick instance. You must set the `tick.agent` and `tick.blackboard`variables. 


**RETURNS**

* ```instance``` (table) - New tick instance

**EXAMPLE**

```lua

    local tick = b3.Tick:new()

```

## tick.agent

Tick agent blackboard. This is for **internal use**. You must set this variable.


**EXAMPLE**

```lua

    local agentBlackboard = b3.BlackBoard:new()
    local tick = b3.Tick:new()
    tick.agent = agentBlackboard

```

## tick.blackboard

Tick generic blackboard. This for any kind of data passing throuh tree. You must set this variable.


**EXAMPLE**

```lua

    local blackboard = b3.BlackBoard:new()
    local tick = b3.Tick:new()
    tick.blackboard = blackboard

```

--- 

# Behaviortree

## b3:new(data, [customNodeList], [debug])

Create new behavior tree instance using single tree.

**PARAMETERS**

* ```data``` (table) - Behavior Tree data parsed from json
* ```customNodeList``` (table)[optional]  - custom node class list as table
* ```debug``` (bool)[optional] - Toggle debug prints true/false

**RETURNS**

* ```instance``` (table) - Behavior tree instance.

**EXAMPLE**

```lua

    local data, error = sys.load_resource("/path_to/project.json")
    local data_table = {}
    if data then
        data_table = json.decode(data)
    end

    local customNodeList = {
        test_action = require("your.test_action")
    }

    local project_data_table = b3:parse_project(data_table, customNodeList)
    local behaviortree_instance = b3:new(project_data_table['tree_key'], customNodeList, true)

```

## behaviortree_instance:set_tree(data)

Set an other tree data table to behavior tree.

**PARAMETERS**

* ```data``` (table) - Behavior Tree data parsed from json

**EXAMPLE**

```lua

    local data, error = sys.load_resource("/path_to/project.json")
    local data_table = {}
    if data then
        data_table = json.decode(data)
    end

    local customNodeList = {
        test_action = require("your.test_action")
    }

    local project_data_table = b3:parse_project(data_table, customNodeList)
    local behaviortree_instance = b3:new(project_data_table['1_tree_key'], customNodeList, true)
    behaviortree_instance:set_tree(project_data_table['2_tree_key'])

```

## behaviortree_instance:dump()

Dumps tree nodes to table.


**RETURNS**

* ```dump_data``` (table) - Tree table

**EXAMPLE**

```lua

   local dump = behaviortree:dump()
   pprint(dump)

```

## behaviortree_instance:tick()

Single behavior tree tick.


**RETURNS**

* ```state``` (enum) - State enum from `b3.const class
  
**Const.SUCCESS**   
**Const.FAILURE**   
**Const.RUNNING**  
**Const.ERROR**     

**EXAMPLE**

```lua

   local const = require("b3.const")

   local state = behaviortree_instance:tick(tick)
   if state == const.SUCCESS then
        print('SUCCESS')
    end

```

--- 

# Node Lifecycle

These functions can be used to create custom nodes by extending the relevant class. The available classes are located in the [`b3.core`](https://github.com/selimanac/defold-b3/tree/master/b3/core) folder.

## BaseNode:onCreate(nodeData)

## BaseNode:onEnter(tick)

## BaseNode:onOpen(tick)

## BaseNode:onTick(tick)

## BaseNode:onClose(tick)

## BaseNode:onExit(tick)

--- 