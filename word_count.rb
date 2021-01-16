# frozen_string_literal: true

class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = @phrase.downcase
    words = words.gsub(/\W+$/, "")
    words = words.gsub(/(\w)[^'\w]+(\w)/, '\1 \2').split.map do |word|
       word = word[1..-1] if word[0].match(/\W/)
       word = word[0..-2] if word[-1].match(/\W/)
       word
    end
    hash = {}
    words.uniq.each do |word|
      hash[word] = words.count(word)
    end
    hash
  end
end

phrase = Phrase.new('testing, 1, 2 testing')
counts = { 'testing' => 2, '1' => 1, '2' => 1 }
p phrase.word_count
