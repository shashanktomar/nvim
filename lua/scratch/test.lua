local api = require("image")

api.from_url("https://gist.ro/s/remote.png", {
  -- all the same options from above
}, function(img)
  -- do stuff with the image
end)
