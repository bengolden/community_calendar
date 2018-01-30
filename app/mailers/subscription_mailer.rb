class SubscriptionMailer < ApplicationMailer

  layout 'mailer'

  def daily_email(recipient)
    @events = Event.not_deleted.for_date(Date.today)
    return if @events.empty?
    mail to: recipient
  end

  def weekly_email(recipient)
    @events = Event.not_deleted.for_week(Date.today)
    return if @events.empty?
    mail to: recipient
  end

end
