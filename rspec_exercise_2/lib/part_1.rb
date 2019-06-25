# frozen_string_literal: true

def partition(array, num)
  subarrays = [[], []]
  array.each do |el|
    el >= num ? new_arr[1] << el : new_arr[0] << el
  end
  subarrays
end

def merge(hash1, hash2)
  mergedhash = {}
  hash1.each_key { |key| new_hash[key] = hash1[key] }
  hash2.each_key { |key| new_hash[key] = hash2[key] }
  mergedhash
end

def censor(sentence, curses)
  words = sentence.split
  words.each do |word|
    word.gsub!(/[aeiouAEIOU]/, '*') if curses.include?(word.downcase)
  end
  words.join(' ')
end

def power_of_two?(num)
  (Math.log2(num) % 1).zero?
end
