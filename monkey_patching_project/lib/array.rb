# frozen_string_literal: true

# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if length.zero?

    max - min
  end

  def average
    return nil if length.zero?

    sum.to_f / length
  end

  def median
    return nil if length.zero?

    sort[length / 2] + sort[(length - 1) / 2] / 2.0
  end

  def counts
    count = Hash.new(0)
    each { |key| count[key] += 1 }
    count
  end

  def my_count(value)
    counts[value]
  end

  def my_index(value)
    if include?(value)
      each_with_index do |el, i|
        return i if value == el
      end
    end
    nil
  end

  def my_uniq
    uniqs = []
    each_with_index do |el, i|
      uniqs << el unless self[i + 1..-1].include?(el)
    end
    uniqs
  end

  def my_transpose
    return nil if length.zero?

    transposed = Array.new(self[0].length) { Array.new(length) }
    each_with_index do |row, idx1|
      row.each_with_index do |val, idx2|
        transposed[idx2][idx1] = val
      end
    end
    transposed
  end
end
