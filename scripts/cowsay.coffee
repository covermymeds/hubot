# Description:
#   What does a cow say?
#
# Dependencies:
#   none
#
# Configuration:
#   none
#
# Commands:
#   the cow says, "<phrase>"
#   the confused cow says, "<phrase>"
#   the surprised cow says, "<phrase>"
#   the dizzy cow says, "<phrase>"
#   the raspberry cow says, "<phrase>"
#
# Notes:
#   Just nerding around
#
# Author:
#   Mark J. Lorenz [CoverMyMeds]

module.exports = (robot) ->
  cleanup_cow_type = (cow)->
    (cow + "").trim()


  speech_bubble = (message)->
  robot.hear /the(?:(\s\w*\s)|\s)cow says, "(.*)"/i, (msg)->
    cow_type = cleanup_cow_type msg.match[1]
    bubble   = Bubble           msg.match[2]
    msg.send bubble + Cows[cow_type]

Bubble = (message)->
  makeBar = (message)->
    bar = '<-'
    for letter in [1..message.length]
      bar += '-'
    bar += '->'

  """
  #{makeBar(message)}
  < #{message} >
  #{makeBar(message)}

  """
Cows =
  undefined:
   """
   \    \\   ^__^
   \     \\  (oo)\\_______
   \        (__)\\       )\\/\\
   \            ||----w |
   \            ||     ||
    """
  confused:
   """
   \    \\   ^__^
   \     \\  (Oo)\\_______
   \        (__)\\       )\\/\\
   \            ||----w |
   \            ||     ||
    """
  surprised:
   """
   \    \\   ^__^
   \     \\  (OO)\\_______
   \        (__)\\       )\\/\\
   \            ||----w |
   \            ||     ||
    """
  dizzy:
   """
   \    \\   ^__^
   \     \\  (@@)\\_______
   \        (__)\\       )\\/\\
   \            ||----w |
   \            ||     ||
    """
  raspberry:
   """
   \    \\   ^__^
   \     \\  (xx)\\_______
   \        (__)\\       )\\/\\
   \         U  ||----w |
   \            ||     ||
    """

