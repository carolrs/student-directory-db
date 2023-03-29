require 'cohort_repository'
require 'cohort'

describe CohortRepository do

  def reset_cohorts_table
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'student_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_cohorts_table()
  end

  it "returns all cohorts in the listlist" do
    repository = CohortRepository.new
    cohorts = repository.all

    result = Cohort.new("1","March")
    

    expect(cohorts).to eq [result]

  end

  it "returns cohort by id" do
    repository = CohortRepository.new
    cohorts = repository.find_by_id(1)
    expect(cohorts.name).to eq 'March'

  end
end