module ApplicationHelper

  def link_fa_to(icon_name, text, link)
    link_to content_tag(:i, text, :class => "fa fa-#{icon_name}"), link
  end
end
