class Cohort
  attr_accessor :id, :name

  def initialize(id = nil, name = nil)
    @id = id
    @name =  name
  end

  def ==(other)
    return false unless other.is_a?(Cohort)
    @id == other.id && @name == other.name 
  end

  def to_s
    return "Id: #{id}, Cohort: #{name}"

  end
end