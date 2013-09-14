class ProblemsController < ApplicationController
  before_filter :set_problem, only: [:show]
  before_filter :verify_visable, only: [:show]

  def index
    @problems = Problem.where(visible: true).all
  end

  def show
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def verify_visable
    redirect_to problems_path unless @problem.visible
  end
end
