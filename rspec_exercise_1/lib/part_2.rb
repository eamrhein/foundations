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

def caesar_cipher(message, num)
  alpha = ('a'..'z').to_a
  (0...message.length).each do |i|
    if alpha.include?(message[i])
      old_index = alpha.index(message[i])
      new_index = (old_index + num) % alpha.length
      message[i] = alpha[new_index]
    end
  end
  message
end
