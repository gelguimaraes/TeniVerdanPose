class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :require_login
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound
  end

  private
  def require_login
    unless current_user
      redirect_to login_url
    end
  end
end
