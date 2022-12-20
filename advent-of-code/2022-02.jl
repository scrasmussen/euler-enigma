using DelimitedFiles
file="input/2022-02-input.txt"

function strategy_result_1(elf_choice, self_choice)
    if (self_choice == 'X' )
        starting_score = 1
    elseif (self_choice == 'Y')
        starting_score = 2
    elseif (self_choice == 'Z')
        starting_score = 3
    else
        println("ERROR: invalid self choice ", self_choice)
        exit(-1)
    end

    # Elf choice: A Rock, B Paper, C Scissors
    # Self choice: X Rock, Y Paper, Z Scissors
    if (elf_choice == 'A' && self_choice == 'X')
        return starting_score + 3
    elseif (elf_choice == 'A' && self_choice == 'Y')
        return starting_score + 6
    elseif (elf_choice == 'A' && self_choice == 'Z')
        return starting_score + 0

    elseif (elf_choice == 'B' && self_choice == 'X')
        return starting_score + 0
    elseif (elf_choice == 'B' && self_choice == 'Y')
        return starting_score + 3
    elseif (elf_choice == 'B' && self_choice == 'Z')
        return starting_score + 6

    elseif (elf_choice == 'C' && self_choice == 'X')
        return starting_score + 6
    elseif (elf_choice == 'C' && self_choice == 'Y')
        return starting_score + 0
    elseif (elf_choice == 'C' && self_choice == 'Z')
        return starting_score + 3
    else
        println("ERROR: invalid elf choice ", elf_choice)
        exit(-1)
    end
end

function problem1()
    f = open(file,"r")
    global score = 0
    A = readdlm(f, ' ', Char, '\n')

    for i in 1:size(A,1)
        score += strategy_result_1(A[i,1], A[i,2])
    end
    println("Problem 1's score is: ", score)
end

function strategy_result_2(elf_choice, self_choice)
    if (self_choice == 'X' )
        starting_score = 0
    elseif (self_choice == 'Y')
        starting_score = 3
    elseif (self_choice == 'Z')
        starting_score = 6
    else
        println("ERROR: invalid self choice ", self_choice)
        exit(-1)
    end

    # Elf choice: A Rock, B Paper, C Scissors, 123
    # Self choice: X lose, Y draw, Z Win
    if (elf_choice == 'A' && self_choice == 'X')
        return starting_score + 3
    elseif (elf_choice == 'A' && self_choice == 'Y')
        return starting_score + 1
    elseif (elf_choice == 'A' && self_choice == 'Z')
        return starting_score + 2

    elseif (elf_choice == 'B' && self_choice == 'X')
        return starting_score + 1
    elseif (elf_choice == 'B' && self_choice == 'Y')
        return starting_score + 2
    elseif (elf_choice == 'B' && self_choice == 'Z')
        return starting_score + 3

    elseif (elf_choice == 'C' && self_choice == 'X')
        return starting_score + 2
    elseif (elf_choice == 'C' && self_choice == 'Y')
        return starting_score + 3
    elseif (elf_choice == 'C' && self_choice == 'Z')
        return starting_score + 1
    else
        println("ERROR: invalid elf choice ", elf_choice)
        exit(-1)
    end
end

function problem2()
    f = open(file,"r")
    global score = 0
    A = readdlm(f, ' ', Char, '\n')

    for i in 1:size(A,1)
        score += strategy_result_2(A[i,1], A[i,2])
    end
    println("Problem 2's score is: ", score)
end


# problem1()
problem2()
