class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :name
      t.string :tag
      t.integer :leader_id
      t.integer :world_id

      t.timestamps
    end
  end
end
