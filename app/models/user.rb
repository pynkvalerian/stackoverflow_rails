class User < ActiveRecord::Base
	
	has_many :questions
	has_many :answers
	has_many :question_comments
	has_many :answer_comments
	has_many :votes

	validates :name, presence: true, length: { maximum: 50 }
	validates :email, presence: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }
	has_secure_password
end
