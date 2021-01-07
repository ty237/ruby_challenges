require 'pry'
# frozen_string_literal: true

class WordProblem
  attr_accessor :current_value, :word_problem
   Operations = %w[plus minus divided multiplied]

  def initialize(word_problem)
    @word_problem = word_problem
  end

  def answer
    # Input: String
    # Output: Number
    # Raise argument error if irregular word problem is given.
    # Mental Model: Turn word problem into an array and Eliminate all elements that are not numbers
    # or operations. Iterate through each element doing with it what needs to be done and changing
    # current_value as needed. Once iteration is complete, return current_value
    #
    # Algorithm:
    # Turn word problem into an array and Eliminate all elements that are not numbers or members of
    # operations array.
    # Iterate through each element of the selected array 2 at a time and raise argument error if empty.
    # If current value is nil set current_value to the first number given.
    # Perform the given operation using the given number. I.e. use a method.
    # current_value as needed. Once iteration is complete, return current_value
    word_problem = @word_problem[0..-2].split.select { |element|  Operations.include?(element) || element.to_i.to_s == element }
    raise ArgumentError if word_problem.length < 2
    current_value = word_problem.shift.to_i
    word_problem.each_slice(2) do |operation, number|
      case operation
      when 'plus'
        current_value += number.to_i
      when 'minus'
        current_value -= number.to_i
      when 'divided'
        current_value /= number.to_i
      when 'multiplied'
        current_value *= number.to_i
      end
    end
    current_value
  end
end

p WordProblem.new('What is -3 multiplied by 25?').answer
