class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_user, only: %i[index new create edit update destroy]
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
    @tags = Tag.all
    render :form
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Post criado com sucesso"
      redirect_to posts_path
    else
      flash[:error] = "O post não foi criado, tente novamente"
      render :form, status: :unprocessable_entity
    end
  end

  def edit
    @tags = Tag.all
    render :form
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Post atualizado com sucesso"
      redirect_to posts_path
    else
      flash[:error] = "Post não foi atualizado, tente novamente"
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

  def set_user
    @user = User.find(current_user.id)
  end

  def post_params
    params.require(:post).permit(:user_id, :title, :subtitle, :banner, :content, tag_ids: [])
  end
end
