class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]

  def show
    @user_created_events = current_user.created_events
    @user_attended_events = current_user.attended_events
  end
end
