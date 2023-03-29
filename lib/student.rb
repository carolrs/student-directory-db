class Student
  attr_accessor :id, :name, :cohort_id

  def initialize(id = nil, name = nil, cohort_id = nil)
    @id = id
    @name =  name
    @cohort_id = cohort_id

  end

  def ==(other)
    return false unless other.is_a?(Student)
    @id == other.id && @name == other.name && @cohort_id == other.cohort_id
  end

  def to_s
    return "Id: #{id}, Name: #{name}, Cohort_id: #{cohort_id}"

  end
end