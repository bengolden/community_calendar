class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.string :name
    end

    Site.create(name: 'Chippewa Valley Progressive Network Calendar')
  end
end
