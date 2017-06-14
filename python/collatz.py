# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt

def collatz_s(n, s):
    if(n == 1):
        return s
    elif(n % 2):
        return collatz_s(3*n + 1, s + 1)
    else:
        return collatz_s(n/2, s + 1)

def collatz(n):
    return collatz_s(n, 0)
    
def m_collatz():
    memo = {1: 0}
    def cf(x):
        if x not in memo:
            if(x % 2 == 0):
                memo[x] = cf(x/2) + 1
            else:
                memo[x] = cf(3*x + 1) + 1
        return memo[x]
        
    return cf
    
m_c = m_collatz()

def plot_collatz(r):
    return plt.plot(r, map(m_c, r), '.')
    