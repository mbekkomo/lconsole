es = string.char 27

toblock = -> io.write es..'[2 q'
tobar = -> io.write es..'[6 q'
tounderline = -> io.write es..'[4 q'



lconsole = {}
lconsole.ansicolors = require 'ansicolors'

color = lconsole.ansicolors

lconsole.log = (str) ->
  print color "%{dim bright white underline}i%{reset} #{str}"

lconsole.alert = (str) ->
  print color "%{bright red}!%{reset} #{str}"

lconsole.warn = (str) ->
  print color "%{bright yellow}!%{reset} #{str}"

lconsole.input = (str,typein) ->
  typein or= 'oneline'

  switch typein
    when 'oneline'
      io.write color "%{bright green}?%{reset} #{str}"
      io.flush!
    when 'twoline'
      print color "%{bright green}?%{reset} #{str}"
      io.write color "%{yellow}>>> %{reset}"
      io.flush!
  
  tobar!
  
  input = io.read!

  toblock!
  return input

lconsole.choice = (str,default) ->
      

  io.write color "%{bright green}?%{reset} #{str}[%{bright green}Y%{reset}|%{bright red}N%{reset}] "

  tobar!

  choice = io.read!\lower!

  toblock!
  
  return false if choice\find '^n'
  return true if choice\find '^y'


  

return lconsole
