class AnswersController < ApplicationController
	def new
		@answer = Answer.new
	end

	def create
		if session[:user_id].nil?
			render 'login'
		else
			@answer = Answer.new(answer_params)
			@answer.user_id = session[:user_id]
			if @answer.save
				redirect_to @answer.question
			else
				flash.now[:danger] = "Oh no, your answer is not saved!"
			end
		end
	end

	private
	def answer_params
		params.require(:answer).permit(:description, :question_id)
	end

end
