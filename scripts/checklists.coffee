# Description:
#   displays various checklists
#
# Commands:
#   hubot checklist me stage - checklist for staging

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()


  #robot.respond /(image|img)( me)? (.*)/i, (msg) ->
  robot.respond /(checklist)( me)? (stage|staging)/i, (msg) ->
    #checklist_type = capture_name msg.match[3]
    checklist_type = "staging"
    msg.send Checklists[checklist_type]

  robot.respond /(checklist)( me)? (regression)/i, (msg) ->
    checklist_type = "regression"
    msg.send Checklists[checklist_type]


  robot.respond /(test)( me)? (.*)/i, (msg) ->
    msg.send msg.match[3]





Checklists =
  staging:
   """
      Checklist for staging: https://git.innova-partners.com/cmm/CMM_PHP#change-management
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
    """

