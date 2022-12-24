#-----------------------------------------------------------------------
#                        Day 6: Tuning Trouble
#-----------------------------------------------------------------------
file="input/2022-06-input.txt"
# file="input/2022-06-test.txt"

function isMarker(str)
    A = split(str, "")
    len = length(str)
    for i in 1:len-1
        for j in i+1:len
            if A[i] == A[j]
                return false
            end
        end
    end

    return true
end

function problem2()
    f = open(file,"r")
    line = readline(f)
    count = 1
    marker_start = 0

    for count in 1:length(line)-13
        if isMarker(line[count:count+13])
            marker_start = count+13
            break
        end
    end
    println("The first marker is after character ", marker_start)
end

function problem1()
    f = open(file,"r")
    line = readline(f)
    count = 1
    marker_start = 0

    for count in 1:length(line)-3
        if isMarker(line[count:count+3])
            marker_start = count+3
            break
        end
    end
    println("The first marker is after character ", marker_start)
end

# problem1()
problem2()
