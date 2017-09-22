class StaticPagesController < ApplicationController
	before_action :set_ransack
  def home
    if params[:q].present?
      @all_questions = @search.result.paginate(page: params[:page])
    else
      @all_questions = Question.all.paginate(page: params[:page])
    end
  end
  
  private
    def set_ransack
      @search = Question.search(params[:q])
    end
end
