class AddStatusToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :closed, :boolean, default: false
    add_column :topics, :sticky, :boolean, default: false
  end
end
