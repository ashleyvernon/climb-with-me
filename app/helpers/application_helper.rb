module ApplicationHelper
	
	def flash_class(level)
		case level.to_sym
			when :notice then "alert alert-success"
			when :info then "alert alert-info"
			when :alert then "alert alert-danger"
			when :warning then "alert alert-warning"
		end
	end
	
	def resource_name
		:user
	end

	def resource
		@user ||= User.new(params[:id])
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

	def active_page(active_page)
		@active == active_page ? "active" : ""
	end
end
