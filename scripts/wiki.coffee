# Description:
#   displays various information
#
# Commands:
#   hubot get me faxes - responds with CMM faxes
#   hubot get me nodes - responds with CMM test harnesses

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()


  #robot.respond /(image|img)( me)? (.*)/i, (msg) ->
  robot.respond /(get|wiki)( me)? (fax|faxes)/i, (msg) ->
    wikilist_type = "faxes"
    msg.send Wikilists[wikilist_type]


  robot.respond /(get|wiki)( me)? (harness|harnesses|xanadu|nodes|xanadunodes)/i, (msg) ->
    wikilist_type = "nodes"
    msg.send Wikilists[wikilist_type]

  #robot.respond /(get|wiki)( me)? (central)/i, (msg) ->
  #  wikilist_type = "central"
  #  msg.send Wikilists[wikilist_type]


Wikilists =
  faxes:
   """
   Use these faxes for testing:
   CMM by the kitchen: 6142328980
   CMM by the support: 6142328850
   """
  nodes:
   """
   rails apps hosted on xanadunode[1-4]
   staging apps hosted on xanadustaging[1-2]
     > cd /pub/staging/staging.dashboard.covermymeds.com/current/
   navinet hosted on cmmweb1
     > cd /pub/navinet.covermymeds.com

   for more info:
   https://intranet.covermymeds.com/dev/_layouts/15/start.aspx#/Dev%20Wiki/Test%20harnesses.aspx
   """
   #central:
   #"""
   # staging.central.covermymeds.com
   # username: demo@covermymeds.com
   # password: testing123
   #"""
