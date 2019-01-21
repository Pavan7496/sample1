
class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
  include SessionsHelper
  def handle_unverified_request
    sign_out
    super
  end
helper_method :current_user
  def current_user
    if session[:user_id]
     @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end
end
