# Description:
#   cat facts
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cat facts N (where N is # of facts to return, max of 100)
#
# Author:
#   terrimonster

module.exports = (robot) ->
  robot.respond /cat facts( (\d+))?/i, (msg) ->
    count = msg.match[2] || 1
    msg.http("http://catfacts-api.appspot.com/api/facts?number=" + count)
      .get() (err, res, body) ->
        msg.send facts for facts in JSON.parse(body).facts
