#
# Project Euler Problem 46
# Soren Rasmussen 5/13/2015
#
#!/usr/bin/python
from math import sqrt

def seive(n):
    primes = [0]*n
    output = []
    for i in range(2,n):
        if primes[i] == 0:
            output.append(i)            
            j=2*i
            while j < n:
                primes[j] = 1
                j+=i
    return output

def goldbachConjecture(i, primes):
    for p in primes:
        if i-p < 0:
            break
        if sqrt((i - p) / 2).is_integer() == True:
            return True
    return False

#------Main-------    
n = 10000; i = 29
primes = seive(n)
found = False

while not found:
    if i not in primes:
        if goldbachConjecture(i, primes) == False:
            print "False for", i

    i += 2
    if i > n:
        found = True

print "Fin"        
