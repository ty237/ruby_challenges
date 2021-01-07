# frozen_string_literal: true

class Anagram
  def initialize(word)
    @word = word
  end

  def match(array)
    # Input: A string anagram and a array of strings
    # Output: An array of strings which are anagrams of @word
    # Do not be case sensitive
    # Return an empty array if nothing is found
    # Be case sensitive
    # Mental Model: Take the word and turn it into an array of sorted lowercase letters. Iterate through each
    # element of the provided array selecting only the elements which when turned into the form of the
    # @word are identical to @word. Return this array .
    # Algorithm:
    # Take the word and turn it into an array of sorted lowercase letters.
    # Iterate through each element of the provided array
    # Selecting only the elements which when turned into an array of sorted lowercase letters
    # are identical to @word.
    # Return this array .
    #
    array.select do |word|
      transform(word) == transform(@word) && word.downcase != @word.downcase
    end
  end

  def transform(word)
	  word.downcase.chars.sort
  end
end


