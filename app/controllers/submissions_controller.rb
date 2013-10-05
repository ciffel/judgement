class SubmissionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_problem, only: [:new, :create]
  before_filter :set_submission, only: [:show]
  before_filter :verify_is_owner, only: [:show]

  def index
    @page_title = 'Submissions'
    @submissions = current_user.submissions.page(params[:page]).recent
  end

  def show
    @page_title = "Submission ##{@submission.id}"
  end

  def new
    @submission = Submission.new
  end

  def create
    if params[:submission][:code_file].nil? && params[:submission][:code_content].empty?
      flash[:danger] = 'Please submit your code'
      redirect_to new_problem_submission_path(@problem)
      return
    end
    @submission = @problem.submissions.build do |s|
      s.user = current_user
      s.status = :waiting
      s.ip = current_user.current_sign_in_ip
      s.code = SecureRandom.hex
    end
    if @submission.save
      dest_path = File.join(Settings.sources_storage_path, "#{@submission.code}.c")
      if not params[:submission][:code_content].empty?
        File.open(dest_path, 'w') do |f|
          f.write(params[:submission][:code_content])
        end
      else
        FileUtils.cp(params[:submission][:code_file].path, dest_path)
      end
      Resque.enqueue(JudgeTask, @submission.id)
      redirect_to submissions_path
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

  def verify_is_owner
    if !current_user.admin? && @submission.user_id != current_user.id
      flash[:error] = "You are not the owner"
      redirect_to submissions_path
    end
  end

end
