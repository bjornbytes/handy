local handy = require 'handy'

function lovr.load()
  handy:init()
end

function lovr.update(dt)
  for controller in handy() do
    if controller:getAxis('trigger') > .5 then
      controller:vibrate(.003)
    end
  end
end

function lovr.draw()
  handy:draw()
end
