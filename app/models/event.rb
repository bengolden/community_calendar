# == Schema Information
#
# Table name: events
#
#  id                  :integer          not null, primary key
#  name                :string
#  organization_name   :string
#  description         :text
#  event_at            :datetime
#  venue_name          :string
#  venue_address       :string
#  contact_information :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Event < ApplicationRecord

  scope :for_date, ->(date){ where("DATE(event_at) = ?", date)}
  scope :starts_after, ->(datetime){ where(event_at >= ?, datetime)}

  def self.event_dates
    pluck("DATE(event_at)").uniq.sort
  end

end
