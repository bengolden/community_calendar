class MyCreatedEventsController < ApplicationController

  before_action ->{ redirect_to root_path if my_created_events.nil? }

  def index
    @events = Event.where(id: session[:my_created_events]).order("deleted ASC NULLS FIRST, starts_at")
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    Event.find(params[:id]).update(deleted: true)
    redirect_to my_created_events_path
  end

end