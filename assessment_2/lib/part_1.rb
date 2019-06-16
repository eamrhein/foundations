def my_reject(arr, &prc)
  result = []
  arr.each {|el| result << el if !prc.call(el)}
  result
end
def my_one?(arr, &prc)
  num_true = 0
  arr.each {|el| num_true +=1 if prc.call(el)}
  if num_true == 1
    return true
  end
    return false
end
def hash_select(hash, &prc)
  result = {}
  hash.each do |k,v|
   if prc.call(k,v) == true
      result[k]=v
   end
  end
  result
end
def xor_select (arr, prc1, prc2)
  result = []
  arr.each do |el|
    if prc1.call(el) && !prc2.call(el)
      result << el
    end
    if prc2.call(el) && !prc1.call(el)
      result << el
    end
  end
  result
end
def proc_count(num, arr)
  count = 0
  arr.each do |proc|
    if proc.call(num)
      count+=1
    end
  end
  count
end

