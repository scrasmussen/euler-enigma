# +++++++++++++++
# PROBLEM DISCRIPTION
# +++++++++++++++
#A googol (10^100) is a massive number: one followed by one-hundred zeros; 
# 100^100 is almost unimaginably large: one followed by two-hundred zeros. 
# Despite their size, the sum of the digits in each number is only 1.
#
# Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
# 
# +++++++++++++++
import numpy as np
import math

def digitalSum(n):
    nDigits = [int(i) for i in str(n)]
    sum = 0
    for digit in nDigits:
        sum += digit
    return sum

maxDigitalSum = 0    
num = 1235321
a = 1
done = False

while not done:
    a += 1
    for b in range(1,100):
        num = a ** b
        sum = digitalSum(num)
        if sum > maxDigitalSum:
            maxDigitalSum = sum
            print a, "^" , b, " with digital sum of ", maxDigitalSum, " is the new max"

    if (a >= 100): done = True

digitalSum(num)
print "Fin"

