# frozen_string_literal: true

class Octal
  def initialize(number)
    @value = number
  end

  def to_decimal
    return 0 if @value.match?(/[a-z98]/)
    @value.to_i.floor(-1).digits.reverse.reduce { |element, total| element * 8 + total } + @value.to_i % 10
  end
end
