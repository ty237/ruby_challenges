# frozen_string_literal: true

class SumOfMultiples
  def initialize(*numbers)
    @numbers = numbers
  end

  def self.to(upto_argument)
    SumOfMultiples.new(3, 5).to(upto_argument)
  end

  def to(upto_argument)
    # Input: An array and an upto argument
    # Output: A sum of multiples
    #
    # Mental_Model: Iterate from the smallest multiple up to the upto_argument and add each element if
    # that element is a multiple of one of the numbers in the array. Return the array of collected arguments
    # added together .
    #
    # Algorithm:
    # Iterate from the smallest multiple up to tbut not including the upto_argument with an array.
    # Add the current element to the array if it is a multiple of one of the memebers of the multiples
    # array
    # Return the array of collected arguments added together .
    value = (@numbers.min...upto_argument).each_with_object([]) do |element, array|
      value = false
      @numbers.each { |number| value = true if element % number == 0 }
      array.push(element) if value
    end.reduce(&:+)
    return value.nil? ? 0 : value
  end
end

p SumOfMultiples.new(4, 6).to(15) # 30
