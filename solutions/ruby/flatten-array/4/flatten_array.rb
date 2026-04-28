module FlattenArray
  def self.flatten(stuff)
    result = []
    stuff.each do |item|
      case item
      when Array
        result += FlattenArray.flatten(item) unless item.empty?
      else
        result << item unless item.nil?
      end
    end
    result
  end
end
