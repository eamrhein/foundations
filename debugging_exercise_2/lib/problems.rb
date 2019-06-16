# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  (1..num).inject do |max, factor|
     isPrime?(factor) && factor > max && num%factor==0 ? factor :max
  end
end
def isPrime?(num)
   return false if num < 2
  (2...num).each do |divisor|
    return false if num%divisor==0
  end
  true
end

def unique_chars?(str)
  char_array = str.split(//)
  char_array == char_array.uniq
end

def dupe_indices(arr)
#takes an array runs count_duplicates and selects the indices of duplicate items in array
  result= {}
  count_duplicates(arr).each do |key, value|
      result[key] = arr.each_index.select{|i| arr[i] == key} if value >= 2
  end
  result
end


def count_duplicates(arr)
#returns a hash where key = element of array and value = number of occurences
  count = Hash.new(0)
  arr.each {|el|count[el]+=1}
  count
end

def ana_array(arr1,arr2)
   if  arr1.length != arr2.length
     return false
   end
   count1 = count_duplicates(arr1)
   count2 = count_duplicates(arr2)
   count1.each do |key, value|
    if count1[key]!= count2[key]
      return false
    end
   end
   true
end
