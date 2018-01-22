module EventsHelper
  def can_add_new_events?; true; end
  def can_subscribe_to_reminder_emails?; true; end
  def show_sidebar?; true; end
  def show_calendar?; true; end

  def can_manage_events?
    my_created_events.present?
  end

  def weeks_remaining_in_month(time)
    times = []
    advanced_time = time
    until time.month != advanced_time.beginning_of_week(:sunday).month && times.length > 1
      beginning_of_week = advanced_time.beginning_of_week(:sunday)
      times << beginning_of_week
      advanced_time += 1.week
    end
    times
  end

  def invalid_day?(day, month)
    day.month != month.month || day.beginning_of_day < month.beginning_of_day
  end

  def render_day(week, month, index)
    if invalid_day?(week + index.days, month)
      render "events/calendar/invalid_day", day: week + index.days, month: month
    else
      render "events/calendar/day", day: week + index.days, month: month
    end
  end

  def event_count(day)
    count = @events.pluck(:starts_at).map(&:to_date).select{ |date| date == day.to_date }.count
    return if count.zero?
    "#{count} <span class='events-text'>event#{'s' unless count == 1}</span>".html_safe
  end

  def show_venue_details?(event)
    event.venue_name.present? || event.venue_address.present? || event.venue_url.present?
  end

  def show_sponsor_details?(event)
    event.sponsor_name.present? || event.sponsor_url.present? || event.contact_name.present? || event.contact_email.present?
  end

  def show_ticket_details?(event)
    event.tickets_price.present? || event.tickets_details.present? || event.tickets_url.present?
  end

  def google_calendar_link(event)
    link = "http://www.google.com/calendar/event?action=TEMPLATE"
    link += "&text=#{event.title}" if event.title?
    if event.starts_at? && event.ends_at?
      link += "&dates=#{google_time(event.starts_at)}/#{google_time(event.ends_at)}"
    elsif event.starts_at?
      link += "&dates=#{google_time(event.starts_at)}/#{google_time(event.starts_at)}"
    end
    link += "&details=#{event.description}" if event.description?
    link += "&location=#{event.venue_address}" if event.venue_address?
    link += "&trp=false&sprop=&sprop=name:' target='_blank' rel='nofollow'"
    link
  end

  def google_time(time)
    time.in_time_zone("UTC").strftime("%Y%m%dT%H%M00Z")
  end

  def day_of_week_heading(day)
    initial = day.first
    day_short = day[1..2]
    day_long = day[3..-1]
    "<div class='day-of-week'><span class='day-initial'>#{initial}</span><span class='day-short'>#{day_short}</span><span class='day-end'>#{day_long}</span></div>".html_safe
  end

end
