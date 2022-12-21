#-----------------------------------------------------------------------
#                        Day 4: Camp Cleanup
#-----------------------------------------------------------------------
using DelimitedFiles
file="input/2022-04-input.txt"
# file="input/2022-04-test.txt"

function contained2(a,b,c,d)
    if (a == c || a == d || b == c || b == d)
        return true
    end
    if (a > c && a < d)
        return true
    end
    if (b > c && b < d)
        return true
    end
    if (a < c && b > d)
        return true
    end

    return false
end

function problem2()
    f = open(file,"r")
    global score = 0
    for (i,pair) in enumerate(eachline(f))
      (a,b,c,d) = [parse(Int, p) for p in split(replace(pair, '-'=>','), ',')]
      score += contained2(a,b,c,d) ? 1 : 0
    end

    println("Problem 2's score is: ", score)
end


function contained1(a,b,c,d)
    if (d <= b && c >= a)
        return true
    end
    if (d >= b && c <= a)
        return true
    end
    return false
end

function problem1()
    f = open(file,"r")
    global score = 0
    for (i,pair) in enumerate(eachline(f))
      (a,b,c,d) = [parse(Int, p) for p in split(replace(pair, '-'=>','), ',')]
      score += contained1(a,b,c,d) ? 1 : 0
    end

    println("Problem 1's score is: ", score)
end

# problem1()
problem2()
