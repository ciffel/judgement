class Inside::SubmissionsController < ApplicationController
  include Concerns::AdminManagement
  before_filter :authenticate_admin!

  def index
    @submissions = Submission.page(params[:page]).recent
    render 'submissions/index'
  end

end
