class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create 
		@user = User.create(user_params)

		if user.save
			redirect_to users_path
		end
	end

	def show 
		user_id = params[:id]
		@user = User.find_by_id(user_path)
	end

	def edit
	end
end
