class FlowerField
  def self.annotate(flower_positions)
    return flower_positions if flower_positions == [] or not flower_positions.flatten.join.chars.include?('*')
    rows = flower_positions.size
    columns = flower_positions[0].size
    expanded_rows = flower_positions.map{|row| ' ' + row + ' '}
    expanded_field = [' ' * (rows + 2)] + expanded_rows + [' ' * (rows + 2)]
    new_flower_positions = (1..rows).to_a.map{ |row|
      (1..columns).to_a.each_with_object(''){ |column, new_val|
        if expanded_field[row][column] == '*' then
          new_val << '*'
        else
          num = expanded_field[row - 1..row + 1].map{ |near_row|
            near_row[column - 1..column + 1]
          }.join.chars.count('*')
          if num == 0 then
            new_val << ' '
          else
            new_val << num.to_s
          end
        end
      }
    }
    new_flower_positions
  end
end
