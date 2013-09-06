class Submission < ActiveRecord::Base
  extend Enumerize

  belongs_to :problem
  belongs_to :user

  enumerize :status, in: [:waiting, :ac, :wa, :ce, :tle, :re]

  attr_accessor :code_content, :code_file

  def source_path
    "#{Settings.sources_storage_path}/#{code}.c"
  end

  def exec_path
    "#{Settings.exec_pool}/#{code}"
  end
end
