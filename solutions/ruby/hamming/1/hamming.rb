module Hamming
  def self.compute(seq1, seq2)
    strand_length = seq1.size
    raise ArgumentError unless strand_length == seq2.size
    return 0 if strand_length == 0
    (0...strand_length).count { |idx| seq1[idx] != seq2[idx] }
  end
end
