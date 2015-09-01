class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

	def twitter
	  @client ||= Twitter::REST::Client.new do |config|
	    config.consumer_key        = Rails.application.secrets.twitter_api_key
	    config.consumer_secret     = Rails.application.secrets.twitter_api_secret
	    config.access_token        = token
	    config.access_token_secret = secret
	  end
	end


end

