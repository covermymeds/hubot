# Description:
#   displays various information
#
# Commands:
#   hubot get me status - displays status of things being used
#   hubot x using y - lets devmotron know that x is using y



Status = {}

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()


  robot.respond /(get)( me)? (status)/i, (msg) ->
    #msg.send Status["NN"]
    msg.send Status
    for key, value of Status
      msg.send "#{value} using #{key}"


  robot.respond /(.*) using (.*)/i, (msg) ->
    #indices start at 1 not 0
    #msg.send msg.match[1]
    #msg.send msg.match[2]
    Status[msg.match[2]] = msg.match[1]
    msg.send "noted"

