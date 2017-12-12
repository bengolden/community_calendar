module ApplicationHelper

  def date_format(datetime)
    return unless datetime.respond_to?(:strftime)
    datetime.strftime("%A %b %-d")
  end

  def time_format(datetime)
    return unless datetime.respond_to?(:strftime)
    datetime.strftime("%l:%M %P").gsub(/^\s/,"")
  end

end
