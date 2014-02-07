# Description:
#   displays various checklists
#
# Commands:
#   hubot checklist me checklists - displays available checklist commands

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()

  robot.respond /(checklist)( me)? (pull request|pull)/i, (msg) ->
    checklist_type = "pull_request"
    msg.send Checklists[checklist_type]


  #robot.respond /(image|img)( me)? (.*)/i, (msg) ->
  robot.respond /(checklist)( me)? (stage|staging)/i, (msg) ->
    #checklist_type = capture_name msg.match[3]
    checklist_type = "staging"
    msg.send Checklists[checklist_type]

  robot.respond /(checklist)( me)? (regression)/i, (msg) ->
    checklist_type = "regression"
    msg.send Checklists[checklist_type]

  robot.respond /(checklist)( me)? (new app|new applications|applications|apps)/i, (msg) ->
    checklist_type = "newapplications"
    msg.send Checklists[checklist_type]

  robot.respond /(checklist)( me)? (new api|api)/i, (msg) ->
    checklist_type = "newapi"
    msg.send Checklists["newapi_1"]
    msg.send Checklists["newapi_2"]
    msg.send Checklists["newapi_3"]

  robot.respond /(checklist)( me)? (deploy|deployment)/i, (msg) ->
    checklist_type = "deploy"
    msg.send Checklists[checklist_type]

  robot.respond /(checklist)( me)? (checklists?)/i, (msg) ->
    checklist_type = "checklists"
    msg.send Checklists[checklist_type]


  robot.respond /(test)( me)? (.*)/i, (msg) ->
    msg.send msg.match[3]





Checklists =
  staging:
   """
      Checklist for staging CMM_PHP: see the README
      https://git.innova-partners.com/cmm/CMM_PHP#change-management
      [ ] are there database changes?
      [ ] are the procs on staging the same as procs in production?
      
      Recurring gotchas:
      [ ] ensure that the latest master branch is rebased/merged into your branch

      > next: regression
   """
  regression:
    """
      Checklist for regression:
      [ ] 'bundle exec rake spec'
          > runs specs
      [ ] 'bundle exec rake recordfails'
          > runs features
      [ ] 'bundle exec rake rerun'
          > if there are failures

      [ ] 'bundle exec rake prod'
          > for post deployment

      [ ] errbit.covermymeds.com
          > monitor for new errors
          > also post deployment

      > next: deployment
    """
  deploy:
   """
      Checklist for deploying: see a developer
      [ ] are there database changes?

      Checklist for testing a deploy:
      [ ] 'bundle exec rake prod'
          > run at least 3 times for intermittent errors

      [ ] relevant manual testing (depends on what changed)

      [ ] errbit.covermymeds.com
          > monitor for new errors

      [ ] close issues

      PHP: https://git.innova-partners.com/cmm/CMM_PHP/blob/master/DEPLOY.md
   """
  pull_request:
   """
      Steps for a pull request: 
      https://git.innova-partners.com/cmm/CMM_PHP#change-management

      > next: staging
   """
  newapplications:
   """
   Creating a new app? 
   This checklist is too long for campfire, 
   but here is the link:
   (also too long for campfire)

      https://intranet.covermymeds.com/dev/_layouts/15/WopiFrame2.aspx?sourcedoc=/dev/Shared%20Documents/Policies%20-%20Procedures/Templates,%20Examples,%20Checklists,%20and%20Extras/Dev/New_Application_Feature_Checklist.docx&action=default&DefaultItemOpen=1

   """
  newapi_1:
   """
    ## Does It Go In An API?
    #- [ ] Are you acting on a business object (reading or writing)?
    #    - e.g. Requests, Forms, Users
    #    - negative e.g. Accesses, Touches, Supplements
    #- [ ] Will we want an outside integrator to be able to reproduce this functionality?
    #- [ ] Will we want more than one internal application to have this functionality? (almost always, "yes")
    #- [ ] Does this record have meaning outside of an associated business object?
    #    - e.g. Accesses don't have meaning outside of a request, so they don't need their own API.
   """
  newapi_2:
   """
    ## Characteristics of Good APIs
    #- APIs return simple objects.
    #- APIs have small code bases. (the requests-api is almost too big already)
    #- Share code between APIs as minimally as possible. (use other APIs where you can)
    #  - It's OK if more than the one API has a `User` model, but those models should be very spartan.
    #  - It's OK for an API to have a GUI as long as it doesn't have special privileges not exposed via API. (a.k.a. the GUI is a consumer of it's own API)
    #  - APIs should provide swagger documentation, _especially_ for internal only endpoints
    #  - New APIs add a module to [cover_my_api](https://git.innova-partners.com/cmm/cover_my_api)
   """
  newapi_3:
    """
     for more info:
       > https://git.innova-partners.com/gist/mlorenz/220
    """
  checklists:
   """
      available checklists:
      devmotron checklist me staging
      devmotron checklist me regression
      devmotron checklist me deploy
      devmotron checklist me pull request
      devmotron checklist me new app
      devmotron checklist me new api
   """

