from __future__ import division
#
# Project Euler Problem 49
# Soren Rasmussen 5/15/2015
#
#!/usr/bin/python
from itertools import permutations
from mathfunctions import sieveOfEratosthenes

def eToNum(e):
        num = 0
        for i in range(4):
            num += e[-(i+1)]*10**i
        return num

def isPermutation(a, b, c):
    num = [int(x) for x in str(a)]
    perm = permutations(num)
    list = []

    count = 0
    for e in perm:
        k = eToNum(e)
        list.append(k)
    
    if a in list and b in list and c in list:
        return True
    return False


#------Main-------    
def main():
    primes = sieveOfEratosthenes(10000)

    for i in range(1000,3333):
        if i in primes:
            for j in range(1000,3333):
                if i+j in primes and i+2*j in primes:
                    if isPermutation(i, i+j, i+2*j):
                        print i, i+j, i+2*j

    print "Fin"  

if __name__=="__main__":
    main()


