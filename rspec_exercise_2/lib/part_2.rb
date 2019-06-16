def palindrome?(str)
    reversed = ""
    n = str.length
    n.times do
        reversed += str[n-1]
        n -= 1
    end
    reversed == str
end

def substrings(str)
    substrings = []
    i=0
    while i < str.length
        j=i
        while j< str.length
            substrings << str[i..j]
            j+=1
        end
        i+=1
    end
    substrings
end

def palindrome_substrings(str)
    pallindromes = []
    subs = substrings(str)
    subs.each do |el|
        if palindrome?(el) && el.length >1
            pallindromes << el
        end
    end
    pallindromes
end