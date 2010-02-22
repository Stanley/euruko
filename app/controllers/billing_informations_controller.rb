class BillingInformationsController < ApplicationController

  before_filter :require_owner, :except => [:new, :create]
  
  def new
    @billing_information = BillingInformation.new
  end

  def create
    @billing_information = BillingInformation.new(params[:billing_information])
    @billing_information.user = current_user
    if @billing_information.save
      flash[:notice] = "Billing Information was created"
      redirect_to user_path(current_user)
    else
      render :action => 'new'
    end
  end

  def edit
    @billing_information = current_user.billing_information
  end

  def update
    @billing_information = current_user.billing_information
#    send_unauthorized unless current_admin || (@billing_information && @billing_information.owner == current_user)

    if @billing_information.update_attributes(params[:billing_information ])
      flash[:notice] = "Billing information  was updated"
      redirect_to user_path(current_user)
    else
      render :action => 'edit'
    end
  end

  def require_owner
    current_admin || (@billing_information && @billing_information.owner == current_user) || send_unauthorized
  end
end
