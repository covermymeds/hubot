# Description:
#   displays various information
#
# Commands:
#   hubot get me menu - from breakfast warehouse
#   hubot get me faxes - responds with CMM faxes
#   hubot get me staging status - any news about staging environments
#   hubot get me nodes - responds with CMM test harnesses
#   hubot get me t1 - info about t1
#   hubot get me users - some test users and passwords
#   hubot get me ie - machines hosting various IE browsers

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()


  robot.respond /(?:get|wiki)(?: me)? (.*)/i, (msg) ->
    if msg.match[0].match(/(db|repl)/i)
      msg.send Wikilists["db"]
    else if msg.match[0].match(/(harness|harnesses|nodes)/i)
      msg.send Wikilists["nodes"]
    else if msg.match[0].match(/(fax|faxes)/i)
      msg.send Wikilists["faxes"]
    else if msg.match[0].match(/(access records?|access)/i)
      msg.send Wikilists["accessrecords"]
    else if msg.match[0].match(/t(\d+)/i)
      msg.send Wikilists["xanadustaging4_1"]
      msg.send Wikilists["xanadustaging4_2"]
    else if msg.match[0].match(/(central)/i)
      msg.send Wikilists["central"]
    else if msg.match[0].match(/(kbox|kace|kase|support|help)/i)
      msg.send Wikilists["kbox"]
    else if msg.match[0].match(/(menu|breakfast menu|breakfast)/i)
      msg.send Wikilists["menu"]
    else if msg.match[0].match(/(ie)/i)
      msg.send Wikilists["ie"]
    else if msg.match[0].match(/(navinet|nn)/i)
      msg.send Wikilists["navinet"]
    else if msg.match[0].match(/(partners)/i)
      msg.send Wikilists["partners"]
    else if msg.match[0].match(/(api key|apikey|claims)/i)
      msg.send Wikilists["claims"]
    else if msg.match[0].match(/(sample claims|sample claim)/i)
      msg.send Wikilists["sampleclaim"]
    else if msg.match[0].match(/(epa|caremark)/i)
      msg.send Wikilists["epa"]
    else if msg.match[0].match(/(test users|users)/i)
      msg.send Wikilists["testusers"]
    else if msg.match[0].match(/(staging status|staging)/i)
      msg.send Wikilists["stagingstatus"]
    else if msg.match[0].match(/(git)/i)
      msg.send Wikilists["gitcommands"]
    end

  robot.respond /(how do i logout)/i, (msg) ->
    wikilist_type = "logout"
    msg.send Wikilists[wikilist_type]

  robot.respond /how do i stage (?:on|to) (?:t|T)(\d+)/i, (msg) ->
    msg.send "`APP_ID=t#{msg.match[1]} cap testing deploy`"

  robot.respond /how do i (?:rspec|rake|rake spec) on (?:t|T)(\d+)/i, (msg) ->
    msg.send "`PROFILE=t#{msg.match[1]} bundle exec rake spec`"

  robot.respond /(?:what if )?(something went wrong in testing)/i, (msg) ->
    msg.send "record it here: https://intranet.covermymeds.com/dev/_layouts/15/WopiFrame2.aspx?sourcedoc=%2Fdev%2FShared%20Documents%2FAJG%20Shared%20Docs%2FWhat%20Went%20Wrong%20in%20Testing%2Exlsx&action=edit"


Wikilists =
  faxes:
   """
   Use this fax for testing:
     email_test_fax:      6144202128
     email_test_email:    emailtest@covermymeds.com
     email_test_username: emailtest
     email_test_password: whatthewhat

   Use these if you don't need to send/test a PDF,
   they will set the fax state to fail/success:
     auto fail:           6145555555
     auto succeed:        6149999999

   Use sparingly, and retrieve faxes promptly:
     CMM by the kitchen:  6142328980
     CMM by the support:  6142328850
   """
  xanadustaging4_1:
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
   """
  xanadustaging4_2:
   """
   for more info:
   https://git.innova-partners.com/infrastructure/wiki/wiki/New-environments-by-example-xanadustaging4
   https://git.innova-partners.com/infrastructure/wiki/wiki/Xanadustaging4-task-list
   https://git.innova-partners.com/infrastructure/wiki/wiki/Future-state-of-environments
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
  partners:
   """
   Partners Test Accounts
     > https://intranet.covermymeds.com/dev/_layouts/15/start.aspx#/Dev%20Wiki/Test%20data.aspx
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

   api_key: 
       a4b05a8151b4ddda2739e355aefab48a
   """
  accessrecords:
   """
   1001 - Created
   1005 - Ownership
   1004 - Past Owner
   1002 - Key/Share User
   1003 - Group Access
   """
  db:
   """
   when post-deploy testing in production,
   should you need to check the DB,
   there is a replication DB that is updated
   with a few minutes delay:
     sydney: cmm2_repl
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
   staging.covermymeds.com: active, ensure that you talk to RelayHealth first

   navinet.covermymeds.com: active

   xanadustaging4: active
     > new-testing-env PR needs review
     > need to merge into master
     > then this will be a fully functioning staging environment
     > until then, we can test on it, but still 
       > have to stage it on the navinet environs before deploying it to prod
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
