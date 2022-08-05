sleep = (n) ->
  os.execute "sleep #{n}"

spin = {
  '.','..','...'
}

round = 1
spinuntil = 0

while true
  break if spinuntil == 10

  print "#{spin[round]} Test#{string.rep(' ',#'test')}"
  sleep 1
  print "\27[2A\27[2K\27[0G"

  if round >= 3
    round = 1
  else
    round += 1

  spinuntil += 1


