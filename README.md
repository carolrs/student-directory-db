# Students Model and Repository Classes Design Recipe

_Copy this recipe template to design and implement Model and Repository classes for a database table._

## 1. Design and create the Table

If the table is already created in the database, you can skip this step.

Otherwise, [follow this recipe to design and create the SQL schema for your table](./single_table_design_recipe_template.md).

*In this template, we'll use an example table `students`*

```
# EXAMPLE

Table: students

Columns:
id | name | cohort_id

Table: cohorts

Columns:
id | name | starting_date


```

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql

TRUNCATE TABLE students RESTART IDENTITY; 

INSERT INTO students (name, cohort_id ) VALUES ('Carolina', '1');
INSERT INTO students (name, cohort_id ) VALUES ('John','1');

```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 your_database_name < seeds_{table_name}.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Model class
# (in lib/student.rb)
class Student
end

# Repository class
# (in lib/student_repository.rb)
class StudentRepository
end

# (in lib/cohort.rb)
class Cohort
end

#(in lib/cohort_repository.rb)
class Cohort_repository
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby


class Student

  # Replace the attributes by your own columns.
  attr_accessor :id, :name, :cohort_id
end

class Cohort
  attr_accessor :id, :name, :starting_date
end
# The keyword attr_accessor is a special Ruby feature
# which allows us to set and get attributes on an object,

```


## 5. Define the Repository Class interface

Your Repository class will need to implement methods for each "read" or "write" operation you'd like to run against the database.

Using comments, define the method signatures (arguments and return value) and what they do - write up the SQL queries that will be used by each method.

```ruby
# EXAMPLE
# Table name: cohort_id

# Repository class
# (in lib/student_repository.rb)

class StudentRepository

require_relative'student'

class StudentRepository
  def all 
    
  end
  

  def find_by_id(id)

  end

end

class CohortRepository
  def all 
    
  end
  

  def find_by_id(id)
  
  end

end

end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby
# EXAMPLES

# 1
# Get all students

repo = Studentrepository.new
students = repo.all

students.first.name # => 'Carolina'
students.first.cohort_id # => '1'


# When there are any students in data base

repo = StudentRepository.new
result = Student.new("1","Carolina", "1")
students = repo.all # => [result]




#returns all cohorts in the listlist"
repository = CohortRepository.new
cohorts = repository.all
result = Cohort.new("1","March")
    
cohorts #=> [result]

#returns by id

repository = CohortRepository.new
cohorts = repository.find_by_id(1)
cohorts.name #=> 'March
end


```

Encode this example as a test.

## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# EXAMPLE

# file: spec/student_repository_spec.rb

def reset_students_table
  seed_sql = File.read('spec/seeds_students.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'students' })
  connection.exec(seed_sql)
end

describe StudentRepository do
  before(:each) do 
    reset_students_table
  end

end
```
