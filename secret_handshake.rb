# frozen_string_literal: true

require 'pry'
class SecretHandshake
  Actions = [['reverse_order', 16], ['jump', 8], ['close your eyes', 4], ['double blink', 2], ['wink', 1]].freeze

  def initialize(handshake)
    @handshake_number = handshake.to_i
  end

  def commands
    current_value = @handshake_number
    actions = []
    Actions.each do |action, action_value|
      if action_value - current_value <= 0
        actions.push(action)
        current_value -= action_value
      end
    end
    if actions.first == 'reverse_order'
      actions.shift
      return actions.reverse.reverse
    end
    actions.reverse
  end
end

handshake = SecretHandshake.new(3)

p handshake.commands
p handshake.commands == ['wink', 'double blink']
