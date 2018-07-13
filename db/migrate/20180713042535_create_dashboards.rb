class CreateDashboards < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboards do |t|
      t.text :name
      t.integer :user_id
      t.integer :location_id
      t.timestamps
    end
  end
end
