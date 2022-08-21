require 'moonscript'

util = require 'util'
color = require 'ansicolors'

toblock = -> io.write '\27[2 q'
tobar = -> io.write '\27[6 q'

class lconsole
  log: (str) =>
    print color "%{dim white}i%{reset} #{str}"

  error: (str) =>
    print color "%{red}!%{reset} #{str}"

  warn: (str) =>
    print color "%{bright yellow}!%{reset} #{str}"

  success: (str, exit) =>
    exit or= false

    if not exit
      print color "\a%{bright green}✓%{reset} #{str}"
    else
      print color "\a%{bright green}✓%{reset} #{str}"
      os.exit!

  failure: (str, exit) =>
    exit or= false

    if not exit
      print color "\a%{bright red}✗%{reset} #{str}"
    else
      print color "\a%{bright red}✗%{reset} #{str}"
      os.exit 1
  
  input: (str,ptype,clr) =>
    clr or= 'green'
    ptype or= 'line'

    if ptype == 'line'
      io.write color "%{bright blue}>%{reset} #{str} : "
    elseif ptype == 'lines'
      io.write color "%{bright blue}>%{reset} #{str}\n%{yellow}> "

    tobar!
    input = io.read!
    toblock!
    
    util.mvup 1
    util.setcol 0
    if ptype == 'line'
      util.clearline 1
      print color "%{bright blue}>%{reset} #{str} : %{#{clr}}#{input}"
    elseif ptype == 'lines'
      util.clearline 1
      util.mvup 1
      util.clearline 1
      print color "%{bright blue}>%{reset} #{str}\n%{yellow}> %{#{clr}}#{input}"

    return input
    


  numchoice: (tbl,str,tsize) =>
    tsize or= 1
    str or= 'Choose'

    for i,v in pairs tbl
      print color "#{ string.rep(' ', tsize) }(%{green}#{i}%{reset}) #{v.title}"

    print ''
    choice = @input str,'line','dim blue'

    if choice\find('^%D+$') or not tbl[tonumber choice]
      @failure("Invalid input!",true)

    tbl[tonumber choice].event!


return lconsole
