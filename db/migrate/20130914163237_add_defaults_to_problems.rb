class AddDefaultsToProblems < ActiveRecord::Migration
  def change
    change_column :problems, :time_limit, :integer, default: 4000
    change_column :problems, :mem_limit, :integer, default: 131072
    change_column :problems, :visible, :boolean, default: true
  end
end
