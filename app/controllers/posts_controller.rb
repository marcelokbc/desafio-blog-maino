class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  
  def show
    @posts = Post.all
    @user_comments = UserComment.where(post_id: @post.id).order(created_at: :desc)
    @comments = UserComment.where(post_id: @post.id).map { |comment| comment.content }
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
