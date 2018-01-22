module AdminDashboard
  class ApplicationController < ::ApplicationController

    before_action ->{ redirect_to admin_login_path if !signed_in? }
  end
end