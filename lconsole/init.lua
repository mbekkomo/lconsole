local C = require 'ansicolorsx'
local L = require 'Lust'
local rawterm = require 'lconsole.rawterm'

local format = string.format
local concat = table.concat
local write = io.write

local function argerror(n,fn,msg)
	if msg then
		error(
			format("bad argument #%d to '%s' (%s)",n,fn,msg)
		)
	else
		error(
			format("bad argument #%d to '%s'",n,fn)
		)
	end
end

local lconsole = {}

function lconsole.log(...)
		print(C(L"%{bright tcolor:248}i%{reset} %{bright tcolor:250}$msg":gen{
			msg = concat({...},' ')
		}))
end

function lconsole.error(...)
	print(C(L"%{bright tcolor:88}X%{reset} %{bright tcolor:160}$msg":gen{
		msg = concat({...},' ')
	}))
end

function lconsole.debug(...)
	print(C(L"%{bright tcolor:111}i%{reset} %{bright tcolor:117}$msg":gen{
		msg = concat({...},' ')
	}))
end

function lconsole.success(...)
	print(C(L"%{bright tcolor:42}✓%{reset} %{bright tcolor:47}$msg":gen{
		msg = concat({...},' ')
	}))
end

function lconsole.read(msg,n)
	if n ~= nil and type(n) ~= "number" then
		argerror(2,"read","expected number, got "..type(n)) end

	write(
		C(L"%{bright black}?%{reset} %{bright green}$msg%{reset} ":gen{
		 msg = msg
	 }
	))

	local input = n and
		io.read(n) or io.read()

	return input
end

lconsole.read("lua?")
