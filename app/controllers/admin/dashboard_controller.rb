class Admin::DashboardController < ApplicationController
  before_action :user_is_admin?

  def index
    @posts = Post.all.order(created_at: :desc)
    @tags = Tag.all.order(created_at: :desc)
  end

  private

  def user_is_admin?
    redirect_to root_path if current_user.access != "admin"
  end
end