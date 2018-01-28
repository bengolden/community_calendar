class AddEmailToSite < ActiveRecord::Migration[5.0]
  def change
    add_column :sites, :support_email, :string
  end
end
