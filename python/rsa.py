# -*- coding: utf-8 -*-
import math
from _random import Random

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

def first_prime_after(n):
    for p in primes(n*2):
        if(p > n):
            return p

def mcd(a, b):
    if b > a:
        return mcd(b, a)

    if b == 0:
        return a

    return mcd(b, a % b)

def find_coprime_after(t, n):
    while mcd(t, n) != 1:
        n = n + 1
    return n

def emcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = emcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modinv(E, T):
    gcd, x, y = emcd(E, T)
    if gcd != 1:
        return None
    else:
        return x % T

def gen_keys():
    r = Random()
    min_p = (10**4)*(1+100*r.random())
    min_q = (10**4)*(1+100*r.random())
    p = first_prime_after(min_p)
    q = first_prime_after(min_q)
    T = (p-1)*(q-1)
    N = p*q
    E = 65537 #mcd(E,T)==1 and E < T
    D = modinv(E, T) #D*E = 1 (mod T)

    return dict(public=[E,N], private=[D,N]);


def modExp(a, b, m) :
    """Computes a to the power b, modulo m, using binary exponentiation
    """
    a %= m
    ret = None

    if b == 0 :
        ret = 1
    elif b%2 :
        ret = a * modExp(a,b-1,m)
    else :
        ret = modExp(a,b//2,m)
        ret *= ret

    return ret%m

def RSA_operation(M, pair):
    return modExp(M, pair[0], pair[1])

def encrypt(M, key):
    return RSA_operation(M, key['public'])

def decrypt(S, key):
    return RSA_operation(S, key['private'])
