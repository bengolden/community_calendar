# == Schema Information
#
# Table name: subscriptions
#
#  id         :integer          not null, primary key
#  email      :string
#  duration   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Subscription < ApplicationRecord

  enum duration: [:daily, :weekly]

end
