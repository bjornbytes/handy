local handy = {}

function handy:init(clobber)
  self:refresh()
  if clobber or clobber == nil then
    lovr.controlleradded = function() self:refresh() end
    lovr.controllerremoved = function() self:refresh() end
  end
end

function handy:refresh()
  self.list = {}
  for i, instance in ipairs(lovr.headset.getControllers()) do
    self.list[i] = {
      instance = instance,
      model = instance:newModel()
    }
  end
end

function handy:draw()
  for i, controller in ipairs(self.list) do
    if controller.model then
      local x, y, z = controller.instance:getPosition()
      local angle, ax, ay, az = controller.instance:getOrientation()
      controller.model:draw(x, y, z, 1, angle, ax, ay, az)
    end
  end
end

return setmetatable(handy, {
  __call = function(self)
    local i, n = 0, #self.list
    return function()
      i = i + 1
      if i <= n then return self.list[i].instance end
    end
  end
})
