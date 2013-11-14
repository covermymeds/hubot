# Description:
#   Make devmotron sentient
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   devmotron join the fun
#   devmotron go home, you're drunk
#
# Notes:
#   Just nerding around
#
# Author:
#   Mark J. Lorenz [CoverMyMeds]

module.exports = (robot) ->

  markovmotronIsAlive = false
  probability         = [false, false, false, false, true]
  maxWords            = [5, 10, 15, 20, 25, 30, 35, 40]
  prefixLen           = 4
  exec                = require('child_process').exec
  path                = "scripts/markovmotron"

  # any string 2 words or greater (roughly)
  robot.hear /^.*\w+\W+\w+/, (msg)->
    return unless markovmotronIsAlive
    return unless msg.random(probability)

    maxResponse = msg.random(maxWords)
    options     = "--words=#{maxResponse} --corpus=#{path}/corpus.txt --prefix=#{prefixLen}"

    exec "echo \"#{msg.match[0]}\" | #{path}/markovmotron #{options}", (err, stdout, stderr)->
      return console.log('exec error: ' + err) if err
      msg.reply(stdout)

  robot.respond /join the fun(\s\d)?$/i, (msg)->
    markovmotronIsAlive = true
    prefixLen           = +msg.match[1] if msg.match[1]
    msg.reply ":godmode:"

  robot.respond /go home, you're drunk/i, (msg)->
    markovmotronIsAlive = false
    msg.reply ":skull:"
