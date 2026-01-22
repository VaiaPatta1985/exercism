module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    return city[0,4].upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier.to_s[0,3]
    if cargo == "OIL" or cargo == "GAS"
      return "A".to_sym
    end
    return "B".to_sym
  end
end
