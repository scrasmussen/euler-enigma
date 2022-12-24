#-----------------------------------------------------------------------
#                     Day 10: Cathode-Ray Tube
#-----------------------------------------------------------------------
using DelimitedFiles
file="input/2022-10-input.txt"
# file="input/2022-10-test.txt"

function readFile()
    f = open(file,"r")

    # read array from file
    init = true
    global A
    for line in eachline(f)
        A_s = split(line," ")
        if (A_s[1] == "noop")
            a2 = 0
        else
            a2 = parse(Int, A_s[2])
        end
        a = (A_s[1], a2)
        A = init ? [a] : append!(A,[a])
        init = false
    end
    return A
end

# instructions
# addx V: takes 2 cycles, X register add V
# noop: takes 1 cycle, no effect
function process(instructions)
    sum = 0
    count = 0
    cycle = 1
    X = 1
    for (val, i) in instructions
        # println(X," ",i)
        # println(cycle, ": X = ", X)
        if ((cycle+20)%40 == 0) || ((cycle+20)%40 == 39 && val == "addx")
            sum += X * (count * 40 + 20)
            println("cycle: ", cycle, " m ", X * (count*40+20),
                    "=", X,"*(",count,"*",40,"+",20,")")
            count += 1
        end

        if val == "noop"
            cycle += 1
        else
            cycle += 2
            X += i
        end
    end
    return sum
end

function write_CRT(cycle, X)
    CRT = (cycle-1)%40
    # println(CRT, " :: ", X)
    if (CRT == 0)
        println()
    else
        if (CRT == X-1 || CRT == X || CRT == X+1)
            print("X")
        else
            print(".")
        end
    end
end

function process_and_draw(instructions)
    sum = 0
    count = 0
    cycle = 1
    X = 1
    CRT = 1
    for (val, i) in instructions
        # println(X," ",i)
        # println(cycle, ": X = ", X)
        if ((cycle+20)%40 == 0) || ((cycle+20)%40 == 39 && val == "addx")
            sum += X * (count * 40 + 20)
            # println("cycle: ", cycle, " m ", X * (count*40+20),
            #         "=", X,"*(",count,"*",40,"+",20,")")
            count += 1
        end

        if val == "noop"
            write_CRT(cycle, X)
            cycle += 1
        else
            write_CRT(cycle, X)
            cycle += 1
            write_CRT(cycle, X)
            cycle += 1
            X += i
        end
    end
    return sum
end

function problem1()
    instructions = readFile()
    val = process(instructions)
    println("Sum of the signal strengths is ", val)
end

function problem2()
    instructions = readFile()
    val = process_and_draw(instructions)
    println()
end


# problem1()
problem2()
