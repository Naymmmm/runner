--!strict

--[=[
	@class Runner

	Quick and dirty service-runner module for initializing modules.
]=]

--[=[
	A base type for all ActiveRunners, contains the loaded modules, module container and version.
	@type ActiveRunner string | Instance | {Instance}
	@within Runner
]=]
export type ActiveRunner = {
	Version: string,
	ModuleContainer: Instance,
	LoadedModules: {Instance}
}

--[=[
	A type for the parameters of the Runner constructor.
	@type RunnerParams boolean | Instance
	@within Runner
]=]
export type RunnerParams = {
	DynamicLoad: boolean,
	DynamicContainer: Instance
}

local Runner = {}
Runner.__index = Runner
Runner.Version = "v0.1"

local Utilities = require(script:WaitForChild("Utilities"))

--[=[
	Cooler print.
	
	@within Runner
	@private
	@param str string -- I aint documenting this 
	@yields
]=]
local function debugPrint(str)
	print(string.format("[%s]: %s", script.Name, str))
end

--[=[
	Cooler warn.
	
	@within Runner
	@private
	@param str string -- I aint documenting this 
	@yields
]=]
local function debugWarn(str)
	warn(string.format("[%s]: %s", script.Name, str))
end

--[=[
	Creates a new ActiveRunner instance.
	@within Runner

	@param Modules Instance -- The module container to load modules from
	@param Params {DynamicLoad: boolean, DynamicContainer: Instance} -- Parameters for dynamic loading
	@return ActiveRunner -- Returns a new ActiveRunner instance
]=]
function Runner.new(Modules: Instance, Params: RunnerParams)
	-- Error checking
	assert(Modules, "Argument #1 cannot be nil")
	assert(Modules:IsA("Instance"), "Argument #1 must be an instance")
	assert(Utilities, "No utilities module found. Have you installed Runner correctly?")
	assert(Params, "Argument #2 cannot be nil")
	
	-- People are stupid.
	if Params.DynamicLoad == nil or typeof(Params.DynamicContainer) ~= "Instance" then
		error("Parameters 'DynamicLoad' and 'DynamicContainer' are required.")
	end
	
	-- Construct and return a new runner
	local self = setmetatable({
		Version = Runner.Version,
		ModuleContainer = Modules,
		LoadedModules = {}
	}, Runner)
	
	if Utilities.IsEmpty(Modules:GetChildren()) then
		debugWarn("No modules found in Utility. Silence by adding an empty module with init method.")
	end
	
	-- Load modules, and hook?
	for _, Module in Modules:GetChildren() do
		if not Module:IsA("ModuleScript") then
			debugWarn("Found foreign objects in ModuleContainer. Please add them externally.")
		else
			local success, Required = pcall(require, Module)
			if not success then
				debugWarn("Error requiring module: " .. tostring(Module:GetFullName()) .. " - " .. Required)
			else
				debugPrint("Successfully required "..Module:GetFullName().."! Checking for init function.")
				if Utilities.InitExists(Required, "Init") then
					debugPrint(Module:GetFullName().." required exists. Proceeding.")
					
					if type(Required["Init"]) == "function" then
						table.insert(self.LoadedModules, Module)
						Required["Init"](self)
					else
						debugWarn("Init function does not exist in module " .. Module:GetFullName())
					end
				else
					debugWarn(Module:GetFullName().." does not have Init!")
				end
			end
		end
	end
	
	-- Dynamic loading
	if Params.DynamicLoad and Params.DynamicContainer then
		Params.DynamicContainer.ChildAdded:Connect(function(Module)
			debugPrint(Module:GetFullName().." added due to being Dynamic")
			
			if not Module:IsA("ModuleScript") then
				debugWarn("Found foreign objects in ModuleContainer. Please add them externally.")
			else
				local success, Required = pcall(require, Module)
				if not success then
					debugWarn("Error requiring module: " .. tostring(Module:GetFullName()) .. " - " .. Required)
				else
					debugPrint("Successfully required "..Module:GetFullName().."! Checking for init function.")
					if Utilities.InitExists(Required, "Init") then
						debugPrint(Module:GetFullName().." required exists. Proceeding.")

						if type(Required["Init"]) == "function" then
							table.insert(self.LoadedModules, Module)
							Required["Init"](self)
						else
							debugWarn("Init function does not exist in module " .. Module:GetFullName())
						end
					else
						debugWarn(Module:GetFullName().." does not have Init!")
					end
				end
			end
		end)
	end
	
	debugPrint("Successfully created Runner with "..Modules:GetFullName().."!")
	
	return self
end

return Runner