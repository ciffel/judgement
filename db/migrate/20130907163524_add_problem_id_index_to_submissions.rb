class AddProblemIdIndexToSubmissions < ActiveRecord::Migration
  def change
    add_index :submissions, :problem_id
  end
end
