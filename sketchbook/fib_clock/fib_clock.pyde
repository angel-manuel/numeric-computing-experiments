import random

def setup():
    size(800, 500)
    frameRate(1)
    
def vec_sum(v1, v2):
    return map(lambda(p): p[0] + p[1], zip(v1, v2))

def twelfe_to_fib_rec(num, used):
    if(num == 0):
        return used
    
    fibs = [5, 3, 2, 1, 1]
    
    filt = filter(lambda (tri): num >= tri[0] and tri[1] == 0,
           zip(fibs, used, range(0, 5)))
    
    if(len(filt) == 0):
        return [1, 1, 1, 1, 1]
    
    c = filt[0]
    
    used[c[2]] = 1
    
    return twelfe_to_fib_rec(num - c[0], used)
    
def twelfe_to_fib(num):
    return twelfe_to_fib_rec(num, [0, 0, 0, 0, 0])
    
def draw():
    background(255)
    
    s = (second()) / 5
    m = (minute()) / 5
    h = hour()
    
    if s == 0:
        s = 12
    
    if m == 0:
        m = 12
    
    if h == 0:
        h = 12
    
    sfib = twelfe_to_fib(s)
    mfib = twelfe_to_fib(m)
    hfib = twelfe_to_fib(h)
    
    cfib = vec_sum(map(lambda (x): x*2, hfib), mfib)
    squares = [
               (300, 0, 500, 500),
               (0, 200, 300, 300),
               (0, 0, 200, 200),
               (200, 100, 100, 100),
               (200, 0, 100, 100)
               ]

    for c, square in zip(cfib, squares):
        if c == 0:
            fill(255, 255, 255)
        elif c == 1:
            fill(255, 0, 0)
        elif c == 2:
            fill(0, 0, 255)
        else:
            fill(0, 255, 0)
        
        rect(*square)
    
