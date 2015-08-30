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
    if Object.keys(standup).length == 0
      msg.send "No standup recorded yet."
    else
      msg.send standup[msg.message.user.name]

  robot.hear /\/standup (.*)$/i, (msg) ->
    status = msg.message.room + ": " + msg.match[1] + "\n"
    standup = robot.brain.get('standup')
    standup[msg.message.user.name] = status
    robot.brain.set 'standup', standup
    msg.send "Standup recorded."

# next - turn standup into hash
#iterate across standup hash for status printout
#multi-dimensional - user and room as keys
# if user & room has already reported, replace status. otherwise add
# command to clear room standup
# command to get full standups list
