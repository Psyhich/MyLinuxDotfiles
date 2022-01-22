--- Check if a file or directory exists in this path
function exists(file)
   local ok, _, code = os.rename(file, file)
   if not ok then
      if code == 13 then
         -- Permission denied, but it exists
         return true
      end
   end
   return ok
end

--- Check if a directory exists in this path
function isdir(path)
   return exists(path.."/")
end

-- Getting project dir
local util = require("lspconfig/util")

local project_config_dir = ".neovim_config"

local found_project_root = (util.root_pattern(project_config_dir))(vim.fn.expand('%:p'))

if found_project_root then
	dofile(found_project_root .. "/" .. project_config_dir .. "/" .."init.lua")
end
