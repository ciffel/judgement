class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_problem, only: [:new, :create]
  before_filter :set_submission, only: [:show]


  def index
    @submissions = current_user.submissions
  end

  def show
  end

  def new
    @submission = Submission.new
  end

  def create
    if params[:submission][:code_file].nil? && params[:submission][:code_content].nil?
      redirect_to new_problem_submission_path(@problem), alert: 'Please submit your code'
    end
    @submission = @problem.submissions.build do |s|
      s.user = current_user
      s.status = :waiting
      s.ip = current_user.current_sign_in_ip
      s.code = SecureRandom.hex
    end
    if @submission.save
      dest_path = File.join(Settings.sources_storage_path, "#{@submission.code}.c")
      tmp_file = params[:submission][:code_file]
      begin
        if tmp_file
          FileUtils.cp(params[:submission][:code_file].path, dest_path)
        else
          File.open(dest, 'w') do |f|
            f.write(params[:submission][:code_content])
          end
        end
      ensure
        tmp_file.close if tmp_file
      end
    else
      redirect_to new_problem_submission_path(@problem), alert: 'Please try again'
    end
  end

  private

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end

  def set_submission
    @submission = Submission.find(params[:id])
  end

end
