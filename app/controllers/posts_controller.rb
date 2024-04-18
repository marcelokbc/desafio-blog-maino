class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  
  def show
    @post = Post.all.last(3)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
