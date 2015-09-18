class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :votable, :polymorphic => true
	
	validates :votable_type, :votable_id, :up_down, :user_id, presence: true

	def self.sum_of_votes(type, id)
		@votes_array = []
		
		if type.class == Question
			Question.find(id).votes.each do |vote|
				@votes_array << vote.count_votes(vote.up_down)
			end
		elsif type.class == Answer
			Answer.find(id).votes.each do |vote|
				@votes_array << vote.count_votes(vote.up_down)
			end
		end
		@votes_array.inject(:+)
	end

		def count_votes(up_down)
		if up_down == "up"
			return 1
		elsif up_down == "down"
			return -1
		end
	end

end
