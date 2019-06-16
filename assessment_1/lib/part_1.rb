def is_prime?(num)
    return false unless num >=2
    (2...num).each do |divisor|
        if num%divisor ==0
            return false
        end 
    end
    true
end
def nth_prime(n)
    primes = []
    i=1
    j=0   
    while j < n
        if is_prime?(i)
            primes << i
            j+=1
        end
        i+=1
    end
    primes[n-1]
end

def prime_range(min,max)
    primes = []
    while min <= max
        if is_prime?(min)
            primes << min
        end
        min +=1
    end
    primes
end