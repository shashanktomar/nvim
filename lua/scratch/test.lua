local bf = require("util.debug")
-- bf.output_in_scratch_buffer({ "hello", "world" })
local ui = require("props.ui")
bf.output_in_scratch_buffer(vim.inspect(ui.highlights()))
