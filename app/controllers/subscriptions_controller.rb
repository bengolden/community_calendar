class SubscriptionsController < ApplicationController

  def create
    @subscription = Subscription.new(subscription_params)
    @subscription.save
    session[:my_subscription_id] = @subscription.id if current_subscription.new_record?
    redirect_back(fallback_location: root_path)
  end

  def update
    return redirect_to admin_login_path unless signed_in? || session[:current_subscription] == params[:id].to_i

    @subscription = Subscription.find(params[:id])
    @subscription.update(subscription_params)
    redirect_for_update
  end

  def destroy
    @subscription.update(subscription_params)
    @subscription.delete
    redirect_back(fallback_location: root_path)
  end

  private

  def subscription_params
    params.require(:subscription).permit(:email, :duration)
  end

  def redirect_for_update
    if request.referrer.include?("admin_dashboard") && signed_in?
      redirect_to admin_dashboard_subscriptions_path
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
