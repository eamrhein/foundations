# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    if self.length == 0
      return nil
    end
    self.max - self.min
  end
  def average
    if self.length ==0
      return nil
    end
    self.sum.to_f / self.length
  end
  def median
    if self.length == 0
      return nil
    end
    if self.length.odd?
      return self.sort[self.length/2]
    end
    if self.length.even?
      a =self.sort[self.length/2]
      b = self.sort[self.length/2-1]
      return (a.to_f + b.to_f) / 2
    end
  end
  def counts
    count = Hash.new(0)
    self.each {|key| count[key]+=1}
    return count
  end
  def my_count(value)
    self.counts[value]
  end
  def my_index(value)
    if self.include?(value)
      self.each_with_index do |el,i|
        if value == el
          return i
        end
      end
    end
    return nil
  end
  def my_uniq
    uniqs = []
    self.each_with_index do |el, i|
      if !self[i+1..-1].include?(el)
          uniqs << el
      end
    end
    return uniqs
  end
  def my_transpose
    if self.length == 0 
      return nil
    end
    transposed = Array.new(self[0].length){Array.new(self.length)}
    self.each_with_index do |row, idx1|
      row.each_with_index do |val, idx2|
        transposed[idx2][idx1] = val
      end
    end
    transposed
  end
end
