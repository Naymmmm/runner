--!strict

--[=[
	@class Utilities

	Public utilities module for Runner to use
]=]

local Utilities = {}
Utilities.__index = Utilities

--[=[
    Checks if a table is empty
    @within Utilities

    @param tbl {any} -- Table to check
    @return boolean -- Is it empty?
]=]
function Utilities.IsEmpty(tbl): boolean
	-- These helper functions are stupid but I don't want to clutter my code.
	
	for _, _ in pairs(tbl) do
		return false
	end
	
	return true
end

--[=[
    Checks if arg exists in tbl
    @within Utilities

    @param tbl {any} -- Table to check
    @param arg string -- Argument to check with
    @return boolean -- Does arg exist in tbl?
]=]
function Utilities.InitExists(tbl, arg): boolean
	-- More than stupid.
	
	if tbl[arg] then
		return true
	end
	
	return false
end

return Utilities