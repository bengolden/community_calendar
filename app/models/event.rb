# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  event_at        :datetime
#  venue_name      :string
#  venue_address   :string
#  venue_url       :string
#  sponsor_name    :string
#  sponsor_url     :string
#  contact_name    :string
#  contact_email   :string
#  tickets_price   :string
#  tickets_details :string
#  tickets_url     :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Event < ApplicationRecord

  scope :for_date, ->(date){ where("DATE(event_at) = ?", date)}
  scope :starts_after, ->(datetime){ where("event_at >= ?", datetime) }

  after_initialize -> { self.event_at ||= 1.day.from_now.beginning_of_day + 19.hours }

  def self.event_dates
    pluck("DATE(event_at)").uniq.sort
  end

end
