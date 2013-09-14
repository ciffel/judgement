class Problem < ActiveRecord::Base
  has_many :submissions

  def ans_path
    "#{Settings.problems_path}/#{self.id}/out"
  end

  def input_path
    "#{Settings.problems_path}/#{self.id}/in"
  end

  def passed?(user)
    user && Submission.exists?(problem_id: self.id, user_id: user.id, status: :ac)
  end
end
