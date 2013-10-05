class Inside::ProblemsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :set_problem, only: :show

  def index
    @page_title = 'Problems'
    @problems = Problem.page(params[:page]).order("id ASC")
  end

  def show
    @page_title = @problem.title
    render 'problems/show'
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def authenticate_admin!
    authenticate_user!
    redirect_to problems_path unless current_user.admin?
  end
end
