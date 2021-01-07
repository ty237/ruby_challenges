# frozen_string_literal: true

class Robot
  @@taken_names = []

  def initialize
    name = nil
    loop do
      name = random_first_letter + random_first_number
      break unless @@taken_names.include?(name)
    end
    @@taken_names.push(name)
    @name = name
  end

  attr_reader :name

  def reset
    initialize
  end

  private

  def random_first_letter
    ('A'..'Z').to_a.sample + ('A'..'Z').to_a.sample
  end

  def random_first_number
    (0..9).to_a.sample.to_s + (0..9).to_a.sample.to_s + (0..9).to_a.sample.to_s
  end
end

DIFFERENT_ROBOT_NAME_SEED = 1234
Kernel.srand DIFFERENT_ROBOT_NAME_SEED
puts Robot.new.name
puts Robot.new.name

