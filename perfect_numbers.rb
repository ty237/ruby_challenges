# frozen_string_literal: true

class PerfectNumber
  def self.classify(number)
    factors = []
    raise StandardError if number < 0

    1.upto(number / 2) do |current_number|
      factors.push(current_number) if number % current_number == 0
    end
    sum = factors.reduce(&:+)
    if number > sum
      'deficient'
    elsif number < sum
      'abundant'
    else
      'perfect'
    end
  end
end
