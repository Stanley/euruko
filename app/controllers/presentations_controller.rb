class PresentationsController < ApplicationController

  def show
    @presentation = Presentation.find(params['id'])
    send_unauthorized unless current_admin || (@presentation && @presentation.owner == current_user)
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    @presentation.user = current_user
    if @presentation.save
      flash[:notice] = "Presentation was created"
      redirect_to user_path(current_user)
    else
      render :action => 'new'
    end
  end

  def edit
    @presentation = Presentation.find params['id']
    send_unauthorized unless current_admin || (@presentation && @presentation.owner == current_user)
  end

  def update
    @presentation = Presentation.find params['id']
    send_unauthorized unless current_admin || (@presentation && @presentation.owner == current_user)

    if @presentation.update_attributes(params[:presentation])
      flash[:notice] = "Presentation was updated"
      redirect_to user_path(current_user) 
    else
      render :action => 'edit'
    end
  end

end
