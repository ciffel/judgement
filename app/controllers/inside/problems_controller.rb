class Inside::ProblemsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @page_title = 'Problems'
    @problems = Problem.page(params[:page]).order("id ASC")
    render 'problems/index'
  end

  private

  def authenticate_admin!
    authenticate_user!
    redirect_to problems_path unless current_user.admin?
  end
end
