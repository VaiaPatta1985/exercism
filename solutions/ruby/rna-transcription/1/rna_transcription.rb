module Complement
  DNA_TO_RNA = {'C' => 'G', 'G' => 'C', 'T' => 'A', 'A' => 'U'}

  def self.of_dna(dna)    
    dna.chars.map { |nuc| DNA_TO_RNA[nuc] }.join
  end
end
