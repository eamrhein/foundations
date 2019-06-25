# frozen_string_literal: true

def element_count(arr)
  hash = Hash.new(0)
  arr.each { |key| result[key] += 1 }
  hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |ch, i|
    str[i] = hash[ch] if hash.key?(ch)
  end
  str
end

def product_inject(arr)
  arr.inject { |product, n| product * n }
end
