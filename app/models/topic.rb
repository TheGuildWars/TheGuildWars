class Topic < ActiveRecord::Base
  attr_accessible :forum_id, :name, :post_body
  
  belongs_to :forum
  has_many :posts
  
  attr_accessor :post_body
end
