class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      t.string :name
      t.integer :parent_id
      t.string :description
      t.string :attached_to
      t.integer :attached_to_id

      t.timestamps
    end
  end
end
