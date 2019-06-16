def proper_factors(num)
  result =[]
  (1...num).each{|d| result << d if num%d==0}
  result
end
def aliquot_sum(num)
  proper_factors(num).sum
end
def perfect_number?(num)
  aliquot_sum(num)==num
end
def ideal_numbers(n)
  i=1
  ideals = []
  while ideals.length < n 
    if perfect_number?(i)
      ideals << i
    end
    i+=1
  end
  ideals
end
