# Description
#   <description of the scripts functionality>
#
# Dependencies:
#   "<module name>": "<module version>"
#
# Configuration:
#   LIST_OF_ENV_VARS_TO_SET
#
# Commands:
#   hubot <trigger> - <what the respond trigger does>
#   <trigger> - <what the hear trigger does>
#
# URLS:
#   GET /path?param=<val> - <what the request does>
#
# Notes:
#   <optional notes required for the script>
#
# Author:
#   <github username of the original script author>
module.exports = (robot) ->
  robot.brain.set 'standup', null

  robot.hear /\/standup$/i, (msg) ->
    standup = robot.brain.get('standup')
    if !standup
      msg.send "No standup recorded yet."
    else
      msg.send standup

  robot.hear /\/standup (.*)$/i, (msg) ->
    status = msg.message.user.name + ": " + msg.match[1] + "\n"
    standup = robot.brain.get('standup')
    if !standup
      standup = status
    else
      standup += status

    robot.brain.set 'standup', standup
    msg.send "Standup recorded."
