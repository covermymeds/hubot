# Description
#   How much beer is left?
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   hubot is there beer? - tell you much much beer is in the keg
#
# Notes:
#
# Author:
#   Mark Lorenz

module.exports = (robot) ->
  UNK       = null
  MID       = 50
  LOW       = 25
  beerLevel = UNK
  saidLow   = false
  room      = 569461 # sandbox
  #room     = 527299 # covermymeds

  unk  = ["I'm not sure."]
  full = [":beers: The beer is full :beers:"]
  mid  = [":beer: The beer is getting low"]
  low  = ["The beer is empty!", "http://31.media.tumblr.com/tumblr_li46pe1m8I1qh4nf6o1_500.gif"]

  robot.respond /is there beer\?/i, (msg) ->
    msg.send getMessage()

  robot.router.post '/keg_status', (req, res) ->
    beerLevel = req.body["level"]
    console.log "Beer level: ", beerLevel

    return if saidLow || beerLevel > LOW

    saidLow = true
    getMessage().forEach (msg)-> ( robot.messageRoom room, msg )

    res.send 200

  getMessage = ->
    return unk  if beerLevel == UNK
    return full if beerLevel > MID
    return mid  if LOW < beerLevel <= MID
    return low  if beerLevel <= LOW
