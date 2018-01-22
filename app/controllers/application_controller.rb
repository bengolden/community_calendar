class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :my_created_events, :current_subscription

  def after_sign_in_path_for(resource)
    admin_dashboard_path
  end

  def my_created_events
    Event.find_by(id: session[:my_created_events])
  end

  def current_subscription
    Subscription.find_or_initialize_by(id: session[:my_subscription_id])
  end

end
