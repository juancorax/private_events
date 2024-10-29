class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]

  def show
    @user_created_events = current_user.created_events
  end
end
