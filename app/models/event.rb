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
#  deleted         :boolean
#

class Event < ApplicationRecord

  scope :for_date, ->(date){ where("starts_at BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)}
  scope :starts_after, ->(datetime){ where("starts_at >= ?", datetime) }
  scope :not_deleted, ->{ where("deleted IS NULL OR deleted = ?", false)}

  def self.event_dates
    pluck(:starts_at).map(&:to_date).uniq
  end

end
