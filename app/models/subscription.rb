# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  email      :string
#  duration   :integer          default("daily")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ApplicationRecord

  enum duration: [:daily, :weekly]
  validates :email, presence: true

  def self.send_daily_emails
    self.where(duration: :daily).each do |subscription|
      subscription.send_daily_email
    end
  end

  def self.send_weekly_emails
    self.where(duration: :weekly).each do |subscription|
      subscription.send_weekly_email
    end
  end

  def send_daily_email
    SubscriptionMailer.daily_email(email).deliver_now!
  end

  def send_weekly_email
    SubscriptionMailer.weekly_email(email).deliver_now!
  end

end
