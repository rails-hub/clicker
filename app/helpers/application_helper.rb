module ApplicationHelper

  def link_fa_to(icon_name, text, link)
    link_to content_tag(:i, text, :class => "fa fa-#{icon_name}"), link
  end

  def item_title(item)
    if item.class.name === "Quiz" || item.class.name === "Poll"
      item.title
    else
      nil
    end
  end

  def check_title_required(item, new_record)
    if new_record
      return false
    else
      if item.class.name === "Quiz" || item.class.name === "Poll"
        return true
      else
        return false
      end
    end
  end

  def item_time_limit(item)
    if item.class.name === "Quiz"
      item.time_limit
    else
      nil
    end
  end

end
