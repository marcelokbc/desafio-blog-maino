class Admin::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_dashboard_index_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :subtitle, :banner, :content, :user_id)
  end
end