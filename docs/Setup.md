---
sidebar_position: 2
---

# Setup
The API of Runner is Damn Simple, just download a release and insert it anywhere or build the project and throw it in.
You can create a new [`ActiveRunner`](/api/Runner#ActiveRunner) instance by calling:
```lua
Runner.new(Modules: Instance, Params: RunnerParams) -> ActiveRunner
```

## RunnerParams
[`RunnerParams`](/api/Runner#RunnerParams) are parameters for dynamic loading. You only need to define the following:
```lua
{DynamicLoad: Boolean, DynamicContainer: Instance}
```
:::warning
DynamicContainer cannot be nil even if DynamicLoad is false!
:::