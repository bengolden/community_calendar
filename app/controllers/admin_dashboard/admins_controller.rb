module AdminDashboard
  class AdminsController < ApplicationController

    def index
      @admins = Admin.all
    end

    def new
      @admin = Admin.new
    end

    def edit
      @admin = current_admin
    end

    def create
      Admin.create(admin_params)
      redirect_to admin_dashboard_admins_path
    end

    def update
      current_admin.update(admin_params)
      bypass_sign_in(current_admin)
      redirect_to admin_dashboard_admins_path
    end

    private

    def admin_params
      params.require(:admin).permit(:email, :password)
    end

  end
end
