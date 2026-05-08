class Garden
  CHILDREN = %w[alice bob charlie david eve fred ginny harriet ileana joseph kincaid larry]
  PLANT = {g: :grass, c: :clover, r: :radishes, v: :violets}
  
  def initialize(plants_str)
    plants = plants_str.split("\n").map(&:chars)
    num_students = plants[0].length/2
    rearranged_plants = (0...num_students).to_a.map{|index|index*2}.map{|index| plants[0][index..index+1]+plants[1][index..index+1]}.map{|plant_arr| plant_arr.map{|initial| PLANT[initial.downcase.to_sym]}}
    @kids_plants = Hash[CHILDREN[0...num_students].zip(rearranged_plants)]
  end

  def method_missing(child)
    @kids_plants[child.to_s]
  end
end