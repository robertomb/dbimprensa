class AddVehicleIdToJournalists < ActiveRecord::Migration
  def change
    add_column :journalists, :vehicle_id, :integer
    add_index :journalists, :vehicle_id
  end
end
