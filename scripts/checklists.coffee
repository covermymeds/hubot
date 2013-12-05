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

  robot.respond /(checklist)( me)? (deploy|deployment)/i, (msg) ->
    checklist_type = "deploy"
    msg.send Checklists[checklist_type]


  robot.respond /(test)( me)? (.*)/i, (msg) ->
    msg.send msg.match[3]





Checklists =
  staging:
   """
      Checklist for staging CMM_PHP: see the README
      https://git.innova-partners.com/cmm/CMM_PHP#change-management
      
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

      Checklist for testing a deploy:
      [ ] 'bundle exec rake prod'
          > run at least 3 times for intermittent errors

      [ ] relevant manual testing (depends on what changed)

      [ ] errbit.covermymeds.com
          > monitor for new errors

      [ ] close issues
   """
  pull_request:
   """
      Steps for a pull request: 
      https://git.innova-partners.com/cmm/CMM_PHP#change-management

      > next: staging
   """
  checklists:
   """
      available checklists:
      devmotron checklist me staging
      devmotron checklist me regression
      devmotron checklist me deploy
      devmotron checklist me pull request
   """

