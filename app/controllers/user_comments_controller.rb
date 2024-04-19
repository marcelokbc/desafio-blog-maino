class UserCommentsController < ApplicationController
  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.user = current_user if user_signed_in?
    
    if @user_comment.save!
      flash[:notice] = "Comment posted."
      redirect_to root_path
    else
      flash[:error] = "Comment not posted."
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  private

  def user_comment_params
    params.require(:user_comment).permit(:content)
  end
end
