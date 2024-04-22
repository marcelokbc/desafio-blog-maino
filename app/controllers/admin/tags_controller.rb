class Admin::TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag criada com sucesso"
      redirect_to admin_dashboard_index_path
    else
      flash[:error] = "A tag não foi criada, tente novamente"
      render :new
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:title)
  end
end