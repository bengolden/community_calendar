class EventsController < ApplicationController

  def index
    @event = Event.new
    @events = Event.starts_after(Time.now).not_deleted.order(starts_at: :asc)
  end

  def show
    @event = Event.find(params[:id])
  end

  def create
    event = Event.new(event_params)
    event.starts_at = configure_time(event_params["starts_at"])
    event.ends_at = configure_time(event_params["ends_at"])
    event.save
    session[:my_created_events] ||= []
    session[:my_created_events] << event.id
    session[:my_created_events] += event.event_recursions.pluck(:id) if event.recurring?

    redirect_to events_path
  end

  def update
    return redirect_to admin_login_path unless signed_in? || session[:my_created_events].include?(params[:id].to_i)
    @event = Event.find(params[:id])
    @event.assign_attributes(event_params)
    @event.starts_at = configure_time(event_params["starts_at"]) if event_params["starts_at"].present?
    @event.ends_at = configure_time(event_params["ends_at"]) if event_params["ends_at"].present?
    @event.save
    redirect_to update_redirect_path
  end

  private

  def configure_time(param)
    return if param.blank?
    DateTime.strptime(param,"%m/%d/%Y %I:%M %p").change(offset: Time.zone.now.strftime("%z"))
  end

  def event_params
    fields = [
      :title, :description, :starts_at, :ends_at, :venue_name, :venue_address, :venue_url, :facebook_url,
      :sponsor_name, :sponsor_url, :tickets_price, :tickets_details, :tickets_url, :contact_name, :contact_details
    ]
    fields += [:deleted] if @event&.deleted? && signed_in?
    fields += [:recurring, :recurring_duration] if @event.nil?
    params.require(:event).permit(fields)
  end

  def update_redirect_path
    if request.referrer.include?("admin_dashboard") && signed_in?
      admin_dashboard_events_path
    else
      my_created_events_path
    end
  end

end



