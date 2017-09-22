class AnswersController < ApplicationController
	before_action :logged_in_user, only: [:create, :vote]

	def create
		@question = Question.find(params[:question_id])
	  @question.answers.create(answers_params)

	  redirect_to @question
	end
	
  def vote 
    @answer = Answer.find(params[:id])
    @answer.liked_by current_user
    if @answer.vote_registered?
      redirect_to :back
    else
      @answer.unliked_by current_user
      redirect_to :back
    end
  end

  private
    def answers_params
      params.require(:answer).permit(:content).merge(user: current_user)
    end
end
