class AddRecurringToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :recurring, :boolean
    add_column :events, :recurring_duration, :string
  end
end
