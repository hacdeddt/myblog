class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :config_permit_params, if: :devise_controller?

  protected
  def config_permit_params
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
  rescue_from ActiveRecord::RecordNotFound do 
  		redirect_to root_url, alert: 'Không tìm thấy'
  	end
  	
  	rescue_from NoMethodError do 
  		redirect_to root_url, alert: 'Không tìm thấy'
  	end
  

end
