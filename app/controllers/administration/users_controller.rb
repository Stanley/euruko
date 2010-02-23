class Administration::UsersController < Administration::ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Your account was created"
      redirect_to administration_users_path
    else
      render :action => 'new'
    end
  end

end
