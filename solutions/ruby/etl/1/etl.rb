module ETL
  def self.transform(old_hash)
    array_of_hashes = old_hash.map { |val, letters| letters.map { |letter| {letter.downcase => val} } }
    if array_of_hashes.size == 1 then
      array_of_hashes = array_of_hashes[0]
    else
      array_of_hashes.flatten!
    end
    {}.merge(*array_of_hashes)
  end
end