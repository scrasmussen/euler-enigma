file="input/2022-01-input.txt"

function check_max_array(cal)
    if (cal > max[1])
        global max[3] = max[2]
        global max[2] = max[1]
        global max[1] = cal
    elseif (cal > max[2])
        global max[3] = max[2]
        global max[2] = cal
    elseif (cal > max[3])
        global max[3] = cal
    end
end

function problem1()
    f = open(file,"r")
    global max = 0
    global cal = 0
    global elf = 1
    while ! eof(f)
        l = readline(f)
        if (l == "")
            global elf += 1
            if (cal > max)
                global max = cal
            end
            global cal = 0
        else
            global cal += parse(Int32,l)
        end
    end
    if (cal > max)
        global max = cal
    end
    println("Problem 1 max is: ", max)
end

function problem2()
    f = open(file,"r")
    global max = [0,0,0]
    global cal = 0
    global elf = 1
    while ! eof(f)
        l = readline(f)
        if (l == "")
            check_max_array(cal)
            global elf += 1
            global cal = 0
        else
            global cal += parse(Int32,l)
        end
    end
    check_max_array(cal)

    println("Problem 2 maxs' sum is: ", sum(max), " for ", max)
end

problem1()
problem2()
