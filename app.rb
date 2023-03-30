# file: app.rb
require_relative 'lib/database_connection'
require_relative 'lib/student_repository'
require_relative 'lib/cohort_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('student_directory')

student_repository = StudentRepository.new
cohort_repository = CohortRepository.new

# Print out each record from the result set .
student_repository.all.each do |student|
  puts student
end

puts "-------------------------------"

cohort_repository.all.each do |cohort|
  puts  cohort
end

