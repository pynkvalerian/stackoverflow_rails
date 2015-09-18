class VotesController < ApplicationController

	def create
		 if session[:user_id].nil?
			render 'login'
		else
			@vote = Vote.new(params[:vote])
			@vote.user_id = session[:user_id]
			if @vote.save
				final_votes = sum_of_votes(@vote.votable_type, @vote.votable_id)
				vote = {
					type: @vote.votable_type,
					type_id: @vote.votable_id,
					final_votes: final_votes
					}
				vote.to_json
			else 
				render 'new'
			end
		end
	end

	def show
		@vote = Vote.find(params[:id])
	end

	def integer(up_down)
		if up_down.include("up")
			return 1
		elsif up_down.include("down")
			return -1
		end
	end

	def sum_of_votes(type, id)
		votes_array = []
		if type.include("Question")
			Question.find(id).votes.all do |vote|
				votes_array << integer(vote.up_down)
			end
		elsif type.include("Answer")
			Answer.find(id).votes.all do |vote|
				votes_array << integer(vote.up_down)
			end
		end
		votes_array.inject(:+)
	end
end
