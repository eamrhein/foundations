require 'byebug'
def all_words_capitalized?(words)
  words.all? { |word| word==word.capitalize  }
end
def no_valid_url?(urls)
  valid_domains=['com','net','io','org']
  urls.none? {|url| url.split(".").length == 2 && valid_domains.include?(url.split(".")[1])}
end
def any_passing_students?(a)
  a.any? do |hash|
    avg(hash[:grades]) > 75
  end
end
def avg(arr)
  arr.sum / arr.length
end
