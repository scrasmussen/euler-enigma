#
# Project Euler Problem 45
# Soren Rasmussen 5/13/2015
#
#!/usr/bin/python

# Create the nth triangular number
def T(n):
    return int(n*(n+1)/2)

# Create the nth pentagonal number
def P(n):
    return int(n*(3*n-1)/2)

# Create the nth hexagonal number
def H(n):
    return int(n*(2*n-1))

#------Main-------    

tSet = []
pSet = []
hSet = []


tMin = 285
pMin = 165
hMin = 143
n = 100000

for i in range(hMin,n):
    hSet.append(H(i))

num = P(pMin); i = pMin; H_n = H(n);
while num < H_n :
    i += 1
    num = P(i)
    pSet.append(num)

num = T(tMin); i = tMin;
while num < H_n :
    i += 1
    num = T(i)
    tSet.append(num)

for e in hSet:
    if e in pSet:
        if e in hSet:
            print e
            


print "Fin"        
