class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :mailbox, :conversation

  private

  def mailbox
  	@mailbox ||= current_user.mailbox
  end
  
  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:user_id, :name, :email, :password, :gym)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:user_id, :email, :name, :description, :password, :current_password, :password_confirmation, :avatar) }
    # devise_parameter_sanitizer.for(:sign_up) << :name
  end

end
