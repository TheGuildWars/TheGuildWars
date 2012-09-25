class AddPermissionsToForums < ActiveRecord::Migration
  def change
    add_column :forums, :readable_mask, :integer, default: 0
    add_column :forums, :topicable_mask, :integer, default: 0
    add_column :forums, :replyable_mask, :integer, default: 0
    add_column :forums, :moderable_mask, :integer, default: 0
  end
end
