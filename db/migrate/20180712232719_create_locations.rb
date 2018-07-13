class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.text :name
      t.float :longitude
      t.float :latitude
      t.text :api_id
      t.text :image

      t.timestamps
    end
  end
end
