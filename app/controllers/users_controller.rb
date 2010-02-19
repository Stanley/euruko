# encoding: utf-8

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account was created"
      redirect_to user_path(@user)
    else
      render :action => 'new'
    end
  end

  def show

    @user = if params['id'] and current_admin
      User.first(params['id'])
    else
      current_user
    end

    send_unauthorized unless @user
    
  end
end
