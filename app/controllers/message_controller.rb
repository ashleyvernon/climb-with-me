class MessageController < ApplicationController
	before_action :authenticate_user!

	def inbox
		# find all message where: Message.to == current_user.id || Message.from == current_user.id
		# - now you have all the messages that involve a user (both sent and received) 
	end

	def create_get
		# get all the other friends/users, make them available to your page
	end

	def create_post
		# data POSTed up: to (id), message
		# data.from = current_user.id
		# data.createdAt = now()
		# MessagesTable.create(data) // inserts new record into Messages Table in database
	end

	def trash 
		# todo later
	end

end
