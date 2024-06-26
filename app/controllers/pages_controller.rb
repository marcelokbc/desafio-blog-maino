class PagesController < ApplicationController
  def home
    @posts = Post.all.order(created_at: :desc)
    @user = current_user
    @user_comments = UserComment.all.order(created_at: :desc).limit(15)
    @pagy, @posts = pagy(@posts, items: 3)
  end
end
