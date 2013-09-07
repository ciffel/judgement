class AddStatusIndexToSubmissions < ActiveRecord::Migration
  def change
    add_index :submissions, :status
  end
end
