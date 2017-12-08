class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.string :organization_name
      t.text :description
      t.datetime :event_at
      t.string :venue_name
      t.string :venue_address
      t.text :contact_information

      t.timestamps
    end
  end
end
