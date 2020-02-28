#
# Project Euler Problem 44
# Soren Rasmussen 5/12/2015
#
#!/usr/bin/python


# Create the nth pentagonal number
def P(n):
    return (n*(3*n-1))/2

#------Main-------    

pList = []
n = 10000
#n = 10
end = P(n)

for i in range(1,n):
    pList.append(P(i))


for i in range(2,n-1):
    for j in range(1, i):
        dif = pList[i] - pList[j]
        if dif in pList:
            sum = pList[i] + pList[j]
            if sum > end:
                print "out of range"
            if sum in pList:
                print "D =", dif


print "Fin"        
