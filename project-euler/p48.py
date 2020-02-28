from __future__ import division
#
# Project Euler Problem 48
# Soren Rasmussen 5/15/2015
#
#!/usr/bin/python

def series(n):
    sum = 0
    for i in range(1,n):
        num = i**i
        sum+=i**i

    sum = str(sum)
    result = ""
    for i in range(1,11):
        result = sum[-i] + result
    return result


#------Main-------    
def main():
    answer = series(1000)
    print answer
    print "Fin"  

if __name__=="__main__":
    main()
