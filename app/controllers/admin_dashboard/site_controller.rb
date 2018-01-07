module AdminDashboard
  class SiteController < ApplicationController

    before_action ->{ redirect_to admin_login_path if !signed_in? }

    def edit

    end

  end
end
