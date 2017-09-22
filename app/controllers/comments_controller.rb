class CommentsController < ApplicationController
	before_action :logged_in_user
	def create
	  @comment = @commentable.comments.new comment_params
	  @comment.user = current_user
	  @comment.save
	  redirect_to :back
	end

	private
	  def comment_params
	    params.require(:comment).permit(:content)
	  end
end
