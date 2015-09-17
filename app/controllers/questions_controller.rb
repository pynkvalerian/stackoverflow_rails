class QuestionsController < ApplicationController
	def new
		@question = Question.new
	end

	def create
		if session[:user_id].nil?
			render 'login'
		else
			@question = Question.new(question_params)
			@question.user_id = session[:user_id]
			if @question.save
				current_question(@question.id)
				redirect_to @question
			else 
				render 'new'
			end
		end
	end

	def show
		@question = Question.find(params[:id])
		@answer = Answer.new
	end

	private 
	def question_params
		params.require(:question).permit(:title, :description)
	end

	def current_question(session_id)
		session[:question_id] = session_id
	end
end
