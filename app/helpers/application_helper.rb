module ApplicationHelper
  def admin_area?
    params[:controller] =~ /administration/
  end
end
