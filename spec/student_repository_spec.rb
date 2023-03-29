require 'student_repository'
require 'student'

describe StudentRepository do

  def reset_students_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_test' })
    connection.exec(seed_sql)
  end

  def empty_students_table
    seed_sql = File.read('spec/seeds_empty_table.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_students_table()
  end

  it "returns all students list" do
    repository = StudentRepository.new
    students = repository.all

    result = Student.new("1","Carolina", "1")
    result_2 = Student.new("2","John", "1")

    expect(students).to eq [result, result_2]

  end

  it "returns student by id" do
    repository = StudentRepository.new
    students = repository.find_by_id(2)

    expect(students.name).to eq 'John'

  end

  it "raise errors when id not found" do
    repository = StudentRepository.new
    expect { repository.find_by_id(5) }.to raise_error("Student not found")

  end

  it "returns empty" do
    empty_students_table()

    repository = StudentRepository.new
    students = repository.all
    expect(students).to eq []

  end
end