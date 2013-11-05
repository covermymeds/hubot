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


  robot.respond /(test)( me)? (.*)/i, (msg) ->
    msg.send msg.match[3]





Checklists =       
  staging:
   """
      Checklist for staging:
      [ ] 'git checkout master; git pull'
          > to ensure you're rebasing against most recent
      [ ] 'git checkout <your branch>'
      [ ] 'git rebase master'
      [ ] resolve conflicts
      [ ] git push -f
    """      

