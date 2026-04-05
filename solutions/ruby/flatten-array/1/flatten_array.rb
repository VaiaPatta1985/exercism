module FlattenArray
  def self.flatten(stuff)
    new_stuff = stuff.flatten
    result = new_stuff.instance_of?(Array) ? new_stuff : stuff
    num = result.size
    if num > 0 then
      while result[0] == nil and num > 0
        num -= 1
        result = result[1..num]
      end
    end
    if num > 1 then
      idx = 1
      while idx < num - 1
        if result[idx] == nil then
          result = result[0...idx] + result[idx+1..]
          num -= 1
        else
          idx += 1
        end
      end
      if result[num - 1] == nil then
        result = result[0...-1]
      end
    end
    return result
  end
end
