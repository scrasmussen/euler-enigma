#-----------------------------------------------------------------------
#                   Day 3: Rucksack Reorganization
#-----------------------------------------------------------------------
using DelimitedFiles
file="input/2022-03-input.txt"
# file="input/2022-03-test-2.txt"

module foo
@enum Items begin
    a=1;b;c;d;e;f;g;h;i;j;k;l;m;n;o;p;q;r;s;t;u;v;w;x;y;z
    A;B;C;D;E;F;G;H;I;J;K;L;M;N;O;P;Q;R;S;T;U;V;W;X;Y;Z
end
end

function find_duplicate(item_1, item_2)
    for w1_i in 1:length(item_1)
        for w2_i in 1:length(item_2)
            if (item_1[w1_i] == item_2[w2_i])
                return item_1[w1_i]
            end
        end
    end
end

function find_duplicate(item_1, item_2)
    for w1_i in 1:length(item_1)
        for w2_i in 1:length(item_2)
            if (item_1[w1_i] == item_2[w2_i])
                return item_1[w1_i]
            end
        end
    end
end

function find_duplicate(item_1, item_2, item_3)
    for w1_i in 1:length(item_1)
        for w2_i in 1:length(item_2)
            for w3_i in 1:length(item_3)
                if (item_1[w1_i] == item_2[w2_i] == item_3[w3_i])
                    return item_1[w1_i]
                end
            end
        end
    end
end

function problem2()
    f = open(file,"r")
    global score = 0
    A = readlines(f)
    num_groups = Int(length(A)) / 3

    for i in 1:num_groups
        item_1 = A[Int((i-1)*3+1)]
        item_2 = A[Int((i-1)*3+2)]
        item_3 = A[Int((i-1)*3+3)]
        duplicate = find_duplicate(item_1, item_2, item_3)
        score += Int(getproperty(foo, Symbol(duplicate)))
    end
    println("Problem 1's score is: ", score)
end

function problem1()
    f = open(file,"r")
    global score = 0
    A = readlines(f)

    score = 0
    for i in 1:length(A)
        s_len = trunc(Int, length(A[i]) / 2)
        println(A[i], " ", s_len)
        item_1 = A[i][1:s_len]
        item_2 = A[i][s_len+1:end]
        duplicate = find_duplicate(item_1, item_2)
        score += Int(getproperty(foo, Symbol(duplicate)))
    end
    println("Problem 1's score is: ", score)
end

# problem1()
problem2()
