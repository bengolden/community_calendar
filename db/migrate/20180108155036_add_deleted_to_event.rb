class AddDeletedToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :deleted, :boolean
  end
end
