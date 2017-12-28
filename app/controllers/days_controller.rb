class DaysController < ApplicationController

  def show
    datetime = load_day(params[:id])
    @events = Event.where("starts_at between ? AND ?", datetime.beginning_of_day, datetime.end_of_day).order(starts_at: :asc)
  end

  def load_day(id)
    DateTime.new(id[0..3].to_i, id[4..5].to_i, id[6..7].to_i).change(offset: Time.zone.now.strftime("%z"))
  end

end