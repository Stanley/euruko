class PresentationsController < ApplicationController

  before_filter :require_user
#  before_filter :require_owner, :only => [:show, :update]
  
#  actions :new, :show, :create, :edit, :update
  
#  create.before {object.user = current_user}
#  [create, update].each {|action| action.wants.html {redirect_to current_user}}

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    @presentation.user = current_user
    send_unauthorized unless current_admin || (@presentation && @presentation.owner == current_user)

    if @presentation.save
      flash[:notice] = "Presentation was created"
      redirect_to current_user_path
    else
      render :action => 'new'
    end
  end

#  def show
#  end

  def edit
    @presentation = Presentation.find params['id']
  end

  def update
    @presentation = Presentation.find params['id']
    @presentation.user = current_user
    send_unauthorized unless current_admin || (@presentation && @presentation.owner == current_user)

    if @presentation.update_attributes(params['presentation'])
      flash[:notice] = "Presentation was updated"
      redirect_to current_user_path 
    else
      render :action => 'edit'
    end
  end

end
