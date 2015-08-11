#
# Description:
#   Get Ron Swanson quotes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot swanson me
#
# Author:
#   terrimonster
#
module.exports = (robot) ->
  robot.respond /swanson me/i, (msg) ->
    msg
      .http("http://ron-swanson-quotes.herokuapp.com/quotes")
      .get() (err, res, body) ->
        body = JSON.parse(body)
        msg.send body.quote
