class ProblemsController < ApplicationController
  before_filter :set_problem, only: [:show]

  def index
    @problems = Problem.all
  end

  def show

  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end
end
