class Submission < ActiveRecord::Base
  extend Enumerize
  enumerize :status, in: [:waiting, :ac, :wa, :ce, :tle, :re]

  belongs_to :problem
  belongs_to :user

  self.per_page = 10

  attr_accessor :code_content, :code_file

  def source_path
    "#{Settings.sources_storage_path}/#{code}.c"
  end

  def exec_path
    "#{Settings.exec_pool}/#{code}"
  end

  def out_path
    "#{Settings.exec_pool}/#{code}.out"
  end

  def friendly_status
    case status
    when 'waiting'
      'Waiting'
    when 'ac'
      'Accepted'
    when 'wa'
      'Wrong Answer'
    when 'ce'
      'Compile Error'
    when 'tle'
      'Time Limit Exceeded'
    when 're'
      'Runtime Error'
    end
  end

end
