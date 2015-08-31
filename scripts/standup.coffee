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
  robot.brain.set 'standup', {}

  robot.hear /\/standup$/i, (msg) ->
    standup = robot.brain.get('standup')
    if !standup[msg.message.room]
      msg.send "No standup recorded yet in this room."
    else
      for user,status of standup[msg.message.room]
        msg.send user + " - " + status

  robot.hear /\/standup (.*)$/i, (msg) ->
    status = msg.match[1] + "\n"
    standup = robot.brain.get('standup')
    standup[msg.message.room] = {
      "#{msg.message.user.name}": status
    }
    robot.brain.set 'standup', standup
    msg.send "Standup recorded."

