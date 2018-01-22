class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.string :email
      t.integer :duration, default: 0

      t.timestamps
    end
  end
end
