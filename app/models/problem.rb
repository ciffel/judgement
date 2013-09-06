class Problem < ActiveRecord::Base
  has_many :submissions

  def ans_path
    "#{Settings.problems_path}/#{self.id}/out"
  end
end
