class Post < ActiveRecord::Base
  attr_accessible :body, :topic_id, :user_id, :forum_id
  
  belongs_to :topic
  belongs_to :user
  belongs_to :forum
end
