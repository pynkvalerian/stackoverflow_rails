class Vote < ActiveRecord::Base
	belongs_to :user
	belongs_to :votable, :polymorphic => true
	
	validates :votable_type, :votable_id, :up_down, :user_id, presence: true
end
