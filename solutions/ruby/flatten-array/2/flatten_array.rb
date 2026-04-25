module FlattenArray
  def self.flatten(stuff)
    result = []
    stuff.each do |elem|
      debug 'b '+stuff.to_s+'|'+elem.to_s+'|'+result.to_s+'|'
      if elem.instance_of?(Array) then
        result += FlattenArray.flatten(elem) unless elem == []
      else
        result << elem unless elem == nil
      end
      debug 'a '+stuff.to_s+'|'+elem.to_s+'|'+result.to_s+'|'
    end
    result
  end
end
