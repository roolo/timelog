class ApplicationController < ActionController::Base
  FLASH_BOOTSTRAP = { notice: :success, message: :info, alert: :error }

  protect_from_forgery
  before_filter :set_user_time_zone
  before_filter :prepare_log


  private
  def prepare_log
    @new_log = Log.new
    @new_topic = Topic.new
  end

  private

  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in?
  end

end
