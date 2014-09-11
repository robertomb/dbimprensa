class AddUserIdToJournalists < ActiveRecord::Migration
  def change
    add_column :journalists, :user_id, :integer
    add_index :journalists, :user_id
  end
end
