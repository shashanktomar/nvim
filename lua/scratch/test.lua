local bf = require("util.debug")
-- bf.output_in_scratch_buffer({ "hello", "world" })

local theme = false and {} or "bhah"
bf.output_in_scratch_buffer(vim.inspect(theme))
