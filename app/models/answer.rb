class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :comments, :as => :commentable
	has_many :votes, :as => :votable

	validates :description, :question_id, :user_id, presence: true
end
