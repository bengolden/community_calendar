module AdminDashboard
  class EventsController < ApplicationController

    before_action ->{ redirect_to admin_login_path if !signed_in? }

    def index
      @events = Event.order("deleted ASC NULLS FIRST")
    end

    def edit
      @event = Event.find(params[:id])
    end

    def destroy
      Event.find(params[:id]).update(deleted: true)
      redirect_to admin_dashboard_events_path
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