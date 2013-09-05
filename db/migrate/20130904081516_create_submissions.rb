class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :problem_id
      t.integer :user_id
      t.string :ip
      t.string :code, limit: 32
      t.integer :time_cost
      t.string :status
      t.text :msg

      t.timestamps
    end
  end
end
