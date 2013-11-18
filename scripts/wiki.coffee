# Description:
#   displays various information
#
# Commands:
#   hubot get me faxes - responds with CMM faxes

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()


  #robot.respond /(image|img)( me)? (.*)/i, (msg) ->
  robot.respond /(get)( me)? (fax|faxes)/i, (msg) ->
    wikilist_type = "faxes"
    msg.send Wikilists[wikilist_type]



Wikilists =
  faxes:
   """
   Use these faxes for testing:
   CMM by the kitchen: 6142328980
   CMM by the support: 6142328850
   """
