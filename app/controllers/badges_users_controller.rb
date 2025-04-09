class BadgesUsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @badges_users = current_user.badges_users
  end
end
