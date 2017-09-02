handy
===

A [LÖVR](http://lovr.org) library for controlling controllers.  Keeps a list of controllers,
automatically refreshes it, and provides utilities for drawing the controllers and iterating over
them.

Usage
---

Copy the `handy.lua` file into a project and require it.  If you just want to easily draw
controllers, you can do this:

```lua
handy = require 'handy'

function lovr.load()
  handy:init()
end

function lovr.draw()
  handy:draw()
end
```

See [`main.lua`](main.lua) for a complete example.

API
---

##### `handy:init(clobber)`

Initialize handy.  By default, the library will gently clobber the `lovr.controlleradded` and
`lovr.controllerremoved` functions, replacing them with functions to refresh the list of
controllers.  You can disable this behavior by passing `false` as the first argument, but note that
you'll need to call `handy:refresh` yourself to refresh the list.

##### `handy:refresh()`

Manually refresh the list of controllers.  Usually this is called automatically.

##### `handy:draw()`

Draw all the controllers.

##### `handy()`

The library can be called as a function in a for loop to iterate over currently connected
controllers, like this:

```lua
for controller in handy() do
  print(controller:getPosition())
end
```

License
---

MIT, see [`LICENSE`](LICENSE) for details.
