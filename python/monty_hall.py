from random import Random

r = Random()

doors = (1, 2, 3)

filter(lambda (x): not(x%2==0), doors)

def simulate():
  p = r.choice(doors)
  c = r.choice(doors)

  change = r.choice((True, False))

  if change:
    win = not(c == p)
  else:
    win = (c == p)

  return (change, win)

simulate()

def count_simulation(n):
  cw = 0
  cl = 0
  ncw = 0
  ncl = 0

  for i in range(n):
    sim = simulate()
    if sim[0]:
      if sim[1]:
        cw += 1
      else:
        cl += 1
    else:
      if sim[1]:
        ncw += 1
      else:
        ncl += 1

  return (cw, cl, ncw, ncl)

count_simulation(1000000)