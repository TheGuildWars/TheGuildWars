class Forum < ActiveRecord::Base
  attr_accessible :attached_to, :attached_to_id, :description, :name, :parent_id
  
  has_many :topics
  has_many :posts
  
  def self.for_parent_select
    out = [[0, "Root"]]
    Forum.top_level.each do |forum|
      out.push([forum.id, forum.name])
    end
    return out
  end
  
  def self.top_level
    where(parent_id: 0)
  end
  
  def children
    Forum.where(parent_id: self.id)
  end
  
  def last_post
    @last_post ||= posts.last
  end
end
