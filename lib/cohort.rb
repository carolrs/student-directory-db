class Cohort
  attr_accessor :id, :name, :starting_date

  def initialize(id = nil, name = nil, starting_date = nil)
    @id = id
    @name =  name
    @starting_date = starting_date
  end

  def ==(other)
    return false unless other.is_a?(Cohort)
    @id == other.id && @name == other.name && @starting_date == other.starting_date
  end

  def to_s
    return "Id: #{id}, Cohort: #{name}, Starting date: #{starting_date}"

  end
end