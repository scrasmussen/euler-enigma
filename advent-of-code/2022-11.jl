#-----------------------------------------------------------------------
#                     Day 11: Monkey in the middle
#-----------------------------------------------------------------------
using DelimitedFiles
file="input/2022-11-input.txt"
# file="input/2022-11-test.txt"

function test()
end

mutable struct Monkey
    num::Int64
    items::Vector{Int64}
    op
    test_div::Int64
    test_true::Int64
    test_false::Int64
    items_inspected::Int64
end

function parse_op_and_int(eq)
    if eq[2] == "*"
        return f1(x) = x * parse(Int64,eq[3])
    elseif eq[2] == "+"
        return f2(x) = x + parse(Int64,eq[3])
    else
        println("PARSE OP AND INT ERROR")
        exit(1)
    end
end

function parse_op(eq)
    if eq[2] == "*"
        return f3(x) = x * x
    elseif eq[2] == "+"
        return f4(x) = x + x
    else
        println("PARSE OP ERROR")
        exit(1)
    end
end

function readFile()
    f = open(file,"r")

    init = true
    monkeys = Monkey[]
    monkey_num = 0
    monkey_items = Vector{Int64}
    count = 1
    func = nothing
    test_div = nothing
    test_true = 0
    test_false = 0
    for line in eachline(f)
        if count == 1 # "Monkey"
            monkey_num = parse(Int64,line[8:8]) + 1
        elseif count == 2 # Starting Items
            data = split(line[19:end], ", ")
            monkey_items = [parse(Int64,i) for i in data]
        elseif count == 3 # Operation
            eq = split(line[20:end])
            if eq[3] == "old"
                func = parse_op(eq)
            else
                func = parse_op_and_int(eq)
            end
        elseif count == 4 # Divisible
            test_div = parse(Int64,line[22:end])
        elseif count == 5 # If true
            test_true = parse(Int64, line[30:end]) + 1
        elseif count == 6 # If false
            test_false = parse(Int64, line[31:end]) + 1
            monkeys = append!(monkeys, [Monkey(
                monkey_num, monkey_items, func,
                test_div, test_true, test_false, 0)])
        elseif count == 7 # blank line
            count = 0
        end
        count += 1
    end
    return monkeys
end

function execute_rounds(monkeys)
    monkey_business = 1
    max = 20 # problem 1
    max = 10000 # problem 2
    modulo_num = 1
    for m in monkeys
        modulo_num *=  m.test_div
    end

    for i in 1:max
        for m in monkeys
            while ! isempty(m.items)
                i = pop!(m.items)
                m.items_inspected += 1
                worry_level = i
                worry_level = m.op(worry_level)
                if (max == 20)
                    worry_level = Int(floor(worry_level/3))
                elseif (max == 10000)
                    worry_level = worry_level%modulo_num
                end
                if (worry_level%m.test_div == 0)
                    push!(monkeys[m.test_true].items, worry_level)
                else
                    push!(monkeys[m.test_false].items, worry_level)
                end

            end
        end
    end
    println(max, " rounds :::::")
    active_1 = 0
    active_2 = 0
    for m in monkeys
        println(m.items_inspected)
        if m.items_inspected > active_1
            active_2 = active_1
            active_1 = m.items_inspected
        elseif m.items_inspected > active_2
            active_2 = m.items_inspected
        end
    end

    return active_1 * active_2
end

function problem1()
    monkeys = readFile()
    monkey_business = execute_rounds(monkeys)

    println("The level of monkey business is ", monkey_business)
end

problem1()
# problem2()
