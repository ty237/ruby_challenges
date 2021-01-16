# frozen_string_literal: true

require 'pry'

class Scrabble
  def initialize(word)
    @word = word
  end

  def self.score(word)
    return 0 if word.nil? || word.match(/[^a-zA-Z]/)

    chars = word.chars
    chars.reduce(0) { |sum, num| sum + find_value(num) }
  end

  def self.find_value(letter)
		  value = 0
		  values = [[%w[A E I O U L N R S T], 1],
		            [%w[D G], 2],
		            [%w[B C M P], 3],
		            [%w[F H V W Y], 4],
		            [%w[K], 5],
		            [%w[J X], 8],
		            [%w[Q Z], 10]]
		  values.each do |letters, integer|
			  value += integer if letters.include?(letter.upcase)
		  end
		  value
  end

  def score
    return 0 if @word.nil? || @word.match(/[^a-zA-Z]/)

    chars = @word.chars
    chars.reduce(0) { |sum, num| sum + find_value(num) }
  end

  def find_value(letter)
    value = 0
    values = [[%w[A E I O U L N R S T], 1],
              [%w[D G], 2],
              [%w[B C M P], 3],
              [%w[F H V W Y], 4],
              [%w[K], 5],
              [%w[J X], 8],
              [%w[Q Z], 10]]
    values.each do |letters, integer|
      value += integer if letters.include?(letter.upcase)
    end
    value
  end
end

p Scrabble.new('a').score
