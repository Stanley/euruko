class Administration::AdminSessionsController < Administration::ApplicationController

  skip_before_filter :require_admin, :except => :destroy

  def new
    @admin_session = AdminSession.new
  end

  def create
    @admin_session = AdminSession.new(params[:admin_session])
    if @admin_session.save
      flash[:notice] = "You are now logged in as admin"
      redirect_to administration_root_path
    else
      render :action => :new
    end
  end

  def destroy
    current_admin_session.destroy
    redirect_to root_path
  end

end
