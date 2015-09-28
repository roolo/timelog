class ApplicationController < ActionController::Base
  FLASH_BOOTSTRAP = { notice: :success, message: :info, alert: :error }
  before_action :set_user_time_zone

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end
end
