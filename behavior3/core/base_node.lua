local class = require("behavior3.core.middleclass")
local const = require("behavior3.const")

local BaseNode = class("BaseNode")

function BaseNode:initialize(nodeData)
    nodeData = nodeData or {}
    self.id = nodeData.id or uuid.generate()
    self.name = nodeData.name or ""
    self.title = nodeData.title or ""
    self.description = nodeData.description or ""
    self.parameters = nodeData.parameters or {}
    self.properties = nodeData.properties or {}
    self.category = nil
    self.weight = nodeData.properties.weight or const.DEFAULT_WEIGHT

	self:onCreate(self.properties)
end

function BaseNode:onCreate(nodeData)
end

function BaseNode:execute(tick)
	--Enter
	self:enter(tick)
	--open
	if not tick.agent:get("isOpen",tick.tree.id,self.id) then
		self:open(tick)
	end
	--tick
	local status = self:tick(tick)
	--close
	if status ~= const.RUNNING then
		self:close(tick)
	end
	--exit
	self:exit(tick)

	return status
end

function BaseNode:enter(tick)
	tick:enterNode(self)
	self:onEnter(tick)
end


function BaseNode:open(tick)
	tick:openNode(self)
	tick.agent:set("isOpen", true, tick.tree.id, self.id)
	self:onOpen(tick)
end

function BaseNode:tick(tick)
	local result = self:onTick(tick)
	tick:tickNode(self,result)
	return result
end


function BaseNode:close(tick)
	tick:closeNode(self)
	tick.agent:set("isOpen", false, tick.tree.id, self.id)
	self:onClose(tick)
end

function BaseNode:exit(tick)
	tick:exitNode(self)
	self:onExit(tick)
end

function BaseNode:onEnter(tick)
end

function BaseNode:onOpen(tick)
end

function BaseNode:onTick(tick)
end

function BaseNode:onClose(tick)
end

function BaseNode:onExit(tick)
end

return BaseNode
