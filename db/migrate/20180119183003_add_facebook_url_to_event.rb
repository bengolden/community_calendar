class AddFacebookUrlToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :facebook_url, :string
  end
end
