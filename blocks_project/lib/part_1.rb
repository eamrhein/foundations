def select_even_nums(arr)
  arr.select{|num| num.even?}
end
def reject_puppies(arr)
  arr.reject{|dogs| dogs["age"]<=2}
end
def count_positive_subarrays(arr)
   arr.count{|subarray| subarray.sum > 0}
end
def aba_translate(word)
  vowels = "AEIOUaeiou"
  newword = ""
  word.each_char.with_index do |letter,i|
    if vowels.include?(letter)
      newword += word[i]+"b"+ word[i]
    else
      newword += word[i]
    end
  end
  newword
end
def aba_array(words)
  words.map{|word|aba_translate(word)}
end
