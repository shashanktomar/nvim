local bf = require("util.buffer")
-- bf.output_in_scratch_buffer({ "hello", "world" })

local props = require("props.coding")

local servers = props.null_ls_sources()

bf.output_in_scratch_buffer(vim.inspect(servers))
