# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple 
# of both of the given numbers
def least_common_multiple(num1, num2)
    num1*num2/gcd(num1,num2)
end
def gcd(num1, num2)
    if num1 == 0
        return num2
    end
    gcd(num2 % num1, num1)
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    bigrams = Hash.new(0)
    str.each_char.with_index do |el, i|
        bigrams[str[i]+str[i+1]] += 1 unless i == str.length-1
    end
    bigrams.max_by{|k,v| v}[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        result = {}
        self.each {|k,v| result[v] = k}
        result
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        count = 0
        (0..self.length - 1).each do |x|
            (0..self.length - 1).each do |y|
                count += 1 if self[x] + self[y] == num
            end
        end
        count / 2
    end



    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    def bubble_sort(&prc)
        if prc.nil?
            sorted = false
            until sorted
            sorted = true
            (0...self.length - 1).each do |i|
                if self[i] > self[i + 1]
                    self[i], self[i + 1] = self[i + 1], self[i]
                    sorted = false
                end
            end
        end
        self
    end
end
