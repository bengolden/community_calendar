class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :my_created_events

  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  def my_created_events
    Event.find_by(id: session[:my_created_events])
  end

end
