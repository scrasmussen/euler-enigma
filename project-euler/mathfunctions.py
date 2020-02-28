#
# Project Euler Math Functions
# Soren Rasmussen 5/14/2015
#
#!/usr/bin/python

def sieveOfEratosthenes(n):
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
