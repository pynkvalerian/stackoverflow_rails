class VotesController < ApplicationController

	def create
		 if session[:user_id].nil?
			render 'login'
		else
			@vote = Vote.new(votes_params)
			@vote.user_id = session[:user_id]
			if @vote.save
				final_votes = Vote.sum_of_votes(@vote.votable_type, @vote.votable_id)
				vote = {
					type: @vote.votable_type,
					type_id: @vote.votable_id,
					final_votes: final_votes
					}
					byebug
				vote.to_json
			else 
				render 'new'
			end
		end
	end

	def show
		@vote = Vote.find(params[:id])
	end

	private
	def votes_params
		params.require(:vote).permit(:votable_id, :votable_type, :up_down)
	end
end
