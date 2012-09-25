class Forum < ActiveRecord::Base
  attr_accessible :attached_to, :attached_to_id, :description, :name, :parent_id
  
  has_many :topics
  has_many :posts
  
  Permissions = ["Readable", "Topicable", "Replyable", "Moderable"]
  
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
  
  def readable
    User::Roles.reject { |r| ((readable_mask || 0) & 2**User::Roles.index(r)).zero? }
  end
  
  def topicable
    User::Roles.reject { |r| ((topicable_mask || 0) & 2**User::Roles.index(r)).zero? }
  end
  
  def replyable
    User::Roles.reject { |r| ((replyable_mask || 0) & 2**User::Roles.index(r)).zero? }
  end
  
  def moderable
    User::Roles.reject { |r| ((moderable_mask || 0) & 2**User::Roles.index(r)).zero? }
  end
  
  def apply_bitmask(a)
    (a & User::Roles).map { |r| 2**User::Roles.index(r) }.sum
  end
end
