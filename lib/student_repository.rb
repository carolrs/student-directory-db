require 'student'

class StudentRepository
def all 
  sql = 'SELECT id, name, cohort_id FROM students;'
  result_set = DatabaseConnection.exec_params(sql, [])
  students = []

  result_set.each do |row|
    student = Student.new #=>358
    student.id = row['id']
    student.name = row['name']
    student.cohort_id = row['cohort_id']

    students << student
  end
  students
  end

  def find_by_id(id)

    sql = 'SELECT id, name, cohort_id FROM students Where id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    fail "Student not found." if result_set.ntuples.zero?

    row = result_set[0]
    student = Student.new
    student.id = row['id']
    student.name = row['name']
    student.cohort_id = row['cohort_id']

    return student
  end
end
