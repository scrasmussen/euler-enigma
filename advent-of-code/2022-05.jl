#-----------------------------------------------------------------------
#                        Day 5: Supply Stacks
#-----------------------------------------------------------------------
# using DelimitedFiles
using DataStructures
file="input/2022-05-input.txt"
# file="input/2022-05-test.txt"


function problem2()
    score = 0
    stackstack = Stack{String}()
    open(file) do f
        for line in eachline(f)
            if contains(line,"[")
                push!(stackstack, line)
            elseif ! contains(line,"move") && contains(line,"1")
                stack_num = [parse(Int, i) for i in split(line)]
                global stacks = [Vector{Char}(undef,0) for _ in
                                 1:pop!(stack_num)]
            end
        end
    end

    # parse the input stacks into the stacks vector of vector
    while ! isempty(stackstack)
        stack_s = pop!(stackstack)
        s = replace(replace(stack_s, '['=>' '), ']'=>' ')
        row = 1
        i = 2
        while i < length(s)
            if s[i] != ' '
                push!(stacks[row], s[i])
            end
            i += 4
            row += 1
        end
    end


    open(file) do f
        for line in eachline(f)
            if contains(line,"move")
                s = replace(replace(replace(line, "move"=>""),
                                    "from"=>""), "to"=>"")
                (move, from, to) =  [parse(Int, i) for i in split(s)]
                items = Vector{Char}(undef,0)
                for num_times in 1:move
                    push!(items,pop!(stacks[from]))
                end
                for num_times in 1:move
                    push!(stacks[to], pop!(items))
                end
            end
        end
    end

    for i in 1:length(stacks)
        print(last(stacks[i]))
    end
    println("")
end


function problem1()
    score = 0
    stackstack = Stack{String}()
    open(file) do f
        for line in eachline(f)
            if contains(line,"[")
                push!(stackstack, line)
            elseif ! contains(line,"move") && contains(line,"1")
                stack_num = [parse(Int, i) for i in split(line)]
                global stacks = [Vector{Char}(undef,0) for _ in
                                 1:pop!(stack_num)]
            end
        end
    end

    # parse the input stacks into the stacks vector of vector
    while ! isempty(stackstack)
        stack_s = pop!(stackstack)
        s = replace(replace(stack_s, '['=>' '), ']'=>' ')
        row = 1
        i = 2
        while i < length(s)
            if s[i] != ' '
                push!(stacks[row], s[i])
            end
            i += 4
            row += 1
        end
    end


    open(file) do f
        for line in eachline(f)
            if contains(line,"move")
                s = replace(replace(replace(line, "move"=>""),
                                    "from"=>""), "to"=>"")
                (move, from, to) =  [parse(Int, i) for i in split(s)]
                for num_times in 1:move
                    item = pop!(stacks[from])
                    push!(stacks[to], item)
                end
            end
        end
    end

    for i in 1:length(stacks)
        print(last(stacks[i]))
    end
    println("")
end



# problem1()
problem2()
