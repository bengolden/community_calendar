class EventsController < ApplicationController

  def index
    @event = Event.new
    @events = Event.starts_after(Time.now)
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    event = Event.new(event_params)
    event.save
    redirect_to events_path
  end

  private

  def event_params
    fields = [
      :title, :description, :event_at, :venue_name, :venue_address, :venue_url,
      :sponsor_name, :sponsor_url, :tickets_price, :tickets_details, :tickets_url
    ]
    params.require(:event).permit(fields)
  end

end



