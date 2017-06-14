# -*- coding: utf-8 -*-
"""
Created on Sun Jan 11 11:16:55 2015

@author: arturo
"""

def describe(L):
    ret = []
    L.reverse()
    last = L.pop()
    count = 1
    while(L):
        cur = L.pop()
        if(cur == last):
            count += 1
        else:
            ret.extend([count, last])
            count = 1
            last = cur
            
    ret.extend([count, last])
            
    return ret
    
def super_describe(L, n):
    while(n):
        L = describe(L)
        n-=1
    return L
