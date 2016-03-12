class UsersController < ApplicationController
  before_action :authenticate_user!
  def admin_panel
    if current_user.admin?
      @admin = current_user
      @texts = @admin.texts.order("updated_at DESC")
      @pieces = @admin.pieces.order("updated_at DESC")
      @projects = @admin.projects.order("updated_at DESC")
    else
      render root_path, notice: "You have to be an administrator"
    end
  end
end


