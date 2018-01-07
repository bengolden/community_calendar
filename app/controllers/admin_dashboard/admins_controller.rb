module AdminDashboard
  class AdminsController < ApplicationController

    before_action ->{ redirect_to admin_login_path if !signed_in? }

    def index
      @admins = Admin.all
    end

    def new
      @admin = Admin.new
    end

    def edit
      @admin = current_admin
    end

  end
end
