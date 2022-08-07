# Sieve of Eratosthenes for finding prime numbers

module sieveOfEratosthenes
export sieveOE_init, isPrime

function sieveOE_init(n)
    A = ones(Int32,n)
    A[1] = 0
    for i in 2:n
        for j in i*2:i:n
            A[j] = 0
        end
    end
    return A
end

function isPrime(i, A)
    if (A[i] == 0)
        return false
    else
        return true
    end
end
end
