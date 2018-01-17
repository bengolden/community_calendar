# == Schema Information
#
# Table name: events
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :text
#  starts_at          :datetime
#  ends_at            :datetime
#  venue_name         :string
#  venue_address      :string
#  venue_url          :string
#  sponsor_name       :string
#  sponsor_url        :string
#  contact_name       :string
#  contact_email      :string
#  tickets_price      :string
#  tickets_details    :string
#  tickets_url        :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  deleted            :boolean
#  recurring          :boolean
#  recurring_duration :string
#

class Event < ApplicationRecord

  scope :for_date, ->(date){ where("starts_at BETWEEN ? AND ?", date.beginning_of_day, date.end_of_day)}
  scope :starts_after, ->(datetime){ where("starts_at >= ?", datetime) }
  scope :not_deleted, ->{ where("deleted IS NULL OR deleted = ?", false)}

  after_create :create_future_recurring_events!, if: :recurring?

  def self.event_dates
    pluck(:starts_at).map(&:to_date).uniq
  end

  private

  def create_future_recurring_events!
    (1..20).each do |index|
      if recurring_duration == "week"
        new_start_time = starts_at + index.weeks
        new_end_time = ends_at + index.weeks
      elsif recurring_duration == "month"
        new_start_time = starts_at + index.months
        new_end_time = ends_at + index.months
      end
      break if new_start_time.beginning_of_month >= Time.now.beginning_of_month + 3.months

      attrs = attributes.except("recurring", "recurring_duration", "starts_at", "ends_at", "id")
      attrs.merge!({starts_at: new_start_time, ends_at: new_end_time})
      Event.create(attrs)
    end
  end

end
