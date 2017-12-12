class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :event_at
      t.string :venue_name
      t.string :venue_address
      t.string :venue_url
      t.string :sponsor_name
      t.string :sponsor_url
      t.string :contact_name
      t.string :contact_email
      t.string :tickets_price
      t.string :tickets_details
      t.string :tickets_url

      t.timestamps
    end
  end
end
