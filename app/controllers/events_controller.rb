class EventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      redirect_to user_path(current_user.id), notice: "Event created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :body, :date, :location)
    end
end
