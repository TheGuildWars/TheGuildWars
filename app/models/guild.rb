class Guild < ActiveRecord::Base
  attr_accessible :leader_id, :name, :tag, :world_id
  
  belongs_to :world
  belongs_to :user, class_name: :leader
end
