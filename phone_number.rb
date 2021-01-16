# frozen_string_literal: true

class PhoneNumber
  def initialize(raw_number)
    @raw_number = raw_number
  end

  def number
    clean_number = @raw_number.gsub(/\W+/, '')
    return '0000000000' if invalid?(clean_number)
    return clean_number[1..-1] if clean_number.length > 10

    clean_number
  end

  def to_s
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end

  def area_code
    number[0..2]
  end

  private

  def invalid?(clean_number)
    if clean_number.length < 10 || clean_number.length > 11 ||
	    (clean_number[0] != '1' && clean_number.length > 10) || clean_number.match(/[a-zA-Z]/)
      return true
    end

    false
  end
end

number = PhoneNumber.new('123456789').number
p number
