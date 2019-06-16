def reverser(str, &prc)
  prc.call(str.reverse)
end
def word_changer(str, &prc)
  words = str.split
  words.each_with_index{|word, i| words[i]= prc.call(word)}
  words.join(" ")
end
def greater_proc_value(num, prc1, prc2)
  if prc1.call(num) > prc2.call(num)
    prc1.call(num)
  else 
    prc2.call(num)
  end
end
def and_selector(arr, prc1, prc2)
  result=[]
  arr.each do |el|
    if prc1.call(el) && prc2.call(el)
      result << el
    end
  end
  result
end
def alternating_mapper(arr, prc1, prc2)
  result = []
  arr.each_with_index do |el, i|
    if i.even?
      result << prc1.call(el)
    else
      result << prc2.call(el)
    end
  end
  result
end
