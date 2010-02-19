module ApplicationHelper
  def admin_area?
    params[:controller] =~ /administration/
  end

  def menu_to(name, options = {}, html_options = {}, &block)
    content = link_to(name, options, html_options, &block)
    if current_page?(options)
      "<li class=\"selected\">#{content}</li>".html_safe
    else
      "<li>#{content}</li>".html_safe
    end
  end
end
