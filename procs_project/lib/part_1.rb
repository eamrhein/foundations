# frozen_string_literal: true

require 'byebug'
def my_map(arr, &prc)
  result = []
  arr.each { |el| result << prc.call(el) }
  result
end

def my_select(arr, &prc)
  result = []
  arr.each { |el| result << el if prc.call(el) == true }
  result
end

def my_count(arr, &prc)
  count = 0
  arr.each { |el| count += 1 if prc.call(el) == true }
  count
end

def my_any?(arr, &prc)
  arr.each { |el| return true if prc.call(el) == true }
  false
end

def my_all?(arr, &prc)
  arr.each { |el| return false if prc.call(el) == false }
  true
end

def my_none?(arr, &prc)
  arr.each { |el| return false if prc.call(el) == true }
  true
end
