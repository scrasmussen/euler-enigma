#-----------------------------------------------------------------------
#                        Day 9: Rope Bridge
#-----------------------------------------------------------------------
using DelimitedFiles
file="input/2022-09-input.txt"
# file="input/2022-09-test.txt"

function readFile()
    f = open(file,"r")

    # read array from file
    init = true
    global A
    for line in eachline(f)
        A_s = split(line," ")
        a = (A_s[1], parse(Int, A_s[2]))
        A = init ? [a] : append!(A,[a])

        init = false
    end
    return A
end

function setupBoard(H)
    board = zeros(Int8, (1000,1000))
    board[H[1],H[2]] = 1
    return board
end

function init_rope(moves)
    H = [500,500]
    T = [500,500]
    return (H,T)
end


function problem1()
    moves = readFile()
    (H,T) = init_rope(moves)
    board = setupBoard(H)

    for (dir, count) in moves
        for i in 1:count
            # move head
            if (dir == "R")
                H[2] += 1
            elseif (dir == "L")
                H[2] -= 1
            elseif (dir == "U")
                H[1] -= 1
            elseif (dir == "D")
                H[1] += 1
            end

            # move tail
            if (dir == "R")
                if abs(H[2] - T[2]) > 1
                    if  abs(H[1] - T[1]) > 0
                        T[1] += H[1] - T[1]
                    end
                    T[2] += 1
                end
            elseif (dir == "L")
                if abs(H[2] - T[2]) > 1
                    if  abs(H[1] - T[1]) > 0
                        T[1] += H[1] - T[1]
                    end
                    T[2] -= 1
                end
            elseif (dir == "U")
                if abs(H[1] - T[1]) > 1
                    if  abs(H[2] - T[2]) > 0
                        T[2] += H[2] - T[2]
                    end
                    T[1] -= 1
                end
            elseif (dir == "D")
                if abs(H[1] - T[1]) > 1
                    if  abs(H[2] - T[2]) > 0
                        T[2] += H[2] - T[2]
                    end
                    T[1] += 1
                end
            end
            board[T[1],T[2]] = 1
            # println("----", T[1],",",T[2])
        end
        # display(board)
        # println()
        # exit(0)
    end

    # display(board)
    # println()
    println("Number of unique places visited by tail: ", sum(board))
end



problem1()
# problem2()
