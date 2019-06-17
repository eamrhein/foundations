# frozen_string_literal: true

def hipsterfy(word)
  vowels = 'aeiouAEIOU'
  n = word.length
  n.times do
    if vowels.include?(word[n - 1])
      word[n - 1] = ''
      break
    end
    n -= 1
  end
  word
end

def vowel_counts(str)
  result = Hash.new(0)
  vowels = 'aeiouAEIOU'
  n = str.length
  n.times do
    result[str[n - 1].downcase] += 1 if vowels.include?(str[n - 1])
    n -= 1
  end
  result
end

def caesar_cipher(str, num)
  result = ''
  str.each_char do |letter|
    unless letter.ord.between?('a'.ord, 'z'.ord) || letter.ord.between?('A'.ord, 'Z'.ord)
      result += letter
      next
    end
    result += caesar_letter(letter, num)
  end
  result
end

def caesar_letter(letter, num)
  if letter == letter.upcase
    l_code = letter.ord - 'A'.ord
    s_code = (l_code + num) % 26
    c_code = (s_code + 'A'.ord)
  else
    l_code = letter.ord - 'a'.ord
    s_code = (l_code + num) % 26
    c_code = (s_code + 'a'.ord)
  end
  c_code.chr
end
