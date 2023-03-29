require_relative'cohort'

class CohortRepository
def all 
  sql = 'SELECT id, name FROM cohorts;'
  result_set = DatabaseConnection.exec_params(sql, [])
  cohorts = []

  result_set.each do |row|
    cohort = Cohort.new
    cohort.id = row['id']
    cohort.name = row['name']
    
    cohorts << cohort
  end
  cohorts
  end

  def find_by_id(id)

    sql = 'SELECT id, name FROM cohorts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    row = result_set[0]
    cohort = Cohort.new
    cohort.id = row['id']
    cohort.name = row['name']
  
    return cohort

  end

end
