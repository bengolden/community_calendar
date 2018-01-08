module AdminDashboard
  class SiteController < ApplicationController

    before_action ->{ redirect_to admin_login_path if !signed_in? }

    def edit
      @site = Site.first
    end

    def update
      Site.first.update(site_params)
      redirect_to edit_admin_dashboard_site_path
    end

    private

    def site_params
      params.require(:site).permit(:name)
    end

  end
end
