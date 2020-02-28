#!/usr/bin/python
from itertools import permutations

# Create Prandigital numbers from a to (b-1)
def createPandigital(a, b):
    list = []
    
    for i in range(a, b):
        list.append(i)

    plist = permutations(list)
    list = []

    for e in plist:
        if e[0] == 0:
            pass
        else:
            list.append(e)

    return list

def createNumList(list):
    numList = []
    
    for i in range(1,8):
        num = 0
        for k in range(3):
            num += 10**(2-k) * list[i+k]
        numList.append(num)

    return numList

def isSubStringDiv(list, primeList):
    numList = createNumList(list)
    #numList = createNumList((1, 4, 0, 6, 3, 5, 7, 2, 8, 9))
    for num, prime in zip(numList, primeList):
        if (num % prime) != 0:
            return 0 

    s = reduce(lambda x,y: x+str(y), list, '')
    return int(s)


#------Main-------    
def main() :
    createPandigital(0,4)

list = createPandigital(0,10)
# create primes that are the division list
primes = (2, 3, 5, 7, 11, 13, 17)

sum = 0

for e in list:
    num = isSubStringDiv(e, primes)
    if num > 0:
        sum += num
        print num

print "The sum of the pandigital numbers is", sum
print "Fin"        
