module SubscriptionsHelper

  def reminders_button_text
    current_subscription.persisted? ? "Modify My Reminder Emails" : "Sign Up For Reminder Emails"
  end
end