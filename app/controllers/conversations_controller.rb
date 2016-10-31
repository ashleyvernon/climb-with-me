class ConversationsController < ApplicationController
	before_action :authenticate_user!

	# def index
	# 	@conversations = current_user.mailbox.conversations
	# end

	# def new
	# end

	def create
		# recipient_emails = conversation_params(:recipients).split(',')
		# recipients = User.where(email: recipient_emails).all
    	@recipients = User.where(id: params['recipients'])
    	@body = params[:body]
    	@subject = params[:subject]
    	p current_user
		@conversation = current_user.send_message(@recipients, conversation_params[:body], conversation_params[:subject]).conversation
		p @conversation
		flash[:success] = "Your message was successfully sent!"
		redirect_to conversation_path(@conversation)
	end

	def show
		@conversation = current_user.mailbox.conversations.all

		@receipts = @conversation.order("created_at ASC")
		
		# mark conversation as read
		# @conversation.mark_as_read(current_user)
	end

	def reply
		current_user.reply_to_conversation(conversation, message_params[:body])
		flash[:notice] = "Your reply message was successfully sent!"
		redirect_to conversation_path(conversation)
	end

	def trash
		conversation.move_to_trash(current_user)
		redirect_to mailbox_inbox_path
	end

	def untrash
		conversation.untrash(current_user)
		redirect_to mailbox_inbox_path
	end

	private

	def mailbox
 		@mailbox ||= current_user.mailbox
	end

	def conversation_params
		params.require(:conversation).permit(:subject, :body, recipients:[])
	end


	def conversation
        @conversation ||= mailbox.conversations.find(params[:id])
	end
	# def message_params
	# 	params.require(:message).permit(:body, :subject)
	# end

	
end
