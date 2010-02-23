# encoding: utf-8

class UsersController < ApplicationController
  
  def index
    @users = User.all
  end

  def show
    send_unauthorized unless (@user = User.first(params['id']) if current_admin)
  end

  def me
    if @user = current_user
      render :action => 'show'
    else
      render 'home/index'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account was created"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

end
