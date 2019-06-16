def element_count(arr)
    hash = Hash.new(0)
    arr.each do |key| 
        hash[key]+=1
    end
    hash
end

def char_replace!(str, hash)
    str.each_char.with_index do |ch,i|
        if hash.has_key?(ch)
            str[i] = hash[ch]
        end
    end
    str
end

def product_inject(arr)
    arr.inject {|product,n|product*n}
end