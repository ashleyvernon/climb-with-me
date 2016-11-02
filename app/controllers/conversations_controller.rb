class ConversationsController < ApplicationController
	before_action :authenticate_user!
	helper_method :mailbox, :conversation

	def index
		@conversations = current_user.mailbox.conversations
	end

	# def new
	# end

	def create
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
    	@body = params[:body]
    	@subject = params[:subject]			
		# mark conversation as read
		# @conversation.mark_as_read(current_user)
	end

	def reply
		current_user.reply_to_conversation(@conversation, *message_params(:body, :subject))

		flash[:notice] = "Your reply message was successfully sent!"
		redirect_to conversation_path(@conversation)
	end

	def sent
		current_user.mailbox.sentbox
	end


	def trash
		# @conversation = mailbox.conversations.find(params[:id])
		conversation.move_to_trash(current_user)
		# @conversation = current_user.send_message(@recipients, conversation_params[:body], conversation_params[:subject]).conversation
		if @conversation
			flash[:success] = 'The conversation was moved to trash.'
			redirect_to mailbox_inbox_path
		end
	end

	def untrash
		@conversation.untrash(current_user)
		redirect_to mailbox_inbox_path
	end

	def empty_trash
		current_user.mailbox.trash.each do |conversation|
			conversation.receipts_for(current_user).update_all(:deleted == true)
		end
		redirect_to :conversations
	end


	private

	def mailbox
 		@mailbox ||= current_user.mailbox
	end

	def conversation_params
		params.require(:conversation).permit(:subject, :body, recipients:[])
	end


	def conversation
        @conversation ||= mailbox.conversations.all(params[:id])
	end

	# def message_params
	# 	params.require(:message).permit(:body, :subject)
	# end

	
end
