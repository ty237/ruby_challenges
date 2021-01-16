# frozen_string_literal: true
class InvalidCodonError < StandardError

end

class Translation
  Protein_Strands = {
    'Methionine' => %w[AUG],
    'Phenylalanine' => %w[UUU UUC],
    'Leucine' => %w[UUA UUG],
    'Serine' => %w[UCU UCC UCA UCG],
    'Tyrosine' => %w[UAU UAC],
    'Cysteine' => %w[UGU UGC],
    'Tryptophan' => %w[UGG],
    'STOP' => %w[UAA UAG UGA]
  }.freeze

  def self.of_rna(rna_strand)
    protein_names = []
    rna_strand.chars.each_slice(3) do |strand|
      protein = of_codon(strand.join(''))
      break if protein == 'STOP'

      protein_names.push(protein)
    end
    raise InvalidCodonError if protein_names.include?(nil)

    protein_names
  end

  def self.of_codon(rna_strand)
    protein_name = nil
    Protein_Strands.each do |protein, strand_array|
      strand_array.each do |strand|
        protein_name = protein if rna_strand == strand
      end
    end
    protein_name
  end

  private

  def of_codon(rna_strand)
    protein_name = nil
    Protein_Strands.each do |protein, strand_array|
      strand_array.each do |strand|
        protein_name = protein if rna_strand == strand
      end
    end
    protein_name
  end
end




