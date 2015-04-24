# Description:
#   Emphasize a joke
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   rimshot - Link to a short video of a rimshot
#
# Author:
#   mrtazz

shots = [
    "https://www.youtube.com/watch?v=obKLdou0LH0",
    "https://www.youtube.com/watch?v=VkD-kxZEQ6E",
    "https://www.youtube.com/watch?v=UGrTGCacG2E",
    "https://www.youtube.com/watch?v=kHYiyv68q2o",
    "https://www.youtube.com/watch?v=pSg_6T8HrRg",
    "https://www.youtube.com/watch?v=h6Y2Lv0s-D4",
    "https://www.youtube.com/watch?v=U-H1jo_uDos"
]

module.exports = (robot) ->
  robot.hear /rimshot/i, (msg) ->
    msg.send msg.random shots
