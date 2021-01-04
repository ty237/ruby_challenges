# frozen_string_literal: true

class Sieve
  def initialize(upper_limit)
    @upper_limit = upper_limit
  end

  def primes
    non_primes = []
    2.upto(@upper_limit) do |current_number|
      multiplier = 2
      until multiplier * current_number > @upper_limit
        non_primes.push(current_number * multiplier)
        multiplier += 1
      end
    end
    (2..@upper_limit).to_a.reject { |element| non_primes.include?(element) }
  end
end

p Sieve.new(5).primes
