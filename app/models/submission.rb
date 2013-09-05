class Submission < ActiveRecord::Base
  extend Enumerize

  belongs_to :problem
  belongs_to :user

  enumerize :status, in: [:waiting, :ac, :ce, :tle, :re]

  attr_accessor :code_content, :code_file
end
