class UsersController < ApplicationController
  before_action :authenticate_user!, only: [ :show ]

  def show
    @created_events = current_user.created_events

    @attended_past_events = current_user.attended_events.where("date < ?", DateTime.current)
    @attended_upcoming_events = current_user.attended_events.where("date >= ?", DateTime.current)
  end
end
