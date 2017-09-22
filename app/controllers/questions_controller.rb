class QuestionsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :vote]
  
	def new
		@question = Question.new
  end
  
  def create
  	@question = current_user.questions.build(question_params)
  	if @question.save
  	  flash[:success] = "Question created!"
  	  redirect_to @question
  	else
  	  render 'questions/new'
  	end
  end

  def show
    @question = Question.find(params[:id])
  end

  def vote 
    @question = Question.find(params[:id])
    @question.liked_by current_user
    if @question.vote_registered?
      redirect_to :back
    else
      @question.unliked_by current_user
      redirect_to :back
    end
  end 

  private
    def question_params
      params.require(:question).permit(:title, :content)
    end
end
