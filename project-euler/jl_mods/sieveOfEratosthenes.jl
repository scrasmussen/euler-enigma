# Sieve of Eratosthenes for finding prime numbers

module sieveOfEratosthenes
export sieveOE_init, isPrime

function sieveOE_init(n)
    if (mod(n,2) == 1)
        n = n + 1
    end
    n2 = Int32(n/2)
    A = ones(Int32,n2)

    for i in 1:n2
        if (A[i] == 1)
            for j in i+i*2+1:i*2+1:n2
                A[j] = 0
            end
        end
    end
    return A
end

function isPrime(i::Int, A)
    if (i == 2)
        return true
    elseif (i == 1 || mod(i,2) == 0)
        return false
    end

    i2 = trunc(Int,(i-1) / 2)


    if (A[i2] == 0)
        return false
    else
        return true
    end
end

end # module
