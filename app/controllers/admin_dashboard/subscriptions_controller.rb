module AdminDashboard
  class SubscriptionsController < ApplicationController

    before_action :load_subscription, only: [:edit, :destroy]

    def index
      @subscriptions = Subscription.order(:duration, :created_at)
    end

    def edit      
    end

    def destroy
      @subscription.destroy
      redirect_to admin_dashboard_subscriptions_path
    end

    private

    def load_subscription
      @subscription = Subscription.find(params[:id])
    end

  end
end
