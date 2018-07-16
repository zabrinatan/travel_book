class CreateDashboardsLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :dashboards_locations do |t|
      t.integer :dashboard_id
      t.integer :location_id
    end
  end
end
