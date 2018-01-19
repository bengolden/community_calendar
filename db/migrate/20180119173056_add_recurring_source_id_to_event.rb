class AddRecurringSourceIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :recurring_source_id, :integer
  end
end
