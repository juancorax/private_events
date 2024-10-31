class EventsController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to user_path(current_user.id), notice: "Event updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy!

    redirect_to user_path(current_user.id), notice: "Event deleted"
  end

  private
    def event_params
      params.require(:event).permit(:title, :body, :date, :location)
    end
end
