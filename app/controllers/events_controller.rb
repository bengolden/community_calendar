class EventsController < ApplicationController

  def index
    @event = Event.new
    @events = Event.all
  end

  def create
    event = Event.new(event_params)
    event.save
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :organization_name, :description, :event_at, :venue_name, :venue_address, :contact_information)
  end

end



