desc "This task is called by the Heroku scheduler add-on"

task :send_subscription_emails => :environment do
  Subscription.send_daily_emails
  Subscription.send_weekly_emails if Date.today.wday == 1
end
