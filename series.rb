# frozen_string_literal: true

class Series
  attr_reader :series, :length
  def initialize(num)
    @series = num.reverse.to_i.digits
  end

  def slices(length)
    raise(ArgumentError) if length > 5

    array = []
    series.each_cons(length) { |element| array.push(element) }
    array
  end
end

new_series = Series.new('1234')
p new_series.slices(2)
