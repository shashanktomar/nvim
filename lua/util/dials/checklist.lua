local augend = require("dial.augend")

local markers = { "-", "- [ ]", "- [x]" }

-- lua does not support OR condition in regex, so we have to check them separately
local list_patterns = {
  "^(%s*)(%- %[[xX]%])(.*)$", -- checked pattern
  "^(%s*)(%- %[ %])(.*)$", -- unchecked pattern
  "^(%s*)(%-)(.*)$", -- simple list pattern
}

local function get_next_marker(current_marker, addend)
  for i, marker in ipairs(markers) do
    if marker == current_marker then
      local new_index = (i - 1 + addend) % #markers + 1
      return markers[new_index]
    end
  end
  -- If the current_marker is not found, default to the first marker
  return markers[1]
end

local checklist = augend.user.new({
  find = require("dial.augend.common").find_pattern("^%s*%-.*$"),

  add = function(text, addend, cursor)
    local leading_spaces, list_marker, line_text

    for _, pattern in ipairs(list_patterns) do
      leading_spaces, list_marker, line_text = string.match(text, pattern)
      if list_marker then
        break
      end
    end

    if list_marker then
      local normalized_marker = list_marker:lower()
      local new_marker = get_next_marker(normalized_marker, addend)
      text = leading_spaces .. new_marker .. line_text
    end

    ---@diagnostic disable-next-line: redundant-return-value
    return { text = text, cursor = cursor }
  end,
})

return checklist
