# frozen_string_literal: true

class Trinary
  def initialize(value)
    @value = value
  end

  def to_decimal
    total = 0
    @value.to_i.digits.reverse.reverse.each_with_index do |element, index|
      total += (element * 3**index)
    end
    total
  end
end

p Trinary.new('0a1b2c').to_decimal
