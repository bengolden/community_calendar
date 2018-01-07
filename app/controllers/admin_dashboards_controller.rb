class AdminDashboardsController < ApplicationController

  def show
    redirect_to admin_dashboard_events_path
  end
end