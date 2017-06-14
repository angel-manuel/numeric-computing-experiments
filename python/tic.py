# -*- coding: utf-8 -*-
"""
Created on Sun Feb 22 11:46:44 2015

@author: arturo
"""

import time

start_time = time.time()
# your code
elapsed_time = time.time() - start_time

def tic():
    global start_time    
    start_time = time.time()
    
def tac():
    return time.time() - start_time
