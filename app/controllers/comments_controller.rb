class CommentsController < ApplicationController
  def new
  	@comment = Comment.new
  end

  def create
  	if session[:user_id].nil?
			render 'login'
		else
			@comment = Comment.new(comment_params)
			@comment.user_id = session[:user_id]
			if @comment.save
				redirect_to Question.find(session[:question_id])
			else 
				render 'new'
			end
		end
  end

  private 
  def comment_params
  	params.require(:comment).permit(:description, :commentable_type, :commentable_id)
  end

end
