class HomeController < ApplicationController
  def index
  	@links = Link.where(user_id: current_user.id) if user_signed_in?
  end
end
