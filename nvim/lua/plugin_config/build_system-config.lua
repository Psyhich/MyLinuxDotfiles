require("yabs.defaults").setup()
require('yabs.tasks').add_tasks
{
	{
	  type = "run",
	  command = "lua %",
	  runner = "terminal",
	  output = "quickfix",
	  active = true
	}
}
