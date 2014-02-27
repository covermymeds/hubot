# Description:
#   displays various information
#
# Commands:
#   hubot get me status - displays status of things being used
#   hubot x using y - lets devmotron know that x is using y
#   hubot clear y - clears y from devmotron's notes



Status = {}
#defaults
Status["NN"] = "not sure if anyone"
Status["T1"] = "not sure if anyone"
Status["T2"] = "not sure if anyone"

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()


  robot.respond /(get)( me)? (status)/i, (msg) ->
    #msg.send Status["NN"]
    #msg.send Status
    if Object.keys(Status).length == 0
      msg.send "not keeping track of anything right now;\nuse `devmotron x using y`"
    else
      for key, value of Status
        msg.send "#{value} is using #{key}"


  robot.respond /(['"\w\d.\-_]+) (?:is |are |)using (['"\w .\-_]+)/i, (msg) ->
    #indices start at 1 not 0
    #msg.send msg.match[1]
    #msg.send msg.match[2]
    Status[msg.match[2]] = msg.match[1]
    msg.send "noted"

  robot.respond /clear (.*)/i, (msg) ->
    #indices start at 1 not 0
    delete Status[msg.match[1]]
    msg.send "cleared"


