class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  
  def index
    @posts = Post.where(user_id: current_user.id)
  end
  
  def show
    @posts = Post.all
    @user_comments = UserComment.where(post_id: @post.id).order(created_at: :desc)
    @comments = UserComment.where(post_id: @post.id).map { |comment| comment.content }
  end

  def new
    @post = Post.new
    render :form
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to posts_path
    else
      flash[:error] = "Post not created successfully"
      render :form, status: :unprocessable_entity
    end
  end

  def edit
    render :form
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post updated successfully"
      redirect_to posts_path
    else
      flash[:error] = "Post not updated successfully"
      render :form, status: :unprocessable_entity
    end
  end

  def destroy
    if@post.destroy
      redirect_to action: :index
    end 
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :subtitle, :banner, :content)
  end
end
