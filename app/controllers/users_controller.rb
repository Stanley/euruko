# encoding: utf-8

class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    @user = current_admin ? User.first(params['id']) : current_user
  end

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

end
