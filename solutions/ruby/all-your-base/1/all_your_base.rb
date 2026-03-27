module BaseConverter
  def self.write_out(num, base)
    rest = (num/base).floor
    return [rest>0?self.write_out(rest, base):nil, num % base].flatten-[nil]
  end
  def self.convert(b_in, digs, b_out)
    raise ArgumentError unless [b_in, b_out].all?{|base| Integer === base and base>1} and digs.all?{|d| d>=0 and d<b_in}
    val=(0...digs.size).to_a.sum{|position| digs.reverse[position]*b_in**position}
    self.write_out(val, b_out)
  end

end