class SitesController < ApplicationController
  before_action :authenticate_user!

  def admin_panel
    if current_user.admin?
    else
      render root_path, notice: "You have to be an administrator"
    end
  end
end
