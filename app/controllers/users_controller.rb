class UsersController < ApplicationController
	def index
		@users = User.all
		
	end

	# def create 
	# 	@user = User.create(user_params)
	# 	login(@user)
	# 	if @user.save
	# 		redirect_to @user
	# 	end
		
	# end

	def show 
		user_id = params[:id]
		@user = User.find_by_id(user_id)
	end

	def edit
		user_id = params[:id]
		@user = User.find_by_id(user_id)
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_registration_path
		end
	end

	private 

	def user_params
		params.require(:user).permit(:user_id, :name, :email, :password, :gym)
	end

end
