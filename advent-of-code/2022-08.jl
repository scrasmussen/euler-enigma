#-----------------------------------------------------------------------
#                        Day 8: Treetop Tree House
#-----------------------------------------------------------------------
using DelimitedFiles
file="input/2022-08-input.txt"
# file="input/2022-08-test.txt"

function readFile()
    f = open(file,"r")

    # read array from file
    init = true
    global A
    for line in eachline(f)
        A_s = split(line,"")
        a = [parse(Int,i) for i in A_s]
        a = reshape(a, 1, length(a))
        A = init ? a : vcat(A,a)

        init = false
    end
    return A
end

function getScenicScore(A,ii,jj)
    height = A[ii,jj]
    east_score = 0
    west_score = 0
    north_score = 0
    south_score = 0

    for i in ii+1:size(A)[1]
        south_score += 1
        if A[i,jj] >= height
            break
        end
    end
    for i in ii-1:-1:1
        north_score += 1
        if A[i,jj] >= height
            break
        end
    end
    for j in jj+1:size(A)[2]
        east_score += 1
        if A[ii,j] >= height
            break
        end
    end
    for j in jj-1:-1:1
        west_score += 1
        if A[ii,j] >= height
            break
        end
    end

    if (ii == 1 || jj == 1 || ii == size(A)[1] || jj == size(A)[2])
        score = 0
    else
        score = north_score * west_score * east_score * south_score
    end

    return score
end

function problem2()
    A = readFile()
    visible = zeros(Int,size(A))
    maxScenicScore = 0
    for i in 1:size(A)[1]
        for j in 1:size(A)[2]
            scenicScore = getScenicScore(A, i, j)
            if scenicScore > maxScenicScore
                maxScenicScore = scenicScore
            end
        end
    end

    # display(A)
    # println()
    println("The highest scenic score is ", maxScenicScore)
end



function problem1()
    A = readFile()
    visible = zeros(Int,size(A))

    for i in 1:size(A)[1]
        tallest = -1
        for j in 1:size(A)[2]
            if A[i,j] > tallest
                visible[i,j] = 1
                tallest = A[i,j]
            end
        end
    end
    for j in 1:size(A)[1]
        tallest = -1
        for i in 1:size(A)[2]
            if A[i,j] > tallest
                visible[i,j] = 1
                tallest = A[i,j]
            end
        end
    end
    for i in size(A)[1]:-1:1
        tallest = -1
        for j in size(A)[2]:-1:1
            if A[i,j] > tallest
                visible[i,j] = 1
                tallest = A[i,j]
            end
        end
    end
    for j in size(A)[1]:-1:1
        tallest = -1
        for i in size(A)[2]:-1:1
            if A[i,j] > tallest
                visible[i,j] = 1
                tallest = A[i,j]
            end
        end
    end

    # display(visible)
    println()
    println("The number of visible trees is ", sum(visible))
end

# problem1()
problem2()
