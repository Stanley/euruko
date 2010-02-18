class Administration::PresentationsController < Administration::ApplicationController

  def index
    @presentations = Presentation.all
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    if @presentation.save
      flash[:notice] = "Presentation was created"
      redirect_to administration_presentations_path
    else
      render :action => 'new'
    end
  end

end
