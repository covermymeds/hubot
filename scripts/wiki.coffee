# Description:
#   displays various information
#
# Commands:
#   hubot get me menu - from breakfast warehouse
#   hubot get me faxes - responds with CMM faxes
#   hubot get me staging status - any news about staging environments
#   hubot get me nodes - responds with CMM test harnesses
#   hubot get me xs4 - info about xanadustaging4
#   hubot get me users - some test users and passwords

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()


  #robot.respond /(image|img)( me)? (.*)/i, (msg) ->
  robot.respond /(get|wiki)( me)? (fax|faxes)/i, (msg) ->
    wikilist_type = "faxes"
    msg.send Wikilists[wikilist_type]


  robot.respond /(get|wiki)( me)? (harness|harnesses|nodes)/i, (msg) ->
    wikilist_type = "nodes"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (xs4|xanadustaging4)/i, (msg) ->
    wikilist_type = "xanadustaging4"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (central)/i, (msg) ->
    wikilist_type = "central"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (kbox|kace|kase|support|help)/i, (msg) ->
    wikilist_type = "kbox"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (menu|breakfast menu)/i, (msg) ->
    wikilist_type = "menu"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (ie)/i, (msg) ->
    wikilist_type = "ie"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (navinet|nn)/i, (msg) ->
    wikilist_type = "navinet"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (api key|apikey|claims)/i, (msg) ->
    wikilist_type = "claims"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (sample claims|sample claim)/i, (msg) ->
    wikilist_type = "sampleclaim"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (epa|caremark)/i, (msg) ->
    wikilist_type = "epa"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (test users|users)/i, (msg) ->
    wikilist_type = "testusers"
    msg.send Wikilists[wikilist_type]

  robot.respond /(get|wiki)( me)? (staging status|staging)/i, (msg) ->
    wikilist_type = "stagingstatus"
    msg.send Wikilists[wikilist_type]

  robot.respond /(how do i logout)/i, (msg) ->
    wikilist_type = "logout"
    msg.send Wikilists[wikilist_type]

  robot.respond /(remind|get|wiki)( me)? (git)/i, (msg) ->
    wikilist_type = "gitcommands"
    msg.send Wikilists[wikilist_type]


Wikilists =
  faxes:
   """
   Use these faxes for testing:
   CMM by the kitchen: 6142328980
   CMM by the support: 6142328850
   """
  xanadustaging4:
   """
   CMM_PHP:   https://t1-cmm.testing.covermymeds.com
   DASHBOARD: https://t1-dashboard.testing.covermymeds.com
   AUTOBAHN:  https://t1-admin.testing.covermymeds.com

   others:
   https://t1-paplus.testing.covermymeds.com
   https://t1-postmaster.testing.covermymeds.com
   https://t1-api.testing.covermymeds.com
   https://t1-npiverifier.testing.covermymeds.com
   https://t1-claims.testing.covermymeds.com
   https://t1-atlas.testing.covermymeds.com

   DB: cmm2_testing_t1

   for more info:
   https://git.innova-partners.com/infrastructure/foobar/wiki/New-environments-by-example-xanadustaging4
   https://git.innova-partners.com/infrastructure/foobar/wiki/Xanadustaging4-task-list
   https://git.innova-partners.com/infrastructure/foobar/wiki/Future-state-of-environments
   """
  nodes:
   """
   rails apps hosted on xanadunode[1-4]
   staging apps hosted on xanadustaging[1-2]
     > cd /pub/staging/staging.dashboard.covermymeds.com/current/
   navinet hosted on cmmweb1
     > cd /pub/navinet.covermymeds.com

   xanadustaging4: `devmotron get me xanadustaging4`

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
  navinet:
   """
   Navinet Test Accounts
   Production: https://navinet.navimedix.com
   Caremark: https://piacc.navimedix.com
   Staging: https://pitest.navimedix.com
     Username: cmmTestUser1 / cmmtest

   more:
   https://basecamp.com/1756315/projects/16976-cmm-integration/messages/4673569-nn-test-accounts
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
  sampleclaim:
   """
   in cmm_tests:
       pbcopy <  config/data/sample_claim.txt
   """
  epa:
   """
   state/drug/plan combos:
   response-through-system demo CMM ePA: Ohio/Apple flavor/sample
   response-through-system ePA: Texas/protonix/bcbs
   response-outside-system ePA: Ohio/euflexxa/aetna
   response-through-system caremark ePA: Ohio/Boniva/caremark + see below

   sanity check:
   You know it's an ePA if the URL is from dashboard.covermymeds.com or its staging equivalent.

   wiki:
   All about ePAs: https://intranet.covermymeds.com/dev/Dev%20Wiki/All%20about%20ePAs.aspx
   Creating a Caremark ePA: https://intranet.covermymeds.com/dev/Dev%20Wiki/Creating%20a%20Caremark%20ePA.aspx
   """
  testusers:
   """
   username:password::
   TCPhys:Phys1
   VP23:hhhh
   VP31:hhhh

   emails:
   emailtest:Password1!
     @ https://outlook.innova-partners.com
   """
  stagingstatus:
   """
   staging.covermymeds.com:
     > ask Boyan first before staging here
     > all branches to be staged will need to merge the deletion branch
       > 926-deleting-PAs
       > (and not 926-delete-using-request-api)

   navinet.covermymeds.com: no news
   xanadustaging4: still making it work
   """
  gitcommands:
   """
   CREATING A NEW LOCAL BRANCH
     > git checkout -b 123-fixing-broken-crap
     > git push -u origin 123-fixing-broken-crap

   GETTING BRANCHES
     > git branch -r
     > git fetch origin
     > git checkout -b test origin/test
   """
