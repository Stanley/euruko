# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def admin_area?
    params[:controller] =~ /administration/
  end
end
