

def substrings(string, dictionary)
  dictionary.reduce(Hash.new(0)) do |substring_occurances, dictionary_string|
    substring_occurances[dictionary_string] = string.downcase.scan(dictionary_string).length
    substring_occurances.reject { |_, value| value == 0 }
  end
end

# Tests
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
