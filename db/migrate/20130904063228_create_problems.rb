class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :title
      t.text :description
      t.integer :time_limit
      t.integer :mem_limit

      t.timestamps
    end
  end
end
