module EventsHelper
  def can_add_new_events?; true; end
  def show_sidebar?; true; end
  def show_calendar?; true; end

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
    count = @events.where("event_at BETWEEN ? AND ?", day.beginning_of_day, day.end_of_day).count
    return if count.zero?
    pluralize(count, "event")
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

end
