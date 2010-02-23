class BillingInformationsController < ApplicationController

  before_filter :find_object, :except => [:new, :create]
  
  def new
    @billing_information = BillingInformation.new
  end

  def create
    @billing_information = BillingInformation.new(params[:billing_information])
    @billing_information.user = current_user
    if @billing_information.save
      flash[:notice] = "Billing Information was created"
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update

    if @billing_information.update_attributes(params[:billing_information ])
      flash[:notice] = "Billing information  was updated"
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  def find_object
    @billing_information = current_user.billing_information
    send_unauthorized unless current_admin || @billing_information
  end
end
