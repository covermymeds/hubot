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

  robot.respond /(get|wiki)( me)? (central)/i, (msg) ->
    wikilist_type = "central"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (kbox|kace|kase|support|help)/i, (msg) ->
    wikilist_type = "kbox"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (menu)/i, (msg) ->
    wikilist_type = "menu"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (ie)/i, (msg) ->
    wikilist_type = "ie"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (api key|apikey|claims)/i, (msg) ->
    wikilist_type = "claims"
    msg.send Wikilists[wikilist_type]

  robot.respond /(how do i logout)/i, (msg) ->
    wikilist_type = "logout"
    msg.send Wikilists[wikilist_type]


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
  central:
   """
   staging.central.covermymeds.com
   username: demo@covermymeds.com
   password: testing123
   """
  kbox:
   """
   https://kbox.innova-partners.com/
   https://intranet.covermymeds.com/dev/_layouts/15/start.aspx#/Dev%20Wiki/
   """
  menu:
   """
   https://intranet.covermymeds.com/dev/SiteAssets/Dev%20Wiki/Breakfast!!!/2013-10-01%2009.35.24%20HDR.jpg
   """
  logout:
   """
   directly navigate here 
     to get out of the infinite dashboard-cmm_php login logout loop:

     https://navinet.covermymeds.com/user/logout
   """
  ie:
   """
   Windows XP:
   -ie6dev
   -ie7dev
   -ie8dev

   Windows 7:
   -win7ie8
   -win7ie9

   Some year we will put up Windows 7 and Windows 8 IE10 machines.

   https://intranet.covermymeds.com/dev/_layouts/15/start.aspx#/Dev%20Wiki/Browser%20Compatibility%20Testing%20Machines.aspx
   """
  claims:
   """
   api_key: a4b05a8151b4ddda2739e355aefab48a
   
   staging: 
   https://next.covermymeds.com

   production:
   https://claims.covermymeds.com

   wiki:
   https://intranet.covermymeds.com/dev/_layouts/15/start.aspx#/Dev%20Wiki/All%20about%20claims.aspx
   """
