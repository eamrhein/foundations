def average(num1, num2)
            (num1 + num2).to_f / 2
end

def average_array(array)
        array.sum.to_f / array.length
end

def repeat(str, num)
    result = ""
    num.times do 
        result += str
    end
    result
end

def yell (str)
    str.upcase! + "!"
end

def alternating_case(str)
    words = str.split
    words.each_with_index do |el, i|
        if i.odd?
            el.downcase!
        else
            el.upcase!
        end
    end
    words.join(" ")
end