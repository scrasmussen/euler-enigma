from __future__ import division
#
# Project Euler Problem 47
# Soren Rasmussen 5/13/2015
#
#!/usr/bin/python
from mathfunctions import sieveOfEratosthenes

def simplifyList(primeFactor):
    output = []
    for i in range(len(primeFactor)):
            pass
            #primeFactor[i] *= 

    return primeFactor

def primeFactor(i, primes):
    primeFactor = []

    for p in reversed(primes):
        count = 0

        while (i/p).is_integer() and i/p!=0.0:
            i = i/p
            count += 1

        if count > 0:
            primeFactor.append(p**count)


    primeFactor = simplifyList(primeFactor)
    return primeFactor

def consecutiveDistinctPrimeFactors(i, pList, primes):
    p4 = primeFactor(i, primes)
    p1 = pList.pop(0)
    p2 = pList[0]
    p3 = pList[1]
    pList.append(p4)

    if len(p1) != 4:
        return False
    if len(p2) != 4:
        return False
    if len(p3) != 4:
        return False
    if len(p4) != 4:
        return False

    return True

def test(list):
    list[0] = -1

#------Main-------    
def main():
    n = 200000
    start = 100
    primes = sieveOfEratosthenes(n)

    p1 = primeFactor(start, primes)
    p2 = primeFactor(start+1, primes)
    p3 = primeFactor(start+2, primes)
    pList = [p1, p2, p3]

    for i in range(start+3,n):
        if i%1000 == 0:
            print "at",i
        if consecutiveDistinctPrimeFactors(i, pList, primes):
            print i-3, i-2, i-1, i
            return

    print "Fin"        


if __name__=="__main__":
    main()
