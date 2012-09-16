class AddWorldToUser < ActiveRecord::Migration
  def change
    add_column :users, :world_id, :integer
  end
end
