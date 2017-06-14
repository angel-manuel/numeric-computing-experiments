# -*- coding: utf-8 -*-
"""
Created on Sun Feb 22 12:30:37 2015

@author: arturo
"""

import math

def primes(under):
    primes = []
    i = 2
    while i < under:
        sq_i = math.floor(math.sqrt(i))
        #prime = all(map(lambda (p): i % p != 0, filter(lambda (p): p <= sq_i, primes)))
        prime = True
        for p in primes:
            if(p > sq_i):
                break
            if(i % p == 0):
                prime = False
                break

        if prime:
            primes.append(i)
            yield i

        i = i + 1
        
def goldbach(n):
    ps = [p for p in primes(n)]
    g = 0
    for i in primes(n/2):
        if(n-i in ps):
            g = g + 1
    return g
    