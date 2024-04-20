class Admin::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post criado com sucesso"
      redirect_to admin_dashboard_index_path
    else
      flash[:error] = "O post não foi criado, tente novamente"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :subtitle, :banner, :content, :user_id)
  end
end