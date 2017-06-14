# -*- coding: utf-8 -*-
"""
Created on Sun Mar  1 11:21:53 2015

@author: arturo
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg

def nparr_map(arr, f):
    X, Y, n = arr.shape
    ret = np.zeros([X, Y, 3]);
    for x in range(X):
        for y in range(Y):
            ret[x, y] = f(arr[x, y])
    return ret
    
def copy_at(dst, src, ix, iy):
    dst_x, dst_y, dst_n = dst.shape;
    src_x, src_y, src_n = src.shape;
    
    for x in range(ix, min([ix+src_x, dst_x])):
        for y in range(iy, min([iy+src_y, dst_y])):
            dst[x, y] = src[x - ix, y - iy]
            
    return True

img = mpimg.imread('i.png')

X, Y, n = img.shape

big = np.zeros([3*X, 3*Y, 3])

def pixel_linear(marr):
    def trans(pix):
        pix = np.array([pix[0], pix[1], pix[2]])
        return pix*marr;
    return trans

copy_at(big, nparr_map(img, pixel_linear(np.array([1, 0, 0]))), 0, 0)
copy_at(big, nparr_map(img, pixel_linear(np.array([0, 1, 0]))), X, 0)
copy_at(big, nparr_map(img, pixel_linear(np.array([0, 0, 1]))), 2*X, 0)

copy_at(big, nparr_map(img, pixel_linear(np.matrix([[0, 1, 0],[0, 0, 1],[1, 0, 0]]))), 0, Y)
copy_at(big, nparr_map(img, pixel_linear(np.matrix([[1, 0, 0],[0, 1, 0],[0, 0, 1]]))), X, Y)
copy_at(big, nparr_map(img, pixel_linear(np.matrix([[0, 0, 1],[1, 0, 0],[0, 1, 0]]))), 2*X, Y)

copy_at(big, nparr_map(img, pixel_linear(np.array([1, 1, 0]))), 0, 2*Y)
copy_at(big, nparr_map(img, pixel_linear(np.array([0, 1, 1]))), X, 2*Y)
copy_at(big, nparr_map(img, pixel_linear(np.array([1, 0, 1]))), 2*X, 2*Y)

plt.imshow(big)

mpimg.imsave('out.png', big)
