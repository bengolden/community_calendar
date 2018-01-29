class MyCreatedEventsController < ApplicationController

  before_action ->{ redirect_to root_path if my_created_events.nil? }

  def index
    @events = my_events.order("deleted ASC NULLS FIRST, starts_at")
  end

  def edit
    load_event
  end

  def destroy
    load_event

    @event.update(deleted: true)
    redirect_to my_created_events_path
  end

  private

  def my_events
    Event.where(id: session[:my_created_events])
  end

  def load_event
    @event = my_events.find_by(id: params[:id])
    return redirect_to :index if @event.nil?
  end

end