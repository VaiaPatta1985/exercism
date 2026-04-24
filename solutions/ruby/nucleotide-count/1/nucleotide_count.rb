module Nucleotide
  class MyClass
    def initialize(my_hash)
      @my_hash = my_hash
    end

    def histogram
      @my_hash
    end
  end
  
  def self.from_dna(dna_sequence)
    raise ArgumentError unless dna_sequence.scan(/[^ACGT]/) == []
    nucleotides = dna_sequence.chars
    ans = {}
    %w[A C G T].each { |letter| ans = {**ans, **{letter => nucleotides.count{|n|n==letter}}}}
    MyClass.new(ans)
  end
end
