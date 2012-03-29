class ApplicationController < ActionController::Base
  FLASH_BOOTSTRAP = { notice: :success, message: :info, alert: :error }

  protect_from_forgery
end
