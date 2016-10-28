class DashboardController < ApplicationController
	before_filter :authenticate_user!
	
	def index
		@users = User.all
		@user = User.find_by_id(user_id)
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.create(user_id)

		if user.save
			redirect_to users_path
		end
	end
end
