def partition(array, n)
    subarray1 = []
    subarray2 = []
    array.each do |el|
        if el >= n
            subarray2 << el
        else
            subarray1 << el
        end
    end
    return [subarray1,subarray2]
end

def merge(hash1, hash2)
    mergedhash = Hash.new
    hash1.each_key do |key|
            mergedhash[key] = hash1[key]
    end
    hash2.each_key do |key|
        mergedhash[key] = hash2[key]
    end
    mergedhash
end

def censor(sentence,curses)
    vowels = "aeiouAEIOU"
    words = sentence.split
    words.each do |word|
        curses.each do |curse|
            if curse == word.downcase
                word.each_char.with_index do |letter,i|
                    if vowels.include?(letter)
                        word[i] = "*"
                    end
                end
            end
        end
        
    end
    words.join(" ")
end

def power_of_two?(num)
    Math.log2(num)%1 == 0
end