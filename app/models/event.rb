# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :text
#  starts_at       :datetime
#  ends_at         :datetime
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

  scope :for_date, ->(date){ where("DATE(starts_at) = ?", date)}
  scope :starts_after, ->(datetime){ where("starts_at >= ?", datetime) }

  def self.event_dates
    pluck("DATE(starts_at)").uniq.sort
  end

end
