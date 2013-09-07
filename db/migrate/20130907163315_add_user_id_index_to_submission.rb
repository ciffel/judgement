class AddUserIdIndexToSubmission < ActiveRecord::Migration
  def change
    add_index :submissions, :user_id
  end
end
