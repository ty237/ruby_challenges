# frozen_string_literal: true

class DNA
  def initialize(dna_strand)
    @dna_strand = dna_strand
  end

  def hamming_distance(match_strand)
    dna_strand_array = @dna_strand.chars
    match_strand_array = match_strand.chars
    hamming_distance = 0
    match_strand_array.each_with_index do |element, index|
	    break if dna_strand_array[index].nil?
      hamming_distance += 1 if element != dna_strand_array[index]
    end
    hamming_distance
  end
end
