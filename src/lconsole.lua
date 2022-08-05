local es = string.char(27)
local toblock
toblock = function()
  return io.write(es .. '[2 q')
end
local tobar
tobar = function()
  return io.write(es .. '[6 q')
end
local tounderline
tounderline = function()
  return io.write(es .. '[4 q')
end
local lconsole = { }
lconsole.ansicolors = require('ansicolors')
local color = lconsole.ansicolors
lconsole.log = function(str)
  return print(color("%{dim bright white underline}i%{reset} " .. tostring(str)))
end
lconsole.alert = function(str)
  return print(color("%{bright red}!%{reset} " .. tostring(str)))
end
lconsole.warn = function(str)
  return print(color("%{bright yellow}!%{reset} " .. tostring(str)))
end
lconsole.input = function(str, typein)
  typein = typein or 'oneline'
  local _exp_0 = typein
  if 'oneline' == _exp_0 then
    io.write(color("%{bright green}?%{reset} " .. tostring(str)))
    io.flush()
  elseif 'twoline' == _exp_0 then
    print(color("%{bright green}?%{reset} " .. tostring(str)))
    io.write(color("%{yellow}>>> %{reset}"))
    io.flush()
  end
  tobar()
  local input = io.read()
  toblock()
  return input
end
lconsole.choice = function(str, default)
  io.write(color("%{bright green}?%{reset} " .. tostring(str) .. "[%{bright green}Y%{reset}|%{bright red}N%{reset}] "))
  tobar()
  local choice = io.read():lower()
  toblock()
  if choice:find('^n') then
    return false
  end
  if choice:find('^y') then
    return true
  end
end
lconsole.numchoice = function(str, tblchoice)
  local result = ''
  for i, v in pairs(tblchoice) do
    print(color("  (%{green}" .. tostring(i) .. "%{reset}) %{bright white}" .. tostring(v.text)))
  end
  tobar()
  io.write(color("\n%{bright green}?%{reset} " .. tostring(str) .. ": "))
  local choice = io.read()
  toblock()
  return tblchoice[tonumber(choice)].code()
end
return lconsole
