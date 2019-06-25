# frozen_string_literal: true

def is_prime?(num)
  return false unless num >= 2

  (2...num).none? { |div| (num % div).zero? }
end

def nth_prime(num)
  count = 0
  i = 2
  while count < num
    count += 1 if is_prime?(i)
    i += 1
  end
  i - 1
end

def prime_range(min, max)
  (min..max).select { |i| is_prime?(i) }
end
