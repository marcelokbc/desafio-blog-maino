# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  before_action :authenticate_user!

  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    @user = current_user
  end

  # PUT /resource/password
  def update
    @user = current_user
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to root_path, notice: "Password updated successfully"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
