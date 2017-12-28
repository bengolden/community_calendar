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
    event.starts_at = configure_time(event_params["starts_at"])
    event.ends_at = configure_time(event_params["ends_at"])
    event.save
    redirect_to events_path
  end

  private

  def configure_time(param)
    return if param.blank?
    DateTime.strptime(param,"%m/%d/%Y %I:%M %p") + 6.hours
  end

  def event_params
    fields = [
      :title, :description, :starts_at, :ends_at, :venue_name, :venue_address, :venue_url,
      :sponsor_name, :sponsor_url, :tickets_price, :tickets_details, :tickets_url
    ]
    params.require(:event).permit(fields)
  end

end



