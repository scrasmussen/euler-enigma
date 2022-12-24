#-----------------------------------------------------------------------
#                    Day 7: No Space Left On Device
#-----------------------------------------------------------------------
using AbstractTrees
# file="input/2022-07-input.txt"
file="input/2022-07-test.txt"

mutable struct Element
    name::String
    size::Int64
    p
    loe
end
function parent(p::Element)
    return p.p
end

function add_child(parent::Element, child::Element)
    parent.loe = append!(parent.loe, [child])
    return parent
end


function problem1()
    f = open(file,"r")
    cd = false
    ls = false
    global init = false
    global tree = nothing
    for line in eachline(f)
        println("LINE: ",line)
        # are we changing directory or listing files
        if line[1:4] == "\$ cd"
            if init == false
                println("ARTLESS-------------")
                tree = Element(line[6:end], 0,
                               nothing, [])
                tree.p = Element("|||", 0, nothing,[])
                init = true
            end
            cd = true
            ls = false
            continue
        end
        if line[1:4] == "\$ ls"
            cd = false
            ls = true
            continue
        end
        # print_tree(tree)

        # process contents
        if (ls)
            if line[1:3] != "dir"
                tree = add_child(tree, Element(split(line)[2],
                                               parse(Int64,split(line)[1]),
                                               tree.p,[]))
            end
        end

        if (cd)
            if line[6:end] == ".."
                tree = parent(tree)
            else
                parent_tree = tree
                tree = add_child(tree, Element(line[6:end], 0, parent_tree,[]))
                print_tree(tree)
            end
        end

    end

    print_tree(tree)
    println("----")
    for c in tree.loe
        println(c)
    end

end

problem1()
# problem2()
