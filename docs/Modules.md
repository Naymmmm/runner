---
sidebar_position: 3
---

# Modules
To create modules, you must create a `ModuleScript` that has a **function OR method** called `Init`, it is case sensitive. Runner cheks if
`Init` exists in your module. If it does not then it warns you and cancels the operation.
## Example Module
Here is an example module.
```lua
--!strict

local MyModule = {}

MyModule.Init = function(tbl: ActiveRunner)
    print("foobar")
    print(tbl.Version)
end

return MyModule
```

As you can see, when calling [`Runner.new()`](/api/Runner#new), it passes the [`ActiveRunner`](/api/Runner#ActiveRunner) to `Init`, this is for debugging and other stuff.