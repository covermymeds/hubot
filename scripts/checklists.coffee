# Description:
#   displays various checklists
#
# Commands:
#   hubot checklist me stage - checklist for staging

module.exports = (robot) ->
  #robot.respond /(image|img)( me)? (.*)/i, (msg) ->
  robot.respond /(checklist)( me)? (stage|staging)/i, (msg) ->
    msg.send Checklists[staging]


  robot.respond /(test)( me)? (.*)/i, (msg) ->
    msg.send msg.match[3]





Checklists =       
  staging:
   """
      Checklist for staging:
      [ ] 'git checkout master; git pull'
          > to ensure you're rebasing against most recent
      [ ] 'git rebase master'
      [ ] resolve conflicts
      [ ] git push -f
    """      

