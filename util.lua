return {
  mvup = function(n)
    io.write('\27['..n..'A')
  end,
  mvdown = function(n)
    io.write('\27['..n..'B')
  end,
  mvright = function(n)
    io.write('\27['..n..'C')
  end,
  mvleft = function(n)
    io.write('\27['..n..'D')
  end,
  setcol = function(n)
    io.write('\27['..n..'G')
  end,
  clearline = function(n)
    io.write('\27['..n..'K')
  end
}
