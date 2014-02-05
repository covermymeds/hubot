# Description:
#   displays various information
#
# Commands:
#   hubot how do i make gifs

module.exports = (robot) ->
  capture_name = (name)->
    (name + "").trim()

  robot.respond /(how do i make )(a gif|gifs)/i, (msg) ->
    wikilist_type = "gifs"
    msg.send Wikilists[wikilist_type]

  robot.respond /(how do i )(set an epa response|use central)/i, (msg) ->
    wikilist_type = "central"
    msg.send Wikilists[wikilist_type]

  #robot.respond /(remind|get|wiki)( me)? (git)/i, (msg) ->
  #  wikilist_type = "gitcommands"
  #  msg.send Wikilists[wikilist_type]


Wikilists =
  gifs:
   """
   > use quicktime to make a full .mov file
   > then use ffmpeg and gifsicle:
     > `ffmpeg -i in.mov -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > out.gif`
       details %{
         `-r 10` tells ffmpeg to reduce the frame rate from 25 fps to 10
         `-s 600x400` tells ffmpeg the max-width and max-height
         `--delay=3` tells gifsicle to delay 30ms between each gif
         `--optimize=3` requests that gifsicle use the slowest/most file-size optimization
       }

   for more information:
     > http://thenextweb.com/apple/2011/01/15/how-to-record-quick-easy-screencast-videos-with-mac-osx/#!uoIbQ
     > https://gist.github.com/dapplebeforedawn/6746343
   """
  central:
   """
   set the user up
     > account should be CoverMyMeds Pro Demo
     > Cmm central demo epa should be enabled

   send the ohio/apple/sample epa to plan
     > `devmotron get me epa` for details

   staging.central.covermymeds.com
     > login as demo@covermymeds.com
     > pw: testing123
     > find the epa, and set the outcome
   """
