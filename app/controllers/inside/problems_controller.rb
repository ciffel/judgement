class Inside::ProblemsController < ApplicationController
  include Concerns::AdminManagement
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

end
