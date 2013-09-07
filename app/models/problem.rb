class Problem < ActiveRecord::Base
  has_many :submissions

  def ans_path
    "#{Settings.problems_path}/#{self.id}/out"
  end

  def input_path
    "#{Settings.problems_path}/#{self.id}/in"
  end
end
