class PresentationsController < ApplicationController

  before_filter :find_object, :only => [:show, :edit, :update]

  def show
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    @presentation.user = current_user
    if @presentation.save
      flash[:notice] = "Presentation was created"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @presentation.update_attributes(params[:presentation])
      flash[:notice] = "Presentation was updated"
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  private

  def find_object
    @presentation = Presentation.find(params['id'])
    send_unauthorized unless current_admin || (@presentation && @presentation.owner == current_user)
  end

end
