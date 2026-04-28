class InvalidCodonError < Exception
  def initialize()
    super
  end
end

module Translation
  CODONS = {
    'AUG' => 'Methionine',
    'UUU' => 'Phenylalanine',
    'UUC' => 'Phenylalanine',
    'UUA' => 'Leucine',
    'UUG' => 'Leucine',
    'UCU' => 'Serine',
    'UCC' => 'Serine',
    'UCA' => 'Serine',
    'UCG' => 'Serine',
    'UAU' => 'Tyrosine',
    'UAC' => 'Tyrosine',
    'UGU' => 'Cysteine',
    'UGC' => 'Cysteine',
    'UGG' => 'Tryptophan',
    'UAA' => 'STOP',
    'UAG' => 'STOP',
    'UGA' => 'STOP',
  }
  def self.of_rna(strand)
    proteins = []
    length = strand.size
    idx = 0
    while idx < length - 2
      codon = strand[idx..idx+2]
      raise InvalidCodonError unless CODONS.has_key?(codon)
      break if CODONS[codon] == 'STOP'
      proteins << CODONS[codon]
      idx += 3
    end
    raise InvalidCodonError unless length % 3 == 0 or CODONS[codon] == 'STOP'
    proteins
  end
end
