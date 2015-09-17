class VotesController < ApplicationController

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

end
