module AdminDashboard
  class AdminsController < ApplicationController

    before_action ->{ redirect_to admin_login_path if !signed_in? }

    def index

    end

  end
end
