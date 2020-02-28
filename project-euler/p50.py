#
# Project Euler Problem 50
# Soren Rasmussen 5/15/2015
#
#!/usr/bin/python
from mathfunctions import sieveOfEratosthenes
 
#------Main-------    
def main():
    n = 1000000
    prime = sieveOfEratosthenes(n)
    l = len(prime)
    maxcount = 1

    for i in range(l):
	    sum = prime[i]
	    j = i
	    count = 0
	    while sum < n:
		    j += 1
		    count +=1
		    if j >= l: break
		    sum += prime[j]
		    if sum in prime:
			    if count > maxcount:
				    maxcount = count
				    print sum,"with maxcount",maxcount
	    
    print "Fin"  

if __name__=="__main__":
    main()


