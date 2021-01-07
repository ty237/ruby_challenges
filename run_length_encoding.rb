require 'pry'
# frozen_string_literal: true

class RunLengthEncoding
  def self.encode(string)
    # Input: A string
    # Output: A string in number form
    # Mental Model: Turn the string into an array of characters and iterate through them counting the
    # number of occurances and pushing the letter and number of occurances to a new array every time
    # a new type of element is passed in. If you are given only 1 element omit the number when pushing.
    # Return a joined version of the collective array
    # Algorithm:
    # Turn the string into an array of characters and iterate through them
    # counting the number of occurances and pushing the letter and number of occurances to a new array
    # every time a new type of element is passed in. If you are given only 1 element omit the number when pushing.
    # Return a joined version of the collective array
    counted_array = []
    count = 1
    elements = string.chars
    current_object = elements.shift
    elements.each do |object|
      if current_object != object
        counted_array.push(count) unless count == 1
        counted_array.push(current_object)
        count = 0
        current_object = object
      end
      count += 1
    end
    counted_array.push(count) unless count == 1
    counted_array.push(current_object)
    counted_array.join
  end

  def self.decode(string)
    new_array = string.gsub(/([a-z])([a-z])/, '\11\2').gsub(/([a-z])([a-z])/, '\11\2').chars
    all_sets = []
    full_element = [new_array.shift]
    new_array.each do |current_element|
      if element_different_class(current_element, full_element[0])
        all_sets.push(full_element.join)
        full_element = []
      end
      full_element.push(current_element)
    end
    all_sets.push(full_element.join)
    string = ""
    all_sets.each_slice(2) do |number, char|
	    string << char * number.to_i
    end
    string
  end

  def self.element_different_class(new_element, current_element)
	  if current_element.to_i.to_s == current_element && new_element.to_i.to_s == new_element
		  false
	  elsif current_element.to_i == 0 && new_element.to_i == 0
		  false
	  else
		  true
	  end
  end
end

input = 'zzz ZZ  zZ'
output = 'zzz ZZ  zZ'
fjd = RunLengthEncoding.encode(input)
p fjd
p RunLengthEncoding.decode(fjd)
