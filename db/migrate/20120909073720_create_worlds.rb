class CreateWorlds < ActiveRecord::Migration
  def change
    create_table :worlds do |t|
      t.string :name
      t.integer :region_id

      t.timestamps
    end
  end
end
