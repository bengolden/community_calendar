module AdminDashboard
  class EventsController < ApplicationController

    def index
      @events = Event.all
    end

    def edit
      @event = Event.find(params[:id])
    end

    private

    def event_params
      fields = [
        :title, :description, :starts_at, :ends_at, :venue_name, :venue_address, :venue_url,
        :sponsor_name, :sponsor_url, :tickets_price, :tickets_details, :tickets_url, :contact_name, :contact_details
      ]
      params.require(:event).permit(fields)
    end

  end
end