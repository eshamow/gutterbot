# Description:
#   Listens for "good" but with 3 or more "o"s
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commnads:
#   gooo+d
#
# Author:
#   tbwIII (originally, altered by baconqurlyq)

darths = [
  "http://i.imgur.com/sH3vep4.jpg",
  "http://i.imgur.com/FlzFBLu.jpg",
  "http://i.imgur.com/Cbn787U.jpg"
]

module.exports = (robot) ->
  robot.hear /gooo+d/i, (msg) ->
    msg.send msg.random darths
