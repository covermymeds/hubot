# Description:
#   displays various information
#
# Commands:
#   hubot get me status - displays status of things being used
#   hubot x using y - lets devmotron know that x is using y
#   hubot clear y - clears y from devmotron's notes



Status = {}
#defaults
Status["NN until next week"] = "Vasanth"
Status["T1"] = "not sure if anyone"
Status["T2"] = "Nathan and Ryan"
Status["T3"] = "Nathan and Ryan"
Status["staging.epamotron"] = "Brian and Jon"

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()

  # wait until the brain has been initialized 
  # and there is a database connection
  robot.brain.on 'loaded', ->
    robot.brain.test = {testing1: "1", testing2: "2"}


  robot.respond /(,? what is | get me | get | get [\w]+ )?(status)/i, (msg) ->
    #msg.send Status["NN"]
    #msg.send Status
    if Object.keys(Status).length == 0
      msg.send "not keeping track of anything right now;\nuse `devmotron x using y`"
    else
      for key, value of Status
        msg.send "#{value} is using #{key}"

      msg.send robot.brain.status
      robot.brain.emit 'save'
      robot.brain.emit 'connected'


  robot.respond /(['"\w\d.\-_ ]+) (?:is |are |)using (['"\w .\-_]+)/i, (msg) ->
    #indices start at 1 not 0
    #msg.send msg.match[1]
    #msg.send msg.match[2]
    Status[msg.match[2]] = msg.match[1]
    msg.send "noted"

  robot.respond /(['"\w\d.\-_ ]+) brainstore (['"\w .\-_]+)/i, (msg) ->
    robot.brain.status = msg.match[2]
    msg.send "noted"

  robot.respond /clear (.*)/i, (msg) ->
    #indices start at 1 not 0
    delete Status[msg.match[1]]
    msg.send "cleared"


