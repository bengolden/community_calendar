module ApplicationHelper

  def date_format(datetime)
    datetime.strftime("%A %b %-d")
  end

  def time_format(datetime)
    datetime.strftime("%l:%M %P").gsub(/^\s/,"")
  end

end
