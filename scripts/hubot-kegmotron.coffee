# Description
#   How much beer is left?
#
# Dependencies:
#
# Configuration:
#
# Commands:
#   hubot is there beer? - tell you much much beer is in the keg
#   hubot the keg was replaced - let devmotron know it's OK to show the "low keg" message again
#
# Notes:
#
# Author:
#   Mark Lorenz

module.exports = (robot) ->
  # my experiments showed a mostly full keg registering ~55% when first attached and the rising to 65% after a few hours
  # A warm, empty keg weighed in at ~3%.   Need to see the reading of a cold empty keg.
  UNK       = null
  MID       = 55
  LOW       = 40
  beerLevel = UNK
  saidLow   = false
  # room      = 569461 # sandbox
  room     = 527299 # covermymeds

  unk  = ["I'm not sure."]
  full = [":beers: The beer is mostly full :beers:"]
  mid  = [":beer: The beer is getting low"]
  low  = ["The beer is almost empty!", "http://31.media.tumblr.com/tumblr_li46pe1m8I1qh4nf6o1_500.gif"]

  robot.respond /is there beer\?/i, (msg) ->
    getMessage().forEach (kegMsg)-> ( msg.send kegMsg )

  robot.respond /the keg was replaced/i, (msg) ->
    saidLow = false
    msg.send "Ok, got it"

  robot.router.post '/keg_status', (req, res) ->
    res.send 200
    beerLevel = req.body["level"]  # a number from 0 ~ 100
    console.log "Beer level: ", beerLevel

    return if saidLow || beerLevel > LOW

    saidLow = true
    getMessage().forEach (msg)-> ( robot.messageRoom room, msg )

  getMessage = ->
    return unk  if beerLevel == UNK
    return full if beerLevel > MID
    return mid  if LOW < beerLevel <= MID
    return low  if beerLevel <= LOW
