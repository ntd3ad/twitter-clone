class HomeController < ApplicationController

  def index
    redirect_to dashboard_path if user_signed_in? && !current_user.username.blank?
  end
end
