class PasswordsController < ApplicationController

  before_filter :find_user

  def edit
  end

  def update
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = "Password successfully changed"
      redirect_to root_path
    else
      render :action => :edit
    end
  end

  private

  def find_user
    @user = current_user || send_unauthorized
  end

end
