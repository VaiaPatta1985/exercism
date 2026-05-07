class School
  attr_accessor :roster
  
  def initialize
    @roster = []
    @students_grades = {}
  end

  def add(student, in_grade)
    return false if @roster.include?(student)
    @students_grades[student] = in_grade
    @roster = @students_grades.keys.to_a.sort.sort_by { |pupil|
      @students_grades[pupil]
    }
    true
  end

  def grade(num)
    @roster.select { |student| @students_grades[student] == num }
  end
end
 