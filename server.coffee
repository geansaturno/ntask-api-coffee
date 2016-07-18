express = require "express"
consign = require "consign"

app = express()

consign()
.include "lib/config.coffee"
.then "db.coffee"
.then "lib/middleware.coffee"
.then "routes"
.then "lib/boot.coffee"
.into app
