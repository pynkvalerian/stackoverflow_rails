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
				redirect_to @question
			else 
				render 'new'
			end
		end
	end

	def show
		session[:question_id] = params[:id]
		@question = Question.find(params[:id])
		@answer = Answer.new
		@answers = @question.answers
		@comment = Comment.new
		@q_comments = @question.comments
		@a_comments = @answer.comments
	end

	private 
	def question_params
		params.require(:question).permit(:title, :description)
	end

end
