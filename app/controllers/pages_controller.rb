class PagesController < ApplicationController
  def home
    @posts = Post.all.order(created_at: :desc)
    @user_comments = UserComment.all.order(created_at: :desc)
    @pagy, @posts = pagy(@posts, items: 3)
  end
end
