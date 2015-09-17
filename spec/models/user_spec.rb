require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "#new" do
  	context "with valid input" do
  		it "should save new user successfully" do
  			user = User.create(name: "Example Name", email: "example@example.com", password: "example", password_confirmation: "example")
  			expect(user.id).to be(User.last.id)
  			expect(user).to be_an_instance_of User
  		end
  	end

  	# context "with invalid email" do
  	# 	it "should give error" do
  	# 		user = User.create(name)
  	# 	end
  	# end
  end
end
