desc "These task is called by the Heroku scheduler add-on"

task :send_subscription_emails => :environment do
  Subscription.send_daily_emails
  Subscription.send_weekly_emails if Date.today.wday == 1
end

desc "Don't let the app sleep"

task :crybaby_cry => :environment do
  logger.info "crybaby cry"
end
